.model small
.stack 100h
.data
    tb1 db "Nhap vap so thap phan: $"
    tb2 db 10, 13, "So thap phan vua nhap la: $"
    x dw ?
    y dw ?
.code
main proc 
     mov ax, @data
     mov ds, ax
     
     ;nhap so
     mov ah, 9
     lea dx, tb1
     int 21h
     
     call nhap_so 
     
     ;hien thi
     mov ah, 9
     lea dx, tb2
     int 21h
     
     call print
     
     ;ket thuc
     mov ah, 4ch
     int 21h
     
main endp
    ;nhap so
 nhap_so proc
    mov x, 0
    mov y, 0
    mov bx, 10
        nhap:
            mov ah, 1
            int 21h
            cmp al, 13
            je nhapxong
            sub al, 30h
            xor ah, ah  ;cho ah ve 0
            mov y, ax
            mov ax, x
            mul bx
            add ax, y
            mov x, ax
            jmp nhap
        nhapxong:
            ret
            
 nhap_so endp
 
 
    ;hien thi
 print proc
    mov ax, x
    mov bx, 2
    mov cx, 0
    
    chia:
        mov dx, 0
        div bx
        push dx
        inc cx
        cmp ax, 0
        je hienthi
        jmp chia
    hienthi:
        pop dx
        add dl, 30h
        mov ah, 2
        int 21h
        dec cx
        cmp cx, 0
        jne hienthi
        ret
            
 print endp

end main
    