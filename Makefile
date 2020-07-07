EXE = test_connection_forward test_connection_init

all: $(EXE)

test_connection_forward: test_connection_forward.o Connection.o functional.o
	gcc -o test_connection_forward test_connection_forward.o Connection.o functional.o

test_connection_forward.o: test_connection_forward.c Connection.h functional.h
	gcc -c test_connection_forward.c

test_connection_init: test_connection_init.o Connection.o functional.o
	gcc -o test_connection_init test_connection_init.o Connection.o functional.o

test_connection_init.o: test_connection_init.c Connection.h functional.h
	gcc -c test_connection_init.c

Connection.o: Connection.c Connection.h
	gcc -c Connection.c

functional.o: functional.c functional.h
	gcc -c functional.c

clean:
	rm -f $(EXE) *.o *~
