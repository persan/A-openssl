with Interfaces.C; use Interfaces.C;
with System;
--  with stddef_h;

package OpenSSL.Low_Level.modes_h is

   type block128_f is access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : System.Address);  -- openssl/modes.h:10

   type cbc128_f is access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : size_t;
         arg4 : System.Address;
         arg5 : access unsigned_char;
         arg6 : int);  -- openssl/modes.h:14

   procedure CRYPTO_cbc128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      len : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      block : access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : System.Address));  -- openssl/modes.h:18
   pragma Import (CPP, CRYPTO_cbc128_encrypt, "_Z21CRYPTO_cbc128_encryptPKhPhjPKvS1_PFvS0_S1_S3_E");

   procedure CRYPTO_cbc128_decrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      len : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      block : access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : System.Address));  -- openssl/modes.h:21
   pragma Import (CPP, CRYPTO_cbc128_decrypt, "_Z21CRYPTO_cbc128_decryptPKhPhjPKvS1_PFvS0_S1_S3_E");

   procedure CRYPTO_ctr128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      len : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      ecount_buf : access unsigned_char;
      num : access unsigned;
      block : access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : System.Address));  -- openssl/modes.h:25
   pragma Import (CPP, CRYPTO_ctr128_encrypt, "_Z21CRYPTO_ctr128_encryptPKhPhjPKvS1_S1_PjPFvS0_S1_S3_E");

   procedure CRYPTO_ofb128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      len : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      num : access int;
      block : access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : System.Address));  -- openssl/modes.h:30
   pragma Import (CPP, CRYPTO_ofb128_encrypt, "_Z21CRYPTO_ofb128_encryptPKhPhjPKvS1_PiPFvS0_S1_S3_E");

   procedure CRYPTO_cfb128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      len : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      num : access int;
      enc : int;
      block : access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : System.Address));  -- openssl/modes.h:35
   pragma Import (CPP, CRYPTO_cfb128_encrypt, "_Z21CRYPTO_cfb128_encryptPKhPhjPKvS1_PiiPFvS0_S1_S3_E");

   procedure CRYPTO_cfb128_8_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      length : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      num : access int;
      enc : int;
      block : access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : System.Address));  -- openssl/modes.h:39
   pragma Import (CPP, CRYPTO_cfb128_8_encrypt, "_Z23CRYPTO_cfb128_8_encryptPKhPhjPKvS1_PiiPFvS0_S1_S3_E");

   procedure CRYPTO_cfb128_1_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      bits : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      num : access int;
      enc : int;
      block : access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : System.Address));  -- openssl/modes.h:43
   pragma Import (CPP, CRYPTO_cfb128_1_encrypt, "_Z23CRYPTO_cfb128_1_encryptPKhPhjPKvS1_PiiPFvS0_S1_S3_E");

   function CRYPTO_cts128_encrypt_block
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      len : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      block : access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : System.Address)) return size_t;  -- openssl/modes.h:48
   pragma Import (CPP, CRYPTO_cts128_encrypt_block, "_Z27CRYPTO_cts128_encrypt_blockPKhPhjPKvS1_PFvS0_S1_S3_E");

   function CRYPTO_cts128_encrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      len : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      cbc : access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : size_t;
         arg4 : System.Address;
         arg5 : access unsigned_char;
         arg6 : int)) return size_t;  -- openssl/modes.h:51
   pragma Import (CPP, CRYPTO_cts128_encrypt, "_Z21CRYPTO_cts128_encryptPKhPhjPKvS1_PFvS0_S1_jS3_S1_iE");

   function CRYPTO_cts128_decrypt_block
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      len : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      block : access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : System.Address)) return size_t;  -- openssl/modes.h:54
   pragma Import (CPP, CRYPTO_cts128_decrypt_block, "_Z27CRYPTO_cts128_decrypt_blockPKhPhjPKvS1_PFvS0_S1_S3_E");

   function CRYPTO_cts128_decrypt
     (c_in : access unsigned_char;
      c_out : access unsigned_char;
      len : size_t;
      key : System.Address;
      ivec : access unsigned_char;
      cbc : access procedure
        (arg1 : access unsigned_char;
         arg2 : access unsigned_char;
         arg3 : size_t;
         arg4 : System.Address;
         arg5 : access unsigned_char;
         arg6 : int)) return size_t;  -- openssl/modes.h:57
   pragma Import (CPP, CRYPTO_cts128_decrypt, "_Z21CRYPTO_cts128_decryptPKhPhjPKvS1_PFvS0_S1_jS3_S1_iE");

end OpenSSL.Low_Level.modes_h;
