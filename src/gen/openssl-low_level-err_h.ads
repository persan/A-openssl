with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with OpenSSL.Low_Level.crypto_h;
with System;
--  with stddef_h;
--  limited --  with Interfaces.C_Streams;
limited with OpenSSL.Low_Level.bio_h;

package OpenSSL.Low_Level.err_h is

   --  arg-macro: procedure ERR_PUT_error (a, b, c, d, e)
   --    ERR_put_error(a,b,c,d,e)

   ERR_TXT_MALLOCED : constant := 16#01#;  --  openssl/err.h:142
   ERR_TXT_STRING : constant := 16#02#;  --  openssl/err.h:143

   ERR_FLAG_MARK : constant := 16#01#;  --  openssl/err.h:145

   ERR_NUM_ERRORS : constant := 16;  --  openssl/err.h:147

   ERR_LIB_NONE : constant := 1;  --  openssl/err.h:161
   ERR_LIB_SYS : constant := 2;  --  openssl/err.h:162
   ERR_LIB_BN : constant := 3;  --  openssl/err.h:163
   ERR_LIB_RSA : constant := 4;  --  openssl/err.h:164
   ERR_LIB_DH : constant := 5;  --  openssl/err.h:165
   ERR_LIB_EVP : constant := 6;  --  openssl/err.h:166
   ERR_LIB_BUF : constant := 7;  --  openssl/err.h:167
   ERR_LIB_OBJ : constant := 8;  --  openssl/err.h:168
   ERR_LIB_PEM : constant := 9;  --  openssl/err.h:169
   ERR_LIB_DSA : constant := 10;  --  openssl/err.h:170
   ERR_LIB_X509 : constant := 11;  --  openssl/err.h:171

   ERR_LIB_ASN1 : constant := 13;  --  openssl/err.h:173
   ERR_LIB_CONF : constant := 14;  --  openssl/err.h:174
   ERR_LIB_CRYPTO : constant := 15;  --  openssl/err.h:175
   ERR_LIB_EC : constant := 16;  --  openssl/err.h:176
   ERR_LIB_SSL : constant := 20;  --  openssl/err.h:177

   ERR_LIB_BIO : constant := 32;  --  openssl/err.h:183
   ERR_LIB_PKCS7 : constant := 33;  --  openssl/err.h:184
   ERR_LIB_X509V3 : constant := 34;  --  openssl/err.h:185
   ERR_LIB_PKCS12 : constant := 35;  --  openssl/err.h:186
   ERR_LIB_RAND : constant := 36;  --  openssl/err.h:187
   ERR_LIB_DSO : constant := 37;  --  openssl/err.h:188
   ERR_LIB_ENGINE : constant := 38;  --  openssl/err.h:189
   ERR_LIB_OCSP : constant := 39;  --  openssl/err.h:190
   ERR_LIB_UI : constant := 40;  --  openssl/err.h:191
   ERR_LIB_COMP : constant := 41;  --  openssl/err.h:192
   ERR_LIB_ECDSA : constant := 42;  --  openssl/err.h:193
   ERR_LIB_ECDH : constant := 43;  --  openssl/err.h:194
   ERR_LIB_STORE : constant := 44;  --  openssl/err.h:195
   ERR_LIB_FIPS : constant := 45;  --  openssl/err.h:196
   ERR_LIB_CMS : constant := 46;  --  openssl/err.h:197
   ERR_LIB_TS : constant := 47;  --  openssl/err.h:198
   ERR_LIB_HMAC : constant := 48;  --  openssl/err.h:199
   ERR_LIB_JPAKE : constant := 49;  --  openssl/err.h:200

   ERR_LIB_USER : constant := 128;  --  openssl/err.h:202
   --  arg-macro: procedure SYSerr (f, r)
   --    ERR_PUT_error(ERR_LIB_SYS,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure BNerr (f, r)
   --    ERR_PUT_error(ERR_LIB_BN,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure RSAerr (f, r)
   --    ERR_PUT_error(ERR_LIB_RSA,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure DHerr (f, r)
   --    ERR_PUT_error(ERR_LIB_DH,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure EVPerr (f, r)
   --    ERR_PUT_error(ERR_LIB_EVP,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure BUFerr (f, r)
   --    ERR_PUT_error(ERR_LIB_BUF,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure OBJerr (f, r)
   --    ERR_PUT_error(ERR_LIB_OBJ,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure PEMerr (f, r)
   --    ERR_PUT_error(ERR_LIB_PEM,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure DSAerr (f, r)
   --    ERR_PUT_error(ERR_LIB_DSA,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure X509err (f, r)
   --    ERR_PUT_error(ERR_LIB_X509,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure ASN1err (f, r)
   --    ERR_PUT_error(ERR_LIB_ASN1,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure CONFerr (f, r)
   --    ERR_PUT_error(ERR_LIB_CONF,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure CRYPTOerr (f, r)
   --    ERR_PUT_error(ERR_LIB_CRYPTO,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure ECerr (f, r)
   --    ERR_PUT_error(ERR_LIB_EC,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure SSLerr (f, r)
   --    ERR_PUT_error(ERR_LIB_SSL,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure BIOerr (f, r)
   --    ERR_PUT_error(ERR_LIB_BIO,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure PKCS7err (f, r)
   --    ERR_PUT_error(ERR_LIB_PKCS7,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure X509V3err (f, r)
   --    ERR_PUT_error(ERR_LIB_X509V3,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure PKCS12err (f, r)
   --    ERR_PUT_error(ERR_LIB_PKCS12,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure RANDerr (f, r)
   --    ERR_PUT_error(ERR_LIB_RAND,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure DSOerr (f, r)
   --    ERR_PUT_error(ERR_LIB_DSO,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure ENGINEerr (f, r)
   --    ERR_PUT_error(ERR_LIB_ENGINE,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure OCSPerr (f, r)
   --    ERR_PUT_error(ERR_LIB_OCSP,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure UIerr (f, r)
   --    ERR_PUT_error(ERR_LIB_UI,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure COMPerr (f, r)
   --    ERR_PUT_error(ERR_LIB_COMP,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure ECDSAerr (f, r)
   --    ERR_PUT_error(ERR_LIB_ECDSA,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure ECDHerr (f, r)
   --    ERR_PUT_error(ERR_LIB_ECDH,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure STOREerr (f, r)
   --    ERR_PUT_error(ERR_LIB_STORE,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure FIPSerr (f, r)
   --    ERR_PUT_error(ERR_LIB_FIPS,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure CMSerr (f, r)
   --    ERR_PUT_error(ERR_LIB_CMS,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure TSerr (f, r)
   --    ERR_PUT_error(ERR_LIB_TS,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure HMACerr (f, r)
   --    ERR_PUT_error(ERR_LIB_HMAC,(f),(r),_FILE_,_LINE_)
   --  arg-macro: procedure JPAKEerr (f, r)
   --    ERR_PUT_error(ERR_LIB_JPAKE,(f),(r),_FILE_,_LINE_)
   --  arg-macro: function ERR_PACK (l, f, r)
   --    return ((((unsigned long)l)and16#ff#)*16#1000000#)or ((((unsigned long)f)and16#fff#)*16#1000#)or ((((unsigned long)r)and16#fff#));
   --  arg-macro: function ERR_GET_LIB (l)
   --    return int)((((unsigned long)l)>>24)and16#ff#;
   --  arg-macro: function ERR_GET_FUNC (l)
   --    return int)((((unsigned long)l)>>12)and16#fff#;
   --  arg-macro: function ERR_GET_REASON (l)
   --    return int)((l)and16#fff#;
   --  arg-macro: function ERR_FATAL_ERROR (l)
   --    return int)((l)andERR_R_FATAL;

   SYS_F_FOPEN : constant := 1;  --  openssl/err.h:250
   SYS_F_CONNECT : constant := 2;  --  openssl/err.h:251
   SYS_F_GETSERVBYNAME : constant := 3;  --  openssl/err.h:252
   SYS_F_SOCKET : constant := 4;  --  openssl/err.h:253
   SYS_F_IOCTLSOCKET : constant := 5;  --  openssl/err.h:254
   SYS_F_BIND : constant := 6;  --  openssl/err.h:255
   SYS_F_LISTEN : constant := 7;  --  openssl/err.h:256
   SYS_F_ACCEPT : constant := 8;  --  openssl/err.h:257
   SYS_F_WSASTARTUP : constant := 9;  --  openssl/err.h:258
   SYS_F_OPENDIR : constant := 10;  --  openssl/err.h:259
   SYS_F_FREAD : constant := 11;  --  openssl/err.h:260
   --  unsupported macro: ERR_R_SYS_LIB ERR_LIB_SYS
   --  unsupported macro: ERR_R_BN_LIB ERR_LIB_BN
   --  unsupported macro: ERR_R_RSA_LIB ERR_LIB_RSA
   --  unsupported macro: ERR_R_DH_LIB ERR_LIB_DH
   --  unsupported macro: ERR_R_EVP_LIB ERR_LIB_EVP
   --  unsupported macro: ERR_R_BUF_LIB ERR_LIB_BUF
   --  unsupported macro: ERR_R_OBJ_LIB ERR_LIB_OBJ
   --  unsupported macro: ERR_R_PEM_LIB ERR_LIB_PEM
   --  unsupported macro: ERR_R_DSA_LIB ERR_LIB_DSA
   --  unsupported macro: ERR_R_X509_LIB ERR_LIB_X509
   --  unsupported macro: ERR_R_ASN1_LIB ERR_LIB_ASN1
   --  unsupported macro: ERR_R_CONF_LIB ERR_LIB_CONF
   --  unsupported macro: ERR_R_CRYPTO_LIB ERR_LIB_CRYPTO
   --  unsupported macro: ERR_R_EC_LIB ERR_LIB_EC
   --  unsupported macro: ERR_R_SSL_LIB ERR_LIB_SSL
   --  unsupported macro: ERR_R_BIO_LIB ERR_LIB_BIO
   --  unsupported macro: ERR_R_PKCS7_LIB ERR_LIB_PKCS7
   --  unsupported macro: ERR_R_X509V3_LIB ERR_LIB_X509V3
   --  unsupported macro: ERR_R_PKCS12_LIB ERR_LIB_PKCS12
   --  unsupported macro: ERR_R_RAND_LIB ERR_LIB_RAND
   --  unsupported macro: ERR_R_DSO_LIB ERR_LIB_DSO
   --  unsupported macro: ERR_R_ENGINE_LIB ERR_LIB_ENGINE
   --  unsupported macro: ERR_R_OCSP_LIB ERR_LIB_OCSP
   --  unsupported macro: ERR_R_UI_LIB ERR_LIB_UI
   --  unsupported macro: ERR_R_COMP_LIB ERR_LIB_COMP
   --  unsupported macro: ERR_R_ECDSA_LIB ERR_LIB_ECDSA
   --  unsupported macro: ERR_R_ECDH_LIB ERR_LIB_ECDH
   --  unsupported macro: ERR_R_STORE_LIB ERR_LIB_STORE
   --  unsupported macro: ERR_R_TS_LIB ERR_LIB_TS

   ERR_R_NESTED_ASN1_ERROR : constant := 58;  --  openssl/err.h:294
   ERR_R_BAD_ASN1_OBJECT_HEADER : constant := 59;  --  openssl/err.h:295
   ERR_R_BAD_GET_ASN1_OBJECT_CALL : constant := 60;  --  openssl/err.h:296
   ERR_R_EXPECTING_AN_ASN1_SEQUENCE : constant := 61;  --  openssl/err.h:297
   ERR_R_ASN1_LENGTH_MISMATCH : constant := 62;  --  openssl/err.h:298
   ERR_R_MISSING_ASN1_EOS : constant := 63;  --  openssl/err.h:299

   ERR_R_FATAL : constant := 64;  --  openssl/err.h:302
   --  unsupported macro: ERR_R_MALLOC_FAILURE (1|ERR_R_FATAL)
   --  unsupported macro: ERR_R_SHOULD_NOT_HAVE_BEEN_CALLED (2|ERR_R_FATAL)
   --  unsupported macro: ERR_R_PASSED_NULL_PARAMETER (3|ERR_R_FATAL)
   --  unsupported macro: ERR_R_INTERNAL_ERROR (4|ERR_R_FATAL)
   --  unsupported macro: ERR_R_DISABLED (5|ERR_R_FATAL)

   type err_state_st_err_flags_array is array (0 .. 15) of aliased int;
   type err_state_st_err_buffer_array is array (0 .. 15) of aliased unsigned_long;
   type err_state_st_err_data_array is array (0 .. 15) of Interfaces.C.Strings.chars_ptr;
   type err_state_st_err_data_flags_array is array (0 .. 15) of aliased int;
   type err_state_st_err_file_array is array (0 .. 15) of Interfaces.C.Strings.chars_ptr;
   type err_state_st_err_line_array is array (0 .. 15) of aliased int;
   type err_state_st is record
      tid : aliased OpenSSL.Low_Level.crypto_h.CRYPTO_THREADID;  -- openssl/err.h:150
      err_flags : aliased err_state_st_err_flags_array;  -- openssl/err.h:151
      err_buffer : aliased err_state_st_err_buffer_array;  -- openssl/err.h:152
      err_data : aliased err_state_st_err_data_array;  -- openssl/err.h:153
      err_data_flags : aliased err_state_st_err_data_flags_array;  -- openssl/err.h:154
      err_file : aliased err_state_st_err_file_array;  -- openssl/err.h:155
      err_line : aliased err_state_st_err_line_array;  -- openssl/err.h:156
      top : aliased int;  -- openssl/err.h:157
      bottom : aliased int;  -- openssl/err.h:157
   end record;
   pragma Convention (C_Pass_By_Copy, err_state_st);  -- openssl/err.h:148

   subtype ERR_STATE is err_state_st;

   type ERR_string_data_st is record
      error : aliased unsigned_long;  -- openssl/err.h:315
      string : Interfaces.C.Strings.chars_ptr;  -- openssl/err.h:316
   end record;
   pragma Convention (C_Pass_By_Copy, ERR_string_data_st);  -- openssl/err.h:313

   subtype ERR_STRING_DATA is ERR_string_data_st;

   procedure ERR_put_error
     (lib : int;
      func : int;
      reason : int;
      file : Interfaces.C.Strings.chars_ptr;
      line : int);  -- openssl/err.h:319
   pragma Import (C, ERR_put_error, "ERR_put_error");

   procedure ERR_set_error_data (data : Interfaces.C.Strings.chars_ptr; flags : int);  -- openssl/err.h:320
   pragma Import (C, ERR_set_error_data, "ERR_set_error_data");

   function ERR_get_error return unsigned_long;  -- openssl/err.h:322
   pragma Import (C, ERR_get_error, "ERR_get_error");

   function ERR_get_error_line (file : System.Address; line : access int) return unsigned_long;  -- openssl/err.h:323
   pragma Import (C, ERR_get_error_line, "ERR_get_error_line");

   function ERR_get_error_line_data
     (file : System.Address;
      line : access int;
      data : System.Address;
      flags : access int) return unsigned_long;  -- openssl/err.h:324
   pragma Import (C, ERR_get_error_line_data, "ERR_get_error_line_data");

   function ERR_peek_error return unsigned_long;  -- openssl/err.h:326
   pragma Import (C, ERR_peek_error, "ERR_peek_error");

   function ERR_peek_error_line (file : System.Address; line : access int) return unsigned_long;  -- openssl/err.h:327
   pragma Import (C, ERR_peek_error_line, "ERR_peek_error_line");

   function ERR_peek_error_line_data
     (file : System.Address;
      line : access int;
      data : System.Address;
      flags : access int) return unsigned_long;  -- openssl/err.h:328
   pragma Import (C, ERR_peek_error_line_data, "ERR_peek_error_line_data");

   function ERR_peek_last_error return unsigned_long;  -- openssl/err.h:330
   pragma Import (C, ERR_peek_last_error, "ERR_peek_last_error");

   function ERR_peek_last_error_line (file : System.Address; line : access int) return unsigned_long;  -- openssl/err.h:331
   pragma Import (C, ERR_peek_last_error_line, "ERR_peek_last_error_line");

   function ERR_peek_last_error_line_data
     (file : System.Address;
      line : access int;
      data : System.Address;
      flags : access int) return unsigned_long;  -- openssl/err.h:332
   pragma Import (C, ERR_peek_last_error_line_data, "ERR_peek_last_error_line_data");

   procedure ERR_clear_error;  -- openssl/err.h:334
   pragma Import (C, ERR_clear_error, "ERR_clear_error");

   function ERR_error_string (e : unsigned_long; buf : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/err.h:335
   pragma Import (C, ERR_error_string, "ERR_error_string");

   procedure ERR_error_string_n
     (e : unsigned_long;
      buf : Interfaces.C.Strings.chars_ptr;
      len : size_t);  -- openssl/err.h:336
   pragma Import (C, ERR_error_string_n, "ERR_error_string_n");

   function ERR_lib_error_string (e : unsigned_long) return Interfaces.C.Strings.chars_ptr;  -- openssl/err.h:337
   pragma Import (C, ERR_lib_error_string, "ERR_lib_error_string");

   function ERR_func_error_string (e : unsigned_long) return Interfaces.C.Strings.chars_ptr;  -- openssl/err.h:338
   pragma Import (C, ERR_func_error_string, "ERR_func_error_string");

   function ERR_reason_error_string (e : unsigned_long) return Interfaces.C.Strings.chars_ptr;  -- openssl/err.h:339
   pragma Import (C, ERR_reason_error_string, "ERR_reason_error_string");

   procedure ERR_print_errors_cb (cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : size_t;
         arg3 : System.Address) return int; u : System.Address);  -- openssl/err.h:340
   pragma Import (C, ERR_print_errors_cb, "ERR_print_errors_cb");

   procedure ERR_print_errors_fp (fp : access Interfaces.C_Streams.FILEs);  -- openssl/err.h:343
   pragma Import (C, ERR_print_errors_fp, "ERR_print_errors_fp");

   procedure ERR_print_errors (bp : access OpenSSL.Low_Level.bio_h.BIO);  -- openssl/err.h:346
   pragma Import (C, ERR_print_errors, "ERR_print_errors");

   procedure ERR_add_error_data (num : int  -- , ...
      );  -- openssl/err.h:347
   pragma Import (C, ERR_add_error_data, "ERR_add_error_data");

   procedure ERR_load_strings (lib : int; str : access ERR_STRING_DATA);  -- openssl/err.h:349
   pragma Import (C, ERR_load_strings, "ERR_load_strings");

   procedure ERR_unload_strings (lib : int; str : access ERR_STRING_DATA);  -- openssl/err.h:350
   pragma Import (C, ERR_unload_strings, "ERR_unload_strings");

   procedure ERR_load_ERR_strings;  -- openssl/err.h:351
   pragma Import (C, ERR_load_ERR_strings, "ERR_load_ERR_strings");

   procedure ERR_load_crypto_strings;  -- openssl/err.h:352
   pragma Import (C, ERR_load_crypto_strings, "ERR_load_crypto_strings");

   procedure ERR_free_strings;  -- openssl/err.h:353
   pragma Import (C, ERR_free_strings, "ERR_free_strings");

   procedure ERR_remove_thread_state (tid : access constant OpenSSL.Low_Level.crypto_h.CRYPTO_THREADID);  -- openssl/err.h:355
   pragma Import (C, ERR_remove_thread_state, "ERR_remove_thread_state");

   procedure ERR_remove_state (pid : unsigned_long);  -- openssl/err.h:357
   pragma Import (C, ERR_remove_state, "ERR_remove_state");

   function ERR_get_state return access ERR_STATE;  -- openssl/err.h:359
   pragma Import (C, ERR_get_state, "ERR_get_state");

   --  skipped empty struct lhash_st_ERR_STRING_DATA

   function ERR_get_string_table return System.Address;  -- openssl/err.h:362
   pragma Import (C, ERR_get_string_table, "ERR_get_string_table");

   --  skipped empty struct lhash_st_ERR_STATE

   function ERR_get_err_state_table return System.Address;  -- openssl/err.h:363
   pragma Import (C, ERR_get_err_state_table, "ERR_get_err_state_table");

   procedure ERR_release_err_state_table (hash : System.Address);  -- openssl/err.h:364
   pragma Import (C, ERR_release_err_state_table, "ERR_release_err_state_table");

   function ERR_get_next_error_library return int;  -- openssl/err.h:367
   pragma Import (C, ERR_get_next_error_library, "ERR_get_next_error_library");

   function ERR_set_mark return int;  -- openssl/err.h:369
   pragma Import (C, ERR_set_mark, "ERR_set_mark");

   function ERR_pop_to_mark return int;  -- openssl/err.h:370
   pragma Import (C, ERR_pop_to_mark, "ERR_pop_to_mark");

   function ERR_get_implementation return System.Address;  -- openssl/err.h:376
   pragma Import (C, ERR_get_implementation, "ERR_get_implementation");

   function ERR_set_implementation (fns : System.Address) return int;  -- openssl/err.h:379
   pragma Import (C, ERR_set_implementation, "ERR_set_implementation");

end OpenSSL.Low_Level.err_h;
