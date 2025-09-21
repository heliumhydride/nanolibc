section .text

global write
global _exit

write:
  mov rax, 1
  syscall
  ret

_exit:
  mov rax, 60
  syscall

