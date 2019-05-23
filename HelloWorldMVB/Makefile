helloWorldMVB: helloWorldMVB.o
	ld -o helloWorldMVB helloWorldMVB.o

helloWorldMVB.o: helloWorldMVB.s
	as --gstabs helloWorldMVB.s -o helloWorldMVB.o

clean:
	rm -f helloWorldMVB
	rm -f helloWorldMVB.o 
