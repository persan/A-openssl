with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with OpenSSL.Low_Level.bio_h;
with OpenSSL.Low_Level.crypto_h;
with Interfaces.C_Streams;
with OpenSSL.Low_Level.bn_h;

package OpenSSL.Low_Level.dh_h is

   package defs is

      OPENSSL_DH_MAX_MODULUS_BITS : constant := 10000;  --  openssl/dh.h:77

      OPENSSL_DH_FIPS_MIN_MODULUS_BITS : constant := 1024;  --  openssl/dh.h:80

      DH_FLAG_CACHE_MONT_P        : constant := 16#01#;  --  openssl/dh.h:82
      DH_FLAG_NO_EXP_CONSTTIME    : constant := 16#02#;  --  openssl/dh.h:83

      DH_GENERATOR_2              : constant := 2;  --  openssl/dh.h:144

      DH_GENERATOR_5              : constant := 5;  --  openssl/dh.h:146

      DH_CHECK_P_NOT_PRIME        : constant := 16#01#;  --  openssl/dh.h:149
      DH_CHECK_P_NOT_SAFE_PRIME   : constant := 16#02#;  --  openssl/dh.h:150
      DH_UNABLE_TO_CHECK_GENERATOR : constant := 16#04#;  --  openssl/dh.h:151
      DH_NOT_SUITABLE_GENERATOR   : constant := 16#08#;  --  openssl/dh.h:152

      DH_CHECK_PUBKEY_TOO_SMALL   : constant := 16#01#;  --  openssl/dh.h:155
      DH_CHECK_PUBKEY_TOO_LARGE   : constant := 16#02#;  --  openssl/dh.h:156
      --  unsupported macro: DH_CHECK_P_NOT_STRONG_PRIME DH_CHECK_P_NOT_SAFE_PRIME
      --  arg-macro: function d2i_DHparams_fp (fp, x)
      --    return DH *)ASN1_d2i_fp((char *(*)())DH_new, (char *(*)())d2i_DHparams,(fp),(unsigned char **)(x);
      --  arg-macro: procedure i2d_DHparams_fp (fp, x)
      --    ASN1_i2d_fp(i2d_DHparams,(fp), (unsigned char *)(x))
      --  arg-macro: procedure d2i_DHparams_bio (bp, x)
      --    ASN1_d2i_bio_of(DH,DH_new,d2i_DHparams,bp,x)
      --  arg-macro: procedure i2d_DHparams_bio (bp, x)
      --    ASN1_i2d_bio_of_const(DH,i2d_DHparams,bp,x)
      --  arg-macro: procedure EVP_PKEY_CTX_set_dh_paramgen_prime_len (ctx, len)
      --    EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DH, EVP_PKEY_OP_PARAMGEN, EVP_PKEY_CTRL_DH_PARAMGEN_PRIME_LEN, len, NULL)
      --  arg-macro: procedure EVP_PKEY_CTX_set_dh_paramgen_generator (ctx, gen)
      --    EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_DH, EVP_PKEY_OP_PARAMGEN, EVP_PKEY_CTRL_DH_PARAMGEN_GENERATOR, gen, NULL)
      --  unsupported macro: EVP_PKEY_CTRL_DH_PARAMGEN_PRIME_LEN (EVP_PKEY_ALG_CTRL + 1)
      --  unsupported macro: EVP_PKEY_CTRL_DH_PARAMGEN_GENERATOR (EVP_PKEY_ALG_CTRL + 2)

      DH_F_COMPUTE_KEY            : constant := 102;  --  openssl/dh.h:232
      DH_F_DHPARAMS_PRINT_FP      : constant := 101;  --  openssl/dh.h:233
      DH_F_DH_BUILTIN_GENPARAMS   : constant := 106;  --  openssl/dh.h:234
      DH_F_DH_NEW_METHOD          : constant := 105;  --  openssl/dh.h:235
      DH_F_DH_PARAM_DECODE        : constant := 107;  --  openssl/dh.h:236
      DH_F_DH_PRIV_DECODE         : constant := 110;  --  openssl/dh.h:237
      DH_F_DH_PRIV_ENCODE         : constant := 111;  --  openssl/dh.h:238
      DH_F_DH_PUB_DECODE          : constant := 108;  --  openssl/dh.h:239
      DH_F_DH_PUB_ENCODE          : constant := 109;  --  openssl/dh.h:240
      DH_F_DO_DH_PRINT            : constant := 100;  --  openssl/dh.h:241
      DH_F_GENERATE_KEY           : constant := 103;  --  openssl/dh.h:242
      DH_F_GENERATE_PARAMETERS    : constant := 104;  --  openssl/dh.h:243
      DH_F_PKEY_DH_DERIVE         : constant := 112;  --  openssl/dh.h:244
      DH_F_PKEY_DH_KEYGEN         : constant := 113;  --  openssl/dh.h:245
      DH_F_DH_COMPUTE_KEY         : constant := 114;  --  openssl/dh.h:246
      DH_F_DH_GENERATE_KEY        : constant := 115;  --  openssl/dh.h:247

      DH_R_BAD_GENERATOR          : constant := 101;  --  openssl/dh.h:250
      DH_R_BN_DECODE_ERROR        : constant := 109;  --  openssl/dh.h:251
      DH_R_BN_ERROR               : constant := 106;  --  openssl/dh.h:252
      DH_R_DECODE_ERROR           : constant := 104;  --  openssl/dh.h:253
      DH_R_INVALID_PUBKEY         : constant := 102;  --  openssl/dh.h:254
      DH_R_KEYS_NOT_SET           : constant := 108;  --  openssl/dh.h:255
      DH_R_MODULUS_TOO_LARGE      : constant := 103;  --  openssl/dh.h:256
      DH_R_NO_PARAMETERS_SET      : constant := 107;  --  openssl/dh.h:257
      DH_R_NO_PRIVATE_VALUE       : constant := 100;  --  openssl/dh.h:258
      DH_R_PARAMETER_ENCODING_ERROR : constant := 105;  --  openssl/dh.h:259
      DH_R_KEY_SIZE_TOO_SMALL     : constant := 110;  --  openssl/dh.h:260
   end defs;
   type dh_st;
   type dh_method is record
      name            : Interfaces.C.Strings.chars_ptr;  -- openssl/dh.h:101
      generate_key    : access function (arg1 : System.Address) return int;  -- openssl/dh.h:103
      compute_key     : access function
        (arg1 : access unsigned_char;
         arg2            : access constant OpenSSL.Low_Level.bn_h.bignum_st;
         arg3            : System.Address) return int;  -- openssl/dh.h:104
      bn_mod_exp      : access function
        (arg1 : access constant OpenSSL.Low_Level.dh_h.dh_st;
         arg2            : access OpenSSL.Low_Level.bn_h.bignum_st;
         arg3            : access constant OpenSSL.Low_Level.bn_h.bignum_st;
         arg4            : access constant OpenSSL.Low_Level.bn_h.bignum_st;
         arg5            : access constant OpenSSL.Low_Level.bn_h.bignum_st;
         arg6            : System.Address;
         arg7            : access OpenSSL.Low_Level.bn_h.bn_mont_ctx_st) return int;  -- openssl/dh.h:107
      init            : access function (arg1 : System.Address) return int;  -- openssl/dh.h:109
      finish          : access function (arg1 : System.Address) return int;  -- openssl/dh.h:110
      flags           : aliased int;  -- openssl/dh.h:111
      app_data        : Interfaces.C.Strings.chars_ptr;  -- openssl/dh.h:112
      generate_params : access function
        (arg1 : System.Address;
         arg2            : int;
         arg3            : int;
         arg4            : access OpenSSL.Low_Level.bn_h.bn_gencb_st) return int;  -- openssl/dh.h:114
   end record;
   pragma Convention (C_Pass_By_Copy, dh_method);  -- openssl/dh.h:99

   type dh_st is record
      pad           : aliased int;  -- openssl/dh.h:121
      version       : aliased int;  -- openssl/dh.h:122
      p             : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/dh.h:123
      g             : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/dh.h:124
      length        : aliased long;  -- openssl/dh.h:125
      pub_key       : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/dh.h:126
      priv_key      : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/dh.h:127
      flags         : aliased int;  -- openssl/dh.h:129
      method_mont_p : access OpenSSL.Low_Level.bn_h.bn_mont_ctx_st;  -- openssl/dh.h:130
      q             : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/dh.h:132
      j             : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/dh.h:133
      seed          : access unsigned_char;  -- openssl/dh.h:134
      seedlen       : aliased int;  -- openssl/dh.h:135
      counter       : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/dh.h:136
      references    : aliased int;  -- openssl/dh.h:138
      ex_data       : aliased OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;  -- openssl/dh.h:139
      meth          : access constant OpenSSL.Low_Level.dh_h.dh_method;  -- openssl/dh.h:140
      the_engine    : System.Address;  -- openssl/dh.h:141
   end record;
   pragma Convention (C_Pass_By_Copy, dh_st);  -- openssl/dh.h:117

   function DHparams_dup (arg1 : access OpenSSL.Low_Level.dh_h.dh_st) return access OpenSSL.Low_Level.dh_h.dh_st;  -- openssl/dh.h:169
   pragma Import (C, DHparams_dup, "DHparams_dup");

   function DH_OpenSSL return access constant OpenSSL.Low_Level.dh_h.dh_method;  -- openssl/dh.h:171
   pragma Import (C, DH_OpenSSL, "DH_OpenSSL");

   procedure DH_set_default_method (meth : access constant OpenSSL.Low_Level.dh_h.dh_method);  -- openssl/dh.h:173
   pragma Import (C, DH_set_default_method, "DH_set_default_method");

   function DH_get_default_method return access constant OpenSSL.Low_Level.dh_h.dh_method;  -- openssl/dh.h:174
   pragma Import (C, DH_get_default_method, "DH_get_default_method");

   function DH_set_method (the_dh : access OpenSSL.Low_Level.dh_h.dh_st; meth : access constant OpenSSL.Low_Level.dh_h.dh_method) return int;  -- openssl/dh.h:175
   pragma Import (C, DH_set_method, "DH_set_method");

   function DH_new_method (the_engine : System.Address) return access OpenSSL.Low_Level.dh_h.dh_st;  -- openssl/dh.h:176
   pragma Import (C, DH_new_method, "DH_new_method");

   function DH_new return access OpenSSL.Low_Level.dh_h.dh_st;  -- openssl/dh.h:178
   pragma Import (C, DH_new, "DH_new");

   procedure DH_free (the_dh : access OpenSSL.Low_Level.dh_h.dh_st);  -- openssl/dh.h:179
   pragma Import (C, DH_free, "DH_free");

   function DH_up_ref (the_dh : access OpenSSL.Low_Level.dh_h.dh_st) return int;  -- openssl/dh.h:180
   pragma Import (C, DH_up_ref, "DH_up_ref");

   function DH_size (the_dh : access constant OpenSSL.Low_Level.dh_h.dh_st) return int;  -- openssl/dh.h:181
   pragma Import (C, DH_size, "DH_size");

   function DH_get_ex_new_index
     (argl      : long;
      argp      : System.Address;
      new_func  : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      dup_func  : access function
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
         arg6 : System.Address)) return int;  -- openssl/dh.h:182
   pragma Import (C, DH_get_ex_new_index, "DH_get_ex_new_index");

   function DH_set_ex_data
     (d   : access OpenSSL.Low_Level.dh_h.dh_st;
      idx : int;
      arg : System.Address) return int;  -- openssl/dh.h:184
   pragma Import (C, DH_set_ex_data, "DH_set_ex_data");

   function DH_get_ex_data (d : access OpenSSL.Low_Level.dh_h.dh_st; idx : int) return System.Address;  -- openssl/dh.h:185
   pragma Import (C, DH_get_ex_data, "DH_get_ex_data");

   function DH_generate_parameters
     (prime_len : int;
      generator : int;
      callback  : access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : System.Address);
      cb_arg    : System.Address) return access OpenSSL.Low_Level.dh_h.dh_st;  -- openssl/dh.h:189
   pragma Import (C, DH_generate_parameters, "DH_generate_parameters");

   function DH_generate_parameters_ex
     (the_dh    : access OpenSSL.Low_Level.dh_h.dh_st;
      prime_len : int;
      generator : int;
      cb        : access OpenSSL.Low_Level.bn_h.bn_gencb_st) return int;  -- openssl/dh.h:194
   pragma Import (C, DH_generate_parameters_ex, "DH_generate_parameters_ex");

   function DH_check (the_dh : access constant OpenSSL.Low_Level.dh_h.dh_st; codes : access int) return int;  -- openssl/dh.h:196
   pragma Import (C, DH_check, "DH_check");

   function DH_check_pub_key
     (the_dh  : access constant OpenSSL.Low_Level.dh_h.dh_st;
      pub_key : access constant OpenSSL.Low_Level.bn_h.bignum_st;
      codes   : access int) return int;  -- openssl/dh.h:197
   pragma Import (C, DH_check_pub_key, "DH_check_pub_key");

   function DH_generate_key (the_dh : access OpenSSL.Low_Level.dh_h.dh_st) return int;  -- openssl/dh.h:198
   pragma Import (C, DH_generate_key, "DH_generate_key");

   function DH_compute_key
     (key     : access unsigned_char;
      pub_key : access constant OpenSSL.Low_Level.bn_h.bignum_st;
      the_dh  : access OpenSSL.Low_Level.dh_h.dh_st) return int;  -- openssl/dh.h:199
   pragma Import (C, DH_compute_key, "DH_compute_key");

   function d2i_DHparams
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access OpenSSL.Low_Level.dh_h.dh_st;  -- openssl/dh.h:200
   pragma Import (C, d2i_DHparams, "d2i_DHparams");

   function i2d_DHparams (a : access constant OpenSSL.Low_Level.dh_h.dh_st; pp : System.Address) return int;  -- openssl/dh.h:201
   pragma Import (C, i2d_DHparams, "i2d_DHparams");

   function DHparams_print_fp (fp : access Interfaces.C_Streams.FILEs; x : access constant OpenSSL.Low_Level.dh_h.dh_st) return int;  -- openssl/dh.h:203
   pragma Import (C, DHparams_print_fp, "DHparams_print_fp");

   function DHparams_print (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access constant OpenSSL.Low_Level.dh_h.dh_st) return int;  -- openssl/dh.h:206
   pragma Import (C, DHparams_print, "DHparams_print");

   procedure ERR_load_DH_strings;  -- openssl/dh.h:227
   pragma Import (C, ERR_load_DH_strings, "ERR_load_DH_strings");

end OpenSSL.Low_Level.dh_h;
