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


Attention: incorrect using `mpz_get_str` create memory leaks.
