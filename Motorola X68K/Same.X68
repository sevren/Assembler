*-----------------------------------------------------------
* Program Number:
* Written by    :Kiril Goguev-0556402
* Date Created  :
* Description   : Compares two strings to see if they are the same
*
*-----------------------------------------------------------

* MYSID.X68
CR		EQU	$0D		;ASCII CARRIAGE RETURN
LF		EQU	$0A		;ASCII LINE FEED
CODE		EQU	$9000		;CODE SEGMENT	
DATA		EQU	$8000		;DATA SEGMENT

		ORG		DATA			
START		DC.B		'KIRIL',0
START2	DC.B		'KIRIL',0
MATCH		DC.B		0
		
		ORG		CODE			

LENSTR	CLR.W		D6
		CLR.L		D4
		MOVEA.L	#START,A1		;A1 POINTS TO STRING IN START
		MOVEA.L	#START2,A2
LOOP1		MOVE.B	(A1)+,D4
		BEQ.S		FINISH			;IF NOT  0 REPEAT
		ADD.L		D4,D6
		BRA LOOP1
LOOP2		MOVE.B	(A2)+,D5
		BEQ.S		EXIT
		ADD.L		D5,D7
		BRA LOOP2
FINISH	BRA LOOP2
EXIT		CMP		D6,D7
		BNE		DIFF
SAME		MOVEA.L	#MATCH,A0
		MOVE.L	0000,A0
		TRAP		#14
DIFF		MOVEA.L	#MATCH,A0
		MOVE.L	#$FFFF,A0
		TRAP		#14			;IF 0, RETURN TO MON68K
		END		LENSTR