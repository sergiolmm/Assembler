    .486                                    ; create 32 bit code
    .model flat, stdcall                    ; 32 bit memory model
    option casemap :none                    ; case sensitive
 
    include \masm32\include\windows.inc     ; always first
    include \masm32\macros\macros.asm       ; MASM support macros
    include \masm32\include\masm32.inc
    include \masm32\include\gdi32.inc
    include \masm32\include\user32.inc
    include \masm32\include\kernel32.inc
    
    includelib \masm32\lib\masm32.lib
    includelib \masm32\lib\gdi32.lib
    includelib \masm32\lib\user32.lib
    includelib \masm32\lib\kernel32.lib
    
.data?

.data
    texto  db 0,13,10,0

    n1      db     'a',255,255,255,255   ; valor, endereço proximo no(formato 32 bits)
    inp1    dd 00   ; <--- here
    n3      db     'b',255,255,255,255
    n2      db     'c',255,255,255,255
    n5      db     'd',255,255,255,255
    n4      db     'e',255,255,255,255

.code                       ; Tell MASM where the code starts
start:                           ; The CODE entry point to the program
    call main                   ; branch to the "main" procedure
    exit

main proc

    call    inicializa



    ; testar se correto
    lea     edx, OFFSET n1
    mov     al, byte ptr [edx]
    inc     edx
    mov     edx, [edx]
    mov     ah, byte ptr [edx]

    push    edx
    push    eax
    lea     edx, OFFSET texto
    mov     byte ptr[edx], al
    print   edx    
    pop     eax
    lea     edx, OFFSET texto
    mov     byte ptr[edx], ah
    print   edx    
    pop     edx

    inc     edx
    mov     edx, [edx]
    mov     al, byte ptr [edx]
    inc     edx
    mov     edx, [edx]
    mov     ah, byte ptr [edx]
    push    edx
    push    eax
    lea     edx, OFFSET texto
    mov     byte ptr[edx], al
    print   edx    
    pop     eax
    lea     edx, OFFSET texto
    mov     byte ptr[edx], ah
    print   edx    
    pop     edx
    inc     edx
    mov     edx, [edx]
    mov     al, byte ptr [edx]
    lea     edx, OFFSET texto
    mov     byte ptr[edx], al
    print   edx    

    







    mov inp1, cfm$(input(13,10,"Type text here : "))

    print "You Entered: "
    print inp1

    ret                         ; return to the next instruction after "call"

main endp

inicializa proc

    lea     edx, OFFSET n1
    lea     edi, OFFSET n2
    inc     edx
    mov     [edx], edi
    lea     edx, OFFSET n3
    inc     edi
    mov     [edi], edx
    lea     edi, OFFSET n4
    inc     edx
    mov     [edx], edi
    lea     edx, OFFSET n5
    inc     edi
    mov     [edi], edx
  
    ret

inicializa endp

end start           