DICATTUD	;SFISC/MKO-USER DEFINED DATA TYPES ;5DEC2012
	;;22.3T0;FILEMAN;;Mar 22, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	;;1.0
	D EN(A,DA,N,O) ;Come from DICATT (roll-and-scroll mode)
	G ^DICATT1
	;
	;
	;
SCREENMN	;Come from DICATTD (ScreenMan mode)
	N L,M,C,Z,DIZ,DI101,DI201,DIALLVAL,DIVAL
	D EN(DICATTA,DICATTF,X,DICATT4]"")
	S DICATT2N=$P(DIZ,U),DICATT3N="" ;OUCH!  DIZ HAD A TERMINATING "^"
	S DICATT5N=C,DICATTLN=L
	S DICATTMN=""
	QUIT
	;
	;
	;
	;
	;
	;In: N  = data type number
	;    O  = 0 : if new field
	;    A  = file #
	;    DA = field #
	;
	;Out: DI101 and DI201 arrays (to be merged into ^DD(file#,field#)
	;     L = Maximum internal length
	;     M = Help text
	;  M(2) = 1 : user changed a default on an old field
	;     C = Old input transform (5-99)
	; DIZ,Z = dataTypeAbbrev_t#, where # is the data type number
	;
	;Variables used:
	; DIVAL = obtained property value
	; DIVALS(abbrev) = array of property values (already obtained)
	; DIVALS("DIDEF") = default property value presented to user
	; DICHANGE = 1 : if user changed a default value (set in PROP)
	;
EN(A,DA,N,O)	;
	K DI101,DI201,M(2)
	N DIMETH,DIORD,DIPROP,DIVALS,DICHANGE
	;
	S DIVALS("#FILE#")=A
	S DIVALS("#FIELD#")=DA
	;
	;Loop through properties in Data Type file, by Order, and get values
	S DIORD=""
	F  S DIORD=$O(^DI(.81,N,101,"AC",DIORD)) Q:'DIORD!$D(DUOUT)!$D(DTOUT)  D
	. S DIPROP=$O(^DI(.81,N,101,"AC",DIORD,"")) Q:'DIPROP
	. D PROP(N,DIPROP,.DIVALS)
	;
	;If user ^-d or timed out, go back to delete field and reprompt
	I $D(DUOUT)!$D(DTOUT) K DUOUT,DI101,DI201 G CHECK^DICATT
	;
	;Loop through methods in Data Type file
	S DIMETH=0
	F  S DIMETH=$O(^DI(.81,N,201,DIMETH)) Q:'DIMETH  D
	. S DIVAL=$$GETMETH^DIETLIB(N,DIMETH,.DIVALS)
	. ;If there's an OLD INPUT TRANSFORM, it needs to be retreived even
	. ;if it is null, so that the 2 node can be killed and the 'O'
	. ;removed from ^DD(...0)
	. I DIVAL]""!(DIMETH=2) D
	.. S DI201(DIMETH,0)=DIMETH
	.. S DI201(DIMETH,1)=DIVAL
	;
	;Set L and M
	K M
	S L=$G(DIVALS("MAXL"),30)
	S:$G(DIVALS("HELP"))]"" M=DIVALS("HELP")
	I $G(DICHANGE),O S M(2)=1
	;
	;Put input transform in C; don't need to store in ^DD(file#,field#,201)
	;Set Z and DIZ
	S C=$G(DI201(1,1),"Q") K DI201(1)
	S Z=$P($G(^DI(.81,N,0)),U,2) S:Z="" Z="F"
	S (DIZ,Z)=Z_"t"_N_U
	;
	QUIT
	;
	;
	;
