.model small
.stack 100h
.data
    s db " $"
.code
    main proc
        mov ax, @data
        mov ds, ax
        ;luu ki tu A
        mov bl, "A"
    
in:
        
        ;hien ki tu 
        mov ah, 2 
        mov dl, bl
        int 21h
        ;hien sau s 
        mov ah, 9
        lea dx, s
        int 21h
        ;tang ki tu len 1
        add bl,1 
        ;so sanh 
        cmp bl, "Z"       
        jle in
        ;ket thuc
        mov ah, 4ch
        int 21h       
               
    main endp
end main
