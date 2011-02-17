with Interfaces.C; use Interfaces.C;
with System;
limited with OpenSSL.Low_Level.evp_h;
with Interfaces.C.Strings;

package OpenSSL.Low_Level.fips_h is

   package defs is

      FIPS_F_DH_BUILTIN_GENPARAMS : constant := 100;  --  openssl/fips.h:113
      FIPS_F_DSA_BUILTIN_PARAMGEN : constant := 101;  --  openssl/fips.h:114
      FIPS_F_DSA_DO_SIGN          : constant := 102;  --  openssl/fips.h:115
      FIPS_F_DSA_DO_VERIFY        : constant := 103;  --  openssl/fips.h:116
      FIPS_F_EVP_CIPHERINIT_EX    : constant := 124;  --  openssl/fips.h:117
      FIPS_F_EVP_DIGESTINIT_EX    : constant := 125;  --  openssl/fips.h:118
      FIPS_F_FIPS_CHECK_DSA       : constant := 104;  --  openssl/fips.h:119
      FIPS_F_FIPS_CHECK_INCORE_FINGERPRINT : constant := 105;  --  openssl/fips.h:120
      FIPS_F_FIPS_CHECK_RSA                : constant := 106;  --  openssl/fips.h:121
      FIPS_F_FIPS_DSA_CHECK                : constant := 107;  --  openssl/fips.h:122
      FIPS_F_FIPS_MODE_SET                 : constant := 108;  --  openssl/fips.h:123
      FIPS_F_FIPS_PKEY_SIGNATURE_TEST      : constant := 109;  --  openssl/fips.h:124
      FIPS_F_FIPS_SELFTEST_AES             : constant := 110;  --  openssl/fips.h:125
      FIPS_F_FIPS_SELFTEST_DES             : constant := 111;  --  openssl/fips.h:126
      FIPS_F_FIPS_SELFTEST_DSA             : constant := 112;  --  openssl/fips.h:127
      FIPS_F_FIPS_SELFTEST_HMAC            : constant := 113;  --  openssl/fips.h:128
      FIPS_F_FIPS_SELFTEST_RNG             : constant := 114;  --  openssl/fips.h:129
      FIPS_F_FIPS_SELFTEST_SHA1            : constant := 115;  --  openssl/fips.h:130
      FIPS_F_HASH_FINAL                    : constant := 123;  --  openssl/fips.h:131
      FIPS_F_RSA_BUILTIN_KEYGEN            : constant := 116;  --  openssl/fips.h:132
      FIPS_F_RSA_EAY_PRIVATE_DECRYPT       : constant := 117;  --  openssl/fips.h:133
      FIPS_F_RSA_EAY_PRIVATE_ENCRYPT       : constant := 118;  --  openssl/fips.h:134
      FIPS_F_RSA_EAY_PUBLIC_DECRYPT        : constant := 119;  --  openssl/fips.h:135
      FIPS_F_RSA_EAY_PUBLIC_ENCRYPT        : constant := 120;  --  openssl/fips.h:136
      FIPS_F_RSA_X931_GENERATE_KEY_EX      : constant := 121;  --  openssl/fips.h:137
      FIPS_F_SSLEAY_RAND_BYTES             : constant := 122;  --  openssl/fips.h:138

      FIPS_R_CANNOT_READ_EXE               : constant := 103;  --  openssl/fips.h:141
      FIPS_R_CANNOT_READ_EXE_DIGEST        : constant := 104;  --  openssl/fips.h:142
      FIPS_R_CONTRADICTING_EVIDENCE        : constant := 114;  --  openssl/fips.h:143
      FIPS_R_EXE_DIGEST_DOES_NOT_MATCH     : constant := 105;  --  openssl/fips.h:144
      FIPS_R_FINGERPRINT_DOES_NOT_MATCH    : constant := 110;  --  openssl/fips.h:145
      FIPS_R_FINGERPRINT_DOES_NOT_MATCH_NONPIC_RELOCATED : constant := 111;  --  openssl/fips.h:146
      FIPS_R_FINGERPRINT_DOES_NOT_MATCH_SEGMENT_ALIASING : constant := 112;  --  openssl/fips.h:147
      FIPS_R_FIPS_MODE_ALREADY_SET         : constant := 102;  --  openssl/fips.h:148
      FIPS_R_FIPS_SELFTEST_FAILED          : constant := 106;  --  openssl/fips.h:149
      FIPS_R_INVALID_KEY_LENGTH            : constant := 109;  --  openssl/fips.h:150
      FIPS_R_KEY_TOO_SHORT                 : constant := 108;  --  openssl/fips.h:151
      FIPS_R_NON_FIPS_METHOD               : constant := 100;  --  openssl/fips.h:152
      FIPS_R_PAIRWISE_TEST_FAILED          : constant := 107;  --  openssl/fips.h:153
      FIPS_R_RSA_DECRYPT_ERROR             : constant := 115;  --  openssl/fips.h:154
      FIPS_R_RSA_ENCRYPT_ERROR             : constant := 116;  --  openssl/fips.h:155
      FIPS_R_SELFTEST_FAILED               : constant := 101;  --  openssl/fips.h:156
      FIPS_R_TEST_FAILURE                  : constant := 117;  --  openssl/fips.h:157
      FIPS_R_UNSUPPORTED_PLATFORM          : constant := 113;  --  openssl/fips.h:158
   end defs;
   function FIPS_mode_set (onoff : int) return int;  -- openssl/fips.h:68
   pragma Import (C, FIPS_mode_set, "FIPS_mode_set");

   function FIPS_mode return int;  -- openssl/fips.h:69
   pragma Import (C, FIPS_mode, "FIPS_mode");

   function FIPS_rand_check return System.Address;  -- openssl/fips.h:70
   pragma Import (C, FIPS_rand_check, "FIPS_rand_check");

   function FIPS_selftest_failed return int;  -- openssl/fips.h:71
   pragma Import (C, FIPS_selftest_failed, "FIPS_selftest_failed");

   procedure FIPS_selftest_check;  -- openssl/fips.h:72
   pragma Import (C, FIPS_selftest_check, "FIPS_selftest_check");

   procedure FIPS_corrupt_sha1;  -- openssl/fips.h:73
   pragma Import (C, FIPS_corrupt_sha1, "FIPS_corrupt_sha1");

   function FIPS_selftest_sha1 return int;  -- openssl/fips.h:74
   pragma Import (C, FIPS_selftest_sha1, "FIPS_selftest_sha1");

   procedure FIPS_corrupt_aes;  -- openssl/fips.h:75
   pragma Import (C, FIPS_corrupt_aes, "FIPS_corrupt_aes");

   function FIPS_selftest_aes return int;  -- openssl/fips.h:76
   pragma Import (C, FIPS_selftest_aes, "FIPS_selftest_aes");

   procedure FIPS_corrupt_des;  -- openssl/fips.h:77
   pragma Import (C, FIPS_corrupt_des, "FIPS_corrupt_des");

   function FIPS_selftest_des return int;  -- openssl/fips.h:78
   pragma Import (C, FIPS_selftest_des, "FIPS_selftest_des");

   procedure FIPS_corrupt_rsa;  -- openssl/fips.h:79
   pragma Import (C, FIPS_corrupt_rsa, "FIPS_corrupt_rsa");

   procedure FIPS_corrupt_rsa_keygen;  -- openssl/fips.h:80
   pragma Import (C, FIPS_corrupt_rsa_keygen, "FIPS_corrupt_rsa_keygen");

   function FIPS_selftest_rsa return int;  -- openssl/fips.h:81
   pragma Import (C, FIPS_selftest_rsa, "FIPS_selftest_rsa");

   procedure FIPS_corrupt_dsa;  -- openssl/fips.h:82
   pragma Import (C, FIPS_corrupt_dsa, "FIPS_corrupt_dsa");

   procedure FIPS_corrupt_dsa_keygen;  -- openssl/fips.h:83
   pragma Import (C, FIPS_corrupt_dsa_keygen, "FIPS_corrupt_dsa_keygen");

   function FIPS_selftest_dsa return int;  -- openssl/fips.h:84
   pragma Import (C, FIPS_selftest_dsa, "FIPS_selftest_dsa");

   procedure FIPS_corrupt_rng;  -- openssl/fips.h:85
   pragma Import (C, FIPS_corrupt_rng, "FIPS_corrupt_rng");

   procedure FIPS_rng_stick;  -- openssl/fips.h:86
   pragma Import (C, FIPS_rng_stick, "FIPS_rng_stick");

   function FIPS_selftest_rng return int;  -- openssl/fips.h:87
   pragma Import (C, FIPS_selftest_rng, "FIPS_selftest_rng");

   function FIPS_selftest_hmac return int;  -- openssl/fips.h:88
   pragma Import (C, FIPS_selftest_hmac, "FIPS_selftest_hmac");

   function fips_pkey_signature_test
     (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      tbs : access unsigned_char;
      tbslen : int;
      kat : access unsigned_char;
      katlen : unsigned;
      digest : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      md_flags : unsigned;
      fail_str : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/fips.h:90
   pragma Import (C, fips_pkey_signature_test, "fips_pkey_signature_test");

   function fips_cipher_test
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      key : access unsigned_char;
      iv : access unsigned_char;
      plaintext : access unsigned_char;
      ciphertext : access unsigned_char;
      len : int) return int;  -- openssl/fips.h:96
   pragma Import (C, fips_cipher_test, "fips_cipher_test");

   procedure ERR_load_FIPS_strings;  -- openssl/fips.h:108
   pragma Import (C, ERR_load_FIPS_strings, "ERR_load_FIPS_strings");

end OpenSSL.Low_Level.fips_h;
