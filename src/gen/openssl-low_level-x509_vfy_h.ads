with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
--  with OpenSSL.Low_Level.ossl_typ_h;
with OpenSSL.Low_Level.stack_h;
--  with time_h;
limited with OpenSSL.Low_Level.asn1_h;
limited with OpenSSL.Low_Level.x509_h;
limited with OpenSSL.Low_Level.x509v3_h;

package OpenSSL.Low_Level.x509_vfy_h is


   X509_LU_RETRY : constant := -1;  --  openssl/x509_vfy.h:117
   X509_LU_FAIL : constant := 0;  --  openssl/x509_vfy.h:118
   X509_LU_X509 : constant := 1;  --  openssl/x509_vfy.h:119
   X509_LU_CRL : constant := 2;  --  openssl/x509_vfy.h:120
   X509_LU_PKEY : constant := 3;  --  openssl/x509_vfy.h:121
   --  arg-macro: function X509_STORE_set_verify_cb_func (ctx, func)
   --    return (ctx).verify_cb:=(func);
   --  arg-macro: function X509_STORE_set_verify_func (ctx, func)
   --    return (ctx).verify:=(func);
   --  arg-macro: procedure X509_STORE_CTX_set_app_data (ctx, data)
   --    X509_STORE_CTX_set_ex_data(ctx,0,data)
   --  arg-macro: procedure X509_STORE_CTX_get_app_data (ctx)
   --    X509_STORE_CTX_get_ex_data(ctx,0)

   X509_L_FILE_LOAD : constant := 1;  --  openssl/x509_vfy.h:287
   X509_L_ADD_DIR : constant := 2;  --  openssl/x509_vfy.h:288
   --  arg-macro: procedure X509_LOOKUP_load_file (x, name, type)
   --    X509_LOOKUP_ctrl((x),X509_L_FILE_LOAD,(name),(long)(type),NULL)
   --  arg-macro: procedure X509_LOOKUP_add_dir (x, name, type)
   --    X509_LOOKUP_ctrl((x),X509_L_ADD_DIR,(name),(long)(type),NULL)

   X509_V_OK : constant := 0;  --  openssl/x509_vfy.h:296

   X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT : constant := 2;  --  openssl/x509_vfy.h:299
   X509_V_ERR_UNABLE_TO_GET_CRL : constant := 3;  --  openssl/x509_vfy.h:300
   X509_V_ERR_UNABLE_TO_DECRYPT_CERT_SIGNATURE : constant := 4;  --  openssl/x509_vfy.h:301
   X509_V_ERR_UNABLE_TO_DECRYPT_CRL_SIGNATURE : constant := 5;  --  openssl/x509_vfy.h:302
   X509_V_ERR_UNABLE_TO_DECODE_ISSUER_PUBLIC_KEY : constant := 6;  --  openssl/x509_vfy.h:303
   X509_V_ERR_CERT_SIGNATURE_FAILURE : constant := 7;  --  openssl/x509_vfy.h:304
   X509_V_ERR_CRL_SIGNATURE_FAILURE : constant := 8;  --  openssl/x509_vfy.h:305
   X509_V_ERR_CERT_NOT_YET_VALID : constant := 9;  --  openssl/x509_vfy.h:306
   X509_V_ERR_CERT_HAS_EXPIRED : constant := 10;  --  openssl/x509_vfy.h:307
   X509_V_ERR_CRL_NOT_YET_VALID : constant := 11;  --  openssl/x509_vfy.h:308
   X509_V_ERR_CRL_HAS_EXPIRED : constant := 12;  --  openssl/x509_vfy.h:309
   X509_V_ERR_ERROR_IN_CERT_NOT_BEFORE_FIELD : constant := 13;  --  openssl/x509_vfy.h:310
   X509_V_ERR_ERROR_IN_CERT_NOT_AFTER_FIELD : constant := 14;  --  openssl/x509_vfy.h:311
   X509_V_ERR_ERROR_IN_CRL_LAST_UPDATE_FIELD : constant := 15;  --  openssl/x509_vfy.h:312
   X509_V_ERR_ERROR_IN_CRL_NEXT_UPDATE_FIELD : constant := 16;  --  openssl/x509_vfy.h:313
   X509_V_ERR_OUT_OF_MEM : constant := 17;  --  openssl/x509_vfy.h:314
   X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT : constant := 18;  --  openssl/x509_vfy.h:315
   X509_V_ERR_SELF_SIGNED_CERT_IN_CHAIN : constant := 19;  --  openssl/x509_vfy.h:316
   X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY : constant := 20;  --  openssl/x509_vfy.h:317
   X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE : constant := 21;  --  openssl/x509_vfy.h:318
   X509_V_ERR_CERT_CHAIN_TOO_LONG : constant := 22;  --  openssl/x509_vfy.h:319
   X509_V_ERR_CERT_REVOKED : constant := 23;  --  openssl/x509_vfy.h:320
   X509_V_ERR_INVALID_CA : constant := 24;  --  openssl/x509_vfy.h:321
   X509_V_ERR_PATH_LENGTH_EXCEEDED : constant := 25;  --  openssl/x509_vfy.h:322
   X509_V_ERR_INVALID_PURPOSE : constant := 26;  --  openssl/x509_vfy.h:323
   X509_V_ERR_CERT_UNTRUSTED : constant := 27;  --  openssl/x509_vfy.h:324
   X509_V_ERR_CERT_REJECTED : constant := 28;  --  openssl/x509_vfy.h:325

   X509_V_ERR_SUBJECT_ISSUER_MISMATCH : constant := 29;  --  openssl/x509_vfy.h:327
   X509_V_ERR_AKID_SKID_MISMATCH : constant := 30;  --  openssl/x509_vfy.h:328
   X509_V_ERR_AKID_ISSUER_SERIAL_MISMATCH : constant := 31;  --  openssl/x509_vfy.h:329
   X509_V_ERR_KEYUSAGE_NO_CERTSIGN : constant := 32;  --  openssl/x509_vfy.h:330

   X509_V_ERR_UNABLE_TO_GET_CRL_ISSUER : constant := 33;  --  openssl/x509_vfy.h:332
   X509_V_ERR_UNHANDLED_CRITICAL_EXTENSION : constant := 34;  --  openssl/x509_vfy.h:333
   X509_V_ERR_KEYUSAGE_NO_CRL_SIGN : constant := 35;  --  openssl/x509_vfy.h:334
   X509_V_ERR_UNHANDLED_CRITICAL_CRL_EXTENSION : constant := 36;  --  openssl/x509_vfy.h:335
   X509_V_ERR_INVALID_NON_CA : constant := 37;  --  openssl/x509_vfy.h:336
   X509_V_ERR_PROXY_PATH_LENGTH_EXCEEDED : constant := 38;  --  openssl/x509_vfy.h:337
   X509_V_ERR_KEYUSAGE_NO_DIGITAL_SIGNATURE : constant := 39;  --  openssl/x509_vfy.h:338
   X509_V_ERR_PROXY_CERTIFICATES_NOT_ALLOWED : constant := 40;  --  openssl/x509_vfy.h:339

   X509_V_ERR_INVALID_EXTENSION : constant := 41;  --  openssl/x509_vfy.h:341
   X509_V_ERR_INVALID_POLICY_EXTENSION : constant := 42;  --  openssl/x509_vfy.h:342
   X509_V_ERR_NO_EXPLICIT_POLICY : constant := 43;  --  openssl/x509_vfy.h:343
   X509_V_ERR_DIFFERENT_CRL_SCOPE : constant := 44;  --  openssl/x509_vfy.h:344
   X509_V_ERR_UNSUPPORTED_EXTENSION_FEATURE : constant := 45;  --  openssl/x509_vfy.h:345

   X509_V_ERR_UNNESTED_RESOURCE : constant := 46;  --  openssl/x509_vfy.h:347

   X509_V_ERR_PERMITTED_VIOLATION : constant := 47;  --  openssl/x509_vfy.h:349
   X509_V_ERR_EXCLUDED_VIOLATION : constant := 48;  --  openssl/x509_vfy.h:350
   X509_V_ERR_SUBTREE_MINMAX : constant := 49;  --  openssl/x509_vfy.h:351
   X509_V_ERR_UNSUPPORTED_CONSTRAINT_TYPE : constant := 51;  --  openssl/x509_vfy.h:352
   X509_V_ERR_UNSUPPORTED_CONSTRAINT_SYNTAX : constant := 52;  --  openssl/x509_vfy.h:353
   X509_V_ERR_UNSUPPORTED_NAME_SYNTAX : constant := 53;  --  openssl/x509_vfy.h:354
   X509_V_ERR_CRL_PATH_VALIDATION_ERROR : constant := 54;  --  openssl/x509_vfy.h:355

   X509_V_ERR_APPLICATION_VERIFICATION : constant := 50;  --  openssl/x509_vfy.h:358

   X509_V_FLAG_CB_ISSUER_CHECK : constant := 16#1#;  --  openssl/x509_vfy.h:363

   X509_V_FLAG_USE_CHECK_TIME : constant := 16#2#;  --  openssl/x509_vfy.h:365

   X509_V_FLAG_CRL_CHECK : constant := 16#4#;  --  openssl/x509_vfy.h:367

   X509_V_FLAG_CRL_CHECK_ALL : constant := 16#8#;  --  openssl/x509_vfy.h:369

   X509_V_FLAG_IGNORE_CRITICAL : constant := 16#10#;  --  openssl/x509_vfy.h:371

   X509_V_FLAG_X509_STRICT : constant := 16#20#;  --  openssl/x509_vfy.h:373

   X509_V_FLAG_ALLOW_PROXY_CERTS : constant := 16#40#;  --  openssl/x509_vfy.h:375

   X509_V_FLAG_POLICY_CHECK : constant := 16#80#;  --  openssl/x509_vfy.h:377

   X509_V_FLAG_EXPLICIT_POLICY : constant := 16#100#;  --  openssl/x509_vfy.h:379

   X509_V_FLAG_INHIBIT_ANY : constant := 16#200#;  --  openssl/x509_vfy.h:381

   X509_V_FLAG_INHIBIT_MAP : constant := 16#400#;  --  openssl/x509_vfy.h:383

   X509_V_FLAG_NOTIFY_POLICY : constant := 16#800#;  --  openssl/x509_vfy.h:385

   X509_V_FLAG_EXTENDED_CRL_SUPPORT : constant := 16#1000#;  --  openssl/x509_vfy.h:387

   X509_V_FLAG_USE_DELTAS : constant := 16#2000#;  --  openssl/x509_vfy.h:389

   X509_V_FLAG_CHECK_SS_SIGNATURE : constant := 16#4000#;  --  openssl/x509_vfy.h:391

   X509_VP_FLAG_DEFAULT : constant := 16#1#;  --  openssl/x509_vfy.h:394
   X509_VP_FLAG_OVERWRITE : constant := 16#2#;  --  openssl/x509_vfy.h:395
   X509_VP_FLAG_RESET_FLAGS : constant := 16#4#;  --  openssl/x509_vfy.h:396
   X509_VP_FLAG_LOCKED : constant := 16#8#;  --  openssl/x509_vfy.h:397
   X509_VP_FLAG_ONCE : constant := 16#10#;  --  openssl/x509_vfy.h:398
   --  unsupported macro: X509_V_FLAG_POLICY_MASK (X509_V_FLAG_POLICY_CHECK | X509_V_FLAG_EXPLICIT_POLICY | X509_V_FLAG_INHIBIT_ANY | X509_V_FLAG_INHIBIT_MAP)

   type x509_file_st is record
      num_paths : aliased int;  -- openssl/x509_vfy.h:93
      num_alloced : aliased int;  -- openssl/x509_vfy.h:94
      paths : System.Address;  -- openssl/x509_vfy.h:95
      path_type : access int;  -- openssl/x509_vfy.h:96
   end record;
   pragma Convention (C_Pass_By_Copy, x509_file_st);  -- openssl/x509_vfy.h:91

   subtype X509_CERT_FILE_CTX is x509_file_st;

   type anon_31 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ptr : Interfaces.C.Strings.chars_ptr;  -- openssl/x509_vfy.h:128
         when 1 =>
            the_x509 : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509_vfy.h:129
         when 2 =>
            crl : access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/x509_vfy.h:130
         when others =>
            pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509_vfy.h:131
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_31);
   pragma Unchecked_Union (anon_31);
   type x509_object_st is record
      c_type : aliased int;  -- openssl/x509_vfy.h:126
      data : anon_31;  -- openssl/x509_vfy.h:132
   end record;
   pragma Convention (C_Pass_By_Copy, x509_object_st);  -- openssl/x509_vfy.h:123

   subtype X509_OBJECT is x509_object_st;

   type x509_lookup_st;
   subtype X509_LOOKUP is x509_lookup_st;

   type stack_st_X509_LOOKUP is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509_vfy.h:137
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_LOOKUP);  -- openssl/x509_vfy.h:137

   type stack_st_X509_OBJECT is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509_vfy.h:138
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_OBJECT);  -- openssl/x509_vfy.h:138

   type x509_lookup_method_st is record
      name : Interfaces.C.Strings.chars_ptr;  -- openssl/x509_vfy.h:143
      new_item : access function (arg1 : access X509_LOOKUP) return int;  -- openssl/x509_vfy.h:144
      free : access procedure (arg1 : access X509_LOOKUP);  -- openssl/x509_vfy.h:145
      init : access function (arg1 : access X509_LOOKUP) return int;  -- openssl/x509_vfy.h:146
      shutdown : access function (arg1 : access X509_LOOKUP) return int;  -- openssl/x509_vfy.h:147
      ctrl : access function
           (arg1 : access X509_LOOKUP;
            arg2 : int;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : long;
            arg5 : System.Address) return int;  -- openssl/x509_vfy.h:149
      get_by_subject : access function
           (arg1 : access X509_LOOKUP;
            arg2 : int;
            arg3 : access OpenSSL.Low_Level.x509_h.X509_name_st;
            arg4 : access X509_OBJECT) return int;  -- openssl/x509_vfy.h:151
      get_by_issuer_serial : access function
           (arg1 : access X509_LOOKUP;
            arg2 : int;
            arg3 : access OpenSSL.Low_Level.x509_h.X509_name_st;
            arg4 : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
            arg5 : access X509_OBJECT) return int;  -- openssl/x509_vfy.h:153
      get_by_fingerprint : access function
           (arg1 : access X509_LOOKUP;
            arg2 : int;
            arg3 : access unsigned_char;
            arg4 : int;
            arg5 : access X509_OBJECT) return int;  -- openssl/x509_vfy.h:156
      get_by_alias : access function
           (arg1 : access X509_LOOKUP;
            arg2 : int;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : int;
            arg5 : access X509_OBJECT) return int;  -- openssl/x509_vfy.h:158
   end record;
   pragma Convention (C_Pass_By_Copy, x509_lookup_method_st);  -- openssl/x509_vfy.h:141

   subtype X509_LOOKUP_METHOD is x509_lookup_method_st;

   type X509_VERIFY_PARAM_st is record
      name : Interfaces.C.Strings.chars_ptr;  -- openssl/x509_vfy.h:168
      check_time : aliased time_h.time_t;  -- openssl/x509_vfy.h:169
      inh_flags : aliased unsigned_long;  -- openssl/x509_vfy.h:170
      flags : aliased unsigned_long;  -- openssl/x509_vfy.h:171
      purpose : aliased int;  -- openssl/x509_vfy.h:172
      trust : aliased int;  -- openssl/x509_vfy.h:173
      depth : aliased int;  -- openssl/x509_vfy.h:174
      policies : access OpenSSL.Low_Level.asn1_h.stack_st_ASN1_OBJECT;  -- openssl/x509_vfy.h:175
   end record;
   pragma Convention (C_Pass_By_Copy, X509_VERIFY_PARAM_st);  -- openssl/x509_vfy.h:166

   subtype X509_VERIFY_PARAM is X509_VERIFY_PARAM_st;

   type stack_st_X509_VERIFY_PARAM is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509_vfy.h:178
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_VERIFY_PARAM);  -- openssl/x509_vfy.h:178

   type x509_store_st is record
      cache : aliased int;  -- openssl/x509_vfy.h:186
      objs : access stack_st_X509_OBJECT;  -- openssl/x509_vfy.h:187
      get_cert_methods : access stack_st_X509_LOOKUP;  -- openssl/x509_vfy.h:190
      param : access X509_VERIFY_PARAM;  -- openssl/x509_vfy.h:192
      verify : access function (arg1 : System.Address) return int;  -- openssl/x509_vfy.h:195
      verify_cb : access function (arg1 : int; arg2 : System.Address) return int;  -- openssl/x509_vfy.h:196
      get_issuer : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509_vfy.h:197
      check_issued : access function
           (arg1 : System.Address;
            arg2 : access OpenSSL.Low_Level.x509_h.x509_st;
            arg3 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509_vfy.h:198
      check_revocation : access function (arg1 : System.Address) return int;  -- openssl/x509_vfy.h:199
      get_crl : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509_vfy.h:200
      check_crl : access function (arg1 : System.Address; arg2 : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509_vfy.h:201
      cert_crl : access function
           (arg1 : System.Address;
            arg2 : access OpenSSL.Low_Level.x509_h.X509_crl_st;
            arg3 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509_vfy.h:202
      lookup_certs : access function (arg1 : System.Address; arg2 : access OpenSSL.Low_Level.x509_h.X509_name_st) return access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/x509_vfy.h:203
      lookup_crls : access function (arg1 : System.Address; arg2 : access OpenSSL.Low_Level.x509_h.X509_name_st) return access OpenSSL.Low_Level.x509_h.stack_st_X509_CRL;  -- openssl/x509_vfy.h:204
      cleanup : access function (arg1 : System.Address) return int;  -- openssl/x509_vfy.h:205
      ex_data : aliased OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;  -- openssl/x509_vfy.h:207
      references : aliased int;  -- openssl/x509_vfy.h:208
   end record;
   pragma Convention (C_Pass_By_Copy, x509_store_st);  -- openssl/x509_vfy.h:183

   function X509_STORE_set_depth (store : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st; depth : int) return int;  -- openssl/x509_vfy.h:211
   pragma Import (C, X509_STORE_set_depth, "X509_STORE_set_depth");

   type x509_lookup_st is record
      init : aliased int;  -- openssl/x509_vfy.h:219
      skip : aliased int;  -- openssl/x509_vfy.h:220
      method : access X509_LOOKUP_METHOD;  -- openssl/x509_vfy.h:221
      method_data : Interfaces.C.Strings.chars_ptr;  -- openssl/x509_vfy.h:222
      store_ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;  -- openssl/x509_vfy.h:224
   end record;
   pragma Convention (C_Pass_By_Copy, x509_lookup_st);  -- openssl/x509_vfy.h:217

   type x509_store_ctx_st is record
      ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;  -- openssl/x509_vfy.h:232
      current_method : aliased int;  -- openssl/x509_vfy.h:233
      cert : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509_vfy.h:236
      untrusted : access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/x509_vfy.h:237
      crls : access OpenSSL.Low_Level.x509_h.stack_st_X509_CRL;  -- openssl/x509_vfy.h:238
      param : access X509_VERIFY_PARAM;  -- openssl/x509_vfy.h:240
      other_ctx : System.Address;  -- openssl/x509_vfy.h:241
      verify : access function (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return int;  -- openssl/x509_vfy.h:244
      verify_cb : access function (arg1 : int; arg2 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return int;  -- openssl/x509_vfy.h:245
      get_issuer : access function
           (arg1 : System.Address;
            arg2 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;
            arg3 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509_vfy.h:246
      check_issued : access function
           (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;
            arg2 : access OpenSSL.Low_Level.x509_h.x509_st;
            arg3 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509_vfy.h:247
      check_revocation : access function (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return int;  -- openssl/x509_vfy.h:248
      get_crl : access function
           (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;
            arg2 : System.Address;
            arg3 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509_vfy.h:249
      check_crl : access function (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; arg2 : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509_vfy.h:250
      cert_crl : access function
           (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;
            arg2 : access OpenSSL.Low_Level.x509_h.X509_crl_st;
            arg3 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509_vfy.h:251
      check_policy : access function (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return int;  -- openssl/x509_vfy.h:252
      lookup_certs : access function (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; arg2 : access OpenSSL.Low_Level.x509_h.X509_name_st) return access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/x509_vfy.h:253
      lookup_crls : access function (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; arg2 : access OpenSSL.Low_Level.x509_h.X509_name_st) return access OpenSSL.Low_Level.x509_h.stack_st_X509_CRL;  -- openssl/x509_vfy.h:254
      cleanup : access function (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return int;  -- openssl/x509_vfy.h:255
      valid : aliased int;  -- openssl/x509_vfy.h:258
      last_untrusted : aliased int;  -- openssl/x509_vfy.h:259
      chain : access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/x509_vfy.h:260
      tree : System.Address;  -- openssl/x509_vfy.h:261
      explicit_policy : aliased int;  -- openssl/x509_vfy.h:263
      error_depth : aliased int;  -- openssl/x509_vfy.h:266
      error : aliased int;  -- openssl/x509_vfy.h:267
      current_cert : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509_vfy.h:268
      current_issuer : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509_vfy.h:269
      current_crl : access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/x509_vfy.h:270
      current_crl_score : aliased int;  -- openssl/x509_vfy.h:272
      current_reasons : aliased unsigned;  -- openssl/x509_vfy.h:273
      parent : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;  -- openssl/x509_vfy.h:275
      ex_data : aliased OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;  -- openssl/x509_vfy.h:277
   end record;
   pragma Convention (C_Pass_By_Copy, x509_store_ctx_st);  -- openssl/x509_vfy.h:230

   procedure X509_STORE_CTX_set_depth (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; depth : int);  -- openssl/x509_vfy.h:280
   pragma Import (C, X509_STORE_CTX_set_depth, "X509_STORE_CTX_set_depth");

   function X509_OBJECT_idx_by_subject
     (h : access stack_st_X509_OBJECT;
      c_type : int;
      name : access OpenSSL.Low_Level.x509_h.X509_name_st) return int;  -- openssl/x509_vfy.h:406
   pragma Import (C, X509_OBJECT_idx_by_subject, "X509_OBJECT_idx_by_subject");

   function X509_OBJECT_retrieve_by_subject
     (h : access stack_st_X509_OBJECT;
      c_type : int;
      name : access OpenSSL.Low_Level.x509_h.X509_name_st) return access X509_OBJECT;  -- openssl/x509_vfy.h:408
   pragma Import (C, X509_OBJECT_retrieve_by_subject, "X509_OBJECT_retrieve_by_subject");

   function X509_OBJECT_retrieve_match (h : access stack_st_X509_OBJECT; x : access X509_OBJECT) return access X509_OBJECT;  -- openssl/x509_vfy.h:409
   pragma Import (C, X509_OBJECT_retrieve_match, "X509_OBJECT_retrieve_match");

   procedure X509_OBJECT_up_ref_count (a : access X509_OBJECT);  -- openssl/x509_vfy.h:410
   pragma Import (C, X509_OBJECT_up_ref_count, "X509_OBJECT_up_ref_count");

   procedure X509_OBJECT_free_contents (a : access X509_OBJECT);  -- openssl/x509_vfy.h:411
   pragma Import (C, X509_OBJECT_free_contents, "X509_OBJECT_free_contents");

   function X509_STORE_new return access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;  -- openssl/x509_vfy.h:412
   pragma Import (C, X509_STORE_new, "X509_STORE_new");

   procedure X509_STORE_free (v : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st);  -- openssl/x509_vfy.h:413
   pragma Import (C, X509_STORE_free, "X509_STORE_free");

   function X509_STORE_get1_certs (st : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; nm : access OpenSSL.Low_Level.x509_h.X509_name_st) return access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/x509_vfy.h:415
   pragma Import (C, X509_STORE_get1_certs, "X509_STORE_get1_certs");

   function X509_STORE_get1_crls (st : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; nm : access OpenSSL.Low_Level.x509_h.X509_name_st) return access OpenSSL.Low_Level.x509_h.stack_st_X509_CRL;  -- openssl/x509_vfy.h:416
   pragma Import (C, X509_STORE_get1_crls, "X509_STORE_get1_crls");

   function X509_STORE_set_flags (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st; flags : unsigned_long) return int;  -- openssl/x509_vfy.h:417
   pragma Import (C, X509_STORE_set_flags, "X509_STORE_set_flags");

   function X509_STORE_set_purpose (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st; purpose : int) return int;  -- openssl/x509_vfy.h:418
   pragma Import (C, X509_STORE_set_purpose, "X509_STORE_set_purpose");

   function X509_STORE_set_trust (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st; trust : int) return int;  -- openssl/x509_vfy.h:419
   pragma Import (C, X509_STORE_set_trust, "X509_STORE_set_trust");

   function X509_STORE_set1_param (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st; pm : access X509_VERIFY_PARAM) return int;  -- openssl/x509_vfy.h:420
   pragma Import (C, X509_STORE_set1_param, "X509_STORE_set1_param");

   procedure X509_STORE_set_verify_cb (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st; verify_cb : access function (arg1 : int; arg2 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return int);  -- openssl/x509_vfy.h:422
   pragma Import (C, X509_STORE_set_verify_cb, "X509_STORE_set_verify_cb");

   function X509_STORE_CTX_new return access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;  -- openssl/x509_vfy.h:425
   pragma Import (C, X509_STORE_CTX_new, "X509_STORE_CTX_new");

   function X509_STORE_CTX_get1_issuer
     (issuer : System.Address;
      ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;
      x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509_vfy.h:427
   pragma Import (C, X509_STORE_CTX_get1_issuer, "X509_STORE_CTX_get1_issuer");

   procedure X509_STORE_CTX_free (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX);  -- openssl/x509_vfy.h:429
   pragma Import (C, X509_STORE_CTX_free, "X509_STORE_CTX_free");

   function X509_STORE_CTX_init
     (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;
      store : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;
      the_x509 : access OpenSSL.Low_Level.x509_h.x509_st;
      chain : access OpenSSL.Low_Level.x509_h.stack_st_X509) return int;  -- openssl/x509_vfy.h:430
   pragma Import (C, X509_STORE_CTX_init, "X509_STORE_CTX_init");

   procedure X509_STORE_CTX_trusted_stack (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; sk : access OpenSSL.Low_Level.x509_h.stack_st_X509);  -- openssl/x509_vfy.h:432
   pragma Import (C, X509_STORE_CTX_trusted_stack, "X509_STORE_CTX_trusted_stack");

   procedure X509_STORE_CTX_cleanup (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX);  -- openssl/x509_vfy.h:433
   pragma Import (C, X509_STORE_CTX_cleanup, "X509_STORE_CTX_cleanup");

   function X509_STORE_add_lookup (v : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st; m : access X509_LOOKUP_METHOD) return access X509_LOOKUP;  -- openssl/x509_vfy.h:435
   pragma Import (C, X509_STORE_add_lookup, "X509_STORE_add_lookup");

   function X509_LOOKUP_hash_dir return access X509_LOOKUP_METHOD;  -- openssl/x509_vfy.h:437
   pragma Import (C, X509_LOOKUP_hash_dir, "X509_LOOKUP_hash_dir");

   function X509_LOOKUP_file return access X509_LOOKUP_METHOD;  -- openssl/x509_vfy.h:438
   pragma Import (C, X509_LOOKUP_file, "X509_LOOKUP_file");

   function X509_STORE_add_cert (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st; x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509_vfy.h:440
   pragma Import (C, X509_STORE_add_cert, "X509_STORE_add_cert");

   function X509_STORE_add_crl (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st; x : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509_vfy.h:441
   pragma Import (C, X509_STORE_add_crl, "X509_STORE_add_crl");

   function X509_STORE_get_by_subject
     (vs : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;
      c_type : int;
      name : access OpenSSL.Low_Level.x509_h.X509_name_st;
      ret : access X509_OBJECT) return int;  -- openssl/x509_vfy.h:443
   pragma Import (C, X509_STORE_get_by_subject, "X509_STORE_get_by_subject");

   function X509_LOOKUP_ctrl
     (ctx : access X509_LOOKUP;
      cmd : int;
      argc : Interfaces.C.Strings.chars_ptr;
      argl : long;
      ret : System.Address) return int;  -- openssl/x509_vfy.h:446
   pragma Import (C, X509_LOOKUP_ctrl, "X509_LOOKUP_ctrl");

   function X509_load_cert_file
     (ctx : access X509_LOOKUP;
      file : Interfaces.C.Strings.chars_ptr;
      c_type : int) return int;  -- openssl/x509_vfy.h:450
   pragma Import (C, X509_load_cert_file, "X509_load_cert_file");

   function X509_load_crl_file
     (ctx : access X509_LOOKUP;
      file : Interfaces.C.Strings.chars_ptr;
      c_type : int) return int;  -- openssl/x509_vfy.h:451
   pragma Import (C, X509_load_crl_file, "X509_load_crl_file");

   function X509_load_cert_crl_file
     (ctx : access X509_LOOKUP;
      file : Interfaces.C.Strings.chars_ptr;
      c_type : int) return int;  -- openssl/x509_vfy.h:452
   pragma Import (C, X509_load_cert_crl_file, "X509_load_cert_crl_file");

   function X509_LOOKUP_new (method : access X509_LOOKUP_METHOD) return access X509_LOOKUP;  -- openssl/x509_vfy.h:456
   pragma Import (C, X509_LOOKUP_new, "X509_LOOKUP_new");

   procedure X509_LOOKUP_free (ctx : access X509_LOOKUP);  -- openssl/x509_vfy.h:457
   pragma Import (C, X509_LOOKUP_free, "X509_LOOKUP_free");

   function X509_LOOKUP_init (ctx : access X509_LOOKUP) return int;  -- openssl/x509_vfy.h:458
   pragma Import (C, X509_LOOKUP_init, "X509_LOOKUP_init");

   function X509_LOOKUP_by_subject
     (ctx : access X509_LOOKUP;
      c_type : int;
      name : access OpenSSL.Low_Level.x509_h.X509_name_st;
      ret : access X509_OBJECT) return int;  -- openssl/x509_vfy.h:459
   pragma Import (C, X509_LOOKUP_by_subject, "X509_LOOKUP_by_subject");

   function X509_LOOKUP_by_issuer_serial
     (ctx : access X509_LOOKUP;
      c_type : int;
      name : access OpenSSL.Low_Level.x509_h.X509_name_st;
      serial : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      ret : access X509_OBJECT) return int;  -- openssl/x509_vfy.h:461
   pragma Import (C, X509_LOOKUP_by_issuer_serial, "X509_LOOKUP_by_issuer_serial");

   function X509_LOOKUP_by_fingerprint
     (ctx : access X509_LOOKUP;
      c_type : int;
      bytes : access unsigned_char;
      len : int;
      ret : access X509_OBJECT) return int;  -- openssl/x509_vfy.h:463
   pragma Import (C, X509_LOOKUP_by_fingerprint, "X509_LOOKUP_by_fingerprint");

   function X509_LOOKUP_by_alias
     (ctx : access X509_LOOKUP;
      c_type : int;
      str : Interfaces.C.Strings.chars_ptr;
      len : int;
      ret : access X509_OBJECT) return int;  -- openssl/x509_vfy.h:465
   pragma Import (C, X509_LOOKUP_by_alias, "X509_LOOKUP_by_alias");

   function X509_LOOKUP_shutdown (ctx : access X509_LOOKUP) return int;  -- openssl/x509_vfy.h:467
   pragma Import (C, X509_LOOKUP_shutdown, "X509_LOOKUP_shutdown");

   function X509_STORE_load_locations
     (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;
      file : Interfaces.C.Strings.chars_ptr;
      dir : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/x509_vfy.h:470
   pragma Import (C, X509_STORE_load_locations, "X509_STORE_load_locations");

   function X509_STORE_set_default_paths (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st) return int;  -- openssl/x509_vfy.h:472
   pragma Import (C, X509_STORE_set_default_paths, "X509_STORE_set_default_paths");

   function X509_STORE_CTX_get_ex_new_index
     (argl : long;
      argp : System.Address;
      new_func : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      dup_func : access function
        (arg1 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg2 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg3 : System.Address;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      free_func : access procedure
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address)) return int;  -- openssl/x509_vfy.h:475
   pragma Import (C, X509_STORE_CTX_get_ex_new_index, "X509_STORE_CTX_get_ex_new_index");

   function X509_STORE_CTX_set_ex_data
     (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;
      idx : int;
      data : System.Address) return int;  -- openssl/x509_vfy.h:477
   pragma Import (C, X509_STORE_CTX_set_ex_data, "X509_STORE_CTX_set_ex_data");

   function X509_STORE_CTX_get_ex_data (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; idx : int) return System.Address;  -- openssl/x509_vfy.h:478
   pragma Import (C, X509_STORE_CTX_get_ex_data, "X509_STORE_CTX_get_ex_data");

   function X509_STORE_CTX_get_error (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return int;  -- openssl/x509_vfy.h:479
   pragma Import (C, X509_STORE_CTX_get_error, "X509_STORE_CTX_get_error");

   procedure X509_STORE_CTX_set_error (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; s : int);  -- openssl/x509_vfy.h:480
   pragma Import (C, X509_STORE_CTX_set_error, "X509_STORE_CTX_set_error");

   function X509_STORE_CTX_get_error_depth (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return int;  -- openssl/x509_vfy.h:481
   pragma Import (C, X509_STORE_CTX_get_error_depth, "X509_STORE_CTX_get_error_depth");

   function X509_STORE_CTX_get_current_cert (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509_vfy.h:482
   pragma Import (C, X509_STORE_CTX_get_current_cert, "X509_STORE_CTX_get_current_cert");

   function X509_STORE_CTX_get0_current_issuer (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509_vfy.h:483
   pragma Import (C, X509_STORE_CTX_get0_current_issuer, "X509_STORE_CTX_get0_current_issuer");

   function X509_STORE_CTX_get0_current_crl (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/x509_vfy.h:484
   pragma Import (C, X509_STORE_CTX_get0_current_crl, "X509_STORE_CTX_get0_current_crl");

   function X509_STORE_CTX_get0_parent_ctx (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;  -- openssl/x509_vfy.h:485
   pragma Import (C, X509_STORE_CTX_get0_parent_ctx, "X509_STORE_CTX_get0_parent_ctx");

   function X509_STORE_CTX_get_chain (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/x509_vfy.h:486
   pragma Import (C, X509_STORE_CTX_get_chain, "X509_STORE_CTX_get_chain");

   function X509_STORE_CTX_get1_chain (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/x509_vfy.h:487
   pragma Import (C, X509_STORE_CTX_get1_chain, "X509_STORE_CTX_get1_chain");

   procedure X509_STORE_CTX_set_cert (c : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; x : access OpenSSL.Low_Level.x509_h.x509_st);  -- openssl/x509_vfy.h:488
   pragma Import (C, X509_STORE_CTX_set_cert, "X509_STORE_CTX_set_cert");

   procedure X509_STORE_CTX_set_chain (c : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; sk : access OpenSSL.Low_Level.x509_h.stack_st_X509);  -- openssl/x509_vfy.h:489
   pragma Import (C, X509_STORE_CTX_set_chain, "X509_STORE_CTX_set_chain");

   procedure X509_STORE_CTX_set0_crls (c : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; sk : access OpenSSL.Low_Level.x509_h.stack_st_X509_CRL);  -- openssl/x509_vfy.h:490
   pragma Import (C, X509_STORE_CTX_set0_crls, "X509_STORE_CTX_set0_crls");

   function X509_STORE_CTX_set_purpose (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; purpose : int) return int;  -- openssl/x509_vfy.h:491
   pragma Import (C, X509_STORE_CTX_set_purpose, "X509_STORE_CTX_set_purpose");

   function X509_STORE_CTX_set_trust (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; trust : int) return int;  -- openssl/x509_vfy.h:492
   pragma Import (C, X509_STORE_CTX_set_trust, "X509_STORE_CTX_set_trust");

   function X509_STORE_CTX_purpose_inherit
     (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;
      def_purpose : int;
      purpose : int;
      trust : int) return int;  -- openssl/x509_vfy.h:493
   pragma Import (C, X509_STORE_CTX_purpose_inherit, "X509_STORE_CTX_purpose_inherit");

   procedure X509_STORE_CTX_set_flags (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; flags : unsigned_long);  -- openssl/x509_vfy.h:495
   pragma Import (C, X509_STORE_CTX_set_flags, "X509_STORE_CTX_set_flags");

   procedure X509_STORE_CTX_set_time
     (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX;
      flags : unsigned_long;
      t : time_h.time_t);  -- openssl/x509_vfy.h:496
   pragma Import (C, X509_STORE_CTX_set_time, "X509_STORE_CTX_set_time");

   procedure X509_STORE_CTX_set_verify_cb (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; verify_cb : access function (arg1 : int; arg2 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return int);  -- openssl/x509_vfy.h:498
   pragma Import (C, X509_STORE_CTX_set_verify_cb, "X509_STORE_CTX_set_verify_cb");

   function X509_STORE_CTX_get0_policy_tree (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return System.Address;  -- openssl/x509_vfy.h:501
   pragma Import (C, X509_STORE_CTX_get0_policy_tree, "X509_STORE_CTX_get0_policy_tree");

   function X509_STORE_CTX_get_explicit_policy (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return int;  -- openssl/x509_vfy.h:502
   pragma Import (C, X509_STORE_CTX_get_explicit_policy, "X509_STORE_CTX_get_explicit_policy");

   function X509_STORE_CTX_get0_param (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX) return access X509_VERIFY_PARAM;  -- openssl/x509_vfy.h:504
   pragma Import (C, X509_STORE_CTX_get0_param, "X509_STORE_CTX_get0_param");

   procedure X509_STORE_CTX_set0_param (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; param : access X509_VERIFY_PARAM);  -- openssl/x509_vfy.h:505
   pragma Import (C, X509_STORE_CTX_set0_param, "X509_STORE_CTX_set0_param");

   function X509_STORE_CTX_set_default (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX; name : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/x509_vfy.h:506
   pragma Import (C, X509_STORE_CTX_set_default, "X509_STORE_CTX_set_default");

   function X509_VERIFY_PARAM_new return access X509_VERIFY_PARAM;  -- openssl/x509_vfy.h:510
   pragma Import (C, X509_VERIFY_PARAM_new, "X509_VERIFY_PARAM_new");

   procedure X509_VERIFY_PARAM_free (param : access X509_VERIFY_PARAM);  -- openssl/x509_vfy.h:511
   pragma Import (C, X509_VERIFY_PARAM_free, "X509_VERIFY_PARAM_free");

   function X509_VERIFY_PARAM_inherit (to : access X509_VERIFY_PARAM; from : System.Address) return int;  -- openssl/x509_vfy.h:512
   pragma Import (C, X509_VERIFY_PARAM_inherit, "X509_VERIFY_PARAM_inherit");

   function X509_VERIFY_PARAM_set1 (to : access X509_VERIFY_PARAM; from : System.Address) return int;  -- openssl/x509_vfy.h:514
   pragma Import (C, X509_VERIFY_PARAM_set1, "X509_VERIFY_PARAM_set1");

   function X509_VERIFY_PARAM_set1_name (param : access X509_VERIFY_PARAM; name : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/x509_vfy.h:516
   pragma Import (C, X509_VERIFY_PARAM_set1_name, "X509_VERIFY_PARAM_set1_name");

   function X509_VERIFY_PARAM_set_flags (param : access X509_VERIFY_PARAM; flags : unsigned_long) return int;  -- openssl/x509_vfy.h:517
   pragma Import (C, X509_VERIFY_PARAM_set_flags, "X509_VERIFY_PARAM_set_flags");

   function X509_VERIFY_PARAM_clear_flags (param : access X509_VERIFY_PARAM; flags : unsigned_long) return int;  -- openssl/x509_vfy.h:518
   pragma Import (C, X509_VERIFY_PARAM_clear_flags, "X509_VERIFY_PARAM_clear_flags");

   function X509_VERIFY_PARAM_get_flags (param : access X509_VERIFY_PARAM) return unsigned_long;  -- openssl/x509_vfy.h:520
   pragma Import (C, X509_VERIFY_PARAM_get_flags, "X509_VERIFY_PARAM_get_flags");

   function X509_VERIFY_PARAM_set_purpose (param : access X509_VERIFY_PARAM; purpose : int) return int;  -- openssl/x509_vfy.h:521
   pragma Import (C, X509_VERIFY_PARAM_set_purpose, "X509_VERIFY_PARAM_set_purpose");

   function X509_VERIFY_PARAM_set_trust (param : access X509_VERIFY_PARAM; trust : int) return int;  -- openssl/x509_vfy.h:522
   pragma Import (C, X509_VERIFY_PARAM_set_trust, "X509_VERIFY_PARAM_set_trust");

   procedure X509_VERIFY_PARAM_set_depth (param : access X509_VERIFY_PARAM; depth : int);  -- openssl/x509_vfy.h:523
   pragma Import (C, X509_VERIFY_PARAM_set_depth, "X509_VERIFY_PARAM_set_depth");

   procedure X509_VERIFY_PARAM_set_time (param : access X509_VERIFY_PARAM; t : time_h.time_t);  -- openssl/x509_vfy.h:524
   pragma Import (C, X509_VERIFY_PARAM_set_time, "X509_VERIFY_PARAM_set_time");

   function X509_VERIFY_PARAM_add0_policy (param : access X509_VERIFY_PARAM; policy : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT) return int;  -- openssl/x509_vfy.h:525
   pragma Import (C, X509_VERIFY_PARAM_add0_policy, "X509_VERIFY_PARAM_add0_policy");

   function X509_VERIFY_PARAM_set1_policies (param : access X509_VERIFY_PARAM; policies : access OpenSSL.Low_Level.asn1_h.stack_st_ASN1_OBJECT) return int;  -- openssl/x509_vfy.h:527
   pragma Import (C, X509_VERIFY_PARAM_set1_policies, "X509_VERIFY_PARAM_set1_policies");

   function X509_VERIFY_PARAM_get_depth (param : System.Address) return int;  -- openssl/x509_vfy.h:529
   pragma Import (C, X509_VERIFY_PARAM_get_depth, "X509_VERIFY_PARAM_get_depth");

   function X509_VERIFY_PARAM_add0_table (param : access X509_VERIFY_PARAM) return int;  -- openssl/x509_vfy.h:531
   pragma Import (C, X509_VERIFY_PARAM_add0_table, "X509_VERIFY_PARAM_add0_table");

   function X509_VERIFY_PARAM_lookup (name : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/x509_vfy.h:532
   pragma Import (C, X509_VERIFY_PARAM_lookup, "X509_VERIFY_PARAM_lookup");

   procedure X509_VERIFY_PARAM_table_cleanup;  -- openssl/x509_vfy.h:533
   pragma Import (C, X509_VERIFY_PARAM_table_cleanup, "X509_VERIFY_PARAM_table_cleanup");

   function X509_policy_check
     (ptree : System.Address;
      pexplicit_policy : access int;
      certs : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      policy_oids : access OpenSSL.Low_Level.asn1_h.stack_st_ASN1_OBJECT;
      flags : unsigned) return int;  -- openssl/x509_vfy.h:535
   pragma Import (C, X509_policy_check, "X509_policy_check");

   procedure X509_policy_tree_free (tree : System.Address);  -- openssl/x509_vfy.h:540
   pragma Import (C, X509_policy_tree_free, "X509_policy_tree_free");

   function X509_policy_tree_level_count (tree : System.Address) return int;  -- openssl/x509_vfy.h:542
   pragma Import (C, X509_policy_tree_level_count, "X509_policy_tree_level_count");

   function X509_policy_tree_get0_level (tree : System.Address; i : int) return System.Address;  -- openssl/x509_vfy.h:544
   pragma Import (C, X509_policy_tree_get0_level, "X509_policy_tree_get0_level");

   function X509_policy_tree_get0_policies (tree : System.Address) return access OpenSSL.Low_Level.x509v3_h.stack_st_X509_POLICY_NODE;  -- openssl/x509_vfy.h:547
   pragma Import (C, X509_policy_tree_get0_policies, "X509_policy_tree_get0_policies");

   function X509_policy_tree_get0_user_policies (tree : System.Address) return access OpenSSL.Low_Level.x509v3_h.stack_st_X509_POLICY_NODE;  -- openssl/x509_vfy.h:550
   pragma Import (C, X509_policy_tree_get0_user_policies, "X509_policy_tree_get0_user_policies");

   function X509_policy_level_node_count (level : System.Address) return int;  -- openssl/x509_vfy.h:552
   pragma Import (C, X509_policy_level_node_count, "X509_policy_level_node_count");

   function X509_policy_level_get0_node (level : System.Address; i : int) return System.Address;  -- openssl/x509_vfy.h:554
   pragma Import (C, X509_policy_level_get0_node, "X509_policy_level_get0_node");

   function X509_policy_node_get0_policy (node : System.Address) return access constant OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/x509_vfy.h:556
   pragma Import (C, X509_policy_node_get0_policy, "X509_policy_node_get0_policy");

   function X509_policy_node_get0_qualifiers (node : System.Address) return access OpenSSL.Low_Level.x509v3_h.stack_st_POLICYQUALINFO;  -- openssl/x509_vfy.h:559
   pragma Import (C, X509_policy_node_get0_qualifiers, "X509_policy_node_get0_qualifiers");

   function X509_policy_node_get0_parent (node : System.Address) return System.Address;  -- openssl/x509_vfy.h:561
   pragma Import (C, X509_policy_node_get0_parent, "X509_policy_node_get0_parent");

end OpenSSL.Low_Level.x509_vfy_h;
