*-----------------------------------------------------------
* Program Number:
* Written by    : Kiril Goguev -0556402
* Date Created  :
* Description   : Counts the size of a string in Assembler
*
*-----------------------------------------------------------

* MYSID.X68
CR		EQU	$0D		;ASCII CARRIAGE RETURN
LF		EQU	$0A		;ASCII LINE FEED
CODE		EQU	$9000		;CODE SEGMENT	
DATA		EQU	$8000		;DATA SEGMENT

		ORG		DATA			
START		DC.B		'Kiril',0
LENGTH	DC.B		0
		
		ORG		CODE			

LENSTR	CLR.W		D6
		CLR.L		D4
		MOVEA.L	#START,A1		;A1 POINTS TO STRING IN START
LOOP		MOVE.B	(A1)+,D4
		BEQ.S		FINISH			;IF NOT  0 REPEAT
		ADD.L		#1,D6
		BRA	LOOP
FINISH	MOVE.W	D6,LENGTH
		TRAP		#14			;IF 0, RETURN TO MON68K
		END		LENSTR