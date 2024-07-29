(load "libgmp.l")


# # 5.1 Initialization Functions
# (de mpz_malloc NIL
# (de mpz_init (P)
# (de mpz_clear (P)
# (de mpz_free (P)
(let (A (mpz_malloc)  B (mpz_malloc))
   (mpz_init A)
   (mpz_init B)
   (test (bool (num? A)) (bool (num? A)))
   (test 0 (mpz_get_ui A))

   (mpz_clear A)
   (mpz_clear B)
   (mpz_free A)
   (mpz_free B) )

# # 5.2 Assignment Functions
# (de mpz_set (A B)
# (de mpz_set_ui (A B)
# (de mpz_set_si (A B)
# (de mpz_set_str (A B Base)
# (de mpz_swap (A B)
(let (A (mpz_malloc)  B (mpz_malloc)  C (mpz_malloc))
   (mpz_init A)
   (mpz_init B)
   (mpz_init C)

   (mpz_set_ui A 1)
   (mpz_set B A)
   (test 1 (mpz_get_ui A))
   (test (mpz_get_ui A) (mpz_get_ui B))
   (mpz_set_si A -1)
   (mpz_set B A)
   (test -1 (mpz_get_si A))
   (test (mpz_get_si A) (mpz_get_si B))

   (mpz_set_str C "1234")
   (mpz_swap A C)
   (test 1234 (mpz_get_ui A))
   (mpz_set_str C "-1234")
   (mpz_swap A C)
   (test -1234 (mpz_get_si A))

   (mpz_clear A)
   (mpz_clear B)
   (mpz_clear C)
   (mpz_free A)
   (mpz_free B)
   (mpz_free C) )

# # 5.3 Combined Initialization and Assignment Functions
# (de mpz_init_set (A B)
# (de mpz_init_set_ui (A B)
# (de mpz_init_set_si (A B)
# (de mpz_init_set_str (A B Base)
(let (A (mpz_malloc)  B (mpz_malloc)  C (mpz_malloc))
   (mpz_init_set_ui A 1)
   (mpz_init_set B A)
   (test 1 (mpz_get_ui A))
   (test (mpz_get_ui A) (mpz_get_ui B))
   (mpz_init_set_si A -1)
   (mpz_init_set B A)
   (test -1 (mpz_get_si A))
   (test (mpz_get_si A) (mpz_get_si B))

   (mpz_init_set_str C "1234")
   (mpz_swap A C)
   (test 1234 (mpz_get_ui A))
   (mpz_init_set_str C "-1234")
   (mpz_swap A C)
   (test -1234 (mpz_get_si A))

   (mpz_clear A)
   (mpz_clear B)
   (mpz_clear C)
   (mpz_free A)
   (mpz_free B)
   (mpz_free C) )

# # 5.4 Conversion Functions
# (de mpz_get_ui (A)
# (de mpz_get_si (A)
# (de mpz_get_str (P Base)
(let (A (mpz_malloc)  B (mpz_malloc))
   (mpz_init_set_str A "-1234")
   (mpz_init_set_str B "1234")
   (test "-1234" (mpz_get_str A))
   (test "1234" (mpz_get_str B))

   (mpz_clear A)
   (mpz_clear B)
   (mpz_free A)
   (mpz_free B) )

