controlMVB: controlMVB.o ../cs12Lib/cs12Lib.o
	ld -g -o controlMVB controlMVB.o ../cs12Lib/cs12Lib.o

controlMVB.o: controlMVB.asm
	yasm -Worphan-labels -g dwarf2 -f elf64 controlMVB.asm -l controlMVB.lst

clean: 
	rm -f controlMVB
	rm -f controlMVB.o 
	rm -f controlMVB.lst 

