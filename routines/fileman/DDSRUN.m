DDSRUN	;SFISC/MKO-RUN A FORM ;6JUL2013
	;;22.3T0;FILEMAN;;Mar 22, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	;
	;Select file (DDSFILE)
EGP	S DDS1=8108.3 D W^DICRW K DDS1 G:Y<0 RUNQ ;**CCO/NI 'RUN FORM:'
	G:'$D(@(DIC_"0)")) RUNQ
	K DDSFILE S DDSFILE=+Y
	;
	;Select form (DDSRUNDR)
	K DIC
	S DIC=.403,DIC(0)="QEA",D="F"_+Y
	S DIC("S")="I $P(^(0),U,8)=+DDSFILE"
	I DUZ(0)'="@" S DIC("S")=DIC("S")_" N DDSI F DDSI=1:1:$L($P(^(0),U,2)) I DUZ(0)[$E($P(^(0),U,2),DDSI) Q"
	W ! D IX^DIC K DIC,D G:Y<0 RUNQ
	S DDSRUNDR=+Y
	;
	I '$$COMPILED^DDS0(DDSRUNDR) D EN^DDSZ(DDSRUNDR) G:$G(DIERR) RUNQ
	;
	;Select page (DDSPAGE)
PAGE S DDSPAGE=$$MULSELPG(DDSRUNDR) I DDSPAGE]"" K DA G GO ;IF THERE'S A RECORD SELECTION PAGE WITH MULTIPLES, USE IT
 K DIR S Y=$O(^DIST(.403,DDSRUNDR,40,0)) I '$O(^(Y)) S DDSPAGE=1 G REC ;DON'T ASK PAGE IF THERE IS ONLY ONE!
	S DIR(0)="NOA^1:999.9:1"
	S DIR("A")="Enter number of first page: ",DIR("B")=1
	W ! D ^DIR K DIR G:$D(DIRUT) RUNQ
	K DDSPAGE S:Y'=1 DDSPAGE=Y
	;
REC	;Select record (DA)
	K DA
 D  G:DA<0 RUNQ
	. S DIC=DDSFILE,DIC(0)="QEALM"
	. W ! D ^DIC K DIC
	. S DA=+Y
	K D,DIC,X,Y
	;
	;Invoke form
GO K DR S DR=DDSRUNDR D ^DDS G:$D(DA) REC
	;
RUNQ	;Clean up and quit
	I $D(DIERR) W !,$C(7) D MSG^DIALOG("BW")
	K D,DIC,X,Y
	K DDSFILE,DDSPAGE,DDSRUNDR,DA,DR
	K DIRUT,DTOUT,DUOUT
	Q
 ;
MULSELPG(DDS) ;RETURN RECORD SELECTION PAGE IF IT IS NOT A POP-UP, I.E. IF IT IS A NEW-STYLE MULTIPLE SELECTION PAGE
 N Y,P S Y=$G(^DIST(.403,+DDS,21)) I Y]"" S P=$O(^(40,"B",Y,0)) I P,'$P(^DIST(.403,+DDS,40,P,0),U,6) Q Y
 Q ""
