DICATTDK ;SFISC/GFT-DELETE FIELD ;25MAY2007
 ;;22.2;VA FileMan;;Jan 05, 2016;Build 42
 ;;Per VA Directive 6402, this routine should not be modified.
 ;;Submitted to OSEHRA 5 January 2015 by the VISTA Expertise Network.
 ;;Based on Medsphere Systems Corporation's MSC FileMan 1051.
 ;;Licensed under the terms of the Apache License, Version 2.0.
 ;
 ;FROM ^DICATTDE
KILL N M,DI,DA,DQ,DICL,D0,DIU,DQI,S,Q,O,X,DICATT4M
 I $D(DDA) S DDA="D" ;'DELETE' flag for Auditing
 S S=";",Q=""""
MAYBGONE S (A,DA(1))=DICATTA,(D0,DA)=DICATTF I '$D(^DD(A,DA)) Q
 D IJ^DIUTL(A) S DICL=$O(J(""),-1),DQ=""
 F  S DQ=$O(^DD(0,.01,"DEL",DQ)) Q:DQ=""  I $D(^(DQ,0)) X ^(0) I  S DDSERROR=1,DDSBR=1 H 3 G Q  ;Delete checks
 S O=^DD(A,D0,0),M=$P(O,U),X=0
 F  S X=$O(^DD(A,DA,1,X)) Q:'X  I +^(X,0)=DICATTB,$P(^(0),DICATTB,2)?1"^"1.A S DQI=$P(^(0),U,2) ;HMMMMM  remember that this field cross-referenced top level
MUL I $G(DICATT2) D  ;Delete a multiple field
 .K ^DD(A,"GL",$P($P(O,U,4),";")) ;SO EN+4^DICATT4 KNOWS TO DELETE THE ENTRIES CORRECTLY
 .S DQ(+DICATT2)=0
NEW .S DICATT4M(0)=$NA(^DD(A,D0)) ;from NEW^DICATTD4
 .S DICATT4M("SB")=$NA(^DD(A,"SB",+$P(O,U,2),D0))
 .S ^DD(A,D0,0)=O,^DD(A,"SB",+$P(O,U,2),D0)=""
 .D ^DICATT4
 .K @DICATT4M(0),@DICATT4M("SB")
 .D KDD^DICATT4 ;Kill the DD globals below
ENTRIES E  I $P(O,U,2)'["C"," "'[$P(O,U,4) S DICATT4M=1 D ^DICATT4
 D DELFLD(DICATTA,DICATTF)
 D N^DICATTDE
Q Q
 ;
DELFLD(DICATTA,DA) ;ALSO FROM ^DICATTD
 W $C(7),!,"FIELD DELETED!" S:$D(DDA) DDA=$E("D",DDA="")
 N A,D0,DIC,DIK,O,M S (DIC,DIK)="^DD(DICATTA,",DA(1)=DICATTA,DA=DICATTF
AUD S:$D(DDA) ^UTILITY("DDA",$J,DICATTA,DA,0)=$G(^DD(DICATTA,DA,0))
 D ^DIK
 Q
 ;
 ;
 ;
 ;
POST9 ;POST-ACTION OF FIELD 99, 'ARE YOU SURE YOU WANT TO DELETE THE ENTIRE FIELD?'
 I 'X D  Q  ;IF THEY DON'T ANSWER "YES", REPAINT FIELD LABEL AND QUIT
 .S X=$P(^DD(DICATTA,DICATTF,0),U)
 .I $G(DICATT2) D PUT^DDSVALF(1,"DICATT MUL",10,X) Q
 .D PUT^DDSVALF(1,"DICATT",1,X)
 S DICATTDK=1,DDACT="EX" ;FORCE EXIT FROM SCREENMAN
 D REQ^DDSUTL(20,"DICATT",1,0)
NOREQ ;(not sure anyone uses this entry point yet)
 D REQ^DDSUTL(67,"DICATT SCREEN",6,0)
 D REQ^DDSUTL(31,"DICATT2",2.2,0)
 D REQ^DDSUTL(32,"DICATT2",2.2,0)
 D REQ^DDSUTL(68,"DICATT4",2.4,0)
 D REQ^DDSUTL(69,"DICATT4",2.4,0)
 D REQ^DDSUTL(78,"DICATT6",2.6,0)
 Q
 ;
