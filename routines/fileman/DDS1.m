DDS1(DDSPG)	;SFISC/MKO-LOAD PAGE ;31MAY2007
	;;22.2V2;VA FILEMAN;;Mar 08, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	;Input:
	;  DDS     = Form number^Form name
	;  DDSPG   = Internal page number
	;  DA      = Record array
	;  DDSREFT = Global location where data (temporarily) is stored
	;  DDP     = Primary file number of form
	;  DIE     = Global root of form
	;  DDSDA   = DA,DA(1),... of form
	;  DDSDL   = Level number
	;Also needed for pointed-to blocks:
	;  DDSDAORG
	;  DDSDLORG
	;Returns:
	;  DIERR
	;
	N DDS1B,DDS1BO K DDSMOUSE S U="^"
	;
	;Get header block
	S DDS1B=$P($G(^DIST(.403,+DDS,40,DDSPG,0)),U,2)
	I DDS1B]"" D BLK(DDSPG,DDS1B,"",1) G:$G(DIERR) END
	;
	;Get all other blocks on page
	S DDS1BO="" F  S DDS1BO=$O(^DIST(.403,+DDS,40,DDSPG,40,"AC",DDS1BO)) Q:DDS1BO=""  S DDS1B=$O(^(DDS1BO,0)) Q:'DDS1B  D BLK(DDSPG,DDS1B,DDS1BO) G:$G(DIERR) END
	;
END	K DDSMOUSE
	Q
	;
BLK(DDSPG,DDS1B,DDS1BO,DDS1H,DDS1E)	;Load block
	;In:  DDS1H  = 1 if a header block
	;     DDS1E  = 1 if we're loading up a pointed-to block and
	;              we want interactive dialog (DIC(0)["E") in the lookup
	;
	I $D(^DIST(.404,DDS1B,0))[0 D BLD^DIALOG(3051,"#"_DDS1B) Q
	;
	N DDS1PTB,DDS1REP S DDS1PTB=""
	I '$G(DDS1H) D
	. S DDS1PTB=$G(^DIST(.403,+DDS,40,DDSPG,40,DDS1B,1)),DDS1REP=$G(^(2))
	. K:DDS1REP<2 DDS1REP
	;
	I DDS1PTB]"" N @$$D0(DDSDL),DA,DDP,DIE,DDSDL,DDSDA D  Q:$G(DIERR)
	. I $G(DDS1REP)>1 D
	.. D BK^DDS10(.DDS1B,.DDP) Q:$G(DIERR)
	.. D GDA^DDS10(DDS1B,$G(DDS1E),.DA) Q:$G(DIERR)
	.. S DDP=$G(^DD(DDP,0,"UP"),DDP) ;GFT
	.. D GL^DDS10(DDP,.DA,.DIE,.DDSDL,.DDSDA,1)
	.. D GETD0(.DA,DDSDL)
	. E  D
	.. D SET^DDS10(DDS1B,$G(DDS1E),.DA,.DDP,.DIE,.DDSDL,.DDSDA) ;GO GET THE NEW 'DA' VALUE
	.. I +$G(DIERR)=1,$G(^TMP("DIERR",$J,1))=601 D  Q
	... L -@(DIE_DA_")")
	... K ^TMP("DDS",$J,"LOCK",DIE_DA_")")
	... D CLEAN^DILF
	... S (DA,D0,DDSDA)=""
	.. Q:$G(DIERR)
	.. I DA="",'$G(DDS1E),$P($G(@DDSREFT@(DDSPG,DDS1B)),U)]"" S DDSDA=$P(^(DDS1B),U),DA=+DDSDA
	.. S D0=DA
	;
	I $G(DA)!'$G(DDSDAORG),$G(@DDSREFT@(DDSPG,DDS1B,DDSDA))<1 D
	. S $P(@DDSREFT@(DDSPG,DDS1B,DDSDA),U)=1
	. I $G(DDS1REP)>1 D REP Q
	. ;
	. S @DDSREFT@(DDSPG,DDS1B,DDSDA,"GL")=DIE
	. D ^DDS11(DDS1B)
	;
	S $P(@DDSREFT@(DDSPG,DDS1B),U)=$G(DDSDA)
	Q
	;
REP	;Load data for repeating block
	N DDS1DDP,DDS1IND,DDS1INI,DDS1MUL,DDS1PDA,DDS1REF,DDS1RT,DDS1SEL
	N DDS1SN,DDS1VAL,DDS1FSCR,DDS1SCNT,DDS1STRT,DDS1Q,DDS1ACT
	S DDS1REF=$NA(@DDSREFT@(DDSPG,DDS1B))
	S DDS1DDP=$P(@DDSREFS@(DDSPG,DDS1B),U,3)
	S DDS1IND=$P(DDS1REP,U,2) S:DDS1IND="" DDS1IND="B"
	S DDS1INI=$P(DDS1REP,U,3)
	S DDS1SEL=$P(@DDSREFS@(DDSPG,DDS1B),U,10)
	S DDS1PDA=DDSDA
	;
	S DDS1MUL=$O(^DD(+DDP,"SB",DDS1DDP,""))
	S:$G(^DD(DDS1DDP,0,"SCR"))]"" DDS1FSCR=^("SCR")
