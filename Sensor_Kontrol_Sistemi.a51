ORG 00H
	SJMP START
	
	START:
	       SJMP DONGU
		   
	ALARM_KAPALI: MOV P1,#00H
	              SJMP DONGU
		   
	DONGU: MOV A,P0
	       CJNE A,#32H,ALARM_KAPALI
		   MOV P1,#01H
		   SJMP DONGU
		   
	
	
				  
END
		   