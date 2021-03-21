(load "libgmp.l")

(de get_str (P Base)   # XXX, leak warning
   (let Str NIL
      (default Base 10)
      (native "libgmp.so" "__gmpz_get_str" NIL '(Str (7 C . 7)) Base P)
      (pack Str) ) )
 

(setq A (mpz_create)  B (mpz_create))
(mpz_init A)
(mpz_init B)
(mpz_set_str A "123")
(mpz_set_str B "100")
(mpz_mul A A B)

(do 3
   (println (get_str A))
)



(msg 'ok)
(bye)
