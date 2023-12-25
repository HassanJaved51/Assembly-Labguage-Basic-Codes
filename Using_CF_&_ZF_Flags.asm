[org 0x0100]
start:
	mov bx, 0
	mov [swap], 0
	
; Outer loop
loop1:
	mov ax, [arr + bx]
	cmp ax, [arr + bx + 2]
	jbe noswap
	
	; Swap elements if needed
	mov dx, [arr + bx + 2]
	mov [arr + bx + 2], ax
	mov [arr + bx], dx
	mov [swap], 1
	
noswap:
	add bx, 2
	cmp bx, 18
	jne loop1
	
	; Check if a swap occurred
	cmp [swap], 1
	je start
	
	; Exit the program
	mov ax, 0x4c00
	int 0x21
	
swap: db 0
arr: dw 10,9,8,7,6,5,4,3,2,1