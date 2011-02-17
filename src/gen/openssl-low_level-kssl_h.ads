with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with krb5_krb5_h;
with System;

package OpenSSL.Low_Level.kssl_h is

   package defs is

      KRB5SVC : aliased constant String := "host" & ASCII.NUL;  --  openssl/kssl.h:100

      KRB5KEYTAB : aliased constant String := "/etc/krb5.keytab" & ASCII.NUL;  --  openssl/kssl.h:104

      KRB5SENDAUTH : constant := 1;  --  openssl/kssl.h:108

      KRB5CHECKAUTH : constant := 1;  --  openssl/kssl.h:112
   --  unsupported macro: KSSL_CLOCKSKEW 300;

      KSSL_ERR_MAX : constant := 255;  --  openssl/kssl.h:119

      KSSL_CLIENT : constant := 1;  --  openssl/kssl.h:143
      KSSL_SERVER : constant := 2;  --  openssl/kssl.h:144
      KSSL_SERVICE : constant := 3;  --  openssl/kssl.h:145
      KSSL_KEYTAB : constant := 4;  --  openssl/kssl.h:146

      KSSL_CTX_OK : constant := 0;  --  openssl/kssl.h:148
      KSSL_CTX_ERR : constant := 1;  --  openssl/kssl.h:149
      KSSL_NOMEM : constant := 2;  --  openssl/kssl.h:150
   end defs;
   subtype kssl_err_st_text_array is Interfaces.C.char_array (0 .. 255);
   type kssl_err_st is record
      reason : aliased int;  -- openssl/kssl.h:121
      text : aliased kssl_err_st_text_array;  -- openssl/kssl.h:122
   end record;
   pragma Convention (C_Pass_By_Copy, kssl_err_st);  -- openssl/kssl.h:120

   subtype KSSL_ERR is kssl_err_st;

   type kssl_ctx_st is record
      service_name : Interfaces.C.Strings.chars_ptr;  -- openssl/kssl.h:133
      service_host : Interfaces.C.Strings.chars_ptr;  -- openssl/kssl.h:134
      client_princ : Interfaces.C.Strings.chars_ptr;  -- openssl/kssl.h:135
      keytab_file : Interfaces.C.Strings.chars_ptr;  -- openssl/kssl.h:136
      cred_cache : Interfaces.C.Strings.chars_ptr;  -- openssl/kssl.h:137
      enctype : aliased krb5_krb5_h.krb5_enctype;  -- openssl/kssl.h:138
      length : aliased int;  -- openssl/kssl.h:139
      key : access krb5_krb5_h.krb5_octet;  -- openssl/kssl.h:140
   end record;
   pragma Convention (C_Pass_By_Copy, kssl_ctx_st);  -- openssl/kssl.h:130

   subtype KSSL_CTX is kssl_ctx_st;

   function kssl_ctx_setstring
     (the_kssl_ctx : access KSSL_CTX;
      which : int;
      text : Interfaces.C.Strings.chars_ptr) return krb5_krb5_h.krb5_error_code;  -- openssl/kssl.h:153
   pragma Import (C, kssl_ctx_setstring, "kssl_ctx_setstring");

   function kssl_ctx_new return access KSSL_CTX;  -- openssl/kssl.h:154
   pragma Import (C, kssl_ctx_new, "kssl_ctx_new");

   function kssl_ctx_free (the_kssl_ctx : access KSSL_CTX) return access KSSL_CTX;  -- openssl/kssl.h:155
   pragma Import (C, kssl_ctx_free, "kssl_ctx_free");

   procedure kssl_ctx_show (the_kssl_ctx : access KSSL_CTX);  -- openssl/kssl.h:156
   pragma Import (C, kssl_ctx_show, "kssl_ctx_show");

   function kssl_ctx_setprinc
     (the_kssl_ctx : access KSSL_CTX;
      which : int;
      realm : access krb5_krb5_h.krb5_data;
      entity : access krb5_krb5_h.krb5_data;
      nentities : int) return krb5_krb5_h.krb5_error_code;  -- openssl/kssl.h:157
   pragma Import (C, kssl_ctx_setprinc, "kssl_ctx_setprinc");

   function kssl_cget_tkt
     (the_kssl_ctx : access KSSL_CTX;
      enc_tktp : System.Address;
      authenp : access krb5_krb5_h.krb5_data;
      the_kssl_err : access KSSL_ERR) return krb5_krb5_h.krb5_error_code;  -- openssl/kssl.h:159
   pragma Import (C, kssl_cget_tkt, "kssl_cget_tkt");

   function kssl_sget_tkt
     (the_kssl_ctx : access KSSL_CTX;
      indata : access krb5_krb5_h.krb5_data;
      ttimes : access krb5_krb5_h.krb5_ticket_times;
      the_kssl_err : access KSSL_ERR) return krb5_krb5_h.krb5_error_code;  -- openssl/kssl.h:161
   pragma Import (C, kssl_sget_tkt, "kssl_sget_tkt");

   function kssl_ctx_setkey (the_kssl_ctx : access KSSL_CTX; session : access krb5_krb5_h.krb5_keyblock) return krb5_krb5_h.krb5_error_code;  -- openssl/kssl.h:163
   pragma Import (C, kssl_ctx_setkey, "kssl_ctx_setkey");

   procedure kssl_err_set
     (the_kssl_err : access KSSL_ERR;
      reason : int;
      text : Interfaces.C.Strings.chars_ptr);  -- openssl/kssl.h:164
   pragma Import (C, kssl_err_set, "kssl_err_set");

   procedure kssl_krb5_free_data_contents (context : krb5_krb5_h.krb5_context; data : access krb5_krb5_h.krb5_data);  -- openssl/kssl.h:165
   pragma Import (C, kssl_krb5_free_data_contents, "kssl_krb5_free_data_contents");

   function kssl_build_principal_2
     (context : krb5_krb5_h.krb5_context;
      princ : System.Address;
      rlen : int;
      realm : Interfaces.C.Strings.chars_ptr;
      slen : int;
      svc : Interfaces.C.Strings.chars_ptr;
      hlen : int;
      host : Interfaces.C.Strings.chars_ptr) return krb5_krb5_h.krb5_error_code;  -- openssl/kssl.h:166
   pragma Import (C, kssl_build_principal_2, "kssl_build_principal_2");

   function kssl_validate_times (atime : krb5_krb5_h.krb5_timestamp; ttimes : access krb5_krb5_h.krb5_ticket_times) return krb5_krb5_h.krb5_error_code;  -- openssl/kssl.h:169
   pragma Import (C, kssl_validate_times, "kssl_validate_times");

   function kssl_check_authent
     (the_kssl_ctx : access KSSL_CTX;
      authentp : access krb5_krb5_h.krb5_data;
      atimep : access krb5_krb5_h.krb5_timestamp;
      the_kssl_err : access KSSL_ERR) return krb5_krb5_h.krb5_error_code;  -- openssl/kssl.h:171
   pragma Import (C, kssl_check_authent, "kssl_check_authent");

   function kssl_skip_confound (enctype : krb5_krb5_h.krb5_enctype; authn : access unsigned_char) return access unsigned_char;  -- openssl/kssl.h:173
   pragma Import (C, kssl_skip_confound, "kssl_skip_confound");

end OpenSSL.Low_Level.kssl_h;
