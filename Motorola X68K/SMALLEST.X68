*-----------------------------------------------------------
* Program Number:
* Written by    : Kiril Goguev- 0556402
* Date Created  :
* Description   : Figures out which is the smallest number in the registers
*
*-----------------------------------------------------------
CODE	EQU	$9000
DATA	EQU	$8000


	ORG	DATA
SIZE	DC.B	05
RESULT DC.B	00
BYTES	DC.B	05
	DC.B	03
	DC.B	06
	DC.B	02
	DC.B	04
	ORG CODE
SMALLEST	MOVEA.L #$BYTES,A0
		MOVEA.L #SIZE,A3
		MOVEA.L #RESULT,A1
		MOVE.B (A3),D3
		MOVE.B (A0),D0
		MOVE.B (A1),D5
LOOP		
		MOVE.B (A0)+,D1
		CMP.L D1,D0
		BGT LESS
		SUBQ #1,D3
		BEQ END
		BNE LOOP
LESS		MOVE.B D1,D0
		SUBQ #1,D3
		BRA LOOP
END		MOVE.B D0,D5
		MOVE.B D5,RESULT
		TRAP #14	
		END SMALLEST