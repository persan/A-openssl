with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
package et_com_err_h is
   package stdio_h is
      type va_list is new System.Address;
   end  stdio_h;

   --  arg-macro: procedure COM_ERR_ATTR (x)
   --    __attribute__(x)
   subtype errcode_t is long;  -- /usr/include/et/com_err.h:22

   type error_table is record
      msgs : System.Address;  -- /usr/include/et/com_err.h:25
      base : aliased long;  -- /usr/include/et/com_err.h:26
      n_msgs : aliased int;  -- /usr/include/et/com_err.h:27
   end record;
   pragma Convention (C_Pass_By_Copy, error_table);  -- /usr/include/et/com_err.h:24

   --  skipped empty struct et_list

   procedure com_err
     (arg1 : Interfaces.C.Strings.chars_ptr;
      arg2 : long;
      arg3 : Interfaces.C.Strings.chars_ptr  -- , ...
      );  -- /usr/include/et/com_err.h:31
   pragma Import (CPP, com_err, "_Z7com_errPKclS0_z");

   procedure com_err_va
     (whoami : Interfaces.C.Strings.chars_ptr;
      code : errcode_t;
      fmt : Interfaces.C.Strings.chars_ptr;
      args : stdio_h.va_list);  -- /usr/include/et/com_err.h:34
   pragma Import (CPP, com_err_va, "_Z10com_err_vaPKclS0_Pc");

   function error_message (arg1 : long) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/et/com_err.h:38
   pragma Import (CPP, error_message, "_Z13error_messagel");

   com_err_hook : access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : long;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : stdio_h.va_list);  -- /usr/include/et/com_err.h:39
   pragma Import (C, com_err_hook, "com_err_hook");

   function set_com_err_hook (arg1 : access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : long;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : stdio_h.va_list)) return access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : long;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : stdio_h.va_list);  -- /usr/include/et/com_err.h:40
   pragma Import (CPP, set_com_err_hook, "_Z16set_com_err_hookPFvPKclS0_PcE");

   function reset_com_err_hook return access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : long;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : stdio_h.va_list);  -- /usr/include/et/com_err.h:43
   pragma Import (CPP, reset_com_err_hook, "_Z18reset_com_err_hookv");

   function init_error_table
     (msgs : System.Address;
      base : long;
      count : int) return int;  -- /usr/include/et/com_err.h:45
   pragma Import (CPP, init_error_table, "_Z16init_error_tablePKPKcli");

   function add_error_table (et : access constant error_table) return errcode_t;  -- /usr/include/et/com_err.h:47
   pragma Import (CPP, add_error_table, "_Z15add_error_tablePK11error_table");

   function remove_error_table (et : access constant error_table) return errcode_t;  -- /usr/include/et/com_err.h:48
   pragma Import (CPP, remove_error_table, "_Z18remove_error_tablePK11error_table");

   procedure add_to_error_table (new_table : System.Address);  -- /usr/include/et/com_err.h:49
   pragma Import (CPP, add_to_error_table, "_Z18add_to_error_tableP7et_list");

   function com_right (list : System.Address; code : long) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/et/com_err.h:52
   pragma Import (CPP, com_right, "_Z9com_rightP7et_listl");

   function com_right_r
     (list : System.Address;
      code : long;
      str : Interfaces.C.Strings.chars_ptr;
      len : size_t) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/et/com_err.h:53
   pragma Import (CPP, com_right_r, "_Z11com_right_rP7et_listlPcj");

   procedure initialize_error_table_r
     (list : System.Address;
      messages : System.Address;
      num_errors : int;
      base : long);  -- /usr/include/et/com_err.h:54
   pragma Import (CPP, initialize_error_table_r, "_Z24initialize_error_table_rPP7et_listPPKcil");

   procedure free_error_table (et : System.Address);  -- /usr/include/et/com_err.h:58
   pragma Import (CPP, free_error_table, "_Z16free_error_tableP7et_list");

   function et_list_lock return int;  -- /usr/include/et/com_err.h:61
   pragma Import (CPP, et_list_lock, "_Z12et_list_lockv");

   function et_list_unlock return int;  -- /usr/include/et/com_err.h:62
   pragma Import (CPP, et_list_unlock, "_Z14et_list_unlockv");

end et_com_err_h;
