*-----------------------------------------------------------
* Program Number:
* Written by    :Kiril Goguev-0556402
* Date Created  :
* Description   : Converts a number
*
*-----------------------------------------------------------
CODE	ORG	$9000
DATA	ORG	$8000

	ORG DATA
DECIMAL DC.W $11
BASE	  DC.B $07	
RESULT  DC.B $00
	ORG CODE
CONVERT MOVE.w DECIMAL,D0
	MOVE.b  BASE,D1
	DIVU.w D1,D0
	MOVE.B D1,D2
	MOVE.B D2,RESULT
	swap d0
	TRAP #14
	END	CONVERT
