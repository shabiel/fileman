DIRUD	;SFISC/MKO-USER DEFINED DATA TYPES ;3NOV2012
	;;22.3T0;FILEMAN;;Mar 22, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
SETUP	;Setup local variables
	;Out:
	;  %U  = datatype number
	;  %V  = code to validate input
	;  %O  = output transform
	;  DIR("abbrev") = value of property
	;  %W0 = help text
	;  %W1 = executable help text
	;  %P  = prompt
	;If problem:
	;  Y  = -1
	;  %T = ""
	;
	N %,%PRO,%ABR,%ERR,%MET
	S %U=+$E(%A,2,999)
	G:'%U ERR
	G:$D(^DI(.81,%U,0))[0 ERR
	;
	;Loop through and get values for data type properties
	;Put values into DIR(abbrev) array.
	;Make sure all required properties are supplied.
	S %=0
	F  Q:$G(%ERR)  S %=$O(^DI(.81,%U,101,"AC",%)) Q:'%  S %PRO=$O(^(%,0)) D:%PRO
	. S %ABR=$P($G(^DI(.86,%PRO,0)),U,2) Q:%ABR=""
	. Q:$D(DIR(%ABR))#2
	. I $G(^DI(.81,%U,101,%PRO,31))]"" S DIR(%ABR)=$$PARSE^DIETLIB(^(31),.DIR)
	. E  I $G(^DI(.81,%U,101,%PRO,31.1))]"" S DIR(%ABR)=$$XCODE^DIETLIB(^(31.1),.DIR)
	. E  I $P(^DI(.81,%U,101,%PRO,0),U,3) S %ERR=1
	G:$G(%ERR) ERR
	;
	;Get code to validate input.
	S %V=$$VALEXT^DIETLIB(%U,.DIR)
	K:%V="" %V
	;
	;Get output transform
	K %O
	I $G(^DI(.81,%U,201,2,31))]"" S %O=$$PARSE^DIETLIB(^(31),.DIR)
	E  I $G(^DI(.81,%U,201,2,31.1))]"" S %O=$$XCODE^DIETLIB(^(31.1),.DIR)
	;
	;Set %W0 equal to help text (or ^executable help) from DIR("?")
	;  or DIR("HELP"), or from Data Type file.
	;Set %W1 equal to executable help from Data Type file
	S %W0=""
	I $D(DIR("?"))#2 S %W0=DIR("?")
	E  D
	. I $D(DIR("HELP"))#2 S %W0=DIR("HELP")
	. I $G(^DI(.81,%U,201,4,31))]"" S %W1=$$PARSE^DIETLIB(^(31),.DIR)
	. E  I $G(^DI(.81,%U,201,4,31.1))]"" S %W1=$$XCODE^DIETLIB(^(31.1),.DIR)
	I $G(%W0)="",$G(%W1)="" S %W0="This response must be a "_$P(^DI(.81,%U,0),U)_"."
	;
	;Set %P equal to prompt
	S %P=$P(^DI(.81,%U,0),U,3)
	I %P]"" S:%P'?.E1" " %P=%P_" "
	E  S %P="Enter response: "
	Q
	;
ERR	;Error condition
	S %T="",Y=-1
	Q
	;
VAL	;Validate X; if valid, echo external form
	;In:
	;  X    = user response
	;  %V   = validation code (kills X if invalid)
	;  %O   = output transform (transform Y)
	;  DIR("S") = screen (sets $T based on internal form in Y)
	;
	;Out:
	;  X    = unprocessed response
	;  Y    = internal form
	;  Y(0) = external form
	;If not valid:
	;  X,Y  = unprocessed response
	;  %E   = 1
	;
	N %X,%Y
	;
	;Save X (the unprocessed response) in %X and validate
	S %X=X
	I $G(%V)]"" X %V I '$D(X) S %E=1,(X,Y)=%X Q
	;
	;Save X (the internal form) in %Y
	S %Y=X
	;
	;Pass through DIR("S") check
	I $G(DIR("S"))]"" S Y=%Y X DIR("S") E  S %E=1,(X,Y)=%X Q
	;
	;Run through output transform, save external form in Y(0)
	K Y I $G(%O)]"" S Y=X X %O S Y(0)=Y
	;
	;Set Y=internal form; X=unprocessed response
	S Y=%Y,X=%X
	;
	;Echo answer
	I %A'["V",$D(DIR("V"))[0,'$D(DDS),'$D(DIQUIET) D
	. I $P($G(Y(0),Y),X)="" W $P($G(Y(0),Y),X,2,999)
	. E  W "  "_$G(Y(0),Y)
	Q
