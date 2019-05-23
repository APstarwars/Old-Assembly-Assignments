test: test.o ../cs12Lib/cs12Lib.o
	ld -g -o test test.o ../cs12Lib/cs12Lib.o

test.o: test.asm
	yasm -Worphan-labels -g dwarf2 -f elf64 test.asm -l test.lst

clean: 
	rm -f test
	rm -f test.o 
	rm -f test.lst 

