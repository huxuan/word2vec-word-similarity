# word2vec-word-similarity

Calculate word similarity via word2vec

## How to run it

### Using Makefile (recommended)

```shell
make run
```

This will perform compile, train and test automatically

### Using Raw Method
```shell
gcc word2vec.c -o word2vec
gcc distance-pairs.c -o distance-pairs
./word2vec  -train training.txt -output vectors.bin -size 200 -window 10 -negative 5 -hs 1 -sample 1e-3 -threads 4 -binary 1
./distance-pairs vectors.bin pairs.txt
```

## Reference

 - https://code.google.com/p/word2vec/
