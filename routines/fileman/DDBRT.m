DDBRT	;SFISC/DCL-BROWSER TEST ROUTINE ;NOV 04, 1996@13:55
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	Q
TEST()	;TEST IF CRT CAN USE BROWSER;USER MUST GO THRU ZU OR XUP FIRST
	Q:$G(IOST(0)) $$GET(+IOST(0))
	Q:$G(IOS) $$GET($$GET1^DIQ(3.5,+IOS,"SUBTYPE","I"))
	Q:$G(^XUTL("XQ",$J,"IOST(0)")) $$GET(+^("IOST(0)"))
	Q:$G(^XUTL("XQ",$J,"IOS")) $$GET($$GET1^DIQ(3.5,+^("IOS"),"SUBTYPE","I"))
	Q 0
GET(DDBRTIEN)	;
	I $$GET1^DIQ(3.2,DDBRTIEN,"SET TOP & BOTTOM MARGINS")="" Q 0
	I $$GET1^DIQ(3.2,DDBRTIEN,"REVERSE INDEX")="" Q 0
	Q 1
