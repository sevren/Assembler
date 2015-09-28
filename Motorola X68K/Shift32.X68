*-----------------------------------------------------------
* Program Number:
* Written by    :Kiril Goguev-0556402
* Date Created  :
* Description   : Bit shifts a number in the register
*
*-----------------------------------------------------------

CODE	EQU	$9000
DATA	EQU	$8000
	
		ORG		DATA
NUM		DC.L		$0000
		DC.L		$8100
		DC.L		$FFFF
		DC.L		$FFFF
		DC.L		$FFFF
		DC.L		$1234
		DC.L		$5678
NORM		DC.L		0
SHIFTS	DC.W		0
			
		ORG		CODE
SHIFT32	MOVEA.L	#NUM,A0
		MOVEA.L	#NORM,D1
LOOP		ROL		#NUM,D1
		ADD.W		#SHIFTS,D0	
		BPL		LOOP
		MOVE.W	D0,(D1)
		TRAP		#14
		END 		SHIFT32