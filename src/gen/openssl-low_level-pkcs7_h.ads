with Interfaces.C; use Interfaces.C;
--  limited --  with OpenSSL.Low_Level.ossl_typ_h;
limited with OpenSSL.Low_Level.x509_h;
with OpenSSL.Low_Level.stack_h;
with OpenSSL.Low_Level.asn1_h;
with System;
--  limited --  with Interfaces.C_Streams;
limited with OpenSSL.Low_Level.bio_h;
with Interfaces.C.Strings;

package OpenSSL.Low_Level.pkcs7_h is

   package defs is

      PKCS7_S_HEADER : constant := 0;  --  openssl/pkcs7.h:182
      PKCS7_S_BODY   : constant := 1;  --  openssl/pkcs7.h:183
      PKCS7_S_TAIL   : constant := 2;  --  openssl/pkcs7.h:184

      PKCS7_OP_SET_DETACHED_SIGNATURE : constant := 1;  --  openssl/pkcs7.h:223
      PKCS7_OP_GET_DETACHED_SIGNATURE : constant := 2;  --  openssl/pkcs7.h:224
      --  arg-macro: function PKCS7_get_signed_attributes (si)
      --    return (si).auth_attr;
      --  arg-macro: function PKCS7_get_attributes (si)
      --    return (si).unauth_attr;
      --  arg-macro: function PKCS7_type_is_signed (a)
      --    return OBJ_obj2nid((a).type) = NID_pkcs7_signed;
      --  arg-macro: function PKCS7_type_is_enveloped (a)
      --    return OBJ_obj2nid((a).type) = NID_pkcs7_enveloped;
      --  arg-macro: function PKCS7_type_is_signedAndEnveloped (a)
      --    return OBJ_obj2nid((a).type) = NID_pkcs7_signedAndEnveloped;
      --  arg-macro: function PKCS7_type_is_data (a)
      --    return OBJ_obj2nid((a).type) = NID_pkcs7_data;
      --  arg-macro: function PKCS7_type_is_encrypted (a)
      --    return OBJ_obj2nid((a).type) = NID_pkcs7_encrypted;
      --  arg-macro: function PKCS7_type_is_digest (a)
      --    return OBJ_obj2nid((a).type) = NID_pkcs7_digest;
      --  arg-macro: procedure PKCS7_set_detached (p, v)
      --    PKCS7_ctrl(p,PKCS7_OP_SET_DETACHED_SIGNATURE,v,NULL)
      --  arg-macro: procedure PKCS7_get_detached (p)
      --    PKCS7_ctrl(p,PKCS7_OP_GET_DETACHED_SIGNATURE,0,NULL)
      --  arg-macro: function PKCS7_is_detached (p7)
      --    return PKCS7_type_is_signed(p7)  and then  PKCS7_get_detached(p7);

      PKCS7_TEXT     : constant := 16#1#;  --  openssl/pkcs7.h:250
      PKCS7_NOCERTS  : constant := 16#2#;  --  openssl/pkcs7.h:251
      PKCS7_NOSIGS   : constant := 16#4#;  --  openssl/pkcs7.h:252
      PKCS7_NOCHAIN  : constant := 16#8#;  --  openssl/pkcs7.h:253
      PKCS7_NOINTERN : constant := 16#10#;  --  openssl/pkcs7.h:254
      PKCS7_NOVERIFY : constant := 16#20#;  --  openssl/pkcs7.h:255
      PKCS7_DETACHED : constant := 16#40#;  --  openssl/pkcs7.h:256
      PKCS7_BINARY   : constant := 16#80#;  --  openssl/pkcs7.h:257
      PKCS7_NOATTR   : constant := 16#100#;  --  openssl/pkcs7.h:258
      PKCS7_NOSMIMECAP : constant := 16#200#;  --  openssl/pkcs7.h:259
      PKCS7_NOOLDMIMETYPE : constant := 16#400#;  --  openssl/pkcs7.h:260
      PKCS7_CRLFEOL  : constant := 16#800#;  --  openssl/pkcs7.h:261
      PKCS7_STREAM   : constant := 16#1000#;  --  openssl/pkcs7.h:262
      PKCS7_NOCRL    : constant := 16#2000#;  --  openssl/pkcs7.h:263
      PKCS7_PARTIAL  : constant := 16#4000#;  --  openssl/pkcs7.h:264
      PKCS7_REUSE_DIGEST : constant := 16#8000#;  --  openssl/pkcs7.h:265
      --  unsupported macro: SMIME_TEXT PKCS7_TEXT
      --  unsupported macro: SMIME_NOCERTS PKCS7_NOCERTS
      --  unsupported macro: SMIME_NOSIGS PKCS7_NOSIGS
      --  unsupported macro: SMIME_NOCHAIN PKCS7_NOCHAIN
      --  unsupported macro: SMIME_NOINTERN PKCS7_NOINTERN
      --  unsupported macro: SMIME_NOVERIFY PKCS7_NOVERIFY
      --  unsupported macro: SMIME_DETACHED PKCS7_DETACHED
      --  unsupported macro: SMIME_BINARY PKCS7_BINARY
      --  unsupported macro: SMIME_NOATTR PKCS7_NOATTR

      PKCS7_F_B64_READ_PKCS7 : constant := 120;  --  openssl/pkcs7.h:399
      PKCS7_F_B64_WRITE_PKCS7 : constant := 121;  --  openssl/pkcs7.h:400
      PKCS7_F_DO_PKCS7_SIGNED_ATTRIB : constant := 136;  --  openssl/pkcs7.h:401
      PKCS7_F_I2D_PKCS7_BIO_STREAM : constant := 140;  --  openssl/pkcs7.h:402
      PKCS7_F_PKCS7_ADD0_ATTRIB_SIGNING_TIME : constant := 135;  --  openssl/pkcs7.h:403
      PKCS7_F_PKCS7_ADD_ATTRIB_SMIMECAP : constant := 118;  --  openssl/pkcs7.h:404
      PKCS7_F_PKCS7_ADD_CERTIFICATE : constant := 100;  --  openssl/pkcs7.h:405
      PKCS7_F_PKCS7_ADD_CRL : constant := 101;  --  openssl/pkcs7.h:406
      PKCS7_F_PKCS7_ADD_RECIPIENT_INFO : constant := 102;  --  openssl/pkcs7.h:407
      PKCS7_F_PKCS7_ADD_SIGNATURE : constant := 131;  --  openssl/pkcs7.h:408
      PKCS7_F_PKCS7_ADD_SIGNER : constant := 103;  --  openssl/pkcs7.h:409
      PKCS7_F_PKCS7_BIO_ADD_DIGEST : constant := 125;  --  openssl/pkcs7.h:410
      PKCS7_F_PKCS7_COPY_EXISTING_DIGEST : constant := 138;  --  openssl/pkcs7.h:411
      PKCS7_F_PKCS7_CTRL : constant := 104;  --  openssl/pkcs7.h:412
      PKCS7_F_PKCS7_DATADECODE : constant := 112;  --  openssl/pkcs7.h:413
      PKCS7_F_PKCS7_DATAFINAL : constant := 128;  --  openssl/pkcs7.h:414
      PKCS7_F_PKCS7_DATAINIT : constant := 105;  --  openssl/pkcs7.h:415
      PKCS7_F_PKCS7_DATASIGN : constant := 106;  --  openssl/pkcs7.h:416
      PKCS7_F_PKCS7_DATAVERIFY : constant := 107;  --  openssl/pkcs7.h:417
      PKCS7_F_PKCS7_DECRYPT : constant := 114;  --  openssl/pkcs7.h:418
      PKCS7_F_PKCS7_DECRYPT_RINFO : constant := 133;  --  openssl/pkcs7.h:419
      PKCS7_F_PKCS7_ENCODE_RINFO : constant := 132;  --  openssl/pkcs7.h:420
      PKCS7_F_PKCS7_ENCRYPT : constant := 115;  --  openssl/pkcs7.h:421
      PKCS7_F_PKCS7_FINAL : constant := 134;  --  openssl/pkcs7.h:422
      PKCS7_F_PKCS7_FIND_DIGEST : constant := 127;  --  openssl/pkcs7.h:423
      PKCS7_F_PKCS7_GET0_SIGNERS : constant := 124;  --  openssl/pkcs7.h:424
      PKCS7_F_PKCS7_RECIP_INFO_SET : constant := 130;  --  openssl/pkcs7.h:425
      PKCS7_F_PKCS7_SET_CIPHER : constant := 108;  --  openssl/pkcs7.h:426
      PKCS7_F_PKCS7_SET_CONTENT : constant := 109;  --  openssl/pkcs7.h:427
      PKCS7_F_PKCS7_SET_DIGEST : constant := 126;  --  openssl/pkcs7.h:428
      PKCS7_F_PKCS7_SET_TYPE : constant := 110;  --  openssl/pkcs7.h:429
      PKCS7_F_PKCS7_SIGN : constant := 116;  --  openssl/pkcs7.h:430
      PKCS7_F_PKCS7_SIGNATUREVERIFY : constant := 113;  --  openssl/pkcs7.h:431
      PKCS7_F_PKCS7_SIGNER_INFO_SET : constant := 129;  --  openssl/pkcs7.h:432
      PKCS7_F_PKCS7_SIGNER_INFO_SIGN : constant := 139;  --  openssl/pkcs7.h:433
      PKCS7_F_PKCS7_SIGN_ADD_SIGNER : constant := 137;  --  openssl/pkcs7.h:434
      PKCS7_F_PKCS7_SIMPLE_SMIMECAP : constant := 119;  --  openssl/pkcs7.h:435
      PKCS7_F_PKCS7_VERIFY : constant := 117;  --  openssl/pkcs7.h:436
      PKCS7_F_SMIME_READ_PKCS7 : constant := 122;  --  openssl/pkcs7.h:437
      PKCS7_F_SMIME_TEXT : constant := 123;  --  openssl/pkcs7.h:438

      PKCS7_R_CERTIFICATE_VERIFY_ERROR : constant := 117;  --  openssl/pkcs7.h:441
      PKCS7_R_CIPHER_HAS_NO_OBJECT_IDENTIFIER : constant := 144;  --  openssl/pkcs7.h:442
      PKCS7_R_CIPHER_NOT_INITIALIZED : constant := 116;  --  openssl/pkcs7.h:443
      PKCS7_R_CONTENT_AND_DATA_PRESENT : constant := 118;  --  openssl/pkcs7.h:444
      PKCS7_R_CTRL_ERROR : constant := 152;  --  openssl/pkcs7.h:445
      PKCS7_R_DECODE_ERROR : constant := 130;  --  openssl/pkcs7.h:446
      PKCS7_R_DECRYPTED_KEY_IS_WRONG_LENGTH : constant := 100;  --  openssl/pkcs7.h:447
      PKCS7_R_DECRYPT_ERROR : constant := 119;  --  openssl/pkcs7.h:448
      PKCS7_R_DIGEST_FAILURE : constant := 101;  --  openssl/pkcs7.h:449
      PKCS7_R_ENCRYPTION_CTRL_FAILURE : constant := 149;  --  openssl/pkcs7.h:450
      PKCS7_R_ENCRYPTION_NOT_SUPPORTED_FOR_THIS_KEY_TYPE : constant := 150;  --  openssl/pkcs7.h:451
      PKCS7_R_ERROR_ADDING_RECIPIENT : constant := 120;  --  openssl/pkcs7.h:452
      PKCS7_R_ERROR_SETTING_CIPHER : constant := 121;  --  openssl/pkcs7.h:453
      PKCS7_R_INVALID_MIME_TYPE : constant := 131;  --  openssl/pkcs7.h:454
      PKCS7_R_INVALID_NULL_POINTER : constant := 143;  --  openssl/pkcs7.h:455
      PKCS7_R_MIME_NO_CONTENT_TYPE : constant := 132;  --  openssl/pkcs7.h:456
      PKCS7_R_MIME_PARSE_ERROR : constant := 133;  --  openssl/pkcs7.h:457
      PKCS7_R_MIME_SIG_PARSE_ERROR : constant := 134;  --  openssl/pkcs7.h:458
      PKCS7_R_MISSING_CERIPEND_INFO : constant := 103;  --  openssl/pkcs7.h:459
      PKCS7_R_NO_CONTENT : constant := 122;  --  openssl/pkcs7.h:460
      PKCS7_R_NO_CONTENT_TYPE : constant := 135;  --  openssl/pkcs7.h:461
      PKCS7_R_NO_DEFAULT_DIGEST : constant := 151;  --  openssl/pkcs7.h:462
      PKCS7_R_NO_MATCHING_DIGEST_TYPE_FOUND : constant := 154;  --  openssl/pkcs7.h:463
      PKCS7_R_NO_MULTIPART_BODY_FAILURE : constant := 136;  --  openssl/pkcs7.h:464
      PKCS7_R_NO_MULTIPART_BOUNDARY : constant := 137;  --  openssl/pkcs7.h:465
      PKCS7_R_NO_RECIPIENT_MATCHES_CERTIFICATE : constant := 115;  --  openssl/pkcs7.h:466
      PKCS7_R_NO_RECIPIENT_MATCHES_KEY : constant := 146;  --  openssl/pkcs7.h:467
      PKCS7_R_NO_SIGNATURES_ON_DATA : constant := 123;  --  openssl/pkcs7.h:468
      PKCS7_R_NO_SIGNERS : constant := 142;  --  openssl/pkcs7.h:469
      PKCS7_R_NO_SIG_CONTENT_TYPE : constant := 138;  --  openssl/pkcs7.h:470
      PKCS7_R_OPERATION_NOT_SUPPORTED_ON_THIS_TYPE : constant := 104;  --  openssl/pkcs7.h:471
      PKCS7_R_PKCS7_ADD_SIGNATURE_ERROR : constant := 124;  --  openssl/pkcs7.h:472
      PKCS7_R_PKCS7_ADD_SIGNER_ERROR : constant := 153;  --  openssl/pkcs7.h:473
      PKCS7_R_PKCS7_DATAFINAL : constant := 126;  --  openssl/pkcs7.h:474
      PKCS7_R_PKCS7_DATAFINAL_ERROR : constant := 125;  --  openssl/pkcs7.h:475
      PKCS7_R_PKCS7_DATASIGN : constant := 145;  --  openssl/pkcs7.h:476
      PKCS7_R_PKCS7_PARSE_ERROR : constant := 139;  --  openssl/pkcs7.h:477
      PKCS7_R_PKCS7_SIG_PARSE_ERROR : constant := 140;  --  openssl/pkcs7.h:478
      PKCS7_R_PRIVATE_KEY_DOES_NOT_MATCH_CERTIFICATE : constant := 127;  --  openssl/pkcs7.h:479
      PKCS7_R_SIGNATURE_FAILURE : constant := 105;  --  openssl/pkcs7.h:480
      PKCS7_R_SIGNER_CERTIFICATE_NOT_FOUND : constant := 128;  --  openssl/pkcs7.h:481
      PKCS7_R_SIGNING_CTRL_FAILURE : constant := 147;  --  openssl/pkcs7.h:482
      PKCS7_R_SIGNING_NOT_SUPPORTED_FOR_THIS_KEY_TYPE : constant := 148;  --  openssl/pkcs7.h:483
      PKCS7_R_SIG_INVALID_MIME_TYPE : constant := 141;  --  openssl/pkcs7.h:484
      PKCS7_R_SMIME_TEXT_ERROR : constant := 129;  --  openssl/pkcs7.h:485
      PKCS7_R_UNABLE_TO_FIND_CERTIFICATE : constant := 106;  --  openssl/pkcs7.h:486
      PKCS7_R_UNABLE_TO_FIND_MEM_BIO : constant := 107;  --  openssl/pkcs7.h:487
      PKCS7_R_UNABLE_TO_FIND_MESSAGE_DIGEST : constant := 108;  --  openssl/pkcs7.h:488
      PKCS7_R_UNKNOWN_DIGEST_TYPE : constant := 109;  --  openssl/pkcs7.h:489
      PKCS7_R_UNKNOWN_OPERATION : constant := 110;  --  openssl/pkcs7.h:490
      PKCS7_R_UNSUPPORTED_CIPHER_TYPE : constant := 111;  --  openssl/pkcs7.h:491
      PKCS7_R_UNSUPPORTED_CONTENT_TYPE : constant := 112;  --  openssl/pkcs7.h:492
      PKCS7_R_WRONG_CONTENT_TYPE : constant := 113;  --  openssl/pkcs7.h:493
      PKCS7_R_WRONG_PKCS7_TYPE : constant := 114;  --  openssl/pkcs7.h:494
   end defs;
   type pkcs7_issuer_and_serial_st is record
      issuer : access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/pkcs7.h:88
      serial : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:89
   end record;
   pragma Convention (C_Pass_By_Copy, pkcs7_issuer_and_serial_st);  -- openssl/pkcs7.h:86

   subtype PKCS7_ISSUER_AND_SERIAL is pkcs7_issuer_and_serial_st;

   type pkcs7_signer_info_st is record
      version           : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:94
      issuer_and_serial : access PKCS7_ISSUER_AND_SERIAL;  -- openssl/pkcs7.h:95
      digest_alg        : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/pkcs7.h:96
      auth_attr         : access OpenSSL.Low_Level.x509_h.stack_st_X509_ATTRIBUTE;  -- openssl/pkcs7.h:97
      digest_enc_alg    : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/pkcs7.h:98
      enc_digest        : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:99
      unauth_attr       : access OpenSSL.Low_Level.x509_h.stack_st_X509_ATTRIBUTE;  -- openssl/pkcs7.h:100
      pkey              : access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pkcs7.h:103
   end record;
   pragma Convention (C_Pass_By_Copy, pkcs7_signer_info_st);  -- openssl/pkcs7.h:92

   subtype PKCS7_SIGNER_INFO is pkcs7_signer_info_st;

   type stack_st_PKCS7_SIGNER_INFO is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/pkcs7.h:106
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_PKCS7_SIGNER_INFO);  -- openssl/pkcs7.h:106

   type pkcs7_recip_info_st is record
      version           : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:111
      issuer_and_serial : access PKCS7_ISSUER_AND_SERIAL;  -- openssl/pkcs7.h:112
      key_enc_algor     : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/pkcs7.h:113
      enc_key           : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:114
      cert              : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/pkcs7.h:115
   end record;
   pragma Convention (C_Pass_By_Copy, pkcs7_recip_info_st);  -- openssl/pkcs7.h:109

   subtype PKCS7_RECIP_INFO is pkcs7_recip_info_st;

   type stack_st_PKCS7_RECIP_INFO is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/pkcs7.h:118
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_PKCS7_RECIP_INFO);  -- openssl/pkcs7.h:118

   type pkcs7_st;
   type pkcs7_signed_st is record
      version     : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:123
      md_algs     : access OpenSSL.Low_Level.asn1_h.stack_st_X509_ALGOR;  -- openssl/pkcs7.h:124
      cert        : access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/pkcs7.h:125
      crl         : access OpenSSL.Low_Level.x509_h.stack_st_X509_CRL;  -- openssl/pkcs7.h:126
      signer_info : access stack_st_PKCS7_SIGNER_INFO;  -- openssl/pkcs7.h:127
      contents    : access pkcs7_st;  -- openssl/pkcs7.h:129
   end record;
   pragma Convention (C_Pass_By_Copy, pkcs7_signed_st);  -- openssl/pkcs7.h:121

   subtype PKCS7_SIGNED is pkcs7_signed_st;

   type pkcs7_enc_content_st is record
      content_type : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/pkcs7.h:136
      algorithm    : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/pkcs7.h:137
      enc_data     : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:138
      cipher       : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/pkcs7.h:139
   end record;
   pragma Convention (C_Pass_By_Copy, pkcs7_enc_content_st);  -- openssl/pkcs7.h:134

   subtype PKCS7_ENC_CONTENT is pkcs7_enc_content_st;

   type pkcs7_enveloped_st is record
      version       : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:144
      recipientinfo : access stack_st_PKCS7_RECIP_INFO;  -- openssl/pkcs7.h:145
      enc_data      : access PKCS7_ENC_CONTENT;  -- openssl/pkcs7.h:146
   end record;
   pragma Convention (C_Pass_By_Copy, pkcs7_enveloped_st);  -- openssl/pkcs7.h:142

   subtype PKCS7_ENVELOPE is pkcs7_enveloped_st;

   type pkcs7_signedandenveloped_st is record
      version       : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:151
      md_algs       : access OpenSSL.Low_Level.asn1_h.stack_st_X509_ALGOR;  -- openssl/pkcs7.h:152
      cert          : access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/pkcs7.h:153
      crl           : access OpenSSL.Low_Level.x509_h.stack_st_X509_CRL;  -- openssl/pkcs7.h:154
      signer_info   : access stack_st_PKCS7_SIGNER_INFO;  -- openssl/pkcs7.h:155
      enc_data      : access PKCS7_ENC_CONTENT;  -- openssl/pkcs7.h:157
      recipientinfo : access stack_st_PKCS7_RECIP_INFO;  -- openssl/pkcs7.h:158
   end record;
   pragma Convention (C_Pass_By_Copy, pkcs7_signedandenveloped_st);  -- openssl/pkcs7.h:149

   subtype PKCS7_SIGN_ENVELOPE is pkcs7_signedandenveloped_st;

   type pkcs7_digest_st is record
      version  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:163
      md       : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/pkcs7.h:164
      contents : access pkcs7_st;  -- openssl/pkcs7.h:165
      digest   : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:166
   end record;
   pragma Convention (C_Pass_By_Copy, pkcs7_digest_st);  -- openssl/pkcs7.h:161

   subtype PKCS7_DIGEST is pkcs7_digest_st;

   type pkcs7_encrypted_st is record
      version  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:171
      enc_data : access PKCS7_ENC_CONTENT;  -- openssl/pkcs7.h:172
   end record;
   pragma Convention (C_Pass_By_Copy, pkcs7_encrypted_st);  -- openssl/pkcs7.h:169

   subtype PKCS7_ENCRYPT is pkcs7_encrypted_st;

   type pkcs7_st is record
      asn1     : access unsigned_char;  -- openssl/pkcs7.h:179
      length   : aliased long;  -- openssl/pkcs7.h:180
      state    : aliased int;  -- openssl/pkcs7.h:185
      detached : aliased int;  -- openssl/pkcs7.h:187
      c_type   : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/pkcs7.h:189
      d        : anon_32;  -- openssl/pkcs7.h:216
   end record;
   pragma Convention (C_Pass_By_Copy, pkcs7_st);  -- openssl/pkcs7.h:175

   subtype PKCS7 is pkcs7_st;

   type stack_st_PKCS7 is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/pkcs7.h:219
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_PKCS7);  -- openssl/pkcs7.h:219

   PKCS7_ISSUER_AND_SERIAL_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs7.h:279
   pragma Import (C, PKCS7_ISSUER_AND_SERIAL_it, "PKCS7_ISSUER_AND_SERIAL_it");

   function i2d_PKCS7_ISSUER_AND_SERIAL (a : access PKCS7_ISSUER_AND_SERIAL; c_out : System.Address) return int;  -- openssl/pkcs7.h:279
   pragma Import (C, i2d_PKCS7_ISSUER_AND_SERIAL, "i2d_PKCS7_ISSUER_AND_SERIAL");

   function d2i_PKCS7_ISSUER_AND_SERIAL
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PKCS7_ISSUER_AND_SERIAL;  -- openssl/pkcs7.h:279
   pragma Import (C, d2i_PKCS7_ISSUER_AND_SERIAL, "d2i_PKCS7_ISSUER_AND_SERIAL");

   procedure PKCS7_ISSUER_AND_SERIAL_free (a : access PKCS7_ISSUER_AND_SERIAL);  -- openssl/pkcs7.h:279
   pragma Import (C, PKCS7_ISSUER_AND_SERIAL_free, "PKCS7_ISSUER_AND_SERIAL_free");

   function PKCS7_ISSUER_AND_SERIAL_new return access PKCS7_ISSUER_AND_SERIAL;  -- openssl/pkcs7.h:279
   pragma Import (C, PKCS7_ISSUER_AND_SERIAL_new, "PKCS7_ISSUER_AND_SERIAL_new");

   function PKCS7_ISSUER_AND_SERIAL_digest
     (data   : access PKCS7_ISSUER_AND_SERIAL;
      c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      md     : access unsigned_char;
      len    : access unsigned) return int;  -- openssl/pkcs7.h:281
   pragma Import (C, PKCS7_ISSUER_AND_SERIAL_digest, "PKCS7_ISSUER_AND_SERIAL_digest");

   function d2i_PKCS7_fp (fp : access Interfaces.C_Streams.FILEs; p7 : System.Address) return access PKCS7;  -- openssl/pkcs7.h:284
   pragma Import (C, d2i_PKCS7_fp, "d2i_PKCS7_fp");

   function i2d_PKCS7_fp (fp : access Interfaces.C_Streams.FILEs; p7 : access PKCS7) return int;  -- openssl/pkcs7.h:285
   pragma Import (C, i2d_PKCS7_fp, "i2d_PKCS7_fp");

   function PKCS7_dup (p7 : access PKCS7) return access PKCS7;  -- openssl/pkcs7.h:287
   pragma Import (C, PKCS7_dup, "PKCS7_dup");

   function d2i_PKCS7_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; p7 : System.Address) return access PKCS7;  -- openssl/pkcs7.h:288
   pragma Import (C, d2i_PKCS7_bio, "d2i_PKCS7_bio");

   function i2d_PKCS7_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; p7 : access PKCS7) return int;  -- openssl/pkcs7.h:289
   pragma Import (C, i2d_PKCS7_bio, "i2d_PKCS7_bio");

   function i2d_PKCS7_bio_stream
     (c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      p7    : access PKCS7;
      c_in  : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : int) return int;  -- openssl/pkcs7.h:290
   pragma Import (C, i2d_PKCS7_bio_stream, "i2d_PKCS7_bio_stream");

   function PEM_write_bio_PKCS7_stream
     (c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      p7    : access PKCS7;
      c_in  : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : int) return int;  -- openssl/pkcs7.h:291
   pragma Import (C, PEM_write_bio_PKCS7_stream, "PEM_write_bio_PKCS7_stream");

   PKCS7_SIGNER_INFO_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs7.h:293
   pragma Import (C, PKCS7_SIGNER_INFO_it, "PKCS7_SIGNER_INFO_it");

   function i2d_PKCS7_SIGNER_INFO (a : access PKCS7_SIGNER_INFO; c_out : System.Address) return int;  -- openssl/pkcs7.h:293
   pragma Import (C, i2d_PKCS7_SIGNER_INFO, "i2d_PKCS7_SIGNER_INFO");

   function d2i_PKCS7_SIGNER_INFO
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PKCS7_SIGNER_INFO;  -- openssl/pkcs7.h:293
   pragma Import (C, d2i_PKCS7_SIGNER_INFO, "d2i_PKCS7_SIGNER_INFO");

   procedure PKCS7_SIGNER_INFO_free (a : access PKCS7_SIGNER_INFO);  -- openssl/pkcs7.h:293
   pragma Import (C, PKCS7_SIGNER_INFO_free, "PKCS7_SIGNER_INFO_free");

   function PKCS7_SIGNER_INFO_new return access PKCS7_SIGNER_INFO;  -- openssl/pkcs7.h:293
   pragma Import (C, PKCS7_SIGNER_INFO_new, "PKCS7_SIGNER_INFO_new");

   PKCS7_RECIP_INFO_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs7.h:294
   pragma Import (C, PKCS7_RECIP_INFO_it, "PKCS7_RECIP_INFO_it");

   function i2d_PKCS7_RECIP_INFO (a : access PKCS7_RECIP_INFO; c_out : System.Address) return int;  -- openssl/pkcs7.h:294
   pragma Import (C, i2d_PKCS7_RECIP_INFO, "i2d_PKCS7_RECIP_INFO");

   function d2i_PKCS7_RECIP_INFO
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PKCS7_RECIP_INFO;  -- openssl/pkcs7.h:294
   pragma Import (C, d2i_PKCS7_RECIP_INFO, "d2i_PKCS7_RECIP_INFO");

   procedure PKCS7_RECIP_INFO_free (a : access PKCS7_RECIP_INFO);  -- openssl/pkcs7.h:294
   pragma Import (C, PKCS7_RECIP_INFO_free, "PKCS7_RECIP_INFO_free");

   function PKCS7_RECIP_INFO_new return access PKCS7_RECIP_INFO;  -- openssl/pkcs7.h:294
   pragma Import (C, PKCS7_RECIP_INFO_new, "PKCS7_RECIP_INFO_new");

   PKCS7_SIGNED_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs7.h:295
   pragma Import (C, PKCS7_SIGNED_it, "PKCS7_SIGNED_it");

   function i2d_PKCS7_SIGNED (a : access PKCS7_SIGNED; c_out : System.Address) return int;  -- openssl/pkcs7.h:295
   pragma Import (C, i2d_PKCS7_SIGNED, "i2d_PKCS7_SIGNED");

   function d2i_PKCS7_SIGNED
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PKCS7_SIGNED;  -- openssl/pkcs7.h:295
   pragma Import (C, d2i_PKCS7_SIGNED, "d2i_PKCS7_SIGNED");

   procedure PKCS7_SIGNED_free (a : access PKCS7_SIGNED);  -- openssl/pkcs7.h:295
   pragma Import (C, PKCS7_SIGNED_free, "PKCS7_SIGNED_free");

   function PKCS7_SIGNED_new return access PKCS7_SIGNED;  -- openssl/pkcs7.h:295
   pragma Import (C, PKCS7_SIGNED_new, "PKCS7_SIGNED_new");

   PKCS7_ENC_CONTENT_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs7.h:296
   pragma Import (C, PKCS7_ENC_CONTENT_it, "PKCS7_ENC_CONTENT_it");

   function i2d_PKCS7_ENC_CONTENT (a : access PKCS7_ENC_CONTENT; c_out : System.Address) return int;  -- openssl/pkcs7.h:296
   pragma Import (C, i2d_PKCS7_ENC_CONTENT, "i2d_PKCS7_ENC_CONTENT");

   function d2i_PKCS7_ENC_CONTENT
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PKCS7_ENC_CONTENT;  -- openssl/pkcs7.h:296
   pragma Import (C, d2i_PKCS7_ENC_CONTENT, "d2i_PKCS7_ENC_CONTENT");

   procedure PKCS7_ENC_CONTENT_free (a : access PKCS7_ENC_CONTENT);  -- openssl/pkcs7.h:296
   pragma Import (C, PKCS7_ENC_CONTENT_free, "PKCS7_ENC_CONTENT_free");

   function PKCS7_ENC_CONTENT_new return access PKCS7_ENC_CONTENT;  -- openssl/pkcs7.h:296
   pragma Import (C, PKCS7_ENC_CONTENT_new, "PKCS7_ENC_CONTENT_new");

   PKCS7_ENVELOPE_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs7.h:297
   pragma Import (C, PKCS7_ENVELOPE_it, "PKCS7_ENVELOPE_it");

   function i2d_PKCS7_ENVELOPE (a : access PKCS7_ENVELOPE; c_out : System.Address) return int;  -- openssl/pkcs7.h:297
   pragma Import (C, i2d_PKCS7_ENVELOPE, "i2d_PKCS7_ENVELOPE");

   function d2i_PKCS7_ENVELOPE
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PKCS7_ENVELOPE;  -- openssl/pkcs7.h:297
   pragma Import (C, d2i_PKCS7_ENVELOPE, "d2i_PKCS7_ENVELOPE");

   procedure PKCS7_ENVELOPE_free (a : access PKCS7_ENVELOPE);  -- openssl/pkcs7.h:297
   pragma Import (C, PKCS7_ENVELOPE_free, "PKCS7_ENVELOPE_free");

   function PKCS7_ENVELOPE_new return access PKCS7_ENVELOPE;  -- openssl/pkcs7.h:297
   pragma Import (C, PKCS7_ENVELOPE_new, "PKCS7_ENVELOPE_new");

   PKCS7_SIGN_ENVELOPE_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs7.h:298
   pragma Import (C, PKCS7_SIGN_ENVELOPE_it, "PKCS7_SIGN_ENVELOPE_it");

   function i2d_PKCS7_SIGN_ENVELOPE (a : access PKCS7_SIGN_ENVELOPE; c_out : System.Address) return int;  -- openssl/pkcs7.h:298
   pragma Import (C, i2d_PKCS7_SIGN_ENVELOPE, "i2d_PKCS7_SIGN_ENVELOPE");

   function d2i_PKCS7_SIGN_ENVELOPE
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PKCS7_SIGN_ENVELOPE;  -- openssl/pkcs7.h:298
   pragma Import (C, d2i_PKCS7_SIGN_ENVELOPE, "d2i_PKCS7_SIGN_ENVELOPE");

   procedure PKCS7_SIGN_ENVELOPE_free (a : access PKCS7_SIGN_ENVELOPE);  -- openssl/pkcs7.h:298
   pragma Import (C, PKCS7_SIGN_ENVELOPE_free, "PKCS7_SIGN_ENVELOPE_free");

   function PKCS7_SIGN_ENVELOPE_new return access PKCS7_SIGN_ENVELOPE;  -- openssl/pkcs7.h:298
   pragma Import (C, PKCS7_SIGN_ENVELOPE_new, "PKCS7_SIGN_ENVELOPE_new");

   PKCS7_DIGEST_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs7.h:299
   pragma Import (C, PKCS7_DIGEST_it, "PKCS7_DIGEST_it");

   function i2d_PKCS7_DIGEST (a : access PKCS7_DIGEST; c_out : System.Address) return int;  -- openssl/pkcs7.h:299
   pragma Import (C, i2d_PKCS7_DIGEST, "i2d_PKCS7_DIGEST");

   function d2i_PKCS7_DIGEST
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PKCS7_DIGEST;  -- openssl/pkcs7.h:299
   pragma Import (C, d2i_PKCS7_DIGEST, "d2i_PKCS7_DIGEST");

   procedure PKCS7_DIGEST_free (a : access PKCS7_DIGEST);  -- openssl/pkcs7.h:299
   pragma Import (C, PKCS7_DIGEST_free, "PKCS7_DIGEST_free");

   function PKCS7_DIGEST_new return access PKCS7_DIGEST;  -- openssl/pkcs7.h:299
   pragma Import (C, PKCS7_DIGEST_new, "PKCS7_DIGEST_new");

   PKCS7_ENCRYPT_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs7.h:300
   pragma Import (C, PKCS7_ENCRYPT_it, "PKCS7_ENCRYPT_it");

   function i2d_PKCS7_ENCRYPT (a : access PKCS7_ENCRYPT; c_out : System.Address) return int;  -- openssl/pkcs7.h:300
   pragma Import (C, i2d_PKCS7_ENCRYPT, "i2d_PKCS7_ENCRYPT");

   function d2i_PKCS7_ENCRYPT
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PKCS7_ENCRYPT;  -- openssl/pkcs7.h:300
   pragma Import (C, d2i_PKCS7_ENCRYPT, "d2i_PKCS7_ENCRYPT");

   procedure PKCS7_ENCRYPT_free (a : access PKCS7_ENCRYPT);  -- openssl/pkcs7.h:300
   pragma Import (C, PKCS7_ENCRYPT_free, "PKCS7_ENCRYPT_free");

   function PKCS7_ENCRYPT_new return access PKCS7_ENCRYPT;  -- openssl/pkcs7.h:300
   pragma Import (C, PKCS7_ENCRYPT_new, "PKCS7_ENCRYPT_new");

   PKCS7_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs7.h:301
   pragma Import (C, PKCS7_it, "PKCS7_it");

   function i2d_PKCS7 (a : access PKCS7; c_out : System.Address) return int;  -- openssl/pkcs7.h:301
   pragma Import (C, i2d_PKCS7, "i2d_PKCS7");

   function d2i_PKCS7
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PKCS7;  -- openssl/pkcs7.h:301
   pragma Import (C, d2i_PKCS7, "d2i_PKCS7");

   procedure PKCS7_free (a : access PKCS7);  -- openssl/pkcs7.h:301
   pragma Import (C, PKCS7_free, "PKCS7_free");

   function PKCS7_new return access PKCS7;  -- openssl/pkcs7.h:301
   pragma Import (C, PKCS7_new, "PKCS7_new");

   PKCS7_ATTR_SIGN_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs7.h:303
   pragma Import (C, PKCS7_ATTR_SIGN_it, "PKCS7_ATTR_SIGN_it");

   PKCS7_ATTR_VERIFY_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/pkcs7.h:304
   pragma Import (C, PKCS7_ATTR_VERIFY_it, "PKCS7_ATTR_VERIFY_it");

   function i2d_PKCS7_NDEF (a : access PKCS7; c_out : System.Address) return int;  -- openssl/pkcs7.h:306
   pragma Import (C, i2d_PKCS7_NDEF, "i2d_PKCS7_NDEF");

   function PKCS7_print_ctx
     (c_out  : access OpenSSL.Low_Level.bio_h.bio_st;
      x      : access PKCS7;
      indent : int;
      pctx   : System.Address) return int;  -- openssl/pkcs7.h:307
   pragma Import (C, PKCS7_print_ctx, "PKCS7_print_ctx");

   function PKCS7_ctrl
     (p7   : access PKCS7;
      cmd  : int;
      larg : long;
      parg : Interfaces.C.Strings.chars_ptr) return long;  -- openssl/pkcs7.h:309
   pragma Import (C, PKCS7_ctrl, "PKCS7_ctrl");

   function PKCS7_set_type (p7 : access PKCS7; c_type : int) return int;  -- openssl/pkcs7.h:311
   pragma Import (C, PKCS7_set_type, "PKCS7_set_type");

   function PKCS7_set0_type_other
     (p7     : access PKCS7;
      c_type : int;
      other  : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE) return int;  -- openssl/pkcs7.h:312
   pragma Import (C, PKCS7_set0_type_other, "PKCS7_set0_type_other");

   function PKCS7_set_content (p7 : access PKCS7; p7_data : access PKCS7) return int;  -- openssl/pkcs7.h:313
   pragma Import (C, PKCS7_set_content, "PKCS7_set_content");

   function PKCS7_SIGNER_INFO_set
     (p7i      : access PKCS7_SIGNER_INFO;
      the_x509 : access OpenSSL.Low_Level.x509_h.x509_st;
      pkey     : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      dgst     : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/pkcs7.h:314
   pragma Import (C, PKCS7_SIGNER_INFO_set, "PKCS7_SIGNER_INFO_set");

   function PKCS7_SIGNER_INFO_sign (si : access PKCS7_SIGNER_INFO) return int;  -- openssl/pkcs7.h:316
   pragma Import (C, PKCS7_SIGNER_INFO_sign, "PKCS7_SIGNER_INFO_sign");

   function PKCS7_add_signer (p7 : access PKCS7; p7i : access PKCS7_SIGNER_INFO) return int;  -- openssl/pkcs7.h:317
   pragma Import (C, PKCS7_add_signer, "PKCS7_add_signer");

   function PKCS7_add_certificate (p7 : access PKCS7; the_x509 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/pkcs7.h:318
   pragma Import (C, PKCS7_add_certificate, "PKCS7_add_certificate");

   function PKCS7_add_crl (p7 : access PKCS7; x509 : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/pkcs7.h:319
   pragma Import (C, PKCS7_add_crl, "PKCS7_add_crl");

   function PKCS7_content_new (p7 : access PKCS7; nid : int) return int;  -- openssl/pkcs7.h:320
   pragma Import (C, PKCS7_content_new, "PKCS7_content_new");

   function PKCS7_dataVerify
     (cert_store : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;
      ctx        : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st_CTX.x509_store_st;
      the_bio    : access OpenSSL.Low_Level.bio_h.bio_st;
      p7         : access PKCS7;
      si         : access PKCS7_SIGNER_INFO) return int;  -- openssl/pkcs7.h:321
   pragma Import (C, PKCS7_dataVerify, "PKCS7_dataVerify");

   function PKCS7_signatureVerify
     (the_bio  : access OpenSSL.Low_Level.bio_h.bio_st;
      p7       : access PKCS7;
      si       : access PKCS7_SIGNER_INFO;
      the_x509 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/pkcs7.h:323
   pragma Import (C, PKCS7_signatureVerify, "PKCS7_signatureVerify");

   function PKCS7_dataInit (p7 : access PKCS7; the_bio : access OpenSSL.Low_Level.bio_h.bio_st) return access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/pkcs7.h:326
   pragma Import (C, PKCS7_dataInit, "PKCS7_dataInit");

   function PKCS7_dataFinal (p7 : access PKCS7; the_bio : access OpenSSL.Low_Level.bio_h.bio_st) return int;  -- openssl/pkcs7.h:327
   pragma Import (C, PKCS7_dataFinal, "PKCS7_dataFinal");

   function PKCS7_dataDecode
     (p7     : access PKCS7;
      pkey   : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      in_bio : access OpenSSL.Low_Level.bio_h.bio_st;
      pcert  : access OpenSSL.Low_Level.x509_h.x509_st) return access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/pkcs7.h:328
   pragma Import (C, PKCS7_dataDecode, "PKCS7_dataDecode");

   function PKCS7_add_signature
     (p7       : access PKCS7;
      the_x509 : access OpenSSL.Low_Level.x509_h.x509_st;
      pkey     : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      dgst     : access constant OpenSSL.Low_Level.evp_h.env_md_st) return access PKCS7_SIGNER_INFO;  -- openssl/pkcs7.h:331
   pragma Import (C, PKCS7_add_signature, "PKCS7_add_signature");

   function PKCS7_cert_from_signer_info (p7 : access PKCS7; si : access PKCS7_SIGNER_INFO) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/pkcs7.h:333
   pragma Import (C, PKCS7_cert_from_signer_info, "PKCS7_cert_from_signer_info");

   function PKCS7_set_digest (p7 : access PKCS7; md : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/pkcs7.h:334
   pragma Import (C, PKCS7_set_digest, "PKCS7_set_digest");

   function PKCS7_get_signer_info (p7 : access PKCS7) return access stack_st_PKCS7_SIGNER_INFO;  -- openssl/pkcs7.h:335
   pragma Import (C, PKCS7_get_signer_info, "PKCS7_get_signer_info");

   function PKCS7_add_recipient (p7 : access PKCS7; the_x509 : access OpenSSL.Low_Level.x509_h.x509_st) return access PKCS7_RECIP_INFO;  -- openssl/pkcs7.h:337
   pragma Import (C, PKCS7_add_recipient, "PKCS7_add_recipient");

   procedure PKCS7_SIGNER_INFO_get0_algs
     (si   : access PKCS7_SIGNER_INFO;
      pk   : System.Address;
      pdig : System.Address;
      psig : System.Address);  -- openssl/pkcs7.h:338
   pragma Import (C, PKCS7_SIGNER_INFO_get0_algs, "PKCS7_SIGNER_INFO_get0_algs");

   procedure PKCS7_RECIP_INFO_get0_alg (ri : access PKCS7_RECIP_INFO; penc : System.Address);  -- openssl/pkcs7.h:340
   pragma Import (C, PKCS7_RECIP_INFO_get0_alg, "PKCS7_RECIP_INFO_get0_alg");

   function PKCS7_add_recipient_info (p7 : access PKCS7; ri : access PKCS7_RECIP_INFO) return int;  -- openssl/pkcs7.h:341
   pragma Import (C, PKCS7_add_recipient_info, "PKCS7_add_recipient_info");

   function PKCS7_RECIP_INFO_set (p7i : access PKCS7_RECIP_INFO; the_x509 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/pkcs7.h:342
   pragma Import (C, PKCS7_RECIP_INFO_set, "PKCS7_RECIP_INFO_set");

   function PKCS7_set_cipher (p7 : access PKCS7; cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st) return int;  -- openssl/pkcs7.h:343
   pragma Import (C, PKCS7_set_cipher, "PKCS7_set_cipher");

   function PKCS7_stream (boundary : System.Address; p7 : access PKCS7) return int;  -- openssl/pkcs7.h:344
   pragma Import (C, PKCS7_stream, "PKCS7_stream");

   function PKCS7_get_issuer_and_serial (p7 : access PKCS7; idx : int) return access PKCS7_ISSUER_AND_SERIAL;  -- openssl/pkcs7.h:346
   pragma Import (C, PKCS7_get_issuer_and_serial, "PKCS7_get_issuer_and_serial");

   function PKCS7_digest_from_attributes (sk : access OpenSSL.Low_Level.x509_h.stack_st_X509_ATTRIBUTE) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/pkcs7.h:347
   pragma Import (C, PKCS7_digest_from_attributes, "PKCS7_digest_from_attributes");

   function PKCS7_add_signed_attribute
     (p7si   : access PKCS7_SIGNER_INFO;
      nid    : int;
      c_type : int;
      data   : System.Address) return int;  -- openssl/pkcs7.h:348
   pragma Import (C, PKCS7_add_signed_attribute, "PKCS7_add_signed_attribute");

   function PKCS7_add_attribute
     (p7si    : access PKCS7_SIGNER_INFO;
      nid     : int;
      atrtype : int;
      value   : System.Address) return int;  -- openssl/pkcs7.h:350
   pragma Import (C, PKCS7_add_attribute, "PKCS7_add_attribute");

   function PKCS7_get_attribute (si : access PKCS7_SIGNER_INFO; nid : int) return access OpenSSL.Low_Level.asn1_h.ASN1_TYPE;  -- openssl/pkcs7.h:352
   pragma Import (C, PKCS7_get_attribute, "PKCS7_get_attribute");

   function PKCS7_get_signed_attribute (si : access PKCS7_SIGNER_INFO; nid : int) return access OpenSSL.Low_Level.asn1_h.ASN1_TYPE;  -- openssl/pkcs7.h:353
   pragma Import (C, PKCS7_get_signed_attribute, "PKCS7_get_signed_attribute");

   function PKCS7_set_signed_attributes (p7si : access PKCS7_SIGNER_INFO; sk : access OpenSSL.Low_Level.x509_h.stack_st_X509_ATTRIBUTE) return int;  -- openssl/pkcs7.h:354
   pragma Import (C, PKCS7_set_signed_attributes, "PKCS7_set_signed_attributes");

   function PKCS7_set_attributes (p7si : access PKCS7_SIGNER_INFO; sk : access OpenSSL.Low_Level.x509_h.stack_st_X509_ATTRIBUTE) return int;  -- openssl/pkcs7.h:356
   pragma Import (C, PKCS7_set_attributes, "PKCS7_set_attributes");

   function PKCS7_sign
     (signcert : access OpenSSL.Low_Level.x509_h.x509_st;
      pkey     : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      certs    : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      data     : access OpenSSL.Low_Level.bio_h.bio_st;
      flags    : int) return access PKCS7;  -- openssl/pkcs7.h:359
   pragma Import (C, PKCS7_sign, "PKCS7_sign");

   function PKCS7_sign_add_signer
     (p7       : access PKCS7;
      signcert : access OpenSSL.Low_Level.x509_h.x509_st;
      pkey     : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      md       : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      flags    : int) return access PKCS7_SIGNER_INFO;  -- openssl/pkcs7.h:362
   pragma Import (C, PKCS7_sign_add_signer, "PKCS7_sign_add_signer");

   function PKCS7_final
     (p7    : access PKCS7;
      data  : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : int) return int;  -- openssl/pkcs7.h:366
   pragma Import (C, PKCS7_final, "PKCS7_final");

   function PKCS7_verify
     (p7     : access PKCS7;
      certs  : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      store  : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;
      indata : access OpenSSL.Low_Level.bio_h.bio_st;
      c_out  : access OpenSSL.Low_Level.bio_h.bio_st;
      flags  : int) return int;  -- openssl/pkcs7.h:367
   pragma Import (C, PKCS7_verify, "PKCS7_verify");

   function PKCS7_get0_signers
     (p7    : access PKCS7;
      certs : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      flags : int) return access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/pkcs7.h:369
   pragma Import (C, PKCS7_get0_signers, "PKCS7_get0_signers");

   function PKCS7_encrypt
     (certs  : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      c_in   : access OpenSSL.Low_Level.bio_h.bio_st;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      flags  : int) return access PKCS7;  -- openssl/pkcs7.h:370
   pragma Import (C, PKCS7_encrypt, "PKCS7_encrypt");

   function PKCS7_decrypt
     (p7    : access PKCS7;
      pkey  : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      cert  : access OpenSSL.Low_Level.x509_h.x509_st;
      data  : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : int) return int;  -- openssl/pkcs7.h:372
   pragma Import (C, PKCS7_decrypt, "PKCS7_decrypt");

   function PKCS7_add_attrib_smimecap (si : access PKCS7_SIGNER_INFO; cap : access OpenSSL.Low_Level.asn1_h.stack_st_X509_ALGOR) return int;  -- openssl/pkcs7.h:374
   pragma Import (C, PKCS7_add_attrib_smimecap, "PKCS7_add_attrib_smimecap");

   function PKCS7_get_smimecap (si : access PKCS7_SIGNER_INFO) return access OpenSSL.Low_Level.asn1_h.stack_st_X509_ALGOR;  -- openssl/pkcs7.h:376
   pragma Import (C, PKCS7_get_smimecap, "PKCS7_get_smimecap");

   function PKCS7_simple_smimecap
     (sk  : access OpenSSL.Low_Level.asn1_h.stack_st_X509_ALGOR;
      nid : int;
      arg : int) return int;  -- openssl/pkcs7.h:377
   pragma Import (C, PKCS7_simple_smimecap, "PKCS7_simple_smimecap");

   function PKCS7_add_attrib_content_type (si : access PKCS7_SIGNER_INFO; coid : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT) return int;  -- openssl/pkcs7.h:379
   pragma Import (C, PKCS7_add_attrib_content_type, "PKCS7_add_attrib_content_type");

   function PKCS7_add0_attrib_signing_time (si : access PKCS7_SIGNER_INFO; t : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/pkcs7.h:380
   pragma Import (C, PKCS7_add0_attrib_signing_time, "PKCS7_add0_attrib_signing_time");

   function PKCS7_add1_attrib_digest
     (si    : access PKCS7_SIGNER_INFO;
      md    : access unsigned_char;
      mdlen : int) return int;  -- openssl/pkcs7.h:381
   pragma Import (C, PKCS7_add1_attrib_digest, "PKCS7_add1_attrib_digest");

   function SMIME_write_PKCS7
     (the_bio : access OpenSSL.Low_Level.bio_h.bio_st;
      p7      : access PKCS7;
      data    : access OpenSSL.Low_Level.bio_h.bio_st;
      flags   : int) return int;  -- openssl/pkcs7.h:384
   pragma Import (C, SMIME_write_PKCS7, "SMIME_write_PKCS7");

   function SMIME_read_PKCS7 (the_bio : access OpenSSL.Low_Level.bio_h.bio_st; bcont : System.Address) return access PKCS7;  -- openssl/pkcs7.h:385
   pragma Import (C, SMIME_read_PKCS7, "SMIME_read_PKCS7");

   function BIO_new_PKCS7 (c_out : access OpenSSL.Low_Level.bio_h.bio_st; p7 : access PKCS7) return access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/pkcs7.h:387
   pragma Import (C, BIO_new_PKCS7, "BIO_new_PKCS7");

   procedure ERR_load_PKCS7_strings;  -- openssl/pkcs7.h:394
   pragma Import (C, ERR_load_PKCS7_strings, "ERR_load_PKCS7_strings");

end OpenSSL.Low_Level.pkcs7_h;
