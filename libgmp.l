# TYPES:
# mpz_t = 16
# mp_bitcnt_t = unsigned long int

# 5.1 Initialization Functions
(de mpz_create NIL
   (%@ "malloc" 'P 16) )
(de mpz_init (P)
   (native "libgmp.so" "__gmpz_init" NIL P) )
(de mpz_clear (P)
   (native "libgmp.so" "__gmpz_clear" NIL P) )
# 5.2 Assignment Functions
(de mpz_set (A B)
   (native "libgmp.so" "__gmpz_set" NIL A B) )
(de mpz_set_ui (A B)
   (native "libgmp.so" "__gmpz_set_ui" NIL A B) )
(de mpz_set_si (A B)
   (native "libgmp.so" "__gmpz_set_si" NIL A B) )
(de mpz_set_str (A B Base)
   (default Base 10)
   (native "libgmp.so" "__gmpz_set_str" NIL A B Base) )
(de mpz_swap (A B)
   (native "libgmp.so" "__gmpz_swap" NIL A B) )
# 5.3 Combined Initialization and Assignment Functions
(de mpz_init_set (A B)
   (native "libgmp.so" "__gmpz_init_set" NIL A B) )
(de mpz_init_set_ui (A B)
   (native "libgmp.so" "__gmpz_init_set_ui" NIL A B) )
(de mpz_init_set_si (A B)
   (native "libgmp.so" "__gmpz_init_set_si" NIL A B) )
(de mpz_init_set_str (A B Base)
   (default Base 10)
   (native "libgmp.so" "__gmpz_init_set_str" NIL A B Base) )
# 5.4 Conversion Functions
(de mpz_get_ui (A)
   (native "libgmp.so" "__gmpz_get_ui" 'P A) )
(de mpz_get_si (A)
   (native "libgmp.so" "__gmpz_get_si" 'N A) )
(de mpz_get_str (P Base)
   (default Base 10)
   (native "libgmp.so" "__gmpz_get_str" 'S 0 Base P) )
# 5.5 Arithmetic Functions
(de mpz_add (A B C)
   (native "libgmp.so" "__gmpz_add" NIL A B C) )
(de mpz_add_ui (A B C)
   (native "libgmp.so" "__gmpz_add_ui" NIL A B C) )
(de mpz_sub (A B C)
   (native "libgmp.so" "__gmpz_sub" NIL A B C) )
(de mpz_sub_ui (A B C)
   (native "libgmp.so" "__gmpz_sub_ui" NIL A B C) )
(de mpz_mul (A B C)
   (native "libgmp.so" "__gmpz_mul" NIL A B C) )
(de mpz_mul_ui (A B C)
   (native "libgmp.so" "__gmpz_mul_ui" NIL A B C) )
(de mpz_mul_si (A B C)
   (native "libgmp.so" "__gmpz_mul_si" NIL A B C) )
(de mpz_addmul (A B C) # A = A + B times C
   (native "libgmp.so" "__gmpz_addmul" NIL A B C) )
(de mpz_addmul_ui (A B C)
   (native "libgmp.so" "__gmpz_addmul_ui" NIL A B C) )
(de mpz_submul (A B C) # A = A - B times C
   (native "libgmp.so" "__gmpz_submul" NIL A B C) )
(de mpz_submul_ui (A B C)
   (native "libgmp.so" "__gmpz_submul_ui" NIL A B C) )
(de mpz_mul_2exp (A B C) # A = A * 2 ** C, C is mp_bitcnt_t
   (native "libgmp.so" "__gmpz_mul_2exp" NIL A B C) )
(de mpz_neg (A B)
   (native "libgmp.so" "__gmpz_neg" NIL A B) )
(de mpz_abs (A B)
   (native "libgmp.so" "__gmpz_abs" NIL A B) )
# 5.6 Division Functions

(let (N (mpz_create)  Z (mpz_create))
   (mpz_init N)
   (mpz_init Z)
   (mpz_set_str N "5")
   (mpz_set_str Z "5")

   (mpz_mul_2exp N N 5)
   (mpz_neg N N)
   (println (mpz_get_str N))
   (mpz_abs N N)
   (println (mpz_get_str N))
)

(msg 'ok)
(bye)
