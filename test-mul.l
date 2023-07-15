(seed (in "/dev/urandom" (rd 8)))
(load "libgmp.l")
(de randL (N)
   (pack
      (make
         (do N
            (link (rand 0 9)) ) ) ) )
(let (A (mpz_create)  B (mpz_create)  Z (mpz_create))
   (mpz_init A)
   (mpz_init B)
   (mpz_init Z)
   (do 10000000
      (at (0 . 100000) (prin ".") (flush))
      (let
         (Y1 (in "/dev/urandom" (rd 128))
            Y2 (in "/dev/urandom" (rd 128))
            X1 (format Y1)
            X2 (format Y2) )
         (mpz_set_str A X1)
         (mpz_set_str B X2)

         (mpz_mul Z A B)
         (test (* Y1 Y2) (format (mpz_get_str Z))) ) )
   (mpz_clear A)
   (mpz_clear B)
   (mpz_clear Z)
   (%@ "free" NIL A)
   (%@ "free" NIL B)
   (%@ "free" NIL Z) )
(prinl)
(msg 'All-ok)
(bye)

