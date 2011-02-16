with Interfaces.C; use Interfaces.C;
with System;
--  with stddef_h;

package OpenSSL.Low_Level.seed_h is


   SEED_BLOCK_SIZE : constant := 16;  --  openssl/seed.h:102
   SEED_KEY_LENGTH : constant := 16;  --  openssl/seed.h:103

   type seed_key_st_data_array is array (0 .. 31) of aliased unsigned;
   type seed_key_st is record
      data : aliased seed_key_st_data_array;  -- openssl/seed.h:115
   end record;
   pragma Convention (C_Pass_By_Copy, seed_key_st);  -- openssl/seed.h:111

   subtype SEED_KEY_SCHEDULE is seed_key_st;

   procedure private_SEED_set_key (rawkey : access unsigned_char; ks : access SEED_KEY_SCHEDULE);  -- openssl/seed.h:121
   pragma Import (C, private_SEED_set_key, "private_SEED_set_key");

   procedure SEED_set_key (rawkey : access unsigned_char; ks : access SEED_KEY_SCHEDULE);  -- openssl/seed.h:123
   pragma Import (C, SEED_set_key, "SEED_set_key");

   procedure SEED_encrypt
     (s : access unsigned_char;
      d : access unsigned_char;
      ks : System.Address);  -- openssl/seed.h:125
   pragma Import (C, SEED_encrypt, "SEED_encrypt");

   procedure SEED_decrypt
     (s : access unsigned_char;
      d : access unsigned_char;
      ks : System.Address);  -- openssl/seed.h:126
   pragma Import (C, SEED_decrypt, "SEED_decrypt");

   procedure SEED_ecb_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      ks : System.Address;
      enc : int);  -- openssl/seed.h:128
   pragma Import (C, SEED_ecb_encrypt, "SEED_ecb_encrypt");

   procedure SEED_cbc_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      len : size_t;
      ks : System.Address;
      ivec : access unsigned_char;
      enc : int);  -- openssl/seed.h:129
   pragma Import (C, SEED_cbc_encrypt, "SEED_cbc_encrypt");

   procedure SEED_cfb128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      len : size_t;
      ks : System.Address;
      ivec : access unsigned_char;
      num : access int;
      enc : int);  -- openssl/seed.h:131
   pragma Import (C, SEED_cfb128_encrypt, "SEED_cfb128_encrypt");

   procedure SEED_ofb128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      len : size_t;
      ks : System.Address;
      ivec : access unsigned_char;
      num : access int);  -- openssl/seed.h:133
   pragma Import (C, SEED_ofb128_encrypt, "SEED_ofb128_encrypt");

end OpenSSL.Low_Level.seed_h;
