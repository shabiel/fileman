DIR02	;SFISC/MKO-MULTILINE FIELD EDITOR ;25MAY2004
	;;22.2V2;VA FILEMAN;;Mar 08, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
EN	;
	N DIR0FL,DIR0LN,DIR0NC,DIR0QU
	X DDGLZOSF("EOFF"),DDGLZOSF("TRMON")
	W $S('$D(DDGLVAN):$P(DDGLVID,DDGLDEL,6),1:"")
	S DIR0QU=0
	;
	S:$D(DIR0C)#2 DIR0C=DIR0C+1
	D INIT,^DIR03
	W $P(DDGLVID,DDGLDEL,7)
	Q
	;
SM	;ScreenMan's entry point, called from ^DIR01
	N DIR0DN,DIR0FL,DIR0LN,DIR0NC,DIR0NL
	S DIR0R=IOSL-6,DIR0S=0,DIR0L=IOM-1,DIR0NL=4
	;
	D INIT,^DIR03
	;
	S:$D(DTOUT) DIR0A=DIR0D
	;
	;Restore command area
	S DY=DIR0R,DX=DIR0S X IOXY
	W $P(DDGLVID,DDGLDEL,10)_$P(DDGLCLR,DDGLDEL,3) F DY=DY:1:IOSL-1 K DDSMOUSE(DY)
	;
BOT	D BOT^DDSCOM
	;Restore variables
	S (DY,DIR0R)=$P(DIR0,U),(DX,DIR0S)=$P(DIR0,U,2),DIR0L=$P(DIR0,U,3)
	S DIR0F=DIR0S+DIR0L
	S DIR0SP=$J("",DIR0L) S:$G(DDGLVAN) DIR0SP=$TR(DIR0SP," ","_")
	I DIR0A]"","^?"[$E(DIR0A) S DIR0QT=1
	;
	;Repaint answer
	X IOXY
	W:'$D(DDGLVAN) $P(DDGLVID,DDGLDEL,6)
	I DIR0C>DIR0L D
	. W $E(DIR0A,DIR0C-DIR0L+1,DIR0C)_$E(DIR0SP,DIR0C>$L(DIR0A))
	. S DX=DIR0F-1
	E  D
	. W $E(DIR0A,1,DIR0L)_$E(DIR0SP,$L(DIR0A)+1,999)
	. S DX=DIR0S+DIR0C-1
	X IOXY
	K DTOUT
	Q
	;
	;
	;
INIT	;Setup
	K DTOUT
	S:DIR0M<$L(DIR0A) DIR0M=$L(DIR0A)
	S DIR0SP=$J("",DIR0L) S:$G(DDSVAN) DIR0SP=$TR(DIR0SP," ","_")
	;
	F DIR0LN=1:1:DIR0NL D
	. S DY=DIR0R+DIR0LN-1,DX=DIR0S X IOXY
	. S X=$E(DIR0A,DIR0LN-1*DIR0L+1,DIR0LN*DIR0L)
	. W X_$E(DIR0SP,$L(X)+1,999)
	;
	S:DIR0NL*DIR0L-1<DIR0M DIR0M=DIR0NL*DIR0L-1
	S DIR0NL=DIR0M\DIR0L+1,DIR0NC=DIR0M#DIR0L
	S DIR0F=DIR0S+DIR0L-1,DIR0FL=DIR0S+DIR0NC-1
	S DIR0SV=$G(DIR0("L")),DIR0DN=0
	;
	S DIR0C=$S($G(DIR0C)<1:1,1:DIR0C)
	S:DIR0C-1>DIR0M DIR0C=DIR0M+1
	S DIR0LN=DIR0C\DIR0L+1
	S DY=DIR0R+DIR0LN-1,DX=DIR0S+(DIR0C#DIR0L)-1
	X IOXY
	Q
	;
KILL	;Cleanup all variables
	D KILL^DDGLIB0()
	Q
