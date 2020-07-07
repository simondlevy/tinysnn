EXE = test_connection_forward test_connection_init  \
      test_network_forward test_network_init \
      test_neuron_forward test_neuron_init

all: $(EXE)

test_connection_forward: test_connection_forward.o Connection.o functional.o
	gcc -o test_connection_forward test_connection_forward.o Connection.o functional.o

test_connection_init: test_connection_init.o Connection.o functional.o
	gcc -o test_connection_init test_connection_init.o Connection.o functional.o

test_network_forward: test_network_forward.o Network.o Connection.o Neuron.o functional.o
	gcc -o test_network_forward test_network_forward.o Network.o Connection.o Neuron.o functional.o -lm

test_network_init: test_network_init.o Network.o Connection.o Neuron.o functional.o
	gcc -o test_network_init test_network_init.o Network.o Connection.o Neuron.o functional.o -lm

test_neuron_forward: test_neuron_forward.o Network.o Connection.o Neuron.o functional.o
	gcc -o test_neuron_forward test_neuron_forward.o Network.o Connection.o Neuron.o functional.o -lm

test_neuron_init: test_neuron_init.o Network.o Connection.o Neuron.o functional.o
	gcc -o test_neuron_init test_neuron_init.o Network.o Connection.o Neuron.o functional.o -lm

test_connection_init.o: test_connection_init.c Connection.h functional.h
	gcc -c test_connection_init.c

Network.o: Network.c Network.h Connection.h Neuron.h functional.h
	gcc -c Network.c

Connection.o: Connection.c Connection.h
	gcc -c Connection.c

Neuron.o: Neuron.c Neuron.h functional.h
	gcc -c Neuron.c

functional.o: functional.c functional.h
	gcc -c functional.c

clean:
	rm -f $(EXE) *.o *~
