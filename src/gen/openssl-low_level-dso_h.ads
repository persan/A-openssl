with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
limited with OpenSSL.Low_Level.crypto_h;
--  with OpenSSL.Low_Level.ossl_typ_h;

package OpenSSL.Low_Level.dso_h is


   DSO_CTRL_GET_FLAGS : constant := 1;  --  openssl/dso.h:69
   DSO_CTRL_SET_FLAGS : constant := 2;  --  openssl/dso.h:70
   DSO_CTRL_OR_FLAGS : constant := 3;  --  openssl/dso.h:71

   DSO_FLAG_NO_NAME_TRANSLATION : constant := 16#01#;  --  openssl/dso.h:84

   DSO_FLAG_NAME_TRANSLATION_EXT_ONLY : constant := 16#02#;  --  openssl/dso.h:91

   DSO_FLAG_UPCASE_SYMBOL : constant := 16#10#;  --  openssl/dso.h:96

   DSO_FLAG_GLOBAL_SYMBOLS : constant := 16#20#;  --  openssl/dso.h:103

   DSO_F_BEOS_BIND_FUNC : constant := 144;  --  openssl/dso.h:337
   DSO_F_BEOS_BIND_VAR : constant := 145;  --  openssl/dso.h:338
   DSO_F_BEOS_LOAD : constant := 146;  --  openssl/dso.h:339
   DSO_F_BEOS_NAME_CONVERTER : constant := 147;  --  openssl/dso.h:340
   DSO_F_BEOS_UNLOAD : constant := 148;  --  openssl/dso.h:341
   DSO_F_DLFCN_BIND_FUNC : constant := 100;  --  openssl/dso.h:342
   DSO_F_DLFCN_BIND_VAR : constant := 101;  --  openssl/dso.h:343
   DSO_F_DLFCN_LOAD : constant := 102;  --  openssl/dso.h:344
   DSO_F_DLFCN_MERGER : constant := 130;  --  openssl/dso.h:345
   DSO_F_DLFCN_NAME_CONVERTER : constant := 123;  --  openssl/dso.h:346
   DSO_F_DLFCN_UNLOAD : constant := 103;  --  openssl/dso.h:347
   DSO_F_DL_BIND_FUNC : constant := 104;  --  openssl/dso.h:348
   DSO_F_DL_BIND_VAR : constant := 105;  --  openssl/dso.h:349
   DSO_F_DL_LOAD : constant := 106;  --  openssl/dso.h:350
   DSO_F_DL_MERGER : constant := 131;  --  openssl/dso.h:351
   DSO_F_DL_NAME_CONVERTER : constant := 124;  --  openssl/dso.h:352
   DSO_F_DL_UNLOAD : constant := 107;  --  openssl/dso.h:353
   DSO_F_DSO_BIND_FUNC : constant := 108;  --  openssl/dso.h:354
   DSO_F_DSO_BIND_VAR : constant := 109;  --  openssl/dso.h:355
   DSO_F_DSO_CONVERT_FILENAME : constant := 126;  --  openssl/dso.h:356
   DSO_F_DSO_CTRL : constant := 110;  --  openssl/dso.h:357
   DSO_F_DSO_FREE : constant := 111;  --  openssl/dso.h:358
   DSO_F_DSO_GET_FILENAME : constant := 127;  --  openssl/dso.h:359
   DSO_F_DSO_GET_LOADED_FILENAME : constant := 128;  --  openssl/dso.h:360
   DSO_F_DSO_GLOBAL_LOOKUP : constant := 139;  --  openssl/dso.h:361
   DSO_F_DSO_LOAD : constant := 112;  --  openssl/dso.h:362
   DSO_F_DSO_MERGE : constant := 132;  --  openssl/dso.h:363
   DSO_F_DSO_NEW_METHOD : constant := 113;  --  openssl/dso.h:364
   DSO_F_DSO_PATHBYADDR : constant := 140;  --  openssl/dso.h:365
   DSO_F_DSO_SET_FILENAME : constant := 129;  --  openssl/dso.h:366
   DSO_F_DSO_SET_NAME_CONVERTER : constant := 122;  --  openssl/dso.h:367
   DSO_F_DSO_UP_REF : constant := 114;  --  openssl/dso.h:368
   DSO_F_GLOBAL_LOOKUP_FUNC : constant := 138;  --  openssl/dso.h:369
   DSO_F_PATHBYADDR : constant := 137;  --  openssl/dso.h:370
   DSO_F_VMS_BIND_SYM : constant := 115;  --  openssl/dso.h:371
   DSO_F_VMS_LOAD : constant := 116;  --  openssl/dso.h:372
   DSO_F_VMS_MERGER : constant := 133;  --  openssl/dso.h:373
   DSO_F_VMS_UNLOAD : constant := 117;  --  openssl/dso.h:374
   DSO_F_WIN32_BIND_FUNC : constant := 118;  --  openssl/dso.h:375
   DSO_F_WIN32_BIND_VAR : constant := 119;  --  openssl/dso.h:376
   DSO_F_WIN32_GLOBALLOOKUP : constant := 142;  --  openssl/dso.h:377
   DSO_F_WIN32_GLOBALLOOKUP_FUNC : constant := 143;  --  openssl/dso.h:378
   DSO_F_WIN32_JOINER : constant := 135;  --  openssl/dso.h:379
   DSO_F_WIN32_LOAD : constant := 120;  --  openssl/dso.h:380
   DSO_F_WIN32_MERGER : constant := 134;  --  openssl/dso.h:381
   DSO_F_WIN32_NAME_CONVERTER : constant := 125;  --  openssl/dso.h:382
   DSO_F_WIN32_PATHBYADDR : constant := 141;  --  openssl/dso.h:383
   DSO_F_WIN32_SPLITTER : constant := 136;  --  openssl/dso.h:384
   DSO_F_WIN32_UNLOAD : constant := 121;  --  openssl/dso.h:385

   DSO_R_CTRL_FAILED : constant := 100;  --  openssl/dso.h:388
   DSO_R_DSO_ALREADY_LOADED : constant := 110;  --  openssl/dso.h:389
   DSO_R_EMPTY_FILE_STRUCTURE : constant := 113;  --  openssl/dso.h:390
   DSO_R_FAILURE : constant := 114;  --  openssl/dso.h:391
   DSO_R_FILENAME_TOO_BIG : constant := 101;  --  openssl/dso.h:392
   DSO_R_FINISH_FAILED : constant := 102;  --  openssl/dso.h:393
   DSO_R_INCORRECT_FILE_SYNTAX : constant := 115;  --  openssl/dso.h:394
   DSO_R_LOAD_FAILED : constant := 103;  --  openssl/dso.h:395
   DSO_R_NAME_TRANSLATION_FAILED : constant := 109;  --  openssl/dso.h:396
   DSO_R_NO_FILENAME : constant := 111;  --  openssl/dso.h:397
   DSO_R_NO_FILE_SPECIFICATION : constant := 116;  --  openssl/dso.h:398
   DSO_R_NULL_HANDLE : constant := 104;  --  openssl/dso.h:399
   DSO_R_SET_FILENAME_FAILED : constant := 112;  --  openssl/dso.h:400
   DSO_R_STACK_ERROR : constant := 105;  --  openssl/dso.h:401
   DSO_R_SYM_FAILURE : constant := 106;  --  openssl/dso.h:402
   DSO_R_UNLOAD_FAILED : constant := 107;  --  openssl/dso.h:403
   DSO_R_UNSUPPORTED : constant := 108;  --  openssl/dso.h:404

   type DSO_FUNC_TYPE is access procedure;  -- openssl/dso.h:106

   type dso_st;
   subtype DSO is dso_st;

   type DSO_NAME_CONVERTER_FUNC is access function (arg1 : access DSO; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:116

   type DSO_MERGER_FUNC is access function
        (arg1 : access DSO;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:132

   type dso_meth_st is record
      name : Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:136
      dso_load : access function (arg1 : access DSO) return int;  -- openssl/dso.h:140
      dso_unload : access function (arg1 : access DSO) return int;  -- openssl/dso.h:142
      dso_bind_var : access function (arg1 : access DSO; arg2 : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/dso.h:144
      dso_bind_func : access function (arg1 : access DSO; arg2 : Interfaces.C.Strings.chars_ptr) return access procedure;  -- openssl/dso.h:151
      dso_ctrl : access function
           (arg1 : access DSO;
            arg2 : int;
            arg3 : long;
            arg4 : System.Address) return long;  -- openssl/dso.h:162
      dso_name_converter : access function (arg1 : access DSO; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:165
      dso_merger : access function
           (arg1 : access DSO;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:168
      init : access function (arg1 : access DSO) return int;  -- openssl/dso.h:171
      finish : access function (arg1 : access DSO) return int;  -- openssl/dso.h:172
      pathbyaddr : access function
           (arg1 : System.Address;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : int) return int;  -- openssl/dso.h:175
      globallookup : access function (arg1 : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/dso.h:177
   end record;
   pragma Convention (C_Pass_By_Copy, dso_meth_st);  -- openssl/dso.h:134

   subtype DSO_METHOD is dso_meth_st;

   type dso_st is record
      meth : access DSO_METHOD;  -- openssl/dso.h:185
      meth_data : access OpenSSL.Low_Level.crypto_h.stack_st_void;  -- openssl/dso.h:191
      references : aliased int;  -- openssl/dso.h:192
      flags : aliased int;  -- openssl/dso.h:193
      ex_data : aliased OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;  -- openssl/dso.h:196
      name_converter : access function (arg1 : access DSO; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:200
      merger : access function
           (arg1 : access DSO;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:204
      filename : Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:207
      loaded_filename : Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:217
   end record;
   pragma Convention (C_Pass_By_Copy, dso_st);  -- openssl/dso.h:183

   function DSO_new return access DSO;  -- openssl/dso.h:221
   pragma Import (C, DSO_new, "DSO_new");

   function DSO_new_method (method : access DSO_METHOD) return access DSO;  -- openssl/dso.h:222
   pragma Import (C, DSO_new_method, "DSO_new_method");

   function DSO_free (the_dso : access DSO) return int;  -- openssl/dso.h:223
   pragma Import (C, DSO_free, "DSO_free");

   function DSO_flags (the_dso : access DSO) return int;  -- openssl/dso.h:224
   pragma Import (C, DSO_flags, "DSO_flags");

   function DSO_up_ref (the_dso : access DSO) return int;  -- openssl/dso.h:225
   pragma Import (C, DSO_up_ref, "DSO_up_ref");

   function DSO_ctrl
     (the_dso : access DSO;
      cmd : int;
      larg : long;
      parg : System.Address) return long;  -- openssl/dso.h:226
   pragma Import (C, DSO_ctrl, "DSO_ctrl");

   function DSO_set_name_converter
     (the_dso : access DSO;
      cb : access function (arg1 : access DSO; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;
      oldcb : System.Address) return int;  -- openssl/dso.h:232
   pragma Import (C, DSO_set_name_converter, "DSO_set_name_converter");

   function DSO_get_filename (the_dso : access DSO) return Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:236
   pragma Import (C, DSO_get_filename, "DSO_get_filename");

   function DSO_set_filename (the_dso : access DSO; filename : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/dso.h:237
   pragma Import (C, DSO_set_filename, "DSO_set_filename");

   function DSO_convert_filename (the_dso : access DSO; filename : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:246
   pragma Import (C, DSO_convert_filename, "DSO_convert_filename");

   function DSO_merge
     (the_dso : access DSO;
      filespec1 : Interfaces.C.Strings.chars_ptr;
      filespec2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:251
   pragma Import (C, DSO_merge, "DSO_merge");

   function DSO_get_loaded_filename (the_dso : access DSO) return Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:259
   pragma Import (C, DSO_get_loaded_filename, "DSO_get_loaded_filename");

   procedure DSO_set_default_method (meth : access DSO_METHOD);  -- openssl/dso.h:261
   pragma Import (C, DSO_set_default_method, "DSO_set_default_method");

   function DSO_get_default_method return access DSO_METHOD;  -- openssl/dso.h:262
   pragma Import (C, DSO_get_default_method, "DSO_get_default_method");

   function DSO_get_method (the_dso : access DSO) return access DSO_METHOD;  -- openssl/dso.h:263
   pragma Import (C, DSO_get_method, "DSO_get_method");

   function DSO_set_method (the_dso : access DSO; meth : access DSO_METHOD) return access DSO_METHOD;  -- openssl/dso.h:264
   pragma Import (C, DSO_set_method, "DSO_set_method");

   function DSO_load
     (the_dso : access DSO;
      filename : Interfaces.C.Strings.chars_ptr;
      meth : access DSO_METHOD;
      flags : int) return access DSO;  -- openssl/dso.h:271
   pragma Import (C, DSO_load, "DSO_load");

   function DSO_bind_var (the_dso : access DSO; symname : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/dso.h:274
   pragma Import (C, DSO_bind_var, "DSO_bind_var");

   function DSO_bind_func (the_dso : access DSO; symname : Interfaces.C.Strings.chars_ptr) return access procedure;  -- openssl/dso.h:277
   pragma Import (C, DSO_bind_func, "DSO_bind_func");

   function DSO_METHOD_openssl return access DSO_METHOD;  -- openssl/dso.h:282
   pragma Import (C, DSO_METHOD_openssl, "DSO_METHOD_openssl");

   function DSO_METHOD_null return access DSO_METHOD;  -- openssl/dso.h:286
   pragma Import (C, DSO_METHOD_null, "DSO_METHOD_null");

   function DSO_METHOD_dlfcn return access DSO_METHOD;  -- openssl/dso.h:291
   pragma Import (C, DSO_METHOD_dlfcn, "DSO_METHOD_dlfcn");

   function DSO_METHOD_dl return access DSO_METHOD;  -- openssl/dso.h:296
   pragma Import (C, DSO_METHOD_dl, "DSO_METHOD_dl");

   function DSO_METHOD_win32 return access DSO_METHOD;  -- openssl/dso.h:299
   pragma Import (C, DSO_METHOD_win32, "DSO_METHOD_win32");

   function DSO_METHOD_vms return access DSO_METHOD;  -- openssl/dso.h:302
   pragma Import (C, DSO_METHOD_vms, "DSO_METHOD_vms");

   function DSO_pathbyaddr
     (addr : System.Address;
      path : Interfaces.C.Strings.chars_ptr;
      sz : int) return int;  -- openssl/dso.h:313
   pragma Import (C, DSO_pathbyaddr, "DSO_pathbyaddr");

   function DSO_global_lookup (name : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/dso.h:323
   pragma Import (C, DSO_global_lookup, "DSO_global_lookup");

   function DSO_METHOD_beos return access DSO_METHOD;  -- openssl/dso.h:326
   pragma Import (C, DSO_METHOD_beos, "DSO_METHOD_beos");

   procedure ERR_load_DSO_strings;  -- openssl/dso.h:332
   pragma Import (C, ERR_load_DSO_strings, "ERR_load_DSO_strings");

end OpenSSL.Low_Level.dso_h;
