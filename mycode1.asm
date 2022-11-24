.model small
.stack 100h
.data
    s1 db 'nhap so 1: $'
    s2 db 10, 13, 'nhap so 2: $'
    s3 db 10, 13, 'nhap so 3: $'
    s4 db 10, 13, 'hien nguoc lai: $'
.code
    main proc
        mov ax, @data
        mov ds, ax  
        
        ;hien s1
        mov ah, 9
        lea dx, s1
        int 21h
        ;nhap so 1
        mov ah, 1
        int 21h
        push ax   ;cat vao stack
        
        ;hien s2
         mov ah, 9
        lea dx, s2
        int 21h
        ;nhap so 2
        mov ah, 1
        int 21h
        push ax  
        
        ;hien s3
         mov ah, 9
        lea dx, s3
        int 21h
        ;nhap so 3
        mov ah, 1
        int 21h
        push ax  
        
        ;hien s4
        mov ah, 9
        lea dx, s4
        int 21h
        ;hien ky tu  
        pop ax
        mov ah, 2
        mov dl, al
        int 21h
        
        
        ;ket thuc
        mov ah, 4ch
        int 21h
    main endp
end main