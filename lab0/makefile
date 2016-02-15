COMPILER=g++
CFLAGS=-g -Wall -lncurses -lm -lpthread
SOURSES=main.cpp
OBJECTS=$(SOURSES:.cpp=.o)
EXECUTABLE=autocorrelation

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(COMPILER)  $(OBJECTS) -o $@ $(CFLAGS)

.o:.cpp
	$(COMPILER) $(CFLAGS) -c $<

clean:
	rm $(OBJECTS) $(EXECUTABLE)

run: $(EXECUTABLE)
	./$(EXECUTABLE)
