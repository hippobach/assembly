.model small
.stack 100h
.data   

    MSG1 db 10,13, 'nhap so thu nhat: $'
    MSG2 db 10,13, 'nhap so thu hai: $'
    MSG3 db 10,13, 'tong cua hai so: $'
    NUM1 db ?
    NUM2 db ?
    TONG db ?
.code 
main proc
    ;Lay du lieu tu data vao ds
    mov ax, @data
    mov ds, ax 
    
    ;xuat thong bao msg1
    mov ah, 9
    lea dx, MSG1
    int 21h
    ;nhap msg1
    mov ah, 1
    int 21h
    SUB al, 30h     ;ep kieu
    mov NUM1, al
    
    ;xuat thong bao msg2
    mov ah, 9
    lea dx, MSG2
    int 21h 
    ;nhap msg2
    mov ah, 1
    int 21h
    SUB al, 30h  
    mov NUM2, al 
    
    ;xuat thong bao tinh tong
    mov ah, 9
    lea dx, MSG3
    int 21h
    
    ;tinh tong
    mov al, NUM1
    mov bl, NUM2 
    ADD al, bl
    
    ADD al, 30h
    mov TONG, al
    
    ;xuat tong
    mov ah, 2
    mov dl, TONG    ;xuat thi dung den thanh ghi dl
    int 21h


    ;ket thuc chuong trinh
    mov ah, 4ch
    int 21h 
main endp
end main

