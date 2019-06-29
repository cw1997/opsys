org 07c00h
mov ax, cs
mov ds, ax
mov es, ax
call myPrint
jmp $

myStr: db "hello world! by cw1997" ; 22

myPrint:
mov ax, myStr
mov bp, ax
mov cx, 22
mov ax, 01301h
mov bx, 001ah ; color a=green
mov dl, 0
int 10h
ret

times 510-($-$$) db 0
dw 0xaa55
