CC=gcc

BDIR=build
SRCDIR=src

CFLAGS=-I$(SRCDIR)

SRC := $(wildcard $(SRCDIR)/*.c)
OBJ := $(patsubst $(SRCDIR)/%.c, $(BDIR)/%.o, $(SRC))

$(BDIR)/%.o: $(SRCDIR)/%.c
	$(CC) -c -o $@ $^ $(CFLAGS)

$(BDIR)/ctest.exe: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
	
$(BDIR)/:
	mkdir -p $@

.PHONY: clean

clean:
	rm -f $(BDIR)/*.o
