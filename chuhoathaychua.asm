.model small
.stack 100h
.data
     s1 db "Nhap chuoi: $"
     s2 db 10, 13, "Chuoi vua nhap: $"
     s3 db 10, 13, "In bang ham 9: $"
     s4 db 10, 13, "Chuoi in hoa: $"
     s db 100 dup(?)
.code
main proc
     mov ax, @data
     mov ds, ax
     
     mov ah, 9
     lea dx, s1
     int 21h
     
     mov bx, 0
  nhap:   
     mov ah, 1
     int 21h
     cmp al, 13
     je thoat
     mov s(bx), al
     inc bx
     jmp nhap
  
  thoat:
    mov ah, 9
    lea dx, s2
    int 21h
    
    mov cx, bx    ;luu size cua bx vao cx
    mov bx, 0
  intiep:  
    mov ah, 2
    mov dl, s(bx)
    int 21h
    inc bx
    cmp bx, cx
    jbe intiep
    
    mov ah, 9
    lea dx, s3
    int 21h
    
    inc bx
    mov s(bx), "$"
    mov ah, 9
    lea dx, s
    int 21h
    
    ;in chu hoa
    mov ah, 9
    lea dx, s4
    int 21h
    
    mov bx, 0
 doitiep:
    cmp s(bx), 'a'
    jl khongdoi
    sub s(bx), 32
    
 khongdoi:
    inc bx
    cmp bx, cx
    jbe doitiep
    
    mov ah, 9
    lea dx, s
    int 21h 
     
     ;ket thuc
     mov ah, 4ch
     int 21h
main endp