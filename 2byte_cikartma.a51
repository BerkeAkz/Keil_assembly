ORG 00H

START:
    MOV 41H, #15H
    MOV 40H, #40H
	
    MOV 43H, #23H
    MOV 42H, #65H
	
    SJMP MAIN
	
MAIN:
    CLR C          

    
    MOV A, 40H
    SUBB A, 42H     
    MOV 45H, A
	
    
    MOV A, 41H
    SUBB A, 43H     
    MOV 46H, A
	
    
    JC ELDE        
	
    SJMP BITIS      
	
ELDE:
    SETB P1.1      
    SJMP BITIS
	
BITIS:
    SJMP BITIS      	

END