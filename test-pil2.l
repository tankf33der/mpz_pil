(seed (in "/dev/urandom" (rd 8)))
(load "libgmp.l")
(de randL (N)
   (pack
      (make
         (do N
            (link (rand 1 9)) ) ) ) )
# main
(let (A (mpz_malloc)  B (mpz_malloc)  Z (mpz_malloc))
   (mpz_init A)
   (mpz_init B)
   (mpz_init Z)
   (out "result.dat"
      (do 10
         (at (0 . 1) (prin ".") (flush))
         (let
            (X1 (randL (rand 500000 1000000))
               X2 (randL (rand 500000 1000000)) )
            (mpz_set_str A X1)
            (mpz_set_str B X2)

            (println X1)
            (mpz_mul A A B)
            (mpz_tdiv_q Z A B)
            (println (mpz_get_str Z))
         )
      )
   )
)
(msg 'ok)
(bye)
