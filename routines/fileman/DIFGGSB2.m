DIFGGSB2 ;SFISC/DG,EDE(OHPRD)- ;6/19/92  9:28 AM
 ;;22.2;MSC Fileman;;Jan 05, 2015;
 ;;Submitted to OSEHRA 5 January 2015 by the VISTA Expertise Network.
 ;;Based on Medsphere Systems Corporation's MSC Fileman 1051.
 ;;Licensed under the terms of the Apache License, Version 2.0.
 ;
SPSPEC ; UNIQUE SPECIFIER
 F DIFGSB(DILL,"SPSPEC")=0:0 S DIFGSB(DILL,"SPSPEC")=$O(^DD(DIFG(DILL,"FILE"),0,"SP",DIFGSB(DILL,"SPSPEC"))) Q:'DIFGSB(DILL,"SPSPEC")  I +^(DIFGSB(DILL,"SPSPEC")) Q:$P(^(DIFGSB(DILL,"SPSPEC")),U,2)'=""
 Q:'DIFGSB(DILL,"SPSPEC")
 I $P(^DD(DIFG(DILL,"FILE"),DIFGSB(DILL,"SPSPEC"),0),U,2)["P" S DIFGSB(DILL,"SPSPEC")=0 Q
 S $P(DIFGSB(DILL,"SPSPEC"),U,2)=$P(^DD(DIFG(DILL,"FILE"),0,"SP",DIFGSB(DILL,"SPSPEC")),U,2)
 S DIFGSB(DILL,"FLD")=+DIFGSB(DILL,"SPSPEC")
 I '$D(DIFG(DILL,"MUL")) S DR=+DIFGSB(DILL,"SPSPEC")
 E  S DR(DIFG(DILL,"FILE"))=+DIFGSB(DILL,"SPSPEC")
 S DIFGSB(DILL,"SBT")="KEY:"
 D FIELDS^DIFGGSB1
 Q
 ;
PTRCHK ; CHECK FOR POINTER FIELD
 Q:$P(^DD(DIFG(DILL,"FILE"),DIFGSB(DILL,"FLD"),0),U,2)'["P"
 S DITAB=DITAB+2
 S DILL=DILL+1
 D POINTER
 S DITAB=DITAB-2
 K DIFG(DILL)
 S DILL=DILL-1
 Q
 ;
POINTER ; POINTER FIELDS
 S DIFG(DILL,"FILE")=+$P($P(^DD(DIFG(DILL-1,"FILE"),DIFGSB(DILL-1,"FLD"),0),U,2),"P",2),X=$P(^(0),U,4) S:$P(X,";")'=+X X=""""_$P(X,";")_""";"_$P(X,";",2)
 I $D(DIFGGU(DIFG(DILL-1,"FILE"),DIFG(DILL-1,"FE"),DIFGSB(DILL-1,"FLD"),"P")) S DIFG(DILL,"FE")=DIFGGU(DIFG(DILL-1,"FILE"),DIFG(DILL-1,"FE"),DIFGSB(DILL-1,"FLD"),"P")
 E  S DIFG(DILL,"FE")=$P(@(DIFG(DILL-1,"FGBL")_DIFG(DILL-1,"FE")_","_$P(X,";",1)_")"),U,$P(X,";",2))
 I '$D(^DIC(DIFG(DILL,"FILE"),0)) D KILLLL^DIFGGU Q
 S DIFG(DILL,"FGBL")=^DIC(DIFG(DILL,"FILE"),0,"GL"),DIFG(DILL,"FNAME")=$P(^DIC(DIFG(DILL,"FILE"),0),U,1)
 I '$D(@(DIFG(DILL,"FGBL")_DIFG(DILL,"FE")_",0)")) D KILLLL^DIFGGU Q
 I $D(Y),Y'="" S Z=Y,Y=""
 I $D(DIFGENV("LAYGO",DIFG(DILL-1,"FILE"),DIFGSB(DILL-1,"FLD")))!($P(^DD(DIFG(DILL-1,"FILE"),DIFGSB(DILL-1,"FLD"),0),U,2)'["'") S DIFG(DILL,"NOKEY")=""
 D START^DIFGGSB ; RECURSE
 Q
