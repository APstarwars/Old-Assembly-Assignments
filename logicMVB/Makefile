logicMVB: logicMVB.o ../cs12Lib/cs12Lib.o
	ld -g -o logicMVB logicMVB.o ../cs12Lib/cs12Lib.o

logicMVB.o: logicMVB.asm
	yasm -Worphan-labels -g dwarf2 -f elf64 logicMVB.asm -l logicMVB.lst

clean: 
	rm -f logicMVB
	rm -f logicMVB.o 
	rm -f logicMVB.lst 

