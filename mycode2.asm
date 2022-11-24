.model small
.stack 100h
.data
    s1 db 'nhap ky tu: $'
    s2 db 10, 13, 'ky tu vua nhap la: $'
    s3 db 10, 13, 'doi thanh chu hoa: $'
.code
    main proc
        mov ax, @data
        mov ds, ax  
        
        ;hien s1
        mov ah, 9
        lea dx, s1
        int 21h  
        
        ;nhap ky tu
        mov ah, 1
        int 21h
        mov bl, al
        
        ;hien s2
         mov ah, 9
        lea dx, s2
        int 21h
        ;hien ky tu
        mov ah, 2
        mov dl, bl
        int 21h
        
        ;hien s3
         mov ah, 9
        lea dx, s3
        int 21h 
        
        ;hien chu hoa
        mov ah, 2 
        mov dl, bl
        sub dl, 32
        int 21h
  
        
        
        ;ket thuc
        mov ah, 4ch
        int 21h
    main endp
end main