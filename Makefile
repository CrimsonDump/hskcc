GHC=ghc
SRCS=$(wildcard *.hs)
OBJS=$(SRCS:.hs=.o)

hskcc: $(OBJS)
	$(GHC) -o $@ $^

$(OBJS): $(SRCS)
	$(GHC) -c -o $@ $^

test: hskcc
	./test.sh

clean:
	rm -f hskcc *.o *.hi

.PHONY: test clean
