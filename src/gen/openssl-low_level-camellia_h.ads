with Interfaces.C; use Interfaces.C;
with System;
--  with stddef_h;

package OpenSSL.Low_Level.camellia_h is


   CAMELLIA_ENCRYPT : constant := 1;  --  openssl/camellia.h:63
   CAMELLIA_DECRYPT : constant := 0;  --  openssl/camellia.h:64

   CAMELLIA_BLOCK_SIZE : constant := 16;  --  openssl/camellia.h:75
   CAMELLIA_TABLE_BYTE_LEN : constant := 272;  --  openssl/camellia.h:76
   --  unsupported macro: CAMELLIA_TABLE_WORD_LEN (CAMELLIA_TABLE_BYTE_LEN / 4)

   type KEY_TABLE_TYPE is array (0 .. 67) of aliased unsigned;  -- openssl/camellia.h:79

   type anon_40 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            d : aliased double;  -- openssl/camellia.h:84
         when others =>
            rd_key : aliased KEY_TABLE_TYPE;  -- openssl/camellia.h:85
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_40);
   pragma Unchecked_Union (anon_40);
   type camellia_key_st is record
      u : anon_40;  -- openssl/camellia.h:86
      grand_rounds : aliased int;  -- openssl/camellia.h:87
   end record;
   pragma Convention (C_Pass_By_Copy, camellia_key_st);  -- openssl/camellia.h:81

   subtype CAMELLIA_KEY is camellia_key_st;

   function private_Camellia_set_key
     (userKey : access unsigned_char;
      bits : int;
      key : access CAMELLIA_KEY) return int;  -- openssl/camellia.h:92
   pragma Import (C, private_Camellia_set_key, "private_Camellia_set_key");

   function Camellia_set_key
     (userKey : access unsigned_char;
      bits : int;
      key : access CAMELLIA_KEY) return int;  -- openssl/camellia.h:96
   pragma Import (C, Camellia_set_key, "Camellia_set_key");

   procedure Camellia_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      key : System.Address);  -- openssl/camellia.h:99
   pragma Import (C, Camellia_encrypt, "Camellia_encrypt");

   procedure Camellia_decrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      key : System.Address);  -- openssl/camellia.h:101
   pragma Import (C, Camellia_decrypt, "Camellia_decrypt");

   procedure Camellia_ecb_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      key : System.Address;
      enc : int);  -- openssl/camellia.h:104
   pragma Import (C, Camellia_ecb_encrypt, "Camellia_ecb_encrypt");

   procedure Camellia_cbc_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      enc : int);  -- openssl/camellia.h:106
   pragma Import (C, Camellia_cbc_encrypt, "Camellia_cbc_encrypt");

   procedure Camellia_cfb128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      num : access int;
      enc : int);  -- openssl/camellia.h:109
   pragma Import (C, Camellia_cfb128_encrypt, "Camellia_cfb128_encrypt");

   procedure Camellia_cfb1_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      num : access int;
      enc : int);  -- openssl/camellia.h:112
   pragma Import (C, Camellia_cfb1_encrypt, "Camellia_cfb1_encrypt");

   procedure Camellia_cfb8_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      num : access int;
      enc : int);  -- openssl/camellia.h:115
   pragma Import (C, Camellia_cfb8_encrypt, "Camellia_cfb8_encrypt");

   procedure Camellia_ofb128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      num : access int);  -- openssl/camellia.h:118
   pragma Import (C, Camellia_ofb128_encrypt, "Camellia_ofb128_encrypt");

   procedure Camellia_ctr128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      ecount_buf : access unsigned_char;
      num : access unsigned);  -- openssl/camellia.h:121
   pragma Import (C, Camellia_ctr128_encrypt, "Camellia_ctr128_encrypt");

end OpenSSL.Low_Level.camellia_h;
