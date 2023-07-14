(load "libgmp.l")

(de get_str (P Base)
   (default Base 10)
   (let (N (+ (mpz_sizeinbase P Base) 2)  Str)	# sign and zero chars
      (native "libgmp.so" "__gmpz_get_str" NIL (list 'Str (cons N 'C N)) Base P)
      (pack Str) ) )


(setq A (mpz_create)  B (mpz_create))
(mpz_init A)
(mpz_init B)
(mpz_set_str A "1234")
(mpz_set_str B "100")
(mpz_mul A A B)

(do 100000000000000000
   (println (mpz_get_str A))
)



(msg 'ok)
(bye)
