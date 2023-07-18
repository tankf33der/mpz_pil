(load "libgmp.l")
(de mike ()
   (let A (mpz_malloc)
      (mpz_init A)
      # memory leak protection
      (mpz_free A) ) )
(loop (mike))
(msg 'ok)
(bye)
