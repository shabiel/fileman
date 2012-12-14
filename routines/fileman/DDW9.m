DDW9	;SFISC/MKO-MARK TEXT ;12:20 PM  24 Aug 2002
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	;
CHKDEL(DDWY)	;Check that cursor is on block and delete
	N DDWI
	N DDWC1,DDWC2,DDWR1,DDWR2,DDWI
	D PMARK(DDWMARK,.DDWR1,.DDWC1,.DDWR2,.DDWC2)
	S DDWY=0,DDWI=DDWRW+DDWA
	Q:DDWI<DDWR1
	Q:DDWI>DDWR2
	I DDWI=DDWR1,DDWC<DDWC1 D UNMARK^DDW7 Q
	I DDWI=DDWR2,DDWC-1>DDWC2 D UNMARK^DDW7 Q
	;
	D DELBLK()
	S DDWY=1
	Q
	;
DELBLK(DDWNDEL)	;Delete block
	;Returns: DDWNDEL=# lines deleted from the screen
	N DDWNP,DDWI,DDWX
	I '$D(DDWR1) N DDWR1,DDWR2,DDWC1,DDWC2 D
	. D PMARK(DDWMARK,.DDWR1,.DDWC1,.DDWR2,.DDWC2)
	;
	S DDWNDEL=0,$E(DDWBF,1,3)=111
	K DDWMARK
	;
	I DDWR2-DDWA<1 D
	. D DELABV
	E  I DDWR1-DDWA>DDWMR D
	. D DELBEL
	E  D DELMID
	;
	D IND^DDW7()
	Q
	;
DELABV	;All of the block is above the screen
	I DDWR1=DDWR2 D  Q
	. N DDWX
	. S DDWX=^TMP("DDW",$J,DDWR1),$E(DDWX,DDWC1,DDWC2)=""
	. I DDWX]"" S ^TMP("DDW",$J,DDWR1)=DDWX
	. E  D SHIFTA(DDWR1,DDWR1)
	;
	D:DDWR2-DDWR1>50 MSG^DDW(" ...") ;**
	N DDWFST,DDWLST
	S DDWFST=$E(^TMP("DDW",$J,DDWR1),1,DDWC1-1)
	S DDWLST=$E(^TMP("DDW",$J,DDWR2),DDWC2+1,999)
	I DDWFST]"" S ^TMP("DDW",$J,DDWR1)=DDWFST,DDWFST=DDWR1+1
	E  S DDWFST=DDWR1
	I DDWLST]"" S ^TMP("DDW",$J,DDWR2)=DDWLST,DDWLST=DDWR2-1
	E  S DDWLST=DDWR2
	D SHIFTA(DDWFST,DDWLST)
	D:DDWR2-DDWR1>50 MSG^DDW()
	Q
	;
SHIFTA(DDWA1,DDWA2)	;
	N DDWNL
	S DDWNL=DDWA2-DDWA1+1
	I DDWA2=DDWA S DDWA=DDWA-DDWNL,DDWCNT=DDWCNT-DDWNL Q
	;
	N DDWI
	F DDWI=DDWA1:1:DDWA-DDWNL S ^TMP("DDW",$J,DDWI)=^TMP("DDW",$J,DDWI+DDWNL)
	S DDWA=DDWA-DDWNL,DDWCNT=DDWCNT-DDWNL
	Q
	;
DELBEL	;All of the block is below the screen
	N DDWS1,DDWS2
	S DDWS1=DDWA+DDWMR+DDWSTB-DDWR1+1,DDWS2=DDWA+DDWMR+DDWSTB-DDWR2+1
	I DDWS1=DDWS2 D  Q
	. N DDWX
	. S DDWX=^TMP("DDW1",$J,DDWS1),$E(DDWX,DDWC1,DDWC2)=""
	. I DDWX]"" S ^TMP("DDW1",$J,DDWS1)=DDWX
	. E  D SHIFTB(DDWS1,DDWS1)
	;
	D:DDWR2-DDWR1>50 MSG^DDW(" ...") ;**
	N DDWFST,DDWLST
	S DDWFST=$E(^TMP("DDW1",$J,DDWS1),1,DDWC1-1)
	S DDWLST=$E(^TMP("DDW1",$J,DDWS2),DDWC2+1,999)
	I DDWFST]"" S ^TMP("DDW1",$J,DDWS1)=DDWFST,DDWFST=DDWS1-1
	E  S DDWFST=DDWS1
	I DDWLST]"" S ^TMP("DDW1",$J,DDWS2)=DDWLST,DDWLST=DDWS2+1
	E  S DDWLST=DDWS2
	D SHIFTB(DDWFST,DDWLST)
	D:DDWR2-DDWR1>50 MSG^DDW()
	Q
	;
