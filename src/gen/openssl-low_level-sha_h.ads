with Interfaces.C; use Interfaces.C;
with System;
--  with stddef_h;
with Interfaces.C.Extensions;

package OpenSSL.Low_Level.sha_h is
   package defs is

   --  unsupported macro: FIPS_SHA_SIZE_T size_t
   --  unsupported macro: SHA_LONG unsigned int

   SHA_LBLOCK : constant := 16;  --  openssl/sha.h:93
   --  unsupported macro: SHA_CBLOCK (SHA_LBLOCK*4)
   --  unsupported macro: SHA_LAST_BLOCK (SHA_CBLOCK-8)

   SHA_DIGEST_LENGTH : constant := 20;  --  openssl/sha.h:98
   --  unsupported macro: SHA256_CBLOCK (SHA_LBLOCK*4)

   SHA224_DIGEST_LENGTH : constant := 28;  --  openssl/sha.h:129
   SHA256_DIGEST_LENGTH : constant := 32;  --  openssl/sha.h:130

   SHA384_DIGEST_LENGTH : constant := 48;  --  openssl/sha.h:152
   SHA512_DIGEST_LENGTH : constant := 64;  --  openssl/sha.h:153
   --  unsupported macro: SHA512_CBLOCK (SHA_LBLOCK*8)
   --  unsupported macro: SHA_LONG64 unsigned long long
   --  unsupported macro: U64(C) C ##ULL
