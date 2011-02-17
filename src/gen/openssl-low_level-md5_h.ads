with Interfaces.C; use Interfaces.C;
with System;
--  with stddef_h;

package OpenSSL.Low_Level.md5_h is

   --  unsupported macro: MD5_LONG unsigned int
   package defs is

   MD5_CBLOCK : constant := 64;  --  openssl/md5.h:96
   --  unsupported macro: MD5_LBLOCK (MD5_CBLOCK/4)

   MD5_DIGEST_LENGTH : constant := 16;  --  openssl/md5.h:98
end;
   type MD5state_st_data_array is array (0 .. 15) of aliased unsigned;
   type MD5state_st is record
      A : aliased unsigned;  -- openssl/md5.h:102
      B : aliased unsigned;  -- openssl/md5.h:102
      C : aliased unsigned;  -- openssl/md5.h:102
      D : aliased unsigned;  -- openssl/md5.h:102
      Nl : aliased unsigned;  -- openssl/md5.h:103
      Nh : aliased unsigned;  -- openssl/md5.h:103
      data : aliased MD5state_st_data_array;  -- openssl/md5.h:104
      num : aliased unsigned;  -- openssl/md5.h:105
   end record;
   pragma Convention (C_Pass_By_Copy, MD5state_st);  -- openssl/md5.h:100

   subtype MD5_CTX is MD5state_st;

   function private_MD5_Init (c : access MD5_CTX) return int;  -- openssl/md5.h:109
   pragma Import (C, private_MD5_Init, "private_MD5_Init");

   function MD5_Init (c : access MD5_CTX) return int;  -- openssl/md5.h:111
   pragma Import (C, MD5_Init, "MD5_Init");

   function MD5_Update
     (c : access MD5_CTX;
      data : System.Address;
      len : size_t) return int;  -- openssl/md5.h:112
   pragma Import (C, MD5_Update, "MD5_Update");

   function MD5_Final (md : access unsigned_char; c : access MD5_CTX) return int;  -- openssl/md5.h:113
   pragma Import (C, MD5_Final, "MD5_Final");

   function MD5
     (d : access unsigned_char;
      n : size_t;
      md : access unsigned_char) return access unsigned_char;  -- openssl/md5.h:114
   pragma Import (C, MD5, "MD5");

   procedure MD5_Transform (c : access MD5_CTX; b : access unsigned_char);  -- openssl/md5.h:115
   pragma Import (C, MD5_Transform, "MD5_Transform");

end OpenSSL.Low_Level.md5_h;
