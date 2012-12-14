DIFROMSF	;SCISC/DCL-SILENT DIFROM EXTENDED DATABASE FILES;08:41 AM  22 Nov 1994;
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	Q
	;
	; * EXTENDED DATABASE ELEMENTS (EDE) *
EDEOUT(DIFRIEN,DIFRNAME,DIFRFLG,DIFRFIA,DIFRTA,DIFRLST,DIFRMSGR)	;
	;ENTRY,PKGNAME,FLAGS,FIA_ARRAY,TARGET_ARRAY,LIST_ARRAY,MSG_ROOT
	I $G(DIFRNAME)']"" D ERR("PACKAGE NAME") Q
	N DIFRFILE
	S DIFRFILE=$S(DIFRFLG="F":.403,DIFRFLG="I":.402,DIFRFLG="P":.4,DIFRFLG="S":.401,DIFRFLG="$":.5,1:"")
	I DIFRFILE'>0 D ERR("FLAG") Q
	I $G(DIFRTA)="" S DIFRTA=$NA(^XTMP("XPDT",DIFRNAME,"KRN"))
	;
	;              >*>*>*> c h e c k   h e r e <*<*<*<
	;
	S DIFRFIA=$G(DIFRFIA) S:DIFRFIA="" DIFRFIA=$NA(@DIFRTA@("FIA"))
	I $G(DIFRIEN)'>0&($G(DIFRLST)="") D ERR("NO IENs PASSED") Q
	I $G(DIFRIEN)'>0,$D(@DIFRLST)'>9 D ERR("LIST DOES NOT CONTAIN IENs") Q
	D EDEOUT^DIFROMS5
	G EXIT
	;
EDEIN	; * EXTENDED DATABASE ELEMENTS *
	Q
FPRE(DIFRFILE,DIFRNAME,DIFRSA)	; FILE-PRE
	K ^TMP("DIFROMS",$J)
	;FILENUMBER,SUBSCRIPT_NAME(package name for KIDS),SOURCE_ARRAY
	S DIFRFILE=$G(DIFRFILE) S:DIFRFILE'>0 DIFRFILE=$G(XPDFIL)
	I DIFRFILE'>0 D ERR("FILE NUMBER") Q
	Q:DIFRFILE'=.403
	I $G(DIFRNAME)="" D ERR("SUBSCRIPT NAME") Q
	I $G(DIFRSA)="" S DIFRSA=$NA(^XTMP("XPDT",DIFRNAME,"KRN"))
	I DIFRFILE=.403 D  Q  ;If Forms bring in Blocks
	.N DIC,DIFRR,DIFRFILE,DIFRL,DIFRX,X,Y
	.S DIC="^DIST(.404,",DIC(0)="LX",DLAYGO=.404,DIFRFILE=.404
	.S DIFRR=0
	.F  S DIFRR=$O(@DIFRSA@(DIFRFILE,DIFRR)) Q:DIFRR'>0  S DIFRX=^(DIFRR,0) D
	..S DIFRL=$P(DIFRX,"^",2)
	..S X=$P(DIFRX,"^")
	..K DA
	..D ^DIC
	..I Y'>0 D ERR("UNABLE TO ADD "_$P(DIFRX,"^")_" BLOCK") Q
	..K ^DIST(.404,+Y)
	..I '$D(^DD(+DIFRL)) D ERR("BLOCK: "_$P(DIFRX,"^")_" installed but associated file "_DIFRL_" missing")
	..M ^DIST(.404,+Y)=@DIFRSA@(DIFRFILE,DIFRR)
	..S DIK=DIC,DA=+Y
	..D IX1^DIK
	..Q
	.Q
	Q
	;