# # 5.5 Arithmetic Functions
# (de mpz_add (A B C)
# (de mpz_add_ui (A B C)
# (de mpz_sub (A B C)
# (de mpz_sub_ui (A B C)
# (de mpz_mul (A B C)
# (de mpz_mul_ui (A B C)
# (de mpz_mul_si (A B C)
# (de mpz_addmul (A B C)
# (de mpz_addmul_ui (A B C)
# (de mpz_submul (A B C)
# (de mpz_submul_ui (A B C)
# (de mpz_mul_2exp (A B C)
# (de mpz_neg (A B)
# (de mpz_abs (A B)
(let (A (mpz_malloc)  B (mpz_malloc)  C (mpz_malloc))
   (mpz_init A)
   (mpz_init B)
   (mpz_init C)

   (mpz_set_ui A 1)
   (mpz_set_ui B 2)
   (mpz_set_ui C 3)

   (mpz_add A B C)
   (test "5" (mpz_get_str A))
   (mpz_add_ui A A 5)
   (test "10" (mpz_get_str A))

   (mpz_sub A A C)
   (test "7" (mpz_get_str A))
   (mpz_sub_ui A A 1)
   (test "6" (mpz_get_str A))

   (mpz_mul B B B)
   (test "4" (mpz_get_str B))
   (mpz_mul_ui B B 10)
   (test "40" (mpz_get_str B))
   (mpz_mul_si B B -10)
   (test "-400" (mpz_get_str B))

   (mpz_addmul A B C)
   (test "-1194" (mpz_get_str A))
   (mpz_addmul_ui A B 2)
   (test "-1994" (mpz_get_str A))

   (mpz_submul A B C)
   (test "-794" (mpz_get_str A))
   (mpz_submul_ui A B 2)
   (test "6" (mpz_get_str A))

   (mpz_set_ui A 21)
   (mpz_set_ui B 32)
   (mpz_mul_2exp A B 4)
   (test "512" (mpz_get_str A))

   (mpz_neg B A)
   (test "-512" (mpz_get_str B))

   (mpz_abs B B)
   (test "512" (mpz_get_str B))

   (mpz_clear A)
   (mpz_clear B)
   (mpz_clear C)
   (mpz_free A)
   (mpz_free B)
   (mpz_free C) )

