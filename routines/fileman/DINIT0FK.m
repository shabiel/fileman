DINIT0FK ;SFISC/MKO-DATA FOR FORM AND BLOCK FILES ;10:49 AM  30 Mar 1999
 ;;22.0;VA FileMan;;Mar 30, 1999
 ;Per VHA Directive 10-93-142, this routine should not be modified.
 F I=1:2 S X=$T(ENTRY+I) G:X="" ^DINIT0FL S Y=$E($T(ENTRY+I+1),5,999),X=$E(X,4,999),@X=Y
 Q
ENTRY ;
 ;;^DIST(.404,.404052,40,8,1)
 ;;=6.3
 ;;^DIST(.404,.404052,40,8,2)
 ;;=3,25^3^3,10
 ;;^DIST(.404,.404061,0)
 ;;=DDGF BLOCK ADD
 ;;^DIST(.404,.404061,40,0)
 ;;=^.4044I^1^1
 ;;^DIST(.404,.404061,40,1,0)
 ;;=1^Select NEW BLOCK NAME^2
 ;;^DIST(.404,.404061,40,1,2)
 ;;=3,26^30^3,3
 ;;^DIST(.404,.404061,40,1,12)
 ;;=S DDACT="EX"
 ;;^DIST(.404,.404061,40,1,20)
 ;;=P^^DIST(.404,:QEALMZF
 ;;^DIST(.404,.404061,40,1,23)
 ;;=S DDGFBNUM=X,DDGFBNAM=DDSEXT
 ;;^DIST(.404,.404061,40,1,24)
 ;;=S DIR("S")="I Y'<1"
 ;;^DIST(.404,.404062,0)
 ;;=DDGF BLOCK ADD NEW
 ;;^DIST(.404,.404062,40,0)
 ;;=^.4044I^2^2
 ;;^DIST(.404,.404062,40,1,0)
 ;;=1^!M^1
 ;;^DIST(.404,.404062,40,1,.1)
 ;;=S Y="Are you adding "_DDGFBNAM
 ;;^DIST(.404,.404062,40,1,2)
 ;;=^^3,3
 ;;^DIST(.404,.404062,40,2,0)
 ;;=2^as a new block on this page?^2
 ;;^DIST(.404,.404062,40,2,2)
 ;;=4,32^3^4,3^1
 ;;^DIST(.404,.404062,40,2,12)
 ;;=S DDACT="EX"
 ;;^DIST(.404,.404062,40,2,20)
 ;;=Y
 ;;^DIST(.404,.404062,40,2,23)
 ;;=S DDGFANS=X
 ;;^DIST(.404,.404063,0)
 ;;=DDGF BLOCK ADD DUPLICATE
 ;;^DIST(.404,.404063,40,0)
 ;;=^.4044I^3^3
 ;;^DIST(.404,.404063,40,1,0)
 ;;=1^!M^1
 ;;^DIST(.404,.404063,40,1,.1)
 ;;=S Y="Block "_DDGFBNAM
 ;;^DIST(.404,.404063,40,1,2)
 ;;=^^3,3
 ;;^DIST(.404,.404063,40,2,0)
 ;;=2^already exists on this page!^1
 ;;^DIST(.404,.404063,40,2,2)
 ;;=^^4,3
 ;;^DIST(.404,.404063,40,3,0)
 ;;=3^OK^2
 ;;^DIST(.404,.404063,40,3,2)
 ;;=6,18^1^6,15^1
 ;;^DIST(.404,.404063,40,3,12)
 ;;=S DDACT="EX"
 ;;^DIST(.404,.404063,40,3,20)
 ;;=F^^0:0
 ;;^DIST(.404,.404063,40,3,21,0)
 ;;=^^1^1^2940928
 ;;^DIST(.404,.404063,40,3,21,1,0)
 ;;=Press <RET> to close this page
 ;;^DIST(.404,.404071,0)
 ;;=DDGF BLOCK DELETE
 ;;^DIST(.404,.404071,40,0)
 ;;=^.4044I^4^4
 ;;^DIST(.404,.404071,40,1,0)
 ;;=1^Block^1
 ;;^DIST(.404,.404071,40,1,2)
 ;;=^^1,1
 ;;^DIST(.404,.404071,40,2,0)
 ;;=4^Do you want to delete it from the BLOCK file?^2
 ;;^DIST(.404,.404071,40,2,2)
 ;;=3,47^3^3,1^1
 ;;^DIST(.404,.404071,40,2,12)
 ;;=S:X]"" DDACT="EX" I X="" D HLP^DDSUTL($C(7)_"A response is required.  Enter either YES or NO.") S DDSBR=2
 ;;^DIST(.404,.404071,40,2,20)
 ;;=Y
 ;;^DIST(.404,.404071,40,2,23)
 ;;=S DDGFANS=X
 ;;^DIST(.404,.404071,40,3,0)
 ;;=2^!M^1
 ;;^DIST(.404,.404071,40,3,.1)
 ;;=S Y=DDGFBK
 ;;^DIST(.404,.404071,40,3,2)
 ;;=^^1,7
 ;;^DIST(.404,.404071,40,4,0)
 ;;=3^is not used on any other forms.^1
 ;;^DIST(.404,.404071,40,4,2)
 ;;=^^2,1
 ;;^DIST(.404,.404081,0)
 ;;=DDGF HEADER BLOCK SELECT
 ;;^DIST(.404,.404081,40,0)
 ;;=^.4044I^2^2
 ;;^DIST(.404,.404081,40,1,0)
 ;;=1^ Add a New Header Block ^1
 ;;^DIST(.404,.404081,40,1,2)
 ;;=^^1,20
 ;;^DIST(.404,.404081,40,2,0)
 ;;=2^Select New Header Block Name^2
 ;;^DIST(.404,.404081,40,2,2)
 ;;=3,33^30^3,3
 ;;^DIST(.404,.404081,40,2,12)
 ;;=S DDACT="EX"
 ;;^DIST(.404,.404081,40,2,20)
 ;;=P^^DIST(.404,:QEALMZF
 ;;^DIST(.404,.404081,40,2,23)
 ;;=S DDGFBNUM=X,DDGFBNAM=DDSEXT
 ;;^DIST(.404,.441,0)
 ;;=DDXP FF BLK1^.44
 ;;^DIST(.404,.441,15,0)
 ;;=^^2^2^2930107
 ;;^DIST(.404,.441,15,1,0)
 ;;=Block makes up page 1 of DDXP FF FORM.  It is used to define a foreign
 ;;^DIST(.404,.441,15,2,0)
 ;;=format.
 ;;^DIST(.404,.441,40,0)
 ;;=^.4044I^21^16
 ;;^DIST(.404,.441,40,1,0)
 ;;=1^FOREIGN FILE FORMAT^3
 ;;^DIST(.404,.441,40,1,1)
 ;;=.01
 ;;^DIST(.404,.441,40,1,2)
 ;;=1,42^30^1,21^0
 ;;^DIST(.404,.441,40,3,0)
 ;;=3^!M^1
 ;;^DIST(.404,.441,40,3,.1)
 ;;=N I S Y="" F I=1:1:21+$L($G(DDXPFMNM)) S Y=Y_"="
 ;;^DIST(.404,.441,40,3,2)
 ;;=^^2,21
 ;;^DIST(.404,.441,40,4,0)
 ;;=4^FIELD DELIMITER^3
 ;;^DIST(.404,.441,40,4,1)
 ;;=1
 ;;^DIST(.404,.441,40,4,2)
 ;;=4,23^15^4,6^0
 ;;^DIST(.404,.441,40,5,0)
 ;;=5^RECORD LENGTH FIXED?^3
 ;;^DIST(.404,.441,40,5,1)
 ;;=5
 ;;^DIST(.404,.441,40,5,2)
 ;;=4,69^3^4,48^1
 ;;^DIST(.404,.441,40,6,0)
 ;;=4.7^RECORD DELIMITER^3
 ;;^DIST(.404,.441,40,6,1)
 ;;=2
 ;;^DIST(.404,.441,40,6,2)
 ;;=6,23^15^6,5^0
 ;;^DIST(.404,.441,40,7,0)
 ;;=7^MAXIMUM OUTPUT LENGTH^3
 ;;^DIST(.404,.441,40,7,1)
 ;;=7
 ;;^DIST(.404,.441,40,7,2)
 ;;=5,69^5^5,46^0
 ;;^DIST(.404,.441,40,7,3)
 ;;=80
 ;;^DIST(.404,.441,40,8,0)
 ;;=8^NEED FOREIGN FIELD NAMES?^3
 ;;^DIST(.404,.441,40,8,1)
 ;;=6
 ;;^DIST(.404,.441,40,8,2)
 ;;=6,69^3^6,43^1
 ;;^DIST(.404,.441,40,9,0)
 ;;=9^FILE HEADER^3
 ;;^DIST(.404,.441,40,9,1)
 ;;=20
 ;;^DIST(.404,.441,40,9,2)
 ;;=8,23^40^8,10^0
 ;;^DIST(.404,.441,40,10,0)
 ;;=10^FILE TRAILER^3
 ;;^DIST(.404,.441,40,10,1)
 ;;=25
 ;;^DIST(.404,.441,40,10,2)
 ;;=9,23^40^9,9^0
 ;;^DIST(.404,.441,40,11,0)
 ;;=11^DATE FORMAT^3
 ;;^DIST(.404,.441,40,11,1)
 ;;=27
 ;;^DIST(.404,.441,40,11,2)
 ;;=10,23^40^10,10^0
 ;;^DIST(.404,.441,40,16,0)
 ;;=16^Go to next page to document format.^1
 ;;^DIST(.404,.441,40,16,2)
 ;;=^^17,45
 ;;^DIST(.404,.441,40,17,0)
 ;;=2^PAGE 1^1
 ;;^DIST(.404,.441,40,17,2)
 ;;=^^1,74
 ;;^DIST(.404,.441,40,18,0)
 ;;=12^QUOTE NON-NUMERIC?^3
 ;;^DIST(.404,.441,40,18,1)
 ;;=8
 ;;^DIST(.404,.441,40,18,2)
 ;;=13,23^3^13,4^1
 ;;^DIST(.404,.441,40,19,0)
 ;;=13^PROMPT FOR DATA TYPE?^3
 ;;^DIST(.404,.441,40,19,1)
 ;;=9
 ;;^DIST(.404,.441,40,19,2)
 ;;=14,23^3^14,1^1
 ;;^DIST(.404,.441,40,20,0)
 ;;=4.5^SEND LAST DELIMITER?^3
 ;;^DIST(.404,.441,40,20,1)
 ;;=10
 ;;^DIST(.404,.441,40,20,2)
 ;;=5,23^3^5,2^1
 ;;^DIST(.404,.441,40,20,3)
 ;;=YES
 ;;^DIST(.404,.441,40,21,0)
 ;;=11.5^SUBSTITUTE FOR NULL^3
 ;;^DIST(.404,.441,40,21,1)
 ;;=11
 ;;^DIST(.404,.441,40,21,2)
 ;;=12,23^15^12,2^0
 ;;^DIST(.404,.442,0)
 ;;=DDXP FF BLK2^.44^0
 ;;^DIST(.404,.442,15,0)
 ;;=^^2^2^2920925
 ;;^DIST(.404,.442,15,1,0)
 ;;=Contains fields for page 2 of form used to define Foreign Formats.
 ;;^DIST(.404,.442,15,2,0)
 ;;=Primarily used to document the format.
 ;;^DIST(.404,.442,40,0)
 ;;=^.4044I^7^7
 ;;^DIST(.404,.442,40,1,0)
 ;;=1^FOREIGN FILE FORMAT: ^1
 ;;^DIST(.404,.442,40,1,2)
 ;;=^^1,21
 ;;^DIST(.404,.442,40,2,0)
 ;;=2^^3
 ;;^DIST(.404,.442,40,2,1)
 ;;=.01
 ;;^DIST(.404,.442,40,2,2)
 ;;=1,42^30
 ;;^DIST(.404,.442,40,2,4)
 ;;=^^^1
 ;;^DIST(.404,.442,40,3,0)
 ;;=2.5^PAGE 2^1
 ;;^DIST(.404,.442,40,3,2)
 ;;=^^1,74
 ;;^DIST(.404,.442,40,4,0)
 ;;=3^!M^1
 ;;^DIST(.404,.442,40,4,.1)
 ;;=N I S Y="" F I=1:1:21+$L($G(DDXPFMNM)) S Y=Y_"="
 ;;^DIST(.404,.442,40,4,2)
 ;;=^^2,21
 ;;^DIST(.404,.442,40,5,0)
 ;;=4^DESCRIPTION (WP)^3
 ;;^DIST(.404,.442,40,5,1)
 ;;=30
 ;;^DIST(.404,.442,40,5,2)
 ;;=4,44^1^4,26^0
 ;;^DIST(.404,.442,40,6,0)
 ;;=5^USAGE NOTES (WP)^3
 ;;^DIST(.404,.442,40,6,1)
 ;;=31
 ;;^DIST(.404,.442,40,6,2)
 ;;=6,44^1^6,26^0
 ;;^DIST(.404,.442,40,7,0)
 ;;=6^Select OTHER NAME FOR FORMAT^3
 ;;^DIST(.404,.442,40,7,1)
 ;;=50
 ;;^DIST(.404,.442,40,7,2)
 ;;=10,44^22^10,14^0
