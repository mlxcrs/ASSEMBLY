ORG	0H
INIC:					;Inicio do programa
		MOV		P3,#000H
		MOV		P1,#00FH
POS1:	JB 		P1.0,POS1
		MOV 	A,#0AH
POS2:   JZ 		POS3
		DEC		A
		CALL 	DELS
		JMP 	POS2
POS3:	CALL 	DELC
		JMP 	POS3
POS4:	MOV 	A,#0AH
POS5: 	JZ		POS6
		DEC 	A
		CALL	DELR
		JMP 	POS5
POS6:	MOV		P3,#000H
		SETB	P3.7
POS7:	JNB		P3.0,POS7
ALAR:					;Teste de alarme
		JB		P1.1,POS4
		RET
RESE:					;Teste de Reset
		JB		P1.0,INIC
		RET
DEL0:					;Seta 1b em P3.4 e 0b em P3.6
		MOV		R1,#0FFH
		MOV		R0,#0FFH
		CLR		P3.6
		SETB	P3.4
		RET
DEL1:					;Seta 1b em P3.6 e 0b em P3.4
		CLR		P3.4
		SETB	P3.6
		RET
DELC:					;Delay com teste de alarme
		CALL	DEL0
		CALL	ALAR
vo1:	DJNZ 	R1,vo1
		CALL	ALAR
		DJNZ 	R0,vo1
vo3:	DJNZ 	R1,vo3
		CALL	ALAR
		DJNZ	R0,vo3
		CALL	DEL1
vo2:	DJNZ 	R1,vo2
		CALL	ALAR
		DJNZ 	R0,vo2
vo4:	DJNZ 	R1,vo4
		CALL	ALAR
		DJNZ 	R0,vo4
		RET
DELS:					;Delay puro(sem nunhum teste)
		CALL	DEL0
vo5:	DJNZ 	R1,vo5
		DJNZ 	R0,vo5
vo6:	DJNZ 	R1,vo6
		DJNZ	R0,vo6
		CALL	DEL1
vo7:	DJNZ 	R1,vo7
		DJNZ 	R0,vo7
vo8:	DJNZ 	R1,vo8
		DJNZ 	R0,vo8
		RET
DELR:					;Delay com teste de reset
		CALL	DEL0
vo9:	DJNZ 	R1,vo9
		CALL	RESE
		DJNZ 	R0,vo9
vo10:	DJNZ 	R1,vo10
		CALL	RESE
		DJNZ	R0,vo10
		CALL	DEL1
vo11:	DJNZ 	R1,vo11
		CALL	RESE
		DJNZ 	R0,vo11
vo12:	DJNZ 	R1,vo12
		CALL	RESE
		DJNZ 	R0,vo12
		RET
END