GHC=ghc

hskcc: Main.o Tokenize.o Parse.o Codegen.o
	$(GHC) -o $@ $^

Main.o : Main.hs Tokenize.o Parse.o Codegen.o
	$(GHC) -c -o $@ Main.hs

Tokenize.o : Tokenize.hs
	$(GHC) -c -o $@ $^

Parse.o : Parse.hs
	$(GHC) -c -o $@ $^

Codegen.o : Codegen.hs
	$(GHC) -c -o $@ $^

test: hskcc
	./test.sh

clean:
	rm -f hskcc *.o *.hi

.PHONY: test clean
