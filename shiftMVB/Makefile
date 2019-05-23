shiftMVB: shiftMVB.o ../cs12Lib/cs12Lib.o
	ld -g -o shiftMVB shiftMVB.o ../cs12Lib/cs12Lib.o

shiftMVB.o: shiftMVB.asm
	yasm -Worphan-labels -g dwarf2 -f elf64 shiftMVB.asm -l shiftMVB.lst

clean: 
	rm -f shiftMVB
	rm -f shiftMVB.o 
	rm -f shiftMVB.lst 

