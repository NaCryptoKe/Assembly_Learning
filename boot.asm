[bits 16]       ; This is simply saying that it should use 16-bit

; In 1981, the team designing the IBM PC 5150 decided the BIOS should load the bootloader at that address. They chose it because they wanted to leave enough room for the BIOS to use the "lower" memory for its own data, but they also wanted to leave enough room for the OS to load its own stack.

; Mathematically, it’s the end of the first 32KiB of RAM minus the 512 bytes of the bootloader, plus some safety padding for the stack. It’s essentially a 40-year-old "handshake" between the hardware and your code.
[org 0x7c00]

start:

    mov ah, 0x01
    mov ch, 0x00
    mov cl, 0x0F
    int 0x10
    
    mov ah, 0x02
    mov bh, 0
    mov dh, 0x00
    mov dl, 0x00
    int 0x10

    mov ah, 0x03
    mov bh, 0x00
    int 0x10

    mov ah, 0x09           ; Write with new attribute
    mov al, ' '
    mov bh, 0x00            ; Page number or screen
    mov bl, 0x6E            ; Color
    mov cx, 2000           ; This is because the screen is 25 x 80, which equates to 2000
    int 0x10

    ; Now teletype will use blue/white for subsequent chars
    mov ah, 0x0E
    mov al, 'H'
    int 0x10
    mov al, 'i'
	int 0x10

    mov ah, 0x05
    mov al, 0x07
    int 0x10

    jmp $

times 510-($-$$) db 0
dw 0xAA55
