;UCLN BCNN
.model small
.stack 100h
.data
    tb1 db "Nhap so thu nhat: $"
    tb2 db 10, 13, "Nhap so thu hai: $"
    tb3 db 10, 13, "Uoc chung lon nhat la: $"
    tb4 db 10, 13, "Boi chung nho nhat la: $"
    x dw ?
    y dw ? 
    z dw ?
    t dw ?
    k dw ?
.code
main proc 
     mov ax, @data
     mov ds, ax
     
     ;nhap so thu nhat
     mov ah, 9
     lea dx, tb1
     int 21h
     
     call nhap_so 
     mov ax, x
     mov z, ax   ;luu so thu nhat vao z
     
     ;nhap so thu hai
     mov ah, 9
     lea dx, tb2
     int 21h
     
     call nhap_so
     mov ax, x
     mov t, ax   ;luu so thu hai vao t
     
     ;uoc chung lon nhat
     mov ah, 9
     lea dx, tb3
     int 21h
     
     mov ax, z
     mov bx, t
     
     while:
        cmp ax, bx
        je ucln   ; ax = bx thi in ra ucln
        jl less   
        sub ax, bx   ; ax = ax - bx
        jmp while 
        
        less:
            sub bx, ax   ; bx = bx - ax
            jmp while
        
     ucln:
          mov x, ax    ; UCLN la x
          call print
     
     ; boi chung nho nhat (z * t)/UCLN
     mov ah, 9
     lea dx, tb4
     int 21h
     
     mov ax, x    ;mov x vao trong ax
     mov k, ax    ;mov ax vao k, k la UCLN 
     
     mov ax, z
     mov bx, t
     mul bx     ; ax = ax * bx = z * t , kq luu vao ax
     mov bx, k
     div bx   ; ax = (z*t)/k
     mov x, ax
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
            je thoat
            sub al, 30h
            xor ah, ah  ;cho ah ve 0
            mov y, ax
            mov ax, x   ; so vua nhap cat vao ax
            mul bx      ; ax = x*10
            add ax, y   ; ax = x*10 + y
            mov x, ax
            jmp nhap
        thoat:
            ret
            
 nhap_so endp
 
 
    ;hien thi
 print proc
    mov ax, x
    mov bx, 10
    mov cx, 0
    
    chia:
        mov dx, 0
        div bx
        push dx
        inc cx     ; tuong tu nhu bien count: count++
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
        je xong
        jmp hienthi
     xong:
        ret
            
 print endp

end main
    