DIFG ;SFISC/DG(OHPRD)-FILEGRAM INSTALLER ;10/9/95  05:50
 ;;22.2;MSC Fileman;;Jan 05, 2015;
 ;;Submitted to OSEHRA 5 January 2015 by the VISTA Expertise Network.
 ;;Based on Medsphere Systems Corporation's MSC Fileman 1051.
 ;;Licensed under the terms of the Apache License, Version 2.0.
 ;
 I $D(DIFGREI) S DIFGLO="^DIAR(1.13,"_DIFGREI_",21," K DIFGLC
 I '$D(DIFGLO) S DIFGER="1^0" Q
 I $E(DIFGLO,$L(DIFGLO))=","!($E(DIFGLO,$L(DIFGLO))="(")
 E  S DIFGER="1.25^0" K DIFGLO,DIFGREI Q
 S DIFGCHKG=$S($E(DIFGLO,$L(DIFGLO))=",":$E(DIFGLO,1,$L(DIFGLO)-1)_")",1:$P(DIFGLO,"("))
 I '$D(@(DIFGCHKG)) S DIFGER="1.5^0" K DIFGCHKG,DIFGLO,DIFGREI Q
 D INIT,START,KILLVAR,EOJ^DIFG5
 Q
 ;
INIT S U="^"
 K ^UTILITY("DIFG",$J),^UTILITY("DIFGFG",$J),^UTILITY("DIFGX",$J),^UTILITY("DIFG@",$J)
 D DT^DICRW
 S DIFGEXC="F DIFGL=1:1 Q:$E(DIFGDIX,DIFGL)'="" """
 S DIFGLINE="S DIFGY=$O("_DIFGLO_"DIFGY)) Q:DIFGY'>0  S DIFGDIX=^(DIFGY,0) X DIFGEXC S DIFGDIX=$E(DIFGDIX,DIFGL,255)"
 Q
 ;
START S (DIFG,DIFGER,DIFGMULT,DIFGEND,DIFGO,DIFGCT,DIFGADD,DIFGTYPE,DIFGINCR,DIFGNDC)=0,DIFGY=$S('$D(DIFGLC):.9999,1:DIFGLC-.0001),DIFGNODL=1 D FILEGRAM,KILLVAR
 D:'DIFGER ^DIFG6
 Q
 ;
FILEGRAM X DIFGLINE
 I $P(DIFGDIX,"^")'="$DAT" S DIFGER=2_U_DIFGY D ERROR G X1
 S DIFG("PARAM")=$P(DIFGDIX,U,4)
 X DIFGLINE
A I $P(DIFGDIX,":")="ENVIRONMENT" S @($P($P(DIFGDIX,":",2),"=")_"="_$P(DIFGDIX,"=",2)) X DIFGLINE G A
 D BASEFILE^DIFG0B G:DIFGER X1
 D FILE
X1 Q
 ;
FILE F DIFGL=0:0 X DIFGLINE D EVAL I DIFGTYPE="TERM"!DIFGER S DIFGTYPE="" Q
 Q
 ;
EVAL D GETTYPE
 I DIFGER G X3
 I DIFGTYPE="TERM" G X3
 I DIFGTYPE="MV FIELD" D ^DIFG2 G X3
 I DIFGTYPE="SV FIELD" D ^DIFG1 G X3
 I DIFGTYPE="WP FIELD" D ^DIFG1 G X3
 I DIFGTYPE="SWITCH" D SWITCH^DIFG0A G X3
 I DIFGTYPE="SKIP" ;computed field, do not process
X3 Q
 ;
GETTYPE I DIFGDIX="^"!(DIFGDIX=":")!(DIFGDIX="$END DAT") S DIFGTYPE="TERM" G X4
 I $P(DIFGDIX,U)="$DAT"!($P(DIFGDIX,":")="$DAT") S DIFGER=3_U_DIFGY,DIFGEND=1,DIFGTYPE="TERM" D ERROR G X4
 I $P(DIFGDIX,U,2)[":" S DIFGSTRT=$F(DIFGDIX,"^"),DIFGFIND=$E(DIFGDIX,DIFGSTRT,245) I $E(DIFGFIND,$F(DIFGFIND,":"))="^" S DIFGTYPE="SWITCH" G X4
 D EVALFLD
X4 Q
 ;
EVALFLD I DIFG("PARAM")["N" S DIFGNUM=+$P(DIFGDIX,U,2)
 E  S DIFGNUM=$O(^DD(DIC,"B",$P(DIFGDIX,U),""))
 I '$D(^DD(DIC,DIFGNUM)) S DIFGER=4_U_DIFGY D ERROR G X5
 I $P(^DD(DIC,DIFGNUM,0),U,2)["C" S DIFGTYPE="SKIP" G X5
 I +$P(^DD(DIC,DIFGNUM,0),U,2) S DIFGMLND=^DD(DIC,DIFGNUM,0),DIFGFLDN=DIFGNUM,DIFGNUM=+$P(DIFGMLND,U,2) S DIFGTYPE=$S($P(^DD(DIFGNUM,.01,0),U,2)'["W":"MV FIELD",1:"WP FIELD")
 E  S DIFGTYPE="SV FIELD"
X5 Q
 ;
ERROR NEW DA,DIC,DIE,X,Y,DO
 S X=$P(DIFGER,U,2),DIC("DR")=".02////"_$P(DIFGER,U),DIC="^DIAR(1.13,",DIC(0)="FL" D FILE^DICN S DIFGLOG=$S(Y>0:+Y,1:-1) G:DIFGLOG=-1 X6
 S B=0 F A=$S($D(DIFGLC):DIFGLC-.0001,1:0):0 S A=$O(@(DIFGLO_"A)")) Q:'A  S B=B+1,^DIAR(1.13,+Y,21,B,0)=$S('$D(^UTILITY("DIFGFG",$J,A)):@(DIFGLO_"A,0)"),1:^UTILITY("DIFGFG",$J,A)) S:A=$P(DIFGER,U,2) $P(DIFGER,U,2)=B Q:^(0)["$END DAT"
 S ^DIAR(1.13,+Y,21,0)="^^"_B_"^"_B_"^"_DT
 S DIE="^DIAR(1.13,",DA=DIFGLOG,DR=".01///"_$P(DIFGER,U,2) D ^DIE K DIE,DA,DR
 S DIFGEROR=""
X6 K A,B Q
 ;
KILLVAR K DIFGFILE,DIFGSAVE,DA,DIC,DIFGTYPE,DIFGM,DIFGNDC,DIFGNODL,DIFGADD,DIFGMO,DIFGLAGO,DIFGSKIP,DIFGDI,DIFGDICS,DIFGADD,DIFGINCR,DIFGNODL,DIFGTYPE,DIFG("SAVE")
 K DIFGDA,DIFGDIC,DIFGFIND,DIFGFIRP,DIFGFLDN,DIFGHAT,DIFGNODE,DIFGNUM,DIFGSECP,DIFGSTRT,DIFGSVN,DIFGSVVL,DIFGMGBL
 Q
