DIETLIB	;SFISC/MKO-LIBRARY FOR USER DEFINED DATA TYPES ;3NOV2012
	;;22.3T0;FILEMAN;;Mar 22, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	;
	;The following functions return, for a given data type, code to do
	;something, such as validate user input, or validate the internal
	;form of data.  The actual code to perform these functions may
	;reside under one of several methods, so a list of methods need
	;to be searched.
	;
	;Input to these methods are:
	;  DDTYP = the data type number
	;  DDTPRO(abbrev) = array of property values (passed by reference)
	;
	;Returned is:
	;  Validation code or null
	;
VALEXT(DDTYP,DDTPRO)	;Return code to validate and transform user input
	;  (and convert to internal form)
	;  (May be interactive)
	;  #21 - Interactive Validate and Transform Input
	;   #5 - Validate and Transform Input
	;   #1 - Old Input Transform
	N DDTMET,DDTCOD
	Q $$GETMETH(DDTYP,$$VALEXTL^DIETLIBF,.DDTPRO)
	;
VALEXTS(DDTYP,DDTPRO)	;Return code to validate and transform user input
	;  (and convert to internal form)
	;  (Non-interactive)
	;   #5 - Validate and Transform Input
	;   #1 - Old Input Transform
	N DDTMET,DDTCOD
	Q $$GETMETH(DDTYP,$$VALEXTSL^DIETLIBF,.DDTPRO)
	;
VALINT(DDTYP,DDTPRO)	;Return code to validate internal form
	;  #3 - Validate Internal Form
	;  #1 - Old Input Transform
	N DDTMET,DDTCOD
	Q $$GETMETH(DDTYP,$$VALINTL^DIETLIBF,.DDTPRO)
	;
XHELP(DDTYP,DDTPRO)	;Return xecutable help (interactive or regular)
	;  #22 - Interactive Executable Help
	;   #4 - Executable Help
	N DDTMET,DDTCOD
	Q $$GETMETH(DDTYP,$$XHELPL^DIETLIBF,.DDTPRO)
	;
	;****************************************************************
	;
GETMETH(DDTYP,DDTMETL,DDTVALS)	;Look for methods in the ;-delimited string
	;of method numbers.
	;Return the code for the first method found.
	;In:
	;  DDTYP   = data type number
	;  DDTMETL = list of method numbers to search for.
	;  .DDTVALS(abbrev) = array of property values (passed by reference)
	;
	N DDTCOD,DDTMET,DDTPC
	F DDTPC=1:1:$L(DDTMETL,";") S DDTMET=$P(DDTMETL,";",DDTPC) D  Q:$G(DDTCOD)]""
	. Q:'DDTMET
	. I $G(^DI(.81,DDTYP,201,DDTMET,31))]""  S DDTCOD=$$PARSE(^(31),.DDTVALS)
	. E  I $G(^DI(.81,DDTYP,201,DDTMET,31.1))]"" S DDTCOD=$$XCODE(^(31.1),.DDTVALS)
	;
	Q $G(DDTCOD)
	;
PARSE(DDTSTR,DDTVALS)	;Parse DDTSTR, replacing |abbr| with DDTVALS(abbr)
	;Two consecutive |s are replaced with a single |
	;|#FILE#| is replaced with DDTVALS("#FILE#")
	;|#FIELD#| is replaced with DDTVALS("#FIELD#")
	Q:$G(DDTSTR)="" ""
	Q:DDTSTR'["|" DDTSTR
	;
	N I,J,DDTABBR,DDTVAL,L,DDTWIND
	;
	S I=1 F  D  Q:'I
	. ;Find the next |
	. S I=$F(DDTSTR,"|",I) Q:'I
	. ;
	. ;Replace || with |
	. I $E(DDTSTR,I)="|" S $E(DDTSTR,I-1,I)="|" Q
	. ;
	. ;Find the next |, get the abbreviation and the property value
	. S J=$F(DDTSTR,"|",I) I 'J S I=0 Q
	. S DDTWIND=$E(DDTSTR,I,J-2)
	. S L=+$P(DDTWIND,",",2),DDTABBR=$P(DDTWIND,",")
	. S DDTVAL=$G(DDTVALS(DDTABBR))
	. S:L DDTVAL=$$QT(DDTVAL,L)
	. ;
	. ;Replace |abbr| with the value, update I
	. S $E(DDTSTR,I-1,J-1)=DDTVAL
	. S I=J+$L(DDTVAL)-$L(DDTWIND)-2
	Q DDTSTR
	;
