DIFROMS6	;SCISC/DCL-DIFROM SERVER PROCESS TEMPLATES IN;03:07 PM  25 Mar 1994;
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	Q
	;
EDEIN	;EXTENDED DATABASE ELEMENTS IN
	N DIFRDSV,DIFRF,DIFRGBL,DIFRSEC,DIFRTRT
	I $G(DIFRIEN)>0 G EDE
	N DIFRIENX,DIFRIENZ
	S DIFRIENX=$O(@DIFRLST@(0)),DIFRIENZ=$D(@DIFRLST@(DIFRIENX,0))#2,DIFRIENX=0
	F  S DIFRIENX=$O(@DIFRLST@(DIFRIENX)) Q:DIFRIENX'>0  D
	.I DIFRIENZ S DIFRIEN=+@DIFRLST@(DIFRIENX,0) S:DIFRIEN'>0 DIFRIEN=DIFRIENX D EDE Q
	.S DIFRIEN=+@DIFRLST@(DIFRIENX) S:DIFRIEN'>0 DIFRIEN=DIFRIENX D EDE Q
	Q
EDE	;
	;  DIFRTRT=FULL ROOT IN DIST ARRAY
	;  DIFRDSV=0TH NODE OF TEMPLATE
	;         :.401, .4, .402
	;         :TEMPL NAME^DATE CREATED^READ^FILENR^DUZ^WRITE^DATE LAST USED
	;         :.403
	;         :FORM NAME^READ^WRITE^DUZ^DATE CREATED^DATA LAST USED^^FILE^
	;  DIFRSEC=FILE SECURITY 1=EXPORT SECURITY,0=NO FILE SECURITY
	;  DIFRIEN=TEMPLATE'S INTERNAL ENTRY NUMBER
	;         :.5 (FUNCTIONS)
	S DIFRTRT=$NA(@DIFRTA@(DIFRFILE,DIFRIEN))
	;
ERR(X,Y)	;
	S X(1)=X D BLD^DIALOG(Y,.X)
	Q
