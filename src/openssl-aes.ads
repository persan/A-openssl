with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
private with OpenSSL.Low_Level.aes_h;
package OpenSSL.aes is
   package defs is
      ENCRYPT : constant := 1;
      DECRYPT : constant := 0;

      MAXNR      : constant := 14;
      BLOCK_SIZE : constant := 16;
   end defs;

   type Key_Type is tagged private;

   function  options return Interfaces.C.Strings.chars_ptr;


   function  set_encrypt_key
     (userKey : access unsigned_char;
      bits    : int;
      key     : Key_Type) return int;


   function  set_decrypt_key
     (userKey : access unsigned_char;
      bits    : int;
      key     : Key_Type) return int;


   procedure  encrypt
     (c_in  : access unsigned_char;
      c_out : access unsigned_char;
      key   : Key_Type);


   procedure  decrypt
     (c_in  : access unsigned_char;
      c_out : access unsigned_char;
      key   : Key_Type);


   procedure  ecb_encrypt
     (c_in  : access unsigned_char;
      c_out : access unsigned_char;
      key   : Key_Type;
      enc   : int);


   procedure  cbc_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      ivec   : access unsigned_char;
      enc    : int);


   procedure  cfb128_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      ivec   : access unsigned_char;
      num    : access int;
      enc    : int);


   procedure  cfb1_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      ivec   : access unsigned_char;
      num    : access int;
      enc    : int);


   procedure  cfb8_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      ivec   : access unsigned_char;
      num    : access int;
      enc    : int);


   procedure  ofb128_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      ivec   : access unsigned_char;
      num    : access int);


   procedure  ctr128_encrypt
     (c_in       : access unsigned_char;
      c_out      : access unsigned_char;
      length     : size_t;
      key        : Key_Type;
      ivec       : access unsigned_char;
      ecount_buf : access unsigned_char;
      num        : access unsigned);


   procedure  ige_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      ivec   : access unsigned_char;
      enc    : int);


   procedure  bi_ige_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      key2   : Key_Type;
      ivec   : access unsigned_char;
      enc    : int);


   function  wrap_key
     (key   : Key_Type;
      iv    : access unsigned_char;
      c_out : access unsigned_char;
      c_in  : access unsigned_char;
      inlen : unsigned) return int;


   function  unwrap_key
     (key   : Key_Type;
      iv    : access unsigned_char;
      c_out : access unsigned_char;
      c_in  : access unsigned_char;
      inlen : unsigned) return int;

private
   type Key_Type is tagged record
      data : aliased OpenSSL.Low_Level.aes_h.aes_key_st;
   end record;
end OpenSSL.aes;
