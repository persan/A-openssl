with Interfaces.C; use Interfaces.C;
--  with OpenSSL.Low_Level.ossl_typ_h;
with Interfaces.C.Strings;
with System;
limited with OpenSSL.Low_Level.bio_h;
--  limited --  with Interfaces.C_Streams;

package OpenSSL.Low_Level.dsa_h is


   OPENSSL_DSA_MAX_MODULUS_BITS : constant := 10000;  --  openssl/dsa.h:88

   OPENSSL_DSA_FIPS_MIN_MODULUS_BITS : constant := 1024;  --  openssl/dsa.h:91

   DSA_FLAG_CACHE_MONT_P : constant := 16#01#;  --  openssl/dsa.h:93
   DSA_FLAG_NO_EXP_CONSTTIME : constant := 16#02#;  --  openssl/dsa.h:94

   DSA_FLAG_FIPS_METHOD : constant := 16#0400#;  --  openssl/dsa.h:108

   DSA_FLAG_NON_FIPS_ALLOW : constant := 16#0400#;  --  openssl/dsa.h:115
   --  arg-macro: function d2i_DSAparams_fp (fp, x)
   --    return DSA *)ASN1_d2i_fp((char *(*)())DSA_new, (char *(*)())d2i_DSAparams,(fp),(unsigned char **)(x);
   --  arg-macro: procedure i2d_DSAparams_fp (fp, x)
   --    ASN1_i2d_fp(i2d_DSAparams,(fp), (unsigned char *)(x))
   --  arg-macro: procedure d2i_DSAparams_bio (bp, x)
   --    ASN1_d2i_bio_of(DSA,DSA_new,d2i_DSAparams,bp,x)
   --  arg-macro: procedure i2d_DSAparams_bio (bp, x)
   --    ASN1_i2d_bio_of_const(DSA,i2d_DSAparams,bp,x)

   DSS_prime_checks : constant := 50;  --  openssl/dsa.h:257
   --  arg-macro: procedure DSA_is_prime (n, callback, cbBN_is_prime(n, DSS_prime_checks, callback, NULL, cb_arg)
   --    BN_is_prime(n, DSS_prime_checks, callback, NULL, cb_arg)
   --  arg-macro: procedure EVP_PKEY_CTX_set_dsa_paramgen_bits (ctx, nbits)
   --    EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DSA, EVP_PKEY_OP_PARAMGEN, EVP_PKEY_CTRL_DSA_PARAMGEN_BITS, nbits, NULL)
   --  unsupported macro: EVP_PKEY_CTRL_DSA_PARAMGEN_BITS (EVP_PKEY_ALG_CTRL + 1)
   --  unsupported macro: EVP_PKEY_CTRL_DSA_PARAMGEN_Q_BITS (EVP_PKEY_ALG_CTRL + 2)
   --  unsupported macro: EVP_PKEY_CTRL_DSA_PARAMGEN_MD (EVP_PKEY_ALG_CTRL + 3)

   DSA_F_D2I_DSA_SIG : constant := 110;  --  openssl/dsa.h:286
   DSA_F_DO_DSA_PRINT : constant := 104;  --  openssl/dsa.h:287
   DSA_F_DSAPARAMS_PRINT : constant := 100;  --  openssl/dsa.h:288
   DSA_F_DSAPARAMS_PRINT_FP : constant := 101;  --  openssl/dsa.h:289
   DSA_F_DSA_BUILTIN_KEYGEN : constant := 124;  --  openssl/dsa.h:290
   DSA_F_DSA_BUILTIN_PARAMGEN : constant := 123;  --  openssl/dsa.h:291
   DSA_F_DSA_DO_SIGN : constant := 112;  --  openssl/dsa.h:292
   DSA_F_DSA_DO_VERIFY : constant := 113;  --  openssl/dsa.h:293
   DSA_F_DSA_GENERATE_PARAMETERS : constant := 125;  --  openssl/dsa.h:294
   DSA_F_DSA_NEW_METHOD : constant := 103;  --  openssl/dsa.h:295
   DSA_F_DSA_PARAM_DECODE : constant := 119;  --  openssl/dsa.h:296
   DSA_F_DSA_PRINT_FP : constant := 105;  --  openssl/dsa.h:297
   DSA_F_DSA_PRIV_DECODE : constant := 115;  --  openssl/dsa.h:298
   DSA_F_DSA_PRIV_ENCODE : constant := 116;  --  openssl/dsa.h:299
   DSA_F_DSA_PUB_DECODE : constant := 117;  --  openssl/dsa.h:300
   DSA_F_DSA_PUB_ENCODE : constant := 118;  --  openssl/dsa.h:301
   DSA_F_DSA_SIGN : constant := 106;  --  openssl/dsa.h:302
   DSA_F_DSA_SIGN_SETUP : constant := 107;  --  openssl/dsa.h:303
   DSA_F_DSA_SIG_NEW : constant := 109;  --  openssl/dsa.h:304
   DSA_F_DSA_VERIFY : constant := 108;  --  openssl/dsa.h:305
   DSA_F_I2D_DSA_SIG : constant := 111;  --  openssl/dsa.h:306
   DSA_F_OLD_DSA_PRIV_DECODE : constant := 122;  --  openssl/dsa.h:307
   DSA_F_PKEY_DSA_CTRL : constant := 120;  --  openssl/dsa.h:308
   DSA_F_PKEY_DSA_KEYGEN : constant := 121;  --  openssl/dsa.h:309
   DSA_F_SIG_CB : constant := 114;  --  openssl/dsa.h:310

   DSA_R_BAD_Q_VALUE : constant := 102;  --  openssl/dsa.h:313
   DSA_R_BN_DECODE_ERROR : constant := 108;  --  openssl/dsa.h:314
   DSA_R_BN_ERROR : constant := 109;  --  openssl/dsa.h:315
   DSA_R_DATA_TOO_LARGE_FOR_KEY_SIZE : constant := 100;  --  openssl/dsa.h:316
   DSA_R_DECODE_ERROR : constant := 104;  --  openssl/dsa.h:317
   DSA_R_INVALID_DIGEST_TYPE : constant := 106;  --  openssl/dsa.h:318
   DSA_R_KEY_SIZE_INVALID : constant := 113;  --  openssl/dsa.h:319
   DSA_R_KEY_SIZE_TOO_SMALL : constant := 110;  --  openssl/dsa.h:320
   DSA_R_MISSING_PARAMETERS : constant := 101;  --  openssl/dsa.h:321
   DSA_R_MODULUS_TOO_LARGE : constant := 103;  --  openssl/dsa.h:322
   DSA_R_NON_FIPS_METHOD : constant := 111;  --  openssl/dsa.h:323
   DSA_R_NO_PARAMETERS_SET : constant := 107;  --  openssl/dsa.h:324
   DSA_R_OPERATION_NOT_ALLOWED_IN_FIPS_MODE : constant := 112;  --  openssl/dsa.h:325
   DSA_R_PARAMETER_ENCODING_ERROR : constant := 105;  --  openssl/dsa.h:326

   type DSA_SIG_st is record
      r : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;  -- openssl/dsa.h:127
      s : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;  -- openssl/dsa.h:128
   end record;
   pragma Convention (C_Pass_By_Copy, DSA_SIG_st);  -- openssl/dsa.h:125

   subtype DSA_SIG is DSA_SIG_st;

   type dsa_method is record
      name : Interfaces.C.Strings.chars_ptr;  -- openssl/dsa.h:133
      dsa_do_sign : access function
           (arg1 : access unsigned_char;
            arg2 : int;
            arg3 : System.Address) return access DSA_SIG;  -- openssl/dsa.h:134
      dsa_sign_setup : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : System.Address;
            arg4 : System.Address) return int;  -- openssl/dsa.h:136
      dsa_do_verify : access function
           (arg1 : access unsigned_char;
            arg2 : int;
            arg3 : access DSA_SIG;
            arg4 : System.Address) return int;  -- openssl/dsa.h:138
      dsa_mod_exp : access function
           (arg1 : System.Address;
            arg2 : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;
            arg3 : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;
            arg4 : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;
            arg5 : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;
            arg6 : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;
            arg7 : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;
            arg8 : System.Address;
            arg9 : access OpenSSL.Low_Level.ossl_typ_h.BN_MONT_CTX) return int;  -- openssl/dsa.h:141
      bn_mod_exp : access function
           (arg1 : System.Address;
            arg2 : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;
            arg3 : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;
            arg4 : access constant OpenSSL.Low_Level.ossl_typ_h.BIGNUM;
            arg5 : access constant OpenSSL.Low_Level.ossl_typ_h.BIGNUM;
            arg6 : System.Address;
            arg7 : access OpenSSL.Low_Level.ossl_typ_h.BN_MONT_CTX) return int;  -- openssl/dsa.h:144
      init : access function (arg1 : System.Address) return int;  -- openssl/dsa.h:145
      finish : access function (arg1 : System.Address) return int;  -- openssl/dsa.h:146
      flags : aliased int;  -- openssl/dsa.h:147
      app_data : Interfaces.C.Strings.chars_ptr;  -- openssl/dsa.h:148
      dsa_paramgen : access function
           (arg1 : System.Address;
            arg2 : int;
            arg3 : access unsigned_char;
            arg4 : int;
            arg5 : access int;
            arg6 : access unsigned_long;
            arg7 : access OpenSSL.Low_Level.ossl_typ_h.BN_GENCB) return int;  -- openssl/dsa.h:153
      dsa_keygen : access function (arg1 : System.Address) return int;  -- openssl/dsa.h:155
   end record;
   pragma Convention (C_Pass_By_Copy, dsa_method);  -- openssl/dsa.h:131

   type dsa_st is record
      pad : aliased int;  -- openssl/dsa.h:162
      version : aliased long;  -- openssl/dsa.h:163
      write_params : aliased int;  -- openssl/dsa.h:164
      p : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;  -- openssl/dsa.h:165
      q : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;  -- openssl/dsa.h:166
      g : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;  -- openssl/dsa.h:167
      pub_key : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;  -- openssl/dsa.h:169
      priv_key : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;  -- openssl/dsa.h:170
      kinv : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;  -- openssl/dsa.h:172
      r : access OpenSSL.Low_Level.ossl_typ_h.BIGNUM;  -- openssl/dsa.h:173
      flags : aliased int;  -- openssl/dsa.h:175
      method_mont_p : access OpenSSL.Low_Level.ossl_typ_h.BN_MONT_CTX;  -- openssl/dsa.h:177
      references : aliased int;  -- openssl/dsa.h:178
      ex_data : aliased OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;  -- openssl/dsa.h:179
      meth : access constant OpenSSL.Low_Level.dsa_h.dsa_st_METHOD;  -- openssl/dsa.h:180
      the_engine : System.Address;  -- openssl/dsa.h:182
   end record;
   pragma Convention (C_Pass_By_Copy, dsa_st);  -- openssl/dsa.h:158

   function DSAparams_dup (x : access OpenSSL.Low_Level.dsa_h.dsa_st) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/dsa.h:193
   pragma Import (C, DSAparams_dup, "DSAparams_dup");

   function DSA_SIG_new return access DSA_SIG;  -- openssl/dsa.h:194
   pragma Import (C, DSA_SIG_new, "DSA_SIG_new");

   procedure DSA_SIG_free (a : access DSA_SIG);  -- openssl/dsa.h:195
   pragma Import (C, DSA_SIG_free, "DSA_SIG_free");

   function i2d_DSA_SIG (a : System.Address; pp : System.Address) return int;  -- openssl/dsa.h:196
   pragma Import (C, i2d_DSA_SIG, "i2d_DSA_SIG");

   function d2i_DSA_SIG
     (v : System.Address;
      pp : System.Address;
      length : long) return access DSA_SIG;  -- openssl/dsa.h:197
   pragma Import (C, d2i_DSA_SIG, "d2i_DSA_SIG");

   function DSA_do_sign
     (dgst : access unsigned_char;
      dlen : int;
      the_dsa : access OpenSSL.Low_Level.dsa_h.dsa_st) return access DSA_SIG;  -- openssl/dsa.h:199
   pragma Import (C, DSA_do_sign, "DSA_do_sign");

   function DSA_do_verify
     (dgst : access unsigned_char;
      dgst_len : int;
      sig : access DSA_SIG;
      the_dsa : access OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/dsa.h:200
   pragma Import (C, DSA_do_verify, "DSA_do_verify");

   function DSA_OpenSSL return access constant OpenSSL.Low_Level.dsa_h.dsa_st_METHOD;  -- openssl/dsa.h:203
   pragma Import (C, DSA_OpenSSL, "DSA_OpenSSL");

   procedure DSA_set_default_method (arg1 : access constant OpenSSL.Low_Level.dsa_h.dsa_st_METHOD);  -- openssl/dsa.h:205
   pragma Import (C, DSA_set_default_method, "DSA_set_default_method");

   function DSA_get_default_method return access constant OpenSSL.Low_Level.dsa_h.dsa_st_METHOD;  -- openssl/dsa.h:206
   pragma Import (C, DSA_get_default_method, "DSA_get_default_method");

   function DSA_set_method (the_dsa : access OpenSSL.Low_Level.dsa_h.dsa_st; arg2 : access constant OpenSSL.Low_Level.dsa_h.dsa_st_METHOD) return int;  -- openssl/dsa.h:207
   pragma Import (C, DSA_set_method, "DSA_set_method");

   function DSA_new return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/dsa.h:209
   pragma Import (C, DSA_new, "DSA_new");

   function DSA_new_method (the_engine : System.Address) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/dsa.h:210
   pragma Import (C, DSA_new_method, "DSA_new_method");

   procedure DSA_free (r : access OpenSSL.Low_Level.dsa_h.dsa_st);  -- openssl/dsa.h:211
   pragma Import (C, DSA_free, "DSA_free");

   function DSA_up_ref (r : access OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/dsa.h:213
   pragma Import (C, DSA_up_ref, "DSA_up_ref");

   function DSA_size (arg1 : access constant OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/dsa.h:214
   pragma Import (C, DSA_size, "DSA_size");

   function DSA_sign_setup
     (the_dsa : access OpenSSL.Low_Level.dsa_h.dsa_st;
      ctx_in : System.Address;
      kinvp : System.Address;
      rp : System.Address) return int;  -- openssl/dsa.h:216
   pragma Import (C, DSA_sign_setup, "DSA_sign_setup");

   function DSA_sign
     (c_type : int;
      dgst : access unsigned_char;
      dlen : int;
      sig : access unsigned_char;
      siglen : access unsigned;
      the_dsa : access OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/dsa.h:217
   pragma Import (C, DSA_sign, "DSA_sign");

   function DSA_verify
     (c_type : int;
      dgst : access unsigned_char;
      dgst_len : int;
      sigbuf : access unsigned_char;
      siglen : int;
      the_dsa : access OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/dsa.h:219
   pragma Import (C, DSA_verify, "DSA_verify");

   function DSA_get_ex_new_index
     (argl : long;
      argp : System.Address;
      new_func : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      dup_func : access function
        (arg1 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg2 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg3 : System.Address;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      free_func : access procedure
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address)) return int;  -- openssl/dsa.h:221
   pragma Import (C, DSA_get_ex_new_index, "DSA_get_ex_new_index");

   function DSA_set_ex_data
     (d : access OpenSSL.Low_Level.dsa_h.dsa_st;
      idx : int;
      arg : System.Address) return int;  -- openssl/dsa.h:223
   pragma Import (C, DSA_set_ex_data, "DSA_set_ex_data");

   function DSA_get_ex_data (d : access OpenSSL.Low_Level.dsa_h.dsa_st; idx : int) return System.Address;  -- openssl/dsa.h:224
   pragma Import (C, DSA_get_ex_data, "DSA_get_ex_data");

   function d2i_DSAPublicKey
     (a : System.Address;
      pp : System.Address;
      length : long) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/dsa.h:226
   pragma Import (C, d2i_DSAPublicKey, "d2i_DSAPublicKey");

   function d2i_DSAPrivateKey
     (a : System.Address;
      pp : System.Address;
      length : long) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/dsa.h:227
   pragma Import (C, d2i_DSAPrivateKey, "d2i_DSAPrivateKey");

   function d2i_DSAparams
     (a : System.Address;
      pp : System.Address;
      length : long) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/dsa.h:228
   pragma Import (C, d2i_DSAparams, "d2i_DSAparams");

   function DSA_generate_parameters
     (bits : int;
      seed : access unsigned_char;
      seed_len : int;
      counter_ret : access int;
      h_ret : access unsigned_long;
      callback : access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : System.Address);
      cb_arg : System.Address) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/dsa.h:232
   pragma Import (C, DSA_generate_parameters, "DSA_generate_parameters");

   function DSA_generate_parameters_ex
     (the_dsa : access OpenSSL.Low_Level.dsa_h.dsa_st;
      bits : int;
      seed : access unsigned_char;
      seed_len : int;
      counter_ret : access int;
      h_ret : access unsigned_long;
      cb : access OpenSSL.Low_Level.ossl_typ_h.BN_GENCB) return int;  -- openssl/dsa.h:239
   pragma Import (C, DSA_generate_parameters_ex, "DSA_generate_parameters_ex");

   function DSA_generate_key (a : access OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/dsa.h:243
   pragma Import (C, DSA_generate_key, "DSA_generate_key");

   function i2d_DSAPublicKey (a : access constant OpenSSL.Low_Level.dsa_h.dsa_st; pp : System.Address) return int;  -- openssl/dsa.h:244
   pragma Import (C, i2d_DSAPublicKey, "i2d_DSAPublicKey");

   function i2d_DSAPrivateKey (a : access constant OpenSSL.Low_Level.dsa_h.dsa_st; pp : System.Address) return int;  -- openssl/dsa.h:245
   pragma Import (C, i2d_DSAPrivateKey, "i2d_DSAPrivateKey");

   function i2d_DSAparams (a : access constant OpenSSL.Low_Level.dsa_h.dsa_st; pp : System.Address) return int;  -- openssl/dsa.h:246
   pragma Import (C, i2d_DSAparams, "i2d_DSAparams");

   function DSAparams_print (bp : access OpenSSL.Low_Level.bio_h.BIO; x : access constant OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/dsa.h:249
   pragma Import (C, DSAparams_print, "DSAparams_print");

   function DSA_print
     (bp : access OpenSSL.Low_Level.bio_h.BIO;
      x : access constant OpenSSL.Low_Level.dsa_h.dsa_st;
      off : int) return int;  -- openssl/dsa.h:250
   pragma Import (C, DSA_print, "DSA_print");

   function DSAparams_print_fp (fp : access Interfaces.C_Streams.FILEs; x : access constant OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/dsa.h:253
   pragma Import (C, DSAparams_print_fp, "DSAparams_print_fp");

   function DSA_print_fp
     (bp : access Interfaces.C_Streams.FILEs;
      x : access constant OpenSSL.Low_Level.dsa_h.dsa_st;
      off : int) return int;  -- openssl/dsa.h:254
   pragma Import (C, DSA_print_fp, "DSA_print_fp");

   function DSA_dup_DH (r : access constant OpenSSL.Low_Level.dsa_h.dsa_st) return access OpenSSL.Low_Level.dh_h.dh_st;  -- openssl/dsa.h:266
   pragma Import (C, DSA_dup_DH, "DSA_dup_DH");

   procedure ERR_load_DSA_strings;  -- openssl/dsa.h:281
   pragma Import (C, ERR_load_DSA_strings, "ERR_load_DSA_strings");

end OpenSSL.Low_Level.dsa_h;
