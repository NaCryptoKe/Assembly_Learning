.intel_syntax noprefix
.global my_add

my_add:
    add rdi, rsi    
    mov rax, rdi    
    ret
