*-----------------------------------------------------------
* Program Number:
* Written by    :
* Date Created  :
* Description   : Figures out which number of the 2 is smaller
*
*-----------------------------------------------------------
CODE	EQU	$9000
DATA	EQU	$8000


	ORG	DATA
BYTE1	DC.B  $12
BYTE2	DC.B  $34
RESULT DC.B $00
	ORG CODE
SMALLER	MOVE.B BYTE1,D0
		MOVE.B BYTE2,D1
		CMP.L D1,D0
		BLT	LESS
		BGT	GREATER
LESS		MOVE.B D0,D3
		BRA END
GREATER	MOVE.B D1,D3
		BRA END
END		MOVE.B D3,RESULT
		TRAP #14	
		END SMALLER