with Interfaces.C; use Interfaces.C;
with System;
--  limited --  with OpenSSL.Low_Level.ossl_typ_h;
with Interfaces.C.Strings;
--  with stddef_h;

package OpenSSL.Low_Level.rand_h is

   --  unsupported macro: FIPS_RAND_SIZE_T size_t

   RAND_F_ENG_RAND_GET_RAND_METHOD : constant := 108;  --  openssl/rand.h:131
   RAND_F_FIPS_RAND : constant := 103;  --  openssl/rand.h:132
   RAND_F_FIPS_RAND_BYTES : constant := 102;  --  openssl/rand.h:133
   RAND_F_FIPS_RAND_SET_DT : constant := 106;  --  openssl/rand.h:134
   RAND_F_FIPS_SET_DT : constant := 104;  --  openssl/rand.h:135
   RAND_F_FIPS_SET_PRNG_SEED : constant := 107;  --  openssl/rand.h:136
   RAND_F_FIPS_SET_TEST_MODE : constant := 105;  --  openssl/rand.h:137
   RAND_F_RAND_GET_RAND_METHOD : constant := 101;  --  openssl/rand.h:138
   RAND_F_SSLEAY_RAND_BYTES : constant := 100;  --  openssl/rand.h:139

   RAND_R_NON_FIPS_METHOD : constant := 105;  --  openssl/rand.h:142
   RAND_R_NOT_IN_TEST_MODE : constant := 106;  --  openssl/rand.h:143
   RAND_R_NO_KEY_SET : constant := 107;  --  openssl/rand.h:144
   RAND_R_PRNG_ASKING_FOR_TOO_MUCH : constant := 101;  --  openssl/rand.h:145
   RAND_R_PRNG_ERROR : constant := 108;  --  openssl/rand.h:146
   RAND_R_PRNG_KEYED : constant := 109;  --  openssl/rand.h:147
   RAND_R_PRNG_NOT_REKEYED : constant := 102;  --  openssl/rand.h:148
   RAND_R_PRNG_NOT_RESEEDED : constant := 103;  --  openssl/rand.h:149
   RAND_R_PRNG_NOT_SEEDED : constant := 100;  --  openssl/rand.h:150
   RAND_R_PRNG_SEED_MUST_NOT_MATCH_KEY : constant := 110;  --  openssl/rand.h:151
   RAND_R_PRNG_STUCK : constant := 104;  --  openssl/rand.h:152

   type rand_meth_st is record
      seed : access procedure (arg1 : System.Address; arg2 : int);  -- openssl/rand.h:83
      bytes : access function (arg1 : access unsigned_char; arg2 : int) return int;  -- openssl/rand.h:84
      cleanup : access procedure;  -- openssl/rand.h:85
      add : access procedure
           (arg1 : System.Address;
            arg2 : int;
            arg3 : double);  -- openssl/rand.h:86
      pseudorand : access function (arg1 : access unsigned_char; arg2 : int) return int;  -- openssl/rand.h:87
      status : access function return int;  -- openssl/rand.h:88
   end record;
   pragma Convention (C_Pass_By_Copy, rand_meth_st);  -- openssl/rand.h:81

   function RAND_set_rand_method (meth : access constant OpenSSL.Low_Level.rand_h.rand_meth_st) return int;  -- openssl/rand.h:95
   pragma Import (C, RAND_set_rand_method, "RAND_set_rand_method");

   function RAND_get_rand_method return access constant OpenSSL.Low_Level.rand_h.rand_meth_st;  -- openssl/rand.h:96
   pragma Import (C, RAND_get_rand_method, "RAND_get_rand_method");

   function RAND_set_rand_engine (the_engine : System.Address) return int;  -- openssl/rand.h:98
   pragma Import (C, RAND_set_rand_engine, "RAND_set_rand_engine");

   function RAND_SSLeay return access OpenSSL.Low_Level.rand_h.rand_meth_st;  -- openssl/rand.h:100
   pragma Import (C, RAND_SSLeay, "RAND_SSLeay");

   procedure RAND_cleanup;  -- openssl/rand.h:101
   pragma Import (C, RAND_cleanup, "RAND_cleanup");

   function RAND_bytes (buf : access unsigned_char; num : int) return int;  -- openssl/rand.h:102
   pragma Import (C, RAND_bytes, "RAND_bytes");

   function RAND_pseudo_bytes (buf : access unsigned_char; num : int) return int;  -- openssl/rand.h:103
   pragma Import (C, RAND_pseudo_bytes, "RAND_pseudo_bytes");

   procedure RAND_seed (buf : System.Address; num : int);  -- openssl/rand.h:104
   pragma Import (C, RAND_seed, "RAND_seed");

   procedure RAND_add
     (buf : System.Address;
      num : int;
      entropy : double);  -- openssl/rand.h:105
   pragma Import (C, RAND_add, "RAND_add");

   function RAND_load_file (file : Interfaces.C.Strings.chars_ptr; max_bytes : long) return int;  -- openssl/rand.h:106
   pragma Import (C, RAND_load_file, "RAND_load_file");

   function RAND_write_file (file : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/rand.h:107
   pragma Import (C, RAND_write_file, "RAND_write_file");

   function RAND_file_name (file : Interfaces.C.Strings.chars_ptr; num : size_t) return Interfaces.C.Strings.chars_ptr;  -- openssl/rand.h:108
   pragma Import (C, RAND_file_name, "RAND_file_name");

   function RAND_status return int;  -- openssl/rand.h:109
   pragma Import (C, RAND_status, "RAND_status");

   function RAND_query_egd_bytes
     (path : Interfaces.C.Strings.chars_ptr;
      buf : access unsigned_char;
      bytes : int) return int;  -- openssl/rand.h:110
   pragma Import (C, RAND_query_egd_bytes, "RAND_query_egd_bytes");

   function RAND_egd (path : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/rand.h:111
   pragma Import (C, RAND_egd, "RAND_egd");

   function RAND_egd_bytes (path : Interfaces.C.Strings.chars_ptr; bytes : int) return int;  -- openssl/rand.h:112
   pragma Import (C, RAND_egd_bytes, "RAND_egd_bytes");

   function RAND_poll return int;  -- openssl/rand.h:113
   pragma Import (C, RAND_poll, "RAND_poll");

   procedure ERR_load_RAND_strings;  -- openssl/rand.h:126
   pragma Import (C, ERR_load_RAND_strings, "ERR_load_RAND_strings");

end OpenSSL.Low_Level.rand_h;
