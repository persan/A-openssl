with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package OpenSSL.Low_Level.blowfish_h is

   package defs is

      BF_ENCRYPT : constant := 1;  --  openssl/blowfish.h:72
      BF_DECRYPT : constant := 0;  --  openssl/blowfish.h:73
   --  unsupported macro: BF_LONG unsigned int

      BF_ROUNDS  : constant := 16;  --  openssl/blowfish.h:98
      BF_BLOCK   : constant := 8;  --  openssl/blowfish.h:99
   end defs;
   type bf_key_st_P_array is array (0 .. 17) of aliased unsigned;
   type bf_key_st_S_array is array (0 .. 1023) of aliased unsigned;
   type bf_key_st is record
      P : aliased bf_key_st_P_array;  -- openssl/blowfish.h:103
      S : aliased bf_key_st_S_array;  -- openssl/blowfish.h:104
   end record;
   pragma Convention (C_Pass_By_Copy, bf_key_st);  -- openssl/blowfish.h:101

   subtype BF_KEY is bf_key_st;

   procedure private_BF_set_key
     (key : access BF_KEY;
      len : int;
      data : access unsigned_char);  -- openssl/blowfish.h:108
   pragma Import (C, private_BF_set_key, "private_BF_set_key");

   procedure BF_set_key
     (key : access BF_KEY;
      len : int;
      data : access unsigned_char);  -- openssl/blowfish.h:110
   pragma Import (C, BF_set_key, "BF_set_key");

   procedure BF_encrypt (data : access unsigned; key : System.Address);  -- openssl/blowfish.h:112
   pragma Import (C, BF_encrypt, "BF_encrypt");

   procedure BF_decrypt (data : access unsigned; key : System.Address);  -- openssl/blowfish.h:113
   pragma Import (C, BF_decrypt, "BF_decrypt");

   procedure BF_ecb_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      key : System.Address;
      enc : int);  -- openssl/blowfish.h:115
   pragma Import (C, BF_ecb_encrypt, "BF_ecb_encrypt");

   procedure BF_cbc_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : long;
      schedule : System.Address;
      ivec : access unsigned_char;
      enc : int);  -- openssl/blowfish.h:117
   pragma Import (C, BF_cbc_encrypt, "BF_cbc_encrypt");

   procedure BF_cfb64_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : long;
      schedule : System.Address;
      ivec : access unsigned_char;
      num : access int;
      enc : int);  -- openssl/blowfish.h:119
   pragma Import (C, BF_cfb64_encrypt, "BF_cfb64_encrypt");

   procedure BF_ofb64_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : long;
      schedule : System.Address;
      ivec : access unsigned_char;
      num : access int);  -- openssl/blowfish.h:121
   pragma Import (C, BF_ofb64_encrypt, "BF_ofb64_encrypt");

   function BF_options return Interfaces.C.Strings.chars_ptr;  -- openssl/blowfish.h:123
   pragma Import (C, BF_options, "BF_options");

end OpenSSL.Low_Level.blowfish_h;
