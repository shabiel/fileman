DIC4 ;SFISC/TKW-VA FileMan Lookup utilities ;5:59 AM  20 Sep 2002
 ;;22.0;VA FileMan;**4,20,70**;Mar 30, 1999
 ;Per VHA Directive 10-93-142, this routine should not be modified.
EXACT ; Find next exact match on a compound index
 N DIFLAGS,DIFIELDS,DIWRITE,DIIENS,DIFORCE,DIERR,DISCR,DIQUIET,DIIX
 S DIFLAGS="lX" D GETPAR N DINDEX
 D FIND^DICF(.DIFILEI,DIIENS,DIFIELDS,DIFLAGS,.DIVAL,"*",.DIFORCE,.DISCR,$G(DIC("W")),"DS","DIERR",.DIIX,.DIC,.DIY,.DIYX)
 D:$G(DIERR) PROCERR Q
 ;
PARTIAL ; Find next partial match on a compound index
 N DIFLAGS,DIFIELDS,DIWRITE,DIIENS,DIFORCE,DIERR,DISCR,DIQUIET,DIIX
 S DIFLAGS="l" D GETPAR K DIIX("DONE") N DINDEX
 I DIFLAGS'["Q",$G(DS("INT"))]"","VP"[DIIX(1,"TYPE") N I M I=DIVAL N DIVAL D
 . S (I,I(1),DIIX(1),DIIX(1,"FROM"),DIIX(1,"PART"))=DS("INT")
 . S DIIX(1,"TYPE")="F" M DIVAL=I K I Q
 D FIND^DICF(.DIFILEI,DIIENS,DIFIELDS,DIFLAGS,.DIVAL,"*",.DIFORCE,.DISCR,$G(DIC("W")),"DS","DIERR",.DIIX,.DIC,.DIY,.DIYX)
 D:$G(DIERR) PROCERR Q
 ;
SET I $P(DS(0),U,2) D SETY Q
 S Y=-1 Q:'DS(0)  D SETOUT Q
 ;
SETOUT ; Set variables if user up-arrowed or timed out.
 S Y=-1 N I S I=$P(DS(0),U,2)
 I I="U",DIC(0)'["A" S DUOUT=1
 S:I="T" DTOUT=1 Q
 ;
SETY ; If entry was selected by user, set output variables.
 S Y=DS(0,"Y")
 S:$D(DDS) DST=DS(0,"DST")
 S (X,X(1))=DS(0,"X"),DIYX=DS(0,"DIYX"),DIY=DS(0,"DIY")
 N % S:$G(DIX)]"" %=DIX M DIX=DS(0,1) K DS(0),DIX("F") S:$D(%) DIX=%
 D GOT^DIC2 I Y<0 S DS(0)="1^" Q
 S DS(0)="1^"_+Y Q
 ;
