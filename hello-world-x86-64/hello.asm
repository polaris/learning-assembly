; nasm -f macho64 -DPIC -o hello.o hello.asm
; ld -macosx_version_min 10.15 -L/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/lib -lSystem -arch x86_64 -pie -o hello hello.o

section .data
    message db "Hello, world!",0

section .text
    global _main
_main:
    ; write message to stdout
    mov rax, 0x2000004       ; system call for write
    mov rdi, 1               ; file descriptor for stdout
    lea rsi, [rel message]   ; pointer to message
    mov rdx, 13              ; message length
    syscall

    ; exit
    mov rax, 0x2000001       ; system call for exit
    xor rdi, rdi             ; exit code 0
    syscall