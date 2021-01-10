	;Rehan Javaid, rj3dxu, 10/29/2020, linearSearch.s
	global linearSearch
	section .text

linearSearch:
	push rbx        	;create a counter
	mov rbx, 0              ;set counter equal to 0
	push r12                ;save register to keep track of address of array
	lea r12, [edi]          ;get the address of the array and store in r12
	push rbp                ;extra register
loop:	
	cmp ebx, esi            ;compare rbx to the size of the array 
	je  NotFound
	mov rbp, [r12+4*rbx]    ;get value at that address and store in rbp
	cmp ebp, edx            ;compare to value trying to find
	je  Found               ;if value is found return it!
	inc rbx                 ;increment counter
	jmp loop                ;back to beginning of loop
	
NotFound:
	mov rax, -1
	pop rbp
	pop r12
	pop rbx
	ret
Found:
	mov rax, rbx
	pop rbp
	pop r12
	pop rbx
	ret
