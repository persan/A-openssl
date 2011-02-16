with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
--  limited --  with OpenSSL.Low_Level.ossl_typ_h;
limited with OpenSSL.Low_Level.x509_h;
--  with stddef_h;

package OpenSSL.Low_Level.engine_h is

   --  unsupported macro: ENGINE_METHOD_RSA (unsigned int)0x0001
   --  unsupported macro: ENGINE_METHOD_DSA (unsigned int)0x0002
   --  unsupported macro: ENGINE_METHOD_DH (unsigned int)0x0004
   --  unsupported macro: ENGINE_METHOD_RAND (unsigned int)0x0008
   --  unsupported macro: ENGINE_METHOD_ECDH (unsigned int)0x0010
   --  unsupported macro: ENGINE_METHOD_ECDSA (unsigned int)0x0020
   --  unsupported macro: ENGINE_METHOD_CIPHERS (unsigned int)0x0040
   --  unsupported macro: ENGINE_METHOD_DIGESTS (unsigned int)0x0080
   --  unsupported macro: ENGINE_METHOD_STORE (unsigned int)0x0100
   --  unsupported macro: ENGINE_METHOD_PKEY_METHS (unsigned int)0x0200
   --  unsupported macro: ENGINE_METHOD_PKEY_ASN1_METHS (unsigned int)0x0400
   --  unsupported macro: ENGINE_METHOD_ALL (unsigned int)0xFFFF
   --  unsupported macro: ENGINE_METHOD_NONE (unsigned int)0x0000
   --  unsupported macro: ENGINE_TABLE_FLAG_NOINIT (unsigned int)0x0001
   --  unsupported macro: ENGINE_FLAGS_MANUAL_CMD_CTRL (int)0x0002
   --  unsupported macro: ENGINE_FLAGS_BY_ID_COPY (int)0x0004
   --  unsupported macro: ENGINE_CMD_FLAG_NUMERIC (unsigned int)0x0001
   --  unsupported macro: ENGINE_CMD_FLAG_STRING (unsigned int)0x0002
   --  unsupported macro: ENGINE_CMD_FLAG_NO_INPUT (unsigned int)0x0004
   --  unsupported macro: ENGINE_CMD_FLAG_INTERNAL (unsigned int)0x0008

   ENGINE_CTRL_SET_LOGSTREAM : constant := 1;  --  openssl/engine.h:174
   ENGINE_CTRL_SET_PASSWORD_CALLBACK : constant := 2;  --  openssl/engine.h:175
   ENGINE_CTRL_HUP : constant := 3;  --  openssl/engine.h:176

   ENGINE_CTRL_SET_USER_INTERFACE : constant := 4;  --  openssl/engine.h:178
   ENGINE_CTRL_SET_CALLBACK_DATA : constant := 5;  --  openssl/engine.h:179

   ENGINE_CTRL_LOAD_CONFIGURATION : constant := 6;  --  openssl/engine.h:183

   ENGINE_CTRL_LOAD_SECTION : constant := 7;  --  openssl/engine.h:186

   ENGINE_CTRL_HAS_CTRL_FUNCTION : constant := 10;  --  openssl/engine.h:207

   ENGINE_CTRL_GET_FIRST_CMD_TYPE : constant := 11;  --  openssl/engine.h:210

   ENGINE_CTRL_GET_NEXT_CMD_TYPE : constant := 12;  --  openssl/engine.h:213

   ENGINE_CTRL_GET_CMD_FROM_NAME : constant := 13;  --  openssl/engine.h:216

   ENGINE_CTRL_GET_NAME_LEN_FROM_CMD : constant := 14;  --  openssl/engine.h:223
   ENGINE_CTRL_GET_NAME_FROM_CMD : constant := 15;  --  openssl/engine.h:224

   ENGINE_CTRL_GET_DESC_LEN_FROM_CMD : constant := 16;  --  openssl/engine.h:226
   ENGINE_CTRL_GET_DESC_FROM_CMD : constant := 17;  --  openssl/engine.h:227

   ENGINE_CTRL_GET_CMD_FLAGS : constant := 18;  --  openssl/engine.h:231

   ENGINE_CMD_BASE : constant := 200;  --  openssl/engine.h:235

   ENGINE_CTRL_CHIL_SET_FORKCHECK : constant := 100;  --  openssl/engine.h:244

   ENGINE_CTRL_CHIL_NO_LOCKING : constant := 101;  --  openssl/engine.h:249
   --  unsupported macro: OSSL_DYNAMIC_VERSION (unsigned long)0x00020000
   --  unsupported macro: OSSL_DYNAMIC_OLDEST (unsigned long)0x00020000
   --  arg-macro: procedure IMPLEMENT_DYNAMIC_CHECK_FN ()
   --    OPENSSL_EXPORT unsigned long v_check(unsigned long v); OPENSSL_EXPORT unsigned long v_check(unsigned long v) { if(v >= OSSL_DYNAMIC_OLDEST) return OSSL_DYNAMIC_VERSION; return 0; }
   --  arg-macro: procedure IMPLEMENT_DYNAMIC_BIND_FN (fn)
   --    OPENSSL_EXPORT int bind_engine(ENGINE *e, const char *id, const dynamic_fns *fns); OPENSSL_EXPORT int bind_engine(ENGINE *e, const char *id, const dynamic_fns *fns) { if(ENGINE_get_static_state() = fns.static_state) goto skip_cbs; if(notCRYPTO_set_mem_functions(fns.mem_fns.malloc_cb, fns.mem_fns.realloc_cb, fns.mem_fns.free_cb)) return 0; CRYPTO_set_locking_callback(fns.lock_fns.lock_locking_cb); CRYPTO_set_add_lock_callback(fns.lock_fns.lock_add_lock_cb); CRYPTO_set_dynlock_create_callback(fns.lock_fns.dynlock_create_cb); CRYPTO_set_dynlock_lock_callback(fns.lock_fns.dynlock_lock_cb); CRYPTO_set_dynlock_destroy_callback(fns.lock_fns.dynlock_destroy_cb); if(notCRYPTO_set_ex_data_implementation(fns.ex_data_fns)) return 0; if(notERR_set_implementation(fns.err_fns)) return 0; skip_cbs: if(notfn(e,id)) return 0; return 1; }

   ENGINE_F_DYNAMIC_CTRL : constant := 180;  --  openssl/engine.h:742
   ENGINE_F_DYNAMIC_GET_DATA_CTX : constant := 181;  --  openssl/engine.h:743
   ENGINE_F_DYNAMIC_LOAD : constant := 182;  --  openssl/engine.h:744
   ENGINE_F_DYNAMIC_SET_DATA_CTX : constant := 183;  --  openssl/engine.h:745
   ENGINE_F_ENGINE_ADD : constant := 105;  --  openssl/engine.h:746
   ENGINE_F_ENGINE_BY_ID : constant := 106;  --  openssl/engine.h:747
   ENGINE_F_ENGINE_CMD_IS_EXECUTABLE : constant := 170;  --  openssl/engine.h:748
   ENGINE_F_ENGINE_CTRL : constant := 142;  --  openssl/engine.h:749
   ENGINE_F_ENGINE_CTRL_CMD : constant := 178;  --  openssl/engine.h:750
   ENGINE_F_ENGINE_CTRL_CMD_STRING : constant := 171;  --  openssl/engine.h:751
   ENGINE_F_ENGINE_FINISH : constant := 107;  --  openssl/engine.h:752
   ENGINE_F_ENGINE_FREE_UTIL : constant := 108;  --  openssl/engine.h:753
   ENGINE_F_ENGINE_GET_CIPHER : constant := 185;  --  openssl/engine.h:754
   ENGINE_F_ENGINE_GET_DEFAULT_TYPE : constant := 177;  --  openssl/engine.h:755
   ENGINE_F_ENGINE_GET_DIGEST : constant := 186;  --  openssl/engine.h:756
   ENGINE_F_ENGINE_GET_NEXT : constant := 115;  --  openssl/engine.h:757
   ENGINE_F_ENGINE_GET_PKEY_ASN1_METH : constant := 193;  --  openssl/engine.h:758
   ENGINE_F_ENGINE_GET_PKEY_METH : constant := 192;  --  openssl/engine.h:759
   ENGINE_F_ENGINE_GET_PREV : constant := 116;  --  openssl/engine.h:760
   ENGINE_F_ENGINE_INIT : constant := 119;  --  openssl/engine.h:761
   ENGINE_F_ENGINE_LIST_ADD : constant := 120;  --  openssl/engine.h:762
   ENGINE_F_ENGINE_LIST_REMOVE : constant := 121;  --  openssl/engine.h:763
   ENGINE_F_ENGINE_LOAD_PRIVATE_KEY : constant := 150;  --  openssl/engine.h:764
   ENGINE_F_ENGINE_LOAD_PUBLIC_KEY : constant := 151;  --  openssl/engine.h:765
   ENGINE_F_ENGINE_LOAD_SSL_CLIENT_CERT : constant := 194;  --  openssl/engine.h:766
   ENGINE_F_ENGINE_NEW : constant := 122;  --  openssl/engine.h:767
   ENGINE_F_ENGINE_REMOVE : constant := 123;  --  openssl/engine.h:768
   ENGINE_F_ENGINE_SET_DEFAULT_STRING : constant := 189;  --  openssl/engine.h:769
   ENGINE_F_ENGINE_SET_DEFAULT_TYPE : constant := 126;  --  openssl/engine.h:770
   ENGINE_F_ENGINE_SET_ID : constant := 129;  --  openssl/engine.h:771
   ENGINE_F_ENGINE_SET_NAME : constant := 130;  --  openssl/engine.h:772
   ENGINE_F_ENGINE_TABLE_REGISTER : constant := 184;  --  openssl/engine.h:773
   ENGINE_F_ENGINE_UNLOAD_KEY : constant := 152;  --  openssl/engine.h:774
   ENGINE_F_ENGINE_UNLOCKED_FINISH : constant := 191;  --  openssl/engine.h:775
   ENGINE_F_ENGINE_UP_REF : constant := 190;  --  openssl/engine.h:776
   ENGINE_F_INT_CTRL_HELPER : constant := 172;  --  openssl/engine.h:777
   ENGINE_F_INT_ENGINE_CONFIGURE : constant := 188;  --  openssl/engine.h:778
   ENGINE_F_INT_ENGINE_MODULE_INIT : constant := 187;  --  openssl/engine.h:779
   ENGINE_F_LOG_MESSAGE : constant := 141;  --  openssl/engine.h:780

   ENGINE_R_ALREADY_LOADED : constant := 100;  --  openssl/engine.h:783
   ENGINE_R_ARGUMENT_IS_NOT_A_NUMBER : constant := 133;  --  openssl/engine.h:784
   ENGINE_R_CMD_NOT_EXECUTABLE : constant := 134;  --  openssl/engine.h:785
   ENGINE_R_COMMAND_TAKES_INPUT : constant := 135;  --  openssl/engine.h:786
   ENGINE_R_COMMAND_TAKES_NO_INPUT : constant := 136;  --  openssl/engine.h:787
   ENGINE_R_CONFLICTING_ENGINE_ID : constant := 103;  --  openssl/engine.h:788
   ENGINE_R_CTRL_COMMAND_NOT_IMPLEMENTED : constant := 119;  --  openssl/engine.h:789
   ENGINE_R_DH_NOT_IMPLEMENTED : constant := 139;  --  openssl/engine.h:790
   ENGINE_R_DSA_NOT_IMPLEMENTED : constant := 140;  --  openssl/engine.h:791
   ENGINE_R_DSO_FAILURE : constant := 104;  --  openssl/engine.h:792
   ENGINE_R_DSO_NOT_FOUND : constant := 132;  --  openssl/engine.h:793
   ENGINE_R_ENGINES_SECTION_ERROR : constant := 148;  --  openssl/engine.h:794
   ENGINE_R_ENGINE_CONFIGURATION_ERROR : constant := 102;  --  openssl/engine.h:795
   ENGINE_R_ENGINE_IS_NOT_IN_LIST : constant := 105;  --  openssl/engine.h:796
   ENGINE_R_ENGINE_SECTION_ERROR : constant := 149;  --  openssl/engine.h:797
   ENGINE_R_FAILED_LOADING_PRIVATE_KEY : constant := 128;  --  openssl/engine.h:798
   ENGINE_R_FAILED_LOADING_PUBLIC_KEY : constant := 129;  --  openssl/engine.h:799
   ENGINE_R_FINISH_FAILED : constant := 106;  --  openssl/engine.h:800
   ENGINE_R_GET_HANDLE_FAILED : constant := 107;  --  openssl/engine.h:801
   ENGINE_R_ID_OR_NAME_MISSING : constant := 108;  --  openssl/engine.h:802
   ENGINE_R_INIT_FAILED : constant := 109;  --  openssl/engine.h:803
   ENGINE_R_INTERNAL_LIST_ERROR : constant := 110;  --  openssl/engine.h:804
   ENGINE_R_INVALID_ARGUMENT : constant := 143;  --  openssl/engine.h:805
   ENGINE_R_INVALID_CMD_NAME : constant := 137;  --  openssl/engine.h:806
   ENGINE_R_INVALID_CMD_NUMBER : constant := 138;  --  openssl/engine.h:807
   ENGINE_R_INVALID_INIT_VALUE : constant := 151;  --  openssl/engine.h:808
   ENGINE_R_INVALID_STRING : constant := 150;  --  openssl/engine.h:809
   ENGINE_R_NOT_INITIALISED : constant := 117;  --  openssl/engine.h:810
   ENGINE_R_NOT_LOADED : constant := 112;  --  openssl/engine.h:811
   ENGINE_R_NO_CONTROL_FUNCTION : constant := 120;  --  openssl/engine.h:812
   ENGINE_R_NO_INDEX : constant := 144;  --  openssl/engine.h:813
   ENGINE_R_NO_LOAD_FUNCTION : constant := 125;  --  openssl/engine.h:814
   ENGINE_R_NO_REFERENCE : constant := 130;  --  openssl/engine.h:815
   ENGINE_R_NO_SUCH_ENGINE : constant := 116;  --  openssl/engine.h:816
   ENGINE_R_NO_UNLOAD_FUNCTION : constant := 126;  --  openssl/engine.h:817
   ENGINE_R_PROVIDE_PARAMETERS : constant := 113;  --  openssl/engine.h:818
   ENGINE_R_RSA_NOT_IMPLEMENTED : constant := 141;  --  openssl/engine.h:819
   ENGINE_R_UNIMPLEMENTED_CIPHER : constant := 146;  --  openssl/engine.h:820
   ENGINE_R_UNIMPLEMENTED_DIGEST : constant := 147;  --  openssl/engine.h:821
   ENGINE_R_UNIMPLEMENTED_PUBLIC_KEY_METHOD : constant := 101;  --  openssl/engine.h:822
   ENGINE_R_VERSION_INCOMPATIBILITY : constant := 145;  --  openssl/engine.h:823

   type ENGINE_CMD_DEFN_st is record
      cmd_num : aliased unsigned;  -- openssl/engine.h:263
      cmd_name : Interfaces.C.Strings.chars_ptr;  -- openssl/engine.h:264
      cmd_desc : Interfaces.C.Strings.chars_ptr;  -- openssl/engine.h:265
      cmd_flags : aliased unsigned;  -- openssl/engine.h:266
   end record;
   pragma Convention (C_Pass_By_Copy, ENGINE_CMD_DEFN_st);  -- openssl/engine.h:261

   subtype ENGINE_CMD_DEFN is ENGINE_CMD_DEFN_st;

   type ENGINE_GEN_FUNC_PTR is access function return int;  -- openssl/engine.h:270

   type ENGINE_GEN_INT_FUNC_PTR is access function (arg1 : System.Address) return int;  -- openssl/engine.h:272

   type ENGINE_CTRL_FUNC_PTR is access function
        (arg1 : System.Address;
         arg2 : int;
         arg3 : long;
         arg4 : System.Address;
         arg5 : access procedure) return int;  -- openssl/engine.h:274

   type ENGINE_LOAD_KEY_PTR is access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : System.Address;
         arg4 : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/engine.h:276

   type ENGINE_SSL_CLIENT_CERT_PTR is access function
        (arg1 : System.Address;
         arg2 : access OpenSSL.Low_Level.ssl_h.ssl_st;
         arg3 : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME;
         arg4 : System.Address;
         arg5 : System.Address;
         arg6 : System.Address;
         arg7 : System.Address;
         arg8 : System.Address) return int;  -- openssl/engine.h:278

   type ENGINE_CIPHERS_PTR is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : int) return int;  -- openssl/engine.h:293

   type ENGINE_DIGESTS_PTR is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : int) return int;  -- openssl/engine.h:294

   type ENGINE_PKEY_METHS_PTR is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : int) return int;  -- openssl/engine.h:295

   type ENGINE_PKEY_ASN1_METHS_PTR is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : int) return int;  -- openssl/engine.h:296

   function ENGINE_get_first return System.Address;  -- openssl/engine.h:308
   pragma Import (C, ENGINE_get_first, "ENGINE_get_first");

   function ENGINE_get_last return System.Address;  -- openssl/engine.h:309
   pragma Import (C, ENGINE_get_last, "ENGINE_get_last");

   function ENGINE_get_next (e : System.Address) return System.Address;  -- openssl/engine.h:311
   pragma Import (C, ENGINE_get_next, "ENGINE_get_next");

   function ENGINE_get_prev (e : System.Address) return System.Address;  -- openssl/engine.h:312
   pragma Import (C, ENGINE_get_prev, "ENGINE_get_prev");

   function ENGINE_add (e : System.Address) return int;  -- openssl/engine.h:314
   pragma Import (C, ENGINE_add, "ENGINE_add");

   function ENGINE_remove (e : System.Address) return int;  -- openssl/engine.h:316
   pragma Import (C, ENGINE_remove, "ENGINE_remove");

   function ENGINE_by_id (id : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/engine.h:318
   pragma Import (C, ENGINE_by_id, "ENGINE_by_id");

   procedure ENGINE_load_openssl;  -- openssl/engine.h:320
   pragma Import (C, ENGINE_load_openssl, "ENGINE_load_openssl");

   procedure ENGINE_load_dynamic;  -- openssl/engine.h:321
   pragma Import (C, ENGINE_load_dynamic, "ENGINE_load_dynamic");

   procedure ENGINE_load_cryptodev;  -- openssl/engine.h:340
   pragma Import (C, ENGINE_load_cryptodev, "ENGINE_load_cryptodev");

   procedure ENGINE_load_aesni;  -- openssl/engine.h:341
   pragma Import (C, ENGINE_load_aesni, "ENGINE_load_aesni");

   procedure ENGINE_load_builtin_engines;  -- openssl/engine.h:342
   pragma Import (C, ENGINE_load_builtin_engines, "ENGINE_load_builtin_engines");

   function ENGINE_get_table_flags return unsigned;  -- openssl/engine.h:346
   pragma Import (C, ENGINE_get_table_flags, "ENGINE_get_table_flags");

   procedure ENGINE_set_table_flags (flags : unsigned);  -- openssl/engine.h:347
   pragma Import (C, ENGINE_set_table_flags, "ENGINE_set_table_flags");

   function ENGINE_register_RSA (e : System.Address) return int;  -- openssl/engine.h:357
   pragma Import (C, ENGINE_register_RSA, "ENGINE_register_RSA");

   procedure ENGINE_unregister_RSA (e : System.Address);  -- openssl/engine.h:358
   pragma Import (C, ENGINE_unregister_RSA, "ENGINE_unregister_RSA");

   procedure ENGINE_register_all_RSA;  -- openssl/engine.h:359
   pragma Import (C, ENGINE_register_all_RSA, "ENGINE_register_all_RSA");

   function ENGINE_register_DSA (e : System.Address) return int;  -- openssl/engine.h:361
   pragma Import (C, ENGINE_register_DSA, "ENGINE_register_DSA");

   procedure ENGINE_unregister_DSA (e : System.Address);  -- openssl/engine.h:362
   pragma Import (C, ENGINE_unregister_DSA, "ENGINE_unregister_DSA");

   procedure ENGINE_register_all_DSA;  -- openssl/engine.h:363
   pragma Import (C, ENGINE_register_all_DSA, "ENGINE_register_all_DSA");

   function ENGINE_register_ECDH (e : System.Address) return int;  -- openssl/engine.h:365
   pragma Import (C, ENGINE_register_ECDH, "ENGINE_register_ECDH");

   procedure ENGINE_unregister_ECDH (e : System.Address);  -- openssl/engine.h:366
   pragma Import (C, ENGINE_unregister_ECDH, "ENGINE_unregister_ECDH");

   procedure ENGINE_register_all_ECDH;  -- openssl/engine.h:367
   pragma Import (C, ENGINE_register_all_ECDH, "ENGINE_register_all_ECDH");

   function ENGINE_register_ECDSA (e : System.Address) return int;  -- openssl/engine.h:369
   pragma Import (C, ENGINE_register_ECDSA, "ENGINE_register_ECDSA");

   procedure ENGINE_unregister_ECDSA (e : System.Address);  -- openssl/engine.h:370
   pragma Import (C, ENGINE_unregister_ECDSA, "ENGINE_unregister_ECDSA");

   procedure ENGINE_register_all_ECDSA;  -- openssl/engine.h:371
   pragma Import (C, ENGINE_register_all_ECDSA, "ENGINE_register_all_ECDSA");

   function ENGINE_register_DH (e : System.Address) return int;  -- openssl/engine.h:373
   pragma Import (C, ENGINE_register_DH, "ENGINE_register_DH");

   procedure ENGINE_unregister_DH (e : System.Address);  -- openssl/engine.h:374
   pragma Import (C, ENGINE_unregister_DH, "ENGINE_unregister_DH");

   procedure ENGINE_register_all_DH;  -- openssl/engine.h:375
   pragma Import (C, ENGINE_register_all_DH, "ENGINE_register_all_DH");

   function ENGINE_register_RAND (e : System.Address) return int;  -- openssl/engine.h:377
   pragma Import (C, ENGINE_register_RAND, "ENGINE_register_RAND");

   procedure ENGINE_unregister_RAND (e : System.Address);  -- openssl/engine.h:378
   pragma Import (C, ENGINE_unregister_RAND, "ENGINE_unregister_RAND");

   procedure ENGINE_register_all_RAND;  -- openssl/engine.h:379
   pragma Import (C, ENGINE_register_all_RAND, "ENGINE_register_all_RAND");

   function ENGINE_register_STORE (e : System.Address) return int;  -- openssl/engine.h:381
   pragma Import (C, ENGINE_register_STORE, "ENGINE_register_STORE");

   procedure ENGINE_unregister_STORE (e : System.Address);  -- openssl/engine.h:382
   pragma Import (C, ENGINE_unregister_STORE, "ENGINE_unregister_STORE");

   procedure ENGINE_register_all_STORE;  -- openssl/engine.h:383
   pragma Import (C, ENGINE_register_all_STORE, "ENGINE_register_all_STORE");

   function ENGINE_register_ciphers (e : System.Address) return int;  -- openssl/engine.h:385
   pragma Import (C, ENGINE_register_ciphers, "ENGINE_register_ciphers");

   procedure ENGINE_unregister_ciphers (e : System.Address);  -- openssl/engine.h:386
   pragma Import (C, ENGINE_unregister_ciphers, "ENGINE_unregister_ciphers");

   procedure ENGINE_register_all_ciphers;  -- openssl/engine.h:387
   pragma Import (C, ENGINE_register_all_ciphers, "ENGINE_register_all_ciphers");

   function ENGINE_register_digests (e : System.Address) return int;  -- openssl/engine.h:389
   pragma Import (C, ENGINE_register_digests, "ENGINE_register_digests");

   procedure ENGINE_unregister_digests (e : System.Address);  -- openssl/engine.h:390
   pragma Import (C, ENGINE_unregister_digests, "ENGINE_unregister_digests");

   procedure ENGINE_register_all_digests;  -- openssl/engine.h:391
   pragma Import (C, ENGINE_register_all_digests, "ENGINE_register_all_digests");

   function ENGINE_register_pkey_meths (e : System.Address) return int;  -- openssl/engine.h:393
   pragma Import (C, ENGINE_register_pkey_meths, "ENGINE_register_pkey_meths");

   procedure ENGINE_unregister_pkey_meths (e : System.Address);  -- openssl/engine.h:394
   pragma Import (C, ENGINE_unregister_pkey_meths, "ENGINE_unregister_pkey_meths");

   procedure ENGINE_register_all_pkey_meths;  -- openssl/engine.h:395
   pragma Import (C, ENGINE_register_all_pkey_meths, "ENGINE_register_all_pkey_meths");

   function ENGINE_register_pkey_asn1_meths (e : System.Address) return int;  -- openssl/engine.h:397
   pragma Import (C, ENGINE_register_pkey_asn1_meths, "ENGINE_register_pkey_asn1_meths");

   procedure ENGINE_unregister_pkey_asn1_meths (e : System.Address);  -- openssl/engine.h:398
   pragma Import (C, ENGINE_unregister_pkey_asn1_meths, "ENGINE_unregister_pkey_asn1_meths");

   procedure ENGINE_register_all_pkey_asn1_meths;  -- openssl/engine.h:399
   pragma Import (C, ENGINE_register_all_pkey_asn1_meths, "ENGINE_register_all_pkey_asn1_meths");

   function ENGINE_register_complete (e : System.Address) return int;  -- openssl/engine.h:405
   pragma Import (C, ENGINE_register_complete, "ENGINE_register_complete");

   function ENGINE_register_all_complete return int;  -- openssl/engine.h:406
   pragma Import (C, ENGINE_register_all_complete, "ENGINE_register_all_complete");

   function ENGINE_ctrl
     (e : System.Address;
      cmd : int;
      i : long;
      p : System.Address;
      f : access procedure) return int;  -- openssl/engine.h:415
   pragma Import (C, ENGINE_ctrl, "ENGINE_ctrl");

   function ENGINE_cmd_is_executable (e : System.Address; cmd : int) return int;  -- openssl/engine.h:421
   pragma Import (C, ENGINE_cmd_is_executable, "ENGINE_cmd_is_executable");

   function ENGINE_ctrl_cmd
     (e : System.Address;
      cmd_name : Interfaces.C.Strings.chars_ptr;
      i : long;
      p : System.Address;
      f : access procedure;
      cmd_optional : int) return int;  -- openssl/engine.h:427
   pragma Import (C, ENGINE_ctrl_cmd, "ENGINE_ctrl_cmd");

   function ENGINE_ctrl_cmd_string
     (e : System.Address;
      cmd_name : Interfaces.C.Strings.chars_ptr;
      arg : Interfaces.C.Strings.chars_ptr;
      cmd_optional : int) return int;  -- openssl/engine.h:449
   pragma Import (C, ENGINE_ctrl_cmd_string, "ENGINE_ctrl_cmd_string");

   function ENGINE_new return System.Address;  -- openssl/engine.h:458
   pragma Import (C, ENGINE_new, "ENGINE_new");

   function ENGINE_free (e : System.Address) return int;  -- openssl/engine.h:459
   pragma Import (C, ENGINE_free, "ENGINE_free");

   function ENGINE_up_ref (e : System.Address) return int;  -- openssl/engine.h:460
   pragma Import (C, ENGINE_up_ref, "ENGINE_up_ref");

   function ENGINE_set_id (e : System.Address; id : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/engine.h:461
   pragma Import (C, ENGINE_set_id, "ENGINE_set_id");

   function ENGINE_set_name (e : System.Address; name : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/engine.h:462
   pragma Import (C, ENGINE_set_name, "ENGINE_set_name");

   function ENGINE_set_RSA (e : System.Address; rsa_meth : access constant OpenSSL.Low_Level.rsa_h.rsa_st_METHOD) return int;  -- openssl/engine.h:463
   pragma Import (C, ENGINE_set_RSA, "ENGINE_set_RSA");

   function ENGINE_set_DSA (e : System.Address; dsa_meth : access constant OpenSSL.Low_Level.dsa_h.dsa_st_METHOD) return int;  -- openssl/engine.h:464
   pragma Import (C, ENGINE_set_DSA, "ENGINE_set_DSA");

   function ENGINE_set_ECDH (e : System.Address; ecdh_meth : System.Address) return int;  -- openssl/engine.h:465
   pragma Import (C, ENGINE_set_ECDH, "ENGINE_set_ECDH");

   function ENGINE_set_ECDSA (e : System.Address; ecdsa_meth : System.Address) return int;  -- openssl/engine.h:466
   pragma Import (C, ENGINE_set_ECDSA, "ENGINE_set_ECDSA");

   function ENGINE_set_DH (e : System.Address; dh_meth : access constant OpenSSL.Low_Level.dh_h.dh_st_METHOD) return int;  -- openssl/engine.h:467
   pragma Import (C, ENGINE_set_DH, "ENGINE_set_DH");

   function ENGINE_set_RAND (e : System.Address; rand_meth : access constant OpenSSL.Low_Level.rand_h.rand_meth_st) return int;  -- openssl/engine.h:468
   pragma Import (C, ENGINE_set_RAND, "ENGINE_set_RAND");

   function ENGINE_set_STORE (e : System.Address; store_meth : System.Address) return int;  -- openssl/engine.h:469
   pragma Import (C, ENGINE_set_STORE, "ENGINE_set_STORE");

   function ENGINE_set_destroy_function (e : System.Address; destroy_f : access function (arg1 : System.Address) return int) return int;  -- openssl/engine.h:470
   pragma Import (C, ENGINE_set_destroy_function, "ENGINE_set_destroy_function");

   function ENGINE_set_init_function (e : System.Address; init_f : access function (arg1 : System.Address) return int) return int;  -- openssl/engine.h:471
   pragma Import (C, ENGINE_set_init_function, "ENGINE_set_init_function");

   function ENGINE_set_finish_function (e : System.Address; finish_f : access function (arg1 : System.Address) return int) return int;  -- openssl/engine.h:472
   pragma Import (C, ENGINE_set_finish_function, "ENGINE_set_finish_function");

   function ENGINE_set_ctrl_function (e : System.Address; ctrl_f : access function
        (arg1 : System.Address;
         arg2 : int;
         arg3 : long;
         arg4 : System.Address;
         arg5 : access procedure) return int) return int;  -- openssl/engine.h:473
   pragma Import (C, ENGINE_set_ctrl_function, "ENGINE_set_ctrl_function");

   function ENGINE_set_load_privkey_function (e : System.Address; loadpriv_f : access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : System.Address;
         arg4 : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/engine.h:474
   pragma Import (C, ENGINE_set_load_privkey_function, "ENGINE_set_load_privkey_function");

   function ENGINE_set_load_pubkey_function (e : System.Address; loadpub_f : access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : System.Address;
         arg4 : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/engine.h:475
   pragma Import (C, ENGINE_set_load_pubkey_function, "ENGINE_set_load_pubkey_function");

   function ENGINE_set_load_ssl_client_cert_function (e : System.Address; loadssl_f : access function
        (arg1 : System.Address;
         arg2 : access OpenSSL.Low_Level.ssl_h.ssl_st;
         arg3 : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME;
         arg4 : System.Address;
         arg5 : System.Address;
         arg6 : System.Address;
         arg7 : System.Address;
         arg8 : System.Address) return int) return int;  -- openssl/engine.h:476
   pragma Import (C, ENGINE_set_load_ssl_client_cert_function, "ENGINE_set_load_ssl_client_cert_function");

   function ENGINE_set_ciphers (e : System.Address; f : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : int) return int) return int;  -- openssl/engine.h:478
   pragma Import (C, ENGINE_set_ciphers, "ENGINE_set_ciphers");

   function ENGINE_set_digests (e : System.Address; f : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : int) return int) return int;  -- openssl/engine.h:479
   pragma Import (C, ENGINE_set_digests, "ENGINE_set_digests");

   function ENGINE_set_pkey_meths (e : System.Address; f : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : int) return int) return int;  -- openssl/engine.h:480
   pragma Import (C, ENGINE_set_pkey_meths, "ENGINE_set_pkey_meths");

   function ENGINE_set_pkey_asn1_meths (e : System.Address; f : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : int) return int) return int;  -- openssl/engine.h:481
   pragma Import (C, ENGINE_set_pkey_asn1_meths, "ENGINE_set_pkey_asn1_meths");

   function ENGINE_set_flags (e : System.Address; flags : int) return int;  -- openssl/engine.h:482
   pragma Import (C, ENGINE_set_flags, "ENGINE_set_flags");

   function ENGINE_set_cmd_defns (e : System.Address; defns : System.Address) return int;  -- openssl/engine.h:483
   pragma Import (C, ENGINE_set_cmd_defns, "ENGINE_set_cmd_defns");

   function ENGINE_get_ex_new_index
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
         arg6 : System.Address)) return int;  -- openssl/engine.h:485
   pragma Import (C, ENGINE_get_ex_new_index, "ENGINE_get_ex_new_index");

   function ENGINE_set_ex_data
     (e : System.Address;
      idx : int;
      arg : System.Address) return int;  -- openssl/engine.h:487
   pragma Import (C, ENGINE_set_ex_data, "ENGINE_set_ex_data");

   function ENGINE_get_ex_data (e : System.Address; idx : int) return System.Address;  -- openssl/engine.h:488
   pragma Import (C, ENGINE_get_ex_data, "ENGINE_get_ex_data");

   procedure ENGINE_cleanup;  -- openssl/engine.h:494
   pragma Import (C, ENGINE_cleanup, "ENGINE_cleanup");

   function ENGINE_get_id (e : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/engine.h:500
   pragma Import (C, ENGINE_get_id, "ENGINE_get_id");

   function ENGINE_get_name (e : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/engine.h:501
   pragma Import (C, ENGINE_get_name, "ENGINE_get_name");

   function ENGINE_get_RSA (e : System.Address) return access constant OpenSSL.Low_Level.rsa_h.rsa_st_METHOD;  -- openssl/engine.h:502
   pragma Import (C, ENGINE_get_RSA, "ENGINE_get_RSA");

   function ENGINE_get_DSA (e : System.Address) return access constant OpenSSL.Low_Level.dsa_h.dsa_st_METHOD;  -- openssl/engine.h:503
   pragma Import (C, ENGINE_get_DSA, "ENGINE_get_DSA");

   function ENGINE_get_ECDH (e : System.Address) return System.Address;  -- openssl/engine.h:504
   pragma Import (C, ENGINE_get_ECDH, "ENGINE_get_ECDH");

   function ENGINE_get_ECDSA (e : System.Address) return System.Address;  -- openssl/engine.h:505
   pragma Import (C, ENGINE_get_ECDSA, "ENGINE_get_ECDSA");

   function ENGINE_get_DH (e : System.Address) return access constant OpenSSL.Low_Level.dh_h.dh_st_METHOD;  -- openssl/engine.h:506
   pragma Import (C, ENGINE_get_DH, "ENGINE_get_DH");

   function ENGINE_get_RAND (e : System.Address) return access constant OpenSSL.Low_Level.rand_h.rand_meth_st;  -- openssl/engine.h:507
   pragma Import (C, ENGINE_get_RAND, "ENGINE_get_RAND");

   function ENGINE_get_STORE (e : System.Address) return System.Address;  -- openssl/engine.h:508
   pragma Import (C, ENGINE_get_STORE, "ENGINE_get_STORE");

   function ENGINE_get_destroy_function (e : System.Address) return access function (arg1 : System.Address) return int;  -- openssl/engine.h:509
   pragma Import (C, ENGINE_get_destroy_function, "ENGINE_get_destroy_function");

   function ENGINE_get_init_function (e : System.Address) return access function (arg1 : System.Address) return int;  -- openssl/engine.h:510
   pragma Import (C, ENGINE_get_init_function, "ENGINE_get_init_function");

   function ENGINE_get_finish_function (e : System.Address) return access function (arg1 : System.Address) return int;  -- openssl/engine.h:511
   pragma Import (C, ENGINE_get_finish_function, "ENGINE_get_finish_function");

   function ENGINE_get_ctrl_function (e : System.Address) return access function
        (arg1 : System.Address;
         arg2 : int;
         arg3 : long;
         arg4 : System.Address;
         arg5 : access procedure) return int;  -- openssl/engine.h:512
   pragma Import (C, ENGINE_get_ctrl_function, "ENGINE_get_ctrl_function");

   function ENGINE_get_load_privkey_function (e : System.Address) return access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : System.Address;
         arg4 : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/engine.h:513
   pragma Import (C, ENGINE_get_load_privkey_function, "ENGINE_get_load_privkey_function");

   function ENGINE_get_load_pubkey_function (e : System.Address) return access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : System.Address;
         arg4 : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/engine.h:514
   pragma Import (C, ENGINE_get_load_pubkey_function, "ENGINE_get_load_pubkey_function");

   function ENGINE_get_ssl_client_cert_function (e : System.Address) return access function
        (arg1 : System.Address;
         arg2 : access OpenSSL.Low_Level.ssl_h.ssl_st;
         arg3 : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME;
         arg4 : System.Address;
         arg5 : System.Address;
         arg6 : System.Address;
         arg7 : System.Address;
         arg8 : System.Address) return int;  -- openssl/engine.h:515
   pragma Import (C, ENGINE_get_ssl_client_cert_function, "ENGINE_get_ssl_client_cert_function");

   function ENGINE_get_ciphers (e : System.Address) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : int) return int;  -- openssl/engine.h:516
   pragma Import (C, ENGINE_get_ciphers, "ENGINE_get_ciphers");

   function ENGINE_get_digests (e : System.Address) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : int) return int;  -- openssl/engine.h:517
   pragma Import (C, ENGINE_get_digests, "ENGINE_get_digests");

   function ENGINE_get_pkey_meths (e : System.Address) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : int) return int;  -- openssl/engine.h:518
   pragma Import (C, ENGINE_get_pkey_meths, "ENGINE_get_pkey_meths");

   function ENGINE_get_pkey_asn1_meths (e : System.Address) return access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address;
         arg4 : int) return int;  -- openssl/engine.h:519
   pragma Import (C, ENGINE_get_pkey_asn1_meths, "ENGINE_get_pkey_asn1_meths");

   function ENGINE_get_cipher (e : System.Address; nid : int) return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/engine.h:520
   pragma Import (C, ENGINE_get_cipher, "ENGINE_get_cipher");

   function ENGINE_get_digest (e : System.Address; nid : int) return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/engine.h:521
   pragma Import (C, ENGINE_get_digest, "ENGINE_get_digest");

   function ENGINE_get_pkey_meth (e : System.Address; nid : int) return System.Address;  -- openssl/engine.h:522
   pragma Import (C, ENGINE_get_pkey_meth, "ENGINE_get_pkey_meth");

   function ENGINE_get_pkey_asn1_meth (e : System.Address; nid : int) return System.Address;  -- openssl/engine.h:523
   pragma Import (C, ENGINE_get_pkey_asn1_meth, "ENGINE_get_pkey_asn1_meth");

   function ENGINE_get_pkey_asn1_meth_str
     (e : System.Address;
      str : Interfaces.C.Strings.chars_ptr;
      len : int) return System.Address;  -- openssl/engine.h:524
   pragma Import (C, ENGINE_get_pkey_asn1_meth_str, "ENGINE_get_pkey_asn1_meth_str");

   function ENGINE_pkey_asn1_find_str
     (pe : System.Address;
      str : Interfaces.C.Strings.chars_ptr;
      len : int) return System.Address;  -- openssl/engine.h:526
   pragma Import (C, ENGINE_pkey_asn1_find_str, "ENGINE_pkey_asn1_find_str");

   function ENGINE_get_cmd_defns (e : System.Address) return System.Address;  -- openssl/engine.h:528
   pragma Import (C, ENGINE_get_cmd_defns, "ENGINE_get_cmd_defns");

   function ENGINE_get_flags (e : System.Address) return int;  -- openssl/engine.h:529
   pragma Import (C, ENGINE_get_flags, "ENGINE_get_flags");

   function ENGINE_init (e : System.Address) return int;  -- openssl/engine.h:546
   pragma Import (C, ENGINE_init, "ENGINE_init");

   function ENGINE_finish (e : System.Address) return int;  -- openssl/engine.h:550
   pragma Import (C, ENGINE_finish, "ENGINE_finish");

   function ENGINE_load_private_key
     (e : System.Address;
      key_id : Interfaces.C.Strings.chars_ptr;
      the_ui_method : System.Address;
      callback_data : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/engine.h:555
   pragma Import (C, ENGINE_load_private_key, "ENGINE_load_private_key");

   function ENGINE_load_public_key
     (e : System.Address;
      key_id : Interfaces.C.Strings.chars_ptr;
      the_ui_method : System.Address;
      callback_data : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/engine.h:557
   pragma Import (C, ENGINE_load_public_key, "ENGINE_load_public_key");

   function ENGINE_load_ssl_client_cert
     (e : System.Address;
      s : access OpenSSL.Low_Level.ssl_h.ssl_st;
      ca_dn : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME;
      pcert : System.Address;
      ppkey : System.Address;
      pother : System.Address;
      the_ui_method : System.Address;
      callback_data : System.Address) return int;  -- openssl/engine.h:559
   pragma Import (C, ENGINE_load_ssl_client_cert, "ENGINE_load_ssl_client_cert");

   function ENGINE_get_default_RSA return System.Address;  -- openssl/engine.h:568
   pragma Import (C, ENGINE_get_default_RSA, "ENGINE_get_default_RSA");

   function ENGINE_get_default_DSA return System.Address;  -- openssl/engine.h:570
   pragma Import (C, ENGINE_get_default_DSA, "ENGINE_get_default_DSA");

   function ENGINE_get_default_ECDH return System.Address;  -- openssl/engine.h:571
   pragma Import (C, ENGINE_get_default_ECDH, "ENGINE_get_default_ECDH");

   function ENGINE_get_default_ECDSA return System.Address;  -- openssl/engine.h:572
   pragma Import (C, ENGINE_get_default_ECDSA, "ENGINE_get_default_ECDSA");

   function ENGINE_get_default_DH return System.Address;  -- openssl/engine.h:573
   pragma Import (C, ENGINE_get_default_DH, "ENGINE_get_default_DH");

   function ENGINE_get_default_RAND return System.Address;  -- openssl/engine.h:574
   pragma Import (C, ENGINE_get_default_RAND, "ENGINE_get_default_RAND");

   function ENGINE_get_cipher_engine (nid : int) return System.Address;  -- openssl/engine.h:577
   pragma Import (C, ENGINE_get_cipher_engine, "ENGINE_get_cipher_engine");

   function ENGINE_get_digest_engine (nid : int) return System.Address;  -- openssl/engine.h:578
   pragma Import (C, ENGINE_get_digest_engine, "ENGINE_get_digest_engine");

   function ENGINE_get_pkey_meth_engine (nid : int) return System.Address;  -- openssl/engine.h:579
   pragma Import (C, ENGINE_get_pkey_meth_engine, "ENGINE_get_pkey_meth_engine");

   function ENGINE_get_pkey_asn1_meth_engine (nid : int) return System.Address;  -- openssl/engine.h:580
   pragma Import (C, ENGINE_get_pkey_asn1_meth_engine, "ENGINE_get_pkey_asn1_meth_engine");

   function ENGINE_set_default_RSA (e : System.Address) return int;  -- openssl/engine.h:586
   pragma Import (C, ENGINE_set_default_RSA, "ENGINE_set_default_RSA");

   function ENGINE_set_default_string (e : System.Address; def_list : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/engine.h:587
   pragma Import (C, ENGINE_set_default_string, "ENGINE_set_default_string");

   function ENGINE_set_default_DSA (e : System.Address) return int;  -- openssl/engine.h:589
   pragma Import (C, ENGINE_set_default_DSA, "ENGINE_set_default_DSA");

   function ENGINE_set_default_ECDH (e : System.Address) return int;  -- openssl/engine.h:590
   pragma Import (C, ENGINE_set_default_ECDH, "ENGINE_set_default_ECDH");

   function ENGINE_set_default_ECDSA (e : System.Address) return int;  -- openssl/engine.h:591
   pragma Import (C, ENGINE_set_default_ECDSA, "ENGINE_set_default_ECDSA");

   function ENGINE_set_default_DH (e : System.Address) return int;  -- openssl/engine.h:592
   pragma Import (C, ENGINE_set_default_DH, "ENGINE_set_default_DH");

   function ENGINE_set_default_RAND (e : System.Address) return int;  -- openssl/engine.h:593
   pragma Import (C, ENGINE_set_default_RAND, "ENGINE_set_default_RAND");

   function ENGINE_set_default_ciphers (e : System.Address) return int;  -- openssl/engine.h:594
   pragma Import (C, ENGINE_set_default_ciphers, "ENGINE_set_default_ciphers");

   function ENGINE_set_default_digests (e : System.Address) return int;  -- openssl/engine.h:595
   pragma Import (C, ENGINE_set_default_digests, "ENGINE_set_default_digests");

   function ENGINE_set_default_pkey_meths (e : System.Address) return int;  -- openssl/engine.h:596
   pragma Import (C, ENGINE_set_default_pkey_meths, "ENGINE_set_default_pkey_meths");

   function ENGINE_set_default_pkey_asn1_meths (e : System.Address) return int;  -- openssl/engine.h:597
   pragma Import (C, ENGINE_set_default_pkey_asn1_meths, "ENGINE_set_default_pkey_asn1_meths");

   function ENGINE_set_default (e : System.Address; flags : unsigned) return int;  -- openssl/engine.h:604
   pragma Import (C, ENGINE_set_default, "ENGINE_set_default");

   procedure ENGINE_add_conf_module;  -- openssl/engine.h:606
   pragma Import (C, ENGINE_add_conf_module, "ENGINE_add_conf_module");

   type dyn_MEM_malloc_cb is access function (arg1 : size_t) return System.Address;  -- openssl/engine.h:630

   type dyn_MEM_realloc_cb is access function (arg1 : System.Address; arg2 : size_t) return System.Address;  -- openssl/engine.h:631

   type dyn_MEM_free_cb is access procedure (arg1 : System.Address);  -- openssl/engine.h:632

   type st_dynamic_MEM_fns is record
      malloc_cb : access function (arg1 : size_t) return System.Address;  -- openssl/engine.h:634
      realloc_cb : access function (arg1 : System.Address; arg2 : size_t) return System.Address;  -- openssl/engine.h:635
      free_cb : access procedure (arg1 : System.Address);  -- openssl/engine.h:636
   end record;
   pragma Convention (C_Pass_By_Copy, st_dynamic_MEM_fns);  -- openssl/engine.h:633

   subtype dynamic_MEM_fns is st_dynamic_MEM_fns;

   type dyn_lock_locking_cb is access procedure
        (arg1 : int;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int);  -- openssl/engine.h:640

   type dyn_lock_add_lock_cb is access function
        (arg1 : access int;
         arg2 : int;
         arg3 : int;
         arg4 : Interfaces.C.Strings.chars_ptr;
         arg5 : int) return int;  -- openssl/engine.h:641

   type dyn_dynlock_create_cb is access function (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return System.Address;  -- openssl/engine.h:642

   type dyn_dynlock_lock_cb is access procedure
        (arg1 : int;
         arg2 : System.Address;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int);  -- openssl/engine.h:644

   type dyn_dynlock_destroy_cb is access procedure
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int);  -- openssl/engine.h:646

   type st_dynamic_LOCK_fns is record
      lock_locking_cb : access procedure
           (arg1 : int;
            arg2 : int;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : int);  -- openssl/engine.h:649
      lock_add_lock_cb : access function
           (arg1 : access int;
            arg2 : int;
            arg3 : int;
            arg4 : Interfaces.C.Strings.chars_ptr;
            arg5 : int) return int;  -- openssl/engine.h:650
      dynlock_create_cb : access function (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return System.Address;  -- openssl/engine.h:651
      dynlock_lock_cb : access procedure
           (arg1 : int;
            arg2 : System.Address;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : int);  -- openssl/engine.h:652
      dynlock_destroy_cb : access procedure
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : int);  -- openssl/engine.h:653
   end record;
   pragma Convention (C_Pass_By_Copy, st_dynamic_LOCK_fns);  -- openssl/engine.h:648

   subtype dynamic_LOCK_fns is st_dynamic_LOCK_fns;

   type st_dynamic_fns is record
      static_state : System.Address;  -- openssl/engine.h:657
      the_err_fns : System.Address;  -- openssl/engine.h:658
      ex_data_fns : System.Address;  -- openssl/engine.h:659
      mem_fns : aliased dynamic_MEM_fns;  -- openssl/engine.h:660
      lock_fns : aliased dynamic_LOCK_fns;  -- openssl/engine.h:661
   end record;
   pragma Convention (C_Pass_By_Copy, st_dynamic_fns);  -- openssl/engine.h:656

   subtype dynamic_fns is st_dynamic_fns;

   type dynamic_v_check_fn is access function (arg1 : unsigned_long) return unsigned_long;  -- openssl/engine.h:673

   type dynamic_bind_engine is access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : System.Address) return int;  -- openssl/engine.h:695

   function ENGINE_get_static_state return System.Address;  -- openssl/engine.h:727
   pragma Import (C, ENGINE_get_static_state, "ENGINE_get_static_state");

   procedure ERR_load_ENGINE_strings;  -- openssl/engine.h:737
   pragma Import (C, ERR_load_ENGINE_strings, "ERR_load_ENGINE_strings");

end OpenSSL.Low_Level.engine_h;
