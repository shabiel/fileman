DIAXG ;SFISC/DCM-UPDATE DESTINATION FILE ;6/11/93  11:32 PM
 ;;21.0;VA FileMan;;Dec 28, 1994
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
EN I $G(DIAXNTC)'=DIARP D EN^DIAXM G EOJ:$D(DIAXMSG) S DIAXNTC=DIARP
 ;
EN1 K ^TMP("DIAX",$J),DIAXDA
 D INIT^DIAXGI,BODY,EOJ
 Q
 ;
BODY D BASE Q:$D(DIAXMSG)
 D NEXTLVL
 Q
 ;
BASE D ^DIAXGU Q:$D(DIAXMSG)
 D FIELDS
 D ^DIAXU1 Q:$D(DIAXMSG)
 S DIAXDA=^TMP("DIAX",$J,DIAXET(DILL,"FILE"),"DA")
 Q
 ;
NEXTLVL S DIAX(DILL,"DIAXI")=DIAXI,DILL=DILL+1
 F DIAXI=DIAXI:0 S DIAXI=$O(^DIPT(DIARP,1,DIAXI)) Q:DIAXI'=+DIAXI  S X=^(DIAXI,0) D NEXTLVL2 Q:DIAXI=""!$D(DIAXMSG)
 S DILL=DILL-1,DIAXI=DIAX(DILL,"DIAXI")
 Q
 ;
NEXTLVL2 I $P(X,U,2)<DILL S DIAXI="" Q
 Q:$P(X,U,3)'=DIAX(DILL-1,"FILE")
 D FVARS^DIAXGI
 I DIAX(DILL,"XREF")?1A.E D DIAXG3^DIAXG2 Q
 I DIAX(DILL,"XREF")=3 D ^DIAXG2 Q
 Q:'DIAX(DILL,"FE")
 D ^DIAXGU Q:$D(DIAXMSG)
 D FIELDS
 D ^DIAXU1 Q:$D(DIAXMSG)
 D RECURSE
 Q
 ;
RECURSE D NEXTLVL
 Q
 ;
FIELDS D ^DIAXG1
 Q
 ;
EOJ K DIAXI,DILL,DIAXFI,DIAX,X,DIAXET,^TMP("DIAX",$J)
 K:'$D(DIAXMSG) DIAXFE
 Q