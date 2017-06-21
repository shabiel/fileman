DDGLIB0 ;SFISC/MKO - SETUP AND CLEANUP FOR WINDOWS ;14JUN2016
 ;;22.2;VA FileMan;**3**;Jan 05, 2016;Build 17
 ;;Per VA Directive 6402, this routine should not be modified.
 ;;Submitted to OSEHRA 5 January 2015 by the VISTA Expertise Network.
 ;;Based on Medsphere Systems Corporation's MSC FileMan 1051.
 ;;Licensed under the terms of the Apache License, Version 2.0.
 ;
INIT(DDGLBROW) ;Setup required variables
 ;Set margin to 0
 ;Turn autowrap off
 ;Turn type-ahead on
 ;Variables set:
 ;  DDGLDEL  = delimiter for other DDGL variables
 ;  DDGLVID  = codes that turn on/off video attributes
 ;  DDGLED   = codes for editing
 ;  DDGLCLR  = codes to erase characters
 ;  DDGLGRA  = codes for graphics characters
 ;  DDGLZOSF = array of code from %ZOSF (as of V22.2 - array comes from OS file)
 ;  DDGLREF  = global where window image is stored
 ;  DDGLKEY  = codes for non-alphanumeric keys
 ;  DDGLSCR  = array containing list of visible windows on screen
 ;
 N X
 I $D(DDGLDEL)[0 D SET Q:$G(DIERR)
 S X=0 X DDGLZOSF("RM"),DDGLZOSF("TYPE-AHEAD")
 W $P(DDGLVID,DDGLDEL,8)
 Q
 ;
SET ;Setup screen handling variables
 K DIERR,DDGLSCR
 S U="^",DDGLDEL=$C(127)
 ;
 ; VEN/SMH - remove reliance on %ZOSF node -- next 3 lines changed v 22.2
 D:'$D(DISYS) OS^DII ; garb OS from %ZOSF or Fileman in this sequence
 F X="EOFF","EON","TRMOFF","TRMON","TRMRD","RM","TYPE-AHEAD","NO-TYPE-AHEAD" D  G:$G(DIERR) ABT
 . S DDGLZOSF(X)=$G(^DD("OS",DISYS,X))
 ;
ZIS N %ZIS,IOP S IOP="HOME" D ^%ZIS I POP D BLD^DIALOG(845) G ABT
 I $D(^%ZIS(2)),'$O(^%ZIS(2,+$G(IOST(0)),0)) D BLD^DIALOG(840,"#"_+$G(IOST(0))) G ABT
 ;
 D:$G(IOXY)="" TRMERR("Cursor positioning (XY CRT)")
 ;
 S X="IORVON;IORVOFF;IOELEOL;IOEDEOP;IOUON;IOUOFF;IOSGR0;IOINHI;IOINLOW;IOINORM;IOCUU;IOCUD;IOCUF;IOCUB;IODL;IOIL;IODCH;IOICH;IOEDALL;IOELALL;IORI;IOAWM1;IOAWM0;IOSTBM;IOPF1;IOPF2;IOPF3;IOPF4;IOFIND;IOSELECT;IOINSERT;IOREMOVE;IOPREVSC;IONEXTSC"
 N @$TR(X,";",",")
 N IOBLC,IOBRC,IOBT,IOG1,IOG0,IOHL,IOLT,IOMT,IORT,IOTLC,IOTRC,IOTT,IOVL
 D ENDR^%ZISS,GSET^%ZISS
 I $G(IOPREVSC)="" D  ;"^C-VT220^C-VT320^"[(U_IOST_U) D   IOST MIGHT BE VT-100
 . S IOPREVSC=$C(27)_"[5~"
 . S IONEXTSC=$C(27)_"[6~"
 ;
ATT ;GET COLOR ATTRIBUTES FOR SCREENMAN...
 N A,B I '$D(DDGLBROW) D  ;...BUT NOT FOR THE BROWSER (see INIT+1^DDBR)
 .S A(1)=$C(27,91)_"40m",A(2)=$C(27,91)_"41m",A(3)=$C(27,91)_"45m" ;Defaults 
 .I $G(^XTV(8989.5,0))?1"PARAM".E F X=1,2,3 S A=$$GET^XPAR("ALL","DI SCREENMAN COLORS",X),B=$$GET^XPAR("ALL","DI SCREENMAN COLORS",X+3) S:B]"" A(X)=$C(27,91)_(10+B)_"m" S:A]"" A(X)=A(X)_$C(27,91)_+A_"m"
 .S IOUON=IOINHI_A(1) ;REQ CAPTION BACKGROUND (BLACK)
 .S IOINHI=IOINHI_A(2) ;DATA BACKGROUND (RED)
 .S IORVON=IOINHI_A(3) ;CLICKABLE BACKGROUND (MAGENTA)
 .S (IORVOFF,IOUOFF)=IOINORM
 S DDGLVID=IOINHI_DDGLDEL_IOINLOW_DDGLDEL_IOINORM_DDGLDEL_IOUON_DDGLDEL_IOUOFF_DDGLDEL_IORVON_DDGLDEL_IORVOFF_DDGLDEL_IOAWM0_DDGLDEL_IOAWM1_DDGLDEL_$G(IOSGR0)
 S DDGLED=$G(IORI)_DDGLDEL_$G(IOSTBM)_DDGLDEL_$G(IOIL)_DDGLDEL_$G(IODL)_DDGLDEL_$G(IOICH)_DDGLDEL_$G(IODCH)
 S DDGLCLR=IOELEOL_DDGLDEL_IOEDALL_DDGLDEL_IOEDEOP_DDGLDEL_$G(IOELALL)
 S DDGLKEY=U_IOCUU_U_IOCUD_U_IOCUF_U_IOCUB_U_IOPF1_U_IOPF2_U_IOPF3_U_IOPF4_U_$G(IOFIND)_U_$G(IOSELECT)_U_$G(IOINSERT)_U_$G(IOREMOVE)_U_$G(IOPREVSC)_U_$G(IONEXTSC)_U
 S DDGLGRA=IOG1_DDGLDEL_IOG0_DDGLDEL_IOHL_DDGLDEL_IOVL_DDGLDEL_IOTLC_DDGLDEL_IOTRC_DDGLDEL_IOBLC_DDGLDEL_IOBRC
 S:DDGLDEL_$P(DDGLGRA,DDGLDEL,3,999)_DDGLDEL[(DDGLDEL_DDGLDEL) DDGLGRA=DDGLDEL_DDGLDEL_"-"_DDGLDEL_"|"_DDGLDEL_"+"_DDGLDEL_"+"_DDGLDEL_"+"_DDGLDEL_"+"
 ;
 D:$P(DDGLKEY,U,1,5)_U[(U_U) TRMERR("Cursor keys")
 D:U_$P(DDGLKEY,U,6,9)_U[(U_U) TRMERR("PF keys")
 D:IOELEOL="" TRMERR("Erase to End of Line")
 D:IOEDALL="" TRMERR("Erase Entire Page")
 D:IOEDEOP="" TRMERR("Erase to End of Page")
 G:$G(DIERR) ABT
 ;
 S DDGLREF="^TMP(""DDGL"",$J,""W"")" K @DDGLREF
 ;
 I "^C-QUME^C-QVT102^C-WYSE75^"[(U_$TR(IOST," ","")_U) D
 . S DDGLVAN=1
 . S $P(DDGLVID,DDGLDEL,4,7)=$S($TR(IOST," ","")="C-WYSE75":IOINHI_DDGLDEL_IOINLOW_DDGLDEL_IOINHI_DDGLDEL_IOINLOW,1:IOINLOW_DDGLDEL_IOINHI_DDGLDEL_IOINLOW_DDGLDEL_IOINHI)
 . S $P(DDGLVID,DDGLDEL,10)=IOINORM
 ;
 D:'$D(^%ZTSK)!($D(^%ZOSF("MGR"))[0) KILL^%ZISS
MOUSEON ;I $G(DDS)>0 W *27,"[?1000h" NOW DONE IN DDS0
 Q
 ;
 ;
ASKIOSL ; not used
 ;N X
 ;X ^%ZOSF("EOFF")
 R X:0 S XX=""
 W $C(27)_7_$C(27)_"[r"_$C(27)_"[999;999H"_$C(27)_"[6n" R X ; R *X:1 R:$T XX S X=$C(X)_XX
 ;S X=+$E(X,3,5) I X S IOSL=X
 Q
 ;
 ;
 ;
TRMERR(DDGLCH) ;Terminal type errors
 N P
 S P(1)=DDGLCH,P(2)=IOST
 D BLD^DIALOG(842,.P)
 Q
 ;
 ;
 ;
KILL(DDGLPARM) ;Cleanup variables
 ;Set margin to IOM
 ;Turn off type-ahead if New Person file so indicates
 ;Turn autowrap on
 ;Reset character attributes
 ;Turn echo on
 ;Turn terminators off
 N X
 D:'$D(DISYS) OS^DII ; garb OS from %ZOSF or Fileman in this sequence
 I $G(DDGLPARM)'["W" D
 . S X=$S($D(IOM)#2:IOM,1:80) X $G(DDGLZOSF("RM"))
 . I $D(DUZ)#2,$D(^VA(200,DUZ,0))#2,$P($G(^(200)),U,9)'="Y" D
 .. I '$G(DUZ("BUF"),1) X $G(DDGLZOSF("NO-TYPE-AHEAD"))
 . W $P($G(DDGLVID),$G(DDGLDEL),9),$P($G(DDGLVID),$G(DDGLDEL),10)
 ;
 I $G(DDGLPARM)'["T" D
 . X $G(DDGLZOSF("EON")),$G(DDGLZOSF("TRMOFF"))
 E  X $G(DDGLZOSF("EOFF")),$G(DDGLZOSF("TRMON"))
 ;
MOUSEOFF ;W *27,"[?1000l"  NOW DONE IN DDS0
ABT K DX,DY,POP
 I '$G(DIERR),$G(DDGLPARM)["K" Q
 K:$G(DDGLREF)]"" @DDGLREF
 D:'$D(^%ZTSK)!($D(^%ZOSF("MGR"))[0) KILL^%ZISS
 ;
 K DDGLDEL,DDGLVID,DDGLED,DDGLCLR,DDGLGRA,DDGLZOSF,DDGLREF
 K DDGLKEY,DDGLSCR,DDGLVAN,DDGLH
 ;
 K DIR0
