DMLAI007	; ; 06-DEC-2012
	;;22.2T1;VA FILEMAN;;Dec 14, 2012
	;Per VHA Directive 2004-038, this routine should not be modified.
	Q:'DIFQR(.85)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,999) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q	Q
	;;^UTILITY(U,$J,.85,513,0)
	;;=VENDA^VE^VEN
	;;^UTILITY(U,$J,.85,514,0)
	;;=VIETNAMESE^VI^VIE
	;;^UTILITY(U,$J,.85,515,0)
	;;=VOLAPUK^VO^VOL
	;;^UTILITY(U,$J,.85,516,0)
	;;=VOTIC^^VOT
	;;^UTILITY(U,$J,.85,517,0)
	;;=WALLOON^WA^WLN
	;;^UTILITY(U,$J,.85,518,0)
	;;=WARAY^^WAR
	;;^UTILITY(U,$J,.85,519,0)
	;;=WASHO^^WAS
	;;^UTILITY(U,$J,.85,520,0)
	;;=WELSH^CY^CYM^^WEL
	;;^UTILITY(U,$J,.85,521,0)
	;;=WOLAITTA^^WAL
	;;^UTILITY(U,$J,.85,521,1,0)
	;;=^.8501^1^1
	;;^UTILITY(U,$J,.85,521,1,1,0)
	;;=WOLAYTTA
	;;^UTILITY(U,$J,.85,522,0)
	;;=WOLOF^WO^WOL
	;;^UTILITY(U,$J,.85,523,0)
	;;=XHOSA^XH^XHO
	;;^UTILITY(U,$J,.85,524,0)
	;;=YAKUT^^SAH
	;;^UTILITY(U,$J,.85,525,0)
	;;=YAO^^YAO
	;;^UTILITY(U,$J,.85,526,0)
	;;=YAPESE^^YAP
	;;^UTILITY(U,$J,.85,527,0)
	;;=YIDDISH^YI^YID
	;;^UTILITY(U,$J,.85,528,0)
	;;=YORUBA^YO^YOR
	;;^UTILITY(U,$J,.85,529,0)
	;;=ZAPOTEC^^ZAP
	;;^UTILITY(U,$J,.85,530,0)
	;;=ZAZA^^ZZA
	;;^UTILITY(U,$J,.85,530,1,0)
	;;=^.8501^5^5
	;;^UTILITY(U,$J,.85,530,1,1,0)
	;;=DIMILI
	;;^UTILITY(U,$J,.85,530,1,2,0)
	;;=DIMLI
	;;^UTILITY(U,$J,.85,530,1,3,0)
	;;=KIRDKI
	;;^UTILITY(U,$J,.85,530,1,4,0)
	;;=KIRMANJKI
	;;^UTILITY(U,$J,.85,530,1,5,0)
	;;=ZAZAKI
	;;^UTILITY(U,$J,.85,531,0)
	;;=ZENAGA^^ZEN
	;;^UTILITY(U,$J,.85,532,0)
	;;=ZHUANG^ZA^ZHA
	;;^UTILITY(U,$J,.85,532,1,0)
	;;=^.8501^1^1
	;;^UTILITY(U,$J,.85,532,1,1,0)
	;;=CHUANG
	;;^UTILITY(U,$J,.85,533,0)
	;;=ZULU^ZU^ZUL
	;;^UTILITY(U,$J,.85,534,0)
	;;=ZUNI^^ZUN
