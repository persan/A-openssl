with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with OpenSSL.Low_Level.stack_h;
--  limited --  with OpenSSL.Low_Level.ossl_typ_h;
limited with OpenSSL.Low_Level.bio_h;
--  limited --  with Interfaces.C_Streams;
with System;

package OpenSSL.Low_Level.conf_h is


   CONF_MFLAGS_IGNORE_ERRORS : constant := 16#1#;  --  openssl/conf.h:114
   CONF_MFLAGS_IGNORE_RETURN_CODES : constant := 16#2#;  --  openssl/conf.h:115
   CONF_MFLAGS_SILENT : constant := 16#4#;  --  openssl/conf.h:116
   CONF_MFLAGS_NO_DSO : constant := 16#8#;  --  openssl/conf.h:117
   CONF_MFLAGS_IGNORE_MISSING_FILE : constant := 16#10#;  --  openssl/conf.h:118
   CONF_MFLAGS_DEFAULT_SECTION : constant := 16#20#;  --  openssl/conf.h:119
   --  arg-macro: procedure NCONF_get_number (c, g, n, r)
   --    NCONF_get_number_e(c,g,n,r)

   CONF_F_CONF_DUMP_FP : constant := 104;  --  openssl/conf.h:219
   CONF_F_CONF_LOAD : constant := 100;  --  openssl/conf.h:220
   CONF_F_CONF_LOAD_BIO : constant := 102;  --  openssl/conf.h:221
   CONF_F_CONF_LOAD_FP : constant := 103;  --  openssl/conf.h:222
   CONF_F_CONF_MODULES_LOAD : constant := 116;  --  openssl/conf.h:223
   CONF_F_CONF_PARSE_LIST : constant := 119;  --  openssl/conf.h:224
   CONF_F_DEF_LOAD : constant := 120;  --  openssl/conf.h:225
   CONF_F_DEF_LOAD_BIO : constant := 121;  --  openssl/conf.h:226
   CONF_F_MODULE_INIT : constant := 115;  --  openssl/conf.h:227
   CONF_F_MODULE_LOAD_DSO : constant := 117;  --  openssl/conf.h:228
   CONF_F_MODULE_RUN : constant := 118;  --  openssl/conf.h:229
   CONF_F_NCONF_DUMP_BIO : constant := 105;  --  openssl/conf.h:230
   CONF_F_NCONF_DUMP_FP : constant := 106;  --  openssl/conf.h:231
   CONF_F_NCONF_GET_NUMBER : constant := 107;  --  openssl/conf.h:232
   CONF_F_NCONF_GET_NUMBER_E : constant := 112;  --  openssl/conf.h:233
   CONF_F_NCONF_GET_SECTION : constant := 108;  --  openssl/conf.h:234
   CONF_F_NCONF_GET_STRING : constant := 109;  --  openssl/conf.h:235
   CONF_F_NCONF_LOAD : constant := 113;  --  openssl/conf.h:236
   CONF_F_NCONF_LOAD_BIO : constant := 110;  --  openssl/conf.h:237
   CONF_F_NCONF_LOAD_FP : constant := 114;  --  openssl/conf.h:238
   CONF_F_NCONF_NEW : constant := 111;  --  openssl/conf.h:239
   CONF_F_STR_COPY : constant := 101;  --  openssl/conf.h:240

   CONF_R_ERROR_LOADING_DSO : constant := 110;  --  openssl/conf.h:243
   CONF_R_LIST_CANNOT_BE_NULL : constant := 115;  --  openssl/conf.h:244
   CONF_R_MISSING_CLOSE_SQUARE_BRACKET : constant := 100;  --  openssl/conf.h:245
   CONF_R_MISSING_EQUAL_SIGN : constant := 101;  --  openssl/conf.h:246
   CONF_R_MISSING_FINISH_FUNCTION : constant := 111;  --  openssl/conf.h:247
   CONF_R_MISSING_INIT_FUNCTION : constant := 112;  --  openssl/conf.h:248
   CONF_R_MODULE_INITIALIZATION_ERROR : constant := 109;  --  openssl/conf.h:249
   CONF_R_NO_CLOSE_BRACE : constant := 102;  --  openssl/conf.h:250
   CONF_R_NO_CONF : constant := 105;  --  openssl/conf.h:251
   CONF_R_NO_CONF_OR_ENVIRONMENT_VARIABLE : constant := 106;  --  openssl/conf.h:252
   CONF_R_NO_SECTION : constant := 107;  --  openssl/conf.h:253
   CONF_R_NO_SUCH_FILE : constant := 114;  --  openssl/conf.h:254
   CONF_R_NO_VALUE : constant := 108;  --  openssl/conf.h:255
   CONF_R_UNABLE_TO_CREATE_NEW_SECTION : constant := 103;  --  openssl/conf.h:256
   CONF_R_UNKNOWN_MODULE_NAME : constant := 113;  --  openssl/conf.h:257
   CONF_R_VARIABLE_HAS_NO_VALUE : constant := 104;  --  openssl/conf.h:258

   type CONF_VALUE is record
      section : Interfaces.C.Strings.chars_ptr;  -- openssl/conf.h:76
      name : Interfaces.C.Strings.chars_ptr;  -- openssl/conf.h:77
      value : Interfaces.C.Strings.chars_ptr;  -- openssl/conf.h:78
   end record;
   pragma Convention (C_Pass_By_Copy, CONF_VALUE);  -- openssl/conf.h:79

   --  skipped anonymous struct anon_41

   type stack_st_CONF_VALUE is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/conf.h:81
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_CONF_VALUE);  -- openssl/conf.h:81

   type lhash_st_CONF_VALUE is record
      dummy : aliased int;  -- openssl/conf.h:82
   end record;
   pragma Convention (C_Pass_By_Copy, lhash_st_CONF_VALUE);  -- openssl/conf.h:82

   type conf_method_st;
   type conf_st;
   subtype CONF_METHOD is conf_method_st;

   type conf_method_st is record
      name : Interfaces.C.Strings.chars_ptr;  -- openssl/conf.h:90
      create : access function (arg1 : access CONF_METHOD) return access OpenSSL.Low_Level.conf_h.conf_st;  -- openssl/conf.h:91
      init : access function (arg1 : access OpenSSL.Low_Level.conf_h.conf_st) return int;  -- openssl/conf.h:92
      destroy : access function (arg1 : access OpenSSL.Low_Level.conf_h.conf_st) return int;  -- openssl/conf.h:93
      destroy_data : access function (arg1 : access OpenSSL.Low_Level.conf_h.conf_st) return int;  -- openssl/conf.h:94
      load_bio : access function
           (arg1 : access OpenSSL.Low_Level.conf_h.conf_st;
            arg2 : access OpenSSL.Low_Level.bio_h.BIO;
            arg3 : access long) return int;  -- openssl/conf.h:95
      dump : access function (arg1 : access constant OpenSSL.Low_Level.conf_h.conf_st; arg2 : access OpenSSL.Low_Level.bio_h.BIO) return int;  -- openssl/conf.h:96
      is_number : access function (arg1 : access constant OpenSSL.Low_Level.conf_h.conf_st; arg2 : char) return int;  -- openssl/conf.h:97
      to_int : access function (arg1 : access constant OpenSSL.Low_Level.conf_h.conf_st; arg2 : char) return int;  -- openssl/conf.h:98
      load : access function
           (arg1 : access OpenSSL.Low_Level.conf_h.conf_st;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : access long) return int;  -- openssl/conf.h:99
   end record;
   pragma Convention (C_Pass_By_Copy, conf_method_st);  -- openssl/conf.h:88

   --  skipped empty struct conf_imodule_st

   --  skipped empty struct CONF_IMODULE

   --  skipped empty struct conf_module_st

   --  skipped empty struct CONF_MODULE

   type stack_st_CONF_MODULE is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/conf.h:107
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_CONF_MODULE);  -- openssl/conf.h:107

   type stack_st_CONF_IMODULE is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/conf.h:108
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_CONF_IMODULE);  -- openssl/conf.h:108

   --  skipped function type conf_init_func

   --  skipped function type conf_finish_func

   function CONF_set_default_method (meth : access CONF_METHOD) return int;  -- openssl/conf.h:121
   pragma Import (C, CONF_set_default_method, "CONF_set_default_method");

   procedure CONF_set_nconf (the_conf : access OpenSSL.Low_Level.conf_h.conf_st; hash : access lhash_st_CONF_VALUE);  -- openssl/conf.h:122
   pragma Import (C, CONF_set_nconf, "CONF_set_nconf");

   function CONF_load
     (conf : access lhash_st_CONF_VALUE;
      file : Interfaces.C.Strings.chars_ptr;
      eline : access long) return access lhash_st_CONF_VALUE;  -- openssl/conf.h:123
   pragma Import (C, CONF_load, "CONF_load");

   function CONF_load_fp
     (conf : access lhash_st_CONF_VALUE;
      fp : access Interfaces.C_Streams.FILEs;
      eline : access long) return access lhash_st_CONF_VALUE;  -- openssl/conf.h:126
   pragma Import (C, CONF_load_fp, "CONF_load_fp");

   function CONF_load_bio
     (conf : access lhash_st_CONF_VALUE;
      bp : access OpenSSL.Low_Level.bio_h.BIO;
      eline : access long) return access lhash_st_CONF_VALUE;  -- openssl/conf.h:129
   pragma Import (C, CONF_load_bio, "CONF_load_bio");

   function CONF_get_section (conf : access lhash_st_CONF_VALUE; section : Interfaces.C.Strings.chars_ptr) return access stack_st_CONF_VALUE;  -- openssl/conf.h:130
   pragma Import (C, CONF_get_section, "CONF_get_section");

   function CONF_get_string
     (conf : access lhash_st_CONF_VALUE;
      group : Interfaces.C.Strings.chars_ptr;
      name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/conf.h:132
   pragma Import (C, CONF_get_string, "CONF_get_string");

   function CONF_get_number
     (conf : access lhash_st_CONF_VALUE;
      group : Interfaces.C.Strings.chars_ptr;
      name : Interfaces.C.Strings.chars_ptr) return long;  -- openssl/conf.h:134
   pragma Import (C, CONF_get_number, "CONF_get_number");

   procedure CONF_free (conf : access lhash_st_CONF_VALUE);  -- openssl/conf.h:136
   pragma Import (C, CONF_free, "CONF_free");

   function CONF_dump_fp (conf : access lhash_st_CONF_VALUE; c_out : access Interfaces.C_Streams.FILEs) return int;  -- openssl/conf.h:137
   pragma Import (C, CONF_dump_fp, "CONF_dump_fp");

   function CONF_dump_bio (conf : access lhash_st_CONF_VALUE; c_out : access OpenSSL.Low_Level.bio_h.BIO) return int;  -- openssl/conf.h:138
   pragma Import (C, CONF_dump_bio, "CONF_dump_bio");

   procedure OPENSSL_config (config_name : Interfaces.C.Strings.chars_ptr);  -- openssl/conf.h:140
   pragma Import (C, OPENSSL_config, "OPENSSL_config");

   procedure OPENSSL_no_config;  -- openssl/conf.h:141
   pragma Import (C, OPENSSL_no_config, "OPENSSL_no_config");

   type conf_st is record
      meth : access CONF_METHOD;  -- openssl/conf.h:148
      meth_data : System.Address;  -- openssl/conf.h:149
      data : access lhash_st_CONF_VALUE;  -- openssl/conf.h:150
   end record;
   pragma Convention (C_Pass_By_Copy, conf_st);  -- openssl/conf.h:146

   function NCONF_new (meth : access CONF_METHOD) return access OpenSSL.Low_Level.conf_h.conf_st;  -- openssl/conf.h:153
   pragma Import (C, NCONF_new, "NCONF_new");

   function NCONF_default return access CONF_METHOD;  -- openssl/conf.h:154
   pragma Import (C, NCONF_default, "NCONF_default");

   function NCONF_WIN32 return access CONF_METHOD;  -- openssl/conf.h:155
   pragma Import (C, NCONF_WIN32, "NCONF_WIN32");

   procedure NCONF_free (the_conf : access OpenSSL.Low_Level.conf_h.conf_st);  -- openssl/conf.h:159
   pragma Import (C, NCONF_free, "NCONF_free");

   procedure NCONF_free_data (the_conf : access OpenSSL.Low_Level.conf_h.conf_st);  -- openssl/conf.h:160
   pragma Import (C, NCONF_free_data, "NCONF_free_data");

   function NCONF_load
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      file : Interfaces.C.Strings.chars_ptr;
      eline : access long) return int;  -- openssl/conf.h:162
   pragma Import (C, NCONF_load, "NCONF_load");

   function NCONF_load_fp
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      fp : access Interfaces.C_Streams.FILEs;
      eline : access long) return int;  -- openssl/conf.h:164
   pragma Import (C, NCONF_load_fp, "NCONF_load_fp");

   function NCONF_load_bio
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      bp : access OpenSSL.Low_Level.bio_h.BIO;
      eline : access long) return int;  -- openssl/conf.h:166
   pragma Import (C, NCONF_load_bio, "NCONF_load_bio");

   function NCONF_get_section (the_conf : access constant OpenSSL.Low_Level.conf_h.conf_st; section : Interfaces.C.Strings.chars_ptr) return access stack_st_CONF_VALUE;  -- openssl/conf.h:167
   pragma Import (C, NCONF_get_section, "NCONF_get_section");

   function NCONF_get_string
     (the_conf : access constant OpenSSL.Low_Level.conf_h.conf_st;
      group : Interfaces.C.Strings.chars_ptr;
      name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/conf.h:168
   pragma Import (C, NCONF_get_string, "NCONF_get_string");

   function NCONF_get_number_e
     (the_conf : access constant OpenSSL.Low_Level.conf_h.conf_st;
      group : Interfaces.C.Strings.chars_ptr;
      name : Interfaces.C.Strings.chars_ptr;
      result : access long) return int;  -- openssl/conf.h:169
   pragma Import (C, NCONF_get_number_e, "NCONF_get_number_e");

   function NCONF_dump_fp (the_conf : access constant OpenSSL.Low_Level.conf_h.conf_st; c_out : access Interfaces.C_Streams.FILEs) return int;  -- openssl/conf.h:171
   pragma Import (C, NCONF_dump_fp, "NCONF_dump_fp");

   function NCONF_dump_bio (the_conf : access constant OpenSSL.Low_Level.conf_h.conf_st; c_out : access OpenSSL.Low_Level.bio_h.BIO) return int;  -- openssl/conf.h:172
   pragma Import (C, NCONF_dump_bio, "NCONF_dump_bio");

   function CONF_modules_load
     (cnf : access constant OpenSSL.Low_Level.conf_h.conf_st;
      appname : Interfaces.C.Strings.chars_ptr;
      flags : unsigned_long) return int;  -- openssl/conf.h:183
   pragma Import (C, CONF_modules_load, "CONF_modules_load");

   function CONF_modules_load_file
     (filename : Interfaces.C.Strings.chars_ptr;
      appname : Interfaces.C.Strings.chars_ptr;
      flags : unsigned_long) return int;  -- openssl/conf.h:185
   pragma Import (C, CONF_modules_load_file, "CONF_modules_load_file");

   procedure CONF_modules_unload (c_all : int);  -- openssl/conf.h:187
   pragma Import (C, CONF_modules_unload, "CONF_modules_unload");

   procedure CONF_modules_finish;  -- openssl/conf.h:188
   pragma Import (C, CONF_modules_finish, "CONF_modules_finish");

   procedure CONF_modules_free;  -- openssl/conf.h:189
   pragma Import (C, CONF_modules_free, "CONF_modules_free");

   function CONF_module_add
     (name : Interfaces.C.Strings.chars_ptr;
      ifunc : access function (arg1 : System.Address; arg2 : access constant OpenSSL.Low_Level.conf_h.conf_st) return int;
      ffunc : access procedure (arg1 : System.Address)) return int;  -- openssl/conf.h:190
   pragma Import (C, CONF_module_add, "CONF_module_add");

   function CONF_imodule_get_name (md : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/conf.h:193
   pragma Import (C, CONF_imodule_get_name, "CONF_imodule_get_name");

   function CONF_imodule_get_value (md : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/conf.h:194
   pragma Import (C, CONF_imodule_get_value, "CONF_imodule_get_value");

   function CONF_imodule_get_usr_data (md : System.Address) return System.Address;  -- openssl/conf.h:195
   pragma Import (C, CONF_imodule_get_usr_data, "CONF_imodule_get_usr_data");

   procedure CONF_imodule_set_usr_data (md : System.Address; usr_data : System.Address);  -- openssl/conf.h:196
   pragma Import (C, CONF_imodule_set_usr_data, "CONF_imodule_set_usr_data");

   function CONF_imodule_get_module (md : System.Address) return System.Address;  -- openssl/conf.h:197
   pragma Import (C, CONF_imodule_get_module, "CONF_imodule_get_module");

   function CONF_imodule_get_flags (md : System.Address) return unsigned_long;  -- openssl/conf.h:198
   pragma Import (C, CONF_imodule_get_flags, "CONF_imodule_get_flags");

   procedure CONF_imodule_set_flags (md : System.Address; flags : unsigned_long);  -- openssl/conf.h:199
   pragma Import (C, CONF_imodule_set_flags, "CONF_imodule_set_flags");

   function CONF_module_get_usr_data (pmod : System.Address) return System.Address;  -- openssl/conf.h:200
   pragma Import (C, CONF_module_get_usr_data, "CONF_module_get_usr_data");

   procedure CONF_module_set_usr_data (pmod : System.Address; usr_data : System.Address);  -- openssl/conf.h:201
   pragma Import (C, CONF_module_set_usr_data, "CONF_module_set_usr_data");

   function CONF_get1_default_config_file return Interfaces.C.Strings.chars_ptr;  -- openssl/conf.h:203
   pragma Import (C, CONF_get1_default_config_file, "CONF_get1_default_config_file");

   function CONF_parse_list
     (list : Interfaces.C.Strings.chars_ptr;
      sep : int;
      nospc : int;
      list_cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : System.Address) return int;
      arg : System.Address) return int;  -- openssl/conf.h:205
   pragma Import (C, CONF_parse_list, "CONF_parse_list");

   procedure OPENSSL_load_builtin_modules;  -- openssl/conf.h:208
   pragma Import (C, OPENSSL_load_builtin_modules, "OPENSSL_load_builtin_modules");

   procedure ERR_load_CONF_strings;  -- openssl/conf.h:214
   pragma Import (C, ERR_load_CONF_strings, "ERR_load_CONF_strings");

end OpenSSL.Low_Level.conf_h;
