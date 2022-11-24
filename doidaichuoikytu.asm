.model small
.stack 100h
.data
    tb1 db "Nhap vao mot chuoi: $"
    tb2 db 10, 13, "Do dai cua chuoi: $"
    s db 100, ?, 101 dup("$")
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;hien thong bao tb1
    mov ah, 9
    lea dx, tb1
    int 21h
    ;nhap chuoi s
    mov ah, 0ah
    lea dx, s
    int 21h
    
    ;hien thong bao tb2
    mov ah, 9
    lea dx, tb2
    int 21h
    
    ;tinh chieu dai chuoi
    xor ax, ax
    mov al, s+1    ;chuyen chieu dai chuoi vao ax
    mov cx, 0      ;khoi tao bien dem
    mov bx, 10  
    
    lapdem1:
        mov dx, 0
        div bx
        push dx
        inc cx
        cmp ax, 0
        jnz lapdem1
    
    ;xuat chieu dai cua chuoi
    mov ah, 2    
    lapdem2: 
        pop dx
        or dl, '0'  ;chuyen chu so thanh so
        int 21h
        loop lapdem2
    
    ;ket thuc    
    mov ah, 4ch
    int 21h
        
    
main endp
end main