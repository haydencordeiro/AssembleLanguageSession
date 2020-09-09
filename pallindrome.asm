; Program for pallindrome
.model small 

.data
    ;this is the data segment
    ;db stands for data byte
    ;syntax for a string with predeifned value is  varname db Value
    ;syntax for a string without predeifned value is  varname db size dup('$')
    ;dup('$') initialses the array and fills $ signs in it 

    
    string1 db "Please Enter a string: $";
    string2 db 10 dup('$');
    string3 db "Pallindrome $";
    string4 db "Not Pallindrome $";
    

.code 
main proc
    ;intialise the ds 
    mov ax,@data;
    mov ds,ax;
    mov si,00h;setting pointer intitally to 0    (points to the ending add of the char arr)
    mov di,00h;setting pointer intitally to 0    (points to the starting add of the char arr)
    mov cx,0000h;setting counter intitally to 0  (used as a counter)
    ;Used for displaying string 1
    mov dx,offset string1
    mov ah,09h;
    int 21h;
    
    
    
    ;this label(function) is used to take input from the user
    ;ans store it in the string 2 at postion which is pointed by si
    ;cx is the counter and is incremented when a new value is entered
    ;similarly si is also incremented
    input:
        mov ah,01h;
        int 21h;
        mov string2[si],al;
        inc si
        inc cx
        cmp al,0dh;
        jne input
    
    ;dec si and cx once this is because lets take the case of user entered
    ;12 value of si and cx would be 3,3 when it should be 2,1
    ;rememeber si is like i in a for loop starts with 0 thtats why 1 not 2
    ;therefore we dec si 2 times and cx once
    dec si
    dec si
    dec cx; 
    ;used to go to the newline(can use 0Ah instead of 10)
    mov dx,10
    mov ah,02h;
    int 21h;
    ;this label(function) takes the values at which si and di are poiting to
    ;and stores them in bl and bh and then compares them
    ;if they are not equal then directly jump to not a pallindrome
    ; if they are dec si,inc di and dec cx . If cx is 0 then stop the 
    ;loop and print its a pallindrome as it has checked all the letters
    check:
       mov bl, string2[si]
       mov bh,string2[di]
       cmp bl,bh;
       jne NotP

       dec si  
       dec cx
       inc di
       cmp cx,00h;
       je Pallindrome
        
       jmp check
       
     ;this label{function) prints string 3 and returns program controll  
     Pallindrome:
        mov dx,offset string3;
        mov ah,09h;
        int 21h;
        mov ah,4ch;
        int 21h;
     ;this label{function) prints string 4 and returns program controll
     NotP:
        mov dx,offset string4;
        mov ah,09h;
        int 21h;
        mov ah,4ch;
        int 21h;  
        
        
    
    
    
main endp    