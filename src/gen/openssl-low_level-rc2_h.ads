with Interfaces.C; use Interfaces.C;

package OpenSSL.Low_Level.rc2_h is

   package defs is

      RC2_ENCRYPT : constant := 1;  --  openssl/rc2.h:67
      RC2_DECRYPT : constant := 0;  --  openssl/rc2.h:68

      RC2_BLOCK   : constant := 8;  --  openssl/rc2.h:70
      RC2_KEY_LENGTH : constant := 16;  --  openssl/rc2.h:71
   end defs;
   type rc2_key_st_data_array is array (0 .. 63) of aliased unsigned;
   type rc2_key_st is record
      data : aliased rc2_key_st_data_array;  -- openssl/rc2.h:79
   end record;
   pragma Convention (C_Pass_By_Copy, rc2_key_st);  -- openssl/rc2.h:77

   subtype RC2_KEY is rc2_key_st;

   procedure private_RC2_set_key
     (key : access RC2_KEY;
      len : int;
      data : access unsigned_char;
      bits : int);  -- openssl/rc2.h:83
   pragma Import (C, private_RC2_set_key, "private_RC2_set_key");

   procedure RC2_set_key
     (key : access RC2_KEY;
      len : int;
      data : access unsigned_char;
      bits : int);  -- openssl/rc2.h:85
   pragma Import (C, RC2_set_key, "RC2_set_key");

   procedure RC2_ecb_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      key : access RC2_KEY;
      enc : int);  -- openssl/rc2.h:86
   pragma Import (C, RC2_ecb_encrypt, "RC2_ecb_encrypt");

   procedure RC2_encrypt (data : access unsigned_long; key : access RC2_KEY);  -- openssl/rc2.h:88
   pragma Import (C, RC2_encrypt, "RC2_encrypt");

   procedure RC2_decrypt (data : access unsigned_long; key : access RC2_KEY);  -- openssl/rc2.h:89
   pragma Import (C, RC2_decrypt, "RC2_decrypt");

   procedure RC2_cbc_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : long;
      ks : access RC2_KEY;
      iv : access unsigned_char;
      enc : int);  -- openssl/rc2.h:90
   pragma Import (C, RC2_cbc_encrypt, "RC2_cbc_encrypt");

   procedure RC2_cfb64_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : long;
      schedule : access RC2_KEY;
      ivec : access unsigned_char;
      num : access int;
      enc : int);  -- openssl/rc2.h:92
   pragma Import (C, RC2_cfb64_encrypt, "RC2_cfb64_encrypt");

   procedure RC2_ofb64_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : long;
      schedule : access RC2_KEY;
      ivec : access unsigned_char;
      num : access int);  -- openssl/rc2.h:95
   pragma Import (C, RC2_ofb64_encrypt, "RC2_ofb64_encrypt");

end OpenSSL.Low_Level.rc2_h;
