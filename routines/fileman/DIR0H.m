DIR0H ;SFISC/MKO-HELP FOR SCREENS ;10:59 AM  22 Jul 1994
 ;;22.0;VA FileMan;;Mar 30, 1999
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 S DIR0DX=DX,DIR0DY=DY
 W $P(DDGLVID,DDGLDEL,10)_$P(DDGLCLR,DDGLDEL,2)_$P(DDGLVID,DDGLDEL)
 D HLP^DDGLIBH(9231,9233,"DDSH",IOSL-1)
 ;
 I $D(DDS)#2 D
 . D R^DDS3
 . I $D(DDO)#2 D
 .. I 'DDO D CMD
 .. E  D
 ... K DDSH
 ... S DX=0,DY=IOSL-1 X DDXY W "COMMAND:"
 ... S DX=IOM-35 X IOXY W $P(DDGLVID,DDGLDEL,10)_"Press <PF1>H for help"
 E  W $P(DDGLCLR,DDGLDEL,2)
 ;
 S DX=IOM-8,DY=IOSL-1 X IOXY
 W $P(DDGLVID,DDGLDEL,10)_$S('$D(DDGLVAN):$P(DDGLVID,DDGLDEL,6),1:"")_$S($G(DIR0("REP")):"Replace",1:"Insert ")_$P(DDGLVID,DDGLDEL,10)
 ;
 S DY=$P(DIR0,U,4),DX=$P(DIR0,U,5)
 I $D(DIR("A"))=11 D
 . S DIR0X=""
 . F  S DIR0X=$O(DIR("A",DIR0X)) Q:DIR0X=""  D
 .. X IOXY
 .. W DIR("A",DIR0X)
 .. S DY=DY+1
 ;
 I $D(DIR("A"))#2 D
 . X IOXY W DIR("A")
 . I $D(DDS),DDO,DY=IOSL-1 W $P(DDGLCLR,DDGLDEL)
 ;
 S DIR0X=$E(DIR0A,DIR0C-DIR0DX+DIR0S,DIR0C+DIR0F-DIR0DX-1)
 S DX=DIR0S,DY=DIR0DY X IOXY W $S('$D(DDGLVAN):$P(DDGLVID,DDGLDEL,6),1:"")_DIR0X,$E(DIR0SP,$L(DIR0X)+1,999)
 S DX=DIR0DX X IOXY
 K DIR0DX,DIR0DY,DIR0X
 Q
CMD ;
 K DDH,DDQ
 F DDH=1:1 Q:$D(DIR("?",DDH))[0  S DDH(DDH,"T")=DIR("?",DDH)
 S:$D(DIR("?"))#2 DDH(DDH,"T")=DIR("?")
 D LIST^DDSU
 Q
