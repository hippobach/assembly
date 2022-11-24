.model small
.stack 100h
.data
    s1  db  'nhap chuoi: $'
    s2  db  10, 13, 'chuoi vua nhap: $'
    s3  db  10, 13, 'chu hoa: $'
    s   db  100 dup(?)
    chuhoa  db  100 dup(?)
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov bx, 0
nhaptiep:
        mov ah, 1
        int 21h
        cmp al, 13
        je thoat
        mov s(bx), al
        inc bx
        jmp nhaptiep
thoat:
        
        mov cx, bx
        mov bx, 0
        mov ah, 9
        lea dx, s2
        int 21h
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
        
        mov si, 0
        mov bx, 0
chuyen:        
        cmp s(bx), 'Z'
        jg khongdoi
        mov dl, s(bx)
        mov chuhoa(si), dl
        inc si
khongdoi:
        inc bx
        cmp bx, cx
        jbe chuyen
        
        mov cx, si
        mov si, 0
intiep1:        
        mov ah, 2
        mov dl, chuhoa(si)
        int 21h
        inc si
        cmp si, cx
        jbe intiep1
        
        
        mov ah, 4ch
        int 21h
    main endp
end main