with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with OpenSSL.Low_Level.crypto_h;
package OpenSSL.Low_Level.comp_h is

   package defs is

      COMP_F_BIO_ZLIB_FLUSH : constant := 99;  --  openssl/comp.h:67
      COMP_F_BIO_ZLIB_NEW   : constant := 100;  --  openssl/comp.h:68
      COMP_F_BIO_ZLIB_READ  : constant := 101;  --  openssl/comp.h:69
      COMP_F_BIO_ZLIB_WRITE : constant := 102;  --  openssl/comp.h:70

      COMP_R_ZLIB_DEFLATE_ERROR : constant := 99;  --  openssl/comp.h:73
      COMP_R_ZLIB_INFLATE_ERROR : constant := 100;  --  openssl/comp.h:74
      COMP_R_ZLIB_NOT_SUPPORTED : constant := 101;  --  openssl/comp.h:75
   end defs;
   type comp_ctx_st;
   subtype COMP_CTX is comp_ctx_st;

   type comp_method_st is record
      c_type        : aliased int;  -- openssl/comp.h:15
      name          : Interfaces.C.Strings.chars_ptr;  -- openssl/comp.h:16
      init          : access function (arg1 : access COMP_CTX) return int;  -- openssl/comp.h:17
      finish        : access procedure (arg1 : access COMP_CTX);  -- openssl/comp.h:18
      compress      : access function
        (arg1 : access COMP_CTX;
         arg2          : access unsigned_char;
         arg3          : unsigned;
         arg4          : access unsigned_char;
         arg5          : unsigned) return int;  -- openssl/comp.h:21
      expand        : access function
        (arg1 : access COMP_CTX;
         arg2          : access unsigned_char;
         arg3          : unsigned;
         arg4          : access unsigned_char;
         arg5          : unsigned) return int;  -- openssl/comp.h:24
      ctrl          : access function return long;  -- openssl/comp.h:26
      callback_ctrl : access function return long;  -- openssl/comp.h:27
   end record;
   pragma Convention (C_Pass_By_Copy, comp_method_st);  -- openssl/comp.h:13

   subtype COMP_METHOD is comp_method_st;

   type comp_ctx_st is record
      meth         : access COMP_METHOD;  -- openssl/comp.h:32
      compress_in  : aliased unsigned_long;  -- openssl/comp.h:33
      compress_out : aliased unsigned_long;  -- openssl/comp.h:34
      expand_in    : aliased unsigned_long;  -- openssl/comp.h:35
      expand_out   : aliased unsigned_long;  -- openssl/comp.h:36
      ex_data      : aliased OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;  -- openssl/comp.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, comp_ctx_st);  -- openssl/comp.h:30

   function COMP_CTX_new (meth : access COMP_METHOD) return access COMP_CTX;  -- openssl/comp.h:42
   pragma Import (C, COMP_CTX_new, "COMP_CTX_new");

   procedure COMP_CTX_free (ctx : access COMP_CTX);  -- openssl/comp.h:43
   pragma Import (C, COMP_CTX_free, "COMP_CTX_free");

   function COMP_compress_block
     (ctx   : access COMP_CTX;
      c_out : access unsigned_char;
      olen  : int;
      c_in  : access unsigned_char;
      ilen  : int) return int;  -- openssl/comp.h:44
   pragma Import (C, COMP_compress_block, "COMP_compress_block");

   function COMP_expand_block
     (ctx   : access COMP_CTX;
      c_out : access unsigned_char;
      olen  : int;
      c_in  : access unsigned_char;
      ilen  : int) return int;  -- openssl/comp.h:46
   pragma Import (C, COMP_expand_block, "COMP_expand_block");

   function COMP_rle return access COMP_METHOD;  -- openssl/comp.h:48
   pragma Import (C, COMP_rle, "COMP_rle");

   function COMP_zlib return access COMP_METHOD;  -- openssl/comp.h:49
   pragma Import (C, COMP_zlib, "COMP_zlib");

   procedure COMP_zlib_cleanup;  -- openssl/comp.h:50
   pragma Import (C, COMP_zlib_cleanup, "COMP_zlib_cleanup");

   procedure ERR_load_COMP_strings;  -- openssl/comp.h:62
   pragma Import (C, ERR_load_COMP_strings, "ERR_load_COMP_strings");

end OpenSSL.Low_Level.comp_h;
