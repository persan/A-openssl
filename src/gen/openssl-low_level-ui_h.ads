with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
--  limited --  with OpenSSL.Low_Level.ossl_typ_h;
with OpenSSL.Low_Level.stack_h;
with OpenSSL.Low_Level.crypto_h;
package OpenSSL.Low_Level.ui_h is

   package defs is

      UI_INPUT_FLAG_ECHO : constant := 16#01#;  --  openssl/ui.h:151

      UI_INPUT_FLAG_DEFAULT_PWD : constant := 16#02#;  --  openssl/ui.h:157

      UI_INPUT_FLAG_USER_BASE : constant := 16;  --  openssl/ui.h:168

      UI_CTRL_PRINT_ERRORS : constant := 1;  --  openssl/ui.h:220

      UI_CTRL_IS_REDOABLE : constant := 2;  --  openssl/ui.h:224
      --  arg-macro: procedure UI_set_app_data (s, arg)
      --    UI_set_ex_data(s,0,arg)
      --  arg-macro: procedure UI_get_app_data (s)
      --    UI_get_ex_data(s,0)

      UI_F_GENERAL_ALLOCATE_BOOLEAN : constant := 108;  --  openssl/ui.h:358
      UI_F_GENERAL_ALLOCATE_PROMPT : constant := 109;  --  openssl/ui.h:359
      UI_F_GENERAL_ALLOCATE_STRING : constant := 100;  --  openssl/ui.h:360
      UI_F_UI_CTRL       : constant := 111;  --  openssl/ui.h:361
      UI_F_UI_DUP_ERROR_STRING : constant := 101;  --  openssl/ui.h:362
      UI_F_UI_DUP_INFO_STRING : constant := 102;  --  openssl/ui.h:363
      UI_F_UI_DUP_INPUT_BOOLEAN : constant := 110;  --  openssl/ui.h:364
      UI_F_UI_DUP_INPUT_STRING : constant := 103;  --  openssl/ui.h:365
      UI_F_UI_DUP_VERIFY_STRING : constant := 106;  --  openssl/ui.h:366
      UI_F_UI_GET0_RESULT : constant := 107;  --  openssl/ui.h:367
      UI_F_UI_NEW_METHOD : constant := 104;  --  openssl/ui.h:368
      UI_F_UI_SET_RESULT : constant := 105;  --  openssl/ui.h:369

      UI_R_COMMON_OK_AND_CANCEL_CHARACTERS : constant := 104;  --  openssl/ui.h:372
      UI_R_INDEX_TOO_LARGE : constant := 102;  --  openssl/ui.h:373
      UI_R_INDEX_TOO_SMALL : constant := 103;  --  openssl/ui.h:374
      UI_R_NO_RESULT_BUFFER : constant := 105;  --  openssl/ui.h:375
      UI_R_RESULT_TOO_LARGE : constant := 100;  --  openssl/ui.h:376
      UI_R_RESULT_TOO_SMALL : constant := 101;  --  openssl/ui.h:377
      UI_R_UNKNOWN_CONTROL_COMMAND : constant := 106;  --  openssl/ui.h:378
   end defs;
   function UI_new return System.Address;  -- openssl/ui.h:83
   pragma Import (C, UI_new, "UI_new");

   function UI_new_method (method : System.Address) return System.Address;  -- openssl/ui.h:84
   pragma Import (C, UI_new_method, "UI_new_method");

   procedure UI_free (the_ui : System.Address);  -- openssl/ui.h:85
   pragma Import (C, UI_free, "UI_free");

   function UI_add_input_string
     (the_ui     : System.Address;
      prompt     : Interfaces.C.Strings.chars_ptr;
      flags      : int;
      result_buf : Interfaces.C.Strings.chars_ptr;
      minsize    : int;
      maxsize    : int) return int;  -- openssl/ui.h:130
   pragma Import (C, UI_add_input_string, "UI_add_input_string");

   function UI_dup_input_string
     (the_ui     : System.Address;
      prompt     : Interfaces.C.Strings.chars_ptr;
      flags      : int;
      result_buf : Interfaces.C.Strings.chars_ptr;
      minsize    : int;
      maxsize    : int) return int;  -- openssl/ui.h:132
   pragma Import (C, UI_dup_input_string, "UI_dup_input_string");

   function UI_add_verify_string
     (the_ui     : System.Address;
      prompt     : Interfaces.C.Strings.chars_ptr;
      flags      : int;
      result_buf : Interfaces.C.Strings.chars_ptr;
      minsize    : int;
      maxsize    : int;
      test_buf   : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ui.h:134
   pragma Import (C, UI_add_verify_string, "UI_add_verify_string");

   function UI_dup_verify_string
     (the_ui     : System.Address;
      prompt     : Interfaces.C.Strings.chars_ptr;
      flags      : int;
      result_buf : Interfaces.C.Strings.chars_ptr;
      minsize    : int;
      maxsize    : int;
      test_buf   : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ui.h:136
   pragma Import (C, UI_dup_verify_string, "UI_dup_verify_string");

   function UI_add_input_boolean
     (the_ui       : System.Address;
      prompt       : Interfaces.C.Strings.chars_ptr;
      action_desc  : Interfaces.C.Strings.chars_ptr;
      ok_chars     : Interfaces.C.Strings.chars_ptr;
      cancel_chars : Interfaces.C.Strings.chars_ptr;
      flags        : int;
      result_buf   : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ui.h:138
   pragma Import (C, UI_add_input_boolean, "UI_add_input_boolean");

   function UI_dup_input_boolean
     (the_ui       : System.Address;
      prompt       : Interfaces.C.Strings.chars_ptr;
      action_desc  : Interfaces.C.Strings.chars_ptr;
      ok_chars     : Interfaces.C.Strings.chars_ptr;
      cancel_chars : Interfaces.C.Strings.chars_ptr;
      flags        : int;
      result_buf   : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ui.h:141
   pragma Import (C, UI_dup_input_boolean, "UI_dup_input_boolean");

   function UI_add_info_string (the_ui : System.Address; text : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ui.h:144
   pragma Import (C, UI_add_info_string, "UI_add_info_string");

   function UI_dup_info_string (the_ui : System.Address; text : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ui.h:145
   pragma Import (C, UI_dup_info_string, "UI_dup_info_string");

   function UI_add_error_string (the_ui : System.Address; text : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ui.h:146
   pragma Import (C, UI_add_error_string, "UI_add_error_string");

   function UI_dup_error_string (the_ui : System.Address; text : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ui.h:147
   pragma Import (C, UI_dup_error_string, "UI_dup_error_string");

   function UI_construct_prompt
     (ui_method   : System.Address;
      object_desc : Interfaces.C.Strings.chars_ptr;
      object_name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/ui.h:188
   pragma Import (C, UI_construct_prompt, "UI_construct_prompt");

   function UI_add_user_data (the_ui : System.Address; user_data : System.Address) return System.Address;  -- openssl/ui.h:201
   pragma Import (C, UI_add_user_data, "UI_add_user_data");

   function UI_get0_user_data (the_ui : System.Address) return System.Address;  -- openssl/ui.h:203
   pragma Import (C, UI_get0_user_data, "UI_get0_user_data");

   function UI_get0_result (the_ui : System.Address; i : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/ui.h:206
   pragma Import (C, UI_get0_result, "UI_get0_result");

   function UI_process (the_ui : System.Address) return int;  -- openssl/ui.h:209
   pragma Import (C, UI_process, "UI_process");

   function UI_ctrl
     (the_ui : System.Address;
      cmd    : int;
      i      : long;
      p      : System.Address;
      f      : access procedure) return int;  -- openssl/ui.h:214
   pragma Import (C, UI_ctrl, "UI_ctrl");

   function UI_get_ex_new_index
     (argl      : long;
      argp      : System.Address;
      new_func  : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      dup_func  : access function
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
         arg6 : System.Address)) return int;  -- openssl/ui.h:230
   pragma Import (C, UI_get_ex_new_index, "UI_get_ex_new_index");

   function UI_set_ex_data
     (r   : System.Address;
      idx : int;
      arg : System.Address) return int;  -- openssl/ui.h:232
   pragma Import (C, UI_set_ex_data, "UI_set_ex_data");

   function UI_get_ex_data (r : System.Address; idx : int) return System.Address;  -- openssl/ui.h:233
   pragma Import (C, UI_get_ex_data, "UI_get_ex_data");

   procedure UI_set_default_method (meth : System.Address);  -- openssl/ui.h:236
   pragma Import (C, UI_set_default_method, "UI_set_default_method");

   function UI_get_default_method return System.Address;  -- openssl/ui.h:237
   pragma Import (C, UI_get_default_method, "UI_get_default_method");

   function UI_get_method (the_ui : System.Address) return System.Address;  -- openssl/ui.h:238
   pragma Import (C, UI_get_method, "UI_get_method");

   function UI_set_method (the_ui : System.Address; meth : System.Address) return System.Address;  -- openssl/ui.h:239
   pragma Import (C, UI_set_method, "UI_set_method");

   function UI_OpenSSL return System.Address;  -- openssl/ui.h:242
   pragma Import (C, UI_OpenSSL, "UI_OpenSSL");

   --  skipped empty struct ui_string_st

   --  skipped empty struct UI_STRING

   type stack_st_UI_STRING is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/ui.h:291
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_UI_STRING);  -- openssl/ui.h:291

   type UI_string_types is
     (UIT_NONE,
      UIT_PROMPT,
      UIT_VERIFY,
      UIT_BOOLEAN,
      UIT_INFO,
      UIT_ERROR);
   pragma Convention (C, UI_string_types);  -- openssl/ui.h:295

   function UI_create_method (name : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/ui.h:306
   pragma Import (C, UI_create_method, "UI_create_method");

   procedure UI_destroy_method (the_ui_method : System.Address);  -- openssl/ui.h:307
   pragma Import (C, UI_destroy_method, "UI_destroy_method");

   function UI_method_set_opener (method : System.Address; opener : access function (arg1 : System.Address) return int) return int;  -- openssl/ui.h:308
   pragma Import (C, UI_method_set_opener, "UI_method_set_opener");

   function UI_method_set_writer (method : System.Address; writer : access function (arg1 : System.Address; arg2 : System.Address) return int) return int;  -- openssl/ui.h:309
   pragma Import (C, UI_method_set_writer, "UI_method_set_writer");

   function UI_method_set_flusher (method : System.Address; flusher : access function (arg1 : System.Address) return int) return int;  -- openssl/ui.h:310
   pragma Import (C, UI_method_set_flusher, "UI_method_set_flusher");

   function UI_method_set_reader (method : System.Address; reader : access function (arg1 : System.Address; arg2 : System.Address) return int) return int;  -- openssl/ui.h:311
   pragma Import (C, UI_method_set_reader, "UI_method_set_reader");

   function UI_method_set_closer (method : System.Address; closer : access function (arg1 : System.Address) return int) return int;  -- openssl/ui.h:312
   pragma Import (C, UI_method_set_closer, "UI_method_set_closer");

   function UI_method_set_prompt_constructor (method : System.Address; prompt_constructor : access function
                                                (arg1 : System.Address;
                                                 arg2 : Interfaces.C.Strings.chars_ptr;
                                                 arg3 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ui.h:313
   pragma Import (C, UI_method_set_prompt_constructor, "UI_method_set_prompt_constructor");

   function UI_method_get_opener (method : System.Address) return access function (arg1 : System.Address) return int;  -- openssl/ui.h:314
   pragma Import (C, UI_method_get_opener, "UI_method_get_opener");

   function UI_method_get_writer (method : System.Address) return access function (arg1 : System.Address; arg2 : System.Address) return int;  -- openssl/ui.h:315
   pragma Import (C, UI_method_get_writer, "UI_method_get_writer");

   function UI_method_get_flusher (method : System.Address) return access function (arg1 : System.Address) return int;  -- openssl/ui.h:316
   pragma Import (C, UI_method_get_flusher, "UI_method_get_flusher");

   function UI_method_get_reader (method : System.Address) return access function (arg1 : System.Address; arg2 : System.Address) return int;  -- openssl/ui.h:317
   pragma Import (C, UI_method_get_reader, "UI_method_get_reader");

   function UI_method_get_closer (method : System.Address) return access function (arg1 : System.Address) return int;  -- openssl/ui.h:318
   pragma Import (C, UI_method_get_closer, "UI_method_get_closer");

   function UI_method_get_prompt_constructor (method : System.Address) return access function
     (arg1 : System.Address;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/ui.h:319
   pragma Import (C, UI_method_get_prompt_constructor, "UI_method_get_prompt_constructor");

   function UI_get_string_type (uis : System.Address) return UI_string_types;  -- openssl/ui.h:325
   pragma Import (C, UI_get_string_type, "UI_get_string_type");

   function UI_get_input_flags (uis : System.Address) return int;  -- openssl/ui.h:327
   pragma Import (C, UI_get_input_flags, "UI_get_input_flags");

   function UI_get0_output_string (uis : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/ui.h:329
   pragma Import (C, UI_get0_output_string, "UI_get0_output_string");

   function UI_get0_action_string (uis : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/ui.h:331
   pragma Import (C, UI_get0_action_string, "UI_get0_action_string");

   function UI_get0_result_string (uis : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/ui.h:333
   pragma Import (C, UI_get0_result_string, "UI_get0_result_string");

   function UI_get0_test_string (uis : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/ui.h:335
   pragma Import (C, UI_get0_test_string, "UI_get0_test_string");

   function UI_get_result_minsize (uis : System.Address) return int;  -- openssl/ui.h:337
   pragma Import (C, UI_get_result_minsize, "UI_get_result_minsize");

   function UI_get_result_maxsize (uis : System.Address) return int;  -- openssl/ui.h:339
   pragma Import (C, UI_get_result_maxsize, "UI_get_result_maxsize");

   function UI_set_result
     (the_ui : System.Address;
      uis    : System.Address;
      result : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ui.h:341
   pragma Import (C, UI_set_result, "UI_set_result");

   function UI_UTIL_read_pw_string
     (buf    : Interfaces.C.Strings.chars_ptr;
      length : int;
      prompt : Interfaces.C.Strings.chars_ptr;
      verify : int) return int;  -- openssl/ui.h:345
   pragma Import (C, UI_UTIL_read_pw_string, "UI_UTIL_read_pw_string");

   function UI_UTIL_read_pw
     (buf    : Interfaces.C.Strings.chars_ptr;
      buff   : Interfaces.C.Strings.chars_ptr;
      size   : int;
      prompt : Interfaces.C.Strings.chars_ptr;
      verify : int) return int;  -- openssl/ui.h:346
   pragma Import (C, UI_UTIL_read_pw, "UI_UTIL_read_pw");

   procedure ERR_load_UI_strings;  -- openssl/ui.h:353
   pragma Import (C, ERR_load_UI_strings, "ERR_load_UI_strings");

end OpenSSL.Low_Level.ui_h;
