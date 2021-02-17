(load "libgmp.l")
(seed (in "/dev/urandom" (rd 8)))
(de randL (N)
   (pack
      (make
         (when (rand T) (link '-))
         (do N
            (link (rand 0 9)) ) ) ) )
(de pil_mod (X Y)
   (let Y (abs Y)
      (% (+ Y (% X Y)) Y) ) )
(de pil_cmp (X Y)
   (cond
      ((= A B) 0)
      ((> A B) 1)
      (T -1) ) )
# main
(let (A (mpz_create)  B (mpz_create)  Z (mpz_create))
   (mpz_init A)
   (mpz_init B)
   (mpz_init Z)

   (do 1000
      (prin ".")(flush)
      (let
         (X1 (randL (rand 10000 20000))
            X2 (randL (rand 10000 20000))
            Y1 (format X1)
            Y2 (format X2) )

         (mpz_set_str A X1)
         (mpz_set_str B X2)

         (mpz_add Z A B)
         (test (+ Y1 Y2) (format (mpz_get_str Z)))
         

      )
   )


   (mpz_clear A)
   (mpz_clear B)
   (mpz_clear Z)
   (%@ "free" NIL A)
   (%@ "free" NIL B)
   (%@ "free" NIL Z)

   
)

(msg 'All-ok)
(bye)
