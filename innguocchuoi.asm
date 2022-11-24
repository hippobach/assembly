.model small
.stack 100h
.data
    s1  db  'nhap chuoi: $'
    s2  db  10, 13, 'chuoi vua nhap: $'
    s3  db  10, 13, 'in nguoc lai: $'  
    
    s   db  100 dup(?)
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
        inc bx      ; add bx, 1
        jmp nhaptiep
thoat:
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov cx, bx
        mov bx, 0
intiep:        
        mov ah, 2
        mov dl, s(bx)
        int 21h 
        push ax
        inc bx
        cmp bx, cx
        jl intiep
        
        mov ah,9
        lea dx,s3
        int 21h
        
        mov bx,0
    dao:    
        mov ah,2
        pop dx
        int 21h
        loop dao 
        
        mov ah, 9
        lea dx, s
        int 21h
  
        mov ah, 4ch
        int 21h
    main endp
end main