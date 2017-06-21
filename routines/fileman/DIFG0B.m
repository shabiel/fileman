DIFG0B ;SFISC/DG(OHPRD)-PROCESS BASEFILE ;Jan 05, 2015
 ;;22.2;VA FileMan;;Jan 05, 2016;Build 42
 ;;Per VA Directive 6402, this routine should not be modified.
 ;;Submitted to OSEHRA 5 January 2015 by the VISTA Expertise Network.
 ;;Based on Medsphere Systems Corporation's MSC FileMan 1051.
 ;;Licensed under the terms of the Apache License, Version 2.0.
 ;
BASEFILE ;
 S DIFGTYPE="FILE"
 D BASE^DIFG0 G:DIFGER X2 D FUNC^DIFG0
 S DIFGLAGO=0
 I $P(DIFGMO(DIFGMULT),U)="L",$D(DINUM),$D(@(^DIC(DIC,0,"GL")_"DINUM)")) S $P(^UTILITY("DIFG",$J,DIFGINCR,DIC,"MODE"),U)="M",$P(DIFGMO(DIFGMULT),U)="M"
 E  I "AL"[$P(DIFGMO(DIFGMULT),U) S DIFGSECP=$P(^DD(DIC,.01,0),U,2) I DIFGSECP'["'"!($D(DIFGENV("LAYGO",DIC,.01))) S DIFGLAGO=1
 I $D(DINUM),$P(^DD(DIC,.01,0),U,5,99)["DINUM","MD"'[$P(DIFGMO(DIFGMULT),U) S DIFGER=7_U_DIFGY D ERROR^DIFG G X2
 I $D(DINUM) S ^UTILITY("DIFG",$J,DIFGINCR,DIC,$S("MD"[$P(DIFGMO(DIFGMULT),U):"DA",1:"DINUM"))=DINUM
 I $D(DIADD) S:"AL"'[$P(DIFGMO(DIFGMULT),U) DIFGER=8_U_DIFGY D:DIFGER ERROR^DIFG I 'DIFGER S $P(DIFGMO(DIFGMULT),U)="A",$P(^UTILITY("DIFG",$J,DIFGINCR,DIC,"MODE"),U)="A"
 K DIADD,DINUM
 I DIFGER G X2
 S:$D(^UTILITY("DIFG",$J,DIFGINCR,DIC,"DA")) DIFGDINM="" D ^DIFG3
 I DIFGER G X2
 K DIFGLAGO
 D SET^DIFG0A
 D KILLVAR0^DIFG0A
 S DIFGBSE=^UTILITY("DIFG",$J,DIFGINCR,DIC,"DA")_"^"_DIC_$S(^("MODE")["A":"^1",1:"")
X2 Q
 ;