XCODE(DDTCODE,DDTVALS)	;Execute DDTCODE, return value of X
	N X
	Q:$G(DDTCODE)="" ""
	;
	S DDTCODE=$$PARSE(DDTCODE,.DDTVALS)
	X DDTCODE
	Q $G(X)
	;
XCODEM(DDTCODE,DDTVALS,DDTOUT)	;Execute DDTCODE,
	;  Return values in DDTOUT array
	;In:
	;  DDTCODE = code to execute (may contain |s); sets X or X array
	;  DDTVALS(abbrev) = array of property values
	;Out:
	;  .DDTOUT = X array set by DDTCODE
	;
	N X K DDTOUT
	Q:$G(DDTCODE)="" ""
	;
	S DDTCODE=$$PARSE(DDTCODE,.DDTVALS)
	X DDTCODE
	K DDTOUT M DDTOUT=X
	Q
	;
	;*************************************************************
GETPROP(DDTYPE,DDT101)	;Get and/or prompt for all properties
	; of a data type
	;In:
	;  DDTYPE = data type number
	;Out:
	;  DI101 array:
	;    DDT101(prop#,0) = prop#^abbreviation
	;    DDT101(prop#,1) = value of property
	;    DDT101(prop#,2) = executable value
	;    DDT101(prop#,3,n,0) = descendant n
	;  DUOUT = 1 : if user ^'d or timed out
	;
	N DTOUT
	N DDTORD,DDTPROP,DDTVAL,DDTVALS
	;
	;Loop through properties of data type by order
	S DDTORD=0
	F  S DDTORD=$O(^DI(.81,DDTYPE,101,"AC",DDTORD)) Q:'DDTORD!$D(DUOUT)  D
	. S DDTPROP=$O(^DI(.81,DDTYPE,101,"AC",DDTORD,"")) Q:'DDTPROP
	. Q:$D(^DI(.86,DDTPROP,0))[0
	. ;
	. ;Get or prompt for property
	. K DDTVAL
	. D GET1PROP(DDTYPE,DDTPROP,.DDTVALS,.DDTVAL,.DDTEXEC) Q:$D(DUOUT)
	. D SAVE(DDTYPE,DDTPROP,.DDTVALS,.DDTVAL,$G(DDTEXEC),.DDT101)
	;
	K:$D(DUOUT) DDT101
	Q
	;
GET1PROP(DDTYPE,DDTPROP,DDTVALS,DDTVAL,DDTEXEC)	;Get or prompt for property
	;In:
	;  DDTYPE = data type number
	;  DDTPROP = property number
	;
	;In/Out:
	;  DDTVALS(abbrev) = values of properties
	;
	;Out:
	;  DDTVAL = value of property
	;  DDTVAL(n) = descendant (sub) values of property
	;  DDTEXEC = 1 : value is an executable value
	;  DUOUT = set on up-arrow or time-out
	;
	N DDTPRMPT,DDTEXEC,DDTABBR,DTOUT
	;
	;Get default
	I $G(^DI(.81,DDTYPE,101,DDTPROP,31.2))]"" S DDTVAL=$$PARSE(^(31.2),.DDTVALS),DDTEXEC=1
	E  I $G(^DI(.81,DDTYPE,101,DDTPROP,31))]"" S DDTVAL=$$PARSE(^(31),.DDTVALS)
	E  I $G(^DI(.81,DDTYPE,101,DDTPROP,31.1))]"" S DDTVAL=$$XCODE(^(31.1),.DDTVALS)
	E  S DDTVAL=""
	;
	;Should user be prompted for value?
	S DDTPRMPT=1
	I $G(^DI(.81,DDTYPE,101,DDTPROP,10))]"" X ^(10) S DDTPRMPT=$T
	;
	;If so, prompt
	I DDTPRMPT D  I $D(DUOUT) S DDTVAL="" Q
	. ;If there's Get Code, execute it
	. I $G(^DI(.86,DDTPROP,51))]"" D
	.. D XCODEM(^DI(.86,DDTPROP,51),.DDTVALS,.DDTVAL)
	.. S:$D(DDTVAL)[0 DUOUT=1
	. ;
	. ;Otherwise, use ^DIR to get value of property
	. E  D DIR(DDTPROP,.DDTVALS,.DDTVAL)
	;
	;Store value in DDTVALS(abbrev) array
	S DDTABBR=$P(^DI(.86,DDTPROP,0),U,2)
	S:DDTABBR]"" DDTVALS(DDTABBR)=DDTVAL
	Q
	;
