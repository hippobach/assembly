.model small
.stack 100h
.data
    gio db  ?
    phut db ?
    giay db ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ; ngat thoi gian
        ; ham 2ch, ngat 21h
        ; -> ch: gio, cl: phut, dh: giay
        
        mov ah, 2ch
        int 21h
        mov gio, ch
        mov phut, cl
        mov giay, dh
        
        mov bl, 10
        mov ah, 0
        mov al, gio
        div bl
        mov ch, ah
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        mov dl, ch
        add dl, 48
        int 21h
        mov dl, ':'
        int 21h
        
        mov al, phut
        mov ah, 0
        div bl
        mov ch, ah
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        mov dl, ch
        add dl, 48
        int 21h
        mov dl, ':'
        int 21h
        
        mov al, giay
        mov ah, 0
        div bl
        mov ch, ah
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        mov dl, ch
        add dl, 48
        int 21h
        
        mov ah, 4ch
        int 21h
    main endp
end main