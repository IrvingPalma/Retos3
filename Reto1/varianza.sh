nasm -g -f elf64 -o ASMvarianza.o ASMvarianza.asm
gcc -g varianza.c ASMvarianza.o -o varianza -lm
./varianza 1.5 1.2 1.7 1.3 1.8
./varianza 1 2 3 