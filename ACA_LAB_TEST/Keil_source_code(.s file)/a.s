;ADD NIBBLE N4 AND N0 FORM MEMORY LOCATION 40000004 AND STORE RESULT IN 4000000C	
	
	AREA NIBBLE,CODE,READONLY
	ENTRY
START
	LDR R0,ADD1  ;TAKING THE ADDRESS 40000004
	LDR R1,[R0] ;TAKING CONTENT OF R0
	MOV R6,R1 ;TAKING THE VALUE IN R6
	LDR R3,=0X0000000F;TAKING MASKING BITS
	LDR R2,RESULT;TAKING ADDRESS OF RESULT
	AND R6,R3;MASKING ALL EXTRA BITS
	;MOV R6,R6, LSR#4
	MOV R5,R1, LSR#16;SHIFT N4 TO THE END
	LDR R7,=0X0000000F;TAKING BITS FOR MASKING
	AND R5,R7;MASKING UNWANTED BITS IN R5
	ADD R4,R6,R5;ADD BOTH LOWER NIBBLE
	STR R4,[R2];STORE THAT IN RESULT PLACE
	
ADD1 DCD &40000004
RESULT DCD &4000000C
	END