# # 5.6 Division Functions
# # CDIV
# (de mpz_cdiv_q (A B C)
# (de mpz_cdiv_r (A B C)
# (de mpz_cdiv_qr (A B C D)
# (de mpz_cdiv_q_ui (A B C)
# (de mpz_cdiv_r_ui (A B C)
# (de mpz_cdiv_qr_ui (A B C D)
# (de mpz_cdiv_ui (A B)
# (de mpz_cdiv_q_2exp (A B C) # C is mp_bitcnt_t
# (de mpz_cdiv_r_2exp (A B C) # C is mp_bitcnt_t
# # FDIV
# (de mpz_fdiv_q (A B C)
# (de mpz_fdiv_r (A B C)
# (de mpz_fdiv_qr (A B C D)
# (de mpz_fdiv_q_ui (A B C)
# (de mpz_fdiv_r_ui (A B C)
# (de mpz_fdiv_qr_ui (A B C D)
# (de mpz_fdiv_ui (A B)
# (de mpz_fdiv_q_2exp (A B C) # C is mp_bitcnt_t
# (de mpz_fdiv_r_2exp (A B C) # C is mp_bitcnt_t
# # TDIV
# (de mpz_tdiv_q (A B C)
# (de mpz_tdiv_r (A B C)
# (de mpz_tdiv_qr (A B C D)
# (de mpz_tdiv_q_ui (A B C)
# (de mpz_tdiv_r_ui (A B C)
# (de mpz_tdiv_qr_ui (A B C D)
# (de mpz_tdiv_ui (A B)
# (de mpz_tdiv_q_2exp (A B C) # C is mp_bitcnt_t
# (de mpz_tdiv_r_2exp (A B C) # C is mp_bitcnt_t
# # MOD
# (de mpz_mod (A B C)
# # DIVEXACT
# (de mpz_divexact (A B C)
# (de mpz_divexact_ui (A B C)
# # DIVISIBLE
# (de mpz_divisible_p (A B)
# (de mpz_divisible_ui_p (A B)
# (de mpz_divisible_2exp_p (A B) # B is mp_bitcnt_t
# # CONGRUENT
# (de mpz_congruent_p (A B C)
# (de mpz_congruent_ui_p (A B C)
# (de mpz_congruent_2exp_p (A B C) # C is mp_bitcnt_t
(let (A (mpz_malloc)  B (mpz_malloc)  C (mpz_malloc)  D (mpz_malloc))
   (mpz_init A)
   (mpz_init B)
   (mpz_init C)
   (mpz_init D)

   # CDIV
   (mpz_set_ui A 1234567890)
   (mpz_set_ui B 22345)
   (mpz_set_ui C 33)

   (mpz_cdiv_q D A B)
   (test "55251" (mpz_get_str D))
   (mpz_cdiv_r D A B)
   (test "-15705" (mpz_get_str D))
   (mpz_cdiv_qr D A B C)
   (test "678" (mpz_get_str D))

   (mpz_cdiv_q_ui D A 7)
   (test "-4" (mpz_get_str D))
   (mpz_cdiv_r_ui D A 7)
   (test "-1" (mpz_get_str D))
   (mpz_cdiv_qr_ui D A B 7)
   (test "3193" (mpz_get_str D))
   (mpz_cdiv_ui A 7)
   (test "-6" (mpz_get_str A))

   (mpz_set_ui A 6121)
   (mpz_cdiv_q_2exp D A 2)
   (test "1531" (mpz_get_str D))
   (mpz_set_ui A 6121)
   (mpz_cdiv_r_2exp D A 3)
   (test "-7" (mpz_get_str D))


   # FDIV
   (mpz_set_ui A 1234567890)
   (mpz_set_ui B 22345)
   (mpz_set_ui C 33)

   (mpz_fdiv_q D A B)
   (test "55250" (mpz_get_str D))
   (mpz_fdiv_r D A B)
   (test "6640" (mpz_get_str D))
   (mpz_fdiv_qr D A B C)
   (test "677" (mpz_get_str D))

   (mpz_fdiv_q_ui D A 7)
   (test "0" (mpz_get_str D))
   (mpz_fdiv_r_ui D A 7)
   (test "4" (mpz_get_str D))
   (mpz_fdiv_qr_ui D A B 7)
   (test "3192" (mpz_get_str D))
   (mpz_fdiv_ui A 7)
   (test "1" (mpz_get_str A))

   (mpz_set_ui A 6121)
   (mpz_fdiv_q_2exp D A 2)
   (test "1530" (mpz_get_str D))
   (mpz_set_ui A 6121)
   (mpz_fdiv_r_2exp D A 3)
   (test "1" (mpz_get_str D))

   # TDIV
   (mpz_set_ui A 1234567890)
   (mpz_set_ui B 22345)
   (mpz_set_ui C 33)

   (mpz_tdiv_q D A B)
   (test "55250" (mpz_get_str D))
   (mpz_tdiv_r D A B)
   (test "6640" (mpz_get_str D))
   (mpz_tdiv_qr D A B C)
   (test "677" (mpz_get_str D))

   (mpz_tdiv_q_ui D A 7)
   (test "0" (mpz_get_str D))
   (mpz_tdiv_r_ui D A 7)
   (test "4" (mpz_get_str D))
   (mpz_tdiv_qr_ui D A B 7)
   (test "3192" (mpz_get_str D))
   (mpz_tdiv_ui A 7)
   (test "1" (mpz_get_str A))

   (mpz_set_ui A 6121)
   (mpz_tdiv_q_2exp D A 2)
   (test "1530" (mpz_get_str D))
   (mpz_set_ui A 6121)
   (mpz_tdiv_r_2exp D A 3)
   (test "1" (mpz_get_str D))

   # MOD
   (mpz_set_ui A 1234567)
   (mpz_set_ui B 654)
   (mpz_mod D A B)
   (test "469" (mpz_get_str D))

   # EXACT
   (mpz_set_ui A 10000)
   (mpz_set_ui B 10)
   (mpz_divexact D A B)
   (test "1000" (mpz_get_str D))
   (mpz_divexact_ui D A 100)
   (test "100" (mpz_get_str D))

   # DIVISIBLE
   (mpz_set_ui A 10000)
   (mpz_set_ui B 100)
   (mpz_set_ui C 101)
   (test 1 (mpz_divisible_p A B))
   (test 0 (mpz_divisible_p A C))
   (test 1 (mpz_divisible_ui_p A 10))
   (test 0 (mpz_divisible_ui_p A 7))
   (mpz_set_ui A 64)
   (test 1 (mpz_divisible_2exp_p A 3))
   (mpz_set_ui A 65)
   (test 0 (mpz_divisible_2exp_p A 3))

   # CONGRUENT
   (mpz_set_ui A 17)
   (mpz_set_ui B 5)
   (mpz_set_ui C 3)
   (test 1 (mpz_congruent_p A B C))
   (test 1 (mpz_congruent_ui_p A 5 3))
   (test 0 (mpz_congruent_ui_p A 5 401))
   (test 1 (mpz_congruent_2exp_p A B 2))
   (test 0 (mpz_congruent_2exp_p A B 3))

   (mpz_clear A)
   (mpz_clear B)
   (mpz_clear C)
   (mpz_clear D)
   (mpz_free A)
   (mpz_free B)
   (mpz_free C)
   (mpz_free D) )