SAVE(DDTYPE,DDTPROP,DDTVALS,DDTVAL,DDTEXEC,DDT101)	;Save property values
	;  in DDT101 array
	;In:
	;  DDTYPE = data type number
	;  DDTPROP = property number
	;  DDTVAL  = value of property DDTPROP
	;  DDTEXEC = 1 : flag, DDTVAL is an executable
	;
	;Out:
	;  DDT101 array:
	;
	N DDTABBR,I
	Q:'$G(DDTYPE)=""
	Q:'$G(DDTPROP)
	Q:'$D(DDTVAL)
	;
	S DDTABBR=$P($G(^DI(.86,DDTPROP,0)),U,2) Q:DDTABBR=""
	;
	;Set the DDT101 array
	K DDT101(DDTPROP)
	S DDT101(DDTPROP,0)=DDTPROP_U_DDTABBR
	S DDT101(DDTPROP,1+$G(DDTEXEC))=DDTVAL
	;
	I $D(DDTVAL)>9 S I="" F  S I=$O(DDTVAL(I)) Q:I=""  D
	. I $D(DDTVAL(I))#2 S DDT101(DDTPROP,3,I,0)=DDTVAL(I)
	. E  I $D(DDTVAL(I,0))#2 S DDT101(DDTPROP,3,I,0)=DDTVAL(I,0)
	Q
	;
DIR(DDTPROP,DDTVALS,DDTVAL)	;Do a ^DIR read to get value for property
	;In:
	;  DDTPROP = property number
	;  DDTVALS(abbrev) = array of previously obtained property values
	;  DDTVAL = default value
	;Out:
	;  DDTVAL = obtained value
	;
	;May also return DUOUT
	;
	N I,J,X,Y,DIR,DIRUT,DIROUT,DTOUT
	;
	;Get DIR(0), convert |abbr| to values
	S DIR(0)=$$PARSE($G(^DI(.86,DDTPROP,42)),.DDTVALS)
	I DIR(0)="" S DDTVAL="" Q
	;
	;Put Prompt into DIR("A")
	S (I,J)=0
	F  S I=$O(^DI(.86,DDTPROP,43,I)) Q:'I  D:$D(^(I,0))#2
	. S J=J+1
	. S DIR("A",J)=^DI(.86,DDTPROP,43,I,0)
	I J S DIR("A")=DIR("A",J) K DIR("A",J)
	;
	;Put Help into DIR("?")
	S (I,J)=0
	F  S I=$O(^DI(.86,DDTPROP,44,I)) Q:'I  D:$D(^(I,0))#2
	. S J=J+1
	. S DIR("?",J)=^DI(.86,DDTPROP,44,I,0)
	I J S DIR("?")=DIR("?",J) K DIR("?",J)
	;
	S:$G(DDTVAL)]"" DIR("B")=DDTVAL
	S:$G(^DI(.86,DDTPROP,45))]"" DIR("S")=^(45)
	S:$G(^DI(.86,DDTPROP,46))]"" DIR("T")=^(46)
	;
	D ^DIR
	S:$D(DTOUT) DUOUT=1
	I $D(DUOUT) S DDTVAL="" Q
	;
	S DDTVAL=Y
	Q
	;
	;*************************************************************
	;
QT(X,L)	;Return X with one quote replaced with 2 quotes
	;Repeat the process L times
	N I,J,K
	Q:$G(L)=0 X
	S:'$G(L) L=1
	;
	F I=1:1:L D
	. S Y=""
	. S J=1,K=1 F  S K=$F(X,"""",J) Q:'K  D
	.. S Y=Y_$E(X,J,K-1)_""""
	.. S J=K
	. S X=Y_$E(X,J,999)
	Q X
	;
UC(X)	;Return X in uppercase
	Q $TR(X,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
	;
LC(X)	;Return X in lowercase
	Q $TR(X,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz")
	;
ABS(X)	;Return the absolute value of X
	Q $S(X<0:-X,1:+X)
