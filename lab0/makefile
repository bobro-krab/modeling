COMPILER=g++
CFLAGS=-g -Wall -lncurses -lm -lpthread -std=c++11
SOURSES=main.cpp
OBJECTS=$(SOURSES:.cpp=.o)
EXECUTABLE=autocorrelation

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(COMPILER)  $(OBJECTS) -o $@ $(CFLAGS)

$(OBJECTS):$(SOURSES)
	$(COMPILER) $(CFLAGS) -c $<

clean:
	rm $(OBJECTS) $(EXECUTABLE)

run: $(EXECUTABLE)
	./$(EXECUTABLE)
