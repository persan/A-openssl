with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with OpenSSL.Low_Level.asn1_h;
limited with OpenSSL.Low_Level.bio_h;
with Interfaces.C_Streams;
with OpenSSL.Low_Level.bn_h;
with OpenSSL.Low_Level.crypto_h;
with OpenSSL.Low_Level.evp_h;
with OpenSSL.Low_Level.asn1t_h;
package OpenSSL.Low_Level.rsa_h is
   package defs is


      RSA_FLAG_FIPS_METHOD : constant := 16#0400#;  --  openssl/rsa.h:83

      RSA_FLAG_NON_FIPS_ALLOW : constant := 16#0400#;  --  openssl/rsa.h:90

      OPENSSL_RSA_MAX_MODULUS_BITS : constant := 16384;  --  openssl/rsa.h:179

      OPENSSL_RSA_FIPS_MIN_MODULUS_BITS : constant := 1024;  --  openssl/rsa.h:182

      OPENSSL_RSA_SMALL_MODULUS_BITS : constant := 3072;  --  openssl/rsa.h:185

      OPENSSL_RSA_MAX_PUBEXP_BITS : constant := 64;  --  openssl/rsa.h:188

      RSA_3                : constant := 16#3#;  --  openssl/rsa.h:191
      RSA_F4               : constant := 16#10001#;  --  openssl/rsa.h:192

      RSA_METHOD_FLAG_NO_CHECK : constant := 16#0001#;  --  openssl/rsa.h:194

      RSA_FLAG_CACHE_PUBLIC : constant := 16#0002#;  --  openssl/rsa.h:196
      RSA_FLAG_CACHE_PRIVATE : constant := 16#0004#;  --  openssl/rsa.h:197
      RSA_FLAG_BLINDING    : constant := 16#0008#;  --  openssl/rsa.h:198
      RSA_FLAG_THREAD_SAFE : constant := 16#0010#;  --  openssl/rsa.h:199

      RSA_FLAG_EXT_PKEY    : constant := 16#0020#;  --  openssl/rsa.h:205

      RSA_FLAG_SIGN_VER    : constant := 16#0040#;  --  openssl/rsa.h:209

      RSA_FLAG_NO_BLINDING : constant := 16#0080#;  --  openssl/rsa.h:211

      RSA_FLAG_NO_CONSTTIME : constant := 16#0100#;  --  openssl/rsa.h:216
      --  unsupported macro: RSA_FLAG_NO_EXP_CONSTTIME RSA_FLAG_NO_CONSTTIME
      --  arg-macro: procedure EVP_PKEY_CTX_set_rsa_padding (ctx, pad)
      --    EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_RSA, -1, EVP_PKEY_CTRL_RSA_PADDING, pad, NULL)
      --  arg-macro: procedure EVP_PKEY_CTX_set_rsa_pss_saltlen (ctx, len)
      --    EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_RSA, (EVP_PKEY_OP_SIGNorEVP_PKEY_OP_VERIFY), EVP_PKEY_CTRL_RSA_PSS_SALTLEN, len, NULL)
      --  arg-macro: procedure EVP_PKEY_CTX_set_rsa_keygen_bits (ctx, bits)
      --    EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_RSA, EVP_PKEY_OP_KEYGEN, EVP_PKEY_CTRL_RSA_KEYGEN_BITS, bits, NULL)
      --  arg-macro: procedure EVP_PKEY_CTX_set_rsa_keygen_pubexp (ctx, pubexp)
      --    EVP_PKEY_CTX_ctrl(ctx, EVP_PKEY_RSA, EVP_PKEY_OP_KEYGEN, EVP_PKEY_CTRL_RSA_KEYGEN_PUBEXP, 0, pubexp)
      --  unsupported macro: EVP_PKEY_CTRL_RSA_PADDING (EVP_PKEY_ALG_CTRL + 1)
      --  unsupported macro: EVP_PKEY_CTRL_RSA_PSS_SALTLEN (EVP_PKEY_ALG_CTRL + 2)
      --  unsupported macro: EVP_PKEY_CTRL_RSA_KEYGEN_BITS (EVP_PKEY_ALG_CTRL + 3)
      --  unsupported macro: EVP_PKEY_CTRL_RSA_KEYGEN_PUBEXP (EVP_PKEY_ALG_CTRL + 4)

      RSA_PKCS1_PADDING    : constant := 1;  --  openssl/rsa.h:262
      RSA_SSLV23_PADDING   : constant := 2;  --  openssl/rsa.h:263
      RSA_NO_PADDING       : constant := 3;  --  openssl/rsa.h:264
      RSA_PKCS1_OAEP_PADDING : constant := 4;  --  openssl/rsa.h:265
      RSA_X931_PADDING     : constant := 5;  --  openssl/rsa.h:266

      RSA_PKCS1_PSS_PADDING : constant := 6;  --  openssl/rsa.h:268

      RSA_PKCS1_PADDING_SIZE : constant := 11;  --  openssl/rsa.h:270
      --  arg-macro: procedure RSA_set_app_data (s, arg)
      --    RSA_set_ex_data(s,0,arg)
      --  arg-macro: procedure RSA_get_app_data (s)
      --    RSA_get_ex_data(s,0)

      RSA_F_CHECK_PADDING_MD : constant := 140;  --  openssl/rsa.h:422
      RSA_F_DO_RSA_PRINT   : constant := 146;  --  openssl/rsa.h:423
      RSA_F_INT_RSA_VERIFY : constant := 145;  --  openssl/rsa.h:424
      RSA_F_MEMORY_LOCK    : constant := 100;  --  openssl/rsa.h:425
      RSA_F_OLD_RSA_PRIV_DECODE : constant := 147;  --  openssl/rsa.h:426
      RSA_F_PKEY_RSA_CTRL  : constant := 143;  --  openssl/rsa.h:427
      RSA_F_PKEY_RSA_CTRL_STR : constant := 144;  --  openssl/rsa.h:428
      RSA_F_PKEY_RSA_SIGN  : constant := 142;  --  openssl/rsa.h:429
      RSA_F_PKEY_RSA_VERIFYRECOVER : constant := 141;  --  openssl/rsa.h:430
      RSA_F_RSA_BUILTIN_KEYGEN : constant := 129;  --  openssl/rsa.h:431
      RSA_F_RSA_CHECK_KEY  : constant := 123;  --  openssl/rsa.h:432
      RSA_F_RSA_EAY_PRIVATE_DECRYPT : constant := 101;  --  openssl/rsa.h:433
      RSA_F_RSA_EAY_PRIVATE_ENCRYPT : constant := 102;  --  openssl/rsa.h:434
      RSA_F_RSA_EAY_PUBLIC_DECRYPT : constant := 103;  --  openssl/rsa.h:435
      RSA_F_RSA_EAY_PUBLIC_ENCRYPT : constant := 104;  --  openssl/rsa.h:436
      RSA_F_RSA_GENERATE_KEY : constant := 105;  --  openssl/rsa.h:437
      RSA_F_RSA_MEMORY_LOCK : constant := 130;  --  openssl/rsa.h:438
      RSA_F_RSA_NEW_METHOD : constant := 106;  --  openssl/rsa.h:439
      RSA_F_RSA_NULL       : constant := 124;  --  openssl/rsa.h:440
      RSA_F_RSA_NULL_MOD_EXP : constant := 131;  --  openssl/rsa.h:441
      RSA_F_RSA_NULL_PRIVATE_DECRYPT : constant := 132;  --  openssl/rsa.h:442
      RSA_F_RSA_NULL_PRIVATE_ENCRYPT : constant := 133;  --  openssl/rsa.h:443
      RSA_F_RSA_NULL_PUBLIC_DECRYPT : constant := 134;  --  openssl/rsa.h:444
      RSA_F_RSA_NULL_PUBLIC_ENCRYPT : constant := 135;  --  openssl/rsa.h:445
      RSA_F_RSA_PADDING_ADD_NONE : constant := 107;  --  openssl/rsa.h:446
      RSA_F_RSA_PADDING_ADD_PKCS1_OAEP : constant := 121;  --  openssl/rsa.h:447
      RSA_F_RSA_PADDING_ADD_PKCS1_PSS : constant := 125;  --  openssl/rsa.h:448
      RSA_F_RSA_PADDING_ADD_PKCS1_TYPE_1 : constant := 108;  --  openssl/rsa.h:449
      RSA_F_RSA_PADDING_ADD_PKCS1_TYPE_2 : constant := 109;  --  openssl/rsa.h:450
      RSA_F_RSA_PADDING_ADD_SSLV23 : constant := 110;  --  openssl/rsa.h:451
      RSA_F_RSA_PADDING_ADD_X931 : constant := 127;  --  openssl/rsa.h:452
      RSA_F_RSA_PADDING_CHECK_NONE : constant := 111;  --  openssl/rsa.h:453
      RSA_F_RSA_PADDING_CHECK_PKCS1_OAEP : constant := 122;  --  openssl/rsa.h:454
      RSA_F_RSA_PADDING_CHECK_PKCS1_TYPE_1 : constant := 112;  --  openssl/rsa.h:455
      RSA_F_RSA_PADDING_CHECK_PKCS1_TYPE_2 : constant := 113;  --  openssl/rsa.h:456
      RSA_F_RSA_PADDING_CHECK_SSLV23 : constant := 114;  --  openssl/rsa.h:457
      RSA_F_RSA_PADDING_CHECK_X931 : constant := 128;  --  openssl/rsa.h:458
      RSA_F_RSA_PRINT      : constant := 115;  --  openssl/rsa.h:459
      RSA_F_RSA_PRINT_FP   : constant := 116;  --  openssl/rsa.h:460
      RSA_F_RSA_PRIV_DECODE : constant := 137;  --  openssl/rsa.h:461
      RSA_F_RSA_PRIV_ENCODE : constant := 138;  --  openssl/rsa.h:462
      RSA_F_RSA_PRIVATE_ENCRYPT : constant := 148;  --  openssl/rsa.h:463
      RSA_F_RSA_PUB_DECODE : constant := 139;  --  openssl/rsa.h:464
      RSA_F_RSA_PUBLIC_DECRYPT : constant := 149;  --  openssl/rsa.h:465
      RSA_F_RSA_SETUP_BLINDING : constant := 136;  --  openssl/rsa.h:466
      RSA_F_RSA_SET_DEFAULT_METHOD : constant := 150;  --  openssl/rsa.h:467
      RSA_F_RSA_SET_METHOD : constant := 151;  --  openssl/rsa.h:468
      RSA_F_RSA_SIGN       : constant := 117;  --  openssl/rsa.h:469
      RSA_F_RSA_SIGN_ASN1_OCTET_STRING : constant := 118;  --  openssl/rsa.h:470
      RSA_F_RSA_VERIFY     : constant := 119;  --  openssl/rsa.h:471
      RSA_F_RSA_VERIFY_ASN1_OCTET_STRING : constant := 120;  --  openssl/rsa.h:472
      RSA_F_RSA_VERIFY_PKCS1_PSS : constant := 126;  --  openssl/rsa.h:473

      RSA_R_ALGORITHM_MISMATCH : constant := 100;  --  openssl/rsa.h:476
      RSA_R_BAD_E_VALUE    : constant := 101;  --  openssl/rsa.h:477
      RSA_R_BAD_FIXED_HEADER_DECRYPT : constant := 102;  --  openssl/rsa.h:478
      RSA_R_BAD_PAD_BYTE_COUNT : constant := 103;  --  openssl/rsa.h:479
      RSA_R_BAD_SIGNATURE  : constant := 104;  --  openssl/rsa.h:480
      RSA_R_BLOCK_TYPE_IS_NOT_01 : constant := 106;  --  openssl/rsa.h:481
      RSA_R_BLOCK_TYPE_IS_NOT_02 : constant := 107;  --  openssl/rsa.h:482
      RSA_R_DATA_GREATER_THAN_MOD_LEN : constant := 108;  --  openssl/rsa.h:483
      RSA_R_DATA_TOO_LARGE : constant := 109;  --  openssl/rsa.h:484
      RSA_R_DATA_TOO_LARGE_FOR_KEY_SIZE : constant := 110;  --  openssl/rsa.h:485
      RSA_R_DATA_TOO_LARGE_FOR_MODULUS : constant := 132;  --  openssl/rsa.h:486
      RSA_R_DATA_TOO_SMALL : constant := 111;  --  openssl/rsa.h:487
      RSA_R_DATA_TOO_SMALL_FOR_KEY_SIZE : constant := 122;  --  openssl/rsa.h:488
      RSA_R_DIGEST_TOO_BIG_FOR_RSA_KEY : constant := 112;  --  openssl/rsa.h:489
      RSA_R_DMP1_NOT_CONGRUENT_TO_D : constant := 124;  --  openssl/rsa.h:490
      RSA_R_DMQ1_NOT_CONGRUENT_TO_D : constant := 125;  --  openssl/rsa.h:491
      RSA_R_D_E_NOT_CONGRUENT_TO_1 : constant := 123;  --  openssl/rsa.h:492
      RSA_R_FIRST_OCTET_INVALID : constant := 133;  --  openssl/rsa.h:493
      RSA_R_ILLEGAL_OR_UNSUPPORTED_PADDING_MODE : constant := 144;  --  openssl/rsa.h:494
      RSA_R_INVALID_DIGEST_LENGTH : constant := 143;  --  openssl/rsa.h:495
      RSA_R_INVALID_HEADER : constant := 137;  --  openssl/rsa.h:496
      RSA_R_INVALID_KEYBITS : constant := 145;  --  openssl/rsa.h:497
      RSA_R_INVALID_MESSAGE_LENGTH : constant := 131;  --  openssl/rsa.h:498
      RSA_R_INVALID_PADDING : constant := 138;  --  openssl/rsa.h:499
      RSA_R_INVALID_PADDING_MODE : constant := 141;  --  openssl/rsa.h:500
      RSA_R_INVALID_PSS_SALTLEN : constant := 146;  --  openssl/rsa.h:501
      RSA_R_INVALID_TRAILER : constant := 139;  --  openssl/rsa.h:502
      RSA_R_INVALID_X931_DIGEST : constant := 142;  --  openssl/rsa.h:503
      RSA_R_IQMP_NOT_INVERSE_OF_Q : constant := 126;  --  openssl/rsa.h:504
      RSA_R_KEY_SIZE_TOO_SMALL : constant := 120;  --  openssl/rsa.h:505
      RSA_R_LAST_OCTET_INVALID : constant := 134;  --  openssl/rsa.h:506
      RSA_R_MODULUS_TOO_LARGE : constant := 105;  --  openssl/rsa.h:507
      RSA_R_NON_FIPS_METHOD : constant := 149;  --  openssl/rsa.h:508
      RSA_R_NO_PUBLIC_EXPONENT : constant := 140;  --  openssl/rsa.h:509
      RSA_R_NULL_BEFORE_BLOCK_MISSING : constant := 113;  --  openssl/rsa.h:510
      RSA_R_N_DOES_NOT_EQUAL_P_Q : constant := 127;  --  openssl/rsa.h:511
      RSA_R_OAEP_DECODING_ERROR : constant := 121;  --  openssl/rsa.h:512
      RSA_R_OPERATION_NOT_ALLOWED_IN_FIPS_MODE : constant := 150;  --  openssl/rsa.h:513
      RSA_R_OPERATION_NOT_SUPPORTED_FOR_THIS_KEYTYPE : constant := 148;  --  openssl/rsa.h:514
      RSA_R_PADDING_CHECK_FAILED : constant := 114;  --  openssl/rsa.h:515
      RSA_R_P_NOT_PRIME    : constant := 128;  --  openssl/rsa.h:516
      RSA_R_Q_NOT_PRIME    : constant := 129;  --  openssl/rsa.h:517
      RSA_R_RSA_OPERATIONS_NOT_SUPPORTED : constant := 130;  --  openssl/rsa.h:518
      RSA_R_SLEN_CHECK_FAILED : constant := 136;  --  openssl/rsa.h:519
      RSA_R_SLEN_RECOVERY_FAILED : constant := 135;  --  openssl/rsa.h:520
      RSA_R_SSLV3_ROLLBACK_ATTACK : constant := 115;  --  openssl/rsa.h:521
      RSA_R_THE_ASN1_OBJECT_IDENTIFIER_IS_NOT_KNOWN_FOR_THIS_MD : constant := 116;  --  openssl/rsa.h:522
      RSA_R_UNKNOWN_ALGORITHM_TYPE : constant := 117;  --  openssl/rsa.h:523
      RSA_R_UNKNOWN_PADDING_TYPE : constant := 118;  --  openssl/rsa.h:524
      RSA_R_VALUE_MISSING  : constant := 147;  --  openssl/rsa.h:525
      RSA_R_WRONG_SIGNATURE_LENGTH : constant := 119;  --  openssl/rsa.h:526
   end defs;
   type rsa_st;
   type rsa_meth_st is record
      name         : Interfaces.C.Strings.chars_ptr;  -- openssl/rsa.h:102
      rsa_pub_enc  : access function
        (arg1 : int;
         arg2         : access unsigned_char;
         arg3         : access unsigned_char;
         arg4         : System.Address;
         arg5         : int) return int;  -- openssl/rsa.h:105
      rsa_pub_dec  : access function
        (arg1 : int;
         arg2         : access unsigned_char;
         arg3         : access unsigned_char;
         arg4         : System.Address;
         arg5         : int) return int;  -- openssl/rsa.h:108
      rsa_priv_enc : access function
        (arg1 : int;
         arg2         : access unsigned_char;
         arg3         : access unsigned_char;
         arg4         : System.Address;
         arg5         : int) return int;  -- openssl/rsa.h:111
      rsa_priv_dec : access function
        (arg1 : int;
         arg2         : access unsigned_char;
         arg3         : access unsigned_char;
         arg4         : System.Address;
         arg5         : int) return int;  -- openssl/rsa.h:114
      rsa_mod_exp  : access function
        (arg1 : access OpenSSL.Low_Level.bn_h.bignum_st;
         arg2         : access constant OpenSSL.Low_Level.bn_h.bignum_st;
         arg3         : System.Address;
         arg4         : System.Address) return int;  -- openssl/rsa.h:115
      bn_mod_exp   : access function
        (arg1 : access OpenSSL.Low_Level.bn_h.bignum_st;
         arg2         : access constant OpenSSL.Low_Level.bn_h.bignum_st;
         arg3         : access constant OpenSSL.Low_Level.bn_h.bignum_st;
         arg4         : access constant OpenSSL.Low_Level.bn_h.bignum_st;
         arg5         : System.Address;
         arg6         : access OpenSSL.Low_Level.bn_h.bn_mont_ctx_st) return int;  -- openssl/rsa.h:118
      init         : access function (arg1 : System.Address) return int;  -- openssl/rsa.h:119
      finish       : access function (arg1 : System.Address) return int;  -- openssl/rsa.h:120
      flags        : aliased int;  -- openssl/rsa.h:121
      app_data     : Interfaces.C.Strings.chars_ptr;  -- openssl/rsa.h:122
      rsa_sign     : access function
        (arg1 : int;
         arg2         : access unsigned_char;
         arg3         : unsigned;
         arg4         : access unsigned_char;
         arg5         : access unsigned;
         arg6         : access constant  rsa_st) return int;  -- openssl/rsa.h:132
      rsa_verify   : access function
        (arg1 : int;
         arg2         : access unsigned_char;
         arg3         : unsigned;
         arg4         : access unsigned_char;
         arg5         : unsigned;
         arg6         : access constant  rsa_st) return int;  -- openssl/rsa.h:136
      rsa_keygen   : access function
        (arg1 : System.Address;
         arg2         : int;
         arg3         : access OpenSSL.Low_Level.bn_h.bignum_st;
         arg4         : access OpenSSL.Low_Level.bn_h.bn_gencb_st) return int;  -- openssl/rsa.h:141
   end record;
   pragma Convention (C_Pass_By_Copy, rsa_meth_st);  -- openssl/rsa.h:100

   type rsa_st is record
      pad            : aliased int;  -- openssl/rsa.h:148
      version        : aliased long;  -- openssl/rsa.h:149
      meth           : access constant  rsa_meth_st;  -- openssl/rsa.h:150
      the_engine     : System.Address;  -- openssl/rsa.h:152
      n              : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/rsa.h:153
      e              : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/rsa.h:154
      d              : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/rsa.h:155
      p              : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/rsa.h:156
      q              : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/rsa.h:157
      dmp1           : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/rsa.h:158
      dmq1           : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/rsa.h:159
      iqmp           : access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/rsa.h:160
      ex_data        : aliased OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;  -- openssl/rsa.h:162
      references     : aliased int;  -- openssl/rsa.h:163
      flags          : aliased int;  -- openssl/rsa.h:164
      u_method_mod_n : access OpenSSL.Low_Level.bn_h.bn_mont_ctx_st;  -- openssl/rsa.h:167
      u_method_mod_p : access OpenSSL.Low_Level.bn_h.bn_mont_ctx_st;  -- openssl/rsa.h:168
      u_method_mod_q : access OpenSSL.Low_Level.bn_h.bn_mont_ctx_st;  -- openssl/rsa.h:169
      bignum_data    : Interfaces.C.Strings.chars_ptr;  -- openssl/rsa.h:173
      blinding       : System.Address;  -- openssl/rsa.h:174
      mt_blinding    : System.Address;  -- openssl/rsa.h:175
   end record;
   pragma Convention (C_Pass_By_Copy, rsa_st);  -- openssl/rsa.h:144

   function RSA_new return access  rsa_st;  -- openssl/rsa.h:275
   pragma Import (C, RSA_new, "RSA_new");

   function RSA_new_method (the_engine : System.Address) return access  rsa_st;  -- openssl/rsa.h:276
   pragma Import (C, RSA_new_method, "RSA_new_method");

   function RSA_size (arg1 : access constant  rsa_st) return int;  -- openssl/rsa.h:277
   pragma Import (C, RSA_size, "RSA_size");

   function RSA_generate_key
     (bits     : int;
      e        : unsigned_long;
      callback : access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : System.Address);
      cb_arg   : System.Address) return access  rsa_st;  -- openssl/rsa.h:281
   pragma Import (C, RSA_generate_key, "RSA_generate_key");

   function RSA_generate_key_ex
     (the_rsa : access  rsa_st;
      bits    : int;
      e       : access OpenSSL.Low_Level.bn_h.bignum_st;
      cb      : access OpenSSL.Low_Level.bn_h.bn_gencb_st) return int;  -- openssl/rsa.h:286
   pragma Import (C, RSA_generate_key_ex, "RSA_generate_key_ex");

   function RSA_X931_derive_ex
     (the_rsa : access  rsa_st;
      p1      : access OpenSSL.Low_Level.bn_h.bignum_st;
      p2      : access OpenSSL.Low_Level.bn_h.bignum_st;
      q1      : access OpenSSL.Low_Level.bn_h.bignum_st;
      q2      : access OpenSSL.Low_Level.bn_h.bignum_st;
      Xp1     : access constant OpenSSL.Low_Level.bn_h.bignum_st;
      Xp2     : access constant OpenSSL.Low_Level.bn_h.bignum_st;
      Xp      : access constant OpenSSL.Low_Level.bn_h.bignum_st;
      Xq1     : access constant OpenSSL.Low_Level.bn_h.bignum_st;
      Xq2     : access constant OpenSSL.Low_Level.bn_h.bignum_st;
      Xq      : access constant OpenSSL.Low_Level.bn_h.bignum_st;
      e       : access constant OpenSSL.Low_Level.bn_h.bignum_st;
      cb      : access OpenSSL.Low_Level.bn_h.bn_gencb_st) return int;  -- openssl/rsa.h:287
   pragma Import (C, RSA_X931_derive_ex, "RSA_X931_derive_ex");

   function RSA_X931_generate_key_ex
     (the_rsa : access  rsa_st;
      bits    : int;
      e       : access constant OpenSSL.Low_Level.bn_h.bignum_st;
      cb      : access OpenSSL.Low_Level.bn_h.bn_gencb_st) return int;  -- openssl/rsa.h:291
   pragma Import (C, RSA_X931_generate_key_ex, "RSA_X931_generate_key_ex");

   function RSA_check_key (arg1 : access constant  rsa_st) return int;  -- openssl/rsa.h:293
   pragma Import (C, RSA_check_key, "RSA_check_key");

   function RSA_public_encrypt
     (flen    : int;
      from    : access unsigned_char;
      to      : access unsigned_char;
      the_rsa : access  rsa_st;
      padding : int) return int;  -- openssl/rsa.h:295
   pragma Import (C, RSA_public_encrypt, "RSA_public_encrypt");

   function RSA_private_encrypt
     (flen    : int;
      from    : access unsigned_char;
      to      : access unsigned_char;
      the_rsa : access  rsa_st;
      padding : int) return int;  -- openssl/rsa.h:297
   pragma Import (C, RSA_private_encrypt, "RSA_private_encrypt");

   function RSA_public_decrypt
     (flen    : int;
      from    : access unsigned_char;
      to      : access unsigned_char;
      the_rsa : access  rsa_st;
      padding : int) return int;  -- openssl/rsa.h:299
   pragma Import (C, RSA_public_decrypt, "RSA_public_decrypt");

   function RSA_private_decrypt
     (flen    : int;
      from    : access unsigned_char;
      to      : access unsigned_char;
      the_rsa : access  rsa_st;
      padding : int) return int;  -- openssl/rsa.h:301
   pragma Import (C, RSA_private_decrypt, "RSA_private_decrypt");

   procedure RSA_free (r : access  rsa_st);  -- openssl/rsa.h:303
   pragma Import (C, RSA_free, "RSA_free");

   function RSA_up_ref (r : access  rsa_st) return int;  -- openssl/rsa.h:305
   pragma Import (C, RSA_up_ref, "RSA_up_ref");

   function RSA_flags (r : access constant  rsa_st) return int;  -- openssl/rsa.h:307
   pragma Import (C, RSA_flags, "RSA_flags");

   procedure RSA_set_default_method (meth : access constant  rsa_meth_st);  -- openssl/rsa.h:309
   pragma Import (C, RSA_set_default_method, "RSA_set_default_method");

   function RSA_get_default_method return access constant  rsa_meth_st;  -- openssl/rsa.h:310
   pragma Import (C, RSA_get_default_method, "RSA_get_default_method");

   function RSA_get_method (the_rsa : access constant  rsa_st) return access constant  rsa_meth_st;  -- openssl/rsa.h:311
   pragma Import (C, RSA_get_method, "RSA_get_method");

   function RSA_set_method (the_rsa : access  rsa_st; meth : access constant  rsa_meth_st) return int;  -- openssl/rsa.h:312
   pragma Import (C, RSA_set_method, "RSA_set_method");

   function RSA_memory_lock (r : access  rsa_st) return int;  -- openssl/rsa.h:315
   pragma Import (C, RSA_memory_lock, "RSA_memory_lock");

   function RSA_PKCS1_SSLeay return access constant  rsa_meth_st;  -- openssl/rsa.h:318
   pragma Import (C, RSA_PKCS1_SSLeay, "RSA_PKCS1_SSLeay");

   function RSA_null_method return access constant  rsa_meth_st;  -- openssl/rsa.h:320
   pragma Import (C, RSA_null_method, "RSA_null_method");

   RSAPublicKey_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/rsa.h:322
   pragma Import (C, RSAPublicKey_it, "RSAPublicKey_it");

   function i2d_RSAPublicKey (a : access constant  rsa_st; c_out : System.Address) return int;  -- openssl/rsa.h:322
   pragma Import (C, i2d_RSAPublicKey, "i2d_RSAPublicKey");

   function d2i_RSAPublicKey
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access  rsa_st;  -- openssl/rsa.h:322
   pragma Import (C, d2i_RSAPublicKey, "d2i_RSAPublicKey");

   RSAPrivateKey_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/rsa.h:323
   pragma Import (C, RSAPrivateKey_it, "RSAPrivateKey_it");

   function i2d_RSAPrivateKey (a : access constant  rsa_st; c_out : System.Address) return int;  -- openssl/rsa.h:323
   pragma Import (C, i2d_RSAPrivateKey, "i2d_RSAPrivateKey");

   function d2i_RSAPrivateKey
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access  rsa_st;  -- openssl/rsa.h:323
   pragma Import (C, d2i_RSAPrivateKey, "d2i_RSAPrivateKey");

   function RSA_print_fp
     (fp     : access Interfaces.C_Streams.FILEs;
      r      : access constant  rsa_st;
      offset : int) return int;  -- openssl/rsa.h:326
   pragma Import (C, RSA_print_fp, "RSA_print_fp");

   function RSA_print
     (bp     : access OpenSSL.Low_Level.bio_h.bio_st;
      r      : access constant  rsa_st;
      offset : int) return int;  -- openssl/rsa.h:330
   pragma Import (C, RSA_print, "RSA_print");

   function i2d_RSA_NET
     (a      : access constant  rsa_st;
      pp     : System.Address;
      cb     : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int) return int;
      sgckey : int) return int;  -- openssl/rsa.h:334
   pragma Import (C, i2d_RSA_NET, "i2d_RSA_NET");

   function d2i_RSA_NET
     (a      : System.Address;
      pp     : System.Address;
      length : long;
      cb     : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int) return int;
      sgckey : int) return access  rsa_st;  -- openssl/rsa.h:337
   pragma Import (C, d2i_RSA_NET, "d2i_RSA_NET");

   function i2d_Netscape_RSA
     (a  : access constant  rsa_st;
      pp : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int) return int) return int;  -- openssl/rsa.h:341
   pragma Import (C, i2d_Netscape_RSA, "i2d_Netscape_RSA");

   function d2i_Netscape_RSA
     (a      : System.Address;
      pp     : System.Address;
      length : long;
      cb     : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int) return int) return access  rsa_st;  -- openssl/rsa.h:344
   pragma Import (C, d2i_Netscape_RSA, "d2i_Netscape_RSA");

   function RSA_sign
     (c_type   : int;
      m        : access unsigned_char;
      m_length : unsigned;
      sigret   : access unsigned_char;
      siglen   : access unsigned;
      the_rsa  : access  rsa_st) return int;  -- openssl/rsa.h:351
   pragma Import (C, RSA_sign, "RSA_sign");

   function RSA_verify
     (c_type   : int;
      m        : access unsigned_char;
      m_length : unsigned;
      sigbuf   : access unsigned_char;
      siglen   : unsigned;
      the_rsa  : access  rsa_st) return int;  -- openssl/rsa.h:353
   pragma Import (C, RSA_verify, "RSA_verify");

   function RSA_sign_ASN1_OCTET_STRING
     (c_type   : int;
      m        : access unsigned_char;
      m_length : unsigned;
      sigret   : access unsigned_char;
      siglen   : access unsigned;
      the_rsa  : access  rsa_st) return int;  -- openssl/rsa.h:358
   pragma Import (C, RSA_sign_ASN1_OCTET_STRING, "RSA_sign_ASN1_OCTET_STRING");

   function RSA_verify_ASN1_OCTET_STRING
     (c_type   : int;
      m        : access unsigned_char;
      m_length : unsigned;
      sigbuf   : access unsigned_char;
      siglen   : unsigned;
      the_rsa  : access  rsa_st) return int;  -- openssl/rsa.h:361
   pragma Import (C, RSA_verify_ASN1_OCTET_STRING, "RSA_verify_ASN1_OCTET_STRING");

   function RSA_blinding_on (the_rsa : access  rsa_st; ctx : System.Address) return int;  -- openssl/rsa.h:365
   pragma Import (C, RSA_blinding_on, "RSA_blinding_on");

   procedure RSA_blinding_off (the_rsa : access  rsa_st);  -- openssl/rsa.h:366
   pragma Import (C, RSA_blinding_off, "RSA_blinding_off");

   function RSA_setup_blinding (the_rsa : access  rsa_st; ctx : System.Address) return System.Address;  -- openssl/rsa.h:367
   pragma Import (C, RSA_setup_blinding, "RSA_setup_blinding");

   function RSA_padding_add_PKCS1_type_1
     (to   : access unsigned_char;
      tlen : int;
      f    : access unsigned_char;
      fl   : int) return int;  -- openssl/rsa.h:369
   pragma Import (C, RSA_padding_add_PKCS1_type_1, "RSA_padding_add_PKCS1_type_1");

   function RSA_padding_check_PKCS1_type_1
     (to      : access unsigned_char;
      tlen    : int;
      f       : access unsigned_char;
      fl      : int;
      rsa_len : int) return int;  -- openssl/rsa.h:371
   pragma Import (C, RSA_padding_check_PKCS1_type_1, "RSA_padding_check_PKCS1_type_1");

   function RSA_padding_add_PKCS1_type_2
     (to   : access unsigned_char;
      tlen : int;
      f    : access unsigned_char;
      fl   : int) return int;  -- openssl/rsa.h:373
   pragma Import (C, RSA_padding_add_PKCS1_type_2, "RSA_padding_add_PKCS1_type_2");

   function RSA_padding_check_PKCS1_type_2
     (to      : access unsigned_char;
      tlen    : int;
      f       : access unsigned_char;
      fl      : int;
      rsa_len : int) return int;  -- openssl/rsa.h:375
   pragma Import (C, RSA_padding_check_PKCS1_type_2, "RSA_padding_check_PKCS1_type_2");

   function PKCS1_MGF1
     (mask    : access unsigned_char;
      len     : long;
      seed    : access unsigned_char;
      seedlen : long;
      dgst    : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/rsa.h:377
   pragma Import (C, PKCS1_MGF1, "PKCS1_MGF1");

   function RSA_padding_add_PKCS1_OAEP
     (to   : access unsigned_char;
      tlen : int;
      f    : access unsigned_char;
      fl   : int;
      p    : access unsigned_char;
      pl   : int) return int;  -- openssl/rsa.h:379
   pragma Import (C, RSA_padding_add_PKCS1_OAEP, "RSA_padding_add_PKCS1_OAEP");

   function RSA_padding_check_PKCS1_OAEP
     (to      : access unsigned_char;
      tlen    : int;
      f       : access unsigned_char;
      fl      : int;
      rsa_len : int;
      p       : access unsigned_char;
      pl      : int) return int;  -- openssl/rsa.h:382
   pragma Import (C, RSA_padding_check_PKCS1_OAEP, "RSA_padding_check_PKCS1_OAEP");

   function RSA_padding_add_SSLv23
     (to   : access unsigned_char;
      tlen : int;
      f    : access unsigned_char;
      fl   : int) return int;  -- openssl/rsa.h:385
   pragma Import (C, RSA_padding_add_SSLv23, "RSA_padding_add_SSLv23");

   function RSA_padding_check_SSLv23
     (to      : access unsigned_char;
      tlen    : int;
      f       : access unsigned_char;
      fl      : int;
      rsa_len : int) return int;  -- openssl/rsa.h:387
   pragma Import (C, RSA_padding_check_SSLv23, "RSA_padding_check_SSLv23");

   function RSA_padding_add_none
     (to   : access unsigned_char;
      tlen : int;
      f    : access unsigned_char;
      fl   : int) return int;  -- openssl/rsa.h:389
   pragma Import (C, RSA_padding_add_none, "RSA_padding_add_none");

   function RSA_padding_check_none
     (to      : access unsigned_char;
      tlen    : int;
      f       : access unsigned_char;
      fl      : int;
      rsa_len : int) return int;  -- openssl/rsa.h:391
   pragma Import (C, RSA_padding_check_none, "RSA_padding_check_none");

   function RSA_padding_add_X931
     (to   : access unsigned_char;
      tlen : int;
      f    : access unsigned_char;
      fl   : int) return int;  -- openssl/rsa.h:393
   pragma Import (C, RSA_padding_add_X931, "RSA_padding_add_X931");

   function RSA_padding_check_X931
     (to      : access unsigned_char;
      tlen    : int;
      f       : access unsigned_char;
      fl      : int;
      rsa_len : int) return int;  -- openssl/rsa.h:395
   pragma Import (C, RSA_padding_check_X931, "RSA_padding_check_X931");

   function RSA_X931_hash_id (nid : int) return int;  -- openssl/rsa.h:397
   pragma Import (C, RSA_X931_hash_id, "RSA_X931_hash_id");

   function RSA_verify_PKCS1_PSS
     (the_rsa : access  rsa_st;
      mHash   : access unsigned_char;
      Hash    : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      EM      : access unsigned_char;
      sLen    : int) return int;  -- openssl/rsa.h:399
   pragma Import (C, RSA_verify_PKCS1_PSS, "RSA_verify_PKCS1_PSS");

   function RSA_padding_add_PKCS1_PSS
     (the_rsa : access  rsa_st;
      EM      : access unsigned_char;
      mHash   : access unsigned_char;
      Hash    : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      sLen    : int) return int;  -- openssl/rsa.h:401
   pragma Import (C, RSA_padding_add_PKCS1_PSS, "RSA_padding_add_PKCS1_PSS");

   function RSA_get_ex_new_index
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
         arg6 : System.Address)) return int;  -- openssl/rsa.h:405
   pragma Import (C, RSA_get_ex_new_index, "RSA_get_ex_new_index");

   function RSA_set_ex_data
     (r   : access  rsa_st;
      idx : int;
      arg : System.Address) return int;  -- openssl/rsa.h:407
   pragma Import (C, RSA_set_ex_data, "RSA_set_ex_data");

   function RSA_get_ex_data (r : access constant  rsa_st; idx : int) return System.Address;  -- openssl/rsa.h:408
   pragma Import (C, RSA_get_ex_data, "RSA_get_ex_data");

   function RSAPublicKey_dup (the_rsa : access  rsa_st) return access  rsa_st;  -- openssl/rsa.h:410
   pragma Import (C, RSAPublicKey_dup, "RSAPublicKey_dup");

   function RSAPrivateKey_dup (the_rsa : access  rsa_st) return access  rsa_st;  -- openssl/rsa.h:411
   pragma Import (C, RSAPrivateKey_dup, "RSAPrivateKey_dup");

   procedure ERR_load_RSA_strings;  -- openssl/rsa.h:417
   pragma Import (C, ERR_load_RSA_strings, "ERR_load_RSA_strings");

end OpenSSL.Low_Level.rsa_h;
