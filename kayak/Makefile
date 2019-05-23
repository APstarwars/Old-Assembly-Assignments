kayak: kayak.o ../cs12Lib/cs12Lib.o
	ld -g -o kayak kayak.o ../cs12Lib/cs12Lib.o

kayak.o: kayak.asm
	yasm -Worphan-labels -g dwarf2 -f elf64 kayak.asm -l kayak.lst

clean: 
	rm -f kayak
	rm -f kayak.o 
	rm -f kayak.lst 

