package body OpenSSL.aes is

   -------------
   -- options --
   -------------

   function options return Interfaces.C.Strings.chars_ptr is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "options unimplemented");
      raise Program_Error with "Unimplemented function options";
      return options;
   end options;

   ---------------------
   -- set_encrypt_key --
   ---------------------

   function set_encrypt_key
     (userKey : access unsigned_char;
      bits    : int;
      key     : Key_Type)
      return int
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "set_encrypt_key unimplemented");
      raise Program_Error with "Unimplemented function set_encrypt_key";
      return set_encrypt_key (userKey, bits, key);
   end set_encrypt_key;

   ---------------------
   -- set_decrypt_key --
   ---------------------

   function set_decrypt_key
     (userKey : access unsigned_char;
      bits    : int;
      key     : Key_Type)
      return int
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "set_decrypt_key unimplemented");
      raise Program_Error with "Unimplemented function set_decrypt_key";
      return set_decrypt_key (userKey, bits, key);
   end set_decrypt_key;

   -------------
   -- encrypt --
   -------------

   procedure encrypt
     (c_in  : access unsigned_char;
      c_out : access unsigned_char;
      key   : Key_Type)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "encrypt unimplemented");
      raise Program_Error with "Unimplemented procedure encrypt";
   end encrypt;

   -------------
   -- decrypt --
   -------------

   procedure decrypt
     (c_in  : access unsigned_char;
      c_out : access unsigned_char;
      key   : Key_Type)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "decrypt unimplemented");
      raise Program_Error with "Unimplemented procedure decrypt";
   end decrypt;

   -----------------
   -- ecb_encrypt --
   -----------------

   procedure ecb_encrypt
     (c_in  : access unsigned_char;
      c_out : access unsigned_char;
      key   : Key_Type;
      enc   : int)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "ecb_encrypt unimplemented");
      raise Program_Error with "Unimplemented procedure ecb_encrypt";
   end ecb_encrypt;

   -----------------
   -- cbc_encrypt --
   -----------------

   procedure cbc_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      ivec   : access unsigned_char;
      enc    : int)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "cbc_encrypt unimplemented");
      raise Program_Error with "Unimplemented procedure cbc_encrypt";
   end cbc_encrypt;

   --------------------
   -- cfb128_encrypt --
   --------------------

   procedure cfb128_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      ivec   : access unsigned_char;
      num    : access int;
      enc    : int)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "cfb128_encrypt unimplemented");
      raise Program_Error with "Unimplemented procedure cfb128_encrypt";
   end cfb128_encrypt;

   ------------------
   -- cfb1_encrypt --
   ------------------

   procedure cfb1_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      ivec   : access unsigned_char;
      num    : access int;
      enc    : int)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "cfb1_encrypt unimplemented");
      raise Program_Error with "Unimplemented procedure cfb1_encrypt";
   end cfb1_encrypt;

   ------------------
   -- cfb8_encrypt --
   ------------------

   procedure cfb8_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      ivec   : access unsigned_char;
      num    : access int;
      enc    : int)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "cfb8_encrypt unimplemented");
      raise Program_Error with "Unimplemented procedure cfb8_encrypt";
   end cfb8_encrypt;

   --------------------
   -- ofb128_encrypt --
   --------------------

   procedure ofb128_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      ivec   : access unsigned_char;
      num    : access int)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "ofb128_encrypt unimplemented");
      raise Program_Error with "Unimplemented procedure ofb128_encrypt";
   end ofb128_encrypt;

   --------------------
   -- ctr128_encrypt --
   --------------------

   procedure ctr128_encrypt
     (c_in       : access unsigned_char;
      c_out      : access unsigned_char;
      length     : size_t;
      key        : Key_Type;
      ivec       : access unsigned_char;
      ecount_buf : access unsigned_char;
      num        : access unsigned)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "ctr128_encrypt unimplemented");
      raise Program_Error with "Unimplemented procedure ctr128_encrypt";
   end ctr128_encrypt;

   -----------------
   -- ige_encrypt --
   -----------------

   procedure ige_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      ivec   : access unsigned_char;
      enc    : int)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "ige_encrypt unimplemented");
      raise Program_Error with "Unimplemented procedure ige_encrypt";
   end ige_encrypt;

   --------------------
   -- bi_ige_encrypt --
   --------------------

   procedure bi_ige_encrypt
     (c_in   : access unsigned_char;
      c_out  : access unsigned_char;
      length : size_t;
      key    : Key_Type;
      key2   : Key_Type;
      ivec   : access unsigned_char;
      enc    : int)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "bi_ige_encrypt unimplemented");
      raise Program_Error with "Unimplemented procedure bi_ige_encrypt";
   end bi_ige_encrypt;

   --------------
   -- wrap_key --
   --------------

   function wrap_key
     (key   : Key_Type;
      iv    : access unsigned_char;
      c_out : access unsigned_char;
      c_in  : access unsigned_char;
      inlen : unsigned)
      return int
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "wrap_key unimplemented");
      raise Program_Error with "Unimplemented function wrap_key";
      return wrap_key (key, iv, c_out, c_in, inlen);
   end wrap_key;

   ----------------
   -- unwrap_key --
   ----------------

   function unwrap_key
     (key   : Key_Type;
      iv    : access unsigned_char;
      c_out : access unsigned_char;
      c_in  : access unsigned_char;
      inlen : unsigned)
      return int
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "unwrap_key unimplemented");
      raise Program_Error with "Unimplemented function unwrap_key";
      return unwrap_key (key, iv, c_out, c_in, inlen);
   end unwrap_key;

end OpenSSL.aes;
