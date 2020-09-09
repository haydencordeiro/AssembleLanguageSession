; Prpgram to reverse the input

.model small

.data
    ;this is the data segment
    ;db stands for data byte
    ;syntax for a string with predeifned value is  varname db Value
    ;syntax for a string without predeifned value is  varname db size dup('$')
    ;dup('$') initialses the array and fills $ signs in it 
    string1 db "Please Enter a string: $";
    string2 db 10 dup('$');
    

.code
assume cs:code , ds:data 
main proc
    ;intialise the ds 
    mov ax,@data;
    mov ds,ax;
    mov si,00h;
    ;Used for displaying string 1
    mov dx,offset string1
    mov ah,09h;
    int 21h;
    
    
    ;this label(function) is used to take input from the user
    ;ans store it in the string 2 at postion which is pointed by si
    ;after every insertion si is incremented
    input:
        mov ah,01h;
        int 21h;
        cmp al,0dh;(0dh or 13 stands for enter)
        je newline
        mov string2[si],al;
        inc si                      
        jmp input                  

    ;used to go to the newline(can use 0Ah instead of 10)    
    newline:
        mov dx,10
        mov ah,02h;
        int 21h;
        dec si;

    ;used for printing the reverse
    ;si points to the last element of the array
    ;after printing the character it dec si and then
    ;it checks if si is -1 which states that it has 
    ;completed traversing through the array
   
    reverse:
        ;Display a single character  
       mov dl,string2[si]
       mov ah,02h;
       int 21h;       
       dec si  
       cmp si,-1;
       jne reverse
     ;return control back
    end:
        mov ah,4ch;
        int 21h  
   
   
    
        
           
main endp