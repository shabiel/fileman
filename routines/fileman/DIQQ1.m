DIQQ1	;SFISC/TKW-NONDESTRUCTIVE ONLINE HELP FOR FIELDS ;4/4/95  09:16
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
EN(DP,D,X)	; DP=file no.,D=field no.,X="?" or "??"
	Q:'$G(DP)  Q:'$G(D)  Q:$G(X)'?1"?"."?"
	N %,%DT,A1,A2,DA,DC,DDH,DG,DIC,DIG,DIRUT,DISORT,DTOUT,DUOUT,DO,DQ,DST,DU,DV,DZ,Y
	S DISORT=1
1	S DQ="^DD("_DP_","_D_",0)",DQ(1)=$G(@(DQ)),DQ=1,DV=$TR($P(DQ(DQ),U,2),"V","F"),DU=$P(DQ(DQ),U,3),DZ=X Q:DQ(1)=""
	I DV S DP=+DV,D=.01 G 1
	I DV["P" N %Y,%W,%W1,%Z,C,DD,DDC,DDD,DF,DIAC,DIE,DICP,DICR,DICS,DICW,DICQ1Q,DIEQ,DIFILE,DILCV,DIPGM,DIW,DIX,DIY,DIZ,DS,IOX,IOY S DIE=""
	D EN1^DIEQ Q
