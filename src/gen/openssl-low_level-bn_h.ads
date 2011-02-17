with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with OpenSSL.Low_Level.crypto_h;
with OpenSSL.Low_Level.bio_h;
with Interfaces.C_Streams;
package OpenSSL.Low_Level.bn_h is
   package defs is
   --  unsupported macro: BN_ULLONG unsigned long long

      BN_MASK : constant := (16#ffffffffffffffff#);  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:243
      --  unsupported macro: BN_ULONG unsigned int
      --  unsupported macro: BN_LONG int

      BN_BITS : constant := 64;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:248
      BN_BYTES : constant := 4;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:249
      BN_BITS2 : constant := 32;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:250
      BN_BITS4 : constant := 16;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:251
      BN_MASK2 : constant := (16#ffffffff#);  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:252
      BN_MASK2l : constant := (16#ffff#);  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:253
      BN_MASK2h1 : constant := (16#ffff8000#);  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:254
      BN_MASK2h : constant := (16#ffff0000#);  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:255
      BN_TBIT : constant := (16#80000000#);  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:256
      BN_DEC_CONV : constant := (1000000000);  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:257
      BN_DEC_FMT1 : aliased constant String := "%u" & ASCII.NUL;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:258
      BN_DEC_FMT2 : aliased constant String := "%09u" & ASCII.NUL;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:259
      BN_DEC_NUM : constant := 9;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:260
      BN_HEX_FMT1 : aliased constant String := "%X" & ASCII.NUL;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:261
      BN_HEX_FMT2 : aliased constant String := "%08X" & ASCII.NUL;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:262

      BN_DEFAULT_BITS : constant := 1280;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:265

      BN_FLG_MALLOCED : constant := 16#01#;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:267
      BN_FLG_STATIC_DATA : constant := 16#02#;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:268
      BN_FLG_CONSTTIME : constant := 16#04#;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:269
      --  unsupported macro: BN_FLG_EXP_CONSTTIME BN_FLG_CONSTTIME

      BN_FLG_FREE : constant := 16#8000#;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:282
      --  arg-macro: function BN_set_flags (b, n)
      --    return (b).flags|=(n);
      --  arg-macro: function BN_get_flags (b, n)
      --    return (b).flagsand(n);
      --  arg-macro: function BN_with_flags (dest, b, n)
      --    return (dest).d:=(b).d, (dest).top:=(b).top, (dest).dmax:=(b).dmax, (dest).neg:=(b).neg, (dest).flags:=(((dest).flags and BN_FLG_MALLOCED) or ((b).flags and ~BN_FLG_MALLOCED) or BN_FLG_STATIC_DATA or (n));
      --  arg-macro: procedure BN_GENCB_set_old (gencb, callback{ BN_GENCB *tmp_gencb := (gencb); tmp_gencb.ver := 1; tmp_gencb.arg := (cb_arg); tmp_gencb.cb.cb_1 := (callback); }
      --    { BN_GENCB *tmp_gencb := (gencb); tmp_gencb.ver := 1; tmp_gencb.arg := (cb_arg); tmp_gencb.cb.cb_1 := (callback); }
      --  arg-macro: procedure BN_GENCB_set (gencb, callback{ BN_GENCB *tmp_gencb := (gencb); tmp_gencb.ver := 2; tmp_gencb.arg := (cb_arg); tmp_gencb.cb.cb_2 := (callback); }
      --    { BN_GENCB *tmp_gencb := (gencb); tmp_gencb.ver := 2; tmp_gencb.arg := (cb_arg); tmp_gencb.cb.cb_2 := (callback); }

      BN_prime_checks : constant := 0;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:372
      --  arg-macro: function BN_prime_checks_for_size (b)
      --    return (b) >= 1300 ? 2 : (b) >= 850 ? 3 : (b) >= 650 ? 4 : (b) >= 550 ? 5 : (b) >= 450 ? 6 : (b) >= 400 ? 7 : (b) >= 350 ? 8 : (b) >= 300 ? 9 : (b) >= 250 ? 12 : (b) >= 200 ? 15 : (b) >= 150 ? 18 : 27;
      --  arg-macro: function BN_num_bytes (a)
      --    return (BN_num_bits(a)+7)/8;
      --  arg-macro: function BN_abs_is_word (a, w)
      --    return (((a).top = 1)  and then  ((a).d(0) = (BN_ULONG)(w)))  or else  (((w) = 0)  and then  ((a).top = 0));
      --  arg-macro: function BN_is_zero (a)
      --    return (a).top = 0;
      --  arg-macro: function BN_is_one (a)
      --    return BN_abs_is_word((a),1)  and then  not(a).neg;
      --  arg-macro: function BN_is_word (a, w)
      --    return BN_abs_is_word((a),(w))  and then  (not(w)  or else  not(a).neg);
      --  arg-macro: function BN_is_odd (a)
      --    return ((a).top > 0)  and then  ((a).d(0) and 1);
      --  arg-macro: function BN_one (a)
      --    return BN_set_word((a),1);
      --  arg-macro: procedure BN_zero_ex (a)
      --    do { BIGNUM *_tmp_bn := (a); _tmp_bn.top := 0; _tmp_bn.neg := 0; } while(0)
      --  arg-macro: function BN_zero (a)
      --    return BN_set_word((a),0);
      --  arg-macro: function BN_is_negative (a)
      --    return (a).neg /= 0;
      --  arg-macro: procedure BN_mod (rem, m, d, ctx)BN_div(NULL,(rem),(m),(d),(ctx))
      --    BN_div(NULL,(rem),(m),(d),(ctx))
      --  arg-macro: procedure BN_to_montgomery (r, a, mont, ctxBN_mod_mul_montgomery( (r),(a),and((mont).RR),(mont),(ctx))
      --    BN_mod_mul_montgomery( (r),(a),and((mont).RR),(mont),(ctx))

      BN_BLINDING_NO_UPDATE : constant := 16#00000001#;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:578
      BN_BLINDING_NO_RECREATE : constant := 16#00000002#;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:579
      --  arg-macro: procedure BN_GF2m_sub (r, a, b)
      --    BN_GF2m_add(r, a, b)
      --  arg-macro: procedure BN_GF2m_cmp (a, b)
      --    BN_ucmp((a), (b))
      --  arg-macro: function bn_expand (a, bits)
      --    return (((((bits+BN_BITS2-1))/BN_BITS2)) <= (a).dmax)? (a):bn_expand2((a),(bits+BN_BITS2-1)/BN_BITS2);
      --  arg-macro: function bn_wexpand (a, words)
      --    return ((words) <= (a).dmax)?(a):bn_expand2((a),(words));
      --  arg-macro: procedure bn_fix_top (a)
      --    bn_correct_top(a)
      --  arg-macro: procedure bn_correct_top (a)
      --    { BN_ULONG *ftl; int tmp_top := (a).top; if (tmp_top > 0) { for (ftl:= and((a).d(tmp_top-1)); tmp_top > 0; tmp_top--) if (*(ftl--)) break; (a).top := tmp_top; } bn_pollute(a); }

      BN_F_BNRAND : constant := 127;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:815
      BN_F_BN_BLINDING_CONVERT_EX : constant := 100;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:816
      BN_F_BN_BLINDING_CREATE_PARAM : constant := 128;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:817
      BN_F_BN_BLINDING_INVERT_EX : constant := 101;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:818
      BN_F_BN_BLINDING_NEW : constant := 102;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:819
      BN_F_BN_BLINDING_UPDATE : constant := 103;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:820
      BN_F_BN_BN2DEC : constant := 104;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:821
      BN_F_BN_BN2HEX : constant := 105;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:822
      BN_F_BN_CTX_GET : constant := 116;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:823
      BN_F_BN_CTX_NEW : constant := 106;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:824
      BN_F_BN_CTX_START : constant := 129;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:825
      BN_F_BN_DIV : constant := 107;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:826
      BN_F_BN_DIV_NO_BRANCH : constant := 138;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:827
      BN_F_BN_DIV_RECP : constant := 130;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:828
      BN_F_BN_EXP : constant := 123;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:829
      BN_F_BN_EXPAND2 : constant := 108;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:830
      BN_F_BN_EXPAND_INTERNAL : constant := 120;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:831
      BN_F_BN_GF2M_MOD : constant := 131;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:832
      BN_F_BN_GF2M_MOD_EXP : constant := 132;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:833
      BN_F_BN_GF2M_MOD_MUL : constant := 133;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:834
      BN_F_BN_GF2M_MOD_SOLVE_QUAD : constant := 134;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:835
      BN_F_BN_GF2M_MOD_SOLVE_QUAD_ARR : constant := 135;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:836
      BN_F_BN_GF2M_MOD_SQR : constant := 136;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:837
      BN_F_BN_GF2M_MOD_SQRT : constant := 137;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:838
      BN_F_BN_MOD_EXP2_MONT : constant := 118;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:839
      BN_F_BN_MOD_EXP_MONT : constant := 109;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:840
      BN_F_BN_MOD_EXP_MONT_CONSTTIME : constant := 124;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:841
      BN_F_BN_MOD_EXP_MONT_WORD : constant := 117;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:842
      BN_F_BN_MOD_EXP_RECP : constant := 125;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:843
      BN_F_BN_MOD_EXP_SIMPLE : constant := 126;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:844
      BN_F_BN_MOD_INVERSE : constant := 110;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:845
      BN_F_BN_MOD_INVERSE_NO_BRANCH : constant := 139;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:846
      BN_F_BN_MOD_LSHIFT_QUICK : constant := 119;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:847
      BN_F_BN_MOD_MUL_RECIPROCAL : constant := 111;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:848
      BN_F_BN_MOD_SQRT : constant := 121;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:849
      BN_F_BN_MPI2BN : constant := 112;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:850
      BN_F_BN_NEW : constant := 113;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:851
      BN_F_BN_RAND : constant := 114;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:852
      BN_F_BN_RAND_RANGE : constant := 122;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:853
      BN_F_BN_USUB : constant := 115;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:854

      BN_R_ARG2_LT_ARG3 : constant := 100;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:857
      BN_R_BAD_RECIPROCAL : constant := 101;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:858
      BN_R_BIGNUM_TOO_LONG : constant := 114;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:859
      BN_R_CALLED_WITH_EVEN_MODULUS : constant := 102;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:860
      BN_R_DIV_BY_ZERO : constant := 103;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:861
      BN_R_ENCODING_ERROR : constant := 104;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:862
      BN_R_EXPAND_ON_STATIC_BIGNUM_DATA : constant := 105;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:863
      BN_R_INPUT_NOT_REDUCED : constant := 110;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:864
      BN_R_INVALID_LENGTH : constant := 106;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:865
      BN_R_INVALID_RANGE : constant := 115;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:866
      BN_R_NOT_A_SQUARE : constant := 111;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:867
      BN_R_NOT_INITIALIZED : constant := 107;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:868
      BN_R_NO_INVERSE : constant := 108;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:869
      BN_R_NO_SOLUTION : constant := 116;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:870
      BN_R_P_IS_NOT_PRIME : constant := 112;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:871
      BN_R_TOO_MANY_ITERATIONS : constant := 113;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:872
      BN_R_TOO_MANY_TEMPORARY_VARIABLES : constant := 109;  --  /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:873
   end defs;
   type bignum_st is record
      d     : access unsigned;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:311
      top   : aliased int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:312
      dmax  : aliased int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:314
      neg   : aliased int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:315
      flags : aliased int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:316
   end record;
   pragma Convention (C_Pass_By_Copy, bignum_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:309

   type bn_mont_ctx_st_n0_array is array (0 .. 1) of aliased unsigned;
   type bn_mont_ctx_st is record
      ri    : aliased int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:322
      RR    : aliased bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:323
      N     : aliased bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:324
      Ni    : aliased bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:325
      n0    : aliased bn_mont_ctx_st_n0_array;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:327
      flags : aliased int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:329
   end record;
   pragma Convention (C_Pass_By_Copy, bn_mont_ctx_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:320

   type bn_recp_ctx_st is record
      N        : aliased bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:337
      Nr       : aliased bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:338
      num_bits : aliased int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:339
      shift    : aliased int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:340
      flags    : aliased int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:341
   end record;
   pragma Convention (C_Pass_By_Copy, bn_recp_ctx_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:335
   type bn_gencb_st;
   type anon_26 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            cb_1 : access procedure
              (arg1 : int;
               arg2 : int;
               arg3 : System.Address);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:352
         when others =>
            cb_2 : access function
              (arg1 : int;
               arg2 : int;
               arg3 : access bn_gencb_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:354
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_26);
   pragma Unchecked_Union (anon_26);
   type bn_gencb_st is record
      ver : aliased unsigned;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:347
      arg : System.Address;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:348
      cb  : anon_26;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:355
   end record;
   pragma Convention (C_Pass_By_Copy, bn_gencb_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:345

   function BN_GENCB_call
     (cb : access bn_gencb_st;
      a  : int;
      b  : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:358
   pragma Import (C, BN_GENCB_call, "BN_GENCB_call");

   function BN_value_one return access constant bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:416
   pragma Import (C, BN_value_one, "BN_value_one");

   function BN_options return Interfaces.C.Strings.chars_ptr;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:417
   pragma Import (C, BN_options, "BN_options");

   function BN_CTX_new return System.Address;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:418
   pragma Import (C, BN_CTX_new, "BN_CTX_new");

   procedure BN_CTX_init (c : System.Address);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:420
   pragma Import (C, BN_CTX_init, "BN_CTX_init");

   procedure BN_CTX_free (c : System.Address);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:422
   pragma Import (C, BN_CTX_free, "BN_CTX_free");

   procedure BN_CTX_start (ctx : System.Address);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:423
   pragma Import (C, BN_CTX_start, "BN_CTX_start");

   function BN_CTX_get (ctx : System.Address) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:424
   pragma Import (C, BN_CTX_get, "BN_CTX_get");

   procedure BN_CTX_end (ctx : System.Address);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:425
   pragma Import (C, BN_CTX_end, "BN_CTX_end");

   function BN_rand
     (rnd    : access bignum_st;
      bits   : int;
      top    : int;
      bottom : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:426
   pragma Import (C, BN_rand, "BN_rand");

   function BN_pseudo_rand
     (rnd    : access bignum_st;
      bits   : int;
      top    : int;
      bottom : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:427
   pragma Import (C, BN_pseudo_rand, "BN_pseudo_rand");

   function BN_rand_range (rnd : access bignum_st; c_range : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:428
   pragma Import (C, BN_rand_range, "BN_rand_range");

   function BN_pseudo_rand_range (rnd : access bignum_st; c_range : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:429
   pragma Import (C, BN_pseudo_rand_range, "BN_pseudo_rand_range");

   function BN_num_bits (a : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:430
   pragma Import (C, BN_num_bits, "BN_num_bits");

   function BN_num_bits_word (arg1 : unsigned) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:431
   pragma Import (C, BN_num_bits_word, "BN_num_bits_word");

   function BN_new return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:432
   pragma Import (C, BN_new, "BN_new");

   procedure BN_init (arg1 : access bignum_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:433
   pragma Import (C, BN_init, "BN_init");

   procedure BN_clear_free (a : access bignum_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:434
   pragma Import (C, BN_clear_free, "BN_clear_free");

   function BN_copy (a : access bignum_st; b : access constant bignum_st) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:435
   pragma Import (C, BN_copy, "BN_copy");

   procedure BN_swap (a : access bignum_st; b : access bignum_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:436
   pragma Import (C, BN_swap, "BN_swap");

   function BN_bin2bn
     (s   : access unsigned_char;
      len : int;
      ret : access bignum_st) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:437
   pragma Import (C, BN_bin2bn, "BN_bin2bn");

   function BN_bn2bin (a : access constant bignum_st; to : access unsigned_char) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:438
   pragma Import (C, BN_bn2bin, "BN_bn2bin");

   function BN_mpi2bn
     (s   : access unsigned_char;
      len : int;
      ret : access bignum_st) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:439
   pragma Import (C, BN_mpi2bn, "BN_mpi2bn");

   function BN_bn2mpi (a : access constant bignum_st; to : access unsigned_char) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:440
   pragma Import (C, BN_bn2mpi, "BN_bn2mpi");

   function BN_sub
     (r : access bignum_st;
      a : access constant bignum_st;
      b : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:441
   pragma Import (C, BN_sub, "BN_sub");

   function BN_usub
     (r : access bignum_st;
      a : access constant bignum_st;
      b : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:442
   pragma Import (C, BN_usub, "BN_usub");

   function BN_uadd
     (r : access bignum_st;
      a : access constant bignum_st;
      b : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:443
   pragma Import (C, BN_uadd, "BN_uadd");

   function BN_add
     (r : access bignum_st;
      a : access constant bignum_st;
      b : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:444
   pragma Import (C, BN_add, "BN_add");

   function BN_mul
     (r   : access bignum_st;
      a   : access constant bignum_st;
      b   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:445
   pragma Import (C, BN_mul, "BN_mul");

   function BN_sqr
     (r   : access bignum_st;
      a   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:446
   pragma Import (C, BN_sqr, "BN_sqr");

   procedure BN_set_negative (b : access bignum_st; n : int);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:451
   pragma Import (C, BN_set_negative, "BN_set_negative");

   function BN_div
     (dv    : access bignum_st;
      c_rem : access bignum_st;
      m     : access constant bignum_st;
      d     : access constant bignum_st;
      ctx   : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:458
   pragma Import (C, BN_div, "BN_div");

   function BN_nnmod
     (r   : access bignum_st;
      m   : access constant bignum_st;
      d   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:461
   pragma Import (C, BN_nnmod, "BN_nnmod");

   function BN_mod_add
     (r   : access bignum_st;
      a   : access constant bignum_st;
      b   : access constant bignum_st;
      m   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:462
   pragma Import (C, BN_mod_add, "BN_mod_add");

   function BN_mod_add_quick
     (r : access bignum_st;
      a : access constant bignum_st;
      b : access constant bignum_st;
      m : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:463
   pragma Import (C, BN_mod_add_quick, "BN_mod_add_quick");

   function BN_mod_sub
     (r   : access bignum_st;
      a   : access constant bignum_st;
      b   : access constant bignum_st;
      m   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:464
   pragma Import (C, BN_mod_sub, "BN_mod_sub");

   function BN_mod_sub_quick
     (r : access bignum_st;
      a : access constant bignum_st;
      b : access constant bignum_st;
      m : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:465
   pragma Import (C, BN_mod_sub_quick, "BN_mod_sub_quick");

   function BN_mod_mul
     (r   : access bignum_st;
      a   : access constant bignum_st;
      b   : access constant bignum_st;
      m   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:466
   pragma Import (C, BN_mod_mul, "BN_mod_mul");

   function BN_mod_sqr
     (r   : access bignum_st;
      a   : access constant bignum_st;
      m   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:468
   pragma Import (C, BN_mod_sqr, "BN_mod_sqr");

   function BN_mod_lshift1
     (r   : access bignum_st;
      a   : access constant bignum_st;
      m   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:469
   pragma Import (C, BN_mod_lshift1, "BN_mod_lshift1");

   function BN_mod_lshift1_quick
     (r : access bignum_st;
      a : access constant bignum_st;
      m : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:470
   pragma Import (C, BN_mod_lshift1_quick, "BN_mod_lshift1_quick");

   function BN_mod_lshift
     (r   : access bignum_st;
      a   : access constant bignum_st;
      n   : int;
      m   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:471
   pragma Import (C, BN_mod_lshift, "BN_mod_lshift");

   function BN_mod_lshift_quick
     (r : access bignum_st;
      a : access constant bignum_st;
      n : int;
      m : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:472
   pragma Import (C, BN_mod_lshift_quick, "BN_mod_lshift_quick");

   function BN_mod_word (a : access constant bignum_st; w : unsigned) return unsigned;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:474
   pragma Import (C, BN_mod_word, "BN_mod_word");

   function BN_div_word (a : access bignum_st; w : unsigned) return unsigned;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:475
   pragma Import (C, BN_div_word, "BN_div_word");

   function BN_mul_word (a : access bignum_st; w : unsigned) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:476
   pragma Import (C, BN_mul_word, "BN_mul_word");

   function BN_add_word (a : access bignum_st; w : unsigned) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:477
   pragma Import (C, BN_add_word, "BN_add_word");

   function BN_sub_word (a : access bignum_st; w : unsigned) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:478
   pragma Import (C, BN_sub_word, "BN_sub_word");

   function BN_set_word (a : access bignum_st; w : unsigned) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:479
   pragma Import (C, BN_set_word, "BN_set_word");

   function BN_get_word (a : access constant bignum_st) return unsigned;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:480
   pragma Import (C, BN_get_word, "BN_get_word");

   function BN_cmp (a : access constant bignum_st; b : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:482
   pragma Import (C, BN_cmp, "BN_cmp");

   procedure BN_free (a : access bignum_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:483
   pragma Import (C, BN_free, "BN_free");

   function BN_is_bit_set (a : access constant bignum_st; n : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:484
   pragma Import (C, BN_is_bit_set, "BN_is_bit_set");

   function BN_lshift
     (r : access bignum_st;
      a : access constant bignum_st;
      n : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:485
   pragma Import (C, BN_lshift, "BN_lshift");

   function BN_lshift1 (r : access bignum_st; a : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:486
   pragma Import (C, BN_lshift1, "BN_lshift1");

   function BN_exp
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:487
   pragma Import (C, BN_exp, "BN_exp");

   function BN_mod_exp
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access constant bignum_st;
      m   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:489
   pragma Import (C, BN_mod_exp, "BN_mod_exp");

   function BN_mod_exp_mont
     (r     : access bignum_st;
      a     : access constant bignum_st;
      p     : access constant bignum_st;
      m     : access constant bignum_st;
      ctx   : System.Address;
      m_ctx : access bn_mont_ctx_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:491
   pragma Import (C, BN_mod_exp_mont, "BN_mod_exp_mont");

   function BN_mod_exp_mont_consttime
     (rr      : access bignum_st;
      a       : access constant bignum_st;
      p       : access constant bignum_st;
      m       : access constant bignum_st;
      ctx     : System.Address;
      in_mont : access bn_mont_ctx_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:493
   pragma Import (C, BN_mod_exp_mont_consttime, "BN_mod_exp_mont_consttime");

   function BN_mod_exp_mont_word
     (r     : access bignum_st;
      a     : unsigned;
      p     : access constant bignum_st;
      m     : access constant bignum_st;
      ctx   : System.Address;
      m_ctx : access bn_mont_ctx_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:495
   pragma Import (C, BN_mod_exp_mont_word, "BN_mod_exp_mont_word");

   function BN_mod_exp2_mont
     (r     : access bignum_st;
      a1    : access constant bignum_st;
      p1    : access constant bignum_st;
      a2    : access constant bignum_st;
      p2    : access constant bignum_st;
      m     : access constant bignum_st;
      ctx   : System.Address;
      m_ctx : access bn_mont_ctx_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:497
   pragma Import (C, BN_mod_exp2_mont, "BN_mod_exp2_mont");

   function BN_mod_exp_simple
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access constant bignum_st;
      m   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:500
   pragma Import (C, BN_mod_exp_simple, "BN_mod_exp_simple");

   function BN_mask_bits (a : access bignum_st; n : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:503
   pragma Import (C, BN_mask_bits, "BN_mask_bits");

   function BN_print_fp (fp : access Interfaces.C_Streams.FILEs; a : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:505
   pragma Import (C, BN_print_fp, "BN_print_fp");

   function BN_print (fp : access OpenSSL.Low_Level.bio_h.bio_st; a : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:508
   pragma Import (C, BN_print, "BN_print");

   function BN_reciprocal
     (r   : access bignum_st;
      m   : access constant bignum_st;
      len : int;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:512
   pragma Import (C, BN_reciprocal, "BN_reciprocal");

   function BN_rshift
     (r : access bignum_st;
      a : access constant bignum_st;
      n : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:513
   pragma Import (C, BN_rshift, "BN_rshift");

   function BN_rshift1 (r : access bignum_st; a : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:514
   pragma Import (C, BN_rshift1, "BN_rshift1");

   procedure BN_clear (a : access bignum_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:515
   pragma Import (C, BN_clear, "BN_clear");

   function BN_dup (a : access constant bignum_st) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:516
   pragma Import (C, BN_dup, "BN_dup");

   function BN_ucmp (a : access constant bignum_st; b : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:517
   pragma Import (C, BN_ucmp, "BN_ucmp");

   function BN_set_bit (a : access bignum_st; n : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:518
   pragma Import (C, BN_set_bit, "BN_set_bit");

   function BN_clear_bit (a : access bignum_st; n : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:519
   pragma Import (C, BN_clear_bit, "BN_clear_bit");

   function BN_bn2hex (a : access constant bignum_st) return Interfaces.C.Strings.chars_ptr;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:520
   pragma Import (C, BN_bn2hex, "BN_bn2hex");

   function BN_bn2dec (a : access constant bignum_st) return Interfaces.C.Strings.chars_ptr;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:521
   pragma Import (C, BN_bn2dec, "BN_bn2dec");

   function BN_hex2bn (a : System.Address; str : Interfaces.C.Strings.chars_ptr) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:522
   pragma Import (C, BN_hex2bn, "BN_hex2bn");

   function BN_dec2bn (a : System.Address; str : Interfaces.C.Strings.chars_ptr) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:523
   pragma Import (C, BN_dec2bn, "BN_dec2bn");

   function BN_asc2bn (a : System.Address; str : Interfaces.C.Strings.chars_ptr) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:524
   pragma Import (C, BN_asc2bn, "BN_asc2bn");

   function BN_gcd
     (r   : access bignum_st;
      a   : access constant bignum_st;
      b   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:525
   pragma Import (C, BN_gcd, "BN_gcd");

   function BN_kronecker
     (a   : access constant bignum_st;
      b   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:526
   pragma Import (C, BN_kronecker, "BN_kronecker");

   function BN_mod_inverse
     (ret : access bignum_st;
      a   : access constant bignum_st;
      n   : access constant bignum_st;
      ctx : System.Address) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:527
   pragma Import (C, BN_mod_inverse, "BN_mod_inverse");

   function BN_mod_sqrt
     (ret : access bignum_st;
      a   : access constant bignum_st;
      n   : access constant bignum_st;
      ctx : System.Address) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:529
   pragma Import (C, BN_mod_sqrt, "BN_mod_sqrt");

   function BN_generate_prime
     (ret      : access bignum_st;
      bits     : int;
      safe     : int;
      add      : access constant bignum_st;
      c_rem    : access constant bignum_st;
      callback : access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : System.Address);
      cb_arg   : System.Address) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:534
   pragma Import (C, BN_generate_prime, "BN_generate_prime");

   function BN_is_prime
     (p        : access constant bignum_st;
      nchecks  : int;
      callback : access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : System.Address);
      ctx      : System.Address;
      cb_arg   : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:537
   pragma Import (C, BN_is_prime, "BN_is_prime");

   function BN_is_prime_fasttest
     (p                 : access constant bignum_st;
      nchecks           : int;
      callback          : access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : System.Address);
      ctx               : System.Address;
      cb_arg            : System.Address;
      do_trial_division : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:540
   pragma Import (C, BN_is_prime_fasttest, "BN_is_prime_fasttest");

   function BN_generate_prime_ex
     (ret   : access bignum_st;
      bits  : int;
      safe  : int;
      add   : access constant bignum_st;
      c_rem : access constant bignum_st;
      cb    : access bn_gencb_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:546
   pragma Import (C, BN_generate_prime_ex, "BN_generate_prime_ex");

   function BN_is_prime_ex
     (p       : access constant bignum_st;
      nchecks : int;
      ctx     : System.Address;
      cb      : access bn_gencb_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:548
   pragma Import (C, BN_is_prime_ex, "BN_is_prime_ex");

   function BN_is_prime_fasttest_ex
     (p                 : access constant bignum_st;
      nchecks           : int;
      ctx               : System.Address;
      do_trial_division : int;
      cb                : access bn_gencb_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:549
   pragma Import (C, BN_is_prime_fasttest_ex, "BN_is_prime_fasttest_ex");

   function BN_X931_generate_Xpq
     (Xp    : access bignum_st;
      Xq    : access bignum_st;
      nbits : int;
      ctx   : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:552
   pragma Import (C, BN_X931_generate_Xpq, "BN_X931_generate_Xpq");

   function BN_X931_derive_prime_ex
     (p   : access bignum_st;
      p1  : access bignum_st;
      p2  : access bignum_st;
      Xp  : access constant bignum_st;
      Xp1 : access constant bignum_st;
      Xp2 : access constant bignum_st;
      e   : access constant bignum_st;
      ctx : System.Address;
      cb  : access bn_gencb_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:554
   pragma Import (C, BN_X931_derive_prime_ex, "BN_X931_derive_prime_ex");

   function BN_X931_generate_prime_ex
     (p   : access bignum_st;
      p1  : access bignum_st;
      p2  : access bignum_st;
      Xp1 : access bignum_st;
      Xp2 : access bignum_st;
      Xp  : access constant bignum_st;
      e   : access constant bignum_st;
      ctx : System.Address;
      cb  : access bn_gencb_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:557
   pragma Import (C, BN_X931_generate_prime_ex, "BN_X931_generate_prime_ex");

   function BN_MONT_CTX_new return access bn_mont_ctx_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:563
   pragma Import (C, BN_MONT_CTX_new, "BN_MONT_CTX_new");

   procedure BN_MONT_CTX_init (ctx : access bn_mont_ctx_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:564
   pragma Import (C, BN_MONT_CTX_init, "BN_MONT_CTX_init");

   function BN_mod_mul_montgomery
     (r    : access bignum_st;
      a    : access constant bignum_st;
      b    : access constant bignum_st;
      mont : access bn_mont_ctx_st;
      ctx  : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:565
   pragma Import (C, BN_mod_mul_montgomery, "BN_mod_mul_montgomery");

   function BN_from_montgomery
     (r    : access bignum_st;
      a    : access constant bignum_st;
      mont : access bn_mont_ctx_st;
      ctx  : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:569
   pragma Import (C, BN_from_montgomery, "BN_from_montgomery");

   procedure BN_MONT_CTX_free (mont : access bn_mont_ctx_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:571
   pragma Import (C, BN_MONT_CTX_free, "BN_MONT_CTX_free");

   function BN_MONT_CTX_set
     (mont  : access bn_mont_ctx_st;
      c_mod : access constant bignum_st;
      ctx   : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:572
   pragma Import (C, BN_MONT_CTX_set, "BN_MONT_CTX_set");

   function BN_MONT_CTX_copy (to : access bn_mont_ctx_st; from : access bn_mont_ctx_st) return access bn_mont_ctx_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:573
   pragma Import (C, BN_MONT_CTX_copy, "BN_MONT_CTX_copy");

   function BN_MONT_CTX_set_locked
     (pmont : System.Address;
      lock  : int;
      c_mod : access constant bignum_st;
      ctx   : System.Address) return access bn_mont_ctx_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:574
   pragma Import (C, BN_MONT_CTX_set_locked, "BN_MONT_CTX_set_locked");

   function BN_BLINDING_new
     (A     : access constant bignum_st;
      Ai    : access constant bignum_st;
      c_mod : access bignum_st) return System.Address;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:581
   pragma Import (C, BN_BLINDING_new, "BN_BLINDING_new");

   procedure BN_BLINDING_free (b : System.Address);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:582
   pragma Import (C, BN_BLINDING_free, "BN_BLINDING_free");

   function BN_BLINDING_update (b : System.Address; ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:583
   pragma Import (C, BN_BLINDING_update, "BN_BLINDING_update");

   function BN_BLINDING_convert
     (n   : access bignum_st;
      b   : System.Address;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:584
   pragma Import (C, BN_BLINDING_convert, "BN_BLINDING_convert");

   function BN_BLINDING_invert
     (n   : access bignum_st;
      b   : System.Address;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:585
   pragma Import (C, BN_BLINDING_invert, "BN_BLINDING_invert");

   function BN_BLINDING_convert_ex
     (n    : access bignum_st;
      r    : access bignum_st;
      b    : System.Address;
      arg4 : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:586
   pragma Import (C, BN_BLINDING_convert_ex, "BN_BLINDING_convert_ex");

   function BN_BLINDING_invert_ex
     (n    : access bignum_st;
      r    : access constant bignum_st;
      b    : System.Address;
      arg4 : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:587
   pragma Import (C, BN_BLINDING_invert_ex, "BN_BLINDING_invert_ex");

   function BN_BLINDING_get_thread_id (arg1 : System.Address) return unsigned_long;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:589
   pragma Import (C, BN_BLINDING_get_thread_id, "BN_BLINDING_get_thread_id");

   procedure BN_BLINDING_set_thread_id (arg1 : System.Address; arg2 : unsigned_long);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:590
   pragma Import (C, BN_BLINDING_set_thread_id, "BN_BLINDING_set_thread_id");

   function BN_BLINDING_thread_id (arg1 : System.Address) return access OpenSSL.Low_Level.crypto_h.CRYPTO_THREADID;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:592
   pragma Import (C, BN_BLINDING_thread_id, "BN_BLINDING_thread_id");

   function BN_BLINDING_get_flags (arg1 : System.Address) return unsigned_long;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:593
   pragma Import (C, BN_BLINDING_get_flags, "BN_BLINDING_get_flags");

   procedure BN_BLINDING_set_flags (arg1 : System.Address; arg2 : unsigned_long);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:594
   pragma Import (C, BN_BLINDING_set_flags, "BN_BLINDING_set_flags");

   function BN_BLINDING_create_param
     (b          : System.Address;
      e          : access constant bignum_st;
      m          : access bignum_st;
      ctx        : System.Address;
      bn_mod_exp : access function
        (arg1 : access bignum_st;
         arg2 : access constant bignum_st;
         arg3 : access constant bignum_st;
         arg4 : access constant bignum_st;
         arg5 : System.Address;
         arg6 : access bn_mont_ctx_st) return int;
      m_ctx      : access bn_mont_ctx_st) return System.Address;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:595
   pragma Import (C, BN_BLINDING_create_param, "BN_BLINDING_create_param");

   procedure BN_set_params
     (mul  : int;
      high : int;
      low  : int;
      mont : int);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:602
   pragma Import (C, BN_set_params, "BN_set_params");

   function BN_get_params (which : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:603
   pragma Import (C, BN_get_params, "BN_get_params");

   procedure BN_RECP_CTX_init (recp : access bn_recp_ctx_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:606
   pragma Import (C, BN_RECP_CTX_init, "BN_RECP_CTX_init");

   function BN_RECP_CTX_new return access bn_recp_ctx_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:607
   pragma Import (C, BN_RECP_CTX_new, "BN_RECP_CTX_new");

   procedure BN_RECP_CTX_free (recp : access bn_recp_ctx_st);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:608
   pragma Import (C, BN_RECP_CTX_free, "BN_RECP_CTX_free");

   function BN_RECP_CTX_set
     (recp : access bn_recp_ctx_st;
      rdiv : access constant bignum_st;
      ctx  : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:609
   pragma Import (C, BN_RECP_CTX_set, "BN_RECP_CTX_set");

   function BN_mod_mul_reciprocal
     (r    : access bignum_st;
      x    : access constant bignum_st;
      y    : access constant bignum_st;
      recp : access bn_recp_ctx_st;
      ctx  : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:610
   pragma Import (C, BN_mod_mul_reciprocal, "BN_mod_mul_reciprocal");

   function BN_mod_exp_recp
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access constant bignum_st;
      m   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:612
   pragma Import (C, BN_mod_exp_recp, "BN_mod_exp_recp");

   function BN_div_recp
     (dv    : access bignum_st;
      c_rem : access bignum_st;
      m     : access constant bignum_st;
      recp  : access bn_recp_ctx_st;
      ctx   : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:614
   pragma Import (C, BN_div_recp, "BN_div_recp");

   function BN_GF2m_add
     (r : access bignum_st;
      a : access constant bignum_st;
      b : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:626
   pragma Import (C, BN_GF2m_add, "BN_GF2m_add");

   function BN_GF2m_mod
     (r : access bignum_st;
      a : access constant bignum_st;
      p : access constant bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:628
   pragma Import (C, BN_GF2m_mod, "BN_GF2m_mod");

   function BN_GF2m_mod_mul
     (r   : access bignum_st;
      a   : access constant bignum_st;
      b   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:629
   pragma Import (C, BN_GF2m_mod_mul, "BN_GF2m_mod_mul");

   function BN_GF2m_mod_sqr
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:631
   pragma Import (C, BN_GF2m_mod_sqr, "BN_GF2m_mod_sqr");

   function BN_GF2m_mod_inv
     (r   : access bignum_st;
      b   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:633
   pragma Import (C, BN_GF2m_mod_inv, "BN_GF2m_mod_inv");

   function BN_GF2m_mod_div
     (r   : access bignum_st;
      a   : access constant bignum_st;
      b   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:635
   pragma Import (C, BN_GF2m_mod_div, "BN_GF2m_mod_div");

   function BN_GF2m_mod_exp
     (r   : access bignum_st;
      a   : access constant bignum_st;
      b   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:637
   pragma Import (C, BN_GF2m_mod_exp, "BN_GF2m_mod_exp");

   function BN_GF2m_mod_sqrt
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:639
   pragma Import (C, BN_GF2m_mod_sqrt, "BN_GF2m_mod_sqrt");

   function BN_GF2m_mod_solve_quad
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:641
   pragma Import (C, BN_GF2m_mod_solve_quad, "BN_GF2m_mod_solve_quad");

   function BN_GF2m_mod_arr
     (r : access bignum_st;
      a : access constant bignum_st;
      p : access int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:649
   pragma Import (C, BN_GF2m_mod_arr, "BN_GF2m_mod_arr");

   function BN_GF2m_mod_mul_arr
     (r   : access bignum_st;
      a   : access constant bignum_st;
      b   : access constant bignum_st;
      p   : access int;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:651
   pragma Import (C, BN_GF2m_mod_mul_arr, "BN_GF2m_mod_mul_arr");

   function BN_GF2m_mod_sqr_arr
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access int;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:653
   pragma Import (C, BN_GF2m_mod_sqr_arr, "BN_GF2m_mod_sqr_arr");

   function BN_GF2m_mod_inv_arr
     (r   : access bignum_st;
      b   : access constant bignum_st;
      p   : access int;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:655
   pragma Import (C, BN_GF2m_mod_inv_arr, "BN_GF2m_mod_inv_arr");

   function BN_GF2m_mod_div_arr
     (r   : access bignum_st;
      a   : access constant bignum_st;
      b   : access constant bignum_st;
      p   : access int;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:657
   pragma Import (C, BN_GF2m_mod_div_arr, "BN_GF2m_mod_div_arr");

   function BN_GF2m_mod_exp_arr
     (r   : access bignum_st;
      a   : access constant bignum_st;
      b   : access constant bignum_st;
      p   : access int;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:659
   pragma Import (C, BN_GF2m_mod_exp_arr, "BN_GF2m_mod_exp_arr");

   function BN_GF2m_mod_sqrt_arr
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access int;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:661
   pragma Import (C, BN_GF2m_mod_sqrt_arr, "BN_GF2m_mod_sqrt_arr");

   function BN_GF2m_mod_solve_quad_arr
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access int;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:663
   pragma Import (C, BN_GF2m_mod_solve_quad_arr, "BN_GF2m_mod_solve_quad_arr");

   function BN_GF2m_poly2arr
     (a   : access constant bignum_st;
      p   : access int;
      max : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:665
   pragma Import (C, BN_GF2m_poly2arr, "BN_GF2m_poly2arr");

   function BN_GF2m_arr2poly (p : access int; a : access bignum_st) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:666
   pragma Import (C, BN_GF2m_arr2poly, "BN_GF2m_arr2poly");

   function BN_nist_mod_192
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:670
   pragma Import (C, BN_nist_mod_192, "BN_nist_mod_192");

   function BN_nist_mod_224
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:671
   pragma Import (C, BN_nist_mod_224, "BN_nist_mod_224");

   function BN_nist_mod_256
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:672
   pragma Import (C, BN_nist_mod_256, "BN_nist_mod_256");

   function BN_nist_mod_384
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:673
   pragma Import (C, BN_nist_mod_384, "BN_nist_mod_384");

   function BN_nist_mod_521
     (r   : access bignum_st;
      a   : access constant bignum_st;
      p   : access constant bignum_st;
      ctx : System.Address) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:674
   pragma Import (C, BN_nist_mod_521, "BN_nist_mod_521");

   function BN_get0_nist_prime_192 return access constant bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:676
   pragma Import (C, BN_get0_nist_prime_192, "BN_get0_nist_prime_192");

   function BN_get0_nist_prime_224 return access constant bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:677
   pragma Import (C, BN_get0_nist_prime_224, "BN_get0_nist_prime_224");

   function BN_get0_nist_prime_256 return access constant bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:678
   pragma Import (C, BN_get0_nist_prime_256, "BN_get0_nist_prime_256");

   function BN_get0_nist_prime_384 return access constant bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:679
   pragma Import (C, BN_get0_nist_prime_384, "BN_get0_nist_prime_384");

   function BN_get0_nist_prime_521 return access constant bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:680
   pragma Import (C, BN_get0_nist_prime_521, "BN_get0_nist_prime_521");

   function bn_expand2 (a : access bignum_st; words : int) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:687
   pragma Import (C, bn_expand2, "bn_expand2");

   function bn_dup_expand (a : access constant bignum_st; words : int) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:689
   pragma Import (C, bn_dup_expand, "bn_dup_expand");

   function bn_mul_add_words
     (rp  : access unsigned;
      ap  : access unsigned;
      num : int;
      w   : unsigned) return unsigned;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:785
   pragma Import (C, bn_mul_add_words, "bn_mul_add_words");

   function bn_mul_words
     (rp  : access unsigned;
      ap  : access unsigned;
      num : int;
      w   : unsigned) return unsigned;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:786
   pragma Import (C, bn_mul_words, "bn_mul_words");

   procedure bn_sqr_words
     (rp  : access unsigned;
      ap  : access unsigned;
      num : int);  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:787
   pragma Import (C, bn_sqr_words, "bn_sqr_words");

   function bn_div_words
     (h : unsigned;
      l : unsigned;
      d : unsigned) return unsigned;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:788
   pragma Import (C, bn_div_words, "bn_div_words");

   function bn_add_words
     (rp  : access unsigned;
      ap  : access unsigned;
      bp  : access unsigned;
      num : int) return unsigned;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:789
   pragma Import (C, bn_add_words, "bn_add_words");

   function bn_sub_words
     (rp  : access unsigned;
      ap  : access unsigned;
      bp  : access unsigned;
      num : int) return unsigned;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:790
   pragma Import (C, bn_sub_words, "bn_sub_words");

   function get_rfc2409_prime_768 (bn : access bignum_st) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:793
   pragma Import (C, get_rfc2409_prime_768, "get_rfc2409_prime_768");

   function get_rfc2409_prime_1024 (bn : access bignum_st) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:794
   pragma Import (C, get_rfc2409_prime_1024, "get_rfc2409_prime_1024");

   function get_rfc3526_prime_1536 (bn : access bignum_st) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:797
   pragma Import (C, get_rfc3526_prime_1536, "get_rfc3526_prime_1536");

   function get_rfc3526_prime_2048 (bn : access bignum_st) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:798
   pragma Import (C, get_rfc3526_prime_2048, "get_rfc3526_prime_2048");

   function get_rfc3526_prime_3072 (bn : access bignum_st) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:799
   pragma Import (C, get_rfc3526_prime_3072, "get_rfc3526_prime_3072");

   function get_rfc3526_prime_4096 (bn : access bignum_st) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:800
   pragma Import (C, get_rfc3526_prime_4096, "get_rfc3526_prime_4096");

   function get_rfc3526_prime_6144 (bn : access bignum_st) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:801
   pragma Import (C, get_rfc3526_prime_6144, "get_rfc3526_prime_6144");

   function get_rfc3526_prime_8192 (bn : access bignum_st) return access bignum_st;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:802
   pragma Import (C, get_rfc3526_prime_8192, "get_rfc3526_prime_8192");

   function BN_bntest_rand
     (rnd    : access bignum_st;
      bits   : int;
      top    : int;
      bottom : int) return int;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:804
   pragma Import (C, BN_bntest_rand, "BN_bntest_rand");

   procedure ERR_load_BN_strings;  -- /opt/GNAT/6.5.0w-20110122-45/bin/../lib/gcc/i686-pc-linux-gnu/4.5.3/include-fixed/openssl/bn.h:810
   pragma Import (C, ERR_load_BN_strings, "ERR_load_BN_strings");

end OpenSSL.Low_Level.bn_h;
