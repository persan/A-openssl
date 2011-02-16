with Interfaces.C; use Interfaces.C;
--  with OpenSSL.Low_Level.ossl_typ_h;
with System;
--  with stddef_h;

package OpenSSL.Low_Level.hmac_h is


   HMAC_MAX_MD_CBLOCK : constant := 128;  --  openssl/hmac.h:69
   --  arg-macro: function HMAC_size (e)
   --    return EVP_MD_size((e).md);
   --  arg-macro: procedure HMAC_cleanup (ctx)
   --    HMAC_CTX_cleanup(ctx)

   type hmac_ctx_st_key_array is array (0 .. 127) of aliased unsigned_char;
   type hmac_ctx_st is record
      md : access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/hmac.h:77
      md_ctx : aliased OpenSSL.Low_Level.evp_h.env_md_ctx_st;  -- openssl/hmac.h:78
      i_ctx : aliased OpenSSL.Low_Level.evp_h.env_md_ctx_st;  -- openssl/hmac.h:79
      o_ctx : aliased OpenSSL.Low_Level.evp_h.env_md_ctx_st;  -- openssl/hmac.h:80
      key_length : aliased unsigned;  -- openssl/hmac.h:81
      key : aliased hmac_ctx_st_key_array;  -- openssl/hmac.h:82
   end record;
   pragma Convention (C_Pass_By_Copy, hmac_ctx_st);  -- openssl/hmac.h:75

   subtype HMAC_CTX is hmac_ctx_st;

   procedure HMAC_CTX_init (ctx : access HMAC_CTX);  -- openssl/hmac.h:88
   pragma Import (C, HMAC_CTX_init, "HMAC_CTX_init");

   procedure HMAC_CTX_cleanup (ctx : access HMAC_CTX);  -- openssl/hmac.h:89
   pragma Import (C, HMAC_CTX_cleanup, "HMAC_CTX_cleanup");

   function HMAC_Init
     (ctx : access HMAC_CTX;
      key : System.Address;
      len : int;
      md : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/hmac.h:93
   pragma Import (C, HMAC_Init, "HMAC_Init");

   function HMAC_Init_ex
     (ctx : access HMAC_CTX;
      key : System.Address;
      len : int;
      md : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      impl : System.Address) return int;  -- openssl/hmac.h:95
   pragma Import (C, HMAC_Init_ex, "HMAC_Init_ex");

   function HMAC_Update
     (ctx : access HMAC_CTX;
      data : access unsigned_char;
      len : size_t) return int;  -- openssl/hmac.h:97
   pragma Import (C, HMAC_Update, "HMAC_Update");

   function HMAC_Final
     (ctx : access HMAC_CTX;
      md : access unsigned_char;
      len : access unsigned) return int;  -- openssl/hmac.h:98
   pragma Import (C, HMAC_Final, "HMAC_Final");

   function HMAC
     (the_evp_md : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      key : System.Address;
      key_len : int;
      d : access unsigned_char;
      n : size_t;
      md : access unsigned_char;
      md_len : access unsigned) return access unsigned_char;  -- openssl/hmac.h:99
   pragma Import (C, HMAC, "HMAC");

   function HMAC_CTX_copy (dctx : access HMAC_CTX; sctx : access HMAC_CTX) return int;  -- openssl/hmac.h:102
   pragma Import (C, HMAC_CTX_copy, "HMAC_CTX_copy");

   procedure HMAC_CTX_set_flags (ctx : access HMAC_CTX; flags : unsigned_long);  -- openssl/hmac.h:104
   pragma Import (C, HMAC_CTX_set_flags, "HMAC_CTX_set_flags");

end OpenSSL.Low_Level.hmac_h;
