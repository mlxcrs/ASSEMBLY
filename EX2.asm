$MOD51

inicio:	MOV	R1,#0FFh	;___________________________
	MOV 	P0,#0Fh	;___________________________
	volta:	DJNZ	R1,volta	;___________________________
	MOV	P0,#0F0h	;___________________________	
	volta2:	DJNZ	R1,volta2 	;___________________________
		JMP inicio		;___________________________
	END
