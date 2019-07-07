; show string by edit vram
; author: cw1997 (github.com/cw1997)
; date: 2019-07-07 16:11:27

;org 07c00h

main:

    mov ax,0x7c0           ;设置数据段的段基地址 
    mov ds,ax

    call clear

    mov ax,0xb800 ; set vram segment to es
    mov es,ax

    mov cx, mystrEnd-myStr-1
    mov dx, (mystrEnd-myStr)*2

    showStr:
        mov bx,cx

        mov al, [bx+myStr]
        mov ah, 0x07
        dec cx

        sub dx, 2
        mov bx,dx
        mov word [es:bx], ax

    jne showStr

    jmp $
    ;hlt

myStr:
    db 'hello VRAM. by cw1997. my github page: https://github.com/cw1997.', 0x10 ,' my website is : http://www.changwei.me' 
mystrEnd:

clear:
    mov ax,0xb800 ; set vram segment to es
    mov es,ax

    mov cx, 80*25-1 ; vga text mode
    mov dx, (80*25-1)*2 

    mov al, ' '
    mov ah, 0x07

    clr:
    mov bx,dx
    mov word [es:bx], ax
    dec cx
    sub dx, 2

    jne clr

    ret
    

end:
    times 510-($-$$) db 0
    dw 0xaa55