# # 5.7 Exponentiation Functions
# (de mpz_powm (A B C D)
# (de mpz_powm_ui (A B C D)
# (de mpz_powm_sec (A B C D)
# (de mpz_pow_ui (A B C)
# (de mpz_ui_pow_ui (A B C)
(let (A (mpz_malloc)  B (mpz_malloc)  C (mpz_malloc)  D (mpz_malloc))
   (mpz_init A)
   (mpz_init B)
   (mpz_init C)
   (mpz_init D)

   (mpz_set_ui A 344)
   (mpz_set_ui B 34)
   (mpz_set_ui C 3411)
   (mpz_powm D A B C)
   (test "1735" (mpz_get_str D))
   (mpz_powm_ui D A 234 C)
   (test "595" (mpz_get_str D))
   (mpz_powm_sec D A B C)
   (test "1735" (mpz_get_str D))

   (mpz_pow_ui D A 3)
   (test "40707584" (mpz_get_str D))
   (mpz_ui_pow_ui D 344 3)
   (test "40707584" (mpz_get_str D))

   (mpz_clear A)
   (mpz_clear B)
   (mpz_clear C)
   (mpz_clear D)
   (mpz_free A)
   (mpz_free B)
   (mpz_free C)
   (mpz_free D) )

# # 5.8 Root Extraction Functions
# (de mpz_root (A B C)
# (de mpz_rootrem (A B C D)
# (de mpz_sqrt (A B)
# (de mpz_sqrtrem (A B C)
# (de mpz_perfect_power_p (A)
# (de mpz_perfect_square_p (A)
(let (A (mpz_malloc)  B (mpz_malloc)  C (mpz_malloc)  D (mpz_malloc))
   (mpz_init A)
   (mpz_init B)
   (mpz_init C)
   (mpz_init D)

   (mpz_set_ui A 344)
   (mpz_set_ui B 44)
   (mpz_root D A 3)
   (test "7" (mpz_get_str D))
   (mpz_rootrem D A B 3)
   (test "3" (mpz_get_str D))

   (mpz_sqrt D A)
   (test "4" (mpz_get_str D))
   (mpz_sqrtrem D A B)
   (test "6" (mpz_get_str D))

   (test 1 (mpz_perfect_power_p A))
   (test 0 (mpz_perfect_square_p A))

   (mpz_clear A)
   (mpz_clear B)
   (mpz_clear C)
   (mpz_clear D)
   (mpz_free A)
   (mpz_free B)
   (mpz_free C)
   (mpz_free D) )

