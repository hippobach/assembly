.model small
.stack 100h
.data
    s1 db 'nhap a: $'
    s2 db 10, 13, 'nhap b: $' 
    s3 db 10, 13, 'a = b $'
    s4 db 10, 13, 'a > b $'
    s5 db 10, 13, 'a < b $'
.code
    main proc
        mov ax, @data
        mov ds, ax  
        
        ;hien a
        mov ah, 9
        lea dx, s1
        int 21h
        ;nhap a
        mov ah, 1
        int 21h
        mov bl, al  
        
        ;hien b
         mov ah, 9
        lea dx, s2
        int 21h
        ;nhap b
        mov ah, 1
        int 21h
        mov bh, al
        
        ;so sanh 
        cmp bl, bh
        je bangnhau 
        jg alonhonb
        jl anhohonb
    bangnhau:
         mov ah, 9
         lea dx, s3
         int 21h 
         jmp kt
    alonhonb: 
         mov ah, 9
         lea dx, s4
         int 21h
         jmp kt
    anhohonb:   
         mov ah, 9
         lea dx, s5
         int 21h
        
    kt:   
        ;ket thuc
        mov ah, 4ch
        int 21h
    main endp
end main