SHIFTB(DDWS1,DDWS2)	;
	N DDWNL
	S DDWNL=DDWS1-DDWS2+1
	I DDWS1=DDWSTB S DDWSTB=DDWSTB-DDWNL,DDWCNT=DDWCNT-DDWNL Q
	;
	N DDWI
	F DDWI=DDWS2:1:DDWSTB-DDWNL S ^TMP("DDW1",$J,DDWI)=^TMP("DDW1",$J,DDWI+DDWNL)
	S DDWSTB=DDWSTB-DDWNL,DDWCNT=DDWCNT-DDWNL
	Q
	;
DELMID	;A portion of the block appears on the screen
	I DDWR2-1-DDWA>DDWMR D
	. S DDWX=DDWR2-(DDWA+DDWMR+1)
	. S DDWSTB=DDWSTB-DDWX,DDWCNT=DDWCNT-DDWX
	;
	I DDWR2-DDWA>DDWMR D
	. S DDWX=$E(^TMP("DDW1",$J,DDWSTB),DDWC2+1,999)
	. I DDWX="" S DDWSTB=DDWSTB-1,DDWCNT=DDWCNT-1
	. E  S ^TMP("DDW1",$J,DDWSTB)=DDWX
	;
	D POS($$MAX(DDWR1-DDWA,1),$S(DDWR1=DDWR2:DDWC1,1:1),"RN")
	;
	S DDWNP=DDWR2-DDWA'<DDWMR
	F DDWI=DDWRW:1:$$MIN(DDWR2-DDWA,DDWMR) D
	. S DDWX=$E(DDWL(DDWRW),1,$S(DDWI+DDWA=DDWR1:DDWC1,1:1)-1)_$E(DDWL(DDWRW),$S(DDWI+DDWA=DDWR2:DDWC2,1:999)+1,999)
	. I DDWX]"" D
	.. S DDWL(DDWRW)=DDWX
	.. I 'DDWNP D
	... D CUP(DDWRW,1)
	... W $P(DDGLCLR,DDGLDEL)_$E(DDWX,1+DDWOFS,IOM+DDWOFS)
	.. D POS(DDWRW+(DDWI<$$MIN(DDWR2-DDWA,DDWMR)),DDWC,"RN")
	. E  D XLINE^DDW5(1,DDWNP) S DDWNDEL=DDWNDEL+1
	;
	I DDWNP F DDWI=$$MAX(DDWR1-DDWA,1):1:DDWMR D
	. D CUP(DDWI,1)
	. W $P(DDGLCLR,DDGLDEL)_$E(DDWL(DDWI),1+DDWOFS,IOM+DDWOFS)
	;
	I DDWR1+1'>DDWA D
	. S DDWX=DDWA-DDWR1
	. S DDWA=DDWA-DDWX,DDWCNT=DDWCNT-DDWX
	;
	I DDWR1'>DDWA D
	. S DDWX=$E(^TMP("DDW",$J,DDWA),1,DDWC1-1)
	. I DDWX="" S DDWA=DDWA-1,DDWCNT=DDWCNT-1
	. E  S ^TMP("DDW",$J,DDWA)=DDWX
	;
	S:DDWCNT<1 DDWCNT=1
	D:DDWRW+DDWA>DDWCNT UP^DDWT1
	Q
	;
PMARK(M,R1,C1,R2,C2)	;Parse M (DDWMARK)
	S R1=$P(M,U),C1=$P(M,U,2)
	S R2=$P(M,U,3),C2=$P(M,U,4)
	Q
	;
CUP(Y,X)	;
	S DY=IOTM+Y-2,DX=X-1 X IOXY
	Q
	;
POS(R,C,F)	;Pos cursor based on char pos C
	N DDWX
	S:$G(C)="E" C=$L($G(DDWL(R)))+1
	S:$G(F)["N" DDWN=$G(DDWL(R))
	S:$G(F)["R" DDWRW=R,DDWC=C
	;
	S DDWX=C-DDWOFS
	I DDWX>IOM!(DDWX<1) D SHIFT^DDW3(C,.DDWOFS)
	S DY=IOTM+R-2,DX=C-DDWOFS-1 X IOXY
	Q
	;
MIN(X,Y)	;
	Q $S(X<Y:X,1:Y)
	;
MAX(X,Y)	;
	Q $S(X>Y:X,1:Y)