# # 5.9 Number Theoretic Functions
# (de mpz_probab_prime_p (A B) # B is int
# (de mpz_nextprime (A B)
# (de mpz_gcd (A B C)
# (de mpz_gcd_ui (A B C) # C is uint
# (de mpz_gcdext (A B C D E)
# (de mpz_lcm (A B C)
# (de mpz_lcm_ui (A B C) # C is ulong
(let (A (mpz_malloc)  B (mpz_malloc)  C (mpz_malloc)  D (mpz_malloc))
   (mpz_init A)
   (mpz_init B)
   (mpz_init C)
   (mpz_init D)

   (mpz_set_str A "34409834908340934809348098340983409348093480934809348093489")
   (test 0 (mpz_probab_prime_p A 32))
   (mpz_nextprime B A)
   (test 1 (mpz_probab_prime_p B 32))

   (mpz_set_ui A 978)
   (mpz_set_str B "89798763754892653453379597352537489494736")
   (mpz_gcd D A B)
   (test "6" (mpz_get_str D))

   (mpz_set_ui A 123455)
   (mpz_set_ui B 3111)
   (mpz_lcm D A B)
   (test "384068505" (mpz_get_str D))

   (mpz_clear A)
   (mpz_clear B)
   (mpz_clear C)
   (mpz_clear D)
   (mpz_free A)
   (mpz_free B)
   (mpz_free C)
   (mpz_free D) )

# # 5.10 Comparison Functions
# (de mpz_cmp (A B)
# (de mpz_cmp_si (A B)
# (de mpz_cmp_ui (A B)
# (de mpz_cmpabs (A B)
# (de mpz_cmpabs_ui (A B) # B is ulong
(let (A (mpz_malloc)  B (mpz_malloc)  C (mpz_malloc)  D (mpz_malloc))
   (mpz_init A)
   (mpz_init B)
   (mpz_init C)
   (mpz_init D)

   (mpz_set_ui A 1234)
   (mpz_set_ui B 123)
   (test 0 (mpz_cmp A A))
   (test 1 (mpz_cmp A B))
   (test -1 (mpz_cmp B A))
   (test 0 (mpz_cmp_si A 1234))
   (test 1 (mpz_cmp_si A 1233))
   (test -1 (mpz_cmp_si B 124))
   (test 0 (mpz_cmp_ui A 1234))
   (test 1 (mpz_cmp_ui A 1233))
   (test -1 (mpz_cmp_ui B 124))

   (mpz_set_si A 123)
   (mpz_set_si B -123)
   (test 0 (mpz_cmpabs A B))

   (mpz_clear A)
   (mpz_clear B)
   (mpz_clear C)
   (mpz_clear D)
   (mpz_free A)
   (mpz_free B)
   (mpz_free C)
   (mpz_free D) )

# # 5.11 Logical and Bit Manipulation Functions
# (de mpz_and (A B C)
# (de mpz_ior (A B C)
# (de mpz_xor (A B C)
# (de mpz_com (A B)
# (de mpz_popcount (A)
# (de mpz_hamdist (A B)
# (de mpz_scan0 (A B) # B is mp_bitcnt_t
# (de mpz_scan1 (A B) # B is mp_bitcnt_t
# (de mpz_setbit (A B) # B is mp_bitcnt_t
# (de mpz_clrbit (A B) # B is mp_bitcnt_t
# (de mpz_combit (A B) # B is mp_bitcnt_t
# (de mpz_tstbit (A B) # B is mp_bitcnt_t
(let (A (mpz_malloc)  B (mpz_malloc)  C (mpz_malloc)  D (mpz_malloc))
   (mpz_init A)
   (mpz_init B)
   (mpz_init C)
   (mpz_init D)

   (mpz_set_ui A 1234)
   (mpz_set_ui B 123)

   (mpz_and D A B)
   (test "82" (mpz_get_str D))
   (mpz_ior D A B)
   (test "1275" (mpz_get_str D))
   (mpz_xor D A B)
   (test "1193" (mpz_get_str D))

   (mpz_clear A)
   (mpz_clear B)
   (mpz_clear C)
   (mpz_clear D)
   (mpz_free A)
   (mpz_free B)
   (mpz_free C)
   (mpz_free D) )

#################################################################################
#
# Floating-point Functions
#
#################################################################################
# 7.1 Initialization Functions
(let (A (mpf_malloc))
   (mpf_set_default_prec 128)
   (test 128 (mpf_get_default_prec))
   (mpf_free A) )












(msg 'All-ok)
(bye)
