with Interfaces.C; use Interfaces.C;
with System;
limited with OpenSSL.Low_Level.bio_h;
with OpenSSL.Low_Level.stack_h;
with Interfaces.C.Strings;
with Interfaces.C_Streams;
package OpenSSL.Low_Level.crypto_h is
   package defs is

      --  unsupported macro: SSLEAY_VERSION_NUMBER OPENSSL_VERSION_NUMBER

      SSLEAY_VERSION : constant := 0;  --  openssl/crypto.h:149

      SSLEAY_CFLAGS : constant := 2;  --  openssl/crypto.h:151
      SSLEAY_BUILT_ON : constant := 3;  --  openssl/crypto.h:152
      SSLEAY_PLATFORM : constant := 4;  --  openssl/crypto.h:153
      SSLEAY_DIR : constant := 5;  --  openssl/crypto.h:154

      CRYPTO_LOCK_ERR : constant := 1;  --  openssl/crypto.h:184
      CRYPTO_LOCK_EX_DATA : constant := 2;  --  openssl/crypto.h:185
      CRYPTO_LOCK_X509 : constant := 3;  --  openssl/crypto.h:186
      CRYPTO_LOCK_X509_INFO : constant := 4;  --  openssl/crypto.h:187
      CRYPTO_LOCK_X509_PKEY : constant := 5;  --  openssl/crypto.h:188
      CRYPTO_LOCK_X509_CRL : constant := 6;  --  openssl/crypto.h:189
      CRYPTO_LOCK_X509_REQ : constant := 7;  --  openssl/crypto.h:190
      CRYPTO_LOCK_DSA : constant := 8;  --  openssl/crypto.h:191
      CRYPTO_LOCK_RSA : constant := 9;  --  openssl/crypto.h:192
      CRYPTO_LOCK_EVP_PKEY : constant := 10;  --  openssl/crypto.h:193
      CRYPTO_LOCK_X509_STORE : constant := 11;  --  openssl/crypto.h:194
      CRYPTO_LOCK_SSL_CTX : constant := 12;  --  openssl/crypto.h:195
      CRYPTO_LOCK_SSL_CERT : constant := 13;  --  openssl/crypto.h:196
      CRYPTO_LOCK_SSL_SESSION : constant := 14;  --  openssl/crypto.h:197
      CRYPTO_LOCK_SSL_SESS_CERT : constant := 15;  --  openssl/crypto.h:198
      CRYPTO_LOCK_SSL : constant := 16;  --  openssl/crypto.h:199
      CRYPTO_LOCK_SSL_METHOD : constant := 17;  --  openssl/crypto.h:200
      CRYPTO_LOCK_RAND : constant := 18;  --  openssl/crypto.h:201
      CRYPTO_LOCK_RAND2 : constant := 19;  --  openssl/crypto.h:202
      CRYPTO_LOCK_MALLOC : constant := 20;  --  openssl/crypto.h:203
      CRYPTO_LOCK_BIO : constant := 21;  --  openssl/crypto.h:204
      CRYPTO_LOCK_GETHOSTBYNAME : constant := 22;  --  openssl/crypto.h:205
      CRYPTO_LOCK_GETSERVBYNAME : constant := 23;  --  openssl/crypto.h:206
      CRYPTO_LOCK_READDIR : constant := 24;  --  openssl/crypto.h:207
      CRYPTO_LOCK_RSA_BLINDING : constant := 25;  --  openssl/crypto.h:208
      CRYPTO_LOCK_DH : constant := 26;  --  openssl/crypto.h:209
      CRYPTO_LOCK_MALLOC2 : constant := 27;  --  openssl/crypto.h:210
      CRYPTO_LOCK_DSO : constant := 28;  --  openssl/crypto.h:211
      CRYPTO_LOCK_DYNLOCK : constant := 29;  --  openssl/crypto.h:212
      CRYPTO_LOCK_ENGINE : constant := 30;  --  openssl/crypto.h:213
      CRYPTO_LOCK_UI : constant := 31;  --  openssl/crypto.h:214
      CRYPTO_LOCK_ECDSA : constant := 32;  --  openssl/crypto.h:215
      CRYPTO_LOCK_EC : constant := 33;  --  openssl/crypto.h:216
      CRYPTO_LOCK_ECDH : constant := 34;  --  openssl/crypto.h:217
      CRYPTO_LOCK_BN : constant := 35;  --  openssl/crypto.h:218
      CRYPTO_LOCK_EC_PRE_COMP : constant := 36;  --  openssl/crypto.h:219
      CRYPTO_LOCK_STORE : constant := 37;  --  openssl/crypto.h:220
      CRYPTO_LOCK_COMP : constant := 38;  --  openssl/crypto.h:221
      CRYPTO_LOCK_FIPS : constant := 39;  --  openssl/crypto.h:222
      CRYPTO_LOCK_FIPS2 : constant := 40;  --  openssl/crypto.h:223
      CRYPTO_NUM_LOCKS : constant := 41;  --  openssl/crypto.h:224

      CRYPTO_LOCK : constant := 1;  --  openssl/crypto.h:226
      CRYPTO_UNLOCK : constant := 2;  --  openssl/crypto.h:227
      CRYPTO_READ : constant := 4;  --  openssl/crypto.h:228
      CRYPTO_WRITE : constant := 8;  --  openssl/crypto.h:229
      --  arg-macro: procedure CRYPTO_w_lock (type)
      --    CRYPTO_lock(CRYPTO_LOCKorCRYPTO_WRITE,type,_FILE_,_LINE_)
      --  arg-macro: procedure CRYPTO_w_unlock (type)
      --    CRYPTO_lock(CRYPTO_UNLOCKorCRYPTO_WRITE,type,_FILE_,_LINE_)
      --  arg-macro: procedure CRYPTO_r_lock (type)
      --    CRYPTO_lock(CRYPTO_LOCKorCRYPTO_READ,type,_FILE_,_LINE_)
      --  arg-macro: procedure CRYPTO_r_unlock (type)
      --    CRYPTO_lock(CRYPTO_UNLOCKorCRYPTO_READ,type,_FILE_,_LINE_)
      --  arg-macro: procedure CRYPTO_add (addr, amount, tCRYPTO_add_lock(addr,amount,type,_FILE_,_LINE_)
      --    CRYPTO_add_lock(addr,amount,type,_FILE_,_LINE_)

      CRYPTO_MEM_CHECK_OFF : constant := 16#0#;  --  openssl/crypto.h:266
      CRYPTO_MEM_CHECK_ON : constant := 16#1#;  --  openssl/crypto.h:267
      CRYPTO_MEM_CHECK_ENABLE : constant := 16#2#;  --  openssl/crypto.h:268
      CRYPTO_MEM_CHECK_DISABLE : constant := 16#3#;  --  openssl/crypto.h:269

      V_CRYPTO_MDEBUG_TIME : constant := 16#1#;  --  openssl/crypto.h:275

      V_CRYPTO_MDEBUG_THREAD : constant := 16#2#;  --  openssl/crypto.h:277
      --  unsupported macro: V_CRYPTO_MDEBUG_ALL (V_CRYPTO_MDEBUG_TIME | V_CRYPTO_MDEBUG_THREAD)

      CRYPTO_EX_INDEX_BIO : constant := 0;  --  openssl/crypto.h:310
      CRYPTO_EX_INDEX_SSL : constant := 1;  --  openssl/crypto.h:311
      CRYPTO_EX_INDEX_SSL_CTX : constant := 2;  --  openssl/crypto.h:312
      CRYPTO_EX_INDEX_SSL_SESSION : constant := 3;  --  openssl/crypto.h:313
      CRYPTO_EX_INDEX_X509_STORE : constant := 4;  --  openssl/crypto.h:314
      CRYPTO_EX_INDEX_X509_STORE_CTX : constant := 5;  --  openssl/crypto.h:315
      CRYPTO_EX_INDEX_RSA : constant := 6;  --  openssl/crypto.h:316
      CRYPTO_EX_INDEX_DSA : constant := 7;  --  openssl/crypto.h:317
      CRYPTO_EX_INDEX_DH : constant := 8;  --  openssl/crypto.h:318
      CRYPTO_EX_INDEX_ENGINE : constant := 9;  --  openssl/crypto.h:319
      CRYPTO_EX_INDEX_X509 : constant := 10;  --  openssl/crypto.h:320
      CRYPTO_EX_INDEX_UI : constant := 11;  --  openssl/crypto.h:321
      CRYPTO_EX_INDEX_ECDSA : constant := 12;  --  openssl/crypto.h:322
      CRYPTO_EX_INDEX_ECDH : constant := 13;  --  openssl/crypto.h:323
      CRYPTO_EX_INDEX_COMP : constant := 14;  --  openssl/crypto.h:324
      CRYPTO_EX_INDEX_STORE : constant := 15;  --  openssl/crypto.h:325

      CRYPTO_EX_INDEX_USER : constant := 100;  --  openssl/crypto.h:329
      --  arg-macro: procedure CRYPTO_malloc_init ()
      --    CRYPTO_set_mem_functions( malloc, realloc, free)
      --  arg-macro: procedure CRYPTO_malloc_debug_init ()
      --    do { CRYPTO_set_mem_debug_functions( CRYPTO_dbg_malloc, CRYPTO_dbg_realloc, CRYPTO_dbg_free, CRYPTO_dbg_set_options, CRYPTO_dbg_get_options); } while(0)
      --  arg-macro: procedure MemCheck_start ()
      --    CRYPTO_mem_ctrl(CRYPTO_MEM_CHECK_ON)
      --  arg-macro: procedure MemCheck_stop ()
      --    CRYPTO_mem_ctrl(CRYPTO_MEM_CHECK_OFF)
      --  arg-macro: procedure MemCheck_on ()
      --    CRYPTO_mem_ctrl(CRYPTO_MEM_CHECK_ENABLE)
      --  arg-macro: procedure MemCheck_off ()
      --    CRYPTO_mem_ctrl(CRYPTO_MEM_CHECK_DISABLE)
      --  arg-macro: procedure is_MemCheck_on ()
      --    CRYPTO_is_mem_check_on()
      --  arg-macro: procedure OPENSSL_malloc (num)
      --    CRYPTO_malloc((int)num,_FILE_,_LINE_)
      --  arg-macro: procedure OPENSSL_strdup (str)
      --    CRYPTO_strdup((str),_FILE_,_LINE_)
      --  arg-macro: procedure OPENSSL_realloc (addr, num)
      --    CRYPTO_realloc((char *)addr,(int)num,_FILE_,_LINE_)
      --  arg-macro: procedure OPENSSL_realloc_clean (addr, old_num, CRYPTO_realloc_clean(addr,old_num,num,_FILE_,_LINE_)
      --    CRYPTO_realloc_clean(addr,old_num,num,_FILE_,_LINE_)
      --  arg-macro: procedure OPENSSL_remalloc (addr, num)
      --    CRYPTO_remalloc((char **)addr,(int)num,_FILE_,_LINE_)
      --  unsupported macro: OPENSSL_freeFunc CRYPTO_free
      --  arg-macro: procedure OPENSSL_free (addr)
      --    CRYPTO_free(addr)
      --  arg-macro: procedure OPENSSL_malloc_locked (num)
      --    CRYPTO_malloc_locked((int)num,_FILE_,_LINE_)
      --  arg-macro: procedure OPENSSL_free_locked (addr)
      --    CRYPTO_free_locked(addr)
      --  arg-macro: procedure CRYPTO_push_info (info)
      --    CRYPTO_push_info_(info, _FILE_, _LINE_);
      --  unsupported macro: OPENSSL_assert(e) (void)((e) ? 0 : (OpenSSLDie(_FILE_, _LINE_, #e),1))
      --  unsupported macro: OPENSSL_ia32cap (*(OPENSSL_ia32cap_loc()))
      --  arg-macro: procedure FIPS_ERROR_IGNORED (alg)
      --    OpenSSLDie(_FILE_, _LINE_, alg " previous FIPS forbidden algorithm error ignored");
      --  unsupported macro: FIPS_BAD_ABORT(alg) OpenSSLDie(_FILE_, _LINE_, #alg " Algorithm forbidden in FIPS mode");
      --  unsupported macro: FIPS_BAD_ALGORITHM(alg) { FIPSerr(FIPS_F_HASH_FINAL,FIPS_R_NON_FIPS_METHOD); ERR_add_error_data(2, "Algorithm=", #alg); return 0; }
      --  unsupported macro: FIPS_NON_FIPS_MD_Init(alg) int alg ##_Init(alg ##_CTX *c) { if (FIPS_mode()) FIPS_BAD_ALGORITHM(alg) return private_ ##alg ##_Init(c); } int private_ ##alg ##_Init(alg ##_CTX *c)
      --  unsupported macro: FIPS_NON_FIPS_VCIPHER_Init(alg) void alg ##_set_key(alg ##_KEY *key, int len, const unsigned char *data) { if (FIPS_mode()) FIPS_BAD_ABORT(alg) private_ ##alg ##_set_key(key, len, data); } void private_ ##alg ##_set_key(alg ##_KEY *key, int len, const unsigned char *data)

      OPENSSL_HAVE_INIT : constant := 1;  --  openssl/crypto.h:611

      CRYPTO_F_CRYPTO_GET_EX_NEW_INDEX : constant := 100;  --  openssl/crypto.h:617
      CRYPTO_F_CRYPTO_GET_NEW_DYNLOCKID : constant := 103;  --  openssl/crypto.h:618
      CRYPTO_F_CRYPTO_GET_NEW_LOCKID : constant := 101;  --  openssl/crypto.h:619
      CRYPTO_F_CRYPTO_SET_EX_DATA : constant := 102;  --  openssl/crypto.h:620
      CRYPTO_F_DEF_ADD_INDEX : constant := 104;  --  openssl/crypto.h:621
      CRYPTO_F_DEF_GET_CLASS : constant := 105;  --  openssl/crypto.h:622
      CRYPTO_F_INT_DUP_EX_DATA : constant := 106;  --  openssl/crypto.h:623
      CRYPTO_F_INT_FREE_EX_DATA : constant := 107;  --  openssl/crypto.h:624
      CRYPTO_F_INT_NEW_EX_DATA : constant := 108;  --  openssl/crypto.h:625

      CRYPTO_R_NO_DYNLOCK_CREATE_CALLBACK : constant := 100;  --  openssl/crypto.h:628
   end defs;
   type openssl_item_st is record
      code         : aliased int;  -- openssl/crypto.h:173
      value        : System.Address;  -- openssl/crypto.h:174
      value_size   : aliased size_t;  -- openssl/crypto.h:175
      value_length : access size_t;  -- openssl/crypto.h:176
   end record;
   pragma Convention (C_Pass_By_Copy, openssl_item_st);  -- openssl/crypto.h:171

   subtype OPENSSL_ITEM is openssl_item_st;

   type CRYPTO_dynlock is record
      references : aliased int;  -- openssl/crypto.h:258
      data       : System.Address;  -- openssl/crypto.h:259
   end record;
   pragma Convention (C_Pass_By_Copy, CRYPTO_dynlock);  -- openssl/crypto.h:260

   --  skipped anonymous struct anon_25

   --  skipped empty struct CRYPTO_dynlock_value


   type stack_st_void;
   type crypto_ex_data_st is record
      sk    : access stack_st_void;  -- openssl/crypto.h:287
      dummy : aliased int;  -- openssl/crypto.h:288
   end record;
   pragma Convention (C_Pass_By_Copy, crypto_ex_data_st);  -- openssl/crypto.h:285

   type stack_st_void is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/crypto.h:290
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_void);  -- openssl/crypto.h:290

   type crypto_ex_data_func_st is record
      argl      : aliased long;  -- openssl/crypto.h:297
      argp      : System.Address;  -- openssl/crypto.h:298
      new_func  : access function
        (arg1 : System.Address;
         arg2      : System.Address;
         arg3      : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4      : int;
         arg5      : long;
         arg6      : System.Address) return int;  -- openssl/crypto.h:299
      free_func : access procedure
        (arg1 : System.Address;
         arg2      : System.Address;
         arg3      : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4      : int;
         arg5      : long;
         arg6      : System.Address);  -- openssl/crypto.h:300
      dup_func  : access function
        (arg1 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg2      : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg3      : System.Address;
         arg4      : int;
         arg5      : long;
         arg6      : System.Address) return int;  -- openssl/crypto.h:301
   end record;
   pragma Convention (C_Pass_By_Copy, crypto_ex_data_func_st);  -- openssl/crypto.h:295

   subtype CRYPTO_EX_DATA_FUNCS is crypto_ex_data_func_st;

   type stack_st_CRYPTO_EX_DATA_FUNCS is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/crypto.h:304
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_CRYPTO_EX_DATA_FUNCS);  -- openssl/crypto.h:304

   function CRYPTO_mem_ctrl (mode : int) return int;  -- openssl/crypto.h:356
   pragma Import (C, CRYPTO_mem_ctrl, "CRYPTO_mem_ctrl");

   function CRYPTO_is_mem_check_on return int;  -- openssl/crypto.h:357
   pragma Import (C, CRYPTO_is_mem_check_on, "CRYPTO_is_mem_check_on");

   function SSLeay_version (c_type : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/crypto.h:384
   pragma Import (C, SSLeay_version, "SSLeay_version");

   function SSLeay return unsigned_long;  -- openssl/crypto.h:385
   pragma Import (C, SSLeay, "SSLeay");

   function OPENSSL_issetugid return int;  -- openssl/crypto.h:387
   pragma Import (C, OPENSSL_issetugid, "OPENSSL_issetugid");

   --  skipped empty struct st_CRYPTO_EX_DATA_IMPL

   --  skipped empty struct CRYPTO_EX_DATA_IMPL

   function CRYPTO_get_ex_data_implementation return System.Address;  -- openssl/crypto.h:392
   pragma Import (C, CRYPTO_get_ex_data_implementation, "CRYPTO_get_ex_data_implementation");

   function CRYPTO_set_ex_data_implementation (i : System.Address) return int;  -- openssl/crypto.h:394
   pragma Import (C, CRYPTO_set_ex_data_implementation, "CRYPTO_set_ex_data_implementation");

   function CRYPTO_ex_data_new_class return int;  -- openssl/crypto.h:396
   pragma Import (C, CRYPTO_ex_data_new_class, "CRYPTO_ex_data_new_class");

   function CRYPTO_get_ex_new_index
     (class_index : int;
      argl        : long;
      argp        : System.Address;
      new_func    : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      dup_func    : access function
        (arg1 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg2 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg3 : System.Address;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      free_func   : access procedure
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address)) return int;  -- openssl/crypto.h:398
   pragma Import (C, CRYPTO_get_ex_new_index, "CRYPTO_get_ex_new_index");

   function CRYPTO_new_ex_data
     (class_index : int;
      obj         : System.Address;
      ad          : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st) return int;  -- openssl/crypto.h:403
   pragma Import (C, CRYPTO_new_ex_data, "CRYPTO_new_ex_data");

   function CRYPTO_dup_ex_data
     (class_index : int;
      to          : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
      from        : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st) return int;  -- openssl/crypto.h:404
   pragma Import (C, CRYPTO_dup_ex_data, "CRYPTO_dup_ex_data");

   procedure CRYPTO_free_ex_data
     (class_index : int;
      obj         : System.Address;
      ad          : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st);  -- openssl/crypto.h:406
   pragma Import (C, CRYPTO_free_ex_data, "CRYPTO_free_ex_data");

   function CRYPTO_set_ex_data
     (ad  : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
      idx : int;
      val : System.Address) return int;  -- openssl/crypto.h:409
   pragma Import (C, CRYPTO_set_ex_data, "CRYPTO_set_ex_data");

   function CRYPTO_get_ex_data (ad : access constant OpenSSL.Low_Level.crypto_h.crypto_ex_data_st; idx : int) return System.Address;  -- openssl/crypto.h:410
   pragma Import (C, CRYPTO_get_ex_data, "CRYPTO_get_ex_data");

   procedure CRYPTO_cleanup_all_ex_data;  -- openssl/crypto.h:413
   pragma Import (C, CRYPTO_cleanup_all_ex_data, "CRYPTO_cleanup_all_ex_data");

   function CRYPTO_get_new_lockid (name : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/crypto.h:415
   pragma Import (C, CRYPTO_get_new_lockid, "CRYPTO_get_new_lockid");

   function CRYPTO_num_locks return int;  -- openssl/crypto.h:417
   pragma Import (C, CRYPTO_num_locks, "CRYPTO_num_locks");

   procedure CRYPTO_lock
     (mode   : int;
      c_type : int;
      file   : Interfaces.C.Strings.chars_ptr;
      line   : int);  -- openssl/crypto.h:418
   pragma Import (C, CRYPTO_lock, "CRYPTO_lock");

   procedure CRYPTO_set_locking_callback (func : access procedure
                                            (arg1 : int;
                                             arg2 : int;
                                             arg3 : Interfaces.C.Strings.chars_ptr;
                                             arg4 : int));  -- openssl/crypto.h:419
   pragma Import (C, CRYPTO_set_locking_callback, "CRYPTO_set_locking_callback");

   function CRYPTO_get_locking_callback return access procedure
     (arg1 : int;
      arg2 : int;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int);  -- openssl/crypto.h:421
   pragma Import (C, CRYPTO_get_locking_callback, "CRYPTO_get_locking_callback");

   procedure CRYPTO_set_add_lock_callback (func : access function
                                             (arg1 : access int;
                                              arg2 : int;
                                              arg3 : int;
                                              arg4 : Interfaces.C.Strings.chars_ptr;
                                              arg5 : int) return int);  -- openssl/crypto.h:423
   pragma Import (C, CRYPTO_set_add_lock_callback, "CRYPTO_set_add_lock_callback");

   function CRYPTO_get_add_lock_callback return access function
     (arg1 : access int;
      arg2 : int;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : int) return int;  -- openssl/crypto.h:425
   pragma Import (C, CRYPTO_get_add_lock_callback, "CRYPTO_get_add_lock_callback");

   type crypto_threadid_st is record
      ptr : System.Address;  -- openssl/crypto.h:431
      val : aliased unsigned_long;  -- openssl/crypto.h:432
   end record;
   pragma Convention (C_Pass_By_Copy, crypto_threadid_st);  -- openssl/crypto.h:429

   subtype CRYPTO_THREADID is crypto_threadid_st;

   procedure CRYPTO_THREADID_set_numeric (id : access CRYPTO_THREADID; val : unsigned_long);  -- openssl/crypto.h:435
   pragma Import (C, CRYPTO_THREADID_set_numeric, "CRYPTO_THREADID_set_numeric");

   procedure CRYPTO_THREADID_set_pointer (id : access CRYPTO_THREADID; ptr : System.Address);  -- openssl/crypto.h:436
   pragma Import (C, CRYPTO_THREADID_set_pointer, "CRYPTO_THREADID_set_pointer");

   function CRYPTO_THREADID_set_callback (threadid_func : access procedure (arg1 : access CRYPTO_THREADID)) return int;  -- openssl/crypto.h:437
   pragma Import (C, CRYPTO_THREADID_set_callback, "CRYPTO_THREADID_set_callback");

   function CRYPTO_THREADID_get_callback return access procedure (arg1 : access CRYPTO_THREADID);  -- openssl/crypto.h:438
   pragma Import (C, CRYPTO_THREADID_get_callback, "CRYPTO_THREADID_get_callback");

   procedure CRYPTO_THREADID_current (id : access CRYPTO_THREADID);  -- openssl/crypto.h:439
   pragma Import (C, CRYPTO_THREADID_current, "CRYPTO_THREADID_current");

   function CRYPTO_THREADID_cmp (a : System.Address; b : System.Address) return int;  -- openssl/crypto.h:440
   pragma Import (C, CRYPTO_THREADID_cmp, "CRYPTO_THREADID_cmp");

   procedure CRYPTO_THREADID_cpy (dest : access CRYPTO_THREADID; src : System.Address);  -- openssl/crypto.h:441
   pragma Import (C, CRYPTO_THREADID_cpy, "CRYPTO_THREADID_cpy");

   function CRYPTO_THREADID_hash (id : System.Address) return unsigned_long;  -- openssl/crypto.h:442
   pragma Import (C, CRYPTO_THREADID_hash, "CRYPTO_THREADID_hash");

   procedure CRYPTO_set_id_callback (func : access function return unsigned_long);  -- openssl/crypto.h:444
   pragma Import (C, CRYPTO_set_id_callback, "CRYPTO_set_id_callback");

   function CRYPTO_get_id_callback return access function return unsigned_long;  -- openssl/crypto.h:445
   pragma Import (C, CRYPTO_get_id_callback, "CRYPTO_get_id_callback");

   function CRYPTO_thread_id return unsigned_long;  -- openssl/crypto.h:446
   pragma Import (C, CRYPTO_thread_id, "CRYPTO_thread_id");

   function CRYPTO_get_lock_name (c_type : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/crypto.h:449
   pragma Import (C, CRYPTO_get_lock_name, "CRYPTO_get_lock_name");

   function CRYPTO_add_lock
     (pointer : access int;
      amount  : int;
      c_type  : int;
      file    : Interfaces.C.Strings.chars_ptr;
      line    : int) return int;  -- openssl/crypto.h:450
   pragma Import (C, CRYPTO_add_lock, "CRYPTO_add_lock");

   function CRYPTO_get_new_dynlockid return int;  -- openssl/crypto.h:453
   pragma Import (C, CRYPTO_get_new_dynlockid, "CRYPTO_get_new_dynlockid");

   procedure CRYPTO_destroy_dynlockid (i : int);  -- openssl/crypto.h:454
   pragma Import (C, CRYPTO_destroy_dynlockid, "CRYPTO_destroy_dynlockid");

   function CRYPTO_get_dynlock_value (i : int) return System.Address;  -- openssl/crypto.h:455
   pragma Import (C, CRYPTO_get_dynlock_value, "CRYPTO_get_dynlock_value");

   procedure CRYPTO_set_dynlock_create_callback (dyn_create_function : access function (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return System.Address);  -- openssl/crypto.h:456
   pragma Import (C, CRYPTO_set_dynlock_create_callback, "CRYPTO_set_dynlock_create_callback");

   procedure CRYPTO_set_dynlock_lock_callback (dyn_lock_function : access procedure
                                                 (arg1 : int;
                                                  arg2 : System.Address;
                                                  arg3 : Interfaces.C.Strings.chars_ptr;
                                                  arg4 : int));  -- openssl/crypto.h:457
   pragma Import (C, CRYPTO_set_dynlock_lock_callback, "CRYPTO_set_dynlock_lock_callback");

   procedure CRYPTO_set_dynlock_destroy_callback (dyn_destroy_function : access procedure
                                                    (arg1 : System.Address;
                                                     arg2 : Interfaces.C.Strings.chars_ptr;
                                                     arg3 : int));  -- openssl/crypto.h:458
   pragma Import (C, CRYPTO_set_dynlock_destroy_callback, "CRYPTO_set_dynlock_destroy_callback");

   function CRYPTO_get_dynlock_create_callback return access function (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : int) return System.Address;  -- openssl/crypto.h:459
   pragma Import (C, CRYPTO_get_dynlock_create_callback, "CRYPTO_get_dynlock_create_callback");

   function CRYPTO_get_dynlock_lock_callback return access procedure
     (arg1 : int;
      arg2 : System.Address;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : int);  -- openssl/crypto.h:460
   pragma Import (C, CRYPTO_get_dynlock_lock_callback, "CRYPTO_get_dynlock_lock_callback");

   function CRYPTO_get_dynlock_destroy_callback return access procedure
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int);  -- openssl/crypto.h:461
   pragma Import (C, CRYPTO_get_dynlock_destroy_callback, "CRYPTO_get_dynlock_destroy_callback");

   function CRYPTO_set_mem_functions
     (m : access function (arg1 : size_t) return System.Address;
      r : access function (arg1 : System.Address; arg2 : size_t) return System.Address;
      f : access procedure (arg1 : System.Address)) return int;  -- openssl/crypto.h:465
   pragma Import (C, CRYPTO_set_mem_functions, "CRYPTO_set_mem_functions");

   function CRYPTO_set_locked_mem_functions (m : access function (arg1 : size_t) return System.Address; free_func : access procedure (arg1 : System.Address)) return int;  -- openssl/crypto.h:466
   pragma Import (C, CRYPTO_set_locked_mem_functions, "CRYPTO_set_locked_mem_functions");

   function CRYPTO_set_mem_ex_functions
     (m : access function
        (arg1 : size_t;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int) return System.Address;
      r : access function
        (arg1 : System.Address;
         arg2 : size_t;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int) return System.Address;
      f : access procedure (arg1 : System.Address)) return int;  -- openssl/crypto.h:467
   pragma Import (C, CRYPTO_set_mem_ex_functions, "CRYPTO_set_mem_ex_functions");

   function CRYPTO_set_locked_mem_ex_functions (m                                            : access function
                                                  (arg1 : size_t;
                                                   arg2 : Interfaces.C.Strings.chars_ptr;
                                                   arg3 : int) return System.Address; free_func : access procedure (arg1 : System.Address)) return int;  -- openssl/crypto.h:470
   pragma Import (C, CRYPTO_set_locked_mem_ex_functions, "CRYPTO_set_locked_mem_ex_functions");

   function CRYPTO_set_mem_debug_functions
     (m  : access procedure
        (arg1 : System.Address;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int;
         arg5 : int);
      r  : access procedure
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : int;
         arg4 : Interfaces.C.Strings.chars_ptr;
         arg5 : int;
         arg6 : int);
      f  : access procedure (arg1 : System.Address; arg2 : int);
      so : access procedure (arg1 : long);
      go : access function return long) return int;  -- openssl/crypto.h:472
   pragma Import (C, CRYPTO_set_mem_debug_functions, "CRYPTO_set_mem_debug_functions");

   procedure CRYPTO_get_mem_functions
     (m : System.Address;
      r : System.Address;
      f : System.Address);  -- openssl/crypto.h:477
   pragma Import (C, CRYPTO_get_mem_functions, "CRYPTO_get_mem_functions");

   procedure CRYPTO_get_locked_mem_functions (m : System.Address; f : System.Address);  -- openssl/crypto.h:478
   pragma Import (C, CRYPTO_get_locked_mem_functions, "CRYPTO_get_locked_mem_functions");

   procedure CRYPTO_get_mem_ex_functions
     (m : System.Address;
      r : System.Address;
      f : System.Address);  -- openssl/crypto.h:479
   pragma Import (C, CRYPTO_get_mem_ex_functions, "CRYPTO_get_mem_ex_functions");

   procedure CRYPTO_get_locked_mem_ex_functions (m : System.Address; f : System.Address);  -- openssl/crypto.h:482
   pragma Import (C, CRYPTO_get_locked_mem_ex_functions, "CRYPTO_get_locked_mem_ex_functions");

   procedure CRYPTO_get_mem_debug_functions
     (m  : System.Address;
      r  : System.Address;
      f  : System.Address;
      so : System.Address;
      go : System.Address);  -- openssl/crypto.h:484
   pragma Import (C, CRYPTO_get_mem_debug_functions, "CRYPTO_get_mem_debug_functions");

   function CRYPTO_malloc_locked
     (num  : int;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return System.Address;  -- openssl/crypto.h:490
   pragma Import (C, CRYPTO_malloc_locked, "CRYPTO_malloc_locked");

   procedure CRYPTO_free_locked (arg1 : System.Address);  -- openssl/crypto.h:491
   pragma Import (C, CRYPTO_free_locked, "CRYPTO_free_locked");

   function CRYPTO_malloc
     (num  : int;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return System.Address;  -- openssl/crypto.h:492
   pragma Import (C, CRYPTO_malloc, "CRYPTO_malloc");

   function CRYPTO_strdup
     (str  : Interfaces.C.Strings.chars_ptr;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/crypto.h:493
   pragma Import (C, CRYPTO_strdup, "CRYPTO_strdup");

   procedure CRYPTO_free (arg1 : System.Address);  -- openssl/crypto.h:494
   pragma Import (C, CRYPTO_free, "CRYPTO_free");

   function CRYPTO_realloc
     (addr : System.Address;
      num  : int;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return System.Address;  -- openssl/crypto.h:495
   pragma Import (C, CRYPTO_realloc, "CRYPTO_realloc");

   function CRYPTO_realloc_clean
     (addr    : System.Address;
      old_num : int;
      num     : int;
      file    : Interfaces.C.Strings.chars_ptr;
      line    : int) return System.Address;  -- openssl/crypto.h:496
   pragma Import (C, CRYPTO_realloc_clean, "CRYPTO_realloc_clean");

   function CRYPTO_remalloc
     (addr : System.Address;
      num  : int;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return System.Address;  -- openssl/crypto.h:498
   pragma Import (C, CRYPTO_remalloc, "CRYPTO_remalloc");

   procedure OPENSSL_cleanse (ptr : System.Address; len : size_t);  -- openssl/crypto.h:500
   pragma Import (C, OPENSSL_cleanse, "OPENSSL_cleanse");

   procedure CRYPTO_set_mem_debug_options (bits : long);  -- openssl/crypto.h:502
   pragma Import (C, CRYPTO_set_mem_debug_options, "CRYPTO_set_mem_debug_options");

   function CRYPTO_get_mem_debug_options return long;  -- openssl/crypto.h:503
   pragma Import (C, CRYPTO_get_mem_debug_options, "CRYPTO_get_mem_debug_options");

   function CRYPTO_push_info_u
     (info : Interfaces.C.Strings.chars_ptr;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return int;  -- openssl/crypto.h:507
   pragma Import (C, CRYPTO_push_info_u, "CRYPTO_push_info_");

   function CRYPTO_pop_info return int;  -- openssl/crypto.h:508
   pragma Import (C, CRYPTO_pop_info, "CRYPTO_pop_info");

   function CRYPTO_remove_all_info return int;  -- openssl/crypto.h:509
   pragma Import (C, CRYPTO_remove_all_info, "CRYPTO_remove_all_info");

   procedure CRYPTO_dbg_malloc
     (addr     : System.Address;
      num      : int;
      file     : Interfaces.C.Strings.chars_ptr;
      line     : int;
      before_p : int);  -- openssl/crypto.h:519
   pragma Import (C, CRYPTO_dbg_malloc, "CRYPTO_dbg_malloc");

   procedure CRYPTO_dbg_realloc
     (addr1    : System.Address;
      addr2    : System.Address;
      num      : int;
      file     : Interfaces.C.Strings.chars_ptr;
      line     : int;
      before_p : int);  -- openssl/crypto.h:520
   pragma Import (C, CRYPTO_dbg_realloc, "CRYPTO_dbg_realloc");

   procedure CRYPTO_dbg_free (addr : System.Address; before_p : int);  -- openssl/crypto.h:521
   pragma Import (C, CRYPTO_dbg_free, "CRYPTO_dbg_free");

   procedure CRYPTO_dbg_set_options (bits : long);  -- openssl/crypto.h:530
   pragma Import (C, CRYPTO_dbg_set_options, "CRYPTO_dbg_set_options");

   function CRYPTO_dbg_get_options return long;  -- openssl/crypto.h:531
   pragma Import (C, CRYPTO_dbg_get_options, "CRYPTO_dbg_get_options");

   procedure CRYPTO_mem_leaks_fp (arg1 : access Interfaces.C_Streams.FILEs);  -- openssl/crypto.h:535
   pragma Import (C, CRYPTO_mem_leaks_fp, "CRYPTO_mem_leaks_fp");

   procedure CRYPTO_mem_leaks (bio : access OpenSSL.Low_Level.bio_h.bio_st);  -- openssl/crypto.h:537
   pragma Import (C, CRYPTO_mem_leaks, "CRYPTO_mem_leaks");

   --  skipped function type CRYPTO_MEM_LEAK_CB

   procedure CRYPTO_mem_leaks_cb (cb : access function
                                    (arg1 : unsigned_long;
                                     arg2 : Interfaces.C.Strings.chars_ptr;
                                     arg3 : int;
                                     arg4 : int;
                                     arg5 : System.Address) return System.Address);  -- openssl/crypto.h:540
   pragma Import (C, CRYPTO_mem_leaks_cb, "CRYPTO_mem_leaks_cb");

   procedure OpenSSLDie
     (file      : Interfaces.C.Strings.chars_ptr;
      line      : int;
      assertion : Interfaces.C.Strings.chars_ptr);  -- openssl/crypto.h:543
   pragma Import (C, OpenSSLDie, "OpenSSLDie");

   function OPENSSL_ia32cap_loc return access unsigned_long;  -- openssl/crypto.h:546
   pragma Import (C, OPENSSL_ia32cap_loc, "OPENSSL_ia32cap_loc");

   function OPENSSL_isservice return int;  -- openssl/crypto.h:548
   pragma Import (C, OPENSSL_isservice, "OPENSSL_isservice");

   procedure ERR_load_CRYPTO_strings;  -- openssl/crypto.h:609
   pragma Import (C, ERR_load_CRYPTO_strings, "ERR_load_CRYPTO_strings");

   procedure OPENSSL_init_library;  -- openssl/crypto.h:612
   pragma Import (C, OPENSSL_init_library, "OPENSSL_init_library");

end OpenSSL.Low_Level.crypto_h;
