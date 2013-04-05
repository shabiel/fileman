DINIT221	;SFISC/DPC-LOAD DATA TYPE PROPERTY AND DATA TYPE METHOD FILE DDs ;2NOV2012
	;;22.3T0;FILEMAN;;Mar 22, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	;
	F I=1:2 S X=$T(Q+I) G ^DINIT220:X="" S Y=$E($T(Q+I+1),5,999),X=$E(X,4,999),@X=Y
Q	Q
	;;^DIC(.86,0,"GL")
	;;=^DI(.86,
	;;^DIC("B","DATA TYPE PROPERTY",.86)
	;;=
	;;^DD(.86,0)
	;;=FIELD^^51^12
	;;^DD(.86,0,"DDA")
	;;=N
	;;^DD(.86,0,"DT")
	;;=2960123
	;;^DD(.86,0,"ID",1)
	;;=W "   ",$P(^(0),U,2)
	;;^DD(.86,0,"IX","B",.86,.01)
	;;=
	;;^DD(.86,0,"IX","C",.86,1)
	;;=
	;;^DD(.86,0,"NM","DATA TYPE PROPERTY")
	;;=
	;;^DD(.86,0,"PT",.81101,.01)
	;;=
	;;^DD(.86,.001,0)
	;;=NUMBER^NJ16,2^^ ^K:+X'=X!(X>9999999999999.99)!(X<1)!(X?.E1"."3N.N) X
	;;^DD(.86,.001,3)
	;;=Type a Number between 1 and 9999999999999.99, 2 Decimal Digits
	;;^DD(.86,.001,"DT")
	;;=2951215
	;;^DD(.86,.01,0)
	;;=NAME^RF^^0;1^K:$L(X)>30!(X?.N)!($L(X)<3)!'(X'?1P.E) X
	;;^DD(.86,.01,1,0)
	;;=^.1
	;;^DD(.86,.01,1,1,0)
	;;=.86^B
	;;^DD(.86,.01,1,1,1)
	;;=S ^DI(.86,"B",$E(X,1,30),DA)=""
	;;^DD(.86,.01,1,1,2)
	;;=K ^DI(.86,"B",$E(X,1,30),DA)
	;;^DD(.86,.01,3)
	;;=NAME MUST BE 3-30 CHARACTERS, NOT NUMERIC OR STARTING WITH PUNCTUATION
	;;^DD(.86,1,0)
	;;=ABBREVIATION^FIX^^0;2^K:$L(X)>10!($L(X)<2)!(X=+$P(X,"E")) X
	;;^DD(.86,1,1,0)
	;;=^.1
	;;^DD(.86,1,1,1,0)
	;;=.86^C
	;;^DD(.86,1,1,1,1)
	;;=S ^DI(.86,"C",$E(X,1,30),DA)=""
	;;^DD(.86,1,1,1,2)
	;;=K ^DI(.86,"C",$E(X,1,30),DA)
	;;^DD(.86,1,1,1,"DT")
	;;=2960117
	;;^DD(.86,1,3)
	;;=Answer must be 2-10 characters in length.
	;;^DD(.86,1,21,0)
	;;=^^3^3^2951205^
	;;^DD(.86,1,21,1,0)
	;;=Enter an abbreviation for this property.  The Abbreviation can be used
	;;^DD(.86,1,21,2,0)
	;;=within vertical bars in the Default, Build Default, and Executable Default
	;;^DD(.86,1,21,3,0)
	;;=of a data type.
	;;^DD(.86,1,"DT")
	;;=2960207
	;;^DD(.86,11,0)
	;;=SHORT DESCRIPTION^F^^11;E1,245^K:$L(X)>245!($L(X)<1) X
	;;^DD(.86,11,3)
	;;=Answer must be 1-245 characters in length.
	;;^DD(.86,11,"DT")
	;;=2951023
	;;^DD(.86,21,0)
	;;=DESCRIPTION^.861^^21;0
	;;^DD(.86,41,0)
	;;=DATA TYPE^P.81'^DI(.81,^41;1^Q
	;;^DD(.86,41,21,0)
	;;=^^1^1^2951205^
	;;^DD(.86,41,21,1,0)
	;;=Enter the data type of this property.
	;;^DD(.86,41,"DT")
	;;=2951027
	;;^DD(.86,42,0)
	;;=DIR(0)^F^^42;E1,245^K:$L(X)>245!($L(X)<1) X
	;;^DD(.86,42,3)
	;;=Answer must be 1-245 characters in length.
	;;^DD(.86,42,21,0)
	;;=^^1^1^2951214^
	;;^DD(.86,42,21,1,0)
	;;=Enter the string that goes into DIR(0) for a ^DIR call.
	;;^DD(.86,42,"DT")
	;;=2951214
	;;^DD(.86,43,0)
	;;=PROMPT [DIR(A)]^.8643^^43;0
	;;^DD(.86,44,0)
	;;=HELP [DIR(?)]^.8644^^44;0
	;;^DD(.86,45,0)
	;;=SCREEN [DIR(S)]^KX^^45;E1,245^K:$L(X)>245 X I $D(X) N DIXSAVE S DIXSAVE=X D ^DIM I '$D(X) D EN^DDIOL($E($C(7),'$G(DIQUIET))_"NOTE: MUMPS code does not pass ^DIM.") S X=DIXSAVE
	;;^DD(.86,45,3)
	;;=This is Standard MUMPS code.
	;;^DD(.86,45,9)
	;;=@
	;;^DD(.86,45,"DT")
	;;=2951214
	;;^DD(.86,46,0)
	;;=TIMEOUT [DIR(T)]^NJ4,0^^46;1^K:+X'=X!(X>9999)!(X<1)!(X?.E1"."1N.N) X
	;;^DD(.86,46,3)
	;;=Type a Number between 1 and 9999, 0 Decimal Digits
	;;^DD(.86,46,"DT")
	;;=2951027
	;;^DD(.86,51,0)
	;;=GET CODE^KX^^51;E1,245^K:$L(X)>245 X I $D(X) N DIXSAVE S DIXSAVE=X D ^DIM I '$D(X) D EN^DDIOL($E($C(7),'$G(DIQUIET))_"NOTE: MUMPS code does not pass ^DIM.") S X=DIXSAVE
	;;^DD(.86,51,3)
	;;=This is Standard MUMPS code.
	;;^DD(.86,51,9)
	;;=@
	;;^DD(.86,51,21,0)
	;;=^^5^5^2951214^
	;;^DD(.86,51,21,1,0)
	;;=If a straight ^DIR call cannot be used to retrieve a value for this
	;;^DD(.86,51,21,2,0)
	;;=Property, then the GET CODE can be used to get the value.  For example, to
	;;^DD(.86,51,21,3,0)
	;;=get the internal and external forms of a SET OF CODES field, the GET CODE
	;;^DD(.86,51,21,4,0)
	;;=can prompt the user for the internal and external forms in some sort of
	;;^DD(.86,51,21,5,0)
	;;=FOR loop.  The value of the property should be set into the variable X.
	;;^DD(.86,51,"DT")
	;;=2951214
	;;^DD(.861,0)
	;;=DESCRIPTION SUB-FIELD^^.01^1
	;;^DD(.861,0,"DT")
	;;=2951023
	;;^DD(.861,0,"NM","DESCRIPTION")
	;;=
	;;^DD(.861,0,"UP")
	;;=.86
	;;^DD(.861,.01,0)
	;;=DESCRIPTION^W^^0;1^Q
	;;^DD(.861,.01,"DT")
	;;=2951023
	;;^DD(.8643,0)
	;;=PROMPT [DIR(A)] SUB-FIELD^^.01^1
	;;^DD(.8643,0,"DT")
	;;=2951027
	;;^DD(.8643,0,"NM","PROMPT [DIR(A)]")
	;;=
	;;^DD(.8643,0,"UP")
	;;=.86
	;;^DD(.8643,.01,0)
	;;=PROMPT [DIR(A)]^W^^0;1^Q
	;;^DD(.8643,.01,"DT")
	;;=2951027
	;;^DD(.8644,0)
	;;=HELP [DIR(?)] SUB-FIELD^^.01^1
	;;^DD(.8644,0,"DT")
	;;=2951027
	;;^DD(.8644,0,"NM","HELP [DIR(?)]")
	;;=
	;;^DD(.8644,0,"UP")
	;;=.86
	;;^DD(.8644,.01,0)
	;;=HELP [DIR(?)]^W^^0;1^Q
	;;^DD(.8644,.01,"DT")
	;;=2951027
	;;^DIC(.87,0,"GL")
	;;=^DI(.87,
	;;^DIC("B","DATA TYPE METHOD",.87)
	;;=
	;;^DD(.87,0)
	;;=FIELD^^.001^4
	;;^DD(.87,0,"DDA")
	;;=N
	;;^DD(.87,0,"DT")
	;;=2960222
	;;^DD(.87,0,"IX","B",.87,.01)
	;;=
	;;^DD(.87,0,"NM","DATA TYPE METHOD")
	;;=
	;;^DD(.87,0,"PT",.81201,.01)
	;;=
	;;^DD(.87,.001,0)
	;;=NUMBER^NJ16,2^^ ^K:+X'=X!(X>9999999999999.99)!(X<1)!(X?.E1"."3N.N) X
	;;^DD(.87,.001,3)
	;;=Type a Number between 1 and 9999999999999.99, 2 Decimal Digits
	;;^DD(.87,.001,"DT")
	;;=2960117
	;;^DD(.87,.01,0)
	;;=NAME^RF^^0;1^K:$L(X)>50!($L(X)<3)!'(X'?1P.E) X
	;;^DD(.87,.01,1,0)
	;;=^.1
	;;^DD(.87,.01,1,1,0)
	;;=.87^B
	;;^DD(.87,.01,1,1,1)
	;;=S ^DI(.87,"B",$E(X,1,30),DA)=""
	;;^DD(.87,.01,1,1,2)
	;;=K ^DI(.87,"B",$E(X,1,30),DA)
	;;^DD(.87,.01,3)
	;;=Answer must be 3-50 characters in length.
	;;^DD(.87,.01,"DT")
	;;=2960222
	;;^DD(.87,11,0)
	;;=SHORT DESCRIPTION^F^^11;E1,245^K:$L(X)>245!($L(X)<1) X
	;;^DD(.87,11,3)
	;;=Answer must be 1-245 characters in length.
	;;^DD(.87,11,"DT")
	;;=2951023
	;;^DD(.87,21,0)
	;;=DESCRIPTION^.871^^21;0
	;;^DD(.871,0)
	;;=DESCRIPTION SUB-FIELD^^.01^1
	;;^DD(.871,0,"DT")
	;;=2951023
	;;^DD(.871,0,"NM","DESCRIPTION")
	;;=
	;;^DD(.871,0,"UP")
	;;=.87
	;;^DD(.871,.01,0)
	;;=DESCRIPTION^W^^0;1^Q
	;;^DD(.871,.01,"DT")
	;;=2951023
