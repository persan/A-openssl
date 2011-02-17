with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
--  with stddef_h;

package OpenSSL.Low_Level.aes_h is

   package defs is
   AES_ENCRYPT : constant := 1;  --  openssl/aes.h:63
   AES_DECRYPT : constant := 0;  --  openssl/aes.h:64

   AES_MAXNR : constant := 14;  --  openssl/aes.h:68
   AES_BLOCK_SIZE : constant := 16;  --  openssl/aes.h:69
   end defs;

   type aes_key_st_rd_key_array is array (0 .. 59) of aliased unsigned;
   type aes_key_st is record
      rd_key : aliased aes_key_st_rd_key_array;  -- openssl/aes.h:80
      rounds : aliased int;  -- openssl/aes.h:82
   end record;
   pragma Convention (C_Pass_By_Copy, aes_key_st);  -- openssl/aes.h:76

   subtype AES_KEY is aes_key_st;

   function AES_options return Interfaces.C.Strings.chars_ptr;  -- openssl/aes.h:86
   pragma Import (C, AES_options, "AES_options");

   function AES_set_encrypt_key
     (userKey : access unsigned_char;
      bits : int;
      key : access AES_KEY) return int;  -- openssl/aes.h:88
   pragma Import (C, AES_set_encrypt_key, "AES_set_encrypt_key");

   function AES_set_decrypt_key
     (userKey : access unsigned_char;
      bits : int;
      key : access AES_KEY) return int;  -- openssl/aes.h:90
   pragma Import (C, AES_set_decrypt_key, "AES_set_decrypt_key");

   procedure AES_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      key : System.Address);  -- openssl/aes.h:93
   pragma Import (C, AES_encrypt, "AES_encrypt");

   procedure AES_decrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      key : System.Address);  -- openssl/aes.h:95
   pragma Import (C, AES_decrypt, "AES_decrypt");

   procedure AES_ecb_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      key : System.Address;
      enc : int);  -- openssl/aes.h:98
   pragma Import (C, AES_ecb_encrypt, "AES_ecb_encrypt");

   procedure AES_cbc_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      enc : int);  -- openssl/aes.h:100
   pragma Import (C, AES_cbc_encrypt, "AES_cbc_encrypt");

   procedure AES_cfb128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      num : access int;
      enc : int);  -- openssl/aes.h:103
   pragma Import (C, AES_cfb128_encrypt, "AES_cfb128_encrypt");

   procedure AES_cfb1_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      num : access int;
      enc : int);  -- openssl/aes.h:106
   pragma Import (C, AES_cfb1_encrypt, "AES_cfb1_encrypt");

   procedure AES_cfb8_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      num : access int;
      enc : int);  -- openssl/aes.h:109
   pragma Import (C, AES_cfb8_encrypt, "AES_cfb8_encrypt");

   procedure AES_ofb128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      num : access int);  -- openssl/aes.h:112
   pragma Import (C, AES_ofb128_encrypt, "AES_ofb128_encrypt");

   procedure AES_ctr128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      ecount_buf : access unsigned_char;
      num : access unsigned);  -- openssl/aes.h:115
   pragma Import (C, AES_ctr128_encrypt, "AES_ctr128_encrypt");

   procedure AES_ige_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      enc : int);  -- openssl/aes.h:121
   pragma Import (C, AES_ige_encrypt, "AES_ige_encrypt");

   procedure AES_bi_ige_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      key2 : System.Address;
      ivec : access unsigned_char;
      enc : int);  -- openssl/aes.h:125
   pragma Import (C, AES_bi_ige_encrypt, "AES_bi_ige_encrypt");

   function AES_wrap_key
     (key : access AES_KEY;
      iv : access unsigned_char;
      c_out : access unsigned_char;
      c_in : access unsigned_char;
      inlen : unsigned) return int;  -- openssl/aes.h:130
   pragma Import (C, AES_wrap_key, "AES_wrap_key");

   function AES_unwrap_key
     (key : access AES_KEY;
      iv : access unsigned_char;
      c_out : access unsigned_char;
      c_in : access unsigned_char;
      inlen : unsigned) return int;  -- openssl/aes.h:133
   pragma Import (C, AES_unwrap_key, "AES_unwrap_key");

end OpenSSL.Low_Level.aes_h;
