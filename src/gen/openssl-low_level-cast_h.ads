with Interfaces.C; use Interfaces.C;
with System;

package OpenSSL.Low_Level.cast_h is

   package defs is

      CAST_ENCRYPT : constant := 1;  --  openssl/cast.h:72
      CAST_DECRYPT : constant := 0;  --  openssl/cast.h:73
   --  unsupported macro: CAST_LONG unsigned int

      CAST_BLOCK   : constant := 8;  --  openssl/cast.h:77
      CAST_KEY_LENGTH : constant := 16;  --  openssl/cast.h:78
   end defs;
   type cast_key_st_data_array is array (0 .. 31) of aliased unsigned;
   type cast_key_st is record
      data : aliased cast_key_st_data_array;  -- openssl/cast.h:82
      short_key : aliased int;  -- openssl/cast.h:83
   end record;
   pragma Convention (C_Pass_By_Copy, cast_key_st);  -- openssl/cast.h:80

   subtype CAST_KEY is cast_key_st;

   procedure private_CAST_set_key
     (key : access CAST_KEY;
      len : int;
      data : access unsigned_char);  -- openssl/cast.h:87
   pragma Import (C, private_CAST_set_key, "private_CAST_set_key");

   procedure CAST_set_key
     (key : access CAST_KEY;
      len : int;
      data : access unsigned_char);  -- openssl/cast.h:89
   pragma Import (C, CAST_set_key, "CAST_set_key");

   procedure CAST_ecb_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      key : System.Address;
      enc : int);  -- openssl/cast.h:90
   pragma Import (C, CAST_ecb_encrypt, "CAST_ecb_encrypt");

   procedure CAST_encrypt (data : access unsigned; key : System.Address);  -- openssl/cast.h:92
   pragma Import (C, CAST_encrypt, "CAST_encrypt");

   procedure CAST_decrypt (data : access unsigned; key : System.Address);  -- openssl/cast.h:93
   pragma Import (C, CAST_decrypt, "CAST_decrypt");

   procedure CAST_cbc_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : long;
      ks : System.Address;
      iv : access unsigned_char;
      enc : int);  -- openssl/cast.h:94
   pragma Import (C, CAST_cbc_encrypt, "CAST_cbc_encrypt");

   procedure CAST_cfb64_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : long;
      schedule : System.Address;
      ivec : access unsigned_char;
      num : access int;
      enc : int);  -- openssl/cast.h:96
   pragma Import (C, CAST_cfb64_encrypt, "CAST_cfb64_encrypt");

   procedure CAST_ofb64_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : long;
      schedule : System.Address;
      ivec : access unsigned_char;
      num : access int);  -- openssl/cast.h:99
   pragma Import (C, CAST_ofb64_encrypt, "CAST_ofb64_encrypt");

end OpenSSL.Low_Level.cast_h;
