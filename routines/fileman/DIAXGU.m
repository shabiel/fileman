DIAXGU	;SFISC/DCM-EXTRACT FUNCTIONS ;9/2/94  06:40
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
LOOKUP	D SETX G Q:$D(DIAXMSG)!$G(DIAXOUT)
	D ET
Q	K X,X1,^UTILITY("DIQ1",$J),DIQ
	Q
	;
SETX	I '$D(DIAX(DILL,"MUL")) S DIC=DIAX(DILL,"FILE"),DA=DIAX(DILL,"FE"),DR=".01" I '$D(@(DIAX(DILL,"FGBL")_DA_",0)")) D ERR^DIAXERR(97,DIAXFN_U_DIAXFE_U_DIAX(1,.01)) D FIX^DIAXU2 Q
	S DIQ(0)="EIN" D EN^DIQ1
	S X=^UTILITY("DIQ1",$J,DIAX(DILL,"FILE"),DIAX(DILL,"FE"),.01,"E"),X1=^("I")
	I DILL=1 S DIAX(DILL,.01)=X
	I $D(DIAX(DILL,"MUL")),$G(DIAXSCR(DIAX(DILL,"FILE")))]"" D
	.N X S X=X1 X DIAXSCR(DIAX(DILL,"FILE")) S:'$T DIAXOUT=1
	Q
	;
ET	I '$D(DIAX(DILL,"MUL")) K DA,DIC,DR
	I DIAX(DILL,"XREF")=2 S ^TMP("DIAX",$J,DIAXET(DILL,"FILE"),"MODE")="M" Q
	S ^TMP("DIAX",$J,DIAXET(DILL,"FILE"),"X")=X,^("MODE")="A"
	I $D(DIAX(DILL,"MUL"))!(DIAX(DILL,"XREF")?1A.E) S ^TMP("DIAX",$J,DIAXET(DILL,"FILE"),"DIC(""P"")")=DIAXET(DILL,"FILE")
	Q
