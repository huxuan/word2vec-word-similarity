CC = gcc
#The -Ofast might not work with older versions of gcc; in that case, use -O2
CFLAGS = -lm -pthread -Ofast -march=native -Wall -funroll-loops -Wno-unused-result

all: run

run: word2vec distance-pairs train test

word2vec : word2vec.c
	$(CC) word2vec.c -o word2vec $(CFLAGS)

distance-pairs : distance-pairs.c
	$(CC) distance-pairs.c -o distance-pairs $(CFLAGS)

train :
	./word2vec -train training.txt -output vectors.bin -size 200 -window 10 -negative 5 -hs 1 -sample 1e-3 -threads 4 -min-count 0 -binary 1

test :
	./distance-pairs vectors.bin pairs.txt

clean:
	rm -rf word2vec distance-pairs

distclean: clean
	rm -rf vectors.bin pairs.txt.output
