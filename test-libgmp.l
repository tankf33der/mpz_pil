(load "libgmp.l")

# # 5.1 Initialization Functions
# (de mpz_create NIL
# (de mpz_init (P)
# (de mpz_clear (P)
(let (A (mpz_create)  B (mpz_create))
   (mpz_init A)
   (mpz_init B)
   (test (bool (num? A)) (bool (num? A)))
   (test 0 (mpz_get_ui A))

   (mpz_clear A)
   (mpz_clear B)
   (%@ "free" NIL A)
   (%@ "free" NIL B) )

# # 5.2 Assignment Functions
# (de mpz_set (A B)
# (de mpz_set_ui (A B)
# (de mpz_set_si (A B)
# (de mpz_set_str (A B Base)
# (de mpz_swap (A B)
(let (A (mpz_create)  B (mpz_create)  C (mpz_create))
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
   (%@ "free" NIL A)
   (%@ "free" NIL B)
   (%@ "free" NIL C) )

# # 5.3 Combined Initialization and Assignment Functions
# (de mpz_init_set (A B)
# (de mpz_init_set_ui (A B)
# (de mpz_init_set_si (A B)
# (de mpz_init_set_str (A B Base)
(let (A (mpz_create)  B (mpz_create)  C (mpz_create))
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
   (%@ "free" NIL A)
   (%@ "free" NIL B)
   (%@ "free" NIL C) )

# # 5.4 Conversion Functions
# (de mpz_get_ui (A)
# (de mpz_get_si (A)
# (de mpz_get_str (P Base)
(let (A (mpz_create)  B (mpz_create))
   (mpz_init_set_str A "-1234")
   (mpz_init_set_str B "1234")
   (test "-1234" (mpz_get_str A))
   (test "1234" (mpz_get_str B))

   (mpz_clear A)
   (mpz_clear B)
   (%@ "free" NIL A)
   (%@ "free" NIL B) )

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
(let (A (mpz_create)  B (mpz_create)  C (mpz_create))
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
   (%@ "free" NIL A)
   (%@ "free" NIL B)
   (%@ "free" NIL C) )

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
(let (A (mpz_create)  B (mpz_create)  C (mpz_create)  D (mpz_create))
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
   (%@ "free" NIL A)
   (%@ "free" NIL B)
   (%@ "free" NIL C) )



(msg 'All-ok)
(bye)
