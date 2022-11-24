; tinh tong day so lien tiep
.model small
.stack 100h
.data   
    endl db 10,13,'s = $' 
    n db 0
.code

main proc
    mov ax, @data
    mov ds,ax
    
    ;nhap 1 so
    mov ah, 1
    int 21h  
    sub al, 48
    mov n,al   
    
    mov bl,0  ;s=0
    mov cl,1  ;i=1 
    
congnot:
    add bl,cl ;s=s+i
    add cl,1  ;i++
    cmp cl,n
    jle congnot
    
    
    mov al ,bl   
    mov bl,10
    mov cl, 0 
    
chiatiep:      
    mov ah,0
    div bl
    cmp al,0
    je thoat
    push ax
    add cl, 1
    jmp chiatiep
    
thoat:
    push ax
    add cl,1 
    
    ;xuong dong
    mov ah,9
    lea dx,endl
    int 21h
intiep:     
    mov ah,2
    pop dx
    mov dl,dh
    add dl,48
    int 21h
    sub cl, 1
    ja intiep
    main endp
end main