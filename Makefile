all: test_connection_forward.o

test_connection_forward.o: test_connection_forward.c
	gcc -c test_connection_forward.c

clean:
	rm -f *.o *~