GETPAR ; Set parameters for Finder call
 D:DIFLAGS'["Q"
 . N I S I=0 I $A(X)=34,X?.E1"""" S I=1
 . I I!(DIC(0)["U")!(DIC(0)["M")!($G(DICR)) S DIFLAGS=DIFLAGS_"Q"
 . Q
 S DIIENS=$S(DIC(0)["p":",",1:DIENS)
 I DIC(0)'["E" S DIQUIET=1
 S (DIFORCE,DIFORCE(1))=1,DIFORCE(0)=DINDEX
 I $D(DIC("PTRIX")) M DIFORCE("PTRIX")=DIC("PTRIX")
 D:$G(DIC("S"))]""
 . M DISCR("S")=DIC("S")
 . S I="S" F  S I=$O(DIC(I)) Q:$E(I)'="S"  S DISCR(I)=DIC(I)
 . Q
 I $D(DIC("V"))]"" M DISCR("V")=DIC("V")
 S DIFIELDS="@" M DIIX=DINDEX Q
 ;
ADDIX(DIFILEI,Y,DINDEX,DIX,DISCREEN) ; Put index values into DIX variable for display
 N DISUB,DIVAL,DI0NODE,DIFILE S DI0NODE=$G(@DIFILEI(DIFILEI)@(Y,0)),DIX(1)="" M DIFILE=DIFILEI
 I $G(DINDEX("OLDSUB")) N DIO,DIN S DIN=0 F DIO=1:1:DINDEX("OLDSUB") D
 . S DIVAL=""
 . I $G(DISCREEN("X",DIO,"GET"))]"" D
 . . X DISCREEN("X",DIO,"GET") Q
 . E  S DIN=$O(DINDEX(DIN)) I DIN,DIN'>DINDEX("#") S DISUB=DIN D GETVAL
 . S:DIVAL]"" DIX(DIO)=DIVAL Q
 Q:$G(DINDEX("OLDSUB"))
 F DISUB=1:1:DINDEX("#") D GETVAL S:DIVAL]"" DIX(DISUB)=DIVAL
 Q
GETVAL ; Return index value in DIVAL
 I $G(DINDEX(DISUB,"TRANOUT"))]"" D  Q
 . S DIVAL=DINDEX(DISUB) Q:DIVAL=""  N X S X=DIVAL
 . X DINDEX(DISUB,"TRANOUT") S:X]"" DIVAL=X Q
 S @DINDEX(DISUB,"GET") Q:DIVAL=""
 I "VPSD"[DINDEX(DISUB,"TYPE")!(DISUB=1&($G(DS("INT"))]"")) D
 . I DISUB>1,"VP"[DINDEX(DISUB,"TYPE") Q
 . S DIVAL=$$EXT^DIC2(DINDEX(DISUB,"FILE"),DINDEX(DISUB,"FIELD"),DIVAL) Q
 Q
 ;
IXCHK(DIFILEI,DINDEX,DIOK,DIALLVAL,DIVAL,DID) ; Build INDEX info, make sure indexed field not a pointer.
 S DIOK=0 N DIVALX S DIVALX=$G(DIVAL(1))
 N DIXIEN S DIXIEN=+$O(^DD("IX","BB",DIFILEI,DINDEX,""))
 I DIXIEN,$G(DID)="",$P($G(^DD("IX",DIXIEN,0)),U,14)'["L" Q
 I 'DIXIEN!('$O(^DD("IX",DIXIEN,11.1,"AC",1))) D  Q
 . N DIFLAGS S DIFLAGS="hql" S:$G(DILONGX)!(DIC(0)["T") DIFLAGS="4l"
 . I +$P(DIVALX,"E")=DIVALX,DIC(0)["E" S DIFLAGS="4l"
 . D INDEX^DICUIX(.DIFILEI,DIFLAGS,.DINDEX)
 . I +$P(DIVALX,"E")=DIVALX,$G(DINDEX(1,"TYPE"))="P" D  Q  ;22*70
 . . I DIC(0)["T",DIC(0)["E" S (DIOK,DIOK("T"))=1 ;22*70
 . S DIOK=1 Q
 D INDEX^DICUIX(.DIFILEI,"4l",.DINDEX,"",.DIVAL)
 S (DIALLVAL,DIOK)=1
 N I F I=1:1:DINDEX("#") S:$G(DINDEX(I,"PART"))="" DIALLVAL=0
 Q
 ;
PROCERR ; Display errors generated from call to Finder.
 I DIC(0)'["E" K DIERR Q
 W $C(7) W:'$D(DDS) !
 N A1,DDH,I,J S DDH=0
 F I=1:1:+DIERR F J=0:0 S J=$O(DIERR("DIERR",I,"TEXT",J)) Q:'J  D
 . I '$D(DDS) W DIERR("DIERR",I,"TEXT",J),! Q
 . S DDH=DDH+1,DDH(DDH)=DIERR("DIERR",I,"TEXT",J) Q
 K DIERR I '$D(DDS) W !! Q
 S A1="T" D LIST^DDSU Q
 ;
