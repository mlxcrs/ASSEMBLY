	ORG 	0H
	ljmp 	100H
	ORG 	100H
	MOV	P3,	#00H
	CLR	P1.0
	CLR	P1.1
POS1:	JNB 	P1.0, 	POS1
	MOV 	A,	#0AH
POS2: 	JZ		POS3
	DEC	A
	CALL 	DEL
	JMP 	POS2
POS3: 	JB 	P1.1, 	POS4
	CALL 	DEL
	JMP 	POS3
POS4: 	MOV 	A,	#0AH
POS5: 	JZ 	POS6
	DEC 	A
	CALL 	DEL
	JMP 	POS5
POS6: 	JNB 	P1.0, 	POS1
	MOV	P3, 	#000H
	SETB	P3.7
POS7:	JB	P1.0, 	POS7
	LJMP	POS1
	ORG 	200H
DEL: 	MOV 	R1,	#0FFh 
	MOV 	R0,	#0FFh
	CLR 	P3.6
	SETB	P3.4
volta: 	DJNZ 	R1,	volta 
	DJNZ 	R0,	volta
volta3: DJNZ 	R1,	volta3
	DJNZ 	R0,	volta3
	CLR 	P3.4
	SETB 	P3.6
volta2: DJNZ 	R1,	volta2
	DJNZ 	R0,	volta2
volta4: DJNZ 	R1,	volta4
	DJNZ 	R0,	volta4
	RET
	END
