all: debug.asm
	nasm -f elf64 -g -F dwarf -o debug.o debug.asm
	gcc -m64 -o debug debug.o
