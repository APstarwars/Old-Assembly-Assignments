mathMVB: mathMVB.o ../cs12Lib/cs12Lib.o
	ld -g -o mathMVB mathMVB.o ../cs12Lib/cs12Lib.o

mathMVB.o: mathMVB.asm
	yasm -Worphan-labels -g dwarf2 -f elf64 mathMVB.asm -l mathMVB.lst

clean: 
	rm -f mathMVB 
	rm -f mathMVB.o 
	rm -f mathMVB.lst 

