	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
	
	MOV r1, #0x1 
try_1:
  	LDREX r2, [r0]   
	CMP r2, #0       
	
	STREXEQ r2, r1, [r0]  
	CMPEQ r2, #0     
				
	BNE try_1  

        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
        
	MOV r1, #0
try_2:    
	LDREX r2, [r0]        
	CMP r2, #1                  
	STREXEQ r2, r1, [r0]  
	CMPEQ r2, #0                
	BNE try_2                   



        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
