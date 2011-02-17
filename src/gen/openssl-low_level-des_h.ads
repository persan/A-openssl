with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

package OpenSSL.Low_Level.des_h is
   package defs is

      --  unsupported macro: DES_KEY_SZ (sizeof(DES_cblock))
      --  unsupported macro: DES_SCHEDULE_SZ (sizeof(DES_key_schedule))

      DES_ENCRYPT : constant := 1;  --  openssl/des.h:107
      DES_DECRYPT : constant := 0;  --  openssl/des.h:108

      DES_CBC_MODE : constant := 0;  --  openssl/des.h:110
      DES_PCBC_MODE : constant := 1;  --  openssl/des.h:111
      --  arg-macro: procedure DES_ecb2_encrypt (i, o, k1, k2, eDES_ecb3_encrypt((i),(o),(k1),(k2),(k1),(e))
      --    DES_ecb3_encrypt((i),(o),(k1),(k2),(k1),(e))
      --  arg-macro: procedure DES_ede2_cbc_encrypt (i, o, l, k1, k2DES_ede3_cbc_encrypt((i),(o),(l),(k1),(k2),(k1),(iv),(e))
      --    DES_ede3_cbc_encrypt((i),(o),(l),(k1),(k2),(k1),(iv),(e))
      --  arg-macro: procedure DES_ede2_cfb64_encrypt (i, o, l, k1, k2DES_ede3_cfb64_encrypt((i),(o),(l),(k1),(k2),(k1),(iv),(n),(e))
      --    DES_ede3_cfb64_encrypt((i),(o),(l),(k1),(k2),(k1),(iv),(n),(e))
      --  arg-macro: procedure DES_ede2_ofb64_encrypt (i, o, l, k1, k2DES_ede3_ofb64_encrypt((i),(o),(l),(k1),(k2),(k1),(iv),(n))
      --    DES_ede3_ofb64_encrypt((i),(o),(l),(k1),(k2),(k1),(iv),(n))
      --  unsupported macro: DES_check_key OPENSSL_GLOBAL_REF(DES_check_key)
      --  unsupported macro: DES_rw_mode OPENSSL_GLOBAL_REF(DES_rw_mode)
      --  unsupported macro: DES_fixup_key_parity DES_set_odd_parity
   end defs;
   type DES_cblock is array (0 .. 7) of aliased unsigned_char;  -- openssl/des.h:78

   type const_DES_cblock is array (0 .. 7) of aliased unsigned_char;  -- openssl/des.h:79
   type DES_ks_deslong_array is array (0 .. 1) of aliased unsigned_long;
   type anon_42 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            cblock  : aliased DES_cblock;  -- openssl/des.h:87
         when others =>
            deslong : aliased DES_ks_deslong_array;  -- openssl/des.h:90
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_42);
   pragma Unchecked_Union (anon_42);
   type DES_ks_ks_array is array (0 .. 15) of aliased anon_42;
   type DES_ks is record
      ks : aliased DES_ks_ks_array;  -- openssl/des.h:91
   end record;
   pragma Convention (C_Pass_By_Copy, DES_ks);  -- openssl/des.h:83

   subtype DES_key_schedule is DES_ks;

   function DES_options return Interfaces.C.Strings.chars_ptr;  -- openssl/des.h:130
   pragma Import (C, DES_options, "DES_options");

   procedure DES_ecb3_encrypt
     (input  : access const_DES_cblock;
      output : access DES_cblock;
      ks1    : access DES_key_schedule;
      ks2    : access DES_key_schedule;
      ks3    : access DES_key_schedule;
      enc    : int);  -- openssl/des.h:131
   pragma Import (C, DES_ecb3_encrypt, "DES_ecb3_encrypt");

   function DES_cbc_cksum
     (input    : access unsigned_char;
      output   : access DES_cblock;
      length   : long;
      schedule : access DES_key_schedule;
      ivec     : access const_DES_cblock) return unsigned_long;  -- openssl/des.h:134
   pragma Import (C, DES_cbc_cksum, "DES_cbc_cksum");

   procedure DES_cbc_encrypt
     (input    : access unsigned_char;
      output   : access unsigned_char;
      length   : long;
      schedule : access DES_key_schedule;
      ivec     : access DES_cblock;
      enc      : int);  -- openssl/des.h:138
   pragma Import (C, DES_cbc_encrypt, "DES_cbc_encrypt");

   procedure DES_ncbc_encrypt
     (input    : access unsigned_char;
      output   : access unsigned_char;
      length   : long;
      schedule : access DES_key_schedule;
      ivec     : access DES_cblock;
      enc      : int);  -- openssl/des.h:141
   pragma Import (C, DES_ncbc_encrypt, "DES_ncbc_encrypt");

   procedure DES_xcbc_encrypt
     (input    : access unsigned_char;
      output   : access unsigned_char;
      length   : long;
      schedule : access DES_key_schedule;
      ivec     : access DES_cblock;
      inw      : access const_DES_cblock;
      outw     : access const_DES_cblock;
      enc      : int);  -- openssl/des.h:144
   pragma Import (C, DES_xcbc_encrypt, "DES_xcbc_encrypt");

   procedure DES_cfb_encrypt
     (c_in     : access unsigned_char;
      c_out    : access unsigned_char;
      numbits  : int;
      length   : long;
      schedule : access DES_key_schedule;
      ivec     : access DES_cblock;
      enc      : int);  -- openssl/des.h:147
   pragma Import (C, DES_cfb_encrypt, "DES_cfb_encrypt");

   procedure DES_ecb_encrypt
     (input  : access const_DES_cblock;
      output : access DES_cblock;
      ks     : access DES_key_schedule;
      enc    : int);  -- openssl/des.h:150
   pragma Import (C, DES_ecb_encrypt, "DES_ecb_encrypt");

   procedure DES_encrypt1
     (data : access unsigned_long;
      ks   : access DES_key_schedule;
      enc  : int);  -- openssl/des.h:162
   pragma Import (C, DES_encrypt1, "DES_encrypt1");

   procedure DES_encrypt2
     (data : access unsigned_long;
      ks   : access DES_key_schedule;
      enc  : int);  -- openssl/des.h:170
   pragma Import (C, DES_encrypt2, "DES_encrypt2");

   procedure DES_encrypt3
     (data : access unsigned_long;
      ks1  : access DES_key_schedule;
      ks2  : access DES_key_schedule;
      ks3  : access DES_key_schedule);  -- openssl/des.h:172
   pragma Import (C, DES_encrypt3, "DES_encrypt3");

   procedure DES_decrypt3
     (data : access unsigned_long;
      ks1  : access DES_key_schedule;
      ks2  : access DES_key_schedule;
      ks3  : access DES_key_schedule);  -- openssl/des.h:174
   pragma Import (C, DES_decrypt3, "DES_decrypt3");

   procedure DES_ede3_cbc_encrypt
     (input  : access unsigned_char;
      output : access unsigned_char;
      length : long;
      ks1    : access DES_key_schedule;
      ks2    : access DES_key_schedule;
      ks3    : access DES_key_schedule;
      ivec   : access DES_cblock;
      enc    : int);  -- openssl/des.h:176
   pragma Import (C, DES_ede3_cbc_encrypt, "DES_ede3_cbc_encrypt");

   procedure DES_ede3_cbcm_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : long;
      ks1    : access DES_key_schedule;
      ks2    : access DES_key_schedule;
      ks3    : access DES_key_schedule;
      ivec1  : access DES_cblock;
      ivec2  : access DES_cblock;
      enc    : int);  -- openssl/des.h:180
   pragma Import (C, DES_ede3_cbcm_encrypt, "DES_ede3_cbcm_encrypt");

   procedure DES_ede3_cfb64_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : long;
      ks1    : access DES_key_schedule;
      ks2    : access DES_key_schedule;
      ks3    : access DES_key_schedule;
      ivec   : access DES_cblock;
      num    : access int;
      enc    : int);  -- openssl/des.h:186
   pragma Import (C, DES_ede3_cfb64_encrypt, "DES_ede3_cfb64_encrypt");

   procedure DES_ede3_cfb_encrypt
     (c_in    : access unsigned_char;
      c_out   : access unsigned_char;
      numbits : int;
      length  : long;
      ks1     : access DES_key_schedule;
      ks2     : access DES_key_schedule;
      ks3     : access DES_key_schedule;
      ivec    : access DES_cblock;
      enc     : int);  -- openssl/des.h:190
   pragma Import (C, DES_ede3_cfb_encrypt, "DES_ede3_cfb_encrypt");

   procedure DES_ede3_ofb64_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : long;
      ks1    : access DES_key_schedule;
      ks2    : access DES_key_schedule;
      ks3    : access DES_key_schedule;
      ivec   : access DES_cblock;
      num    : access int);  -- openssl/des.h:194
   pragma Import (C, DES_ede3_ofb64_encrypt, "DES_ede3_ofb64_encrypt");

   function DES_enc_read
     (fd    : int;
      buf   : System.Address;
      len   : int;
      sched : access DES_key_schedule;
      iv    : access DES_cblock) return int;  -- openssl/des.h:203
   pragma Import (C, DES_enc_read, "DES_enc_read");

   function DES_enc_write
     (fd    : int;
      buf   : System.Address;
      len   : int;
      sched : access DES_key_schedule;
      iv    : access DES_cblock) return int;  -- openssl/des.h:205
   pragma Import (C, DES_enc_write, "DES_enc_write");

   function DES_fcrypt
     (buf  : Interfaces.C.Strings.chars_ptr;
      salt : Interfaces.C.Strings.chars_ptr;
      ret  : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/des.h:207
   pragma Import (C, DES_fcrypt, "DES_fcrypt");

   function DES_crypt (buf : Interfaces.C.Strings.chars_ptr; salt : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/des.h:208
   pragma Import (C, DES_crypt, "DES_crypt");

   procedure DES_ofb_encrypt
     (c_in     : access unsigned_char;
      c_out    : access unsigned_char;
      numbits  : int;
      length   : long;
      schedule : access DES_key_schedule;
      ivec     : access DES_cblock);  -- openssl/des.h:209
   pragma Import (C, DES_ofb_encrypt, "DES_ofb_encrypt");

   procedure DES_pcbc_encrypt
     (input    : access unsigned_char;
      output   : access unsigned_char;
      length   : long;
      schedule : access DES_key_schedule;
      ivec     : access DES_cblock;
      enc      : int);  -- openssl/des.h:211
   pragma Import (C, DES_pcbc_encrypt, "DES_pcbc_encrypt");

   function DES_quad_cksum
     (input     : access unsigned_char;
      output    : access DES_cblock;
      length    : long;
      out_count : int;
      seed      : access DES_cblock) return unsigned_long;  -- openssl/des.h:214
   pragma Import (C, DES_quad_cksum, "DES_quad_cksum");

   function DES_random_key (ret : access DES_cblock) return int;  -- openssl/des.h:216
   pragma Import (C, DES_random_key, "DES_random_key");

   procedure DES_set_odd_parity (key : access DES_cblock);  -- openssl/des.h:217
   pragma Import (C, DES_set_odd_parity, "DES_set_odd_parity");

   function DES_check_key_parity (key : access const_DES_cblock) return int;  -- openssl/des.h:218
   pragma Import (C, DES_check_key_parity, "DES_check_key_parity");

   function DES_is_weak_key (key : access const_DES_cblock) return int;  -- openssl/des.h:219
   pragma Import (C, DES_is_weak_key, "DES_is_weak_key");

   function DES_set_key (key : access const_DES_cblock; schedule : access DES_key_schedule) return int;  -- openssl/des.h:223
   pragma Import (C, DES_set_key, "DES_set_key");

   function DES_key_sched (key : access const_DES_cblock; schedule : access DES_key_schedule) return int;  -- openssl/des.h:224
   pragma Import (C, DES_key_sched, "DES_key_sched");

   function DES_set_key_checked (key : access const_DES_cblock; schedule : access DES_key_schedule) return int;  -- openssl/des.h:225
   pragma Import (C, DES_set_key_checked, "DES_set_key_checked");

   procedure DES_set_key_unchecked (key : access const_DES_cblock; schedule : access DES_key_schedule);  -- openssl/des.h:226
   pragma Import (C, DES_set_key_unchecked, "DES_set_key_unchecked");

   procedure DES_string_to_key (str : Interfaces.C.Strings.chars_ptr; key : access DES_cblock);  -- openssl/des.h:227
   pragma Import (C, DES_string_to_key, "DES_string_to_key");

   procedure DES_string_to_2keys
     (str  : Interfaces.C.Strings.chars_ptr;
      key1 : access DES_cblock;
      key2 : access DES_cblock);  -- openssl/des.h:228
   pragma Import (C, DES_string_to_2keys, "DES_string_to_2keys");

   procedure DES_cfb64_encrypt
     (c_in     : access unsigned_char;
      c_out    : access unsigned_char;
      length   : long;
      schedule : access DES_key_schedule;
      ivec     : access DES_cblock;
      num      : access int;
      enc      : int);  -- openssl/des.h:229
   pragma Import (C, DES_cfb64_encrypt, "DES_cfb64_encrypt");

   procedure DES_ofb64_encrypt
     (c_in     : access unsigned_char;
      c_out    : access unsigned_char;
      length   : long;
      schedule : access DES_key_schedule;
      ivec     : access DES_cblock;
      num      : access int);  -- openssl/des.h:232
   pragma Import (C, DES_ofb64_encrypt, "DES_ofb64_encrypt");

   function DES_read_password
     (key    : access DES_cblock;
      prompt : Interfaces.C.Strings.chars_ptr;
      verify : int) return int;  -- openssl/des.h:235
   pragma Import (C, DES_read_password, "DES_read_password");

   function DES_read_2passwords
     (key1   : access DES_cblock;
      key2   : access DES_cblock;
      prompt : Interfaces.C.Strings.chars_ptr;
      verify : int) return int;  -- openssl/des.h:236
   pragma Import (C, DES_read_2passwords, "DES_read_2passwords");

end OpenSSL.Low_Level.des_h;
