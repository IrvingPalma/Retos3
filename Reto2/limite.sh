nasm -g -f elf64 -o limiteASM.o limiteASM.asm
gcc -g limite.c limiteASM.o -o limite -lm
./limite 1000000