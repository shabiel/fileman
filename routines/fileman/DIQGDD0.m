DIQGDD0	;SFISC/DCL-NODE PIECE LOOKUP FOR DD ;09:26 AM  5 Jan 1994
	;;22.2V2;VA FILEMAN;;Mar 08, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
NPS(DIQGDDN,DIQGNP)	;(CLOSEREFERENCE,PIECE)
	;NODE PIECE SEARCH - DIQGDDN IS DD NUMBER - DIQGNP IS PIECE
	; * * RETURNS FIELD NUMBER * *
	Q:$G(DIQGDDN)'>0 "" Q:$G(DIQGNP)="" ""
	N DIQGDDRT,DIQGDDRO,DIQGDDRN,DIQGFLD
	S DIQGDDRT="^DD("_DIQGDDN_")"
	S DIQGDDRO=0,DIQGFLD=""
	F  S DIQGDDRO=$O(@DIQGDDRT@(DIQGDDRO)) Q:DIQGDDRO'>0  D  Q:DIQGFLD
	.Q:'$D(@DIQGDDRT@(DIQGDDRO,0))  S DIQGDDRN=$P(^(0),"^",4)
	.I DIQGNP=DIQGDDRN S DIQGFLD=DIQGDDRO Q
	.I $P(DIQGDDRN,";")'?.N S $P(DIQGDDRN,";")=$$Q($P(DIQGDDRN,";")) I DIQGNP=DIQGDDRN S DIQGFLD=DIQGDDRO Q
	.I $P(DIQGDDRN,";")=$P(DIQGNP,";"),$E($P(DIQGDDRN,";",2))="E" S DIQGFLD=DIQGDDRO Q
	.Q
	Q DIQGFLD
	;
Q(%Z)	;(PLACE QUOATES AROUND %Z)
	S %Z(%Z)="",%Z=$Q(%Z("")) Q $E(%Z,4,$L(%Z)-1)
	;
FN(DIQGROOT)	;(CLOSEDREFERENCE)
	; * * RETURNS FILE NUMBER * *
	;CONVERT ROOT TO FILE NUMBER
	Q:$L($G(DIQGROOT),",")'>1 ""
	Q:$E(DIQGROOT,$L(DIQGROOT))'=")" ""
	N I,L,T,X,Y
	S X=DIQGROOT,L=$L(X),T=""
	F I=L:-1 S Y=$E(X,I) S:Y=","!(Y="(") T=T=0 Q:Y=""  I T,((Y=",")!(Y="(")) Q
	I I,$D(@($E(X,1,I)_"0)")) Q +$P(^(0),"^",2)
	Q ""
	;
NP(ROOT,PIECE)	;CONVERT ROOT AND PIECE TO NODE;PIECE
	; * * RETURNS 'NODE;PIECE' * *
	Q:$G(ROOT)="" "" Q:$G(PIECE)="" ""
	Q $P($P(ROOT,",",$L(ROOT,",")),")")_";"_PIECE
	;
PIECE(DIQGR,DA,DR,DIQGPARM,DIQGTA,DIQGERRA,DIQGIPAR)	;CLOSEDREF,PIECE,ATTRIBUTE,FLAG,TARGETARRAY,ERRORARRAY,INTERNAL
EN6	;PROCEDURE CALL AND  * * RETURN RESULTS IN TARGET ARRAY * *
	I $G(U)'="^" N U S U="^"
	N DIQGNP S DIQGR=$G(DIQGR),DA=$G(DA)
	S DIQGNP=$$NP(DIQGR,DA) I DIQGNP="" G 200
	S DIQGR=$$FN(DIQGR) I DIQGR="" G 200
	S DA=$$NPS(DIQGR,DIQGNP) I DA'>0 G 200
	G EN1^DIQGDD
	;
200	D BLD^DIALOG(200)
	I $G(DIQGERRA)]"" D CALLOUT^DIEFU(DIQGERRA)
	Q
