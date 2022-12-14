PicoLisp bindings to [gmp](https://gmplib.org/) library for
[mpz_*](https://gmplib.org/manual/Integer-Functions) only functions.

##### RESULTS:
60% of 160 functions implemented and PicoLisp's
[bigmath](https://git.envs.net/mpech/pil21/src/branch/master/src/big.l)
passed all tests.

##### BENCHMARKING:
`Intel(R) Core(TM) i7-4790K CPU @ 4.00GHz`

```
$ pil bench.l +
+ 100k loop:
PIL: "0.429" sec
GMP: "0.038" sec

* 100k loop:
PIL: "4.424" sec
GMP: "0.462" sec
ok
$
```

Happy coding.


Attention: incorrect using of `mpz_get_str` create memory leaks. Example code for replacement, returns list of digits:
```
(de mpz_get_str (P Base)
   (default Base 10)
   (let (N (+ (mpz_sizeinbase P Base) 2)  Str)	# sign and zero chars
      (native "libgmp.so" "__gmpz_get_str" NIL (list 'Str (cons N 'C N)) Base P)
      Str ) )
```
