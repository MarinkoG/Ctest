CC=gcc

BDIR=build
SRCDIR=src

CFLAGS=-I$(SRCDIR)

$(shell   mkdir -p $(BDIR))

SRC := $(wildcard $(SRCDIR)/*.c)
OBJ := $(patsubst $(SRCDIR)/%.c, $(BDIR)/%.o, $(SRC))

$(BDIR)/%.o: $(SRCDIR)/%.c
	$(CC) -c -o $@ $^ $(CFLAGS)

$(BDIR)/ctest.exe: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(BDIR)/*.o
