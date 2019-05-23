sortMVB: sortMVB.o ../cs12Lib/cs12Lib.o
	ld -g -o sortMVB sortMVB.o ../cs12Lib/cs12Lib.o

sortMVB.o: sortMVB.asm
	yasm -Worphan-labels -g dwarf2 -f elf64 sortMVB.asm -l sortMVB.lst

clean: 
	rm -f sortMVB
	rm -f sortMVB.o 
	rm -f sortMVB.lst 

