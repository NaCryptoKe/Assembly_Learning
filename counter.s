.intel_syntax noprefix 
.global counter

counter:
    mov rcx, rsi
    xor rax, rax

    test rcx, rcx
    jz done
    
    add:
        add rax, [rdi]
        add rdi, 4
        loop add
    done:
        ret
