;Implement ASM program consider the number in 4000000c,add the array only if possitive and store in 40000000

	AREA SECOND,CODE,READONLY
	ENTRY
START
	LDR R0,VALUE;Get the address of value
	LDR R4,RESULT;get the address of result
	LDR R1,[R0];load the fist value of array to r1
	MOV R2,&4;add the number of array elements
	MOV R3, #0X00 ; SUM = 0
	
LOOP SUB R2,R2,#1;since 1 number is already fetched we decrement
	 CMP R2,#0;compare the size
	 BLT STOP;if size is less than zero stop execution
	 CMP R1,#0;then compare the element
	 BLT NEXT;if element is less than 0 ie if its negative fetch the next element
	 ADD R3,R3,R1;then add
	 STR R3,[R4];store the result in 40000000
	 B NEXT;fetch next element
	 ;B LOOP
	 
NEXT LDR R1,[R0,#4]!;fetch the next element.ie auto increment
	 B LOOP;start the loop again
STOP B STOP
	
VALUE DCD &4000000C
RESULT DCD &40000000
	END