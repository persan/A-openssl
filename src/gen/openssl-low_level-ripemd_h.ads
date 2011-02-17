with Interfaces.C; use Interfaces.C;
with System;
--  with stddef_h;

package OpenSSL.Low_Level.ripemd_h is

   --  unsupported macro: RIPEMD160_LONG unsigned int
   package defs is

      RIPEMD160_CBLOCK : constant := 64;  --  openssl/ripemd.h:82
   --  unsupported macro: RIPEMD160_LBLOCK (RIPEMD160_CBLOCK/4)

      RIPEMD160_DIGEST_LENGTH : constant := 20;  --  openssl/ripemd.h:84
   end defs;
   type RIPEMD160state_st_data_array is array (0 .. 15) of aliased unsigned;
   type RIPEMD160state_st is record
      A : aliased unsigned;  -- openssl/ripemd.h:88
      B : aliased unsigned;  -- openssl/ripemd.h:88
      C : aliased unsigned;  -- openssl/ripemd.h:88
      D : aliased unsigned;  -- openssl/ripemd.h:88
      E : aliased unsigned;  -- openssl/ripemd.h:88
      Nl : aliased unsigned;  -- openssl/ripemd.h:89
      Nh : aliased unsigned;  -- openssl/ripemd.h:89
      data : aliased RIPEMD160state_st_data_array;  -- openssl/ripemd.h:90
      num : aliased unsigned;  -- openssl/ripemd.h:91
   end record;
   pragma Convention (C_Pass_By_Copy, RIPEMD160state_st);  -- openssl/ripemd.h:86

   subtype RIPEMD160_CTX is RIPEMD160state_st;

   function private_RIPEMD160_Init (c : access RIPEMD160_CTX) return int;  -- openssl/ripemd.h:95
   pragma Import (C, private_RIPEMD160_Init, "private_RIPEMD160_Init");

   function RIPEMD160_Init (c : access RIPEMD160_CTX) return int;  -- openssl/ripemd.h:97
   pragma Import (C, RIPEMD160_Init, "RIPEMD160_Init");

   function RIPEMD160_Update
     (c : access RIPEMD160_CTX;
      data : System.Address;
      len : size_t) return int;  -- openssl/ripemd.h:98
   pragma Import (C, RIPEMD160_Update, "RIPEMD160_Update");

   function RIPEMD160_Final (md : access unsigned_char; c : access RIPEMD160_CTX) return int;  -- openssl/ripemd.h:99
   pragma Import (C, RIPEMD160_Final, "RIPEMD160_Final");

   function RIPEMD160
     (d : access unsigned_char;
      n : size_t;
      md : access unsigned_char) return access unsigned_char;  -- openssl/ripemd.h:100
   pragma Import (C, RIPEMD160, "RIPEMD160");

   procedure RIPEMD160_Transform (c : access RIPEMD160_CTX; b : access unsigned_char);  -- openssl/ripemd.h:102
   pragma Import (C, RIPEMD160_Transform, "RIPEMD160_Transform");

end OpenSSL.Low_Level.ripemd_h;
