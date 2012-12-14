DIFG2	;SFISC/DG(OHPRD)-PROCESSING OF MULTIPLES FROM FILEGRAM ; [ 02/02/93  4:21 PM ]
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
START	;CALLED BY DIFG
	S DIFG=DIFG+1
	I DIFGMULT=0 S DIFGNDC=0,DIFGM(0)=DIC ;ENTERING HIGHEST LEVEL MULTIPLE
	N DIC
	D MULT
	I DIFGER G X1
	I '$D(DIFG("NOLKUP")) D ^DIFG3 I 1
	E  D NOLOOK
	I DIFGER G X1
	D SET
	K DIFGALNK,DIFGMLND,DIFGPC,DIFGFLD,DIFGVAL,DIFGDOL,DIFGNUMF,DIFGNOLK,DIFGLAGO,Y,DIFG("NOLKUP"),DIFG("ACGRV"),DIFGDIC(DIFGDIC)
	D FILE^DIFG
	K DIFGSKIP(DIFGMULT) ;Going up one level so kill this variable which tells lower level multiples not to do lookup
	D CHANGEDA
	S DIFG=DIFG-1
X1	Q
	;
MULT	;MULTIPLE FIELD LOOKUP AND CALL TO SET DR STRING FOR MULTIPLE
	I DIFGMULT=0 S DIFGMGBL(DIFGMULT)=$S(DIFGM(0):^DIC(DIFGM(0),0,"GL"),1:DIC),DIFGDA(DIFGMULT)=DA
	S DIFGNODE=$P($P(DIFGMLND,"^",4),";")
	S DIFGLAGO=0
	I $P(^DD(DIFGNUM,.01,0),U,2)'["'"!($D(DIFGENV("LAYGO",DIFGNUM,.01))) S DIFGLAGO=1 ;Not a ptr or a ptr and laygo allowed
	S DIFGMULT=DIFGMULT+1
	I $D(DIFGSKIP(DIFGMULT-1)) S DIFGSKIP(DIFGMULT)=""
	S DIFGMGBL(DIFGMULT)=DIFGMGBL(DIFGMULT-1)_DIFGDA(DIFGMULT-1)_","_""""_DIFGNODE_""""_","
	S DIFGM(DIFGMULT)=DIFGNUM
	S DIC=DIFGNUM D BASE^DIFG0 Q:DIFGER  D FUNC^DIFG0
	Q
	;
NOLOOK	;IF NO LOOKUP REQUIRED, SET DA ARRAY
	F DIFGI=DIFGMULT:-1:1 S DA(DIFGI)=$S(DIFGI=1:DA,1:DA(DIFGI-1))
	Q
	;
SET	;
	I '$D(DIFGSKIP(DIFGMULT)) S (DA,DIFGDA(DIFGMULT))=+Y
	E  S (DA,DIFGDA(DIFGMULT))=DIFGALNK I '$D(DIFGFLUS) D
	. S ^UTILITY("DIFG",$J,DIFGINCR,DIC,"X")=$S($E(X)="`":$E(X,2,245)_"^N",($D(DIFG("ACGRV"))!(X[("^UTILITY(""DIFG@"","_$J))):X_"^N",1:X_"^"),^("MODE")="A"_"^"_$P(^("MODE"),U,2),^("DIC(""P"")")=$P(DIFGMLND,U,2)
	S DIC=DIFGM(DIFGMULT)
	S ^UTILITY("DIFG",$J,DIFGINCR,DIC,"DA")=DA,^("GL")=DIFGMGBL(DIFGMULT),^($S($D(DIFGSKIP(DIFGMULT))&('$D(DIFGFLUS)):"DIC(""DR"")",1:"DR"))="" F DIFGI=1:1:DIFGMULT S ^("DA("_DIFGI_")")=DA(DIFGI)
	I $D(DIFGSKIP(DIFGMULT)),'$D(DIFGFLUS) D ENADD^DIFG4
	K DIFGTYP,DIFGFLUS ;DIFGTYP exists due to DIFG3 not killing it if DIFGTYP="MV FIELD" - Needed in case one calls ENADD^DIFG4
	Q
	;
CHANGEDA	;BACK DOWN ONE LEVEL DA'S, I.E. DA=DA(1),DA(1)=DA(2) ETC.
	S DA=DA(1)
	I DIFGMULT>1 F DIFGI=DIFGMULT:-1:2 S DA(DIFGI-1)=DA(DIFGI)
	K DA(DIFGMULT)
	S DIFGMULT=DIFGMULT-1
	Q
	;
