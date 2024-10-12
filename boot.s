BITS 32

section .text
    ALIGN 4
    dd 0x1BADB002
    dd 0x00000000
    dd -(0x1BADB002 + 0x00000000)

global start
extern kmain

start: 
    CLI
    MOV EAX, stack_space
    CALL kmain
    HLT

HaltKernel:
    CLI
    HLT
    JMP HaltKernel

section .bss
resb 8192
stack_space: 