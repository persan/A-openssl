with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
--  with stddef_h;

package OpenSSL.Low_Level.rc4_h is

   type rc4_key_st_data_array is array (0 .. 255) of aliased unsigned;
   type rc4_key_st is record
      x : aliased unsigned;  -- openssl/rc4.h:75
      y : aliased unsigned;  -- openssl/rc4.h:75
      data : aliased rc4_key_st_data_array;  -- openssl/rc4.h:76
   end record;
   pragma Convention (C_Pass_By_Copy, rc4_key_st);  -- openssl/rc4.h:73

   subtype RC4_KEY is rc4_key_st;

   function RC4_options return Interfaces.C.Strings.chars_ptr;  -- openssl/rc4.h:80
   pragma Import (C, RC4_options, "RC4_options");

   procedure private_RC4_set_key
     (key : access RC4_KEY;
      len : int;
      data : access unsigned_char);  -- openssl/rc4.h:82
   pragma Import (C, private_RC4_set_key, "private_RC4_set_key");

   procedure RC4_set_key
     (key : access RC4_KEY;
      len : int;
      data : access unsigned_char);  -- openssl/rc4.h:84
   pragma Import (C, RC4_set_key, "RC4_set_key");

   procedure RC4
     (key : access RC4_KEY;
      len : size_t;
      indata : access unsigned_char;
      outdata : access unsigned_char);  -- openssl/rc4.h:85
   pragma Import (C, RC4, "RC4");

end OpenSSL.Low_Level.rc4_h;
