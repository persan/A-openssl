with Interfaces.C; use Interfaces.C;
--  with stddef_h;
with Interfaces.C.Strings;
--  limited --  with OpenSSL.Low_Level.ossl_typ_h;
with System;

package OpenSSL.Low_Level.buffer_h is

   package defs is

   BUF_F_BUF_MEMDUP : constant := 103;  --  openssl/buffer.h:107
   BUF_F_BUF_MEM_GROW : constant := 100;  --  openssl/buffer.h:108
   BUF_F_BUF_MEM_GROW_CLEAN : constant := 105;  --  openssl/buffer.h:109
   BUF_F_BUF_MEM_NEW : constant := 101;  --  openssl/buffer.h:110
   BUF_F_BUF_STRDUP : constant := 102;  --  openssl/buffer.h:111
   BUF_F_BUF_STRNDUP : constant := 104;  --  openssl/buffer.h:112
end;
   type buf_mem_st is record
      length : aliased size_t;  -- openssl/buffer.h:79
      data : Interfaces.C.Strings.chars_ptr;  -- openssl/buffer.h:80
      max : aliased size_t;  -- openssl/buffer.h:81
   end record;
   pragma Convention (C_Pass_By_Copy, buf_mem_st);  -- openssl/buffer.h:77

   function BUF_MEM_new return access OpenSSL.Low_Level.buffer_h.buf_mem_st;  -- openssl/buffer.h:84
   pragma Import (C, BUF_MEM_new, "BUF_MEM_new");

   procedure BUF_MEM_free (a : access OpenSSL.Low_Level.buffer_h.buf_mem_st);  -- openssl/buffer.h:85
   pragma Import (C, BUF_MEM_free, "BUF_MEM_free");

   function BUF_MEM_grow (str : access OpenSSL.Low_Level.buffer_h.buf_mem_st; len : size_t) return int;  -- openssl/buffer.h:86
   pragma Import (C, BUF_MEM_grow, "BUF_MEM_grow");

   function BUF_MEM_grow_clean (str : access OpenSSL.Low_Level.buffer_h.buf_mem_st; len : size_t) return int;  -- openssl/buffer.h:87
   pragma Import (C, BUF_MEM_grow_clean, "BUF_MEM_grow_clean");

   function BUF_strdup (str : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/buffer.h:88
   pragma Import (C, BUF_strdup, "BUF_strdup");

   function BUF_strndup (str : Interfaces.C.Strings.chars_ptr; siz : size_t) return Interfaces.C.Strings.chars_ptr;  -- openssl/buffer.h:89
   pragma Import (C, BUF_strndup, "BUF_strndup");

   function BUF_memdup (data : System.Address; siz : size_t) return System.Address;  -- openssl/buffer.h:90
   pragma Import (C, BUF_memdup, "BUF_memdup");

   procedure BUF_reverse
     (c_out : access unsigned_char;
      c_in : access unsigned_char;
      siz : size_t);  -- openssl/buffer.h:91
   pragma Import (C, BUF_reverse, "BUF_reverse");

   function BUF_strlcpy
     (dst : Interfaces.C.Strings.chars_ptr;
      src : Interfaces.C.Strings.chars_ptr;
      siz : size_t) return size_t;  -- openssl/buffer.h:94
   pragma Import (C, BUF_strlcpy, "BUF_strlcpy");

   function BUF_strlcat
     (dst : Interfaces.C.Strings.chars_ptr;
      src : Interfaces.C.Strings.chars_ptr;
      siz : size_t) return size_t;  -- openssl/buffer.h:95
   pragma Import (C, BUF_strlcat, "BUF_strlcat");

   procedure ERR_load_BUF_strings;  -- openssl/buffer.h:102
   pragma Import (C, ERR_load_BUF_strings, "ERR_load_BUF_strings");

end OpenSSL.Low_Level.buffer_h;