EPRE(DIFRFILE,DIFRIEN,DIFROIEN,DIFRNAME,DIFRSA)	; ENTRY-PRE
	;FILENUM,NEW_ENTRY_NUM,OLD_ENTRY_NUM,PKG/SUBSCRIPT_NAME,SOURCE_ARRAY
	; Entry Pre - delete template on target system
	N DIFRRDA,DIFRX,DIFRF
	S DIFRFILE=$G(DIFRFILE) S:DIFRFILE'>0 DIFRFILE=$G(XPDFIL)
	I DIFRFILE'>0 D ERR("FILE NUMBER") Q
	S DIFRIEN=$G(DIFRIEN) S:DIFRIEN'>0 DIFRIEN=$G(DA)
	I DIFRIEN'>0 D ERR("ENTRY NUMBER") Q
	S DIFROIEN=$G(DIFROIEN) S:DIFROIEN'>0 DIFROIEN=$G(OLDA)
	I DIFRIEN'>0 D ERR("OLD ENTRY NUMBER") Q
	I $G(DIFRNAME)="" D ERR("PACKAGE/SUBSCRIPT NAME MISSING") Q  ;GET VARIABLE FROM RON
	I $G(DIFRSA)="" S DIFRSA=$NA(^XTMP("XPDT",DIFRNAME,"KRN"))
	; build file root with entry number and kill entry on target system
	S DIFRRDA=$$CREF^DIQGU($$ROOT^DIQGU(DIFRFILE)_DIFRIEN)
	S DIFRX=$P(@DIFRRDA@(0),"^")
	S DIFRF=$S(DIFRFILE=.4:"DIPT",DIFRFILE=.402:"DIE",DIFRFILE=.401:"DIBT",DIFRFILE=.403:"DIST(.403,",DIFRFILE=.404:"DIST(.404,",1:"FUN")
	S ^TMP("DIFROMS",$J,DIFRF,DIFRX)=DIFRIEN
	K @DIFRRDA
	I DIFRFILE=.403 D  ;If Forms resolve Block Pointers
	.N DIFRA0,DIFRA1,DIFRA2,DIFRJ,DIFRL,DIFRP,DIFRX,DIFRY
	.S DIFRJ=0
	.F  S DIFRJ=$O(@DIFRSA@(DIFRFILE,DIFROIEN,40,DIFRJ)) Q:'DIFRJ  I $D(^(DIFRJ,0)) S DIFRP=$P(^(0),"^",2) D
	..S:DIFRP]"" DIFRP=$O(^DIST(.404,"B",DIFRP,0))
	..S:DIFRP $P(@DIFRSA@(DIFRFILE,DIFROIEN,40,DIFRJ,0),"^",2)=DIFRP
	..S DIFRL=0
	..F  S DIFRL=$O(@DIFRSA@(DIFRFILE,DIFROIEN,40,DIFRJ,40,DIFRL)) Q:'DIFRL  S DIFRA0=$G(^(DIFRL,0)),DIFRP=$P(DIFRA0,"^") I DIFRP]"" D
	...S DIFRP=$O(^DIST(.404,"B",DIFRP,0)) I DIFRP D
	....S $P(DIFRA0,"^")=DIFRP,@DIFRSA@(DIFRFILE,DIFROIEN,40,DIFRJ,"BLK",DIFRP,0)=DIFRA0
	....Q
	...Q
	..S DIFRA0=$G(@DIFRSA@(DIFRFILE,DIFROIEN,40,DIFRJ,40,0))
	..Q:DIFRA0=""
	..K @DIFRSA@(DIFRFILE,DIFROIEN,40,DIFRJ,40)
	..S (DIFRA1,DIFRA2)=0
	..S DIFRL=0
	..F  S DIFRL=$O(@DIFRSA@(DIFRFILE,DIFROIEN,40,DIFRJ,"BLK",DIFRL)) Q:'DIFRL  S @DIFRSA@(DIFRFILE,DIFROIEN,40,DIFRJ,40,DIFRL,0)=^(DIFRL,0),DIFRA1=DIFRL,DIFRA2=DIFRA2+1
	..S $P(DIFRA0,"^",3,4)=DIFRA1_"^"_DIFRA2
	..S @DIFRSA@(DIFRFILE,DIFROIEN,40,DIFRJ,40,0)=DIFRA0
	..K @DIFRSA@(DIFRFILE,DIFROIEN,40,DIFRJ,"BLK")
	..Q
	.Q
	Q
EPOST	; ENTRY-POST
	Q
FPOST	; FILE-POST      RECOMPILE TEMPLATES
	N DIFR,DIFR1,DIFR2,DMAX,X,Y
	K DIC,DLAYGO
	F DIFR="DIE","DIPT" D
	.I ^DD("VERSION")>17.4,'$D(DISYS) D OS^DII
	.E  S DISYS=^DD("OS")
	.Q:'$D(^DD("OS",DISYS,"ZS"))
	.S DIFR1=""
DZ1	.S DIFR1=$O(^TMP("DIFROMS",$J,DIFR,DIFR1)) Q:DIFR1=""
	.F DIFR2=0:0 S DIFR2=$O(^TMP("DIFROMS",$J,DIFR,DIFR1,DIFR2)) Q:'DIFR2  D
	..S Y=DIFR2
	..I $D(@("^"_DIFR_"(Y,""ROU"")")) K ^("ROU") I $D(^("ROUOLD")) S X=^("ROUOLD") D
	...S DMAX=^DD("ROU") D:X]"" @("EN^DI"_$E(DIFR,3)_"Z")
	...Q
	..Q
	.G DZ1
	K ^TMP("DIFROMS",$J)
	Q
INITCHK	; check
	;
	;
	I '$D(DIQUIET) N DIQUIET S DIQUIET=1
	I '$D(DIFM) N DIFM S DIFM=1
	I $G(U)'="^"!($G(DT)'>0)!($G(DTIME)'>0)!('$D(DUZ)) D DT^DICRW
	Q
	;
ERR(X)	S X(1)=X D BLD^DIALOG(1700,.X)
EXIT	I $G(DIFRMSGR)]"" D CALLOUT^DIEFU(DIFRMSGR)
	Q
