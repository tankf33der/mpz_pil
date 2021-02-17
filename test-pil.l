(load "libgmp.l")
(seed (in "/dev/urandom" (rd 8)))
(de randL (N F)
   (pack
      (make
         (and 
            F
            (rand T)
            (link '-) )
         (do N
            (link (rand 0 9)) ) ) ) )
(de pil_mod (X Y)
   (let Y (abs Y)
      (% (+ Y (% X Y)) Y) ) )
(de pil_cmp (X Y)
   (cond
      ((= X Y) 0)
      ((> X Y) 1)
      (T -1) ) )
(de bitwise (F N1 N2)
   (fromtwo
      (F (totwo N1) (totwo N2)) ) )
# main
(setq Start 32  End 32000)
(let (A (mpz_create)  B (mpz_create)  Z (mpz_create))
   (mpz_init A)
   (mpz_init B)
   (mpz_init Z)
   (do 1000000
      (at (0 . 10000) (prin ".") (flush))
      (let
         (X1 (randL (rand Start End) T)
            X2 (randL (rand Start End) T)
            Y1 (format X1)
            Y2 (format X2) )

         (mpz_set_str A X1)
         (mpz_set_str B X2)

         (mpz_add Z A B)
         (test (+ Y1 Y2) (format (mpz_get_str Z)))
         (mpz_sub Z A B)
         (test (- Y1 Y2) (format (mpz_get_str Z)))
         (mpz_mul Z A B)
         (test (* Y1 Y2) (format (mpz_get_str Z)))
         (mpz_tdiv_q Z A B)
         (test (/ Y1 Y2) (format (mpz_get_str Z)))
         (mpz_mod Z A B)
         (test (pil_mod Y1 Y2) (format (mpz_get_str Z)))
         (test (pil_cmp Y1 Y2) (mpz_cmp A B))

         # Positives only
         (setq
            X1 (randL (rand Start End))
            X2 (randL (rand Start End))
            Y1 (format X1)
            Y2 (format X2) )
         (mpz_set_str A X1)
         (mpz_set_str B X2)

         (mpz_sqrt Z A)
         (test (sqrt Y1) (format (mpz_get_str Z)))
         (mpz_and Z A B)
         (test (& Y1 Y2) (format (mpz_get_str Z)))
         (mpz_ior Z A B)
         (test (| Y1 Y2) (format (mpz_get_str Z)))
         (mpz_xor Z A B)
         (test (x| Y1 Y2) (format (mpz_get_str Z))) ) )
   (mpz_clear A)
   (mpz_clear B)
   (mpz_clear Z)
   (%@ "free" NIL A)
   (%@ "free" NIL B)
   (%@ "free" NIL Z) )
(prinl)
(msg 'All-ok)
(bye)
