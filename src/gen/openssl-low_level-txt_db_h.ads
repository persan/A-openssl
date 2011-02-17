with Interfaces.C; use Interfaces.C;
with System;
with OpenSSL.Low_Level.stack_h;
with OpenSSL.Low_Level.bio_h;

package OpenSSL.Low_Level.txt_db_h is

   package defs is

      DB_ERROR_OK                 : constant := 0;  --  openssl/txt_db.h:69
      DB_ERROR_MALLOC             : constant := 1;  --  openssl/txt_db.h:70
      DB_ERROR_INDEX_CLASH        : constant := 2;  --  openssl/txt_db.h:71
      DB_ERROR_INDEX_OUT_OF_RANGE : constant := 3;  --  openssl/txt_db.h:72
      DB_ERROR_NO_INDEX           : constant := 4;  --  openssl/txt_db.h:73
      DB_ERROR_INSERT_INDEX_CLASH : constant := 5;  --  openssl/txt_db.h:74
   end defs;
   type OPENSSL_PSTRING is new System.Address;  -- openssl/txt_db.h:80

   type stack_st_OPENSSL_PSTRING is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/txt_db.h:81
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_OPENSSL_PSTRING);  -- openssl/txt_db.h:81

   type txt_db_st is record
      num_fields : aliased int;  -- openssl/txt_db.h:85
      data       : access stack_st_OPENSSL_PSTRING;  -- openssl/txt_db.h:86
      index      : System.Address;  -- openssl/txt_db.h:87
      qual       : System.Address;  -- openssl/txt_db.h:88
      error      : aliased long;  -- openssl/txt_db.h:89
      arg1       : aliased long;  -- openssl/txt_db.h:90
      arg2       : aliased long;  -- openssl/txt_db.h:91
      arg_row    : System.Address;  -- openssl/txt_db.h:92
   end record;
   pragma Convention (C_Pass_By_Copy, txt_db_st);  -- openssl/txt_db.h:83

   subtype TXT_DB is txt_db_st;

   function TXT_DB_read (c_in : access OpenSSL.Low_Level.bio_h.bio_st; num : int) return access TXT_DB;  -- openssl/txt_db.h:96
   pragma Import (C, TXT_DB_read, "TXT_DB_read");

   function TXT_DB_write (c_out : access OpenSSL.Low_Level.bio_h.bio_st; db : access TXT_DB) return long;  -- openssl/txt_db.h:97
   pragma Import (C, TXT_DB_write, "TXT_DB_write");

   function TXT_DB_create_index
     (db    : access TXT_DB;
      field : int;
      qual  : access function (arg1 : System.Address) return int;
      hash  : access function (arg1 : System.Address) return unsigned_long;
      cmp   : access function (arg1 : System.Address; arg2 : System.Address) return int) return int;  -- openssl/txt_db.h:102
   pragma Import (C, TXT_DB_create_index, "TXT_DB_create_index");

   procedure TXT_DB_free (db : access TXT_DB);  -- openssl/txt_db.h:104
   pragma Import (C, TXT_DB_free, "TXT_DB_free");

   function TXT_DB_get_by_index
     (db    : access TXT_DB;
      idx   : int;
      value : System.Address) return System.Address;  -- openssl/txt_db.h:105
   pragma Import (C, TXT_DB_get_by_index, "TXT_DB_get_by_index");

   function TXT_DB_insert (db : access TXT_DB; value : System.Address) return int;  -- openssl/txt_db.h:106
   pragma Import (C, TXT_DB_insert, "TXT_DB_insert");

end OpenSSL.Low_Level.txt_db_h;
