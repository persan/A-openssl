with Interfaces.C; use Interfaces.C;
with System;
--  with stddef_h;

package OpenSSL.Low_Level.md4_h is

   --  unsupported macro: MD4_LONG unsigned int
   package defs is

   MD4_CBLOCK : constant := 64;  --  openssl/md4.h:96
   --  unsupported macro: MD4_LBLOCK (MD4_CBLOCK/4)

   MD4_DIGEST_LENGTH : constant := 16;  --  openssl/md4.h:98
end;
   type MD4state_st_data_array is array (0 .. 15) of aliased unsigned;
   type MD4state_st is record
      A : aliased unsigned;  -- openssl/md4.h:102
      B : aliased unsigned;  -- openssl/md4.h:102
      C : aliased unsigned;  -- openssl/md4.h:102
      D : aliased unsigned;  -- openssl/md4.h:102
      Nl : aliased unsigned;  -- openssl/md4.h:103
      Nh : aliased unsigned;  -- openssl/md4.h:103
      data : aliased MD4state_st_data_array;  -- openssl/md4.h:104
      num : aliased unsigned;  -- openssl/md4.h:105
   end record;
   pragma Convention (C_Pass_By_Copy, MD4state_st);  -- openssl/md4.h:100

   subtype MD4_CTX is MD4state_st;

   function private_MD4_Init (c : access MD4_CTX) return int;  -- openssl/md4.h:109
   pragma Import (C, private_MD4_Init, "private_MD4_Init");

   function MD4_Init (c : access MD4_CTX) return int;  -- openssl/md4.h:111
   pragma Import (C, MD4_Init, "MD4_Init");

   function MD4_Update
     (c : access MD4_CTX;
      data : System.Address;
      len : size_t) return int;  -- openssl/md4.h:112
   pragma Import (C, MD4_Update, "MD4_Update");

   function MD4_Final (md : access unsigned_char; c : access MD4_CTX) return int;  -- openssl/md4.h:113
   pragma Import (C, MD4_Final, "MD4_Final");

   function MD4
     (d : access unsigned_char;
      n : size_t;
      md : access unsigned_char) return access unsigned_char;  -- openssl/md4.h:114
   pragma Import (C, MD4, "MD4");

   procedure MD4_Transform (c : access MD4_CTX; b : access unsigned_char);  -- openssl/md4.h:115
   pragma Import (C, MD4_Transform, "MD4_Transform");

end OpenSSL.Low_Level.md4_h;
