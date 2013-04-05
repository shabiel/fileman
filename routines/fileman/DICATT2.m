DICATT2	;SFISC/GFT,XAK-DEFINING MULTIPLES ;7NOV2012
	;;22.3T0;FILEMAN;;Mar 22, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	;
	S T=$E(Z) G CHECK^DICATT:$D(DTOUT)
	F P="I","O","L","x" S:$P(O,U,2)[P Z=$P(Z,U)_P_U_$P(Z,U,2)
1	K DS S:$P(Z,U)'["K" V=W[";0"
	S P=0,N=DICL,DQ=4,DP=6,DQI=" S:$D(X) DINUM=+X",DREF=$F(O,DQI)-1=$L(O),DE(7,0)="NO",DG(7)="N"
	S:T="*" T=$S($P(Z,U)["S":"S",1:"P") G 1^DICATT22:DA=.001
	G W:T="W" S:$D(DTIME)[0 DTIME=300
	I T'["F",T'["S",T'["K",'O!DREF S:DREF DE(7,0)="YES",DG(7)="Y"
S	F Y=4:1:6 S DQ(Y)=$P($T(DQ+Y),";",3)_F_$P($T(DQ+Y),";",4)_" (Y/N)^RS^Y:YES;N:NO^"_Y_"^Q" I 'V,DA-.01!'N Q
	S DG(5)="Y",DE(4,0)="NO",DP=-1,DL=1
	I T["P"!(T["N") S DE(5,0)="YES"
	I O S DE(6,0)=$E("NY",$P(O,U,2)["M"+1) S:$P(O,U,2)["R" DE(4,0)="Y" I DA=.01,N S P=$O(^DD(J(N-1),"SB",A,0)) S:P="" P=-1 S Y=$P(^DD(J(N-1),P,0),U,2),DE(5,0)=$E("YN",Y["A"+1)
	K Y S DIFLD=-1 D RE^DIED K DQ,DIFLD G:$D(Y) N^DICATT:$P(Z,U)["X",CHECK^DICATT I $D(DTOUT) K DTOUT G CHECK^DICATT
	S:DG(5)="N" T=T_"A" I DG(4)="Y",$P(Z,U)'["R" S Z="R"_Z
	I $D(DG(6)),DG(6)="Y",$P(Z,U)'["M" S Z="M"_Z
G	S DIZ=Z G ^DICATT22
Q	;
	K T,B,A,J,DA,DIC,E,DR,W,S,Q,P,N,V,I,L,F,DQI,DIK,C,Z,Y,DE,O,DICS,DICL,DDA Q
	;
W	S %=Z["L"+1 W !,"SHALL THIS TEXT NORMALLY APPEAR IN WORD-WRAP MODE" D YN^DICN
	G CHECK^DICATT:%<0 I % S Z=$P($TR(Z,"L"),U)_$E("L",%=2)_U G WINDOW
	W !,"ANSWER 'YES' IF THE INTERNALLY-STORED '"_F_"' TEXT"
	W !?5,"SHOULD NORMALLY BE PRINTED OUT IN FULL LINES, BREAKING AT WORD BOUNDARIES."
	W !?2,"ANSWER 'NO' IF THE INTERNAL TEXT SHOULD NORMALLY BE PRINTED OUT"
	W !?5,"LINE-FOR-LINE AS IT STANDS.",! G W
	;
	;
WINDOW	S %=2-(Z["x"!'O) W !,"SHALL ""|"" CHARACTERS IN THIS TEXT BE TREATED LIKE ANY OTHER CHARACTERS" D YN^DICN
	G CHECK^DICATT:%<0 I % S Z=$P($TR(Z,"x"),U)_$E("x",%=1)_U G G
	W !,"ANSWER 'YES' IF THE INTERNALLY-STORED '"_F_"' TEXT MAY HAVE ""|"" CHARACTERS"
	W !?3,"IN IT (SUCH AS HL7 MESSAGES) THAT NEED TO DISPLAY EXACTLY AS THEY ARE STORED."
	W !,"ANSWER 'NO' IF THE INTERNAL TEXT SHOULD NORMALLY BE PRINTED OUT WITH ANYTHING"
	W !?3,"THAT IS DELIMITED BY ""|"" CHARACTERS INTERPRETED AS VARIABLE TEXT.",! G WINDOW
	;
	;
	;
X	;
	W "   (FIELD DEFINITION IS NOT EDITABLE)"
	I N=4 K DIRUT D LENGTH(A,DA) I $D(DIRUT) K DIRUT G N^DICATT
	S T=$E(^DOPT("DICATT",N,0)),Y=^DD(A,DA,0),Z=$TR($P(Y,U,2),"MR")_U_$P(Y,U,3),W=$P(Y,U,4),C=$P(Y,U,5,99) S:Z["K" V=0
	G N^DICATT:N=6,1
	;
LENGTH(DI,DIFIELD)	;
	N DIR,DICY,Y,X,A0,B0,A1,A2
	S DICY=$G(^DD(DI,DIFIELD,0)) I $P(DICY,U,2)'["F" Q
	S A0=250,A1=$P($P($P(DICY,U,4),";",2),"E",2) I A1 S A2=$P(A1,",",2) I A2 S A0=A2-A1+1,DIR("?",1)="Data is stored by '$E"_A1_"'"
	S DIR("A")="MAXIMUM LENGTH OF '"_$P(DICY,U)_"'",DIR(0)="N^1:"_A0,DIR("B")=$$FL^DIQGDDU(DI,DIFIELD)
	S DIR("?")="THIS MAXIMUM WILL BE USED FOR OUTPUT PURPOSES, BUT WILL NOT BE PART OF THE INPUT CHECK FOR THE FIELD"
	D ^DIR Q:'Y
	N F S X=$P(DICY,U,2),F=$F(X,"J") I F Q:+$E(X,F,99)=Y  F  Q:$E(X,F)'?1N  S X=$E(X,1,F-1)_$E(X,F+1,99)
	S X=$TR(X,"J")_"J"_Y,$P(^DD(DI,DIFIELD,0),U,2)=X
	I $D(DDA) S DDA="E",A0="LENGTH^.23",A1=DIR("B"),A2=Y D IT^DICATTA
	Q
	;
NO	;
	W !,$C(7),"  <DATA DEFINITION UNCHANGED>" I $P(Z,U)["K"&(DUZ(0)'="@") G N^DICATT
TYPE	K Y,M,DE,DIE,DQ,DG G Q^DIB:$D(DTOUT) S N=0,DQI=DICL+9,Y=^DD(A,DA,0),F=$P(Y,U),Z="" W !!,"DATA TYPE OF ",F,": "
	I 'O R X:DTIME S:'$T DTOUT=1 G X^DICATT:X[U!'$T S DIC("S")="I Y-99,Y-10,Y<10!$O(^(201,0))" S:DUZ(0)'="@" DIC("S")="I Y-9,Y-99,Y<10!$O(^(201,0))" S:DA=.001 DIC("S")="I Y<4!(Y=7)" G NEW
	I $P(Y,U,2)["t" S N=+$P($P(Y,U,2),"t",2)
	E  F N=9:-1:5,1:1:4 Q:$P(Y,U,2)[$E("DNSFWCPVK",N)
	W $P(^DI(.81,N,0),U) ;Data type
	G X:$P(Y,U,2)["K"&(DUZ(0)'="@") ;non-programmer can't edit MUMPS type
	G X:$P(Y,U,2)["X",6^DICATT:N=6 R "// ",X:DTIME S:'$T DTOUT=1 G N^DICATT:X[U!'$T,0^DICATT:X=""
	S DIC("S")="I Y-6,Y-10,Y-99,Y-9"_$P(",Y-5",U,N\2-2!(A=B)!(DA-.01)!$O(^DD(A,DA))>0),DIC("S")=DIC("S")_$S(N=7:",Y-8",N=8:",Y-7",1:"")
NEW	I 'O,X=" ",E,$P(^DD(A,E,0),U,2)'["P",$P(^(0),U,2)'["V" W " <",$C(7) D E^DICATT W " DUPLICATED>" S DIZ=$S($D(DIZ):DIZ,1:DIZZ) G E^DICATT1
	S DIC(0)="QEI",DIC="^DI(.81," D ^DIC K DIC ;Look up X in Data Type file
	I Y>0 S:N-Y&O M="",O=$P(O,U,1,2)_U_U_$P(O,U,4) S N=+Y G 0^DICATT
	I 'O,X["?",E,$P(^DD(A,E,0),U,2)'["P",$P(^(0),U,2)'["V" D DICATT^DIQQQ,E^DICATT W ", JUST HIT THE SPACE KEY"
	G TYPE
	;
DQ	;;
	;
	;
	;
	;;IS ; ENTRY MANDATORY
	;;SHOULD USER SEE AN "ADDING A NEW ;?" MESSAGE FOR NEW ENTRIES
	;;HAVING ENTERED OR EDITED ONE ;, SHOULD USER BE ASKED ANOTHER
