.model small
.stack 100h
.data
    s1   db  'nhap ky tu:$'
    s2  db 'ky tu vua nhap: $'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ; hien s1
        mov ah, 9
        lea dx, s1
        int 21h
        
        ; nhap ky tu
        mov ah, 1
        int 21h     ; ky tu luu trong al
        mov bl, al
        
        
        call xuongdong
        
        ; hien s2
        mov ah, 9
        lea dx, s2
        int 21h
                
        ; hien ky tu
        mov ah, 2
        mov dl, bl
        int 21h
        
        ; kt
        mov ah, 4ch
        int 21h
        
        
    main endp
    xuongdong proc
       ; xuong dong
        mov ah, 2
        mov dl, 10
        int 21h
        ; ve dau dong
        mov dl, 13
        int 21h
        ret 
    xuongdong endp    
end main