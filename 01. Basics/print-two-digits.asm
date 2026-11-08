.model small
.stack 100h
.data 
    digit1 db "Enter 1st digit: $"
    digit2 db 13, 10, "Enter 2nd digit: $" ;13=CR carriage return (moves cursor back to beginnin of current line)
    digits_sum db 13, 10, "Sum: $" ;10=LF line feed (move to next line)

    num1 db ? ;uninitialized variable of 1byte

.code 
main proc 
    mov ax, @data
    mov ds, AX

    lea dx, digit1
    mov ah, 09h ;to print a string
    int 21h

    mov ah, 01h ;read one input tht goes in al
    int 21h

    sub al, 30h ;convert tht input to number and not ascii
    mov num1, al 

    lea dx, digit2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h

    sub al, 30h

    add al, num1 
    mov bl,al

    lea dx, digits_sum
    mov ah, 09h
    int 21h

    mov al, bl 
    xor ah, ah ;same as setting ah=0 so ah is empty.
    mov cl, 10 
    div cl ;here ax=dividend cl=divisor al=quotient ah=remainder

    mov bh, ah 

    mov dl, AL
    add dl, 30h
    mov ah, 02h
    int 21h ;prints quotient

    mov dl, BH
    add dl, 30h
    mov ah, 02h
    int 21h ;prints remainder

    mov ah, 4ch ;program end
    int 21h
main endp
end main 