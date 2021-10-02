nasm -g -f elf64 -o limiteBinASM.o limiteBinASM.asm
gcc -g limiteBin.c limiteBinASM.o -o limiteBin -lm
./limiteBin 1000000
