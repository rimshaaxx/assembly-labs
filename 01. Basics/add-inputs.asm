                ; FOR SINGLE DIGITS ONLY. Like 4+5=9 Okee. But 9+9=18 is NOT okee.
.model small
.stack 100h
.DATA
    msg1 db "Enter first number: $"
    msg2 db 10,13, "Enter second number: $"
    sum db 10,13, "Sum: $"

.code 
main PROC
    mov ax, @data
    mov ds, AX

    lea dx, msg1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 48
    mov bl, AL

    lea dx, msg2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 48

    add bl, AL
    add bl, 48

    lea dx, sum
    mov ah, 09h
    int 21h

    mov dl, BL
    mov ah, 02h
    int 21h

    mov ah, 4ch
    int 21h

main ENDP
END main