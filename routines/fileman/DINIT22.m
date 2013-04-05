DINIT22	;SFISC/DPC-LOAD DATA TYPE FILE DD ;2NOV2012
	;;22.3T0;FILEMAN;;Mar 22, 2013
	;Per VHA Directive 2004-038, this routine should not be modified.
	F I=1:2 S X=$T(Q+I) G ^DINIT221:X="" S Y=$E($T(Q+I+1),5,999),X=$E(X,4,999),@X=Y
Q	Q
	;;^DIC(.81,0,"GL")
	;;=^DI(.81,
	;;^DIC("B","DATA TYPE",.81)
	;;=
	;;^DIC(.81,"%D",0)
	;;=^^2^2^2940908^
	;;^DIC(.81,"%D",1,0)
	;;=This file stores all of the data types that VA FileMan allows in the
	;;^DIC(.81,"%D",2,0)
	;;=MODIFY FILE ATTRIBUTES option.
	;;^DD(.81,0)
	;;=FIELD^^201^9
	;;^DD(.81,0,"DDA")
	;;=N
	;;^DD(.81,0,"IX","B",.81,.01)
	;;=
	;;^DD(.81,0,"IX","C",.81,1)
	;;=
	;;^DD(.81,0,"NM","DATA TYPE")
	;;=
	;;^DD(.81,0,"PT",.4014,15)
	;;=
	;;^DD(.81,0,"PT",.42,1)
	;;=
	;;^DD(.81,0,"PT",.81,5)
	;;=
	;;^DD(.81,0,"PT",.81301,1)
	;;=
	;;^DD(.81,0,"PT",.82,.02)
	;;=
	;;^DD(.81,0,"PT",.82,1)
	;;=
	;;^DD(.81,0,"PT",.86,41)
	;;=
	;;^DD(.81,.001,0)
	;;=NUMBER^NJ16,2^^ ^K:+X'=X!(X>9999999999999.99)!(X<1)!(X?.E1"."3N.N) X
	;;^DD(.81,.001,3)
	;;=Type a Number between 1 and 9999999999999.99, 2 Decimal Digits
	;;^DD(.81,.001,"DT")
	;;=2951215
	;;^DD(.81,.01,0)
	;;=NAME^RF^^0;1^K:$L(X)>30!(X?.N)!($L(X)<3)!'(X'?1P.E) X
	;;^DD(.81,.01,1,0)
	;;=^.1
	;;^DD(.81,.01,1,1,0)
	;;=.81^B
	;;^DD(.81,.01,1,1,1)
	;;=S ^DI(.81,"B",$E(X,1,30),DA)=""
	;;^DD(.81,.01,1,1,2)
	;;=K ^DI(.81,"B",$E(X,1,30),DA)
	;;^DD(.81,.01,3)
	;;=NAME MUST BE 3-30 CHARACTERS, NOT NUMERIC OR STARTING WITH PUNCTUATION
	;;^DD(.81,.01,"DEL",1,0)
	;;=I DA<100
	;;^DD(.81,1,0)
	;;=INTERNAL REPRESENTATION^F^^0;2^K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>1!($L(X)<1) X
	;;^DD(.81,1,1,0)
	;;=^.1
	;;^DD(.81,1,1,1,0)
	;;=.81^C
	;;^DD(.81,1,1,1,1)
	;;=S ^DI(.81,"C",$E(X,1,30),DA)=""
	;;^DD(.81,1,1,1,2)
	;;=K ^DI(.81,"C",$E(X,1,30),DA)
	;;^DD(.81,1,1,1,"DT")
	;;=2921009
	;;^DD(.81,1,3)
	;;=Answer must be 1 character in length.
	;;^DD(.81,1,"DT")
	;;=2921009
	;;^DD(.81,2,0)
	;;=STANDARD PROMPT^F^^0;3^K:$L(X)>70!($L(X)<1) X
	;;^DD(.81,2,3)
	;;=Answer must be 1-70 characters in length.
	;;^DD(.81,2,21,0)
	;;=^^2^2^2960124^
	;;^DD(.81,2,21,1,0)
	;;=This is the default prompt used during a Reader (^DIR) call of this
	;;^DD(.81,2,21,2,0)
	;;=data type, when no prompt is supplied in DIR("A").
	;;^DD(.81,2,"DT")
	;;=2960124
	;;^DD(.81,3,0)
	;;=SORT BY EXTERNAL?^S^0:NO;1:YES;^0;4^Q
	;;^DD(.81,3,21,0)
	;;=^^2^2^2960806^
	;;^DD(.81,3,21,1,0)
	;;=Enter 'YES' if, by default, data of this data type should sort by its
	;;^DD(.81,3,21,2,0)
	;;=external rather than internal form.
	;;^DD(.81,3,"DT")
	;;=2960806
	;;^DD(.81,11,0)
	;;=SHORT DESCRIPTION^F^^11;E1,245^K:$L(X)>245!($L(X)<1) X
	;;^DD(.81,11,3)
	;;=Answer must be 1-245 characters in length.
	;;^DD(.81,11,"DT")
	;;=2951026
	;;^DD(.81,21,0)
	;;=DESCRIPTION^.8121^^21;0
	;;^DD(.81,101,0)
	;;=PROPERTY^.81101P^^101;0
	;;^DD(.81,101,"DT")
	;;=2951023
	;;^DD(.81,201,0)
	;;=METHOD^.81201P^^201;0
	;;^DD(.81101,0)
	;;=PROPERTY SUB-FIELD^^61^8
	;;^DD(.81101,0,"DT")
	;;=2951026
	;;^DD(.81101,0,"IX","AC",.81101,1)
	;;=
	;;^DD(.81101,0,"IX","B",.81101,.01)
	;;=
	;;^DD(.81101,0,"NM","PROPERTY")
	;;=
	;;^DD(.81101,0,"UP")
	;;=.81
	;;^DD(.81101,.01,0)
	;;=PROPERTY^MP.86X^DI(.86,^0;1^S DINUM=X
	;;^DD(.81101,.01,1,0)
	;;=^.1
	;;^DD(.81101,.01,1,1,0)
	;;=.81101^B
	;;^DD(.81101,.01,1,1,1)
	;;=S ^DI(.81,DA(1),101,"B",$E(X,1,30),DA)=""
	;;^DD(.81101,.01,1,1,2)
	;;=K ^DI(.81,DA(1),101,"B",$E(X,1,30),DA)
	;;^DD(.81101,.01,"DT")
	;;=2951025
	;;^DD(.81101,1,0)
	;;=ORDER^NJ4,1^^0;2^K:+X'=X!(X>99.9)!(X<1)!(X?.E1"."2N.N) X
	;;^DD(.81101,1,1,0)
	;;=^.1
	;;^DD(.81101,1,1,1,0)
	;;=.81101^AC
	;;^DD(.81101,1,1,1,1)
	;;=S ^DI(.81,DA(1),101,"AC",$E(X,1,30),DA)=""
	;;^DD(.81101,1,1,1,2)
	;;=K ^DI(.81,DA(1),101,"AC",$E(X,1,30),DA)
	;;^DD(.81101,1,1,1,"DT")
	;;=2951026
	;;^DD(.81101,1,3)
	;;=Type a Number between 1 and 99.9, 1 Decimal Digit
	;;^DD(.81101,1,21,0)
	;;=^^2^2^2951205^
	;;^DD(.81101,1,21,1,0)
	;;=Enter the relative order in which FileMan should prompt for this property
	;;^DD(.81101,1,21,2,0)
	;;=at field creation.
	;;^DD(.81101,1,"DT")
	;;=2951026
	;;^DD(.81101,2,0)
	;;=REQUIRED^S^0:NO;1:YES;^0;3^Q
	;;^DD(.81101,2,"DT")
	;;=2951023
	;;^DD(.81101,10,0)
	;;=PROMPT?^K^^10;E1,245^K:$L(X)>245 X D:$D(X) ^DIM
	;;^DD(.81101,10,3)
	;;=This is Standard MUMPS code.
	;;^DD(.81101,10,9)
	;;=@
	;;^DD(.81101,10,21,0)
	;;=^^3^3^2951205^
	;;^DD(.81101,10,21,1,0)
	;;=Enter MUMPS code that sets $T.  If $T evaluates to TRUE, then FileMan
	;;^DD(.81101,10,21,2,0)
	;;=will prompt for this property when a field of this Data Type is created.
	;;^DD(.81101,10,21,3,0)
	;;=A null value is equivalent to "I 1".
	;;^DD(.81101,10,"DT")
	;;=2951026
	;;^DD(.81101,31,0)
	;;=DEFAULT^F^^31;1^K:$L(X)>245!($L(X)<1) X
	;;^DD(.81101,31,3)
	;;=Answer must be 1-245 characters in length.
	;;^DD(.81101,31,21,0)
	;;=^^4^4^2951205^^^
	;;^DD(.81101,31,21,1,0)
	;;=This is the default value of the Property used at field creation.  The
	;;^DD(.81101,31,21,2,0)
	;;=Default can contain the Abbreviations of other Properties in vertical
	;;^DD(.81101,31,21,3,0)
	;;=bars.  For example, |MINL| refers to the value of the Minimum Length
	;;^DD(.81101,31,21,4,0)
	;;=property of the field.
	;;^DD(.81101,31,"DT")
	;;=2951026
	;;^DD(.81101,31.1,0)
	;;=BUILD DEFAULT^F^^31.1;E1,245^K:$L(X)>245!($L(X)<1) X
	;;^DD(.81101,31.1,3)
	;;=Answer must be 1-245 characters in length.
	;;^DD(.81101,31.1,21,0)
	;;=^^4^4^2951205^
	;;^DD(.81101,31.1,21,1,0)
	;;=This is MUMPS code that sets the local variable X to the default value of
	;;^DD(.81101,31.1,21,2,0)
	;;=the Property.  It is executed at field creation and the result in X
	;;^DD(.81101,31.1,21,3,0)
	;;=is stored in ^DD(file#,field#).  The MUMPS code can contain in vertical
	;;^DD(.81101,31.1,21,4,0)
	;;=bars the Abbreviations of other Properties.
	;;^DD(.81101,31.1,"DT")
	;;=2951026
	;;^DD(.81101,31.2,0)
	;;=EXECUTABLE DEFAULT^F^^31.2;E1,245^K:$L(X)>245!($L(X)<1) X
	;;^DD(.81101,31.2,3)
	;;=Answer must be 1-245 characters in length.
	;;^DD(.81101,31.2,21,0)
	;;=^^3^3^2960201^
	;;^DD(.81101,31.2,21,1,0)
	;;=This is used when the value of a property can only be determined at
	;;^DD(.81101,31.2,21,2,0)
	;;=run-time, not during field creation.  It is MUMPS code that sets
	;;^DD(.81101,31.2,21,3,0)
	;;=X equal to the value of the property.  It can refer to a value of another
	;;^DD(.81101,31.2,"DT")
	;;=2951026
	;;^DD(.81101,61,0)
	;;=POST ACTION^KX^^61;E1,245^K:$L(X)>245 X I $D(X) N DIXSAVE S DIXSAVE=X D ^DIM I '$D(X) D EN^DDIOL($E($C(7),'$G(DIQUIET))_"NOTE: MUMPS code does not pass ^DIM.") S X=DIXSAVE
	;;^DD(.81101,61,3)
	;;=This is Standard MUMPS code.
	;;^DD(.81101,61,9)
	;;=@
	;;^DD(.81101,61,21,0)
	;;=^^6^6^2951205^
	;;^DD(.81101,61,21,1,0)
	;;=Enter MUMPS code that is executed whenever the value of this Property is
	;;^DD(.81101,61,21,2,0)
	;;=changed.  (Documented variables contain the before and after values.)
	;;^DD(.81101,61,21,3,0)
	;;=
	;;^DD(.81101,61,21,4,0)
	;;=Example of use:  When the pointed-to file of a pointer field is changed,
	;;^DD(.81101,61,21,5,0)
	;;=the "PT" nodes in the previous and new pointed-to files need to be killed
	;;^DD(.81101,61,21,6,0)
	;;=and set, respectively.
	;;^DD(.81101,61,"DT")
	;;=2951214
	;;^DD(.81201,0)
	;;=METHOD SUB-FIELD^^31.1^4
	;;^DD(.81201,0,"DT")
	;;=2951026
	;;^DD(.81201,0,"IX","B",.81201,.01)
	;;=
	;;^DD(.81201,0,"NM","METHOD")
	;;=
	;;^DD(.81201,0,"UP")
	;;=.81
	;;^DD(.81201,.01,0)
	;;=METHOD^MP.87X^DI(.87,^0;1^S DINUM=X
	;;^DD(.81201,.01,1,0)
	;;=^.1
	;;^DD(.81201,.01,1,1,0)
	;;=.81201^B
	;;^DD(.81201,.01,1,1,1)
	;;=S ^DI(.81,DA(1),201,"B",$E(X,1,30),DA)=""
	;;^DD(.81201,.01,1,1,2)
	;;=K ^DI(.81,DA(1),201,"B",$E(X,1,30),DA)
	;;^DD(.81201,.01,"DT")
	;;=2951025
	;;^DD(.81201,1,0)
	;;=DISABLE EDITING^S^0:NO;1:YES;^0;2^Q
	;;^DD(.81201,1,"DT")
	;;=2951026
	;;^DD(.81201,31,0)
	;;=M CODE^F^^31;E1,245^K:$L(X)>245!($L(X)<1) X
	;;^DD(.81201,31,3)
	;;=Answer must be 1-245 characters in length.
	;;^DD(.81201,31,"DT")
	;;=2951026
	;;^DD(.81201,31.1,0)
	;;=BUILD M CODE^F^^31.1;E1,245^K:$L(X)>245!($L(X)<1) X
	;;^DD(.81201,31.1,3)
	;;=Answer must be 1-245 characters in length.
	;;^DD(.81201,31.1,"DT")
	;;=2951026
	;;^DD(.8121,0)
	;;=DESCRIPTION SUB-FIELD^^.01^1
	;;^DD(.8121,0,"DT")
	;;=2951026
	;;^DD(.8121,0,"NM","DESCRIPTION")
	;;=
	;;^DD(.8121,0,"UP")
	;;=.81
	;;^DD(.8121,.01,0)
	;;=DESCRIPTION^W^^0;1^Q
	;;^DD(.8121,.01,"DT")
	;;=2951026
