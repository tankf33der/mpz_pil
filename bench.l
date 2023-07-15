(load "libgmp.l")
(setq A (mpz_create)  B (mpz_create))
(mpz_init A)
(mpz_init B)

(prinl "+ 100k loop:")
(let (U (usec)  N 12345678901234567890)
   (prin "PIL: ")
   (do 100000
      (setq N (+ N N)) )
   (println (format (*/ (- (usec) U) 1000) 3) 'sec) )
(let (U (usec)  N "12345678901234567890")
   (prin "GMP: ")
   (mpz_set_str A N)
   (do 100000
      (mpz_add A A A) )
   (println (format (*/ (- (usec) U) 1000) 3) 'sec) )
(prinl)

(prinl "* 100k loop:")
(let (U (usec)  N 12345)
   (prin "PIL: ")
   (do 100000
      (setq N (* N 1024)) )
   (println (format (*/ (- (usec) U) 1000) 3) 'sec) )
(let (U (usec)  N "12345" N2 "1024")
   (prin "GMP: ")
   (mpz_set_str A N)
   (mpz_set_str B N2)
   (do 100000
      (mpz_mul A A B) )
   (println (format (*/ (- (usec) U) 1000) 3) 'sec) )
(%@ "free" NIL A)
(%@ "free" NIL B)

(msg 'ok)
(bye)