end;
   type SHAstate_st_data_array is array (0 .. 15) of aliased unsigned;
   type SHAstate_st is record
      h0 : aliased unsigned;  -- openssl/sha.h:102
      h1 : aliased unsigned;  -- openssl/sha.h:102
      h2 : aliased unsigned;  -- openssl/sha.h:102
      h3 : aliased unsigned;  -- openssl/sha.h:102
      h4 : aliased unsigned;  -- openssl/sha.h:102
      Nl : aliased unsigned;  -- openssl/sha.h:103
      Nh : aliased unsigned;  -- openssl/sha.h:103
      data : aliased SHAstate_st_data_array;  -- openssl/sha.h:104
      num : aliased unsigned;  -- openssl/sha.h:105
   end record;
   pragma Convention (C_Pass_By_Copy, SHAstate_st);  -- openssl/sha.h:100

   subtype SHA_CTX is SHAstate_st;

   function private_SHA_Init (c : access SHA_CTX) return int;  -- openssl/sha.h:110
   pragma Import (C, private_SHA_Init, "private_SHA_Init");

   function SHA_Init (c : access SHA_CTX) return int;  -- openssl/sha.h:112
   pragma Import (C, SHA_Init, "SHA_Init");

   function SHA_Update
     (c : access SHA_CTX;
      data : System.Address;
      len : size_t) return int;  -- openssl/sha.h:113
   pragma Import (C, SHA_Update, "SHA_Update");

   function SHA_Final (md : access unsigned_char; c : access SHA_CTX) return int;  -- openssl/sha.h:114
   pragma Import (C, SHA_Final, "SHA_Final");

   function SHA
     (d : access unsigned_char;
      n : size_t;
      md : access unsigned_char) return access unsigned_char;  -- openssl/sha.h:115
   pragma Import (C, SHA, "SHA");

   procedure SHA_Transform (c : access SHA_CTX; data : access unsigned_char);  -- openssl/sha.h:116
   pragma Import (C, SHA_Transform, "SHA_Transform");

   function SHA1_Init (c : access SHA_CTX) return int;  -- openssl/sha.h:119
   pragma Import (C, SHA1_Init, "SHA1_Init");

   function SHA1_Update
     (c : access SHA_CTX;
      data : System.Address;
      len : size_t) return int;  -- openssl/sha.h:120
   pragma Import (C, SHA1_Update, "SHA1_Update");

   function SHA1_Final (md : access unsigned_char; c : access SHA_CTX) return int;  -- openssl/sha.h:121
   pragma Import (C, SHA1_Final, "SHA1_Final");

   function SHA1
     (d : access unsigned_char;
      n : size_t;
      md : access unsigned_char) return access unsigned_char;  -- openssl/sha.h:122
   pragma Import (C, SHA1, "SHA1");

   procedure SHA1_Transform (c : access SHA_CTX; data : access unsigned_char);  -- openssl/sha.h:123
   pragma Import (C, SHA1_Transform, "SHA1_Transform");

   type SHA256state_st_h_array is array (0 .. 7) of aliased unsigned;
   type SHA256state_st_data_array is array (0 .. 15) of aliased unsigned;
   type SHA256state_st is record
      h : aliased SHA256state_st_h_array;  -- openssl/sha.h:134
      Nl : aliased unsigned;  -- openssl/sha.h:135
      Nh : aliased unsigned;  -- openssl/sha.h:135
      data : aliased SHA256state_st_data_array;  -- openssl/sha.h:136
      num : aliased unsigned;  -- openssl/sha.h:137
      md_len : aliased unsigned;  -- openssl/sha.h:137
   end record;
   pragma Convention (C_Pass_By_Copy, SHA256state_st);  -- openssl/sha.h:132

   subtype SHA256_CTX is SHA256state_st;

   function SHA224_Init (c : access SHA256_CTX) return int;  -- openssl/sha.h:141
   pragma Import (C, SHA224_Init, "SHA224_Init");

   function SHA224_Update
     (c : access SHA256_CTX;
      data : System.Address;
      len : size_t) return int;  -- openssl/sha.h:142
   pragma Import (C, SHA224_Update, "SHA224_Update");

   function SHA224_Final (md : access unsigned_char; c : access SHA256_CTX) return int;  -- openssl/sha.h:143
   pragma Import (C, SHA224_Final, "SHA224_Final");

   function SHA224
     (d : access unsigned_char;
      n : size_t;
      md : access unsigned_char) return access unsigned_char;  -- openssl/sha.h:144
   pragma Import (C, SHA224, "SHA224");

   function SHA256_Init (c : access SHA256_CTX) return int;  -- openssl/sha.h:145
   pragma Import (C, SHA256_Init, "SHA256_Init");

   function SHA256_Update
     (c : access SHA256_CTX;
      data : System.Address;
      len : size_t) return int;  -- openssl/sha.h:146
   pragma Import (C, SHA256_Update, "SHA256_Update");

   function SHA256_Final (md : access unsigned_char; c : access SHA256_CTX) return int;  -- openssl/sha.h:147
   pragma Import (C, SHA256_Final, "SHA256_Final");

   function SHA256
     (d : access unsigned_char;
      n : size_t;
      md : access unsigned_char) return access unsigned_char;  -- openssl/sha.h:148
   pragma Import (C, SHA256, "SHA256");

   procedure SHA256_Transform (c : access SHA256_CTX; data : access unsigned_char);  -- openssl/sha.h:149
   pragma Import (C, SHA256_Transform, "SHA256_Transform");

   type SHA512state_st_h_array is array (0 .. 7) of aliased Extensions.unsigned_long_long;
   type SHA512state_st_d_array is array (0 .. 15) of aliased Extensions.unsigned_long_long;
   type SHA512state_st_p_array is array (0 .. 127) of aliased unsigned_char;
   type anon_29 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            d : aliased SHA512state_st_d_array;  -- openssl/sha.h:180
         when others =>
            p : aliased SHA512state_st_p_array;  -- openssl/sha.h:181
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_29);
   pragma Unchecked_Union (anon_29);
   type SHA512state_st is record
      h : aliased SHA512state_st_h_array;  -- openssl/sha.h:177
      Nl : aliased Extensions.unsigned_long_long;  -- openssl/sha.h:178
      Nh : aliased Extensions.unsigned_long_long;  -- openssl/sha.h:178
      u : anon_29;  -- openssl/sha.h:182
      num : aliased unsigned;  -- openssl/sha.h:183
      md_len : aliased unsigned;  -- openssl/sha.h:183
   end record;
   pragma Convention (C_Pass_By_Copy, SHA512state_st);  -- openssl/sha.h:175

   subtype SHA512_CTX is SHA512state_st;

   function SHA384_Init (c : access SHA512_CTX) return int;  -- openssl/sha.h:188
   pragma Import (C, SHA384_Init, "SHA384_Init");

   function SHA384_Update
     (c : access SHA512_CTX;
      data : System.Address;
      len : size_t) return int;  -- openssl/sha.h:189
   pragma Import (C, SHA384_Update, "SHA384_Update");

   function SHA384_Final (md : access unsigned_char; c : access SHA512_CTX) return int;  -- openssl/sha.h:190
   pragma Import (C, SHA384_Final, "SHA384_Final");

   function SHA384
     (d : access unsigned_char;
      n : size_t;
      md : access unsigned_char) return access unsigned_char;  -- openssl/sha.h:191
   pragma Import (C, SHA384, "SHA384");

   function SHA512_Init (c : access SHA512_CTX) return int;  -- openssl/sha.h:192
   pragma Import (C, SHA512_Init, "SHA512_Init");

   function SHA512_Update
     (c : access SHA512_CTX;
      data : System.Address;
      len : size_t) return int;  -- openssl/sha.h:193
   pragma Import (C, SHA512_Update, "SHA512_Update");

   function SHA512_Final (md : access unsigned_char; c : access SHA512_CTX) return int;  -- openssl/sha.h:194
   pragma Import (C, SHA512_Final, "SHA512_Final");

   function SHA512
     (d : access unsigned_char;
      n : size_t;
      md : access unsigned_char) return access unsigned_char;  -- openssl/sha.h:195
   pragma Import (C, SHA512, "SHA512");

   procedure SHA512_Transform (c : access SHA512_CTX; data : access unsigned_char);  -- openssl/sha.h:196
   pragma Import (C, SHA512_Transform, "SHA512_Transform");

end OpenSSL.Low_Level.sha_h;
