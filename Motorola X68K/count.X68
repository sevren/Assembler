*-----------------------------------------------------------
* Program Number: 
* Written by    : Kiril Goguev -0556402
* Date Created  :
* Description   :Counter in Assembler
*
*-----------------------------------------------------------

DATA	EQU $8000
CODE	EQU $9000

	ORG DATA
NUM	DC.L $1234FEDC
ANS	DC.B 0

	ORG CODE
COUNT	CLR.B	D1			;CLEAR COUNTER
	MOVEA.L	#NUM,A0	;MOVE NUM TO ADDRESS REGISTER A0
	MOVE.B	#32,D3
	MOVE.B (A0)+,D2
LOOP	
	
	SUB.B #1,D3
	ROL.L	#1,D2
	BMI SKIP
	ADD.B #1,D1
	
	
	
SKIP	BNE LOOP
	TRAP #14
	END COUNT	