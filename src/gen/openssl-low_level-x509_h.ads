with Interfaces.C.Strings;
with Interfaces.C; use Interfaces.C;
with Interfaces.C_Streams;
with OpenSSL.Low_Level.asn1_h;
with OpenSSL.Low_Level.bio_h;
limited with OpenSSL.Low_Level.cms_h;
with OpenSSL.Low_Level.crypto_h;
with OpenSSL.Low_Level.evp_h;
with OpenSSL.Low_Level.rsa_h;
with OpenSSL.Low_Level.stack_h;
with OpenSSL.Low_Level.x509v3_h;
with OpenSSL.Low_Level.x509_vfy_h;
with OpenSSL.Low_Level.dsa_h;
with System;

package OpenSSL.Low_Level.x509_h is

   package defs is

      X509_FILETYPE_PEM     : constant := 1;  --  openssl/x509.h:113
      X509_FILETYPE_ASN1    : constant := 2;  --  openssl/x509.h:114
      X509_FILETYPE_DEFAULT : constant := 3;  --  openssl/x509.h:115

      X509v3_KU_DIGITAL_SIGNATURE : constant := 16#0080#;  --  openssl/x509.h:117
      X509v3_KU_NON_REPUDIATION : constant := 16#0040#;  --  openssl/x509.h:118
      X509v3_KU_KEY_ENCIPHERMENT : constant := 16#0020#;  --  openssl/x509.h:119
      X509v3_KU_DATA_ENCIPHERMENT : constant := 16#0010#;  --  openssl/x509.h:120
      X509v3_KU_KEY_AGREEMENT : constant := 16#0008#;  --  openssl/x509.h:121
      X509v3_KU_KEY_CERT_SIGN : constant := 16#0004#;  --  openssl/x509.h:122
      X509v3_KU_CRL_SIGN    : constant := 16#0002#;  --  openssl/x509.h:123
      X509v3_KU_ENCIPHER_ONLY : constant := 16#0001#;  --  openssl/x509.h:124
      X509v3_KU_DECIPHER_ONLY : constant := 16#8000#;  --  openssl/x509.h:125
      X509v3_KU_UNDEF       : constant := 16#ffff#;  --  openssl/x509.h:126

      X509_EX_V_NETSCAPE_HACK : constant := 16#8000#;  --  openssl/x509.h:192
      X509_EX_V_INIT        : constant := 16#0001#;  --  openssl/x509.h:193

      X509_TRUST_DEFAULT    : constant := -1;  --  openssl/x509.h:325

      X509_TRUST_COMPAT     : constant := 1;  --  openssl/x509.h:327
      X509_TRUST_SSL_CLIENT : constant := 2;  --  openssl/x509.h:328
      X509_TRUST_SSL_SERVER : constant := 3;  --  openssl/x509.h:329
      X509_TRUST_EMAIL      : constant := 4;  --  openssl/x509.h:330
      X509_TRUST_OBJECT_SIGN : constant := 5;  --  openssl/x509.h:331
      X509_TRUST_OCSP_SIGN  : constant := 6;  --  openssl/x509.h:332
      X509_TRUST_OCSP_REQUEST : constant := 7;  --  openssl/x509.h:333
      X509_TRUST_TSA        : constant := 8;  --  openssl/x509.h:334

      X509_TRUST_MIN        : constant := 1;  --  openssl/x509.h:337
      X509_TRUST_MAX        : constant := 8;  --  openssl/x509.h:338

      X509_TRUST_DYNAMIC    : constant := 1;  --  openssl/x509.h:342
      X509_TRUST_DYNAMIC_NAME : constant := 2;  --  openssl/x509.h:343

      X509_TRUST_TRUSTED    : constant := 1;  --  openssl/x509.h:347
      X509_TRUST_REJECTED   : constant := 2;  --  openssl/x509.h:348
      X509_TRUST_UNTRUSTED  : constant := 3;  --  openssl/x509.h:349

      X509_FLAG_COMPAT      : constant := 0;  --  openssl/x509.h:353
      X509_FLAG_NO_HEADER   : constant := 1;  --  openssl/x509.h:354
      X509_FLAG_NO_VERSION  : constant := (2 ** 1);  --  openssl/x509.h:355
      X509_FLAG_NO_SERIAL   : constant := (2 ** 2);  --  openssl/x509.h:356
      X509_FLAG_NO_SIGNAME  : constant := (2 ** 3);  --  openssl/x509.h:357
      X509_FLAG_NO_ISSUER   : constant := (2 ** 4);  --  openssl/x509.h:358
      X509_FLAG_NO_VALIDITY : constant := (2 ** 5);  --  openssl/x509.h:359
      X509_FLAG_NO_SUBJECT  : constant := (2 ** 6);  --  openssl/x509.h:360
      X509_FLAG_NO_PUBKEY   : constant := (2 ** 7);  --  openssl/x509.h:361
      X509_FLAG_NO_EXTENSIONS : constant := (2 ** 8);  --  openssl/x509.h:362
      X509_FLAG_NO_SIGDUMP  : constant := (2 ** 9);  --  openssl/x509.h:363
      X509_FLAG_NO_AUX      : constant := (2 ** 10);  --  openssl/x509.h:364
      X509_FLAG_NO_ATTRIBUTES : constant := (2 ** 11);  --  openssl/x509.h:365
      --  unsupported macro: XN_FLAG_SEP_MASK (0xf << 16)

      XN_FLAG_COMPAT        : constant := 0;  --  openssl/x509.h:373
      XN_FLAG_SEP_COMMA_PLUS : constant := (2 ** 16);  --  openssl/x509.h:374
      --  unsupported macro: XN_FLAG_SEP_CPLUS_SPC (2 << 16)
      --  unsupported macro: XN_FLAG_SEP_SPLUS_SPC (3 << 16)
      --  unsupported macro: XN_FLAG_SEP_MULTILINE (4 << 16)

      XN_FLAG_DN_REV        : constant := (2 ** 20);  --  openssl/x509.h:379
      --  unsupported macro: XN_FLAG_FN_MASK (0x3 << 21)

      XN_FLAG_FN_SN         : constant := 0;  --  openssl/x509.h:385
      XN_FLAG_FN_LN         : constant := (2 ** 21);  --  openssl/x509.h:386
      --  unsupported macro: XN_FLAG_FN_OID (2 << 21)
      --  unsupported macro: XN_FLAG_FN_NONE (3 << 21)

      XN_FLAG_SPC_EQ        : constant := (2 ** 23);  --  openssl/x509.h:390

      XN_FLAG_DUMP_UNKNOWN_FIELDS : constant := (2 ** 24);  --  openssl/x509.h:396

      XN_FLAG_FN_ALIGN      : constant := (2 ** 25);  --  openssl/x509.h:398
      --  unsupported macro: XN_FLAG_RFC2253 (ASN1_STRFLGS_RFC2253 | XN_FLAG_SEP_COMMA_PLUS | XN_FLAG_DN_REV | XN_FLAG_FN_SN | XN_FLAG_DUMP_UNKNOWN_FIELDS)
      --  unsupported macro: XN_FLAG_ONELINE (ASN1_STRFLGS_RFC2253 | ASN1_STRFLGS_ESC_QUOTE | XN_FLAG_SEP_CPLUS_SPC | XN_FLAG_SPC_EQ | XN_FLAG_FN_SN)
      --  unsupported macro: XN_FLAG_MULTILINE (ASN1_STRFLGS_ESC_CTRL | ASN1_STRFLGS_ESC_MSB | XN_FLAG_SEP_MULTILINE | XN_FLAG_SPC_EQ | XN_FLAG_FN_LN | XN_FLAG_FN_ALIGN)

      PKCS8_OK              : constant := 0;  --  openssl/x509.h:576
      PKCS8_NO_OCTET        : constant := 1;  --  openssl/x509.h:577
      PKCS8_EMBEDDED_PARAM  : constant := 2;  --  openssl/x509.h:578
      PKCS8_NS_DB           : constant := 3;  --  openssl/x509.h:579
      PKCS8_NEG_PRIVKEY     : constant := 4;  --  openssl/x509.h:580

      X509_EXT_PACK_UNKNOWN : constant := 1;  --  openssl/x509.h:598
      X509_EXT_PACK_STRING  : constant := 2;  --  openssl/x509.h:599
      --  arg-macro: procedure X509_get_version (x)
      --    ASN1_INTEGER_get((x).cert_info.version)
      --  arg-macro: function X509_get_notBefore (x)
      --    return (x).cert_info.validity.notBefore;
      --  arg-macro: function X509_get_notAfter (x)
      --    return (x).cert_info.validity.notAfter;
      --  arg-macro: procedure X509_extract_key (x)
      --    X509_get_pubkey(x)
      --  arg-macro: procedure X509_REQ_get_version (x)
      --    ASN1_INTEGER_get((x).req_info.version)
      --  arg-macro: function X509_REQ_get_subject_name (x)
      --    return (x).req_info.subject;
      --  arg-macro: procedure X509_REQ_extract_key (a)
      --    X509_REQ_get_pubkey(a)
      --  arg-macro: procedure X509_name_cmp (a, b)
      --    X509_NAME_cmp((a),(b))
      --  arg-macro: procedure X509_get_signature_type (x)
      --    EVP_PKEY_type(OBJ_obj2nid((x).sig_alg.algorithm))
      --  arg-macro: procedure X509_CRL_get_version (x)
      --    ASN1_INTEGER_get((x).crl.version)
      --  arg-macro: function X509_CRL_get_lastUpdate (x)
      --    return (x).crl.lastUpdate;
      --  arg-macro: function X509_CRL_get_nextUpdate (x)
      --    return (x).crl.nextUpdate;
      --  arg-macro: function X509_CRL_get_issuer (x)
      --    return (x).crl.issuer;
      --  arg-macro: function X509_CRL_get_REVOKED (x)
      --    return (x).crl.revoked;
      --  arg-macro: function X509_get_X509_PUBKEY (x)
      --    return (x).cert_info.key;

      X509_F_ADD_CERT_DIR   : constant := 100;  --  openssl/x509.h:1183
      X509_F_BY_FILE_CTRL   : constant := 101;  --  openssl/x509.h:1184
      X509_F_CHECK_POLICY   : constant := 145;  --  openssl/x509.h:1185
      X509_F_DIR_CTRL       : constant := 102;  --  openssl/x509.h:1186
      X509_F_GET_CERT_BY_SUBJECT : constant := 103;  --  openssl/x509.h:1187
      X509_F_NETSCAPE_SPKI_B64_DECODE : constant := 129;  --  openssl/x509.h:1188
      X509_F_NETSCAPE_SPKI_B64_ENCODE : constant := 130;  --  openssl/x509.h:1189
      X509_F_X509AT_ADD1_ATTR : constant := 135;  --  openssl/x509.h:1190
      X509_F_X509V3_ADD_EXT : constant := 104;  --  openssl/x509.h:1191
      X509_F_X509_ATTRIBUTE_CREATE_BY_NID : constant := 136;  --  openssl/x509.h:1192
      X509_F_X509_ATTRIBUTE_CREATE_BY_OBJ : constant := 137;  --  openssl/x509.h:1193
      X509_F_X509_ATTRIBUTE_CREATE_BY_TXT : constant := 140;  --  openssl/x509.h:1194
      X509_F_X509_ATTRIBUTE_GET0_DATA : constant := 139;  --  openssl/x509.h:1195
      X509_F_X509_ATTRIBUTE_SET1_DATA : constant := 138;  --  openssl/x509.h:1196
      X509_F_X509_CHECK_PRIVATE_KEY : constant := 128;  --  openssl/x509.h:1197
      X509_F_X509_CRL_PRINT_FP : constant := 147;  --  openssl/x509.h:1198
      X509_F_X509_EXTENSION_CREATE_BY_NID : constant := 108;  --  openssl/x509.h:1199
      X509_F_X509_EXTENSION_CREATE_BY_OBJ : constant := 109;  --  openssl/x509.h:1200
      X509_F_X509_GET_PUBKEY_PARAMETERS : constant := 110;  --  openssl/x509.h:1201
      X509_F_X509_LOAD_CERT_CRL_FILE : constant := 132;  --  openssl/x509.h:1202
      X509_F_X509_LOAD_CERT_FILE : constant := 111;  --  openssl/x509.h:1203
      X509_F_X509_LOAD_CRL_FILE : constant := 112;  --  openssl/x509.h:1204
      X509_F_X509_NAME_ADD_ENTRY : constant := 113;  --  openssl/x509.h:1205
      X509_F_X509_NAME_ENTRY_CREATE_BY_NID : constant := 114;  --  openssl/x509.h:1206
      X509_F_X509_NAME_ENTRY_CREATE_BY_TXT : constant := 131;  --  openssl/x509.h:1207
      X509_F_X509_NAME_ENTRY_SET_OBJECT : constant := 115;  --  openssl/x509.h:1208
      X509_F_X509_NAME_ONELINE : constant := 116;  --  openssl/x509.h:1209
      X509_F_X509_NAME_PRINT : constant := 117;  --  openssl/x509.h:1210
      X509_F_X509_PRINT_EX_FP : constant := 118;  --  openssl/x509.h:1211
      X509_F_X509_PUBKEY_GET : constant := 119;  --  openssl/x509.h:1212
      X509_F_X509_PUBKEY_SET : constant := 120;  --  openssl/x509.h:1213
      X509_F_X509_REQ_CHECK_PRIVATE_KEY : constant := 144;  --  openssl/x509.h:1214
      X509_F_X509_REQ_PRINT_EX : constant := 121;  --  openssl/x509.h:1215
      X509_F_X509_REQ_PRINT_FP : constant := 122;  --  openssl/x509.h:1216
      X509_F_X509_REQ_TO_X509 : constant := 123;  --  openssl/x509.h:1217
      X509_F_X509_STORE_ADD_CERT : constant := 124;  --  openssl/x509.h:1218
      X509_F_X509_STORE_ADD_CRL : constant := 125;  --  openssl/x509.h:1219
      X509_F_X509_STORE_CTX_GET1_ISSUER : constant := 146;  --  openssl/x509.h:1220
      X509_F_X509_STORE_CTX_INIT : constant := 143;  --  openssl/x509.h:1221
      X509_F_X509_STORE_CTX_NEW : constant := 142;  --  openssl/x509.h:1222
      X509_F_X509_STORE_CTX_PURPOSE_INHERIT : constant := 134;  --  openssl/x509.h:1223
      X509_F_X509_TO_X509_REQ : constant := 126;  --  openssl/x509.h:1224
      X509_F_X509_TRUST_ADD : constant := 133;  --  openssl/x509.h:1225
      X509_F_X509_TRUST_SET : constant := 141;  --  openssl/x509.h:1226
      X509_F_X509_VERIFY_CERT : constant := 127;  --  openssl/x509.h:1227

      X509_R_BAD_X509_FILETYPE : constant := 100;  --  openssl/x509.h:1230
      X509_R_BASE64_DECODE_ERROR : constant := 118;  --  openssl/x509.h:1231
      X509_R_CANT_CHECK_DH_KEY : constant := 114;  --  openssl/x509.h:1232
      X509_R_CERT_ALREADY_IN_HASH_TABLE : constant := 101;  --  openssl/x509.h:1233
      X509_R_ERR_ASN1_LIB   : constant := 102;  --  openssl/x509.h:1234
      X509_R_INVALID_DIRECTORY : constant := 113;  --  openssl/x509.h:1235
      X509_R_INVALID_FIELD_NAME : constant := 119;  --  openssl/x509.h:1236
      X509_R_INVALID_TRUST  : constant := 123;  --  openssl/x509.h:1237
      X509_R_KEY_TYPE_MISMATCH : constant := 115;  --  openssl/x509.h:1238
      X509_R_KEY_VALUES_MISMATCH : constant := 116;  --  openssl/x509.h:1239
      X509_R_LOADING_CERT_DIR : constant := 103;  --  openssl/x509.h:1240
      X509_R_LOADING_DEFAULTS : constant := 104;  --  openssl/x509.h:1241
      X509_R_METHOD_NOT_SUPPORTED : constant := 124;  --  openssl/x509.h:1242
      X509_R_NO_CERT_SET_FOR_US_TO_VERIFY : constant := 105;  --  openssl/x509.h:1243
      X509_R_PUBLIC_KEY_DECODE_ERROR : constant := 125;  --  openssl/x509.h:1244
      X509_R_PUBLIC_KEY_ENCODE_ERROR : constant := 126;  --  openssl/x509.h:1245
      X509_R_SHOULD_RETRY   : constant := 106;  --  openssl/x509.h:1246
      X509_R_UNABLE_TO_FIND_PARAMETERS_IN_CHAIN : constant := 107;  --  openssl/x509.h:1247
      X509_R_UNABLE_TO_GET_CERTS_PUBLIC_KEY : constant := 108;  --  openssl/x509.h:1248
      X509_R_UNKNOWN_KEY_TYPE : constant := 117;  --  openssl/x509.h:1249
      X509_R_UNKNOWN_NID    : constant := 109;  --  openssl/x509.h:1250
      X509_R_UNKNOWN_PURPOSE_ID : constant := 121;  --  openssl/x509.h:1251
      X509_R_UNKNOWN_TRUST_ID : constant := 120;  --  openssl/x509.h:1252
      X509_R_UNSUPPORTED_ALGORITHM : constant := 111;  --  openssl/x509.h:1253
      X509_R_WRONG_LOOKUP_TYPE : constant := 112;  --  openssl/x509.h:1254
      X509_R_WRONG_TYPE     : constant := 122;  --  openssl/x509.h:1255
   end defs;
   type X509_objects_st is record
      nid : aliased int;  -- openssl/x509.h:130
      a2i : access function return int;  -- openssl/x509.h:131
      i2a : access function return int;  -- openssl/x509.h:132
   end record;
   pragma Convention (C_Pass_By_Copy, X509_objects_st);  -- openssl/x509.h:128

   subtype X509_OBJECTS is X509_objects_st;

   type X509_algor_st is record
      algorithm : access OpenSSL.Low_Level.asn1_h.asn1_object_st;  -- openssl/x509.h:137
      parameter : access OpenSSL.Low_Level.asn1_h.asn1_type_st;  -- openssl/x509.h:138
   end record;
   pragma Convention (C_Pass_By_Copy, X509_algor_st);  -- openssl/x509.h:135

   subtype X509_ALGORS is OpenSSL.Low_Level.asn1_h.stack_st_X509_ALGOR;

   type X509_val_st is record
      notBefore : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:147
      notAfter  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:148
   end record;
   pragma Convention (C_Pass_By_Copy, X509_val_st);  -- openssl/x509.h:145

   subtype X509_VAL is X509_val_st;

   type X509_pubkey_st is record
      algor      : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:153
      public_key : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:154
      pkey       : access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509.h:155
   end record;
   pragma Convention (C_Pass_By_Copy, X509_pubkey_st);  -- openssl/x509.h:151

   type X509_sig_st is record
      algor  : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:160
      digest : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:161
   end record;
   pragma Convention (C_Pass_By_Copy, X509_sig_st);  -- openssl/x509.h:158

   subtype X509_SIG is X509_sig_st;

   type X509_name_entry_st is record
      object : access OpenSSL.Low_Level.asn1_h.asn1_object_st;  -- openssl/x509.h:166
      value  : access OpenSSL.Low_Level.asn1_h.ASN1_STRING;  -- openssl/x509.h:167
      set    : aliased int;  -- openssl/x509.h:168
      size   : aliased int;  -- openssl/x509.h:169
   end record;
   pragma Convention (C_Pass_By_Copy, X509_name_entry_st);  -- openssl/x509.h:164

   subtype X509_NAME_ENTRY is X509_name_entry_st;

   type stack_st_X509_NAME_ENTRY is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509.h:172
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_NAME_ENTRY);  -- openssl/x509.h:172

   type X509_name_st is record
      entries      : access stack_st_X509_NAME_ENTRY;  -- openssl/x509.h:178
      modified     : aliased int;  -- openssl/x509.h:179
      bytes        : access OpenSSL.Low_Level.buffer_h.buf_mem_st;  -- openssl/x509.h:181
      canon_enc    : access unsigned_char;  -- openssl/x509.h:186
      canon_enclen : aliased int;  -- openssl/x509.h:187
   end record;
   pragma Convention (C_Pass_By_Copy, X509_name_st);  -- openssl/x509.h:176

   type stack_st_X509_NAME is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509.h:190
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_NAME);  -- openssl/x509.h:190

   type X509_extension_st is record
      object   : access OpenSSL.Low_Level.asn1_h.asn1_object_st;  -- openssl/x509.h:196
      critical : aliased Interfaces.C.int;  -- openssl/x509.h:197
      value    : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:198
   end record;
   pragma Convention (C_Pass_By_Copy, X509_extension_st);  -- openssl/x509.h:194

   subtype X509_EXTENSION is X509_extension_st;

   type stack_st_X509_EXTENSION;
   subtype X509_EXTENSIONS is stack_st_X509_EXTENSION;

   type stack_st_X509_EXTENSION is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509.h:203
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_EXTENSION);  -- openssl/x509.h:203

   type anon_30 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ptr    : Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:212
         when 1 =>
            set    : access OpenSSL.Low_Level.asn1_h.stack_st_ASN1_TYPE;  -- openssl/x509.h:213
         when others =>
            single : access OpenSSL.Low_Level.asn1_h.asn1_type_st;  -- openssl/x509.h:214
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_30);
   pragma Unchecked_Union (anon_30);
   type x509_attributes_st is record
      object : access OpenSSL.Low_Level.asn1_h.asn1_object_st;  -- openssl/x509.h:209
      single : aliased int;  -- openssl/x509.h:210
      value  : anon_30;  -- openssl/x509.h:215
   end record;
   pragma Convention (C_Pass_By_Copy, x509_attributes_st);  -- openssl/x509.h:207

   subtype X509_ATTRIBUTE is x509_attributes_st;

   type stack_st_X509_ATTRIBUTE is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509.h:218
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_ATTRIBUTE);  -- openssl/x509.h:218

   type X509_req_info_st is record
      enc        : aliased OpenSSL.Low_Level.asn1_h.ASN1_ENCODING;  -- openssl/x509.h:224
      version    : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:225
      subject    : access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/x509.h:226
      pubkey     : access OpenSSL.Low_Level.x509_h.X509_pubkey_st;  -- openssl/x509.h:227
      attributes : access stack_st_X509_ATTRIBUTE;  -- openssl/x509.h:229
   end record;
   pragma Convention (C_Pass_By_Copy, X509_req_info_st);  -- openssl/x509.h:222

   subtype X509_REQ_INFO is X509_req_info_st;

   type X509_req_st is record
      req_info   : access X509_REQ_INFO;  -- openssl/x509.h:234
      sig_alg    : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:235
      signature  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:236
      references : aliased int;  -- openssl/x509.h:237
   end record;
   pragma Convention (C_Pass_By_Copy, X509_req_st);  -- openssl/x509.h:232

   subtype X509_REQ is X509_req_st;

   type x509_cinf_st is record
      version      : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:242
      serialNumber : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:243
      signature    : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:244
      issuer       : access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/x509.h:245
      validity     : access X509_VAL;  -- openssl/x509.h:246
      subject      : access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/x509.h:247
      key          : access OpenSSL.Low_Level.x509_h.X509_pubkey_st;  -- openssl/x509.h:248
      issuerUID    : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:249
      subjectUID   : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:250
      extensions   : access stack_st_X509_EXTENSION;  -- openssl/x509.h:251
      enc          : aliased OpenSSL.Low_Level.asn1_h.ASN1_ENCODING;  -- openssl/x509.h:252
   end record;
   pragma Convention (C_Pass_By_Copy, x509_cinf_st);  -- openssl/x509.h:240

   subtype X509_CINF is x509_cinf_st;

   type x509_cert_aux_st is record
      trust  : access OpenSSL.Low_Level.asn1_h.stack_st_ASN1_OBJECT;  -- openssl/x509.h:263
      reject : access OpenSSL.Low_Level.asn1_h.stack_st_ASN1_OBJECT;  -- openssl/x509.h:264
      alias  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:265
      keyid  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:266
      other  : access OpenSSL.Low_Level.asn1_h.stack_st_X509_ALGOR;  -- openssl/x509.h:267
   end record;
   pragma Convention (C_Pass_By_Copy, x509_cert_aux_st);  -- openssl/x509.h:261

   subtype X509_CERT_AUX is x509_cert_aux_st;

   type x509_st_sha1_hash_array is array (0 .. 19) of aliased unsigned_char;
   type x509_st is record
      cert_info    : access X509_CINF;  -- openssl/x509.h:272
      sig_alg      : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:273
      signature    : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:274
      valid        : aliased int;  -- openssl/x509.h:275
      references   : aliased int;  -- openssl/x509.h:276
      name         : Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:277
      ex_data      : aliased OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;  -- openssl/x509.h:278
      ex_pathlen   : aliased long;  -- openssl/x509.h:280
      ex_pcpathlen : aliased long;  -- openssl/x509.h:281
      ex_flags     : aliased unsigned_long;  -- openssl/x509.h:282
      ex_kusage    : aliased unsigned_long;  -- openssl/x509.h:283
      ex_xkusage   : aliased unsigned_long;  -- openssl/x509.h:284
      ex_nscert    : aliased unsigned_long;  -- openssl/x509.h:285
      skid         : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:286
      akid         : access OpenSSL.Low_Level.x509v3_h.AUTHORITY_KEYID_st;  -- openssl/x509.h:287
      policy_cache : System.Address;  -- openssl/x509.h:288
      crldp        : access OpenSSL.Low_Level.x509v3_h.stack_st_DIST_POINT;  -- openssl/x509.h:289
      altname      : access OpenSSL.Low_Level.x509v3_h.stack_st_GENERAL_NAME;  -- openssl/x509.h:290
      nc           : access OpenSSL.Low_Level.x509v3_h.NAME_CONSTRAINTS_st;  -- openssl/x509.h:291
      rfc3779_addr : access OpenSSL.Low_Level.x509v3_h.stack_st_IPAddressFamily;  -- openssl/x509.h:293
      rfc3779_asid : access OpenSSL.Low_Level.x509v3_h.ASIdentifiers_st;  -- openssl/x509.h:294
      sha1_hash    : aliased x509_st_sha1_hash_array;  -- openssl/x509.h:297
      aux          : access X509_CERT_AUX;  -- openssl/x509.h:299
   end record;
   pragma Convention (C_Pass_By_Copy, x509_st);  -- openssl/x509.h:270

   type stack_st_X509 is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509.h:302
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509);  -- openssl/x509.h:302

   type x509_trust_st is record
      trust       : aliased int;  -- openssl/x509.h:308
      flags       : aliased int;  -- openssl/x509.h:309
      check_trust : access function
        (arg1 : access x509_trust_st;
         arg2        : access OpenSSL.Low_Level.x509_h.x509_st;
         arg3        : int) return int;  -- openssl/x509.h:310
      name        : Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:311
      arg1        : aliased int;  -- openssl/x509.h:312
      arg2        : System.Address;  -- openssl/x509.h:313
   end record;
   pragma Convention (C_Pass_By_Copy, x509_trust_st);  -- openssl/x509.h:307

   subtype X509_TRUST is x509_trust_st;

   type stack_st_X509_TRUST is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509.h:316
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_TRUST);  -- openssl/x509.h:316

   type x509_cert_pair_st is record
      forward   : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509.h:319
      c_reverse : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509.h:320
   end record;
   pragma Convention (C_Pass_By_Copy, x509_cert_pair_st);  -- openssl/x509.h:318

   subtype X509_CERT_PAIR is x509_cert_pair_st;

   type x509_revoked_st is record
      serialNumber   : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:427
      revocationDate : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:428
      extensions     : access stack_st_X509_EXTENSION;  -- openssl/x509.h:429
      issuer         : access OpenSSL.Low_Level.x509v3_h.stack_st_GENERAL_NAME;  -- openssl/x509.h:431
      reason         : aliased int;  -- openssl/x509.h:433
      sequence       : aliased int;  -- openssl/x509.h:434
   end record;
   pragma Convention (C_Pass_By_Copy, x509_revoked_st);  -- openssl/x509.h:425

   type stack_st_X509_REVOKED is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509.h:437
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_REVOKED);  -- openssl/x509.h:437

   type X509_crl_info_st is record
      version    : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:442
      sig_alg    : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:443
      issuer     : access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/x509.h:444
      lastUpdate : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:445
      nextUpdate : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:446
      revoked    : access stack_st_X509_REVOKED;  -- openssl/x509.h:447
      extensions : access stack_st_X509_EXTENSION;  -- openssl/x509.h:448
      enc        : aliased OpenSSL.Low_Level.asn1_h.ASN1_ENCODING;  -- openssl/x509.h:449
   end record;
   pragma Convention (C_Pass_By_Copy, X509_crl_info_st);  -- openssl/x509.h:440

   subtype X509_CRL_INFO is X509_crl_info_st;

   type X509_crl_st_sha1_hash_array is array (0 .. 19) of aliased unsigned_char;
   type X509_crl_st is record
      crl             : access X509_CRL_INFO;  -- openssl/x509.h:455
      sig_alg         : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:456
      signature       : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:457
      references      : aliased int;  -- openssl/x509.h:458
      flags           : aliased int;  -- openssl/x509.h:459
      akid            : access OpenSSL.Low_Level.x509v3_h.AUTHORITY_KEYID_st;  -- openssl/x509.h:461
      idp             : access OpenSSL.Low_Level.x509v3_h.ISSUING_DIST_POINT_st;  -- openssl/x509.h:462
      idp_flags       : aliased int;  -- openssl/x509.h:464
      idp_reasons     : aliased int;  -- openssl/x509.h:465
      crl_number      : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:467
      base_crl_number : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:468
      sha1_hash       : aliased X509_crl_st_sha1_hash_array;  -- openssl/x509.h:470
      issuers         : access OpenSSL.Low_Level.cms_h.stack_st_GENERAL_NAMES;  -- openssl/x509.h:472
      meth            : System.Address;  -- openssl/x509.h:473
      meth_data       : System.Address;  -- openssl/x509.h:474
   end record;
   pragma Convention (C_Pass_By_Copy, X509_crl_st);  -- openssl/x509.h:452

   type stack_st_X509_CRL is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509.h:477
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_CRL);  -- openssl/x509.h:477

   type private_key_st is record
      version    : aliased int;  -- openssl/x509.h:482
      enc_algor  : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:484
      enc_pkey   : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:485
      dec_pkey   : access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509.h:488
      key_length : aliased int;  -- openssl/x509.h:491
      key_data   : Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:492
      key_free   : aliased int;  -- openssl/x509.h:493
      cipher     : aliased OpenSSL.Low_Level.evp_h.EVP_CIPHER_INFO;  -- openssl/x509.h:496
      references : aliased int;  -- openssl/x509.h:498
   end record;
   pragma Convention (C_Pass_By_Copy, private_key_st);  -- openssl/x509.h:480

   subtype X509_PKEY is private_key_st;

   type X509_info_st is record
      the_x509   : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509.h:504
      crl        : access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/x509.h:505
      x_pkey     : access X509_PKEY;  -- openssl/x509.h:506
      enc_cipher : aliased OpenSSL.Low_Level.evp_h.EVP_CIPHER_INFO;  -- openssl/x509.h:508
      enc_len    : aliased int;  -- openssl/x509.h:509
      enc_data   : Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:510
      references : aliased int;  -- openssl/x509.h:512
   end record;
   pragma Convention (C_Pass_By_Copy, X509_info_st);  -- openssl/x509.h:502

   subtype X509_INFO is X509_info_st;

   type stack_st_X509_INFO is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509.h:515
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_INFO);  -- openssl/x509.h:515

   type Netscape_spkac_st is record
      pubkey    : access OpenSSL.Low_Level.x509_h.X509_pubkey_st;  -- openssl/x509.h:524
      challenge : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:525
   end record;
   pragma Convention (C_Pass_By_Copy, Netscape_spkac_st);  -- openssl/x509.h:522

   subtype NETSCAPE_SPKAC is Netscape_spkac_st;

   type Netscape_spki_st is record
      spkac     : access NETSCAPE_SPKAC;  -- openssl/x509.h:530
      sig_algor : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:531
      signature : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:532
   end record;
   pragma Convention (C_Pass_By_Copy, Netscape_spki_st);  -- openssl/x509.h:528

   subtype NETSCAPE_SPKI is Netscape_spki_st;

   type Netscape_certificate_sequence is record
      c_type : access OpenSSL.Low_Level.asn1_h.asn1_object_st;  -- openssl/x509.h:538
      certs  : access stack_st_X509;  -- openssl/x509.h:539
   end record;
   pragma Convention (C_Pass_By_Copy, Netscape_certificate_sequence);  -- openssl/x509.h:536

   subtype NETSCAPE_CERT_SEQUENCE is Netscape_certificate_sequence;

   type PBEPARAM_st is record
      salt : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:552
      iter : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:553
   end record;
   pragma Convention (C_Pass_By_Copy, PBEPARAM_st);  -- openssl/x509.h:551

   subtype PBEPARAM is PBEPARAM_st;

   type PBE2PARAM_st is record
      keyfunc    : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:559
      encryption : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:560
   end record;
   pragma Convention (C_Pass_By_Copy, PBE2PARAM_st);  -- openssl/x509.h:558

   subtype PBE2PARAM is PBE2PARAM_st;

   type PBKDF2PARAM_st is record
      salt      : access OpenSSL.Low_Level.asn1_h.asn1_type_st;  -- openssl/x509.h:564
      iter      : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:565
      keylength : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:566
      prf       : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:567
   end record;
   pragma Convention (C_Pass_By_Copy, PBKDF2PARAM_st);  -- openssl/x509.h:563

   subtype PBKDF2PARAM is PBKDF2PARAM_st;

   type pkcs8_priv_key_info_st is record
      broken     : aliased int;  -- openssl/x509.h:575
      version    : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:581
      pkeyalg    : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:582
      pkey       : access OpenSSL.Low_Level.asn1_h.asn1_type_st;  -- openssl/x509.h:583
      attributes : access stack_st_X509_ATTRIBUTE;  -- openssl/x509.h:584
   end record;
   pragma Convention (C_Pass_By_Copy, pkcs8_priv_key_info_st);  -- openssl/x509.h:573

   procedure X509_CRL_set_default_method (meth : System.Address);  -- openssl/x509.h:618
   pragma Import (C, X509_CRL_set_default_method, "X509_CRL_set_default_method");

   function X509_CRL_METHOD_new
     (crl_init   : access function (arg1 : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;
      crl_free   : access function (arg1 : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;
      crl_lookup : access function
        (arg1 : access OpenSSL.Low_Level.x509_h.X509_crl_st;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
         arg4 : access OpenSSL.Low_Level.x509_h.X509_name_st) return int;
      crl_verify : access function (arg1 : access OpenSSL.Low_Level.x509_h.X509_crl_st; arg2 : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int) return System.Address;  -- openssl/x509.h:619
   pragma Import (C, X509_CRL_METHOD_new, "X509_CRL_METHOD_new");

   procedure X509_CRL_METHOD_free (m : System.Address);  -- openssl/x509.h:625
   pragma Import (C, X509_CRL_METHOD_free, "X509_CRL_METHOD_free");

   procedure X509_CRL_set_meth_data (crl : access OpenSSL.Low_Level.x509_h.X509_crl_st; dat : System.Address);  -- openssl/x509.h:627
   pragma Import (C, X509_CRL_set_meth_data, "X509_CRL_set_meth_data");

   function X509_CRL_get_meth_data (crl : access OpenSSL.Low_Level.x509_h.X509_crl_st) return System.Address;  -- openssl/x509.h:628
   pragma Import (C, X509_CRL_get_meth_data, "X509_CRL_get_meth_data");

   function X509_verify_cert_error_string (n : long) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:635
   pragma Import (C, X509_verify_cert_error_string, "X509_verify_cert_error_string");

   function X509_verify (a : access OpenSSL.Low_Level.x509_h.x509_st; r : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:638
   pragma Import (C, X509_verify, "X509_verify");

   function X509_REQ_verify (a : access X509_REQ; r : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:640
   pragma Import (C, X509_REQ_verify, "X509_REQ_verify");

   function X509_CRL_verify (a : access OpenSSL.Low_Level.x509_h.X509_crl_st; r : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:641
   pragma Import (C, X509_CRL_verify, "X509_CRL_verify");

   function NETSCAPE_SPKI_verify (a : access NETSCAPE_SPKI; r : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:642
   pragma Import (C, NETSCAPE_SPKI_verify, "NETSCAPE_SPKI_verify");

   function NETSCAPE_SPKI_b64_decode (str : Interfaces.C.Strings.chars_ptr; len : int) return access NETSCAPE_SPKI;  -- openssl/x509.h:644
   pragma Import (C, NETSCAPE_SPKI_b64_decode, "NETSCAPE_SPKI_b64_decode");

   function NETSCAPE_SPKI_b64_encode (x : access NETSCAPE_SPKI) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:645
   pragma Import (C, NETSCAPE_SPKI_b64_encode, "NETSCAPE_SPKI_b64_encode");

   function NETSCAPE_SPKI_get_pubkey (x : access NETSCAPE_SPKI) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509.h:646
   pragma Import (C, NETSCAPE_SPKI_get_pubkey, "NETSCAPE_SPKI_get_pubkey");

   function NETSCAPE_SPKI_set_pubkey (x : access NETSCAPE_SPKI; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:647
   pragma Import (C, NETSCAPE_SPKI_set_pubkey, "NETSCAPE_SPKI_set_pubkey");

   function NETSCAPE_SPKI_print (c_out : access OpenSSL.Low_Level.bio_h.bio_st; spki : access NETSCAPE_SPKI) return int;  -- openssl/x509.h:649
   pragma Import (C, NETSCAPE_SPKI_print, "NETSCAPE_SPKI_print");

   function X509_signature_print
     (bp  : access OpenSSL.Low_Level.bio_h.bio_st;
      alg : access OpenSSL.Low_Level.x509_h.X509_algor_st;
      sig : access OpenSSL.Low_Level.asn1_h.ASN1_STRING) return int;  -- openssl/x509.h:651
   pragma Import (C, X509_signature_print, "X509_signature_print");

   function X509_sign
     (x    : access OpenSSL.Low_Level.x509_h.x509_st;
      pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      md   : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/x509.h:653
   pragma Import (C, X509_sign, "X509_sign");

   function X509_REQ_sign
     (x    : access X509_REQ;
      pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      md   : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/x509.h:654
   pragma Import (C, X509_REQ_sign, "X509_REQ_sign");

   function X509_CRL_sign
     (x    : access OpenSSL.Low_Level.x509_h.X509_crl_st;
      pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      md   : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/x509.h:655
   pragma Import (C, X509_CRL_sign, "X509_CRL_sign");

   function NETSCAPE_SPKI_sign
     (x    : access NETSCAPE_SPKI;
      pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      md   : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/x509.h:656
   pragma Import (C, NETSCAPE_SPKI_sign, "NETSCAPE_SPKI_sign");

   function X509_pubkey_digest
     (data   : access constant OpenSSL.Low_Level.x509_h.x509_st;
      c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      md     : access unsigned_char;
      len    : access unsigned) return int;  -- openssl/x509.h:658
   pragma Import (C, X509_pubkey_digest, "X509_pubkey_digest");

   function X509_digest
     (data   : access constant OpenSSL.Low_Level.x509_h.x509_st;
      c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      md     : access unsigned_char;
      len    : access unsigned) return int;  -- openssl/x509.h:660
   pragma Import (C, X509_digest, "X509_digest");

   function X509_CRL_digest
     (data   : access constant OpenSSL.Low_Level.x509_h.X509_crl_st;
      c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      md     : access unsigned_char;
      len    : access unsigned) return int;  -- openssl/x509.h:662
   pragma Import (C, X509_CRL_digest, "X509_CRL_digest");

   function X509_REQ_digest
     (data   : System.Address;
      c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      md     : access unsigned_char;
      len    : access unsigned) return int;  -- openssl/x509.h:664
   pragma Import (C, X509_REQ_digest, "X509_REQ_digest");

   function X509_NAME_digest
     (data   : access constant OpenSSL.Low_Level.x509_h.X509_name_st;
      c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      md     : access unsigned_char;
      len    : access unsigned) return int;  -- openssl/x509.h:666
   pragma Import (C, X509_NAME_digest, "X509_NAME_digest");

   function d2i_X509_fp (fp : access Interfaces.C_Streams.FILEs; the_x509 : System.Address) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509.h:671
   pragma Import (C, d2i_X509_fp, "d2i_X509_fp");

   function i2d_X509_fp (fp : access Interfaces.C_Streams.FILEs; the_x509 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509.h:672
   pragma Import (C, i2d_X509_fp, "i2d_X509_fp");

   function d2i_X509_CRL_fp (fp : access Interfaces.C_Streams.FILEs; crl : System.Address) return access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/x509.h:673
   pragma Import (C, d2i_X509_CRL_fp, "d2i_X509_CRL_fp");

   function i2d_X509_CRL_fp (fp : access Interfaces.C_Streams.FILEs; crl : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509.h:674
   pragma Import (C, i2d_X509_CRL_fp, "i2d_X509_CRL_fp");

   function d2i_X509_REQ_fp (fp : access Interfaces.C_Streams.FILEs; req : System.Address) return access X509_REQ;  -- openssl/x509.h:675
   pragma Import (C, d2i_X509_REQ_fp, "d2i_X509_REQ_fp");

   function i2d_X509_REQ_fp (fp : access Interfaces.C_Streams.FILEs; req : access X509_REQ) return int;  -- openssl/x509.h:676
   pragma Import (C, i2d_X509_REQ_fp, "i2d_X509_REQ_fp");

   function d2i_RSAPrivateKey_fp (fp : access Interfaces.C_Streams.FILEs; the_rsa : System.Address) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/x509.h:678
   pragma Import (C, d2i_RSAPrivateKey_fp, "d2i_RSAPrivateKey_fp");

   function i2d_RSAPrivateKey_fp (fp : access Interfaces.C_Streams.FILEs; the_rsa : access OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/x509.h:679
   pragma Import (C, i2d_RSAPrivateKey_fp, "i2d_RSAPrivateKey_fp");

   function d2i_RSAPublicKey_fp (fp : access Interfaces.C_Streams.FILEs; the_rsa : System.Address) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/x509.h:680
   pragma Import (C, d2i_RSAPublicKey_fp, "d2i_RSAPublicKey_fp");

   function i2d_RSAPublicKey_fp (fp : access Interfaces.C_Streams.FILEs; the_rsa : access OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/x509.h:681
   pragma Import (C, i2d_RSAPublicKey_fp, "i2d_RSAPublicKey_fp");

   function d2i_RSA_PUBKEY_fp (fp : access Interfaces.C_Streams.FILEs; the_rsa : System.Address) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/x509.h:682
   pragma Import (C, d2i_RSA_PUBKEY_fp, "d2i_RSA_PUBKEY_fp");

   function i2d_RSA_PUBKEY_fp (fp : access Interfaces.C_Streams.FILEs; the_rsa : access OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/x509.h:683
   pragma Import (C, i2d_RSA_PUBKEY_fp, "i2d_RSA_PUBKEY_fp");

   function d2i_DSA_PUBKEY_fp (fp : access Interfaces.C_Streams.FILEs; the_dsa : System.Address) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/x509.h:686
   pragma Import (C, d2i_DSA_PUBKEY_fp, "d2i_DSA_PUBKEY_fp");

   function i2d_DSA_PUBKEY_fp (fp : access Interfaces.C_Streams.FILEs; the_dsa : access OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/x509.h:687
   pragma Import (C, i2d_DSA_PUBKEY_fp, "i2d_DSA_PUBKEY_fp");

   function d2i_DSAPrivateKey_fp (fp : access Interfaces.C_Streams.FILEs; the_dsa : System.Address) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/x509.h:688
   pragma Import (C, d2i_DSAPrivateKey_fp, "d2i_DSAPrivateKey_fp");

   function i2d_DSAPrivateKey_fp (fp : access Interfaces.C_Streams.FILEs; the_dsa : access OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/x509.h:689
   pragma Import (C, i2d_DSAPrivateKey_fp, "i2d_DSAPrivateKey_fp");

   function d2i_PKCS8_fp (fp : access Interfaces.C_Streams.FILEs; p8 : System.Address) return access X509_SIG;  -- openssl/x509.h:691
   pragma Import (C, d2i_PKCS8_fp, "d2i_PKCS8_fp");

   function i2d_PKCS8_fp (fp : access Interfaces.C_Streams.FILEs; p8 : access X509_SIG) return int;  -- openssl/x509.h:692
   pragma Import (C, i2d_PKCS8_fp, "i2d_PKCS8_fp");

   function d2i_PKCS8_PRIV_KEY_INFO_fp (fp : access Interfaces.C_Streams.FILEs; p8inf : System.Address) return access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;  -- openssl/x509.h:693
   pragma Import (C, d2i_PKCS8_PRIV_KEY_INFO_fp, "d2i_PKCS8_PRIV_KEY_INFO_fp");

   function i2d_PKCS8_PRIV_KEY_INFO_fp (fp : access Interfaces.C_Streams.FILEs; p8inf : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st) return int;  -- openssl/x509.h:695
   pragma Import (C, i2d_PKCS8_PRIV_KEY_INFO_fp, "i2d_PKCS8_PRIV_KEY_INFO_fp");

   function i2d_PKCS8PrivateKeyInfo_fp (fp : access Interfaces.C_Streams.FILEs; key : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:696
   pragma Import (C, i2d_PKCS8PrivateKeyInfo_fp, "i2d_PKCS8PrivateKeyInfo_fp");

   function i2d_PrivateKey_fp (fp : access Interfaces.C_Streams.FILEs; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:697
   pragma Import (C, i2d_PrivateKey_fp, "i2d_PrivateKey_fp");

   function d2i_PrivateKey_fp (fp : access Interfaces.C_Streams.FILEs; a : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509.h:698
   pragma Import (C, d2i_PrivateKey_fp, "d2i_PrivateKey_fp");

   function i2d_PUBKEY_fp (fp : access Interfaces.C_Streams.FILEs; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:699
   pragma Import (C, i2d_PUBKEY_fp, "i2d_PUBKEY_fp");

   function d2i_PUBKEY_fp (fp : access Interfaces.C_Streams.FILEs; a : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509.h:700
   pragma Import (C, d2i_PUBKEY_fp, "d2i_PUBKEY_fp");

   function d2i_X509_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; the_x509 : System.Address) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509.h:704
   pragma Import (C, d2i_X509_bio, "d2i_X509_bio");

   function i2d_X509_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; the_x509 : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509.h:705
   pragma Import (C, i2d_X509_bio, "i2d_X509_bio");

   function d2i_X509_CRL_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; crl : System.Address) return access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/x509.h:706
   pragma Import (C, d2i_X509_CRL_bio, "d2i_X509_CRL_bio");

   function i2d_X509_CRL_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; crl : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509.h:707
   pragma Import (C, i2d_X509_CRL_bio, "i2d_X509_CRL_bio");

   function d2i_X509_REQ_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; req : System.Address) return access X509_REQ;  -- openssl/x509.h:708
   pragma Import (C, d2i_X509_REQ_bio, "d2i_X509_REQ_bio");

   function i2d_X509_REQ_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; req : access X509_REQ) return int;  -- openssl/x509.h:709
   pragma Import (C, i2d_X509_REQ_bio, "i2d_X509_REQ_bio");

   function d2i_RSAPrivateKey_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; the_rsa : System.Address) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/x509.h:711
   pragma Import (C, d2i_RSAPrivateKey_bio, "d2i_RSAPrivateKey_bio");

   function i2d_RSAPrivateKey_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; the_rsa : access OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/x509.h:712
   pragma Import (C, i2d_RSAPrivateKey_bio, "i2d_RSAPrivateKey_bio");

   function d2i_RSAPublicKey_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; the_rsa : System.Address) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/x509.h:713
   pragma Import (C, d2i_RSAPublicKey_bio, "d2i_RSAPublicKey_bio");

   function i2d_RSAPublicKey_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; the_rsa : access OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/x509.h:714
   pragma Import (C, i2d_RSAPublicKey_bio, "i2d_RSAPublicKey_bio");

   function d2i_RSA_PUBKEY_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; the_rsa : System.Address) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/x509.h:715
   pragma Import (C, d2i_RSA_PUBKEY_bio, "d2i_RSA_PUBKEY_bio");

   function i2d_RSA_PUBKEY_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; the_rsa : access OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/x509.h:716
   pragma Import (C, i2d_RSA_PUBKEY_bio, "i2d_RSA_PUBKEY_bio");

   function d2i_DSA_PUBKEY_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; the_dsa : System.Address) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/x509.h:719
   pragma Import (C, d2i_DSA_PUBKEY_bio, "d2i_DSA_PUBKEY_bio");

   function i2d_DSA_PUBKEY_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; the_dsa : access OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/x509.h:720
   pragma Import (C, i2d_DSA_PUBKEY_bio, "i2d_DSA_PUBKEY_bio");

   function d2i_DSAPrivateKey_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; the_dsa : System.Address) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/x509.h:721
   pragma Import (C, d2i_DSAPrivateKey_bio, "d2i_DSAPrivateKey_bio");

   function i2d_DSAPrivateKey_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; the_dsa : access OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/x509.h:722
   pragma Import (C, i2d_DSAPrivateKey_bio, "i2d_DSAPrivateKey_bio");

   function d2i_PKCS8_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; p8 : System.Address) return access X509_SIG;  -- openssl/x509.h:724
   pragma Import (C, d2i_PKCS8_bio, "d2i_PKCS8_bio");

   function i2d_PKCS8_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; p8 : access X509_SIG) return int;  -- openssl/x509.h:725
   pragma Import (C, i2d_PKCS8_bio, "i2d_PKCS8_bio");

   function d2i_PKCS8_PRIV_KEY_INFO_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; p8inf : System.Address) return access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;  -- openssl/x509.h:726
   pragma Import (C, d2i_PKCS8_PRIV_KEY_INFO_bio, "d2i_PKCS8_PRIV_KEY_INFO_bio");

   function i2d_PKCS8_PRIV_KEY_INFO_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; p8inf : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st) return int;  -- openssl/x509.h:728
   pragma Import (C, i2d_PKCS8_PRIV_KEY_INFO_bio, "i2d_PKCS8_PRIV_KEY_INFO_bio");

   function i2d_PKCS8PrivateKeyInfo_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; key : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:729
   pragma Import (C, i2d_PKCS8PrivateKeyInfo_bio, "i2d_PKCS8PrivateKeyInfo_bio");

   function i2d_PrivateKey_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:730
   pragma Import (C, i2d_PrivateKey_bio, "i2d_PrivateKey_bio");

   function d2i_PrivateKey_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; a : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509.h:731
   pragma Import (C, d2i_PrivateKey_bio, "d2i_PrivateKey_bio");

   function i2d_PUBKEY_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:732
   pragma Import (C, i2d_PUBKEY_bio, "i2d_PUBKEY_bio");

   function d2i_PUBKEY_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; a : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509.h:733
   pragma Import (C, d2i_PUBKEY_bio, "d2i_PUBKEY_bio");

   function X509_dup (the_x509 : access OpenSSL.Low_Level.x509_h.x509_st) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509.h:736
   pragma Import (C, X509_dup, "X509_dup");

   function X509_ATTRIBUTE_dup (xa : access X509_ATTRIBUTE) return access X509_ATTRIBUTE;  -- openssl/x509.h:737
   pragma Import (C, X509_ATTRIBUTE_dup, "X509_ATTRIBUTE_dup");

   function X509_EXTENSION_dup (ex : access X509_EXTENSION) return access X509_EXTENSION;  -- openssl/x509.h:738
   pragma Import (C, X509_EXTENSION_dup, "X509_EXTENSION_dup");

   function X509_CRL_dup (crl : access OpenSSL.Low_Level.x509_h.X509_crl_st) return access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/x509.h:739
   pragma Import (C, X509_CRL_dup, "X509_CRL_dup");

   function X509_REQ_dup (req : access X509_REQ) return access X509_REQ;  -- openssl/x509.h:740
   pragma Import (C, X509_REQ_dup, "X509_REQ_dup");

   function X509_ALGOR_dup (xn : access OpenSSL.Low_Level.x509_h.X509_algor_st) return access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:741
   pragma Import (C, X509_ALGOR_dup, "X509_ALGOR_dup");

   function X509_ALGOR_set0
     (alg   : access OpenSSL.Low_Level.x509_h.X509_algor_st;
      aobj  : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      ptype : int;
      pval  : System.Address) return int;  -- openssl/x509.h:742
   pragma Import (C, X509_ALGOR_set0, "X509_ALGOR_set0");

   procedure X509_ALGOR_get0
     (paobj  : System.Address;
      pptype : access int;
      ppval  : System.Address;
      algor  : access OpenSSL.Low_Level.x509_h.X509_algor_st);  -- openssl/x509.h:743
   pragma Import (C, X509_ALGOR_get0, "X509_ALGOR_get0");

   function X509_NAME_dup (xn : access OpenSSL.Low_Level.x509_h.X509_name_st) return access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/x509.h:746
   pragma Import (C, X509_NAME_dup, "X509_NAME_dup");

   function X509_NAME_ENTRY_dup (ne : access X509_NAME_ENTRY) return access X509_NAME_ENTRY;  -- openssl/x509.h:747
   pragma Import (C, X509_NAME_ENTRY_dup, "X509_NAME_ENTRY_dup");

   function X509_cmp_time (s : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st; t : access time_h.time_t) return int;  -- openssl/x509.h:749
   pragma Import (C, X509_cmp_time, "X509_cmp_time");

   function X509_cmp_current_time (s : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/x509.h:750
   pragma Import (C, X509_cmp_current_time, "X509_cmp_current_time");

   function X509_time_adj
     (s   : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      adj : long;
      t   : access time_h.time_t) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:751
   pragma Import (C, X509_time_adj, "X509_time_adj");

   function X509_time_adj_ex
     (s          : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      offset_day : int;
      offset_sec : long;
      t          : access time_h.time_t) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:752
   pragma Import (C, X509_time_adj_ex, "X509_time_adj_ex");

   function X509_gmtime_adj (s : access OpenSSL.Low_Level.asn1_h.asn1_string_st; adj : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:754
   pragma Import (C, X509_gmtime_adj, "X509_gmtime_adj");

   function X509_get_default_cert_area return Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:756
   pragma Import (C, X509_get_default_cert_area, "X509_get_default_cert_area");

   function X509_get_default_cert_dir return Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:757
   pragma Import (C, X509_get_default_cert_dir, "X509_get_default_cert_dir");

   function X509_get_default_cert_file return Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:758
   pragma Import (C, X509_get_default_cert_file, "X509_get_default_cert_file");

   function X509_get_default_cert_dir_env return Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:759
   pragma Import (C, X509_get_default_cert_dir_env, "X509_get_default_cert_dir_env");

   function X509_get_default_cert_file_env return Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:760
   pragma Import (C, X509_get_default_cert_file_env, "X509_get_default_cert_file_env");

   function X509_get_default_private_dir return Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:761
   pragma Import (C, X509_get_default_private_dir, "X509_get_default_private_dir");

   function X509_to_X509_REQ
     (x    : access OpenSSL.Low_Level.x509_h.x509_st;
      pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      md   : access constant OpenSSL.Low_Level.evp_h.env_md_st) return access X509_REQ;  -- openssl/x509.h:763
   pragma Import (C, X509_to_X509_REQ, "X509_to_X509_REQ");

   function X509_REQ_to_X509
     (r    : access X509_REQ;
      days : int;
      pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509.h:764
   pragma Import (C, X509_REQ_to_X509, "X509_REQ_to_X509");

   X509_ALGOR_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:766
   pragma Import (C, X509_ALGOR_it, "X509_ALGOR_it");

   function i2d_X509_ALGOR (a : access OpenSSL.Low_Level.x509_h.X509_algor_st; c_out : System.Address) return int;  -- openssl/x509.h:766
   pragma Import (C, i2d_X509_ALGOR, "i2d_X509_ALGOR");

   function d2i_X509_ALGOR
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:766
   pragma Import (C, d2i_X509_ALGOR, "d2i_X509_ALGOR");

   procedure X509_ALGOR_free (a : access OpenSSL.Low_Level.x509_h.X509_algor_st);  -- openssl/x509.h:766
   pragma Import (C, X509_ALGOR_free, "X509_ALGOR_free");

   function X509_ALGOR_new return access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:766
   pragma Import (C, X509_ALGOR_new, "X509_ALGOR_new");

   X509_ALGORS_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:767
   pragma Import (C, X509_ALGORS_it, "X509_ALGORS_it");

   function i2d_X509_ALGORS (a : access X509_ALGORS; c_out : System.Address) return int;  -- openssl/x509.h:767
   pragma Import (C, i2d_X509_ALGORS, "i2d_X509_ALGORS");

   function d2i_X509_ALGORS
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_ALGORS;  -- openssl/x509.h:767
   pragma Import (C, d2i_X509_ALGORS, "d2i_X509_ALGORS");

   X509_VAL_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:768
   pragma Import (C, X509_VAL_it, "X509_VAL_it");

   function i2d_X509_VAL (a : access X509_VAL; c_out : System.Address) return int;  -- openssl/x509.h:768
   pragma Import (C, i2d_X509_VAL, "i2d_X509_VAL");

   function d2i_X509_VAL
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_VAL;  -- openssl/x509.h:768
   pragma Import (C, d2i_X509_VAL, "d2i_X509_VAL");

   procedure X509_VAL_free (a : access X509_VAL);  -- openssl/x509.h:768
   pragma Import (C, X509_VAL_free, "X509_VAL_free");

   function X509_VAL_new return access X509_VAL;  -- openssl/x509.h:768
   pragma Import (C, X509_VAL_new, "X509_VAL_new");

   X509_PUBKEY_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:770
   pragma Import (C, X509_PUBKEY_it, "X509_PUBKEY_it");

   function i2d_X509_PUBKEY (a : access OpenSSL.Low_Level.x509_h.X509_pubkey_st; c_out : System.Address) return int;  -- openssl/x509.h:770
   pragma Import (C, i2d_X509_PUBKEY, "i2d_X509_PUBKEY");

   function d2i_X509_PUBKEY
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.x509_h.X509_pubkey_st;  -- openssl/x509.h:770
   pragma Import (C, d2i_X509_PUBKEY, "d2i_X509_PUBKEY");

   procedure X509_PUBKEY_free (a : access OpenSSL.Low_Level.x509_h.X509_pubkey_st);  -- openssl/x509.h:770
   pragma Import (C, X509_PUBKEY_free, "X509_PUBKEY_free");

   function X509_PUBKEY_new return access OpenSSL.Low_Level.x509_h.X509_pubkey_st;  -- openssl/x509.h:770
   pragma Import (C, X509_PUBKEY_new, "X509_PUBKEY_new");

   function X509_PUBKEY_set (x : System.Address; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:772
   pragma Import (C, X509_PUBKEY_set, "X509_PUBKEY_set");

   function X509_PUBKEY_get (key : access OpenSSL.Low_Level.x509_h.X509_pubkey_st) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509.h:773
   pragma Import (C, X509_PUBKEY_get, "X509_PUBKEY_get");

   function X509_get_pubkey_parameters (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st; chain : access stack_st_X509) return int;  -- openssl/x509.h:774
   pragma Import (C, X509_get_pubkey_parameters, "X509_get_pubkey_parameters");

   function i2d_PUBKEY (a : access OpenSSL.Low_Level.evp_h.evp_pkey_st; pp : System.Address) return int;  -- openssl/x509.h:776
   pragma Import (C, i2d_PUBKEY, "i2d_PUBKEY");

   function d2i_PUBKEY
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509.h:777
   pragma Import (C, d2i_PUBKEY, "d2i_PUBKEY");

   function i2d_RSA_PUBKEY (a : access OpenSSL.Low_Level.rsa_h.rsa_st; pp : System.Address) return int;  -- openssl/x509.h:780
   pragma Import (C, i2d_RSA_PUBKEY, "i2d_RSA_PUBKEY");

   function d2i_RSA_PUBKEY
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/x509.h:781
   pragma Import (C, d2i_RSA_PUBKEY, "d2i_RSA_PUBKEY");

   function i2d_DSA_PUBKEY (a : access OpenSSL.Low_Level.dsa_h.dsa_st; pp : System.Address) return int;  -- openssl/x509.h:785
   pragma Import (C, i2d_DSA_PUBKEY, "i2d_DSA_PUBKEY");

   function d2i_DSA_PUBKEY
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/x509.h:786
   pragma Import (C, d2i_DSA_PUBKEY, "d2i_DSA_PUBKEY");

   X509_SIG_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:790
   pragma Import (C, X509_SIG_it, "X509_SIG_it");

   function i2d_X509_SIG (a : access X509_SIG; c_out : System.Address) return int;  -- openssl/x509.h:790
   pragma Import (C, i2d_X509_SIG, "i2d_X509_SIG");

   function d2i_X509_SIG
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_SIG;  -- openssl/x509.h:790
   pragma Import (C, d2i_X509_SIG, "d2i_X509_SIG");

   procedure X509_SIG_free (a : access X509_SIG);  -- openssl/x509.h:790
   pragma Import (C, X509_SIG_free, "X509_SIG_free");

   function X509_SIG_new return access X509_SIG;  -- openssl/x509.h:790
   pragma Import (C, X509_SIG_new, "X509_SIG_new");

   X509_REQ_INFO_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:791
   pragma Import (C, X509_REQ_INFO_it, "X509_REQ_INFO_it");

   function i2d_X509_REQ_INFO (a : access X509_REQ_INFO; c_out : System.Address) return int;  -- openssl/x509.h:791
   pragma Import (C, i2d_X509_REQ_INFO, "i2d_X509_REQ_INFO");

   function d2i_X509_REQ_INFO
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_REQ_INFO;  -- openssl/x509.h:791
   pragma Import (C, d2i_X509_REQ_INFO, "d2i_X509_REQ_INFO");

   procedure X509_REQ_INFO_free (a : access X509_REQ_INFO);  -- openssl/x509.h:791
   pragma Import (C, X509_REQ_INFO_free, "X509_REQ_INFO_free");

   function X509_REQ_INFO_new return access X509_REQ_INFO;  -- openssl/x509.h:791
   pragma Import (C, X509_REQ_INFO_new, "X509_REQ_INFO_new");

   X509_REQ_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:792
   pragma Import (C, X509_REQ_it, "X509_REQ_it");

   function i2d_X509_REQ (a : access X509_REQ; c_out : System.Address) return int;  -- openssl/x509.h:792
   pragma Import (C, i2d_X509_REQ, "i2d_X509_REQ");

   function d2i_X509_REQ
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_REQ;  -- openssl/x509.h:792
   pragma Import (C, d2i_X509_REQ, "d2i_X509_REQ");

   procedure X509_REQ_free (a : access X509_REQ);  -- openssl/x509.h:792
   pragma Import (C, X509_REQ_free, "X509_REQ_free");

   function X509_REQ_new return access X509_REQ;  -- openssl/x509.h:792
   pragma Import (C, X509_REQ_new, "X509_REQ_new");

   X509_ATTRIBUTE_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:794
   pragma Import (C, X509_ATTRIBUTE_it, "X509_ATTRIBUTE_it");

   function i2d_X509_ATTRIBUTE (a : access X509_ATTRIBUTE; c_out : System.Address) return int;  -- openssl/x509.h:794
   pragma Import (C, i2d_X509_ATTRIBUTE, "i2d_X509_ATTRIBUTE");

   function d2i_X509_ATTRIBUTE
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_ATTRIBUTE;  -- openssl/x509.h:794
   pragma Import (C, d2i_X509_ATTRIBUTE, "d2i_X509_ATTRIBUTE");

   procedure X509_ATTRIBUTE_free (a : access X509_ATTRIBUTE);  -- openssl/x509.h:794
   pragma Import (C, X509_ATTRIBUTE_free, "X509_ATTRIBUTE_free");

   function X509_ATTRIBUTE_new return access X509_ATTRIBUTE;  -- openssl/x509.h:794
   pragma Import (C, X509_ATTRIBUTE_new, "X509_ATTRIBUTE_new");

   function X509_ATTRIBUTE_create
     (nid     : int;
      atrtype : int;
      value   : System.Address) return access X509_ATTRIBUTE;  -- openssl/x509.h:795
   pragma Import (C, X509_ATTRIBUTE_create, "X509_ATTRIBUTE_create");

   X509_EXTENSION_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:797
   pragma Import (C, X509_EXTENSION_it, "X509_EXTENSION_it");

   function i2d_X509_EXTENSION (a : access X509_EXTENSION; c_out : System.Address) return int;  -- openssl/x509.h:797
   pragma Import (C, i2d_X509_EXTENSION, "i2d_X509_EXTENSION");

   function d2i_X509_EXTENSION
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_EXTENSION;  -- openssl/x509.h:797
   pragma Import (C, d2i_X509_EXTENSION, "d2i_X509_EXTENSION");

   procedure X509_EXTENSION_free (a : access X509_EXTENSION);  -- openssl/x509.h:797
   pragma Import (C, X509_EXTENSION_free, "X509_EXTENSION_free");

   function X509_EXTENSION_new return access X509_EXTENSION;  -- openssl/x509.h:797
   pragma Import (C, X509_EXTENSION_new, "X509_EXTENSION_new");

   X509_EXTENSIONS_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:798
   pragma Import (C, X509_EXTENSIONS_it, "X509_EXTENSIONS_it");

   function i2d_X509_EXTENSIONS (a : access X509_EXTENSIONS; c_out : System.Address) return int;  -- openssl/x509.h:798
   pragma Import (C, i2d_X509_EXTENSIONS, "i2d_X509_EXTENSIONS");

   function d2i_X509_EXTENSIONS
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_EXTENSIONS;  -- openssl/x509.h:798
   pragma Import (C, d2i_X509_EXTENSIONS, "d2i_X509_EXTENSIONS");

   X509_NAME_ENTRY_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:800
   pragma Import (C, X509_NAME_ENTRY_it, "X509_NAME_ENTRY_it");

   function i2d_X509_NAME_ENTRY (a : access X509_NAME_ENTRY; c_out : System.Address) return int;  -- openssl/x509.h:800
   pragma Import (C, i2d_X509_NAME_ENTRY, "i2d_X509_NAME_ENTRY");

   function d2i_X509_NAME_ENTRY
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_NAME_ENTRY;  -- openssl/x509.h:800
   pragma Import (C, d2i_X509_NAME_ENTRY, "d2i_X509_NAME_ENTRY");

   procedure X509_NAME_ENTRY_free (a : access X509_NAME_ENTRY);  -- openssl/x509.h:800
   pragma Import (C, X509_NAME_ENTRY_free, "X509_NAME_ENTRY_free");

   function X509_NAME_ENTRY_new return access X509_NAME_ENTRY;  -- openssl/x509.h:800
   pragma Import (C, X509_NAME_ENTRY_new, "X509_NAME_ENTRY_new");

   X509_NAME_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:802
   pragma Import (C, X509_NAME_it, "X509_NAME_it");

   function i2d_X509_NAME (a : access OpenSSL.Low_Level.x509_h.X509_name_st; c_out : System.Address) return int;  -- openssl/x509.h:802
   pragma Import (C, i2d_X509_NAME, "i2d_X509_NAME");

   function d2i_X509_NAME
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/x509.h:802
   pragma Import (C, d2i_X509_NAME, "d2i_X509_NAME");

   procedure X509_NAME_free (a : access OpenSSL.Low_Level.x509_h.X509_name_st);  -- openssl/x509.h:802
   pragma Import (C, X509_NAME_free, "X509_NAME_free");

   function X509_NAME_new return access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/x509.h:802
   pragma Import (C, X509_NAME_new, "X509_NAME_new");

   function X509_NAME_set (xn : System.Address; name : access OpenSSL.Low_Level.x509_h.X509_name_st) return int;  -- openssl/x509.h:804
   pragma Import (C, X509_NAME_set, "X509_NAME_set");

   X509_CINF_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:806
   pragma Import (C, X509_CINF_it, "X509_CINF_it");

   function i2d_X509_CINF (a : access X509_CINF; c_out : System.Address) return int;  -- openssl/x509.h:806
   pragma Import (C, i2d_X509_CINF, "i2d_X509_CINF");

   function d2i_X509_CINF
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_CINF;  -- openssl/x509.h:806
   pragma Import (C, d2i_X509_CINF, "d2i_X509_CINF");

   procedure X509_CINF_free (a : access X509_CINF);  -- openssl/x509.h:806
   pragma Import (C, X509_CINF_free, "X509_CINF_free");

   function X509_CINF_new return access X509_CINF;  -- openssl/x509.h:806
   pragma Import (C, X509_CINF_new, "X509_CINF_new");

   X509_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:808
   pragma Import (C, X509_it, "X509_it");

   function i2d_X509 (a : access OpenSSL.Low_Level.x509_h.x509_st; c_out : System.Address) return int;  -- openssl/x509.h:808
   pragma Import (C, i2d_X509, "i2d_X509");

   function d2i_X509
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509.h:808
   pragma Import (C, d2i_X509, "d2i_X509");

   procedure X509_free (a : access OpenSSL.Low_Level.x509_h.x509_st);  -- openssl/x509.h:808
   pragma Import (C, X509_free, "X509_free");

   function X509_new return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509.h:808
   pragma Import (C, X509_new, "X509_new");

   X509_CERT_AUX_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:809
   pragma Import (C, X509_CERT_AUX_it, "X509_CERT_AUX_it");

   function i2d_X509_CERT_AUX (a : access X509_CERT_AUX; c_out : System.Address) return int;  -- openssl/x509.h:809
   pragma Import (C, i2d_X509_CERT_AUX, "i2d_X509_CERT_AUX");

   function d2i_X509_CERT_AUX
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_CERT_AUX;  -- openssl/x509.h:809
   pragma Import (C, d2i_X509_CERT_AUX, "d2i_X509_CERT_AUX");

   procedure X509_CERT_AUX_free (a : access X509_CERT_AUX);  -- openssl/x509.h:809
   pragma Import (C, X509_CERT_AUX_free, "X509_CERT_AUX_free");

   function X509_CERT_AUX_new return access X509_CERT_AUX;  -- openssl/x509.h:809
   pragma Import (C, X509_CERT_AUX_new, "X509_CERT_AUX_new");

   X509_CERT_PAIR_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:811
   pragma Import (C, X509_CERT_PAIR_it, "X509_CERT_PAIR_it");

   function i2d_X509_CERT_PAIR (a : access X509_CERT_PAIR; c_out : System.Address) return int;  -- openssl/x509.h:811
   pragma Import (C, i2d_X509_CERT_PAIR, "i2d_X509_CERT_PAIR");

   function d2i_X509_CERT_PAIR
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_CERT_PAIR;  -- openssl/x509.h:811
   pragma Import (C, d2i_X509_CERT_PAIR, "d2i_X509_CERT_PAIR");

   procedure X509_CERT_PAIR_free (a : access X509_CERT_PAIR);  -- openssl/x509.h:811
   pragma Import (C, X509_CERT_PAIR_free, "X509_CERT_PAIR_free");

   function X509_CERT_PAIR_new return access X509_CERT_PAIR;  -- openssl/x509.h:811
   pragma Import (C, X509_CERT_PAIR_new, "X509_CERT_PAIR_new");

   function X509_get_ex_new_index
     (argl      : long;
      argp      : System.Address;
      new_func  : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      dup_func  : access function
        (arg1 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg2 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg3 : System.Address;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      free_func : access procedure
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address)) return int;  -- openssl/x509.h:813
   pragma Import (C, X509_get_ex_new_index, "X509_get_ex_new_index");

   function X509_set_ex_data
     (r   : access OpenSSL.Low_Level.x509_h.x509_st;
      idx : int;
      arg : System.Address) return int;  -- openssl/x509.h:815
   pragma Import (C, X509_set_ex_data, "X509_set_ex_data");

   function X509_get_ex_data (r : access OpenSSL.Low_Level.x509_h.x509_st; idx : int) return System.Address;  -- openssl/x509.h:816
   pragma Import (C, X509_get_ex_data, "X509_get_ex_data");

   function i2d_X509_AUX (a : access OpenSSL.Low_Level.x509_h.x509_st; pp : System.Address) return int;  -- openssl/x509.h:817
   pragma Import (C, i2d_X509_AUX, "i2d_X509_AUX");

   function d2i_X509_AUX
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509.h:818
   pragma Import (C, d2i_X509_AUX, "d2i_X509_AUX");

   function X509_alias_set1
     (x    : access OpenSSL.Low_Level.x509_h.x509_st;
      name : access unsigned_char;
      len  : int) return int;  -- openssl/x509.h:820
   pragma Import (C, X509_alias_set1, "X509_alias_set1");

   function X509_keyid_set1
     (x   : access OpenSSL.Low_Level.x509_h.x509_st;
      id  : access unsigned_char;
      len : int) return int;  -- openssl/x509.h:821
   pragma Import (C, X509_keyid_set1, "X509_keyid_set1");

   function X509_alias_get0 (x : access OpenSSL.Low_Level.x509_h.x509_st; len : access int) return access unsigned_char;  -- openssl/x509.h:822
   pragma Import (C, X509_alias_get0, "X509_alias_get0");

   function X509_keyid_get0 (x : access OpenSSL.Low_Level.x509_h.x509_st; len : access int) return access unsigned_char;  -- openssl/x509.h:823
   pragma Import (C, X509_keyid_get0, "X509_keyid_get0");

   function X509_TRUST_set_default (trust : access function
                                      (arg1 : int;
                                       arg2 : access OpenSSL.Low_Level.x509_h.x509_st;
                                       arg3 : int) return int) return access function
     (arg1 : int;
      arg2 : access OpenSSL.Low_Level.x509_h.x509_st;
      arg3 : int) return int;  -- openssl/x509.h:824
   pragma Import (C, X509_TRUST_set_default, "X509_TRUST_set_default");

   function X509_TRUST_set (t : access int; trust : int) return int;  -- openssl/x509.h:825
   pragma Import (C, X509_TRUST_set, "X509_TRUST_set");

   function X509_add1_trust_object (x : access OpenSSL.Low_Level.x509_h.x509_st; obj : access OpenSSL.Low_Level.asn1_h.asn1_object_st) return int;  -- openssl/x509.h:826
   pragma Import (C, X509_add1_trust_object, "X509_add1_trust_object");

   function X509_add1_reject_object (x : access OpenSSL.Low_Level.x509_h.x509_st; obj : access OpenSSL.Low_Level.asn1_h.asn1_object_st) return int;  -- openssl/x509.h:827
   pragma Import (C, X509_add1_reject_object, "X509_add1_reject_object");

   procedure X509_trust_clear (x : access OpenSSL.Low_Level.x509_h.x509_st);  -- openssl/x509.h:828
   pragma Import (C, X509_trust_clear, "X509_trust_clear");

   procedure X509_reject_clear (x : access OpenSSL.Low_Level.x509_h.x509_st);  -- openssl/x509.h:829
   pragma Import (C, X509_reject_clear, "X509_reject_clear");

   X509_REVOKED_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:831
   pragma Import (C, X509_REVOKED_it, "X509_REVOKED_it");

   function i2d_X509_REVOKED (a : access OpenSSL.Low_Level.x509_h.x509_revoked_st; c_out : System.Address) return int;  -- openssl/x509.h:831
   pragma Import (C, i2d_X509_REVOKED, "i2d_X509_REVOKED");

   function d2i_X509_REVOKED
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.x509_h.x509_revoked_st;  -- openssl/x509.h:831
   pragma Import (C, d2i_X509_REVOKED, "d2i_X509_REVOKED");

   procedure X509_REVOKED_free (a : access OpenSSL.Low_Level.x509_h.x509_revoked_st);  -- openssl/x509.h:831
   pragma Import (C, X509_REVOKED_free, "X509_REVOKED_free");

   function X509_REVOKED_new return access OpenSSL.Low_Level.x509_h.x509_revoked_st;  -- openssl/x509.h:831
   pragma Import (C, X509_REVOKED_new, "X509_REVOKED_new");

   X509_CRL_INFO_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:832
   pragma Import (C, X509_CRL_INFO_it, "X509_CRL_INFO_it");

   function i2d_X509_CRL_INFO (a : access X509_CRL_INFO; c_out : System.Address) return int;  -- openssl/x509.h:832
   pragma Import (C, i2d_X509_CRL_INFO, "i2d_X509_CRL_INFO");

   function d2i_X509_CRL_INFO
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access X509_CRL_INFO;  -- openssl/x509.h:832
   pragma Import (C, d2i_X509_CRL_INFO, "d2i_X509_CRL_INFO");

   procedure X509_CRL_INFO_free (a : access X509_CRL_INFO);  -- openssl/x509.h:832
   pragma Import (C, X509_CRL_INFO_free, "X509_CRL_INFO_free");

   function X509_CRL_INFO_new return access X509_CRL_INFO;  -- openssl/x509.h:832
   pragma Import (C, X509_CRL_INFO_new, "X509_CRL_INFO_new");

   X509_CRL_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:833
   pragma Import (C, X509_CRL_it, "X509_CRL_it");

   function i2d_X509_CRL (a : access OpenSSL.Low_Level.x509_h.X509_crl_st; c_out : System.Address) return int;  -- openssl/x509.h:833
   pragma Import (C, i2d_X509_CRL, "i2d_X509_CRL");

   function d2i_X509_CRL
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/x509.h:833
   pragma Import (C, d2i_X509_CRL, "d2i_X509_CRL");

   procedure X509_CRL_free (a : access OpenSSL.Low_Level.x509_h.X509_crl_st);  -- openssl/x509.h:833
   pragma Import (C, X509_CRL_free, "X509_CRL_free");

   function X509_CRL_new return access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/x509.h:833
   pragma Import (C, X509_CRL_new, "X509_CRL_new");

   function X509_CRL_add0_revoked (crl : access OpenSSL.Low_Level.x509_h.X509_crl_st; rev : access OpenSSL.Low_Level.x509_h.x509_revoked_st) return int;  -- openssl/x509.h:835
   pragma Import (C, X509_CRL_add0_revoked, "X509_CRL_add0_revoked");

   function X509_CRL_get0_by_serial
     (crl    : access OpenSSL.Low_Level.x509_h.X509_crl_st;
      ret    : System.Address;
      serial : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/x509.h:836
   pragma Import (C, X509_CRL_get0_by_serial, "X509_CRL_get0_by_serial");

   function X509_CRL_get0_by_cert
     (crl : access OpenSSL.Low_Level.x509_h.X509_crl_st;
      ret : System.Address;
      x   : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509.h:838
   pragma Import (C, X509_CRL_get0_by_cert, "X509_CRL_get0_by_cert");

   function X509_PKEY_new return access X509_PKEY;  -- openssl/x509.h:840
   pragma Import (C, X509_PKEY_new, "X509_PKEY_new");

   procedure X509_PKEY_free (a : access X509_PKEY);  -- openssl/x509.h:841
   pragma Import (C, X509_PKEY_free, "X509_PKEY_free");

   function i2d_X509_PKEY (a : access X509_PKEY; pp : System.Address) return int;  -- openssl/x509.h:842
   pragma Import (C, i2d_X509_PKEY, "i2d_X509_PKEY");

   function d2i_X509_PKEY
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access X509_PKEY;  -- openssl/x509.h:843
   pragma Import (C, d2i_X509_PKEY, "d2i_X509_PKEY");

   NETSCAPE_SPKI_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:845
   pragma Import (C, NETSCAPE_SPKI_it, "NETSCAPE_SPKI_it");

   function i2d_NETSCAPE_SPKI (a : access NETSCAPE_SPKI; c_out : System.Address) return int;  -- openssl/x509.h:845
   pragma Import (C, i2d_NETSCAPE_SPKI, "i2d_NETSCAPE_SPKI");

   function d2i_NETSCAPE_SPKI
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access NETSCAPE_SPKI;  -- openssl/x509.h:845
   pragma Import (C, d2i_NETSCAPE_SPKI, "d2i_NETSCAPE_SPKI");

   procedure NETSCAPE_SPKI_free (a : access NETSCAPE_SPKI);  -- openssl/x509.h:845
   pragma Import (C, NETSCAPE_SPKI_free, "NETSCAPE_SPKI_free");

   function NETSCAPE_SPKI_new return access NETSCAPE_SPKI;  -- openssl/x509.h:845
   pragma Import (C, NETSCAPE_SPKI_new, "NETSCAPE_SPKI_new");

   NETSCAPE_SPKAC_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:846
   pragma Import (C, NETSCAPE_SPKAC_it, "NETSCAPE_SPKAC_it");

   function i2d_NETSCAPE_SPKAC (a : access NETSCAPE_SPKAC; c_out : System.Address) return int;  -- openssl/x509.h:846
   pragma Import (C, i2d_NETSCAPE_SPKAC, "i2d_NETSCAPE_SPKAC");

   function d2i_NETSCAPE_SPKAC
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access NETSCAPE_SPKAC;  -- openssl/x509.h:846
   pragma Import (C, d2i_NETSCAPE_SPKAC, "d2i_NETSCAPE_SPKAC");

   procedure NETSCAPE_SPKAC_free (a : access NETSCAPE_SPKAC);  -- openssl/x509.h:846
   pragma Import (C, NETSCAPE_SPKAC_free, "NETSCAPE_SPKAC_free");

   function NETSCAPE_SPKAC_new return access NETSCAPE_SPKAC;  -- openssl/x509.h:846
   pragma Import (C, NETSCAPE_SPKAC_new, "NETSCAPE_SPKAC_new");

   NETSCAPE_CERT_SEQUENCE_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:847
   pragma Import (C, NETSCAPE_CERT_SEQUENCE_it, "NETSCAPE_CERT_SEQUENCE_it");

   function i2d_NETSCAPE_CERT_SEQUENCE (a : access NETSCAPE_CERT_SEQUENCE; c_out : System.Address) return int;  -- openssl/x509.h:847
   pragma Import (C, i2d_NETSCAPE_CERT_SEQUENCE, "i2d_NETSCAPE_CERT_SEQUENCE");

   function d2i_NETSCAPE_CERT_SEQUENCE
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access NETSCAPE_CERT_SEQUENCE;  -- openssl/x509.h:847
   pragma Import (C, d2i_NETSCAPE_CERT_SEQUENCE, "d2i_NETSCAPE_CERT_SEQUENCE");

   procedure NETSCAPE_CERT_SEQUENCE_free (a : access NETSCAPE_CERT_SEQUENCE);  -- openssl/x509.h:847
   pragma Import (C, NETSCAPE_CERT_SEQUENCE_free, "NETSCAPE_CERT_SEQUENCE_free");

   function NETSCAPE_CERT_SEQUENCE_new return access NETSCAPE_CERT_SEQUENCE;  -- openssl/x509.h:847
   pragma Import (C, NETSCAPE_CERT_SEQUENCE_new, "NETSCAPE_CERT_SEQUENCE_new");

   function X509_INFO_new return access X509_INFO;  -- openssl/x509.h:850
   pragma Import (C, X509_INFO_new, "X509_INFO_new");

   procedure X509_INFO_free (a : access X509_INFO);  -- openssl/x509.h:851
   pragma Import (C, X509_INFO_free, "X509_INFO_free");

   function X509_NAME_oneline
     (a    : access OpenSSL.Low_Level.x509_h.X509_name_st;
      buf  : Interfaces.C.Strings.chars_ptr;
      size : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:852
   pragma Import (C, X509_NAME_oneline, "X509_NAME_oneline");

   function ASN1_verify
     (i2d       : access function (arg1 : System.Address; arg2 : System.Address) return int;
      algor1    : access OpenSSL.Low_Level.x509_h.X509_algor_st;
      signature : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      data      : Interfaces.C.Strings.chars_ptr;
      pkey      : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:854
   pragma Import (C, ASN1_verify, "ASN1_verify");

   function ASN1_digest
     (i2d    : access function (arg1 : System.Address; arg2 : System.Address) return int;
      c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      data   : Interfaces.C.Strings.chars_ptr;
      md     : access unsigned_char;
      len    : access unsigned) return int;  -- openssl/x509.h:857
   pragma Import (C, ASN1_digest, "ASN1_digest");

   function ASN1_sign
     (i2d       : access function (arg1 : System.Address; arg2 : System.Address) return int;
      algor1    : access OpenSSL.Low_Level.x509_h.X509_algor_st;
      algor2    : access OpenSSL.Low_Level.x509_h.X509_algor_st;
      signature : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      data      : Interfaces.C.Strings.chars_ptr;
      pkey      : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      c_type    : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/x509.h:860
   pragma Import (C, ASN1_sign, "ASN1_sign");

   function ASN1_item_digest
     (it     : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM;
      c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      data   : System.Address;
      md     : access unsigned_char;
      len    : access unsigned) return int;  -- openssl/x509.h:864
   pragma Import (C, ASN1_item_digest, "ASN1_item_digest");

   function ASN1_item_verify
     (it        : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM;
      algor1    : access OpenSSL.Low_Level.x509_h.X509_algor_st;
      signature : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      data      : System.Address;
      pkey      : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:867
   pragma Import (C, ASN1_item_verify, "ASN1_item_verify");

   function ASN1_item_sign
     (it        : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM;
      algor1    : access OpenSSL.Low_Level.x509_h.X509_algor_st;
      algor2    : access OpenSSL.Low_Level.x509_h.X509_algor_st;
      signature : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      data      : System.Address;
      pkey      : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      c_type    : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/x509.h:870
   pragma Import (C, ASN1_item_sign, "ASN1_item_sign");

   function X509_set_version (x : access OpenSSL.Low_Level.x509_h.x509_st; version : long) return int;  -- openssl/x509.h:875
   pragma Import (C, X509_set_version, "X509_set_version");

   function X509_set_serialNumber (x : access OpenSSL.Low_Level.x509_h.x509_st; serial : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/x509.h:876
   pragma Import (C, X509_set_serialNumber, "X509_set_serialNumber");

   function X509_get_serialNumber (x : access OpenSSL.Low_Level.x509_h.x509_st) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:877
   pragma Import (C, X509_get_serialNumber, "X509_get_serialNumber");

   function X509_set_issuer_name (x : access OpenSSL.Low_Level.x509_h.x509_st; name : access OpenSSL.Low_Level.x509_h.X509_name_st) return int;  -- openssl/x509.h:878
   pragma Import (C, X509_set_issuer_name, "X509_set_issuer_name");

   function X509_get_issuer_name (a : access OpenSSL.Low_Level.x509_h.x509_st) return access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/x509.h:879
   pragma Import (C, X509_get_issuer_name, "X509_get_issuer_name");

   function X509_set_subject_name (x : access OpenSSL.Low_Level.x509_h.x509_st; name : access OpenSSL.Low_Level.x509_h.X509_name_st) return int;  -- openssl/x509.h:880
   pragma Import (C, X509_set_subject_name, "X509_set_subject_name");

   function X509_get_subject_name (a : access OpenSSL.Low_Level.x509_h.x509_st) return access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/x509.h:881
   pragma Import (C, X509_get_subject_name, "X509_get_subject_name");

   function X509_set_notBefore (x : access OpenSSL.Low_Level.x509_h.x509_st; tm : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/x509.h:882
   pragma Import (C, X509_set_notBefore, "X509_set_notBefore");

   function X509_set_notAfter (x : access OpenSSL.Low_Level.x509_h.x509_st; tm : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/x509.h:883
   pragma Import (C, X509_set_notAfter, "X509_set_notAfter");

   function X509_set_pubkey (x : access OpenSSL.Low_Level.x509_h.x509_st; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:884
   pragma Import (C, X509_set_pubkey, "X509_set_pubkey");

   function X509_get_pubkey (x : access OpenSSL.Low_Level.x509_h.x509_st) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509.h:885
   pragma Import (C, X509_get_pubkey, "X509_get_pubkey");

   function X509_get0_pubkey_bitstr (x : access constant OpenSSL.Low_Level.x509_h.x509_st) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:886
   pragma Import (C, X509_get0_pubkey_bitstr, "X509_get0_pubkey_bitstr");

   function X509_certificate_type (x : access OpenSSL.Low_Level.x509_h.x509_st; pubkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:887
   pragma Import (C, X509_certificate_type, "X509_certificate_type");

   function X509_REQ_set_version (x : access X509_REQ; version : long) return int;  -- openssl/x509.h:889
   pragma Import (C, X509_REQ_set_version, "X509_REQ_set_version");

   function X509_REQ_set_subject_name (req : access X509_REQ; name : access OpenSSL.Low_Level.x509_h.X509_name_st) return int;  -- openssl/x509.h:890
   pragma Import (C, X509_REQ_set_subject_name, "X509_REQ_set_subject_name");

   function X509_REQ_set_pubkey (x : access X509_REQ; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:891
   pragma Import (C, X509_REQ_set_pubkey, "X509_REQ_set_pubkey");

   function X509_REQ_get_pubkey (req : access X509_REQ) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509.h:892
   pragma Import (C, X509_REQ_get_pubkey, "X509_REQ_get_pubkey");

   function X509_REQ_extension_nid (nid : int) return int;  -- openssl/x509.h:893
   pragma Import (C, X509_REQ_extension_nid, "X509_REQ_extension_nid");

   function X509_REQ_get_extension_nids return access int;  -- openssl/x509.h:894
   pragma Import (C, X509_REQ_get_extension_nids, "X509_REQ_get_extension_nids");

   procedure X509_REQ_set_extension_nids (nids : access int);  -- openssl/x509.h:895
   pragma Import (C, X509_REQ_set_extension_nids, "X509_REQ_set_extension_nids");

   function X509_REQ_get_extensions (req : access X509_REQ) return access stack_st_X509_EXTENSION;  -- openssl/x509.h:896
   pragma Import (C, X509_REQ_get_extensions, "X509_REQ_get_extensions");

   function X509_REQ_add_extensions_nid
     (req  : access X509_REQ;
      exts : access stack_st_X509_EXTENSION;
      nid  : int) return int;  -- openssl/x509.h:897
   pragma Import (C, X509_REQ_add_extensions_nid, "X509_REQ_add_extensions_nid");

   function X509_REQ_add_extensions (req : access X509_REQ; exts : access stack_st_X509_EXTENSION) return int;  -- openssl/x509.h:899
   pragma Import (C, X509_REQ_add_extensions, "X509_REQ_add_extensions");

   function X509_REQ_get_attr_count (req : System.Address) return int;  -- openssl/x509.h:900
   pragma Import (C, X509_REQ_get_attr_count, "X509_REQ_get_attr_count");

   function X509_REQ_get_attr_by_NID
     (req     : System.Address;
      nid     : int;
      lastpos : int) return int;  -- openssl/x509.h:901
   pragma Import (C, X509_REQ_get_attr_by_NID, "X509_REQ_get_attr_by_NID");

   function X509_REQ_get_attr_by_OBJ
     (req     : System.Address;
      obj     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int) return int;  -- openssl/x509.h:903
   pragma Import (C, X509_REQ_get_attr_by_OBJ, "X509_REQ_get_attr_by_OBJ");

   function X509_REQ_get_attr (req : System.Address; loc : int) return access X509_ATTRIBUTE;  -- openssl/x509.h:905
   pragma Import (C, X509_REQ_get_attr, "X509_REQ_get_attr");

   function X509_REQ_delete_attr (req : access X509_REQ; loc : int) return access X509_ATTRIBUTE;  -- openssl/x509.h:906
   pragma Import (C, X509_REQ_delete_attr, "X509_REQ_delete_attr");

   function X509_REQ_add1_attr (req : access X509_REQ; attr : access X509_ATTRIBUTE) return int;  -- openssl/x509.h:907
   pragma Import (C, X509_REQ_add1_attr, "X509_REQ_add1_attr");

   function X509_REQ_add1_attr_by_OBJ
     (req    : access X509_REQ;
      obj    : access constant OpenSSL.Low_Level.asn1_h.asn1_object_st;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int) return int;  -- openssl/x509.h:908
   pragma Import (C, X509_REQ_add1_attr_by_OBJ, "X509_REQ_add1_attr_by_OBJ");

   function X509_REQ_add1_attr_by_NID
     (req    : access X509_REQ;
      nid    : int;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int) return int;  -- openssl/x509.h:911
   pragma Import (C, X509_REQ_add1_attr_by_NID, "X509_REQ_add1_attr_by_NID");

   function X509_REQ_add1_attr_by_txt
     (req      : access X509_REQ;
      attrname : Interfaces.C.Strings.chars_ptr;
      c_type   : int;
      bytes    : access unsigned_char;
      len      : int) return int;  -- openssl/x509.h:914
   pragma Import (C, X509_REQ_add1_attr_by_txt, "X509_REQ_add1_attr_by_txt");

   function X509_CRL_set_version (x : access OpenSSL.Low_Level.x509_h.X509_crl_st; version : long) return int;  -- openssl/x509.h:918
   pragma Import (C, X509_CRL_set_version, "X509_CRL_set_version");

   function X509_CRL_set_issuer_name (x : access OpenSSL.Low_Level.x509_h.X509_crl_st; name : access OpenSSL.Low_Level.x509_h.X509_name_st) return int;  -- openssl/x509.h:919
   pragma Import (C, X509_CRL_set_issuer_name, "X509_CRL_set_issuer_name");

   function X509_CRL_set_lastUpdate (x : access OpenSSL.Low_Level.x509_h.X509_crl_st; tm : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/x509.h:920
   pragma Import (C, X509_CRL_set_lastUpdate, "X509_CRL_set_lastUpdate");

   function X509_CRL_set_nextUpdate (x : access OpenSSL.Low_Level.x509_h.X509_crl_st; tm : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/x509.h:921
   pragma Import (C, X509_CRL_set_nextUpdate, "X509_CRL_set_nextUpdate");

   function X509_CRL_sort (crl : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509.h:922
   pragma Import (C, X509_CRL_sort, "X509_CRL_sort");

   function X509_REVOKED_set_serialNumber (x : access OpenSSL.Low_Level.x509_h.x509_revoked_st; serial : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/x509.h:924
   pragma Import (C, X509_REVOKED_set_serialNumber, "X509_REVOKED_set_serialNumber");

   function X509_REVOKED_set_revocationDate (r : access OpenSSL.Low_Level.x509_h.x509_revoked_st; tm : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/x509.h:925
   pragma Import (C, X509_REVOKED_set_revocationDate, "X509_REVOKED_set_revocationDate");

   function X509_REQ_check_private_key (x509 : access X509_REQ; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:927
   pragma Import (C, X509_REQ_check_private_key, "X509_REQ_check_private_key");

   function X509_check_private_key (the_x509 : access OpenSSL.Low_Level.x509_h.x509_st; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:929
   pragma Import (C, X509_check_private_key, "X509_check_private_key");

   function X509_issuer_and_serial_cmp (a : access constant OpenSSL.Low_Level.x509_h.x509_st; b : access constant OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509.h:931
   pragma Import (C, X509_issuer_and_serial_cmp, "X509_issuer_and_serial_cmp");

   function X509_issuer_and_serial_hash (a : access OpenSSL.Low_Level.x509_h.x509_st) return unsigned_long;  -- openssl/x509.h:932
   pragma Import (C, X509_issuer_and_serial_hash, "X509_issuer_and_serial_hash");

   function X509_issuer_name_cmp (a : access constant OpenSSL.Low_Level.x509_h.x509_st; b : access constant OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509.h:934
   pragma Import (C, X509_issuer_name_cmp, "X509_issuer_name_cmp");

   function X509_issuer_name_hash (a : access OpenSSL.Low_Level.x509_h.x509_st) return unsigned_long;  -- openssl/x509.h:935
   pragma Import (C, X509_issuer_name_hash, "X509_issuer_name_hash");

   function X509_subject_name_cmp (a : access constant OpenSSL.Low_Level.x509_h.x509_st; b : access constant OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509.h:937
   pragma Import (C, X509_subject_name_cmp, "X509_subject_name_cmp");

   function X509_subject_name_hash (x : access OpenSSL.Low_Level.x509_h.x509_st) return unsigned_long;  -- openssl/x509.h:938
   pragma Import (C, X509_subject_name_hash, "X509_subject_name_hash");

   function X509_issuer_name_hash_old (a : access OpenSSL.Low_Level.x509_h.x509_st) return unsigned_long;  -- openssl/x509.h:941
   pragma Import (C, X509_issuer_name_hash_old, "X509_issuer_name_hash_old");

   function X509_subject_name_hash_old (x : access OpenSSL.Low_Level.x509_h.x509_st) return unsigned_long;  -- openssl/x509.h:942
   pragma Import (C, X509_subject_name_hash_old, "X509_subject_name_hash_old");

   function X509_cmp (a : access constant OpenSSL.Low_Level.x509_h.x509_st; b : access constant OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509.h:945
   pragma Import (C, X509_cmp, "X509_cmp");

   function X509_NAME_cmp (a : access constant OpenSSL.Low_Level.x509_h.X509_name_st; b : access constant OpenSSL.Low_Level.x509_h.X509_name_st) return int;  -- openssl/x509.h:946
   pragma Import (C, X509_NAME_cmp, "X509_NAME_cmp");

   function X509_NAME_hash (x : access OpenSSL.Low_Level.x509_h.X509_name_st) return unsigned_long;  -- openssl/x509.h:947
   pragma Import (C, X509_NAME_hash, "X509_NAME_hash");

   function X509_NAME_hash_old (x : access OpenSSL.Low_Level.x509_h.X509_name_st) return unsigned_long;  -- openssl/x509.h:948
   pragma Import (C, X509_NAME_hash_old, "X509_NAME_hash_old");

   function X509_CRL_cmp (a : access constant OpenSSL.Low_Level.x509_h.X509_crl_st; b : access constant OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509.h:950
   pragma Import (C, X509_CRL_cmp, "X509_CRL_cmp");

   function X509_CRL_match (a : access constant OpenSSL.Low_Level.x509_h.X509_crl_st; b : access constant OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509.h:951
   pragma Import (C, X509_CRL_match, "X509_CRL_match");

   function X509_print_ex_fp
     (bp     : access Interfaces.C_Streams.FILEs;
      x      : access OpenSSL.Low_Level.x509_h.x509_st;
      nmflag : unsigned_long;
      cflag  : unsigned_long) return int;  -- openssl/x509.h:953
   pragma Import (C, X509_print_ex_fp, "X509_print_ex_fp");

   function X509_print_fp (bp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509.h:954
   pragma Import (C, X509_print_fp, "X509_print_fp");

   function X509_CRL_print_fp (bp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509.h:955
   pragma Import (C, X509_CRL_print_fp, "X509_CRL_print_fp");

   function X509_REQ_print_fp (bp : access Interfaces.C_Streams.FILEs; req : access X509_REQ) return int;  -- openssl/x509.h:956
   pragma Import (C, X509_REQ_print_fp, "X509_REQ_print_fp");

   function X509_NAME_print_ex_fp
     (fp     : access Interfaces.C_Streams.FILEs;
      nm     : access OpenSSL.Low_Level.x509_h.X509_name_st;
      indent : int;
      flags  : unsigned_long) return int;  -- openssl/x509.h:957
   pragma Import (C, X509_NAME_print_ex_fp, "X509_NAME_print_ex_fp");

   function X509_NAME_print
     (bp    : access OpenSSL.Low_Level.bio_h.bio_st;
      name  : access OpenSSL.Low_Level.x509_h.X509_name_st;
      obase : int) return int;  -- openssl/x509.h:961
   pragma Import (C, X509_NAME_print, "X509_NAME_print");

   function X509_NAME_print_ex
     (c_out  : access OpenSSL.Low_Level.bio_h.bio_st;
      nm     : access OpenSSL.Low_Level.x509_h.X509_name_st;
      indent : int;
      flags  : unsigned_long) return int;  -- openssl/x509.h:962
   pragma Import (C, X509_NAME_print_ex, "X509_NAME_print_ex");

   function X509_print_ex
     (bp     : access OpenSSL.Low_Level.bio_h.bio_st;
      x      : access OpenSSL.Low_Level.x509_h.x509_st;
      nmflag : unsigned_long;
      cflag  : unsigned_long) return int;  -- openssl/x509.h:963
   pragma Import (C, X509_print_ex, "X509_print_ex");

   function X509_print (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509.h:964
   pragma Import (C, X509_print, "X509_print");

   function X509_ocspid_print (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509.h:965
   pragma Import (C, X509_ocspid_print, "X509_ocspid_print");

   function X509_CERT_AUX_print
     (bp     : access OpenSSL.Low_Level.bio_h.bio_st;
      x      : access X509_CERT_AUX;
      indent : int) return int;  -- openssl/x509.h:966
   pragma Import (C, X509_CERT_AUX_print, "X509_CERT_AUX_print");

   function X509_CRL_print (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509.h:967
   pragma Import (C, X509_CRL_print, "X509_CRL_print");

   function X509_REQ_print_ex
     (bp     : access OpenSSL.Low_Level.bio_h.bio_st;
      x      : access X509_REQ;
      nmflag : unsigned_long;
      cflag  : unsigned_long) return int;  -- openssl/x509.h:968
   pragma Import (C, X509_REQ_print_ex, "X509_REQ_print_ex");

   function X509_REQ_print (bp : access OpenSSL.Low_Level.bio_h.bio_st; req : access X509_REQ) return int;  -- openssl/x509.h:969
   pragma Import (C, X509_REQ_print, "X509_REQ_print");

   function X509_NAME_entry_count (name : access OpenSSL.Low_Level.x509_h.X509_name_st) return int;  -- openssl/x509.h:972
   pragma Import (C, X509_NAME_entry_count, "X509_NAME_entry_count");

   function X509_NAME_get_text_by_NID
     (name : access OpenSSL.Low_Level.x509_h.X509_name_st;
      nid  : int;
      buf  : Interfaces.C.Strings.chars_ptr;
      len  : int) return int;  -- openssl/x509.h:973
   pragma Import (C, X509_NAME_get_text_by_NID, "X509_NAME_get_text_by_NID");

   function X509_NAME_get_text_by_OBJ
     (name : access OpenSSL.Low_Level.x509_h.X509_name_st;
      obj  : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      buf  : Interfaces.C.Strings.chars_ptr;
      len  : int) return int;  -- openssl/x509.h:975
   pragma Import (C, X509_NAME_get_text_by_OBJ, "X509_NAME_get_text_by_OBJ");

   function X509_NAME_get_index_by_NID
     (name    : access OpenSSL.Low_Level.x509_h.X509_name_st;
      nid     : int;
      lastpos : int) return int;  -- openssl/x509.h:980
   pragma Import (C, X509_NAME_get_index_by_NID, "X509_NAME_get_index_by_NID");

   function X509_NAME_get_index_by_OBJ
     (name    : access OpenSSL.Low_Level.x509_h.X509_name_st;
      obj     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int) return int;  -- openssl/x509.h:981
   pragma Import (C, X509_NAME_get_index_by_OBJ, "X509_NAME_get_index_by_OBJ");

   function X509_NAME_get_entry (name : access OpenSSL.Low_Level.x509_h.X509_name_st; loc : int) return access X509_NAME_ENTRY;  -- openssl/x509.h:983
   pragma Import (C, X509_NAME_get_entry, "X509_NAME_get_entry");

   function X509_NAME_delete_entry (name : access OpenSSL.Low_Level.x509_h.X509_name_st; loc : int) return access X509_NAME_ENTRY;  -- openssl/x509.h:984
   pragma Import (C, X509_NAME_delete_entry, "X509_NAME_delete_entry");

   function X509_NAME_add_entry
     (name : access OpenSSL.Low_Level.x509_h.X509_name_st;
      ne   : access X509_NAME_ENTRY;
      loc  : int;
      set  : int) return int;  -- openssl/x509.h:985
   pragma Import (C, X509_NAME_add_entry, "X509_NAME_add_entry");

   function X509_NAME_add_entry_by_OBJ
     (name   : access OpenSSL.Low_Level.x509_h.X509_name_st;
      obj    : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int;
      loc    : int;
      set    : int) return int;  -- openssl/x509.h:987
   pragma Import (C, X509_NAME_add_entry_by_OBJ, "X509_NAME_add_entry_by_OBJ");

   function X509_NAME_add_entry_by_NID
     (name   : access OpenSSL.Low_Level.x509_h.X509_name_st;
      nid    : int;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int;
      loc    : int;
      set    : int) return int;  -- openssl/x509.h:989
   pragma Import (C, X509_NAME_add_entry_by_NID, "X509_NAME_add_entry_by_NID");

   function X509_NAME_ENTRY_create_by_txt
     (ne     : System.Address;
      field  : Interfaces.C.Strings.chars_ptr;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int) return access X509_NAME_ENTRY;  -- openssl/x509.h:991
   pragma Import (C, X509_NAME_ENTRY_create_by_txt, "X509_NAME_ENTRY_create_by_txt");

   function X509_NAME_ENTRY_create_by_NID
     (ne     : System.Address;
      nid    : int;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int) return access X509_NAME_ENTRY;  -- openssl/x509.h:993
   pragma Import (C, X509_NAME_ENTRY_create_by_NID, "X509_NAME_ENTRY_create_by_NID");

   function X509_NAME_add_entry_by_txt
     (name   : access OpenSSL.Low_Level.x509_h.X509_name_st;
      field  : Interfaces.C.Strings.chars_ptr;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int;
      loc    : int;
      set    : int) return int;  -- openssl/x509.h:995
   pragma Import (C, X509_NAME_add_entry_by_txt, "X509_NAME_add_entry_by_txt");

   function X509_NAME_ENTRY_create_by_OBJ
     (ne     : System.Address;
      obj    : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int) return access X509_NAME_ENTRY;  -- openssl/x509.h:997
   pragma Import (C, X509_NAME_ENTRY_create_by_OBJ, "X509_NAME_ENTRY_create_by_OBJ");

   function X509_NAME_ENTRY_set_object (ne : access X509_NAME_ENTRY; obj : access OpenSSL.Low_Level.asn1_h.asn1_object_st) return int;  -- openssl/x509.h:1000
   pragma Import (C, X509_NAME_ENTRY_set_object, "X509_NAME_ENTRY_set_object");

   function X509_NAME_ENTRY_set_data
     (ne     : access X509_NAME_ENTRY;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int) return int;  -- openssl/x509.h:1002
   pragma Import (C, X509_NAME_ENTRY_set_data, "X509_NAME_ENTRY_set_data");

   function X509_NAME_ENTRY_get_object (ne : access X509_NAME_ENTRY) return access OpenSSL.Low_Level.asn1_h.asn1_object_st;  -- openssl/x509.h:1004
   pragma Import (C, X509_NAME_ENTRY_get_object, "X509_NAME_ENTRY_get_object");

   function X509_NAME_ENTRY_get_data (ne : access X509_NAME_ENTRY) return access OpenSSL.Low_Level.asn1_h.ASN1_STRING;  -- openssl/x509.h:1005
   pragma Import (C, X509_NAME_ENTRY_get_data, "X509_NAME_ENTRY_get_data");

   function X509v3_get_ext_count (x : access constant stack_st_X509_EXTENSION) return int;  -- openssl/x509.h:1007
   pragma Import (C, X509v3_get_ext_count, "X509v3_get_ext_count");

   function X509v3_get_ext_by_NID
     (x       : access constant stack_st_X509_EXTENSION;
      nid     : int;
      lastpos : int) return int;  -- openssl/x509.h:1008
   pragma Import (C, X509v3_get_ext_by_NID, "X509v3_get_ext_by_NID");

   function X509v3_get_ext_by_OBJ
     (x       : access constant stack_st_X509_EXTENSION;
      obj     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int) return int;  -- openssl/x509.h:1010
   pragma Import (C, X509v3_get_ext_by_OBJ, "X509v3_get_ext_by_OBJ");

   function X509v3_get_ext_by_critical
     (x       : access constant stack_st_X509_EXTENSION;
      crit    : int;
      lastpos : int) return int;  -- openssl/x509.h:1012
   pragma Import (C, X509v3_get_ext_by_critical, "X509v3_get_ext_by_critical");

   function X509v3_get_ext (x : access constant stack_st_X509_EXTENSION; loc : int) return access X509_EXTENSION;  -- openssl/x509.h:1014
   pragma Import (C, X509v3_get_ext, "X509v3_get_ext");

   function X509v3_delete_ext (x : access stack_st_X509_EXTENSION; loc : int) return access X509_EXTENSION;  -- openssl/x509.h:1015
   pragma Import (C, X509v3_delete_ext, "X509v3_delete_ext");

   function X509v3_add_ext
     (x   : System.Address;
      ex  : access X509_EXTENSION;
      loc : int) return access stack_st_X509_EXTENSION;  -- openssl/x509.h:1016
   pragma Import (C, X509v3_add_ext, "X509v3_add_ext");

   function X509_get_ext_count (x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509.h:1019
   pragma Import (C, X509_get_ext_count, "X509_get_ext_count");

   function X509_get_ext_by_NID
     (x       : access OpenSSL.Low_Level.x509_h.x509_st;
      nid     : int;
      lastpos : int) return int;  -- openssl/x509.h:1020
   pragma Import (C, X509_get_ext_by_NID, "X509_get_ext_by_NID");

   function X509_get_ext_by_OBJ
     (x       : access OpenSSL.Low_Level.x509_h.x509_st;
      obj     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int) return int;  -- openssl/x509.h:1021
   pragma Import (C, X509_get_ext_by_OBJ, "X509_get_ext_by_OBJ");

   function X509_get_ext_by_critical
     (x       : access OpenSSL.Low_Level.x509_h.x509_st;
      crit    : int;
      lastpos : int) return int;  -- openssl/x509.h:1022
   pragma Import (C, X509_get_ext_by_critical, "X509_get_ext_by_critical");

   function X509_get_ext (x : access OpenSSL.Low_Level.x509_h.x509_st; loc : int) return access X509_EXTENSION;  -- openssl/x509.h:1023
   pragma Import (C, X509_get_ext, "X509_get_ext");

   function X509_delete_ext (x : access OpenSSL.Low_Level.x509_h.x509_st; loc : int) return access X509_EXTENSION;  -- openssl/x509.h:1024
   pragma Import (C, X509_delete_ext, "X509_delete_ext");

   function X509_add_ext
     (x   : access OpenSSL.Low_Level.x509_h.x509_st;
      ex  : access X509_EXTENSION;
      loc : int) return int;  -- openssl/x509.h:1025
   pragma Import (C, X509_add_ext, "X509_add_ext");

   function X509_get_ext_d2i
     (x    : access OpenSSL.Low_Level.x509_h.x509_st;
      nid  : int;
      crit : access int;
      idx  : access int) return System.Address;  -- openssl/x509.h:1026
   pragma Import (C, X509_get_ext_d2i, "X509_get_ext_d2i");

   function X509_add1_ext_i2d
     (x     : access OpenSSL.Low_Level.x509_h.x509_st;
      nid   : int;
      value : System.Address;
      crit  : int;
      flags : unsigned_long) return int;  -- openssl/x509.h:1027
   pragma Import (C, X509_add1_ext_i2d, "X509_add1_ext_i2d");

   function X509_CRL_get_ext_count (x : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509.h:1030
   pragma Import (C, X509_CRL_get_ext_count, "X509_CRL_get_ext_count");

   function X509_CRL_get_ext_by_NID
     (x       : access OpenSSL.Low_Level.x509_h.X509_crl_st;
      nid     : int;
      lastpos : int) return int;  -- openssl/x509.h:1031
   pragma Import (C, X509_CRL_get_ext_by_NID, "X509_CRL_get_ext_by_NID");

   function X509_CRL_get_ext_by_OBJ
     (x       : access OpenSSL.Low_Level.x509_h.X509_crl_st;
      obj     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int) return int;  -- openssl/x509.h:1032
   pragma Import (C, X509_CRL_get_ext_by_OBJ, "X509_CRL_get_ext_by_OBJ");

   function X509_CRL_get_ext_by_critical
     (x       : access OpenSSL.Low_Level.x509_h.X509_crl_st;
      crit    : int;
      lastpos : int) return int;  -- openssl/x509.h:1033
   pragma Import (C, X509_CRL_get_ext_by_critical, "X509_CRL_get_ext_by_critical");

   function X509_CRL_get_ext (x : access OpenSSL.Low_Level.x509_h.X509_crl_st; loc : int) return access X509_EXTENSION;  -- openssl/x509.h:1034
   pragma Import (C, X509_CRL_get_ext, "X509_CRL_get_ext");

   function X509_CRL_delete_ext (x : access OpenSSL.Low_Level.x509_h.X509_crl_st; loc : int) return access X509_EXTENSION;  -- openssl/x509.h:1035
   pragma Import (C, X509_CRL_delete_ext, "X509_CRL_delete_ext");

   function X509_CRL_add_ext
     (x   : access OpenSSL.Low_Level.x509_h.X509_crl_st;
      ex  : access X509_EXTENSION;
      loc : int) return int;  -- openssl/x509.h:1036
   pragma Import (C, X509_CRL_add_ext, "X509_CRL_add_ext");

   function X509_CRL_get_ext_d2i
     (x    : access OpenSSL.Low_Level.x509_h.X509_crl_st;
      nid  : int;
      crit : access int;
      idx  : access int) return System.Address;  -- openssl/x509.h:1037
   pragma Import (C, X509_CRL_get_ext_d2i, "X509_CRL_get_ext_d2i");

   function X509_CRL_add1_ext_i2d
     (x     : access OpenSSL.Low_Level.x509_h.X509_crl_st;
      nid   : int;
      value : System.Address;
      crit  : int;
      flags : unsigned_long) return int;  -- openssl/x509.h:1038
   pragma Import (C, X509_CRL_add1_ext_i2d, "X509_CRL_add1_ext_i2d");

   function X509_REVOKED_get_ext_count (x : access OpenSSL.Low_Level.x509_h.x509_revoked_st) return int;  -- openssl/x509.h:1041
   pragma Import (C, X509_REVOKED_get_ext_count, "X509_REVOKED_get_ext_count");

   function X509_REVOKED_get_ext_by_NID
     (x       : access OpenSSL.Low_Level.x509_h.x509_revoked_st;
      nid     : int;
      lastpos : int) return int;  -- openssl/x509.h:1042
   pragma Import (C, X509_REVOKED_get_ext_by_NID, "X509_REVOKED_get_ext_by_NID");

   function X509_REVOKED_get_ext_by_OBJ
     (x       : access OpenSSL.Low_Level.x509_h.x509_revoked_st;
      obj     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int) return int;  -- openssl/x509.h:1043
   pragma Import (C, X509_REVOKED_get_ext_by_OBJ, "X509_REVOKED_get_ext_by_OBJ");

   function X509_REVOKED_get_ext_by_critical
     (x       : access OpenSSL.Low_Level.x509_h.x509_revoked_st;
      crit    : int;
      lastpos : int) return int;  -- openssl/x509.h:1044
   pragma Import (C, X509_REVOKED_get_ext_by_critical, "X509_REVOKED_get_ext_by_critical");

   function X509_REVOKED_get_ext (x : access OpenSSL.Low_Level.x509_h.x509_revoked_st; loc : int) return access X509_EXTENSION;  -- openssl/x509.h:1045
   pragma Import (C, X509_REVOKED_get_ext, "X509_REVOKED_get_ext");

   function X509_REVOKED_delete_ext (x : access OpenSSL.Low_Level.x509_h.x509_revoked_st; loc : int) return access X509_EXTENSION;  -- openssl/x509.h:1046
   pragma Import (C, X509_REVOKED_delete_ext, "X509_REVOKED_delete_ext");

   function X509_REVOKED_add_ext
     (x   : access OpenSSL.Low_Level.x509_h.x509_revoked_st;
      ex  : access X509_EXTENSION;
      loc : int) return int;  -- openssl/x509.h:1047
   pragma Import (C, X509_REVOKED_add_ext, "X509_REVOKED_add_ext");

   function X509_REVOKED_get_ext_d2i
     (x    : access OpenSSL.Low_Level.x509_h.x509_revoked_st;
      nid  : int;
      crit : access int;
      idx  : access int) return System.Address;  -- openssl/x509.h:1048
   pragma Import (C, X509_REVOKED_get_ext_d2i, "X509_REVOKED_get_ext_d2i");

   function X509_REVOKED_add1_ext_i2d
     (x     : access OpenSSL.Low_Level.x509_h.x509_revoked_st;
      nid   : int;
      value : System.Address;
      crit  : int;
      flags : unsigned_long) return int;  -- openssl/x509.h:1049
   pragma Import (C, X509_REVOKED_add1_ext_i2d, "X509_REVOKED_add1_ext_i2d");

   function X509_EXTENSION_create_by_NID
     (ex   : System.Address;
      nid  : int;
      crit : int;
      data : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return access X509_EXTENSION;  -- openssl/x509.h:1052
   pragma Import (C, X509_EXTENSION_create_by_NID, "X509_EXTENSION_create_by_NID");

   function X509_EXTENSION_create_by_OBJ
     (ex   : System.Address;
      obj  : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      crit : int;
      data : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return access X509_EXTENSION;  -- openssl/x509.h:1054
   pragma Import (C, X509_EXTENSION_create_by_OBJ, "X509_EXTENSION_create_by_OBJ");

   function X509_EXTENSION_set_object (ex : access X509_EXTENSION; obj : access OpenSSL.Low_Level.asn1_h.asn1_object_st) return int;  -- openssl/x509.h:1056
   pragma Import (C, X509_EXTENSION_set_object, "X509_EXTENSION_set_object");

   function X509_EXTENSION_set_critical (ex : access X509_EXTENSION; crit : int) return int;  -- openssl/x509.h:1057
   pragma Import (C, X509_EXTENSION_set_critical, "X509_EXTENSION_set_critical");

   function X509_EXTENSION_set_data (ex : access X509_EXTENSION; data : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/x509.h:1058
   pragma Import (C, X509_EXTENSION_set_data, "X509_EXTENSION_set_data");

   function X509_EXTENSION_get_object (ex : access X509_EXTENSION) return access OpenSSL.Low_Level.asn1_h.asn1_object_st;  -- openssl/x509.h:1060
   pragma Import (C, X509_EXTENSION_get_object, "X509_EXTENSION_get_object");

   function X509_EXTENSION_get_data (ne : access X509_EXTENSION) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/x509.h:1061
   pragma Import (C, X509_EXTENSION_get_data, "X509_EXTENSION_get_data");

   function X509_EXTENSION_get_critical (ex : access X509_EXTENSION) return int;  -- openssl/x509.h:1062
   pragma Import (C, X509_EXTENSION_get_critical, "X509_EXTENSION_get_critical");

   function X509at_get_attr_count (x : access constant stack_st_X509_ATTRIBUTE) return int;  -- openssl/x509.h:1064
   pragma Import (C, X509at_get_attr_count, "X509at_get_attr_count");

   function X509at_get_attr_by_NID
     (x       : access constant stack_st_X509_ATTRIBUTE;
      nid     : int;
      lastpos : int) return int;  -- openssl/x509.h:1065
   pragma Import (C, X509at_get_attr_by_NID, "X509at_get_attr_by_NID");

   function X509at_get_attr_by_OBJ
     (sk      : access constant stack_st_X509_ATTRIBUTE;
      obj     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int) return int;  -- openssl/x509.h:1067
   pragma Import (C, X509at_get_attr_by_OBJ, "X509at_get_attr_by_OBJ");

   function X509at_get_attr (x : access constant stack_st_X509_ATTRIBUTE; loc : int) return access X509_ATTRIBUTE;  -- openssl/x509.h:1069
   pragma Import (C, X509at_get_attr, "X509at_get_attr");

   function X509at_delete_attr (x : access stack_st_X509_ATTRIBUTE; loc : int) return access X509_ATTRIBUTE;  -- openssl/x509.h:1070
   pragma Import (C, X509at_delete_attr, "X509at_delete_attr");

   function X509at_add1_attr (x : System.Address; attr : access X509_ATTRIBUTE) return access stack_st_X509_ATTRIBUTE;  -- openssl/x509.h:1071
   pragma Import (C, X509at_add1_attr, "X509at_add1_attr");

   function X509at_add1_attr_by_OBJ
     (x      : System.Address;
      obj    : access constant OpenSSL.Low_Level.asn1_h.asn1_object_st;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int) return access stack_st_X509_ATTRIBUTE;  -- openssl/x509.h:1073
   pragma Import (C, X509at_add1_attr_by_OBJ, "X509at_add1_attr_by_OBJ");

   function X509at_add1_attr_by_NID
     (x      : System.Address;
      nid    : int;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int) return access stack_st_X509_ATTRIBUTE;  -- openssl/x509.h:1076
   pragma Import (C, X509at_add1_attr_by_NID, "X509at_add1_attr_by_NID");

   function X509at_add1_attr_by_txt
     (x        : System.Address;
      attrname : Interfaces.C.Strings.chars_ptr;
      c_type   : int;
      bytes    : access unsigned_char;
      len      : int) return access stack_st_X509_ATTRIBUTE;  -- openssl/x509.h:1079
   pragma Import (C, X509at_add1_attr_by_txt, "X509at_add1_attr_by_txt");

   function X509at_get0_data_by_OBJ
     (x       : access stack_st_X509_ATTRIBUTE;
      obj     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int;
      c_type  : int) return System.Address;  -- openssl/x509.h:1082
   pragma Import (C, X509at_get0_data_by_OBJ, "X509at_get0_data_by_OBJ");

   function X509_ATTRIBUTE_create_by_NID
     (attr    : System.Address;
      nid     : int;
      atrtype : int;
      data    : System.Address;
      len     : int) return access X509_ATTRIBUTE;  -- openssl/x509.h:1084
   pragma Import (C, X509_ATTRIBUTE_create_by_NID, "X509_ATTRIBUTE_create_by_NID");

   function X509_ATTRIBUTE_create_by_OBJ
     (attr    : System.Address;
      obj     : access constant OpenSSL.Low_Level.asn1_h.asn1_object_st;
      atrtype : int;
      data    : System.Address;
      len     : int) return access X509_ATTRIBUTE;  -- openssl/x509.h:1086
   pragma Import (C, X509_ATTRIBUTE_create_by_OBJ, "X509_ATTRIBUTE_create_by_OBJ");

   function X509_ATTRIBUTE_create_by_txt
     (attr    : System.Address;
      atrname : Interfaces.C.Strings.chars_ptr;
      c_type  : int;
      bytes   : access unsigned_char;
      len     : int) return access X509_ATTRIBUTE;  -- openssl/x509.h:1088
   pragma Import (C, X509_ATTRIBUTE_create_by_txt, "X509_ATTRIBUTE_create_by_txt");

   function X509_ATTRIBUTE_set1_object (attr : access X509_ATTRIBUTE; obj : access constant OpenSSL.Low_Level.asn1_h.asn1_object_st) return int;  -- openssl/x509.h:1090
   pragma Import (C, X509_ATTRIBUTE_set1_object, "X509_ATTRIBUTE_set1_object");

   function X509_ATTRIBUTE_set1_data
     (attr     : access X509_ATTRIBUTE;
      attrtype : int;
      data     : System.Address;
      len      : int) return int;  -- openssl/x509.h:1091
   pragma Import (C, X509_ATTRIBUTE_set1_data, "X509_ATTRIBUTE_set1_data");

   function X509_ATTRIBUTE_get0_data
     (attr    : access X509_ATTRIBUTE;
      idx     : int;
      atrtype : int;
      data    : System.Address) return System.Address;  -- openssl/x509.h:1092
   pragma Import (C, X509_ATTRIBUTE_get0_data, "X509_ATTRIBUTE_get0_data");

   function X509_ATTRIBUTE_count (attr : access X509_ATTRIBUTE) return int;  -- openssl/x509.h:1094
   pragma Import (C, X509_ATTRIBUTE_count, "X509_ATTRIBUTE_count");

   function X509_ATTRIBUTE_get0_object (attr : access X509_ATTRIBUTE) return access OpenSSL.Low_Level.asn1_h.asn1_object_st;  -- openssl/x509.h:1095
   pragma Import (C, X509_ATTRIBUTE_get0_object, "X509_ATTRIBUTE_get0_object");

   function X509_ATTRIBUTE_get0_type (attr : access X509_ATTRIBUTE; idx : int) return access OpenSSL.Low_Level.asn1_h.asn1_type_st;  -- openssl/x509.h:1096
   pragma Import (C, X509_ATTRIBUTE_get0_type, "X509_ATTRIBUTE_get0_type");

   function EVP_PKEY_get_attr_count (key : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/x509.h:1098
   pragma Import (C, EVP_PKEY_get_attr_count, "EVP_PKEY_get_attr_count");

   function EVP_PKEY_get_attr_by_NID
     (key     : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st;
      nid     : int;
      lastpos : int) return int;  -- openssl/x509.h:1099
   pragma Import (C, EVP_PKEY_get_attr_by_NID, "EVP_PKEY_get_attr_by_NID");

   function EVP_PKEY_get_attr_by_OBJ
     (key     : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st;
      obj     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int) return int;  -- openssl/x509.h:1101
   pragma Import (C, EVP_PKEY_get_attr_by_OBJ, "EVP_PKEY_get_attr_by_OBJ");

   function EVP_PKEY_get_attr (key : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st; loc : int) return access X509_ATTRIBUTE;  -- openssl/x509.h:1103
   pragma Import (C, EVP_PKEY_get_attr, "EVP_PKEY_get_attr");

   function EVP_PKEY_delete_attr (key : access OpenSSL.Low_Level.evp_h.evp_pkey_st; loc : int) return access X509_ATTRIBUTE;  -- openssl/x509.h:1104
   pragma Import (C, EVP_PKEY_delete_attr, "EVP_PKEY_delete_attr");

   function EVP_PKEY_add1_attr (key : access OpenSSL.Low_Level.evp_h.evp_pkey_st; attr : access X509_ATTRIBUTE) return int;  -- openssl/x509.h:1105
   pragma Import (C, EVP_PKEY_add1_attr, "EVP_PKEY_add1_attr");

   function EVP_PKEY_add1_attr_by_OBJ
     (key    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      obj    : access constant OpenSSL.Low_Level.asn1_h.asn1_object_st;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int) return int;  -- openssl/x509.h:1106
   pragma Import (C, EVP_PKEY_add1_attr_by_OBJ, "EVP_PKEY_add1_attr_by_OBJ");

   function EVP_PKEY_add1_attr_by_NID
     (key    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      nid    : int;
      c_type : int;
      bytes  : access unsigned_char;
      len    : int) return int;  -- openssl/x509.h:1109
   pragma Import (C, EVP_PKEY_add1_attr_by_NID, "EVP_PKEY_add1_attr_by_NID");

   function EVP_PKEY_add1_attr_by_txt
     (key      : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      attrname : Interfaces.C.Strings.chars_ptr;
      c_type   : int;
      bytes    : access unsigned_char;
      len      : int) return int;  -- openssl/x509.h:1112
   pragma Import (C, EVP_PKEY_add1_attr_by_txt, "EVP_PKEY_add1_attr_by_txt");

   function X509_verify_cert (ctx : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st) return int;  -- openssl/x509.h:1116
   pragma Import (C, X509_verify_cert, "X509_verify_cert");

   function X509_find_by_issuer_and_serial
     (sk     : access stack_st_X509;
      name   : access OpenSSL.Low_Level.x509_h.X509_name_st;
      serial : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509.h:1119
   pragma Import (C, X509_find_by_issuer_and_serial, "X509_find_by_issuer_and_serial");

   function X509_find_by_subject (sk : access stack_st_X509; name : access OpenSSL.Low_Level.x509_h.X509_name_st) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509.h:1121
   pragma Import (C, X509_find_by_subject, "X509_find_by_subject");

   PBEPARAM_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:1123
   pragma Import (C, PBEPARAM_it, "PBEPARAM_it");

   function i2d_PBEPARAM (a : access PBEPARAM; c_out : System.Address) return int;  -- openssl/x509.h:1123
   pragma Import (C, i2d_PBEPARAM, "i2d_PBEPARAM");

   function d2i_PBEPARAM
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PBEPARAM;  -- openssl/x509.h:1123
   pragma Import (C, d2i_PBEPARAM, "d2i_PBEPARAM");

   procedure PBEPARAM_free (a : access PBEPARAM);  -- openssl/x509.h:1123
   pragma Import (C, PBEPARAM_free, "PBEPARAM_free");

   function PBEPARAM_new return access PBEPARAM;  -- openssl/x509.h:1123
   pragma Import (C, PBEPARAM_new, "PBEPARAM_new");

   PBE2PARAM_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:1124
   pragma Import (C, PBE2PARAM_it, "PBE2PARAM_it");

   function i2d_PBE2PARAM (a : access PBE2PARAM; c_out : System.Address) return int;  -- openssl/x509.h:1124
   pragma Import (C, i2d_PBE2PARAM, "i2d_PBE2PARAM");

   function d2i_PBE2PARAM
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PBE2PARAM;  -- openssl/x509.h:1124
   pragma Import (C, d2i_PBE2PARAM, "d2i_PBE2PARAM");

   procedure PBE2PARAM_free (a : access PBE2PARAM);  -- openssl/x509.h:1124
   pragma Import (C, PBE2PARAM_free, "PBE2PARAM_free");

   function PBE2PARAM_new return access PBE2PARAM;  -- openssl/x509.h:1124
   pragma Import (C, PBE2PARAM_new, "PBE2PARAM_new");

   PBKDF2PARAM_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:1125
   pragma Import (C, PBKDF2PARAM_it, "PBKDF2PARAM_it");

   function i2d_PBKDF2PARAM (a : access PBKDF2PARAM; c_out : System.Address) return int;  -- openssl/x509.h:1125
   pragma Import (C, i2d_PBKDF2PARAM, "i2d_PBKDF2PARAM");

   function d2i_PBKDF2PARAM
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PBKDF2PARAM;  -- openssl/x509.h:1125
   pragma Import (C, d2i_PBKDF2PARAM, "d2i_PBKDF2PARAM");

   procedure PBKDF2PARAM_free (a : access PBKDF2PARAM);  -- openssl/x509.h:1125
   pragma Import (C, PBKDF2PARAM_free, "PBKDF2PARAM_free");

   function PBKDF2PARAM_new return access PBKDF2PARAM;  -- openssl/x509.h:1125
   pragma Import (C, PBKDF2PARAM_new, "PBKDF2PARAM_new");

   function PKCS5_pbe_set0_algor
     (algor   : access OpenSSL.Low_Level.x509_h.X509_algor_st;
      alg     : int;
      iter    : int;
      salt    : access unsigned_char;
      saltlen : int) return int;  -- openssl/x509.h:1127
   pragma Import (C, PKCS5_pbe_set0_algor, "PKCS5_pbe_set0_algor");

   function PKCS5_pbe_set
     (alg     : int;
      iter    : int;
      salt    : access unsigned_char;
      saltlen : int) return access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:1130
   pragma Import (C, PKCS5_pbe_set, "PKCS5_pbe_set");

   function PKCS5_pbe2_set
     (cipher  : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      iter    : int;
      salt    : access unsigned_char;
      saltlen : int) return access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:1132
   pragma Import (C, PKCS5_pbe2_set, "PKCS5_pbe2_set");

   function PKCS5_pbe2_set_iv
     (cipher  : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      iter    : int;
      salt    : access unsigned_char;
      saltlen : int;
      aiv     : access unsigned_char;
      prf_nid : int) return access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/x509.h:1134
   pragma Import (C, PKCS5_pbe2_set_iv, "PKCS5_pbe2_set_iv");

   PKCS8_PRIV_KEY_INFO_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/x509.h:1140
   pragma Import (C, PKCS8_PRIV_KEY_INFO_it, "PKCS8_PRIV_KEY_INFO_it");

   function i2d_PKCS8_PRIV_KEY_INFO (a : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st; c_out : System.Address) return int;  -- openssl/x509.h:1140
   pragma Import (C, i2d_PKCS8_PRIV_KEY_INFO, "i2d_PKCS8_PRIV_KEY_INFO");

   function d2i_PKCS8_PRIV_KEY_INFO
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;  -- openssl/x509.h:1140
   pragma Import (C, d2i_PKCS8_PRIV_KEY_INFO, "d2i_PKCS8_PRIV_KEY_INFO");

   procedure PKCS8_PRIV_KEY_INFO_free (a : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st);  -- openssl/x509.h:1140
   pragma Import (C, PKCS8_PRIV_KEY_INFO_free, "PKCS8_PRIV_KEY_INFO_free");

   function PKCS8_PRIV_KEY_INFO_new return access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;  -- openssl/x509.h:1140
   pragma Import (C, PKCS8_PRIV_KEY_INFO_new, "PKCS8_PRIV_KEY_INFO_new");

   function EVP_PKCS82PKEY (p8 : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/x509.h:1142
   pragma Import (C, EVP_PKCS82PKEY, "EVP_PKCS82PKEY");

   function EVP_PKEY2PKCS8 (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;  -- openssl/x509.h:1143
   pragma Import (C, EVP_PKEY2PKCS8, "EVP_PKEY2PKCS8");

   function EVP_PKEY2PKCS8_broken (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st; broken : int) return access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;  -- openssl/x509.h:1144
   pragma Import (C, EVP_PKEY2PKCS8_broken, "EVP_PKEY2PKCS8_broken");

   function PKCS8_set_broken (p8 : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st; broken : int) return access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;  -- openssl/x509.h:1145
   pragma Import (C, PKCS8_set_broken, "PKCS8_set_broken");

   function PKCS8_pkey_set0
     (priv    : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;
      aobj    : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      version : int;
      ptype   : int;
      pval    : System.Address;
      penc    : access unsigned_char;
      penclen : int) return int;  -- openssl/x509.h:1147
   pragma Import (C, PKCS8_pkey_set0, "PKCS8_pkey_set0");

   function PKCS8_pkey_get0
     (ppkalg : System.Address;
      pk     : System.Address;
      ppklen : access int;
      pa     : System.Address;
      p8     : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st) return int;  -- openssl/x509.h:1150
   pragma Import (C, PKCS8_pkey_get0, "PKCS8_pkey_get0");

   function X509_PUBKEY_set0_param
     (pub     : access OpenSSL.Low_Level.x509_h.X509_pubkey_st;
      aobj    : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      ptype   : int;
      pval    : System.Address;
      penc    : access unsigned_char;
      penclen : int) return int;  -- openssl/x509.h:1155
   pragma Import (C, X509_PUBKEY_set0_param, "X509_PUBKEY_set0_param");

   function X509_PUBKEY_get0_param
     (ppkalg : System.Address;
      pk     : System.Address;
      ppklen : access int;
      pa     : System.Address;
      pub    : access OpenSSL.Low_Level.x509_h.X509_pubkey_st) return int;  -- openssl/x509.h:1158
   pragma Import (C, X509_PUBKEY_get0_param, "X509_PUBKEY_get0_param");

   function X509_check_trust
     (x     : access OpenSSL.Low_Level.x509_h.x509_st;
      id    : int;
      flags : int) return int;  -- openssl/x509.h:1163
   pragma Import (C, X509_check_trust, "X509_check_trust");

   function X509_TRUST_get_count return int;  -- openssl/x509.h:1164
   pragma Import (C, X509_TRUST_get_count, "X509_TRUST_get_count");

   function X509_TRUST_get0 (idx : int) return access X509_TRUST;  -- openssl/x509.h:1165
   pragma Import (C, X509_TRUST_get0, "X509_TRUST_get0");

   function X509_TRUST_get_by_id (id : int) return int;  -- openssl/x509.h:1166
   pragma Import (C, X509_TRUST_get_by_id, "X509_TRUST_get_by_id");

   function X509_TRUST_add
     (id    : int;
      flags : int;
      ck    : access function
        (arg1 : access X509_TRUST;
         arg2 : access OpenSSL.Low_Level.x509_h.x509_st;
         arg3 : int) return int;
      name  : Interfaces.C.Strings.chars_ptr;
      arg1  : int;
      arg2  : System.Address) return int;  -- openssl/x509.h:1167
   pragma Import (C, X509_TRUST_add, "X509_TRUST_add");

   procedure X509_TRUST_cleanup;  -- openssl/x509.h:1169
   pragma Import (C, X509_TRUST_cleanup, "X509_TRUST_cleanup");

   function X509_TRUST_get_flags (xp : access X509_TRUST) return int;  -- openssl/x509.h:1170
   pragma Import (C, X509_TRUST_get_flags, "X509_TRUST_get_flags");

   function X509_TRUST_get0_name (xp : access X509_TRUST) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509.h:1171
   pragma Import (C, X509_TRUST_get0_name, "X509_TRUST_get0_name");

   function X509_TRUST_get_trust (xp : access X509_TRUST) return int;  -- openssl/x509.h:1172
   pragma Import (C, X509_TRUST_get_trust, "X509_TRUST_get_trust");

   procedure ERR_load_X509_strings;  -- openssl/x509.h:1178
   pragma Import (C, ERR_load_X509_strings, "ERR_load_X509_strings");

end OpenSSL.Low_Level.x509_h;
