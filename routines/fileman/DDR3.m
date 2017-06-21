DDR3 ;ALB/MJK,SF/DCM-FileMan Delphi Components' RPCs ;2013-03-22  1:47 PM
 ;;22.2;VA FileMan;;Jan 05, 2016;Build 42
 ;;Per VA Directive 6402, this routine should not be modified.
 ;;Submitted to OSEHRA 5 January 2015 by the VISTA Expertise Network.
 ;;Based on Medsphere Systems Corporation's MSC FileMan 1051.
 ;;Licensed under the terms of the Apache License, Version 2.0.
 ;
 Q
 ;
FILEC(DDRDATA,DDRMODE,DDRROOT,DDRFLAGS,DDRIENS) ;  DDR FILER rpc callback
 N DDRRTN,DDRFDA,DDRERR,N,I
 D FDASET(.DDRROOT,.DDRFDA)
 ; -- set up placeholder DINUM's if any
 ; -- NOTE:  Can't use until multiple arrays can be passed by broker
 I $D(DDRROOT("IENs")) M DDRIENS=DDRROOT("IENs")
 SET DDRFLAGS=$SELECT($DATA(DDRFLAGS):DDRFLAGS,1:"")
 SET I="" FOR  SET I=$ORDER(DDRIENS(I)) QUIT:I=""  SET DDRRTN(+I)=+DDRIENS(I)
 IF DDRMODE="ADD" DO
 . DO UPDATE^DIE(DDRFLAGS,"DDRFDA","DDRRTN","DDRERR")
 ELSE  DO
 . DO FILE^DIE(DDRFLAGS,"DDRFDA","DDRERR")
 S N=0
 D SET("[Data]")
 ; -- send back info on entry #'s for placeholders
 S I=0 F  S I=$O(DDRRTN(I)) Q:'I  D SET("+"_I_","_U_DDRRTN(I))
 IF $D(DDRERR) D ERROR
 Q
 ;
FDASET(DDRROOT,DDRFDA) ;
 N DDRFILE,DDRIEN,DDRFIELD,DDRVAL,DDRERR,I
 S I=0
 F  S I=$O(DDRROOT(I)) Q:'I  S X=DDRROOT(I) D
 . S DDRFILE=$P(X,U)
 . S DDRFIELD=$P(X,U,2)
 . S DDRIEN=$P(X,U,3)
 . S DDRVAL=$P(X,U,4,99)
 . D FDA^DILF(DDRFILE,DDRIEN_$S($E(DDRIEN,$L(DDRIEN))'=",":",",1:""),DDRFIELD,"",DDRVAL,"DDRFDA","DDRERR")
 Q
 ;
VALC(DDRDATA,DDR) ; DDR VALIDATOR rpc callback
 N DDRFILE,DDRIENS,DDRFIELD,DDRVAL,DDRRSLT,DDRERR,DDRFLAGS,N
 S DDRFLAGS="EH"
 S DDRFILE=$G(DDR("FILE"))
 S DDRIENS=$G(DDR("IENS"))
 S DDRFIELD=$G(DDR("FIELD"))
 S DDRVAL=$G(DDR("VALUE"))
 D VAL^DIE(DDRFILE,DDRIENS,DDRFIELD,DDRFLAGS,DDRVAL,.DDRRSLT,"","DDRERR")
 S N=0
 D SET("[FILLER]")
 D SET("[Data]")
 D SET($G(DDRRSLT,U))
 D SET($G(DDRRSLT(0)))
 IF $D(DDRERR) D ERROR,HELP
 Q
SET(X) ;
 S N=N+1
 S DDRDATA(N)=X
 Q
HELP ;
 Q:'$D(DDRERR("DIHELP"))
 D SET("[BEGIN_diHELP]")
 S HD=DDRFILE_U_DDRFIELD_U_"?"_U_DDRERR("DIHELP") D SET(HD)
 N A S A=0 F  S A=$O(DDRERR("DIHELP",A)) Q:'A  D SET(DDRERR("DIHELP",A))
 D SET("[END_diHELP]")
 Q
ERROR ;
 D SET("[BEGIN_diERRORS]")
 N A S A=0 F  S A=$O(DDRERR("DIERR",A)) Q:'A  D
 . N HD,PARAM,B,C,TEXT,TXTCNT,D,FILE,FIELD,IENS
 . S HD=DDRERR("DIERR",A)
 . I $D(DDRERR("DIERR",A,"PARAM",0)) D
 . . S (B,D)=0 F C=1:1 S B=$O(DDRERR("DIERR",A,"PARAM",B)) Q:B=""  D
 . . . I B="FILE" S FILE=DDRERR("DIERR",A,"PARAM","FILE")
 . . . I B="FIELD" S FIELD=DDRERR("DIERR",A,"PARAM","FIELD")
 . . . I B="IENS" S IENS=DDRERR("DIERR",A,"PARAM","IENS")
 . . . S D=D+1,PARAM(D)=B_U_DDRERR("DIERR",A,"PARAM",B)
 . S C=0 F  S C=$O(DDRERR("DIERR",A,"TEXT",C)) Q:'C  S TEXT(C)=DDRERR("DIERR",A,"TEXT",C),TXTCNT=C
 . S HD=HD_U_TXTCNT_U_$G(FILE)_U_$G(IENS)_U_$G(FIELD)_U_$G(D) D SET(HD)
 . S B=0 F  S B=$O(PARAM(B)) Q:'B  S %=PARAM(B) D SET(%)
 . S B=0 F  S B=$O(TEXT(B)) Q:'B  S %=TEXT(B) D SET(%)
 . Q
 D SET("[END_diERRORS]")
 Q
 ;
