*-----------------------------------------------------------
* Program Number:
* Written by    : Kiril Goguev -0056402
* Date Created  : 
* Description   : Defragging data
*
*-----------------------------------------------------------
CODE	ORG	$9000
DATA	ORG	$8000

	ORG DATA
MEM  DC.B $01
	DC.B $02
	DC.B $F1
	DC.B $03
	DC.B $F2
	DC.B $F3
MEM1	DC.B $F4
		ORG CODE
DEFRAG	MOVEA.L #MEM,A0
		MOVEA.L #MEM1,A1
LOOP		CMPA A0,A1
		BCS	BACK
		BGT SWAP
		BLT LOOP
SWAP		MOVE.B (A0),D0
		MOVE.B (A1),D1
		MOVE.B  D1,(A0)
		MOVE.B D0,(A1)
		ADDQ #1,A0
		SUBQ #1,A1
		BRA LOOP
BACK		ADDQ #1,A1
		BRA LOOP

EXIT		TRAP #14
		END DEFRAG