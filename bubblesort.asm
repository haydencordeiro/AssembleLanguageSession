
 ;Bubble sort algorithm 


.model small

.data   
    ;this is the data segment
    ;db stands for data byte
    ;syntax for a string with predeifned value is  varname db Value
    ;syntax for a string without predeifned value is  varname db size dup('$')
    ;dup('$') initialses the array and fills $ signs in it 
    arr db 100 dup('$');Creating arr and filling it with '$'

.code
main proc 
  mov ax,@data
  mov ds,ax;                                       
  mov si,00h;
  mov cx,00h
  
  input:
    MOV AH,01h;Taking input and echo
    INT 21H
    mov arr[si],al
    inc si
    inc cx ;counter
    cmp al,13;Check if its enter 
    jne input
  
  
  dec cx;Since Enter also gets stored si points to enter which we want to ignore thats why we dec it
  dec cx ;To decrement the loops to execute one less time than the no. of inputs 
  mov dx,cx
  mov si,0000h;Since si would have some other value now after the input
  mov di,0000h;
   ;si=outer loop       di=inner loop
  

sort:
    cmp di,dx;
    je funct 
    mov bl,arr[di]
    cmp bl,arr[di+1]
    ja swap       ;change this from ja to jc to switch between ascending and descending
    inc di
    jmp sort

    

        
    ;this function is called when the inner loop is completed
    ;when called it checks if the outer loop has reached n 
    ; if it has not reached n then it sets the counter of the innerloop to 0
    ;if the outer loop has reached n then it jumps to done
funct:
    cmp si,cx
    je done
    inc si 
    dec dx ; Reduction in the times of inner loop with every execution of outer loop
    mov di,0000h;
    jmp sort
       
    
    ;this function swaps the values at locations pointed by di and di+i
swap:
    mov bh,arr[di]
    mov bl,arr[di+1]
    mov arr[di],bl
    mov arr [di+1],bh
    inc di
    jmp sort    
    
;this function is used to printout the array and return the control back     
done:
    mov dx,10
    mov ah,02h
    int 21h
    mov dx,offset arr; printout arr
    mov ah,09h;
    int 21h
    mov ah,4ch;terminate and give control to OS
    int 21h
    

  
   
     
    
main endp 

ret