PROP(N,DIPROP,DIVALS)	;Get a property
	N DIPROMPT,DIVAL,DIEXEC
	K DIVALS("DIDEF")
	;
	;If there's an Executable Default, get value
	I $G(^DI(.81,N,101,DIPROP,31.2))'?."^" D
	. S DIEXEC=1
	. S DIVAL=$G(^DD(A,DA,101,DIPROP,2))
	. I 'O!$G(DICHANGE),^DI(.81,N,101,DIPROP,31.2)["|" S DIVAL=$$PARSE^DIETLIB(^(31.2),.DIVALS)
	. S DIVALS("DIDEF")=DIVAL
	;
	;Otherwise, get regular default
	E  S (DIVAL,DIVALS("DIDEF"))=$$GETDEF(N,DIPROP,.DIVALS)
	;
	;Should user be prompted for value?
	S DIPROMPT=1
	I $G(^DI(.81,N,101,DIPROP,10))'?."^" X $$PARSE^DIETLIB(^(10)) S DIPROMPT=$T
	;
	;If so, prompt for DIVAL
	I DIPROMPT D
	. ;If there's Get Code, execute it
	. I $G(^DI(.86,DIPROP,51))'?."^" D
	.. D XCODEM^DDTLIB(^DI(.86,DIPROP,51),.DIVALS,.DIVAL)
	.. S:$D(DIVAL)[0 DUOUT=1
	. ;
	. ;Otherwise, use ^DIR to get value of property
	. E  S DIVAL=$$DIR(DIPROP,.DIVALS)
	. Q:$D(DUOUT)!$D(DTOUT)
	. S:DIVAL'=DIVALS("DIDEF") DICHANGE=1
	;
	Q:$D(DUOUT)!$D(DTOUT)
	D SAVE(DIPROP,.DIVAL,.DIVALS,.DI101,$G(DIEXEC))
	Q
	;
SAVE(DIPROP,DIVAL,DIVALS,DI101,DIEXEC)	;Save the value of the property
	; in DIVALS(abbr) and DI101
	;DIVAL is the value of the property
	;DIEXEC = 1 : if value is an executable
	;
	;Returns:
	;  DIVALS(abbr)= array property values
	;  DI101(prop#,0)=prop#^abbrev
	;  DI101(prop#,1)=value
	;   or         2)=executable value
	;  DI101(prop#,3,n,0) = descendent node n of DIVAL
	;
	N DIABBR
	;
	;Set the DIVALS array
	S DIABBR=$P(^DI(.86,DIPROP,0),U,2)
	S:DIABBR]"" DIVALS(DIABBR)=DIVAL
	;
	;Set the DI101 array
	I DIVAL]"" D
	. S DI101(DIPROP,0)=DIPROP_U_DIABBR
	. S DI101(DIPROP,1+$G(DIEXEC))=DIVAL
	. I $D(DIVAL)>9 N I S I="" F  S I=$O(DIVAL(I)) Q:I=""  D
	.. I $D(DIVAL(I))#2 S DI101(DIPROP,3,I,0)=DIVAL(I)
	.. E  I $D(DIVAL(I,0))#2 S DI101(DIPROP,3,I,0)=DIVAL(I,0)
	.. E  Q
	.. S:$D(DI101(DIPROP,3,0))[0 DI101(DIPROP,3,0)=U_$P(^DD(.0101,3,0),U,2)
	;
	;Execute the post action
	X:$G(^DI(.81,N,101,DIPROP,61))'?."^" $$PARSE^DDTLIB(^(61))
	Q
	;
DIR(DIPROP,DIVALS)	;Do a ^DIR read to get value for property
	N I,J,X,Y,DIR,DIRUT,DIROUT
	;
	;Get DIR(0), convert |abbr| to values
	S DIR(0)=$$PARSE^DDTLIB($G(^DI(.86,DIPROP,42)),.DIVALS)
	Q:DIR(0)="" ""
	;
	;Put Prompt into DIR("A")
	S (I,J)=0
	F  S I=$O(^DI(.86,DIPROP,43,I)) Q:'I  D:$D(^(I,0))#2
	. S J=J+1
	. S DIR("A",J)=^DI(.86,DIPROP,43,I,0)
	I J S DIR("A")=DIR("A",J) K DIR("A",J)
	;
	;Put Help into DIR("?")
	S (I,J)=0
	F  S I=$O(^DI(.86,DIPROP,44,I)) Q:'I  D:$D(^(I,0))#2
	. S J=J+1
	. S DIR("?",J)=^DI(.86,DIPROP,44,I,0)
	I J S DIR("?")=DIR("?",J) K DIR("?",J)
	;
	S:$G(DIVALS("DIDEF"))]"" DIR("B")=DIVALS("DIDEF")
	S:$G(^DI(.86,DIPROP,45))]"" DIR("S")=^(45)
	S:$G(^DI(.86,DIPROP,46))]"" DIR("T")=^(46)
	;
	D ^DIR
	Q Y
	;
GETDEF(N,DIPROP,DIVALS)	;Get defaults for a property.
	;May come from the ^DD or the data type file.
	N DIDEF
	;
	;Get value from ^DD
	S DIDEF=$S(DIPROP=3:$G(^DD(A,DA,3)),1:$G(^DD(A,DA,101,DIPROP,1)))
	;
	;For existing fields, return default from ^DD(file#,field#)
	;if the user hasn't changed any property values
	I O,'$G(DICHANGE) Q DIDEF
	;
	;Otherwise, look at default from Data Type file.
	;For existing fields where default contains no |abbr|,
	;return value from DD.
	;
	;Default
	Q:$G(^DI(.81,N,101,DIPROP,31))]"" $S(^(31)'["|"&O:DIDEF,1:$$PARSE^DIETLIB(^(31),.DIVALS))
	;
	;Build Default
	Q:$G(^DI(.81,N,101,DIPROP,31.1))]"" $S(^(31.1)'["|"&O:DIDEF,1:$$XCODE^DIETLIB(^(31.1),.DIVALS))
	;
	Q DIDEF
