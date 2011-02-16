with Interfaces.C; use Interfaces.C;
--  with stddef_h;
with System;
--  limited --  with OpenSSL.Low_Level.ossl_typ_h;

package OpenSSL.Low_Level.fips_rand_h is

   function FIPS_rand_set_key (key : access unsigned_char; keylen : size_t) return int;  -- openssl/fips_rand.h:61
   pragma Import (C, FIPS_rand_set_key, "FIPS_rand_set_key");

   function FIPS_rand_seed (buf : System.Address; num : size_t) return int;  -- openssl/fips_rand.h:62
   pragma Import (C, FIPS_rand_seed, "FIPS_rand_seed");

   function FIPS_rand_bytes (c_out : access unsigned_char; outlen : size_t) return int;  -- openssl/fips_rand.h:63
   pragma Import (C, FIPS_rand_bytes, "FIPS_rand_bytes");

   function FIPS_rand_test_mode return int;  -- openssl/fips_rand.h:65
   pragma Import (C, FIPS_rand_test_mode, "FIPS_rand_test_mode");

   procedure FIPS_rand_reset;  -- openssl/fips_rand.h:66
   pragma Import (C, FIPS_rand_reset, "FIPS_rand_reset");

   function FIPS_rand_set_dt (dt : access unsigned_char) return int;  -- openssl/fips_rand.h:67
   pragma Import (C, FIPS_rand_set_dt, "FIPS_rand_set_dt");

   function FIPS_rand_status return int;  -- openssl/fips_rand.h:69
   pragma Import (C, FIPS_rand_status, "FIPS_rand_status");

   function FIPS_rand_method return access constant OpenSSL.Low_Level.rand_h.rand_meth_st;  -- openssl/fips_rand.h:71
   pragma Import (C, FIPS_rand_method, "FIPS_rand_method");

end OpenSSL.Low_Level.fips_rand_h;
