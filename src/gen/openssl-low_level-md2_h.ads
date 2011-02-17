with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
--  with stddef_h;

package OpenSSL.Low_Level.md2_h is

   package defs is

      MD2_DIGEST_LENGTH : constant := 16;  --  openssl/md2.h:68
      MD2_BLOCK         : constant := 16;  --  openssl/md2.h:69
   end defs;
   type MD2state_st_data_array is array (0 .. 15) of aliased unsigned_char;
   type MD2state_st_cksm_array is array (0 .. 15) of aliased unsigned;
   type MD2state_st_state_array is array (0 .. 15) of aliased unsigned;
   type MD2state_st is record
      num : aliased unsigned;  -- openssl/md2.h:77
      data : aliased MD2state_st_data_array;  -- openssl/md2.h:78
      cksm : aliased MD2state_st_cksm_array;  -- openssl/md2.h:79
      state : aliased MD2state_st_state_array;  -- openssl/md2.h:80
   end record;
   pragma Convention (C_Pass_By_Copy, MD2state_st);  -- openssl/md2.h:75

   subtype MD2_CTX is MD2state_st;

   function MD2_options return Interfaces.C.Strings.chars_ptr;  -- openssl/md2.h:83
   pragma Import (C, MD2_options, "MD2_options");

   function private_MD2_Init (c : access MD2_CTX) return int;  -- openssl/md2.h:85
   pragma Import (C, private_MD2_Init, "private_MD2_Init");

   function MD2_Init (c : access MD2_CTX) return int;  -- openssl/md2.h:87
   pragma Import (C, MD2_Init, "MD2_Init");

   function MD2_Update
     (c : access MD2_CTX;
      data : access unsigned_char;
      len : size_t) return int;  -- openssl/md2.h:88
   pragma Import (C, MD2_Update, "MD2_Update");

   function MD2_Final (md : access unsigned_char; c : access MD2_CTX) return int;  -- openssl/md2.h:89
   pragma Import (C, MD2_Final, "MD2_Final");

   function MD2
     (d : access unsigned_char;
      n : size_t;
      md : access unsigned_char) return access unsigned_char;  -- openssl/md2.h:90
   pragma Import (C, MD2, "MD2");

end OpenSSL.Low_Level.md2_h;
