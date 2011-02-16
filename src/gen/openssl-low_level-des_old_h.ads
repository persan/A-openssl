with Interfaces.C; use Interfaces.C;

package OpenSSL.Low_Level.des_old_h is

   --  unsupported macro: des_cblock DES_cblock
   --  unsupported macro: const_des_cblock const_DES_cblock
   --  unsupported macro: des_key_schedule DES_key_schedule
   --  arg-macro: procedure des_ecb3_encrypt (i, o, k1, k2, kDES_ecb3_encrypt((i),(o),and(k1),and(k2),and(k3),(e))
   --    DES_ecb3_encrypt((i),(o),and(k1),and(k2),and(k3),(e))
   --  arg-macro: procedure des_ede3_cbc_encrypt (i, o, l, k1, k2DES_ede3_cbc_encrypt((i),(o),(l),and(k1),and(k2),and(k3),(iv),(e))
   --    DES_ede3_cbc_encrypt((i),(o),(l),and(k1),and(k2),and(k3),(iv),(e))
   --  arg-macro: procedure des_ede3_cbcm_encrypt (i, o, l, k1, k2DES_ede3_cbcm_encrypt((i),(o),(l),and(k1),and(k2),and(k3),(iv1),(iv2),(e))
   --    DES_ede3_cbcm_encrypt((i),(o),(l),and(k1),and(k2),and(k3),(iv1),(iv2),(e))
   --  arg-macro: procedure des_ede3_cfb64_encrypt (i, o, l, k1, k2DES_ede3_cfb64_encrypt((i),(o),(l),and(k1),and(k2),and(k3),(iv),(n),(e))
   --    DES_ede3_cfb64_encrypt((i),(o),(l),and(k1),and(k2),and(k3),(iv),(n),(e))
   --  arg-macro: procedure des_ede3_ofb64_encrypt (i, o, l, k1, k2DES_ede3_ofb64_encrypt((i),(o),(l),and(k1),and(k2),and(k3),(iv),(n))
   --    DES_ede3_ofb64_encrypt((i),(o),(l),and(k1),and(k2),and(k3),(iv),(n))
   --  arg-macro: procedure des_options ()
   --    DES_options()
   --  arg-macro: procedure des_cbc_cksum (i, o, l, k, iv)DES_cbc_cksum((i),(o),(l),and(k),(iv))
   --    DES_cbc_cksum((i),(o),(l),and(k),(iv))
   --  arg-macro: procedure des_cbc_encrypt (i, o, l, k, iv,DES_cbc_encrypt((i),(o),(l),and(k),(iv),(e))
   --    DES_cbc_encrypt((i),(o),(l),and(k),(iv),(e))
   --  arg-macro: procedure des_ncbc_encrypt (i, o, l, k, iv,DES_ncbc_encrypt((i),(o),(l),and(k),(iv),(e))
   --    DES_ncbc_encrypt((i),(o),(l),and(k),(iv),(e))
   --  arg-macro: procedure des_xcbc_encrypt (i, o, l, k, iv,DES_xcbc_encrypt((i),(o),(l),and(k),(iv),(inw),(outw),(e))
   --    DES_xcbc_encrypt((i),(o),(l),and(k),(iv),(inw),(outw),(e))
   --  arg-macro: procedure des_cfb_encrypt (i, o, n, l, k, DES_cfb_encrypt((i),(o),(n),(l),and(k),(iv),(e))
   --    DES_cfb_encrypt((i),(o),(n),(l),and(k),(iv),(e))
   --  arg-macro: procedure des_ecb_encrypt (i, o, k, e)
   --    DES_ecb_encrypt((i),(o),and(k),(e))
   --  arg-macro: procedure des_encrypt1 (d, k, e)
   --    DES_encrypt1((d),and(k),(e))
   --  arg-macro: procedure des_encrypt2 (d, k, e)
   --    DES_encrypt2((d),and(k),(e))
   --  arg-macro: procedure des_encrypt3 (d, k1, k2, k3)
   --    DES_encrypt3((d),and(k1),and(k2),and(k3))
   --  arg-macro: procedure des_decrypt3 (d, k1, k2, k3)
   --    DES_decrypt3((d),and(k1),and(k2),and(k3))
   --  arg-macro: procedure des_xwhite_in2out (k, i, o)
   --    DES_xwhite_in2out((k),(i),(o))
   --  arg-macro: procedure des_enc_read (f, b, l, k, iv)DES_enc_read((f),(b),(l),and(k),(iv))
   --    DES_enc_read((f),(b),(l),and(k),(iv))
   --  arg-macro: procedure des_enc_write (f, b, l, k, iv)DES_enc_write((f),(b),(l),and(k),(iv))
   --    DES_enc_write((f),(b),(l),and(k),(iv))
   --  arg-macro: procedure des_fcrypt (b, s, r)
   --    DES_fcrypt((b),(s),(r))
   --  arg-macro: procedure des_ofb_encrypt (i, o, n, l, k, DES_ofb_encrypt((i),(o),(n),(l),and(k),(iv))
   --    DES_ofb_encrypt((i),(o),(n),(l),and(k),(iv))
   --  arg-macro: procedure des_pcbc_encrypt (i, o, l, k, iv,DES_pcbc_encrypt((i),(o),(l),and(k),(iv),(e))
   --    DES_pcbc_encrypt((i),(o),(l),and(k),(iv),(e))
   --  arg-macro: procedure des_quad_cksum (i, o, l, c, s)
   --    DES_quad_cksum((i),(o),(l),(c),(s))
   --  arg-macro: procedure des_random_seed (k)
   --    _ossl_096_des_random_seed((k))
   --  arg-macro: procedure des_random_key (r)
   --    DES_random_key((r))
   --  arg-macro: procedure des_read_password (k, p, v)
   --    DES_read_password((k),(p),(v))
   --  arg-macro: procedure des_read_2passwords (k1, k2, p, v)
   --    DES_read_2passwords((k1),(k2),(p),(v))
   --  arg-macro: procedure des_set_odd_parity (k)
   --    DES_set_odd_parity((k))
   --  arg-macro: procedure des_check_key_parity (k)
   --    DES_check_key_parity((k))
   --  arg-macro: procedure des_is_weak_key (k)
   --    DES_is_weak_key((k))
   --  arg-macro: procedure des_set_key (k, ks)
   --    DES_set_key((k),and(ks))
   --  arg-macro: procedure des_key_sched (k, ks)
   --    DES_key_sched((k),and(ks))
   --  arg-macro: procedure des_set_key_checked (k, ks)
   --    DES_set_key_checked((k),and(ks))
   --  arg-macro: procedure des_set_key_unchecked (k, ks)
   --    DES_set_key_unchecked((k),and(ks))
   --  arg-macro: procedure des_string_to_key (s, k)
   --    DES_string_to_key((s),(k))
   --  arg-macro: procedure des_string_to_2keys (s, k1, k2)
   --    DES_string_to_2keys((s),(k1),(k2))
   --  arg-macro: procedure des_cfb64_encrypt (i, o, l, ks, ivDES_cfb64_encrypt((i),(o),(l),and(ks),(iv),(n),(e))
   --    DES_cfb64_encrypt((i),(o),(l),and(ks),(iv),(n),(e))
   --  arg-macro: procedure des_ofb64_encrypt (i, o, l, ks, ivDES_ofb64_encrypt((i),(o),(l),and(ks),(iv),(n))
   --    DES_ofb64_encrypt((i),(o),(l),and(ks),(iv),(n))
   --  arg-macro: procedure des_ecb2_encrypt (i, o, k1, k2, edes_ecb3_encrypt((i),(o),(k1),(k2),(k1),(e))
   --    des_ecb3_encrypt((i),(o),(k1),(k2),(k1),(e))
   --  arg-macro: procedure des_ede2_cbc_encrypt (i, o, l, k1, k2des_ede3_cbc_encrypt((i),(o),(l),(k1),(k2),(k1),(iv),(e))
   --    des_ede3_cbc_encrypt((i),(o),(l),(k1),(k2),(k1),(iv),(e))
   --  arg-macro: procedure des_ede2_cfb64_encrypt (i, o, l, k1, k2des_ede3_cfb64_encrypt((i),(o),(l),(k1),(k2),(k1),(iv),(n),(e))
   --    des_ede3_cfb64_encrypt((i),(o),(l),(k1),(k2),(k1),(iv),(n),(e))
   --  arg-macro: procedure des_ede2_ofb64_encrypt (i, o, l, k1, k2des_ede3_ofb64_encrypt((i),(o),(l),(k1),(k2),(k1),(iv),(n))
   --    des_ede3_ofb64_encrypt((i),(o),(l),(k1),(k2),(k1),(iv),(n))
   --  unsupported macro: des_check_key DES_check_key
   --  unsupported macro: des_rw_mode DES_rw_mode
   --  unsupported macro: KRBDES_ENCRYPT DES_ENCRYPT
   --  unsupported macro: KRBDES_DECRYPT DES_DECRYPT
   --  unsupported macro: C_Block des_cblock
   --  unsupported macro: Key_schedule des_key_schedule
   --  unsupported macro: KEY_SZ DES_KEY_SZ
   --  unsupported macro: string_to_key des_string_to_key
   --  unsupported macro: read_pw_string des_read_pw_string
   --  unsupported macro: random_key des_random_key
   --  unsupported macro: pcbc_encrypt des_pcbc_encrypt
   --  unsupported macro: set_key des_set_key
   --  unsupported macro: key_sched des_key_sched
   --  unsupported macro: ecb_encrypt des_ecb_encrypt
   --  unsupported macro: cbc_encrypt des_cbc_encrypt
   --  unsupported macro: ncbc_encrypt des_ncbc_encrypt
   --  unsupported macro: xcbc_encrypt des_xcbc_encrypt
   --  unsupported macro: cbc_cksum des_cbc_cksum
   --  unsupported macro: quad_cksum des_quad_cksum
   --  unsupported macro: check_parity des_check_key_parity
   --  unsupported macro: des_fixup_key_parity DES_fixup_key_parity
   type u_ossl_old_des_cblock is array (0 .. 7) of aliased unsigned_char;  -- openssl/des_old.h:123

   type u_ossl_old_des_ks_struct_pad_array is array (0 .. 1) of aliased unsigned_long;
   type anon_43 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            u_u : aliased u_ossl_old_des_cblock;  -- openssl/des_old.h:127
         when others =>
            pad : aliased u_ossl_old_des_ks_struct_pad_array;  -- openssl/des_old.h:130
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_43);
   pragma Unchecked_Union (anon_43);
   type u_ossl_old_des_ks_struct is record
      ks : anon_43;  -- openssl/des_old.h:131
   end record;
   pragma Convention (C_Pass_By_Copy, u_ossl_old_des_ks_struct);  -- openssl/des_old.h:124

   type u_ossl_old_des_key_schedule is array (0 .. 15) of aliased u_ossl_old_des_ks_struct;  -- openssl/des_old.h:132

   --  skipped func _ossl_old_des_options

   --  skipped func _ossl_old_des_ecb3_encrypt

   --  skipped func _ossl_old_des_cbc_cksum

   --  skipped func _ossl_old_des_cbc_encrypt

   --  skipped func _ossl_old_des_ncbc_encrypt

   --  skipped func _ossl_old_des_xcbc_encrypt

   --  skipped func _ossl_old_des_cfb_encrypt

   --  skipped func _ossl_old_des_ecb_encrypt

   --  skipped func _ossl_old_des_encrypt

   --  skipped func _ossl_old_des_encrypt2

   --  skipped func _ossl_old_des_encrypt3

   --  skipped func _ossl_old_des_decrypt3

   --  skipped func _ossl_old_des_ede3_cbc_encrypt

   --  skipped func _ossl_old_des_ede3_cfb64_encrypt

   --  skipped func _ossl_old_des_ede3_ofb64_encrypt

   --  skipped func _ossl_old_des_enc_read

   --  skipped func _ossl_old_des_enc_write

   --  skipped func _ossl_old_des_fcrypt

   --  skipped func _ossl_old_des_crypt

   --  skipped func _ossl_old_crypt

   --  skipped func _ossl_old_des_ofb_encrypt

   --  skipped func _ossl_old_des_pcbc_encrypt

   --  skipped func _ossl_old_des_quad_cksum

   --  skipped func _ossl_old_des_random_seed

   --  skipped func _ossl_old_des_random_key

   --  skipped func _ossl_old_des_read_password

   --  skipped func _ossl_old_des_read_2passwords

   --  skipped func _ossl_old_des_set_odd_parity

   --  skipped func _ossl_old_des_is_weak_key

   --  skipped func _ossl_old_des_set_key

   --  skipped func _ossl_old_des_key_sched

   --  skipped func _ossl_old_des_string_to_key

   --  skipped func _ossl_old_des_string_to_2keys

   --  skipped func _ossl_old_des_cfb64_encrypt

   --  skipped func _ossl_old_des_ofb64_encrypt

   --  skipped func _ossl_096_des_random_seed

end OpenSSL.Low_Level.des_old_h;
