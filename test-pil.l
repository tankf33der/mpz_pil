(gc 128)
(seed (in "/dev/urandom" (rd 8)))
(load "libgmp.l")
(de randL (N)
   (pack
      (make
         (do N
            (link (rand 0 9)) ) ) ) )
(de pil_cmp (X Y)
   (cond
      ((< X Y) -1)
      ((> X Y) 1)
      (T 0) ) )
# main
(let (A (mpz_malloc)  B (mpz_malloc)  Z (mpz_malloc))
   (mpz_init A)
   (mpz_init B)
   (mpz_init Z)
   (do 1
#      (at (0 . 10) (prin ".") (flush))
      (let
         (X1 (randL (rand 2 4))
            X2 (randL (rand 2 4))
            Y1 (format X1)
            Y2 (format X2) )
         (mpz_set_str A X1)
         (mpz_set_str B X2)

         (mpz_and A A B)
         (println 'before Y1 Y2)
         (setq Y1 (& Y1 Y2))
         #(mpz_ior A A B)
         #(println 'before Y1 Y2)
         #(setq Y1 (| Y1 Y2))

         (println 'after Y1 Y2)
         (test Y1 (format (mpz_get_str A)))
#{
          (mpz_add Z A B)
         (test (+ Y1 Y2) (format (mpz_get_str Z)))
         (mpz_sub Z A B)
         (test (- Y1 Y2) (format (mpz_get_str Z)))
         (mpz_mul Z A B)
         (test (* Y1 Y2) (format (mpz_get_str Z)))
         (mpz_tdiv_q Z A B)
         (test (/ Y1 Y2) (format (mpz_get_str Z)))
         (mpz_mod Z A B)
         (test (% Y1 Y2) (format (mpz_get_str Z)))
         (let (P (pil_cmp Y1 Y2)  G (mpz_cmp A B))
            (cond
               ((and (gt0 P) (gt0 G)))
               ((and (lt0 P) (lt0 G)))
               ((and (=0 P) (=0 G)))
               (T (quit "Comparison failed")) ) )
         (mpz_sqrt Z A)
         (test (sqrt Y1) (format (mpz_get_str Z)))
         + (mpz_and Z A B)
         (test (& Y1 Y2) (format (mpz_get_str Z)))
         (mpz_ior Z A B)
         (test (| Y1 Y2) (format (mpz_get_str Z)))
         + (mpz_xor Z A B)
         (test (x| Y1 Y2) (format (mpz_get_str Z)))
}#
      ) # let
   ) # do
   (mpz_free A)
   (mpz_free B)
   (mpz_free Z)
)
(prinl)
(msg 'All-ok)
(bye)