ACT	S:$G(^("ACT"))]"" DDS1ACT=^("ACT")
	;
	S $P(@DDS1REF@(DDS1PDA),U,7,10)=DDP_U_DDS1MUL_U_DDS1SEL_U_DDS1IND
	S @DDS1REF@(DDSDA,"GL")=$S(DDS1MUL:DIE_+DA_","""_$P($P(^DD(DDP,DDS1MUL,0),U,4),";")_""",",1:^DIC(DDS1DDP,0,"GL"))
	;
	N DIE,DDP
	S DIE=@DDS1REF@(DDSDA,"GL"),DDS1RT=$$CREF^DILF(DIE),DDP=DDS1DDP
	S DDS1SN=0
	;
	I DDS1MUL D  ;IT'S A MULTIPLE FIELD WITHIN TOP-LEVEL FILE
	. D DDA^DDS5(0,.DA,.DDSDL)
	. S DDSDA=","_DDSDA
	. S:'$D(@DDS1RT@(DDS1IND)) DDS1IND="!IEN"
	. I DDS1IND="!IEN" D
	.. S DA=0 F  S DA=$O(@DDS1RT@(DA)) Q:'DA  D REPLD
	. E  D
	.. S (DDS1Q,DDS1STRT)=$NA(@DDS1RT@(DDS1IND)),DDS1SCNT=$QL(DDS1Q)
	.. F  S DDS1Q=$Q(@DDS1Q) Q:DDS1Q=""  Q:$NA(@DDS1Q,DDS1SCNT)'=DDS1STRT  D
	... S DA=$QS(DDS1Q,$QL(DDS1Q)) D REPLD
	;
GFT	E  I $G(^DIST(.403,+DDS,40,DDSPG,40,DDS1B,"COMP MUL"))]"" D  S DDSDA=DDS1PDA,DA=+DDSDA,@DDS1REF@("COMP MUL")=$G(^DIST(.403,+DDS,40,DDSPG,40,DDS1B,"COMP MUL PTR")) ;COMPUTED MULTIPLE BUILDS A REPEATING BLOCK
	.N DICMX,D
	.I $G(^("COMP MUL PTR"))="" S DICMX="S DA=$G(D0,$G(D)) N D D NOFILE^DDS1"
	.E  S DICMX="S DA=$G(D0,$G(D)) N D D REPLD^DDS1"
	.X ^("COMP MUL")
	;
	E  I $G(DA) S DDS1VAL=DA N D0,DA,DDSDA D  ;IT'S A RELATIONAL JUMP  (DA COULD BE UNDEFINED FOR AN UNRELATED FILE!)
	. S DDSDA=","
	. S (DDS1Q,DDS1STRT)=$NA(@DDS1RT@(DDS1IND,DDS1VAL)),DDS1SCNT=$QL(DDS1Q)
	. F  S DDS1Q=$Q(@DDS1Q) Q:DDS1Q=""  Q:$NA(@DDS1Q,DDS1SCNT)'=DDS1STRT  D
	.. S DA=$QS(DDS1Q,$QL(DDS1Q)) D REPLD
	;
	E  S DIERR=1 Q
	;Now set INITIAL POSITION
DISV	I DDS1INI="u" S DDS1INI="l" I $G(DUZ)]"",$G(DIE)]"" D  I DDS1INI
	.N T
	.S T=$G(^DISV(DUZ,DIE)) Q:'T  S T=$G(@DDS1REF@(DDS1PDA,"B",T_",")) Q:'T  ;Get entry that SPACE-BAR would return
	.S DDS1SN=T,T=T-DDS1REP+1
	.I T>0 S DDS1INI=T_U_(DDS1SN-T+1)_U_DDS1SN Q
	.S DDS1INI=1_U_DDS1SN_U_DDS1SN
	E  I DDS1INI="l"!(DDS1INI="n") D
	. N N,T
	. S N=DDS1INI="n"
F	. S DDS1SN=$O(@DDS1REF@(DDS1PDA," "),-1)+N S:'DDS1SN DDS1SN=1 ;Don't want 1^0^0
	. S T=DDS1SN-DDS1REP+2-N
	. S DDS1INI=$S(T<1:1_U_DDS1SN,1:T_U_(DDS1REP-'N))_U_DDS1SN
	E  S DDS1INI="1^1^1"
	;
	S $P(@DDS1REF@(DDS1PDA),U,2,6)=DDS1PDA_U_DDS1INI_U_+DDS1REP
	;
	I DDS1MUL D
	. D UDA^DDS5(.DA,.DDSDL)
	. S DDSDA=$P(DDSDA,",",2,999)
	Q
	;
REPLD	;Load data
	Q:'$D(@DDS1RT@(DA,0))  I $D(DDS1FSCR) N Y S Y=DA X DDS1FSCR Q:'$T
	I $D(DDS1ACT) D
	.N DIC,Y
	.S DIC(0)="E",Y=DA_U_$P(@DDS1RT@(DA,0),U)
	.X DDS1ACT ;HERE IS WHERE ACCESS AUDITING WOULD TAKE PLACE IF IT IS SET UP IN POST-ACTION!
NOFILE	S DDS1SN=DDS1SN+1,$P(DDSDA,",")=DA,@("D"_DDSDL)=DA
	S @DDS1REF@(DDS1PDA,DDS1SN)=DDSDA
	S @DDS1REF@(DDS1PDA,"B",DDSDA)=DDS1SN
	D ^DDS11(DDS1B)
	Q
	;
D0(DL)	;Given DL, return string D0,D1,...,Dn
	N I,S
	S S="" F I=0:1:DL S S=S_"D"_I_","
	S:S?.E1"," S=$E(S,1,$L(S)-1)
	Q S
	;
GETD0(DA,DL)	;Given DA array, set D0,D1...
	N I
	S @("D"_DL)=DA
	F I=1:1:DL-1 S @("D"_(DL-I))=DA(I)
	Q
