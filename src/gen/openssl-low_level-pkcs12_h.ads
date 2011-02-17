with Interfaces.C; use Interfaces.C;
limited with OpenSSL.Low_Level.x509_h;
--  limited --  with OpenSSL.Low_Level.ossl_typ_h;
limited with OpenSSL.Low_Level.pkcs7_h;
with OpenSSL.Low_Level.asn1_h;
with OpenSSL.Low_Level.stack_h;
with System;
with Interfaces.C.Strings;
limited with OpenSSL.Low_Level.bio_h;
--  limited --  with Interfaces.C_Streams;

package OpenSSL.Low_Level.pkcs12_h is

   package defs is

      PKCS12_KEY_ID : constant := 1;  --  openssl/pkcs12.h:69
      PKCS12_IV_ID  : constant := 2;  --  openssl/pkcs12.h:70
      PKCS12_MAC_ID : constant := 3;  --  openssl/pkcs12.h:71
   --  unsupported macro: PKCS12_DEFAULT_ITER PKCS5_DEFAULT_ITER

      PKCS12_MAC_KEY_LENGTH : constant := 20;  --  openssl/pkcs12.h:78

      PKCS12_SALT_LEN : constant := 8;  --  openssl/pkcs12.h:80
   --  unsupported macro: PKCS12_key_gen PKCS12_key_gen_asc
   --  unsupported macro: PKCS12_add_friendlyname PKCS12_add_friendlyname_asc

      KEY_EX        : constant := 16#10#;  --  openssl/pkcs12.h:96
      KEY_SIG       : constant := 16#80#;  --  openssl/pkcs12.h:97

      PKCS12_ERROR  : constant := 0;  --  openssl/pkcs12.h:138
      PKCS12_OK     : constant := 1;  --  openssl/pkcs12.h:139
   --  unsupported macro: M_PKCS12_x5092certbag PKCS12_x5092certbag
   --  unsupported macro: M_PKCS12_x509crl2certbag PKCS12_x509crl2certbag
   --  unsupported macro: M_PKCS12_certbag2x509 PKCS12_certbag2x509
   --  unsupported macro: M_PKCS12_certbag2x509crl PKCS12_certbag2x509crl
   --  unsupported macro: M_PKCS12_unpack_p7data PKCS12_unpack_p7data
   --  unsupported macro: M_PKCS12_pack_authsafes PKCS12_pack_authsafes
   --  unsupported macro: M_PKCS12_unpack_authsafes PKCS12_unpack_authsafes
   --  unsupported macro: M_PKCS12_unpack_p7encdata PKCS12_unpack_p7encdata
   --  unsupported macro: M_PKCS12_decrypt_skey PKCS12_decrypt_skey
   --  unsupported macro: M_PKCS8_decrypt PKCS8_decrypt
   --  arg-macro: procedure M_PKCS12_bag_type (bg)
   --    OBJ_obj2nid((bg).type)
   --  arg-macro: procedure M_PKCS12_cert_bag_type (bg)
   --    OBJ_obj2nid((bg).value.bag.type)
   --  unsupported macro: M_PKCS12_crl_bag_type M_PKCS12_cert_bag_type
   --  arg-macro: procedure PKCS12_get_attr (bag, attr_nid)
   --    PKCS12_get_attr_gen(bag.attrib, attr_nid)
   --  arg-macro: procedure PKCS8_get_attr (p8, attr_nid)
   --    PKCS12_get_attr_gen(p8.attributes, attr_nid)
   --  arg-macro: function PKCS12_mac_present (p12)
   --    return (p12).mac ? 1 : 0;

      PKCS12_F_PARSE_BAG : constant := 129;  --  openssl/pkcs12.h:274
      PKCS12_F_PARSE_BAGS : constant := 103;  --  openssl/pkcs12.h:275
      PKCS12_F_PKCS12_ADD_FRIENDLYNAME : constant := 100;  --  openssl/pkcs12.h:276
      PKCS12_F_PKCS12_ADD_FRIENDLYNAME_ASC : constant := 127;  --  openssl/pkcs12.h:277
      PKCS12_F_PKCS12_ADD_FRIENDLYNAME_UNI : constant := 102;  --  openssl/pkcs12.h:278
      PKCS12_F_PKCS12_ADD_LOCALKEYID : constant := 104;  --  openssl/pkcs12.h:279
      PKCS12_F_PKCS12_CREATE : constant := 105;  --  openssl/pkcs12.h:280
      PKCS12_F_PKCS12_GEN_MAC : constant := 107;  --  openssl/pkcs12.h:281
      PKCS12_F_PKCS12_INIT : constant := 109;  --  openssl/pkcs12.h:282
      PKCS12_F_PKCS12_ITEM_DECRYPT_D2I : constant := 106;  --  openssl/pkcs12.h:283
      PKCS12_F_PKCS12_ITEM_I2D_ENCRYPT : constant := 108;  --  openssl/pkcs12.h:284
      PKCS12_F_PKCS12_ITEM_PACK_SAFEBAG : constant := 117;  --  openssl/pkcs12.h:285
      PKCS12_F_PKCS12_KEY_GEN_ASC : constant := 110;  --  openssl/pkcs12.h:286
      PKCS12_F_PKCS12_KEY_GEN_UNI : constant := 111;  --  openssl/pkcs12.h:287
      PKCS12_F_PKCS12_MAKE_KEYBAG : constant := 112;  --  openssl/pkcs12.h:288
      PKCS12_F_PKCS12_MAKE_SHKEYBAG : constant := 113;  --  openssl/pkcs12.h:289
      PKCS12_F_PKCS12_NEWPASS : constant := 128;  --  openssl/pkcs12.h:290
      PKCS12_F_PKCS12_PACK_P7DATA : constant := 114;  --  openssl/pkcs12.h:291
      PKCS12_F_PKCS12_PACK_P7ENCDATA : constant := 115;  --  openssl/pkcs12.h:292
      PKCS12_F_PKCS12_PARSE : constant := 118;  --  openssl/pkcs12.h:293
      PKCS12_F_PKCS12_PBE_CRYPT : constant := 119;  --  openssl/pkcs12.h:294
      PKCS12_F_PKCS12_PBE_KEYIVGEN : constant := 120;  --  openssl/pkcs12.h:295
      PKCS12_F_PKCS12_SETUP_MAC : constant := 122;  --  openssl/pkcs12.h:296
      PKCS12_F_PKCS12_SET_MAC : constant := 123;  --  openssl/pkcs12.h:297
      PKCS12_F_PKCS12_UNPACK_AUTHSAFES : constant := 130;  --  openssl/pkcs12.h:298
      PKCS12_F_PKCS12_UNPACK_P7DATA : constant := 131;  --  openssl/pkcs12.h:299
      PKCS12_F_PKCS12_VERIFY_MAC : constant := 126;  --  openssl/pkcs12.h:300
      PKCS12_F_PKCS8_ADD_KEYUSAGE : constant := 124;  --  openssl/pkcs12.h:301
      PKCS12_F_PKCS8_ENCRYPT : constant := 125;  --  openssl/pkcs12.h:302

      PKCS12_R_CANT_PACK_STRUCTURE : constant := 100;  --  openssl/pkcs12.h:305
      PKCS12_R_CONTENT_TYPE_NOT_DATA : constant := 121;  --  openssl/pkcs12.h:306
      PKCS12_R_DECODE_ERROR : constant := 101;  --  openssl/pkcs12.h:307
      PKCS12_R_ENCODE_ERROR : constant := 102;  --  openssl/pkcs12.h:308
      PKCS12_R_ENCRYPT_ERROR : constant := 103;  --  openssl/pkcs12.h:309
      PKCS12_R_ERROR_SETTING_ENCRYPTED_DATA_TYPE : constant := 120;  --  openssl/pkcs12.h:310
      PKCS12_R_INVALID_NULL_ARGUMENT : constant := 104;  --  openssl/pkcs12.h:311
      PKCS12_R_INVALID_NULL_PKCS12_POINTER : constant := 105;  --  openssl/pkcs12.h:312
      PKCS12_R_IV_GEN_ERROR : constant := 106;  --  openssl/pkcs12.h:313
      PKCS12_R_KEY_GEN_ERROR : constant := 107;  --  openssl/pkcs12.h:314
      PKCS12_R_MAC_ABSENT : constant := 108;  --  openssl/pkcs12.h:315
      PKCS12_R_MAC_GENERATION_ERROR : constant := 109;  --  openssl/pkcs12.h:316
      PKCS12_R_MAC_SETUP_ERROR : constant := 110;  --  openssl/pkcs12.h:317
      PKCS12_R_MAC_STRING_SET_ERROR : constant := 111;  --  openssl/pkcs12.h:318
      PKCS12_R_MAC_VERIFY_ERROR : constant := 112;  --  openssl/pkcs12.h:319
      PKCS12_R_MAC_VERIFY_FAILURE : constant := 113;  --  openssl/pkcs12.h:320
      PKCS12_R_PARSE_ERROR : constant := 114;  --  openssl/pkcs12.h:321
      PKCS12_R_PKCS12_ALGOR_CIPHERINIT_ERROR : constant := 115;  --  openssl/pkcs12.h:322
      PKCS12_R_PKCS12_CIPHERFINAL_ERROR : constant := 116;  --  openssl/pkcs12.h:323
      PKCS12_R_PKCS12_PBE_CRYPT_ERROR : constant := 117;  --  openssl/pkcs12.h:324
      PKCS12_R_UNKNOWN_DIGEST_ALGORITHM : constant := 118;  --  openssl/pkcs12.h:325
      PKCS12_R_UNSUPPORTED_PKCS12_MODE : constant := 119;  --  openssl/pkcs12.h:326
   end defs;
   type PKCS12_MAC_DATA is record
      dinfo : access OpenSSL.Low_Level.x509_h.X509_SIG;  -- openssl/pkcs12.h:100
      salt : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs12.h:101
      iter : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs12.h:102
   end record;
   pragma Convention (C_Pass_By_Copy, PKCS12_MAC_DATA);  -- openssl/pkcs12.h:103

   --  skipped anonymous struct anon_53

   type PKCS12 is record
      version : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs12.h:106
      mac : access PKCS12_MAC_DATA;  -- openssl/pkcs12.h:107
      authsafes : access OpenSSL.Low_Level.pkcs7_h.PKCS7;  -- openssl/pkcs12.h:108
   end record;
   pragma Convention (C_Pass_By_Copy, PKCS12);  -- openssl/pkcs12.h:109

   --  skipped anonymous struct anon_54

   type pkcs12_bag_st;
   type stack_st_PKCS12_SAFEBAG;
   type anon_56 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            bag : access pkcs12_bag_st;  -- openssl/pkcs12.h:114
         when 1 =>
            keybag : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;  -- openssl/pkcs12.h:115
         when 2 =>
            shkeybag : access OpenSSL.Low_Level.x509_h.X509_SIG;  -- openssl/pkcs12.h:116
         when 3 =>
            safes : access stack_st_PKCS12_SAFEBAG;  -- openssl/pkcs12.h:117
         when others =>
            other : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE;  -- openssl/pkcs12.h:118
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_56);
   pragma Unchecked_Union (anon_56);
   type PKCS12_SAFEBAG is record
      c_type : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/pkcs12.h:112
      value : anon_56;  -- openssl/pkcs12.h:119
      attrib : access OpenSSL.Low_Level.x509_h.stack_st_X509_ATTRIBUTE;  -- openssl/pkcs12.h:120
   end record;
   pragma Convention (C_Pass_By_Copy, PKCS12_SAFEBAG);  -- openssl/pkcs12.h:121

   --  skipped anonymous struct anon_55

   type stack_st_PKCS12_SAFEBAG is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/pkcs12.h:123
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_PKCS12_SAFEBAG);  -- openssl/pkcs12.h:123

   type pkcs12_bag_st is record
      c_type : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/pkcs12.h:128
      value : anon_57;  -- openssl/pkcs12.h:135
   end record;
   pragma Convention (C_Pass_By_Copy, pkcs12_bag_st);  -- openssl/pkcs12.h:127

   subtype PKCS12_BAGS is pkcs12_bag_st;

   function PKCS12_x5092certbag (the_x509 : access OpenSSL.Low_Level.x509_h.x509_st) return access PKCS12_SAFEBAG;  -- openssl/pkcs12.h:170
   pragma Import (C, PKCS12_x5092certbag, "PKCS12_x5092certbag");

   function PKCS12_x509crl2certbag (crl : access OpenSSL.Low_Level.x509_h.X509_crl_st) return access PKCS12_SAFEBAG;  -- openssl/pkcs12.h:171
   pragma Import (C, PKCS12_x509crl2certbag, "PKCS12_x509crl2certbag");

   function PKCS12_certbag2x509 (bag : access PKCS12_SAFEBAG) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/pkcs12.h:172
   pragma Import (C, PKCS12_certbag2x509, "PKCS12_certbag2x509");

   function PKCS12_certbag2x509crl (bag : access PKCS12_SAFEBAG) return access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/pkcs12.h:173
   pragma Import (C, PKCS12_certbag2x509crl, "PKCS12_certbag2x509crl");

   function PKCS12_item_pack_safebag
     (obj : System.Address;
      it : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM;
      nid1 : int;
      nid2 : int) return access PKCS12_SAFEBAG;  -- openssl/pkcs12.h:175
   pragma Import (C, PKCS12_item_pack_safebag, "PKCS12_item_pack_safebag");

   function PKCS12_MAKE_KEYBAG (p8 : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st) return access PKCS12_SAFEBAG;  -- openssl/pkcs12.h:177
   pragma Import (C, PKCS12_MAKE_KEYBAG, "PKCS12_MAKE_KEYBAG");

   function PKCS8_decrypt
     (p8 : access OpenSSL.Low_Level.x509_h.X509_SIG;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int) return access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;  -- openssl/pkcs12.h:178
   pragma Import (C, PKCS8_decrypt, "PKCS8_decrypt");

   function PKCS12_decrypt_skey
     (bag : access PKCS12_SAFEBAG;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int) return access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;  -- openssl/pkcs12.h:179
   pragma Import (C, PKCS12_decrypt_skey, "PKCS12_decrypt_skey");

   function PKCS8_encrypt
     (pbe_nid : int;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      salt : access unsigned_char;
      saltlen : int;
      iter : int;
      p8 : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st) return access OpenSSL.Low_Level.x509_h.X509_SIG;  -- openssl/pkcs12.h:181
   pragma Import (C, PKCS8_encrypt, "PKCS8_encrypt");

   function PKCS12_MAKE_SHKEYBAG
     (pbe_nid : int;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      salt : access unsigned_char;
      saltlen : int;
      iter : int;
      p8 : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st) return access PKCS12_SAFEBAG;  -- openssl/pkcs12.h:185
   pragma Import (C, PKCS12_MAKE_SHKEYBAG, "PKCS12_MAKE_SHKEYBAG");

   function PKCS12_pack_p7data (sk : access stack_st_PKCS12_SAFEBAG) return access OpenSSL.Low_Level.pkcs7_h.PKCS7;  -- openssl/pkcs12.h:189
   pragma Import (C, PKCS12_pack_p7data, "PKCS12_pack_p7data");

   function PKCS12_unpack_p7data (p7 : access OpenSSL.Low_Level.pkcs7_h.PKCS7) return access stack_st_PKCS12_SAFEBAG;  -- openssl/pkcs12.h:190
   pragma Import (C, PKCS12_unpack_p7data, "PKCS12_unpack_p7data");

   function PKCS12_pack_p7encdata
     (pbe_nid : int;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      salt : access unsigned_char;
      saltlen : int;
      iter : int;
      bags : access stack_st_PKCS12_SAFEBAG) return access OpenSSL.Low_Level.pkcs7_h.PKCS7;  -- openssl/pkcs12.h:191
   pragma Import (C, PKCS12_pack_p7encdata, "PKCS12_pack_p7encdata");

   function PKCS12_unpack_p7encdata
     (p7 : access OpenSSL.Low_Level.pkcs7_h.PKCS7;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int) return access stack_st_PKCS12_SAFEBAG;  -- openssl/pkcs12.h:194
   pragma Import (C, PKCS12_unpack_p7encdata, "PKCS12_unpack_p7encdata");

   function PKCS12_pack_authsafes (p12 : access PKCS12; safes : access OpenSSL.Low_Level.pkcs7_h.stack_st_PKCS7) return int;  -- openssl/pkcs12.h:196
   pragma Import (C, PKCS12_pack_authsafes, "PKCS12_pack_authsafes");

   function PKCS12_unpack_authsafes (p12 : access PKCS12) return access OpenSSL.Low_Level.pkcs7_h.stack_st_PKCS7;  -- openssl/pkcs12.h:197
   pragma Import (C, PKCS12_unpack_authsafes, "PKCS12_unpack_authsafes");

   function PKCS12_add_localkeyid
     (bag : access PKCS12_SAFEBAG;
      name : access unsigned_char;
      namelen : int) return int;  -- openssl/pkcs12.h:199
   pragma Import (C, PKCS12_add_localkeyid, "PKCS12_add_localkeyid");

   function PKCS12_add_friendlyname_asc
     (bag : access PKCS12_SAFEBAG;
      name : Interfaces.C.Strings.chars_ptr;
      namelen : int) return int;  -- openssl/pkcs12.h:200
   pragma Import (C, PKCS12_add_friendlyname_asc, "PKCS12_add_friendlyname_asc");

   function PKCS12_add_CSPName_asc
     (bag : access PKCS12_SAFEBAG;
      name : Interfaces.C.Strings.chars_ptr;
      namelen : int) return int;  -- openssl/pkcs12.h:202
   pragma Import (C, PKCS12_add_CSPName_asc, "PKCS12_add_CSPName_asc");

   function PKCS12_add_friendlyname_uni
     (bag : access PKCS12_SAFEBAG;
      name : access unsigned_char;
      namelen : int) return int;  -- openssl/pkcs12.h:204
   pragma Import (C, PKCS12_add_friendlyname_uni, "PKCS12_add_friendlyname_uni");

   function PKCS8_add_keyusage (p8 : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st; usage : int) return int;  -- openssl/pkcs12.h:206
   pragma Import (C, PKCS8_add_keyusage, "PKCS8_add_keyusage");

   function PKCS12_get_attr_gen (attrs : access OpenSSL.Low_Level.x509_h.stack_st_X509_ATTRIBUTE; attr_nid : int) return access OpenSSL.Low_Level.asn1_h.ASN1_TYPE;  -- openssl/pkcs12.h:207
   pragma Import (C, PKCS12_get_attr_gen, "PKCS12_get_attr_gen");

   function PKCS12_get_friendlyname (bag : access PKCS12_SAFEBAG) return Interfaces.C.Strings.chars_ptr;  -- openssl/pkcs12.h:208
   pragma Import (C, PKCS12_get_friendlyname, "PKCS12_get_friendlyname");

   function PKCS12_pbe_crypt
     (algor : access OpenSSL.Low_Level.x509_h.X509_algor_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      c_in : access unsigned_char;
      inlen : int;
      data : System.Address;
      datalen : access int;
      en_de : int) return access unsigned_char;  -- openssl/pkcs12.h:209
   pragma Import (C, PKCS12_pbe_crypt, "PKCS12_pbe_crypt");

   function PKCS12_item_decrypt_d2i
     (algor : access OpenSSL.Low_Level.x509_h.X509_algor_st;
      it : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      oct : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      zbuf : int) return System.Address;  -- openssl/pkcs12.h:212
   pragma Import (C, PKCS12_item_decrypt_d2i, "PKCS12_item_decrypt_d2i");

   function PKCS12_item_i2d_encrypt
     (algor : access OpenSSL.Low_Level.x509_h.X509_algor_st;
      it : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      obj : System.Address;
      zbuf : int) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs12.h:214
   pragma Import (C, PKCS12_item_i2d_encrypt, "PKCS12_item_i2d_encrypt");

   function PKCS12_init (mode : int) return access PKCS12;  -- openssl/pkcs12.h:217
   pragma Import (C, PKCS12_init, "PKCS12_init");

   function PKCS12_key_gen_asc
     (pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      salt : access unsigned_char;
      saltlen : int;
      id : int;
      iter : int;
      n : int;
      c_out : access unsigned_char;
      md_type : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/pkcs12.h:218
   pragma Import (C, PKCS12_key_gen_asc, "PKCS12_key_gen_asc");

   function PKCS12_key_gen_uni
     (pass : access unsigned_char;
      passlen : int;
      salt : access unsigned_char;
      saltlen : int;
      id : int;
      iter : int;
      n : int;
      c_out : access unsigned_char;
      md_type : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/pkcs12.h:221
   pragma Import (C, PKCS12_key_gen_uni, "PKCS12_key_gen_uni");

   function PKCS12_PBE_keyivgen
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      param : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      md_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      en_de : int) return int;  -- openssl/pkcs12.h:222
   pragma Import (C, PKCS12_PBE_keyivgen, "PKCS12_PBE_keyivgen");

   function PKCS12_gen_mac
     (p12 : access PKCS12;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      mac : access unsigned_char;
      maclen : access unsigned) return int;  -- openssl/pkcs12.h:225
   pragma Import (C, PKCS12_gen_mac, "PKCS12_gen_mac");

   function PKCS12_verify_mac
     (p12 : access PKCS12;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int) return int;  -- openssl/pkcs12.h:227
   pragma Import (C, PKCS12_verify_mac, "PKCS12_verify_mac");

   function PKCS12_set_mac
     (p12 : access PKCS12;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      salt : access unsigned_char;
      saltlen : int;
      iter : int;
      md_type : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/pkcs12.h:228
   pragma Import (C, PKCS12_set_mac, "PKCS12_set_mac");

   function PKCS12_setup_mac
     (p12 : access PKCS12;
      iter : int;
      salt : access unsigned_char;
      saltlen : int;
      md_type : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/pkcs12.h:231
   pragma Import (C, PKCS12_setup_mac, "PKCS12_setup_mac");

   function OPENSSL_asc2uni
     (asc : Interfaces.C.Strings.chars_ptr;
      asclen : int;
      uni : System.Address;
      unilen : access int) return access unsigned_char;  -- openssl/pkcs12.h:233
   pragma Import (C, OPENSSL_asc2uni, "OPENSSL_asc2uni");

   function OPENSSL_uni2asc (uni : access unsigned_char; unilen : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/pkcs12.h:234
   pragma Import (C, OPENSSL_uni2asc, "OPENSSL_uni2asc");

   PKCS12_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs12.h:236
   pragma Import (C, PKCS12_it, "PKCS12_it");

   function i2d_PKCS12 (a : access PKCS12; c_out : System.Address) return int;  -- openssl/pkcs12.h:236
   pragma Import (C, i2d_PKCS12, "i2d_PKCS12");

   function d2i_PKCS12
     (a : System.Address;
      c_in : System.Address;
      len : long) return access PKCS12;  -- openssl/pkcs12.h:236
   pragma Import (C, d2i_PKCS12, "d2i_PKCS12");

   procedure PKCS12_free (a : access PKCS12);  -- openssl/pkcs12.h:236
   pragma Import (C, PKCS12_free, "PKCS12_free");

   function PKCS12_new return access PKCS12;  -- openssl/pkcs12.h:236
   pragma Import (C, PKCS12_new, "PKCS12_new");

   PKCS12_MAC_DATA_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs12.h:237
   pragma Import (C, PKCS12_MAC_DATA_it, "PKCS12_MAC_DATA_it");

   function i2d_PKCS12_MAC_DATA (a : access PKCS12_MAC_DATA; c_out : System.Address) return int;  -- openssl/pkcs12.h:237
   pragma Import (C, i2d_PKCS12_MAC_DATA, "i2d_PKCS12_MAC_DATA");

   function d2i_PKCS12_MAC_DATA
     (a : System.Address;
      c_in : System.Address;
      len : long) return access PKCS12_MAC_DATA;  -- openssl/pkcs12.h:237
   pragma Import (C, d2i_PKCS12_MAC_DATA, "d2i_PKCS12_MAC_DATA");

   procedure PKCS12_MAC_DATA_free (a : access PKCS12_MAC_DATA);  -- openssl/pkcs12.h:237
   pragma Import (C, PKCS12_MAC_DATA_free, "PKCS12_MAC_DATA_free");

   function PKCS12_MAC_DATA_new return access PKCS12_MAC_DATA;  -- openssl/pkcs12.h:237
   pragma Import (C, PKCS12_MAC_DATA_new, "PKCS12_MAC_DATA_new");

   PKCS12_SAFEBAG_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs12.h:238
   pragma Import (C, PKCS12_SAFEBAG_it, "PKCS12_SAFEBAG_it");

   function i2d_PKCS12_SAFEBAG (a : access PKCS12_SAFEBAG; c_out : System.Address) return int;  -- openssl/pkcs12.h:238
   pragma Import (C, i2d_PKCS12_SAFEBAG, "i2d_PKCS12_SAFEBAG");

   function d2i_PKCS12_SAFEBAG
     (a : System.Address;
      c_in : System.Address;
      len : long) return access PKCS12_SAFEBAG;  -- openssl/pkcs12.h:238
   pragma Import (C, d2i_PKCS12_SAFEBAG, "d2i_PKCS12_SAFEBAG");

   procedure PKCS12_SAFEBAG_free (a : access PKCS12_SAFEBAG);  -- openssl/pkcs12.h:238
   pragma Import (C, PKCS12_SAFEBAG_free, "PKCS12_SAFEBAG_free");

   function PKCS12_SAFEBAG_new return access PKCS12_SAFEBAG;  -- openssl/pkcs12.h:238
   pragma Import (C, PKCS12_SAFEBAG_new, "PKCS12_SAFEBAG_new");

   PKCS12_BAGS_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs12.h:239
   pragma Import (C, PKCS12_BAGS_it, "PKCS12_BAGS_it");

   function i2d_PKCS12_BAGS (a : access PKCS12_BAGS; c_out : System.Address) return int;  -- openssl/pkcs12.h:239
   pragma Import (C, i2d_PKCS12_BAGS, "i2d_PKCS12_BAGS");

   function d2i_PKCS12_BAGS
     (a : System.Address;
      c_in : System.Address;
      len : long) return access PKCS12_BAGS;  -- openssl/pkcs12.h:239
   pragma Import (C, d2i_PKCS12_BAGS, "d2i_PKCS12_BAGS");

   procedure PKCS12_BAGS_free (a : access PKCS12_BAGS);  -- openssl/pkcs12.h:239
   pragma Import (C, PKCS12_BAGS_free, "PKCS12_BAGS_free");

   function PKCS12_BAGS_new return access PKCS12_BAGS;  -- openssl/pkcs12.h:239
   pragma Import (C, PKCS12_BAGS_new, "PKCS12_BAGS_new");

   PKCS12_SAFEBAGS_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs12.h:241
   pragma Import (C, PKCS12_SAFEBAGS_it, "PKCS12_SAFEBAGS_it");

   PKCS12_AUTHSAFES_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs12.h:242
   pragma Import (C, PKCS12_AUTHSAFES_it, "PKCS12_AUTHSAFES_it");

   procedure PKCS12_PBE_add;  -- openssl/pkcs12.h:244
   pragma Import (C, PKCS12_PBE_add, "PKCS12_PBE_add");

   function PKCS12_parse
     (p12 : access PKCS12;
      pass : Interfaces.C.Strings.chars_ptr;
      pkey : System.Address;
      cert : System.Address;
      ca : System.Address) return int;  -- openssl/pkcs12.h:245
   pragma Import (C, PKCS12_parse, "PKCS12_parse");

   function PKCS12_create
     (pass : Interfaces.C.Strings.chars_ptr;
      name : Interfaces.C.Strings.chars_ptr;
      pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      cert : access OpenSSL.Low_Level.x509_h.x509_st;
      ca : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      nid_key : int;
      nid_cert : int;
      iter : int;
      mac_iter : int;
      keytype : int) return access PKCS12;  -- openssl/pkcs12.h:247
   pragma Import (C, PKCS12_create, "PKCS12_create");

   function PKCS12_add_cert (pbags : System.Address; cert : access OpenSSL.Low_Level.x509_h.x509_st) return access PKCS12_SAFEBAG;  -- openssl/pkcs12.h:251
   pragma Import (C, PKCS12_add_cert, "PKCS12_add_cert");

   function PKCS12_add_key
     (pbags : System.Address;
      key : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      key_usage : int;
      iter : int;
      key_nid : int;
      pass : Interfaces.C.Strings.chars_ptr) return access PKCS12_SAFEBAG;  -- openssl/pkcs12.h:252
   pragma Import (C, PKCS12_add_key, "PKCS12_add_key");

   function PKCS12_add_safe
     (psafes : System.Address;
      bags : access stack_st_PKCS12_SAFEBAG;
      safe_nid : int;
      iter : int;
      pass : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/pkcs12.h:255
   pragma Import (C, PKCS12_add_safe, "PKCS12_add_safe");

   function PKCS12_add_safes (safes : access OpenSSL.Low_Level.pkcs7_h.stack_st_PKCS7; p7_nid : int) return access PKCS12;  -- openssl/pkcs12.h:257
   pragma Import (C, PKCS12_add_safes, "PKCS12_add_safes");

   function i2d_PKCS12_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; p12 : access PKCS12) return int;  -- openssl/pkcs12.h:259
   pragma Import (C, i2d_PKCS12_bio, "i2d_PKCS12_bio");

   function i2d_PKCS12_fp (fp : access Interfaces.C_Streams.FILEs; p12 : access PKCS12) return int;  -- openssl/pkcs12.h:260
   pragma Import (C, i2d_PKCS12_fp, "i2d_PKCS12_fp");

   function d2i_PKCS12_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; p12 : System.Address) return access PKCS12;  -- openssl/pkcs12.h:261
   pragma Import (C, d2i_PKCS12_bio, "d2i_PKCS12_bio");

   function d2i_PKCS12_fp (fp : access Interfaces.C_Streams.FILEs; p12 : System.Address) return access PKCS12;  -- openssl/pkcs12.h:262
   pragma Import (C, d2i_PKCS12_fp, "d2i_PKCS12_fp");

   function PKCS12_newpass
     (p12 : access PKCS12;
      oldpass : Interfaces.C.Strings.chars_ptr;
      newpass : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/pkcs12.h:263
   pragma Import (C, PKCS12_newpass, "PKCS12_newpass");

   procedure ERR_load_PKCS12_strings;  -- openssl/pkcs12.h:269
   pragma Import (C, ERR_load_PKCS12_strings, "ERR_load_PKCS12_strings");

end OpenSSL.Low_Level.pkcs12_h;
