(gc 8192)
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
         (let
            (X1 (randL (rand 50000000 100000000))
               X2 (randL (rand 50000000 100000000)) )
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
