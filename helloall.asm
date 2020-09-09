; Program to print hello world  when user enters small y


.model small


.data
    ;this is the data segment
    ;db stands for data byte
    ;syntax for a string with predeifned value is  varname db Value
    ;syntax for a string without predeifned value is  varname db size dup('$')
    ;dup('$') initialses the array and fills $ signs in it 
    
    string1 db "Hello World! ";


.code
      mov ax,@data
      mov ds,ax;
      

      ;accept value from user and echo
      mov ah,01h
      int 21h  
      cmp al,79h;
      jne terminate   
      
      ;display the string on the output(beware incase the 
      ;string doesnt end with a $ it will throw and error
       
      mov dx,offset string1
      mov ah,09h;
      int 21h;
      
       
      
      ;terminate
      terminate:
      mov ah,4ch;
      int 21h;

ret




