with Interfaces.C; use Interfaces.C;
--  with stddef_h;
with System;

package OpenSSL.Low_Level.whrlpool_h is

   package defs is

   WHIRLPOOL_DIGEST_LENGTH : constant := (512/8);  --  openssl/whrlpool.h:11
   WHIRLPOOL_BBLOCK : constant := 512;  --  openssl/whrlpool.h:12
   WHIRLPOOL_COUNTER : constant := (256/8);  --  openssl/whrlpool.h:13
end;
   type WHIRLPOOL_CTX_data_array is array (0 .. 63) of aliased unsigned_char;
   type WHIRLPOOL_CTX_bitlen_array is array (0 .. 7) of aliased size_t;
   type WHIRLPOOL_CTX_c_array is array (0 .. 63) of aliased unsigned_char;
   type WHIRLPOOL_CTX_q_array is array (0 .. 7) of aliased double;
   type anon_59 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            c : aliased WHIRLPOOL_CTX_c_array;  -- openssl/whrlpool.h:17
         when others =>
            q : aliased WHIRLPOOL_CTX_q_array;  -- openssl/whrlpool.h:19
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_59);
   pragma Unchecked_Union (anon_59);
   type WHIRLPOOL_CTX is record
      H : anon_59;  -- openssl/whrlpool.h:20
      data : aliased WHIRLPOOL_CTX_data_array;  -- openssl/whrlpool.h:21
      bitoff : aliased unsigned;  -- openssl/whrlpool.h:22
      bitlen : aliased WHIRLPOOL_CTX_bitlen_array;  -- openssl/whrlpool.h:23
   end record;
   pragma Convention (C_Pass_By_Copy, WHIRLPOOL_CTX);  -- openssl/whrlpool.h:24

   --  skipped anonymous struct anon_58

   function private_WHIRLPOOL_Init (c : access WHIRLPOOL_CTX) return int;  -- openssl/whrlpool.h:28
   pragma Import (C, private_WHIRLPOOL_Init, "private_WHIRLPOOL_Init");

   function WHIRLPOOL_Init (c : access WHIRLPOOL_CTX) return int;  -- openssl/whrlpool.h:30
   pragma Import (C, WHIRLPOOL_Init, "WHIRLPOOL_Init");

   function WHIRLPOOL_Update
     (c : access WHIRLPOOL_CTX;
      inp : System.Address;
      bytes : size_t) return int;  -- openssl/whrlpool.h:31
   pragma Import (C, WHIRLPOOL_Update, "WHIRLPOOL_Update");

   procedure WHIRLPOOL_BitUpdate
     (c : access WHIRLPOOL_CTX;
      inp : System.Address;
      bits : size_t);  -- openssl/whrlpool.h:32
   pragma Import (C, WHIRLPOOL_BitUpdate, "WHIRLPOOL_BitUpdate");

   function WHIRLPOOL_Final (md : access unsigned_char; c : access WHIRLPOOL_CTX) return int;  -- openssl/whrlpool.h:33
   pragma Import (C, WHIRLPOOL_Final, "WHIRLPOOL_Final");

   function WHIRLPOOL
     (inp : System.Address;
      bytes : size_t;
      md : access unsigned_char) return access unsigned_char;  -- openssl/whrlpool.h:34
   pragma Import (C, WHIRLPOOL, "WHIRLPOOL");

end OpenSSL.Low_Level.whrlpool_h;
