*-----------------------------------------------------------
* Program Number:
* Written by    : Kiril Goguev -0556402
* Date Created  :
* Description   : Implements If statements in assembler x86
*
*-----------------------------------------------------------
CODE	EQU	$9000
DATA	EQU	$8000


	ORG	DATA
A	DC.W	$0005
B	DC.W	$0032
C	DC.W	$0028
D	DC.W	$0033
TEMP	DC.W	$0000

	ORG CODE
IF		MOVE.W A,D0
		MOVE.W B,D1
		CLR D3
		CMP.W D1,D0
		BGT	ELSE
		MOVE.W D1,D3
		BRA IF2
ELSE		MOVE.W D0,D3
		BRA IF2

IF2		CLR D0
		CLR D1
		MOVE.W C,D0
		CMP.W D0,D3
		BGT IF3
		MOVE.W D0,D3
		BRA IF3

IF3		CLR D0
		CLR D1
		MOVE.W D,D0
		CMP.W D0,D3
		BGT END
		MOVE.W D0,D3
		BRA END



END		TRAP #14	
		END IF
