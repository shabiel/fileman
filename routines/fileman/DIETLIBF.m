DIETLIBF	;SFISC/MKO/GFT-LIBRARY FOR FIELD ATTRIBUTES ;17NOV2012
	;;22.3T0;FILEMAN;;Mar 22, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	;
	;The following functions return, for a given file and field,
	;code to do something, such as validate user input, or validate
	;the internal form of data. The actual code to perform these
	;functions may reside under one of several methods, so a list of
	;methods need to be searched.
	;
	;Input to these methods are:
	;  DDTFILE = File #
	;  DDTFIELD = Field #
	;
	;Returned is:
	;  Code for method or null
	;
VALEXT(DDTFILE,DDTFIELD)	;Return code to validate and transform user input
	;May be interactive
	Q $$GETMETH(.DDTFILE,.DDTFIELD,$$VALEXTL)
	;
VALEXTS(DDTFILE,DDTFIELD)	;Return code to silently validate and transform user input
	;Non-interactive
	N D,%
	S %=$$GETMETH(.DDTFILE,.DDTFIELD,$$VALEXTSL) I %["+X" S %="K:X?16.N.E X I $D(X) "_% ;DON'T TRY TO "+" A HUGE NUMBER
	S D=$F(%,"%DT=""E") I D>0 S %=$E(%,1,D-2)_$E(%,D,9999)
	Q "N %T,%DT,C,DIG,DIH,DIU,DIV,DICR "_% ;PRESERVE VARIABLES 
	;
VALINT(DDTFILE,DDTFIELD)	;Return code to validate internal form
	Q $$GETMETH(.DDTFILE,.DDTFIELD,$$VALINTL)
	;
XHELP(DDTFILE,DDTFIELD)	;Return the executable help of a field
	Q $$GETMETH(.DDTFILE,.DDTFIELD,$$XHELPL)
	;
OUTPUT(DDTFILE,DDTFIELD)	;Return the executable code to output a field's value.  No arguments means ^DD(DDTFILE,DDTFIELD,0) is already in naked ref
	Q $$GETMETH(.DDTFILE,.DDTFIELD,$$OUTPUTL)
	;
	;****************************************************************
	;The following functions return a string of method numbers to search
	;
VALEXTL()	Q "INTERACTIVE VALIDATE AND INPUT TRANSFORM;VALIDATE AND TRANSFORM INPUT;INPUT TRANSFORM"
VALEXTSL()	Q "VALIDATE AND TRANSFORM INPUT;INPUT TRANSFORM"
VALINTL()	Q "VALIDATE INTERNAL FORM;INPUT TRANSFORM"
XHELPL()	Q "INTERACTIVE EXECUTABLE HELP;EXECUTABLE HELP"
OUTPUTL()	Q "OUTPUT TRANSFORM"
	;
	;****************************************************************
	;
GETMETH(DDTFILE,DDTFIELD,DDTMETL)	;Look for methods in the ;-delimited string
	;of method numbers.
	;Return the code for the first non-null method found.
	;In:
	;  DDTFILE  = file #
	;  DDTFIELD = field #
	;  DDTMETL  =  ;-delimited list of methods to search for
	;
	N REF
	Q:" "[$G(DDTMETL) ""
	I '$G(DDTFILE)!'$G(DDTFIELD) S REF=$NA(^(0)) Q:REF'?1"^DD(".E "" ;^DD(DDTFILE,DDTFIELD,0) is already in naked ref
	E  S REF=$NA(^DD(DDTFILE,DDTFIELD,0))
	;
	N DDTCOD,DDTMET,DDTPC,I
	F DDTPC=1:1:$L(DDTMETL,";") S DDTMET=$P(DDTMETL,";",DDTPC) D:DDTMET]""  Q:$G(DDTCOD)]""
	. I DDTMET="INPUT TRANSFORM",$P($G(@REF),U,5,999)]"" S DDTCOD=$P(^(0),U,5,999) Q
	. I DDTMET="OUTPUT TRANSFORM",@REF]"",$G(^(2))'?."^" S DDTCOD=^(2) Q
	. I DDTMET="EXECUTABLE HELP",@REF]"",$G(^(4))'?."^" S DDTCOD=^(4) Q
	. S I=+$P($P($G(@REF),U,2),"t",2)
	. S DDTMET=$O(^DI(.87,"B",DDTMET,""),-1) I DDTMET,$G(^DI(.81,I,201,DDTMET,31))'?."^" S DDTCOD=^(31)
	;
	Q $G(DDTCOD)
	;
	;****************************************************************
	;
GETPROP(DDTFILE,DDTFIELD,DDTABLST,DDTRET)	;Return data type properties
	;Looks in ^DD(DDTFILE,DDTFIELD,101).
	;In:
	;  DDTFILE  = file #
	;  DDTFIELD = field #
	;  DDTABLST = ;-delimited list of property abbreviations, or * for all
	;  DDTRET   = name of variable to put results
	;Out:
	;  DDTRET(abbrev)   = value
	;  DDTRET(abbrev,n) = value of ^DD(file#,field#,101,prop#,3,n,0)
	;
	;If file and field are not passed in, then assume the properties are
	;already in the DIR array, and Merge DIR into DDTRET.
	I $G(DDTFILE)=""!($G(DDTFIELD)="") M:$D(DIR) DDTRET=DIR Q
	;
	N DDTPROP,DDTABBR,DDTLINE,X
	;
	S:$G(DDTABLST)="" DDTABLST="*"
	S:DDTABLST'="*" DDTABLST=";"_DDTABLST_";"
	;
	;Loop through the properties multiple in ^DD(file#,field#,101)
	S DDTPROP=0
	F  S DDTPROP=$O(^DD(DDTFILE,DDTFIELD,101,DDTPROP)) Q:'DDTPROP  D
	. ;Get the abbreviation
	. S DDTABBR=$P(^DD(DDTFILE,DDTFIELD,101,DDTPROP,0),U,2)
	. I DDTABLST'="*",DDTABLST'[(";"_DDTABBR_";"),DDTABLST'[(";"_DDTPROP_";") Q
	. ;
	. ;Get the value from the 1 node, or execute the 2 node to get
	. ;the value.
	. I $D(^DD(DDTFILE,DDTFIELD,101,DDTPROP,1))#2 S DDTRET(DDTABBR)=^(1)
	. E  I $D(^DD(DDTFILE,DDTFIELD,101,DDTPROP,2))#2 D
	.. K X X ^DD(DDTFILE,DDTFIELD,101,DDTPROP,2)
	.. S:$D(X) DDTRET(DDTABBR)=X
	. E  Q
	. ;
	. ;Get the values under node ^DD(file#,field#,101,prop#,3)
	. S DDTLINE=0
	. F  S DDTLINE=$O(^DD(DDTFILE,DDTFIELD,101,DDTPROP,3,DDTLINE)) Q:'DDTLINE  D
	.. S:$D(^DD(DDTFILE,DDTFIELD,101,DDTPROP,3,DDTLINE,0))#2 DDTRET(DDTABBR,DDTLINE)=^(0)
	;
	;Get the nodes under ^DD(file#,field#,301)
	M:DDTABLST="*"!(DDTABLST[";301;") DDTRET=^DD(DDTFILE,DDTFIELD,301)
	Q
