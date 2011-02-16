with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
limited with OpenSSL.Low_Level.rsa_h;
limited with OpenSSL.Low_Level.dsa_h;
limited with OpenSSL.Low_Level.dh_h;
with System;
limited with OpenSSL.Low_Level.x509_h;
--  with stddef_h;
--  limited --  with OpenSSL.Low_Level.ossl_typ_h;
limited with OpenSSL.Low_Level.asn1_h;
limited with OpenSSL.Low_Level.bio_h;

package OpenSSL.Low_Level.evp_h is


   EVP_MAX_MD_SIZE : constant := 64;  --  openssl/evp.h:89
   EVP_MAX_KEY_LENGTH : constant := 32;  --  openssl/evp.h:90
   EVP_MAX_IV_LENGTH : constant := 16;  --  openssl/evp.h:91
   EVP_MAX_BLOCK_LENGTH : constant := 32;  --  openssl/evp.h:92

   PKCS5_SALT_LEN : constant := 8;  --  openssl/evp.h:94

   PKCS5_DEFAULT_ITER : constant := 2048;  --  openssl/evp.h:96

   EVP_PK_RSA : constant := 16#0001#;  --  openssl/evp.h:100
   EVP_PK_DSA : constant := 16#0002#;  --  openssl/evp.h:101
   EVP_PK_DH : constant := 16#0004#;  --  openssl/evp.h:102
   EVP_PK_EC : constant := 16#0008#;  --  openssl/evp.h:103
   EVP_PKT_SIGN : constant := 16#0010#;  --  openssl/evp.h:104
   EVP_PKT_ENC : constant := 16#0020#;  --  openssl/evp.h:105
   EVP_PKT_EXCH : constant := 16#0040#;  --  openssl/evp.h:106
   EVP_PKS_RSA : constant := 16#0100#;  --  openssl/evp.h:107
   EVP_PKS_DSA : constant := 16#0200#;  --  openssl/evp.h:108
   EVP_PKS_EC : constant := 16#0400#;  --  openssl/evp.h:109
   EVP_PKT_EXP : constant := 16#1000#;  --  openssl/evp.h:110
   --  unsupported macro: EVP_PKEY_NONE NID_undef
   --  unsupported macro: EVP_PKEY_RSA NID_rsaEncryption
   --  unsupported macro: EVP_PKEY_RSA2 NID_rsa
   --  unsupported macro: EVP_PKEY_DSA NID_dsa
   --  unsupported macro: EVP_PKEY_DSA1 NID_dsa_2
   --  unsupported macro: EVP_PKEY_DSA2 NID_dsaWithSHA
   --  unsupported macro: EVP_PKEY_DSA3 NID_dsaWithSHA1
   --  unsupported macro: EVP_PKEY_DSA4 NID_dsaWithSHA1_2
   --  unsupported macro: EVP_PKEY_DH NID_dhKeyAgreement
   --  unsupported macro: EVP_PKEY_EC NID_X9_62_id_ecPublicKey
   --  unsupported macro: EVP_PKEY_HMAC NID_hmac

   EVP_PKEY_MO_SIGN : constant := 16#0001#;  --  openssl/evp.h:154
   EVP_PKEY_MO_VERIFY : constant := 16#0002#;  --  openssl/evp.h:155
   EVP_PKEY_MO_ENCRYPT : constant := 16#0004#;  --  openssl/evp.h:156
   EVP_PKEY_MO_DECRYPT : constant := 16#0008#;  --  openssl/evp.h:157

   EVP_MD_FLAG_ONESHOT : constant := 16#0001#;  --  openssl/evp.h:192

   EVP_MD_FLAG_PKEY_DIGEST : constant := 16#0002#;  --  openssl/evp.h:195

   EVP_MD_FLAG_PKEY_METHOD_SIGNATURE : constant := 16#0004#;  --  openssl/evp.h:202

   EVP_MD_FLAG_FIPS : constant := 16#0400#;  --  openssl/evp.h:204

   EVP_MD_FLAG_DIGALGID_MASK : constant := 16#0018#;  --  openssl/evp.h:208

   EVP_MD_FLAG_DIGALGID_NULL : constant := 16#0000#;  --  openssl/evp.h:212

   EVP_MD_FLAG_DIGALGID_ABSENT : constant := 16#0008#;  --  openssl/evp.h:216

   EVP_MD_FLAG_DIGALGID_CUSTOM : constant := 16#0018#;  --  openssl/evp.h:220

   EVP_MD_CTRL_DIGALGID : constant := 16#1#;  --  openssl/evp.h:224
   EVP_MD_CTRL_MICALG : constant := 16#2#;  --  openssl/evp.h:225

   EVP_MD_CTRL_ALG_CTRL : constant := 16#1000#;  --  openssl/evp.h:229
   --  unsupported macro: EVP_PKEY_NULL_method NULL,NULL,{0,0,0,0}
   --  unsupported macro: EVP_PKEY_DSA_method (evp_sign_method *)DSA_sign, (evp_verify_method *)DSA_verify, {EVP_PKEY_DSA,EVP_PKEY_DSA2,EVP_PKEY_DSA3, EVP_PKEY_DSA4,0}
   --  unsupported macro: EVP_PKEY_RSA_method (evp_sign_method *)RSA_sign, (evp_verify_method *)RSA_verify, {EVP_PKEY_RSA,EVP_PKEY_RSA2,0,0}
   --  unsupported macro: EVP_PKEY_RSA_ASN1_OCTET_STRING_method (evp_sign_method *)RSA_sign_ASN1_OCTET_STRING, (evp_verify_method *)RSA_verify_ASN1_OCTET_STRING, {EVP_PKEY_RSA,EVP_PKEY_RSA2,0,0}

   EVP_MD_CTX_FLAG_ONESHOT : constant := 16#0001#;  --  openssl/evp.h:272

   EVP_MD_CTX_FLAG_CLEANED : constant := 16#0002#;  --  openssl/evp.h:274

   EVP_MD_CTX_FLAG_REUSE : constant := 16#0004#;  --  openssl/evp.h:276

   EVP_MD_CTX_FLAG_NON_FIPS_ALLOW : constant := 16#0008#;  --  openssl/evp.h:278

   EVP_MD_CTX_FLAG_PAD_MASK : constant := 16#F0#;  --  openssl/evp.h:285
   EVP_MD_CTX_FLAG_PAD_PKCS1 : constant := 16#00#;  --  openssl/evp.h:286
   EVP_MD_CTX_FLAG_PAD_X931 : constant := 16#10#;  --  openssl/evp.h:287
   EVP_MD_CTX_FLAG_PAD_PSS : constant := 16#20#;  --  openssl/evp.h:288
   --  arg-macro: function M_EVP_MD_CTX_FLAG_PSS_SALT (ctx)
   --    return (ctx.flags>>16) and16#FFFF#;

   EVP_MD_CTX_FLAG_PSS_MDLEN : constant := 16#FFFF#;  --  openssl/evp.h:291
   EVP_MD_CTX_FLAG_PSS_MREC : constant := 16#FFFE#;  --  openssl/evp.h:292

   EVP_MD_CTX_FLAG_NO_INIT : constant := 16#0100#;  --  openssl/evp.h:294

   EVP_CIPH_STREAM_CIPHER : constant := 16#0#;  --  openssl/evp.h:319
   EVP_CIPH_ECB_MODE : constant := 16#1#;  --  openssl/evp.h:320
   EVP_CIPH_CBC_MODE : constant := 16#2#;  --  openssl/evp.h:321
   EVP_CIPH_CFB_MODE : constant := 16#3#;  --  openssl/evp.h:322
   EVP_CIPH_OFB_MODE : constant := 16#4#;  --  openssl/evp.h:323
   EVP_CIPH_MODE : constant := 16#F0007#;  --  openssl/evp.h:324

   EVP_CIPH_VARIABLE_LENGTH : constant := 16#8#;  --  openssl/evp.h:326

   EVP_CIPH_CUSTOM_IV : constant := 16#10#;  --  openssl/evp.h:328

   EVP_CIPH_ALWAYS_CALL_INIT : constant := 16#20#;  --  openssl/evp.h:330

   EVP_CIPH_CTRL_INIT : constant := 16#40#;  --  openssl/evp.h:332

   EVP_CIPH_CUSTOM_KEY_LENGTH : constant := 16#80#;  --  openssl/evp.h:334

   EVP_CIPH_NO_PADDING : constant := 16#100#;  --  openssl/evp.h:336

   EVP_CIPH_RAND_KEY : constant := 16#200#;  --  openssl/evp.h:338

   EVP_CIPH_FLAG_FIPS : constant := 16#400#;  --  openssl/evp.h:340

   EVP_CIPH_FLAG_NON_FIPS_ALLOW : constant := 16#800#;  --  openssl/evp.h:342

   EVP_CIPH_FLAG_DEFAULT_ASN1 : constant := 16#1000#;  --  openssl/evp.h:344

   EVP_CIPH_FLAG_LENGTH_BITS : constant := 16#2000#;  --  openssl/evp.h:346

   EVP_CIPH_CUSTOM_COPY : constant := 16#4000#;  --  openssl/evp.h:348

   EVP_CTRL_INIT : constant := 16#0#;  --  openssl/evp.h:352
   EVP_CTRL_SET_KEY_LENGTH : constant := 16#1#;  --  openssl/evp.h:353
   EVP_CTRL_GET_RC2_KEY_BITS : constant := 16#2#;  --  openssl/evp.h:354
   EVP_CTRL_SET_RC2_KEY_BITS : constant := 16#3#;  --  openssl/evp.h:355
   EVP_CTRL_GET_RC5_ROUNDS : constant := 16#4#;  --  openssl/evp.h:356
   EVP_CTRL_SET_RC5_ROUNDS : constant := 16#5#;  --  openssl/evp.h:357
   EVP_CTRL_RAND_KEY : constant := 16#6#;  --  openssl/evp.h:358
   EVP_CTRL_PBE_PRF_NID : constant := 16#7#;  --  openssl/evp.h:359
   EVP_CTRL_COPY : constant := 16#8#;  --  openssl/evp.h:360
   --  arg-macro: procedure EVP_PKEY_assign_RSA (pkey, rsa)
   --    EVP_PKEY_assign((pkey),EVP_PKEY_RSA, (char *)(rsa))
   --  arg-macro: procedure EVP_PKEY_assign_DSA (pkey, dsa)
   --    EVP_PKEY_assign((pkey),EVP_PKEY_DSA, (char *)(dsa))
   --  arg-macro: procedure EVP_PKEY_assign_DH (pkey, dh)
   --    EVP_PKEY_assign((pkey),EVP_PKEY_DH, (char *)(dh))
   --  arg-macro: procedure EVP_get_digestbynid (a)
   --    EVP_get_digestbyname(OBJ_nid2sn(a))
   --  arg-macro: procedure EVP_get_digestbyobj (a)
   --    EVP_get_digestbynid(OBJ_obj2nid(a))
   --  arg-macro: procedure EVP_get_cipherbynid (a)
   --    EVP_get_cipherbyname(OBJ_nid2sn(a))
   --  arg-macro: procedure EVP_get_cipherbyobj (a)
   --    EVP_get_cipherbynid(OBJ_obj2nid(a))
   --  arg-macro: procedure EVP_MD_nid (e)
   --    EVP_MD_type(e)
   --  arg-macro: procedure EVP_MD_name (e)
   --    OBJ_nid2sn(EVP_MD_nid(e))
   --  arg-macro: procedure EVP_MD_CTX_size (e)
   --    EVP_MD_size(EVP_MD_CTX_md(e))
   --  arg-macro: procedure EVP_MD_CTX_block_size (e)
   --    EVP_MD_block_size(EVP_MD_CTX_md(e))
   --  arg-macro: procedure EVP_MD_CTX_type (e)
   --    EVP_MD_type(EVP_MD_CTX_md(e))
   --  arg-macro: procedure EVP_CIPHER_name (e)
   --    OBJ_nid2sn(EVP_CIPHER_nid(e))
   --  arg-macro: function EVP_CIPHER_mode (e)
   --    return EVP_CIPHER_flags(e) and EVP_CIPH_MODE;
   --  arg-macro: procedure EVP_CIPHER_CTX_type (c)
   --    EVP_CIPHER_type(EVP_CIPHER_CTX_cipher(c))
   --  arg-macro: function EVP_CIPHER_CTX_mode (e)
   --    return EVP_CIPHER_CTX_flags(e) and EVP_CIPH_MODE;
   --  arg-macro: function EVP_ENCODE_LENGTH (l)
   --    return ((l+2)/3*4)+(l/48+1)*2+80;
   --  arg-macro: function EVP_DECODE_LENGTH (l)
   --    return (l+3)/4*3+80;
   --  arg-macro: procedure EVP_SignInit_ex (a, b, c)
   --    EVP_DigestInit_ex(a,b,c)
   --  arg-macro: procedure EVP_SignInit (a, b)
   --    EVP_DigestInit(a,b)
   --  arg-macro: procedure EVP_SignUpdate (a, b, c)
   --    EVP_DigestUpdate(a,b,c)
   --  arg-macro: procedure EVP_VerifyInit_ex (a, b, c)
   --    EVP_DigestInit_ex(a,b,c)
   --  arg-macro: procedure EVP_VerifyInit (a, b)
   --    EVP_DigestInit(a,b)
   --  arg-macro: procedure EVP_VerifyUpdate (a, b, c)
   --    EVP_DigestUpdate(a,b,c)
   --  arg-macro: procedure EVP_OpenUpdate (a, b, c, d, e)
   --    EVP_DecryptUpdate(a,b,c,d,e)
   --  arg-macro: procedure EVP_SealUpdate (a, b, c, d, e)
   --    EVP_EncryptUpdate(a,b,c,d,e)
   --  arg-macro: procedure EVP_DigestSignUpdate (a, b, c)
   --    EVP_DigestUpdate(a,b,c)
   --  arg-macro: procedure EVP_DigestVerifyUpdate (a, b, c)
   --    EVP_DigestUpdate(a,b,c)
   --  arg-macro: procedure BIO_set_md (b, md)
   --    BIO_ctrl(b,BIO_C_SET_MD,0,(char *)md)
   --  arg-macro: procedure BIO_get_md (b, mdp)
   --    BIO_ctrl(b,BIO_C_GET_MD,0,(char *)mdp)
   --  arg-macro: procedure BIO_get_md_ctx (b, mdcp)
   --    BIO_ctrl(b,BIO_C_GET_MD_CTX,0,(char *)mdcp)
   --  arg-macro: procedure BIO_set_md_ctx (b, mdcp)
   --    BIO_ctrl(b,BIO_C_SET_MD_CTX,0,(char *)mdcp)
   --  arg-macro: procedure BIO_get_cipher_status (b)
   --    BIO_ctrl(b,BIO_C_GET_CIPHER_STATUS,0,NULL)
   --  arg-macro: procedure BIO_get_cipher_ctx (b, c_pp)
   --    BIO_ctrl(b,BIO_C_GET_CIPHER_CTX,0,(char *)c_pp)
   --  arg-macro: procedure EVP_add_cipher_alias (n, alias)
   --    OBJ_NAME_add((alias),OBJ_NAME_TYPE_CIPHER_METHorOBJ_NAME_ALIAS,(n))
   --  arg-macro: procedure EVP_add_digest_alias (n, alias)
   --    OBJ_NAME_add((alias),OBJ_NAME_TYPE_MD_METHorOBJ_NAME_ALIAS,(n))
   --  arg-macro: procedure EVP_delete_cipher_alias (alias)
   --    OBJ_NAME_remove(alias,OBJ_NAME_TYPE_CIPHER_METHorOBJ_NAME_ALIAS);
   --  arg-macro: procedure EVP_delete_digest_alias (alias)
   --    OBJ_NAME_remove(alias,OBJ_NAME_TYPE_MD_METHorOBJ_NAME_ALIAS);
   --  unsupported macro: EVP_des_cfb EVP_des_cfb64
   --  unsupported macro: EVP_des_ede_cfb EVP_des_ede_cfb64
   --  unsupported macro: EVP_des_ede3_cfb EVP_des_ede3_cfb64
   --  unsupported macro: EVP_rc2_cfb EVP_rc2_cfb64
   --  unsupported macro: EVP_bf_cfb EVP_bf_cfb64
   --  unsupported macro: EVP_cast5_cfb EVP_cast5_cfb64
   --  unsupported macro: EVP_aes_128_cfb EVP_aes_128_cfb128
   --  unsupported macro: EVP_aes_192_cfb EVP_aes_192_cfb128
   --  unsupported macro: EVP_aes_256_cfb EVP_aes_256_cfb128
   --  unsupported macro: EVP_camellia_128_cfb EVP_camellia_128_cfb128
   --  unsupported macro: EVP_camellia_192_cfb EVP_camellia_192_cfb128
   --  unsupported macro: EVP_camellia_256_cfb EVP_camellia_256_cfb128
   --  unsupported macro: EVP_seed_cfb EVP_seed_cfb128
   --  arg-macro: procedure OpenSSL_add_all_algorithms ()
   --    OPENSSL_add_all_algorithms_noconf()
   --  arg-macro: procedure SSLeay_add_all_algorithms ()
   --    OpenSSL_add_all_algorithms()
   --  arg-macro: procedure SSLeay_add_all_ciphers ()
   --    OpenSSL_add_all_ciphers()
   --  arg-macro: procedure SSLeay_add_all_digests ()
   --    OpenSSL_add_all_digests()

   EVP_PBE_TYPE_OUTER : constant := 16#0#;  --  openssl/evp.h:910

   EVP_PBE_TYPE_PRF : constant := 16#1#;  --  openssl/evp.h:912

   ASN1_PKEY_ALIAS : constant := 16#1#;  --  openssl/evp.h:922
   ASN1_PKEY_DYNAMIC : constant := 16#2#;  --  openssl/evp.h:923
   ASN1_PKEY_SIGPARAM_NULL : constant := 16#4#;  --  openssl/evp.h:924

   ASN1_PKEY_CTRL_PKCS7_SIGN : constant := 16#1#;  --  openssl/evp.h:926
   ASN1_PKEY_CTRL_PKCS7_ENCRYPT : constant := 16#2#;  --  openssl/evp.h:927
   ASN1_PKEY_CTRL_DEFAULT_MD_NID : constant := 16#3#;  --  openssl/evp.h:928
   ASN1_PKEY_CTRL_CMS_SIGN : constant := 16#5#;  --  openssl/evp.h:929
   ASN1_PKEY_CTRL_CMS_ENVELOPE : constant := 16#7#;  --  openssl/evp.h:930

   EVP_PKEY_OP_UNDEFINED : constant := 0;  --  openssl/evp.h:979
   EVP_PKEY_OP_PARAMGEN : constant := (2**1);  --  openssl/evp.h:980
   EVP_PKEY_OP_KEYGEN : constant := (2**2);  --  openssl/evp.h:981
   EVP_PKEY_OP_SIGN : constant := (2**3);  --  openssl/evp.h:982
   EVP_PKEY_OP_VERIFY : constant := (2**4);  --  openssl/evp.h:983
   EVP_PKEY_OP_VERIFYRECOVER : constant := (2**5);  --  openssl/evp.h:984
   EVP_PKEY_OP_SIGNCTX : constant := (2**6);  --  openssl/evp.h:985
   EVP_PKEY_OP_VERIFYCTX : constant := (2**7);  --  openssl/evp.h:986
   EVP_PKEY_OP_ENCRYPT : constant := (2**8);  --  openssl/evp.h:987
   EVP_PKEY_OP_DECRYPT : constant := (2**9);  --  openssl/evp.h:988
   EVP_PKEY_OP_DERIVE : constant := (2**10);  --  openssl/evp.h:989
   --  unsupported macro: EVP_PKEY_OP_TYPE_SIG (EVP_PKEY_OP_SIGN | EVP_PKEY_OP_VERIFY | EVP_PKEY_OP_VERIFYRECOVER | EVP_PKEY_OP_SIGNCTX | EVP_PKEY_OP_VERIFYCTX)
   --  unsupported macro: EVP_PKEY_OP_TYPE_CRYPT (EVP_PKEY_OP_ENCRYPT | EVP_PKEY_OP_DECRYPT)
   --  unsupported macro: EVP_PKEY_OP_TYPE_NOGEN (EVP_PKEY_OP_SIG | EVP_PKEY_OP_CRYPT | EVP_PKEY_OP_DERIVE)
   --  unsupported macro: EVP_PKEY_OP_TYPE_GEN (EVP_PKEY_OP_PARAMGEN | EVP_PKEY_OP_KEYGEN)
   --  arg-macro: procedure EVP_PKEY_CTX_set_signature_md (ctx, md)
   --    EVP_PKEY_CTX_ctrl(ctx, -1, EVP_PKEY_OP_TYPE_SIG, EVP_PKEY_CTRL_MD, 0, (void *)md)

   EVP_PKEY_CTRL_MD : constant := 1;  --  openssl/evp.h:1008
   EVP_PKEY_CTRL_PEER_KEY : constant := 2;  --  openssl/evp.h:1009

   EVP_PKEY_CTRL_PKCS7_ENCRYPT : constant := 3;  --  openssl/evp.h:1011
   EVP_PKEY_CTRL_PKCS7_DECRYPT : constant := 4;  --  openssl/evp.h:1012

   EVP_PKEY_CTRL_PKCS7_SIGN : constant := 5;  --  openssl/evp.h:1014

   EVP_PKEY_CTRL_SET_MAC_KEY : constant := 6;  --  openssl/evp.h:1016

   EVP_PKEY_CTRL_DIGESTINIT : constant := 7;  --  openssl/evp.h:1018

   EVP_PKEY_CTRL_SET_IV : constant := 8;  --  openssl/evp.h:1021

   EVP_PKEY_CTRL_CMS_ENCRYPT : constant := 9;  --  openssl/evp.h:1023
   EVP_PKEY_CTRL_CMS_DECRYPT : constant := 10;  --  openssl/evp.h:1024
   EVP_PKEY_CTRL_CMS_SIGN : constant := 11;  --  openssl/evp.h:1025

   EVP_PKEY_ALG_CTRL : constant := 16#1000#;  --  openssl/evp.h:1027

   EVP_PKEY_FLAG_AUTOARGLEN : constant := 2;  --  openssl/evp.h:1030

   EVP_F_AESNI_INIT_KEY : constant := 163;  --  openssl/evp.h:1170
   EVP_F_AES_INIT_KEY : constant := 133;  --  openssl/evp.h:1171
   EVP_F_CAMELLIA_INIT_KEY : constant := 159;  --  openssl/evp.h:1172
   EVP_F_D2I_PKEY : constant := 100;  --  openssl/evp.h:1173
   EVP_F_DO_SIGVER_INIT : constant := 161;  --  openssl/evp.h:1174
   EVP_F_DSAPKEY2PKCS8 : constant := 134;  --  openssl/evp.h:1175
   EVP_F_DSA_PKEY2PKCS8 : constant := 135;  --  openssl/evp.h:1176
   EVP_F_ECDSA_PKEY2PKCS8 : constant := 129;  --  openssl/evp.h:1177
   EVP_F_ECKEY_PKEY2PKCS8 : constant := 132;  --  openssl/evp.h:1178
   EVP_F_EVP_CIPHERINIT_EX : constant := 123;  --  openssl/evp.h:1179
   EVP_F_EVP_CIPHER_CTX_COPY : constant := 163;  --  openssl/evp.h:1180
   EVP_F_EVP_CIPHER_CTX_CTRL : constant := 124;  --  openssl/evp.h:1181
   EVP_F_EVP_CIPHER_CTX_SET_KEY_LENGTH : constant := 122;  --  openssl/evp.h:1182
   EVP_F_EVP_DECRYPTFINAL_EX : constant := 101;  --  openssl/evp.h:1183
   EVP_F_EVP_DIGESTINIT_EX : constant := 128;  --  openssl/evp.h:1184
   EVP_F_EVP_ENCRYPTFINAL_EX : constant := 127;  --  openssl/evp.h:1185
   EVP_F_EVP_MD_CTX_COPY_EX : constant := 110;  --  openssl/evp.h:1186
   EVP_F_EVP_MD_SIZE : constant := 162;  --  openssl/evp.h:1187
   EVP_F_EVP_OPENINIT : constant := 102;  --  openssl/evp.h:1188
   EVP_F_EVP_PBE_ALG_ADD : constant := 115;  --  openssl/evp.h:1189
   EVP_F_EVP_PBE_ALG_ADD_TYPE : constant := 160;  --  openssl/evp.h:1190
   EVP_F_EVP_PBE_CIPHERINIT : constant := 116;  --  openssl/evp.h:1191
   EVP_F_EVP_PKCS82PKEY : constant := 111;  --  openssl/evp.h:1192
   EVP_F_EVP_PKCS82PKEY_BROKEN : constant := 136;  --  openssl/evp.h:1193
   EVP_F_EVP_PKEY2PKCS8_BROKEN : constant := 113;  --  openssl/evp.h:1194
   EVP_F_EVP_PKEY_COPY_PARAMETERS : constant := 103;  --  openssl/evp.h:1195
   EVP_F_EVP_PKEY_CTX_CTRL : constant := 137;  --  openssl/evp.h:1196
   EVP_F_EVP_PKEY_CTX_CTRL_STR : constant := 150;  --  openssl/evp.h:1197
   EVP_F_EVP_PKEY_CTX_DUP : constant := 156;  --  openssl/evp.h:1198
   EVP_F_EVP_PKEY_DECRYPT : constant := 104;  --  openssl/evp.h:1199
   EVP_F_EVP_PKEY_DECRYPT_INIT : constant := 138;  --  openssl/evp.h:1200
   EVP_F_EVP_PKEY_DECRYPT_OLD : constant := 151;  --  openssl/evp.h:1201
   EVP_F_EVP_PKEY_DERIVE : constant := 153;  --  openssl/evp.h:1202
   EVP_F_EVP_PKEY_DERIVE_INIT : constant := 154;  --  openssl/evp.h:1203
   EVP_F_EVP_PKEY_DERIVE_SET_PEER : constant := 155;  --  openssl/evp.h:1204
   EVP_F_EVP_PKEY_ENCRYPT : constant := 105;  --  openssl/evp.h:1205
   EVP_F_EVP_PKEY_ENCRYPT_INIT : constant := 139;  --  openssl/evp.h:1206
   EVP_F_EVP_PKEY_ENCRYPT_OLD : constant := 152;  --  openssl/evp.h:1207
   EVP_F_EVP_PKEY_GET1_DH : constant := 119;  --  openssl/evp.h:1208
   EVP_F_EVP_PKEY_GET1_DSA : constant := 120;  --  openssl/evp.h:1209
   EVP_F_EVP_PKEY_GET1_ECDSA : constant := 130;  --  openssl/evp.h:1210
   EVP_F_EVP_PKEY_GET1_EC_KEY : constant := 131;  --  openssl/evp.h:1211
   EVP_F_EVP_PKEY_GET1_RSA : constant := 121;  --  openssl/evp.h:1212
   EVP_F_EVP_PKEY_KEYGEN : constant := 146;  --  openssl/evp.h:1213
   EVP_F_EVP_PKEY_KEYGEN_INIT : constant := 147;  --  openssl/evp.h:1214
   EVP_F_EVP_PKEY_NEW : constant := 106;  --  openssl/evp.h:1215
   EVP_F_EVP_PKEY_PARAMGEN : constant := 148;  --  openssl/evp.h:1216
   EVP_F_EVP_PKEY_PARAMGEN_INIT : constant := 149;  --  openssl/evp.h:1217
   EVP_F_EVP_PKEY_SIGN : constant := 140;  --  openssl/evp.h:1218
   EVP_F_EVP_PKEY_SIGN_INIT : constant := 141;  --  openssl/evp.h:1219
   EVP_F_EVP_PKEY_VERIFY : constant := 142;  --  openssl/evp.h:1220
   EVP_F_EVP_PKEY_VERIFY_INIT : constant := 143;  --  openssl/evp.h:1221
   EVP_F_EVP_PKEY_VERIFY_RECOVER : constant := 144;  --  openssl/evp.h:1222
   EVP_F_EVP_PKEY_VERIFY_RECOVER_INIT : constant := 145;  --  openssl/evp.h:1223
   EVP_F_EVP_RIJNDAEL : constant := 126;  --  openssl/evp.h:1224
   EVP_F_EVP_SIGNFINAL : constant := 107;  --  openssl/evp.h:1225
   EVP_F_EVP_VERIFYFINAL : constant := 108;  --  openssl/evp.h:1226
   EVP_F_INT_CTX_NEW : constant := 157;  --  openssl/evp.h:1227
   EVP_F_PKCS5_PBE_KEYIVGEN : constant := 117;  --  openssl/evp.h:1228
   EVP_F_PKCS5_V2_PBE_KEYIVGEN : constant := 118;  --  openssl/evp.h:1229
   EVP_F_PKCS8_SET_BROKEN : constant := 112;  --  openssl/evp.h:1230
   EVP_F_PKEY_SET_TYPE : constant := 158;  --  openssl/evp.h:1231
   EVP_F_RC2_MAGIC_TO_METH : constant := 109;  --  openssl/evp.h:1232
   EVP_F_RC5_CTRL : constant := 125;  --  openssl/evp.h:1233

   EVP_R_AES_KEY_SETUP_FAILED : constant := 143;  --  openssl/evp.h:1236
   EVP_R_ASN1_LIB : constant := 140;  --  openssl/evp.h:1237
   EVP_R_BAD_BLOCK_LENGTH : constant := 136;  --  openssl/evp.h:1238
   EVP_R_BAD_DECRYPT : constant := 100;  --  openssl/evp.h:1239
   EVP_R_BAD_KEY_LENGTH : constant := 137;  --  openssl/evp.h:1240
   EVP_R_BN_DECODE_ERROR : constant := 112;  --  openssl/evp.h:1241
   EVP_R_BN_PUBKEY_ERROR : constant := 113;  --  openssl/evp.h:1242
   EVP_R_BUFFER_TOO_SMALL : constant := 155;  --  openssl/evp.h:1243
   EVP_R_CAMELLIA_KEY_SETUP_FAILED : constant := 157;  --  openssl/evp.h:1244
   EVP_R_CIPHER_PARAMETER_ERROR : constant := 122;  --  openssl/evp.h:1245
   EVP_R_COMMAND_NOT_SUPPORTED : constant := 147;  --  openssl/evp.h:1246
   EVP_R_CTRL_NOT_IMPLEMENTED : constant := 132;  --  openssl/evp.h:1247
   EVP_R_CTRL_OPERATION_NOT_IMPLEMENTED : constant := 133;  --  openssl/evp.h:1248
   EVP_R_DATA_NOT_MULTIPLE_OF_BLOCK_LENGTH : constant := 138;  --  openssl/evp.h:1249
   EVP_R_DECODE_ERROR : constant := 114;  --  openssl/evp.h:1250
   EVP_R_DIFFERENT_KEY_TYPES : constant := 101;  --  openssl/evp.h:1251
   EVP_R_DIFFERENT_PARAMETERS : constant := 153;  --  openssl/evp.h:1252
   EVP_R_DISABLED_FOR_FIPS : constant := 160;  --  openssl/evp.h:1253
   EVP_R_ENCODE_ERROR : constant := 115;  --  openssl/evp.h:1254
   EVP_R_EVP_PBE_CIPHERINIT_ERROR : constant := 119;  --  openssl/evp.h:1255
   EVP_R_EXPECTING_AN_RSA_KEY : constant := 127;  --  openssl/evp.h:1256
   EVP_R_EXPECTING_A_DH_KEY : constant := 128;  --  openssl/evp.h:1257
   EVP_R_EXPECTING_A_DSA_KEY : constant := 129;  --  openssl/evp.h:1258
   EVP_R_EXPECTING_A_ECDSA_KEY : constant := 141;  --  openssl/evp.h:1259
   EVP_R_EXPECTING_A_EC_KEY : constant := 142;  --  openssl/evp.h:1260
   EVP_R_INITIALIZATION_ERROR : constant := 134;  --  openssl/evp.h:1261
   EVP_R_INPUT_NOT_INITIALIZED : constant := 111;  --  openssl/evp.h:1262
   EVP_R_INVALID_DIGEST : constant := 152;  --  openssl/evp.h:1263
   EVP_R_INVALID_KEY_LENGTH : constant := 130;  --  openssl/evp.h:1264
   EVP_R_INVALID_OPERATION : constant := 148;  --  openssl/evp.h:1265
   EVP_R_IV_TOO_LARGE : constant := 102;  --  openssl/evp.h:1266
   EVP_R_KEYGEN_FAILURE : constant := 120;  --  openssl/evp.h:1267
   EVP_R_MESSAGE_DIGEST_IS_NULL : constant := 159;  --  openssl/evp.h:1268
   EVP_R_METHOD_NOT_SUPPORTED : constant := 144;  --  openssl/evp.h:1269
   EVP_R_MISSING_PARAMETERS : constant := 103;  --  openssl/evp.h:1270
   EVP_R_NO_CIPHER_SET : constant := 131;  --  openssl/evp.h:1271
   EVP_R_NO_DEFAULT_DIGEST : constant := 158;  --  openssl/evp.h:1272
   EVP_R_NO_DIGEST_SET : constant := 139;  --  openssl/evp.h:1273
   EVP_R_NO_DSA_PARAMETERS : constant := 116;  --  openssl/evp.h:1274
   EVP_R_NO_KEY_SET : constant := 154;  --  openssl/evp.h:1275
   EVP_R_NO_OPERATION_SET : constant := 149;  --  openssl/evp.h:1276
   EVP_R_NO_SIGN_FUNCTION_CONFIGURED : constant := 104;  --  openssl/evp.h:1277
   EVP_R_NO_VERIFY_FUNCTION_CONFIGURED : constant := 105;  --  openssl/evp.h:1278
   EVP_R_OPERATION_NOT_SUPPORTED_FOR_THIS_KEYTYPE : constant := 150;  --  openssl/evp.h:1279
   EVP_R_OPERATON_NOT_INITIALIZED : constant := 151;  --  openssl/evp.h:1280
   EVP_R_PKCS8_UNKNOWN_BROKEN_TYPE : constant := 117;  --  openssl/evp.h:1281
   EVP_R_PRIVATE_KEY_DECODE_ERROR : constant := 145;  --  openssl/evp.h:1282
   EVP_R_PRIVATE_KEY_ENCODE_ERROR : constant := 146;  --  openssl/evp.h:1283
   EVP_R_PUBLIC_KEY_NOT_RSA : constant := 106;  --  openssl/evp.h:1284
   EVP_R_UNKNOWN_CIPHER : constant := 160;  --  openssl/evp.h:1285
   EVP_R_UNKNOWN_DIGEST : constant := 161;  --  openssl/evp.h:1286
   EVP_R_UNKNOWN_PBE_ALGORITHM : constant := 121;  --  openssl/evp.h:1287
   EVP_R_UNSUPORTED_NUMBER_OF_ROUNDS : constant := 135;  --  openssl/evp.h:1288
   EVP_R_UNSUPPORTED_ALGORITHM : constant := 156;  --  openssl/evp.h:1289
   EVP_R_UNSUPPORTED_CIPHER : constant := 107;  --  openssl/evp.h:1290
   EVP_R_UNSUPPORTED_KEYLENGTH : constant := 123;  --  openssl/evp.h:1291
   EVP_R_UNSUPPORTED_KEY_DERIVATION_FUNCTION : constant := 124;  --  openssl/evp.h:1292
   EVP_R_UNSUPPORTED_KEY_SIZE : constant := 108;  --  openssl/evp.h:1293
   EVP_R_UNSUPPORTED_PRF : constant := 125;  --  openssl/evp.h:1294
   EVP_R_UNSUPPORTED_PRIVATE_KEY_ALGORITHM : constant := 118;  --  openssl/evp.h:1295
   EVP_R_UNSUPPORTED_SALT_TYPE : constant := 126;  --  openssl/evp.h:1296
   EVP_R_WRONG_FINAL_BLOCK_LENGTH : constant := 109;  --  openssl/evp.h:1297
   EVP_R_WRONG_PUBLIC_KEY_TYPE : constant := 110;  --  openssl/evp.h:1298

   type anon_28 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ptr : Interfaces.C.Strings.chars_ptr;  -- openssl/evp.h:139
         when 1 =>
            rsa : access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/evp.h:141
         when 2 =>
            dsa : access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/evp.h:144
         when others =>
            dh : access OpenSSL.Low_Level.dh_h.dh_st;  -- openssl/evp.h:147
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_28);
   pragma Unchecked_Union (anon_28);
   type evp_pkey_st is record
      c_type : aliased int;  -- openssl/evp.h:133
      save_type : aliased int;  -- openssl/evp.h:134
      references : aliased int;  -- openssl/evp.h:135
      ameth : System.Address;  -- openssl/evp.h:136
      the_engine : System.Address;  -- openssl/evp.h:137
      pkey : anon_28;  -- openssl/evp.h:149
      save_parameters : aliased int;  -- openssl/evp.h:150
      attributes : access OpenSSL.Low_Level.x509_h.stack_st_X509_ATTRIBUTE;  -- openssl/evp.h:151
   end record;
   pragma Convention (C_Pass_By_Copy, evp_pkey_st);  -- openssl/evp.h:131

   type env_md_st_required_pkey_type_array is array (0 .. 4) of aliased int;
   type env_md_st is record
      c_type : aliased int;  -- openssl/evp.h:162
      pkey_type : aliased int;  -- openssl/evp.h:163
      md_size : aliased int;  -- openssl/evp.h:164
      flags : aliased unsigned_long;  -- openssl/evp.h:165
      init : access function (arg1 : System.Address) return int;  -- openssl/evp.h:166
      update : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : size_t) return int;  -- openssl/evp.h:167
      final : access function (arg1 : System.Address; arg2 : access unsigned_char) return int;  -- openssl/evp.h:168
      copy : access function (arg1 : System.Address; arg2 : access constant OpenSSL.Low_Level.evp_h.env_md_ctx_st) return int;  -- openssl/evp.h:169
      cleanup : access function (arg1 : System.Address) return int;  -- openssl/evp.h:170
      sign : access function
           (arg1 : int;
            arg2 : access unsigned_char;
            arg3 : unsigned;
            arg4 : access unsigned_char;
            arg5 : access unsigned;
            arg6 : System.Address) return int;  -- openssl/evp.h:174
      verify : access function
           (arg1 : int;
            arg2 : access unsigned_char;
            arg3 : unsigned;
            arg4 : access unsigned_char;
            arg5 : unsigned;
            arg6 : System.Address) return int;  -- openssl/evp.h:177
      required_pkey_type : aliased env_md_st_required_pkey_type_array;  -- openssl/evp.h:178
      block_size : aliased int;  -- openssl/evp.h:179
      ctx_size : aliased int;  -- openssl/evp.h:180
      md_ctrl : access function
           (arg1 : System.Address;
            arg2 : int;
            arg3 : int;
            arg4 : System.Address) return int;  -- openssl/evp.h:182
   end record;
   pragma Convention (C_Pass_By_Copy, env_md_st);  -- openssl/evp.h:160

   --  skipped function type evp_sign_method

   --  skipped function type evp_verify_method

   type env_md_ctx_st is record
      digest : access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:260
      the_engine : System.Address;  -- openssl/evp.h:261
      flags : aliased unsigned_long;  -- openssl/evp.h:262
      md_data : System.Address;  -- openssl/evp.h:263
      pctx : System.Address;  -- openssl/evp.h:265
      update : access function
           (arg1 : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
            arg2 : System.Address;
            arg3 : size_t) return int;  -- openssl/evp.h:267
   end record;
   pragma Convention (C_Pass_By_Copy, env_md_ctx_st);  -- openssl/evp.h:258

   type evp_cipher_st is record
      nid : aliased int;  -- openssl/evp.h:298
      block_size : aliased int;  -- openssl/evp.h:299
      key_len : aliased int;  -- openssl/evp.h:300
      iv_len : aliased int;  -- openssl/evp.h:301
      flags : aliased unsigned_long;  -- openssl/evp.h:302
      init : access function
           (arg1 : System.Address;
            arg2 : access unsigned_char;
            arg3 : access unsigned_char;
            arg4 : int) return int;  -- openssl/evp.h:304
      do_cipher : access function
           (arg1 : System.Address;
            arg2 : access unsigned_char;
            arg3 : access unsigned_char;
            arg4 : size_t) return int;  -- openssl/evp.h:306
      cleanup : access function (arg1 : System.Address) return int;  -- openssl/evp.h:307
      ctx_size : aliased int;  -- openssl/evp.h:308
      set_asn1_parameters : access function (arg1 : System.Address; arg2 : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE) return int;  -- openssl/evp.h:309
      get_asn1_parameters : access function (arg1 : System.Address; arg2 : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE) return int;  -- openssl/evp.h:310
      ctrl : access function
           (arg1 : System.Address;
            arg2 : int;
            arg3 : int;
            arg4 : System.Address) return int;  -- openssl/evp.h:311
      app_data : System.Address;  -- openssl/evp.h:312
   end record;
   pragma Convention (C_Pass_By_Copy, evp_cipher_st);  -- openssl/evp.h:296

   type evp_cipher_info_st_iv_array is array (0 .. 15) of aliased unsigned_char;
   type evp_cipher_info_st is record
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:364
      iv : aliased evp_cipher_info_st_iv_array;  -- openssl/evp.h:365
   end record;
   pragma Convention (C_Pass_By_Copy, evp_cipher_info_st);  -- openssl/evp.h:362

   subtype EVP_CIPHER_INFO is evp_cipher_info_st;

   type evp_cipher_ctx_st_oiv_array is array (0 .. 15) of aliased unsigned_char;
   type evp_cipher_ctx_st_iv_array is array (0 .. 15) of aliased unsigned_char;
   type evp_cipher_ctx_st_buf_array is array (0 .. 31) of aliased unsigned_char;
   type evp_cipher_ctx_st_final_array is array (0 .. 31) of aliased unsigned_char;
   type evp_cipher_ctx_st is record
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:370
      the_engine : System.Address;  -- openssl/evp.h:371
      encrypt : aliased int;  -- openssl/evp.h:372
      buf_len : aliased int;  -- openssl/evp.h:373
      oiv : aliased evp_cipher_ctx_st_oiv_array;  -- openssl/evp.h:375
      iv : aliased evp_cipher_ctx_st_iv_array;  -- openssl/evp.h:376
      buf : aliased evp_cipher_ctx_st_buf_array;  -- openssl/evp.h:377
      num : aliased int;  -- openssl/evp.h:378
      app_data : System.Address;  -- openssl/evp.h:380
      key_len : aliased int;  -- openssl/evp.h:381
      flags : aliased unsigned_long;  -- openssl/evp.h:382
      cipher_data : System.Address;  -- openssl/evp.h:383
      final_used : aliased int;  -- openssl/evp.h:384
      block_mask : aliased int;  -- openssl/evp.h:385
      final : aliased evp_cipher_ctx_st_final_array;  -- openssl/evp.h:386
   end record;
   pragma Convention (C_Pass_By_Copy, evp_cipher_ctx_st);  -- openssl/evp.h:368

   type evp_Encode_Ctx_st_enc_data_array is array (0 .. 79) of aliased unsigned_char;
   type evp_Encode_Ctx_st is record
      num : aliased int;  -- openssl/evp.h:391
      length : aliased int;  -- openssl/evp.h:392
      enc_data : aliased evp_Encode_Ctx_st_enc_data_array;  -- openssl/evp.h:397
      line_num : aliased int;  -- openssl/evp.h:398
      expect_nl : aliased int;  -- openssl/evp.h:399
   end record;
   pragma Convention (C_Pass_By_Copy, evp_Encode_Ctx_st);  -- openssl/evp.h:389

   subtype EVP_ENCODE_CTX is evp_Encode_Ctx_st;

   --  skipped function type EVP_PBE_KEYGEN

   function EVP_MD_type (md : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/evp.h:429
   pragma Import (C, EVP_MD_type, "EVP_MD_type");

   function EVP_MD_pkey_type (md : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/evp.h:432
   pragma Import (C, EVP_MD_pkey_type, "EVP_MD_pkey_type");

   function EVP_MD_size (md : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/evp.h:433
   pragma Import (C, EVP_MD_size, "EVP_MD_size");

   function EVP_MD_block_size (md : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/evp.h:434
   pragma Import (C, EVP_MD_block_size, "EVP_MD_block_size");

   function EVP_MD_flags (md : access constant OpenSSL.Low_Level.evp_h.env_md_st) return unsigned_long;  -- openssl/evp.h:435
   pragma Import (C, EVP_MD_flags, "EVP_MD_flags");

   function EVP_MD_CTX_md (ctx : access constant OpenSSL.Low_Level.evp_h.env_md_ctx_st) return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:437
   pragma Import (C, EVP_MD_CTX_md, "EVP_MD_CTX_md");

   function EVP_CIPHER_nid (cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st) return int;  -- openssl/evp.h:442
   pragma Import (C, EVP_CIPHER_nid, "EVP_CIPHER_nid");

   function EVP_CIPHER_block_size (cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st) return int;  -- openssl/evp.h:444
   pragma Import (C, EVP_CIPHER_block_size, "EVP_CIPHER_block_size");

   function EVP_CIPHER_key_length (cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st) return int;  -- openssl/evp.h:445
   pragma Import (C, EVP_CIPHER_key_length, "EVP_CIPHER_key_length");

   function EVP_CIPHER_iv_length (cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st) return int;  -- openssl/evp.h:446
   pragma Import (C, EVP_CIPHER_iv_length, "EVP_CIPHER_iv_length");

   function EVP_CIPHER_flags (cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st) return unsigned_long;  -- openssl/evp.h:447
   pragma Import (C, EVP_CIPHER_flags, "EVP_CIPHER_flags");

   function EVP_CIPHER_CTX_cipher (ctx : access constant OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st) return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:450
   pragma Import (C, EVP_CIPHER_CTX_cipher, "EVP_CIPHER_CTX_cipher");

   function EVP_CIPHER_CTX_nid (ctx : access constant OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st) return int;  -- openssl/evp.h:451
   pragma Import (C, EVP_CIPHER_CTX_nid, "EVP_CIPHER_CTX_nid");

   function EVP_CIPHER_CTX_block_size (ctx : access constant OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st) return int;  -- openssl/evp.h:452
   pragma Import (C, EVP_CIPHER_CTX_block_size, "EVP_CIPHER_CTX_block_size");

   function EVP_CIPHER_CTX_key_length (ctx : access constant OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st) return int;  -- openssl/evp.h:453
   pragma Import (C, EVP_CIPHER_CTX_key_length, "EVP_CIPHER_CTX_key_length");

   function EVP_CIPHER_CTX_iv_length (ctx : access constant OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st) return int;  -- openssl/evp.h:454
   pragma Import (C, EVP_CIPHER_CTX_iv_length, "EVP_CIPHER_CTX_iv_length");

   function EVP_CIPHER_CTX_copy (c_out : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st; c_in : access constant OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st) return int;  -- openssl/evp.h:455
   pragma Import (C, EVP_CIPHER_CTX_copy, "EVP_CIPHER_CTX_copy");

   function EVP_CIPHER_CTX_get_app_data (ctx : access constant OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st) return System.Address;  -- openssl/evp.h:456
   pragma Import (C, EVP_CIPHER_CTX_get_app_data, "EVP_CIPHER_CTX_get_app_data");

   procedure EVP_CIPHER_CTX_set_app_data (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st; data : System.Address);  -- openssl/evp.h:457
   pragma Import (C, EVP_CIPHER_CTX_set_app_data, "EVP_CIPHER_CTX_set_app_data");

   function EVP_CIPHER_CTX_flags (ctx : access constant OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st) return unsigned_long;  -- openssl/evp.h:459
   pragma Import (C, EVP_CIPHER_CTX_flags, "EVP_CIPHER_CTX_flags");

   function EVP_Cipher
     (c : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      c_in : access unsigned_char;
      inl : unsigned) return int;  -- openssl/evp.h:487
   pragma Import (C, EVP_Cipher, "EVP_Cipher");

   procedure EVP_MD_CTX_init (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st);  -- openssl/evp.h:501
   pragma Import (C, EVP_MD_CTX_init, "EVP_MD_CTX_init");

   function EVP_MD_CTX_cleanup (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st) return int;  -- openssl/evp.h:502
   pragma Import (C, EVP_MD_CTX_cleanup, "EVP_MD_CTX_cleanup");

   function EVP_MD_CTX_create return access OpenSSL.Low_Level.evp_h.env_md_ctx_st;  -- openssl/evp.h:503
   pragma Import (C, EVP_MD_CTX_create, "EVP_MD_CTX_create");

   procedure EVP_MD_CTX_destroy (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st);  -- openssl/evp.h:504
   pragma Import (C, EVP_MD_CTX_destroy, "EVP_MD_CTX_destroy");

   function EVP_MD_CTX_copy_ex (c_out : access OpenSSL.Low_Level.evp_h.env_md_ctx_st; c_in : access constant OpenSSL.Low_Level.evp_h.env_md_ctx_st) return int;  -- openssl/evp.h:505
   pragma Import (C, EVP_MD_CTX_copy_ex, "EVP_MD_CTX_copy_ex");

   procedure EVP_MD_CTX_set_flags (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st; flags : int);  -- openssl/evp.h:506
   pragma Import (C, EVP_MD_CTX_set_flags, "EVP_MD_CTX_set_flags");

   procedure EVP_MD_CTX_clear_flags (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st; flags : int);  -- openssl/evp.h:507
   pragma Import (C, EVP_MD_CTX_clear_flags, "EVP_MD_CTX_clear_flags");

   function EVP_MD_CTX_test_flags (ctx : access constant OpenSSL.Low_Level.evp_h.env_md_ctx_st; flags : int) return int;  -- openssl/evp.h:508
   pragma Import (C, EVP_MD_CTX_test_flags, "EVP_MD_CTX_test_flags");

   function EVP_DigestInit_ex
     (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
      c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      impl : System.Address) return int;  -- openssl/evp.h:509
   pragma Import (C, EVP_DigestInit_ex, "EVP_DigestInit_ex");

   function EVP_DigestUpdate
     (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
      d : System.Address;
      cnt : size_t) return int;  -- openssl/evp.h:510
   pragma Import (C, EVP_DigestUpdate, "EVP_DigestUpdate");

   function EVP_DigestFinal_ex
     (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
      md : access unsigned_char;
      s : access unsigned) return int;  -- openssl/evp.h:512
   pragma Import (C, EVP_DigestFinal_ex, "EVP_DigestFinal_ex");

   function EVP_Digest
     (data : System.Address;
      count : size_t;
      md : access unsigned_char;
      size : access unsigned;
      c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      impl : System.Address) return int;  -- openssl/evp.h:513
   pragma Import (C, EVP_Digest, "EVP_Digest");

   function EVP_MD_CTX_copy (c_out : access OpenSSL.Low_Level.evp_h.env_md_ctx_st; c_in : access constant OpenSSL.Low_Level.evp_h.env_md_ctx_st) return int;  -- openssl/evp.h:516
   pragma Import (C, EVP_MD_CTX_copy, "EVP_MD_CTX_copy");

   function EVP_DigestInit (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st; c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/evp.h:517
   pragma Import (C, EVP_DigestInit, "EVP_DigestInit");

   function EVP_DigestFinal
     (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
      md : access unsigned_char;
      s : access unsigned) return int;  -- openssl/evp.h:518
   pragma Import (C, EVP_DigestFinal, "EVP_DigestFinal");

   function EVP_read_pw_string
     (buf : Interfaces.C.Strings.chars_ptr;
      length : int;
      prompt : Interfaces.C.Strings.chars_ptr;
      verify : int) return int;  -- openssl/evp.h:520
   pragma Import (C, EVP_read_pw_string, "EVP_read_pw_string");

   function EVP_read_pw_string_min
     (buf : Interfaces.C.Strings.chars_ptr;
      minlen : int;
      maxlen : int;
      prompt : Interfaces.C.Strings.chars_ptr;
      verify : int) return int;  -- openssl/evp.h:521
   pragma Import (C, EVP_read_pw_string_min, "EVP_read_pw_string_min");

   procedure EVP_set_pw_prompt (prompt : Interfaces.C.Strings.chars_ptr);  -- openssl/evp.h:522
   pragma Import (C, EVP_set_pw_prompt, "EVP_set_pw_prompt");

   function EVP_get_pw_prompt return Interfaces.C.Strings.chars_ptr;  -- openssl/evp.h:523
   pragma Import (C, EVP_get_pw_prompt, "EVP_get_pw_prompt");

   function EVP_BytesToKey
     (c_type : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      md : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      salt : access unsigned_char;
      data : access unsigned_char;
      datal : int;
      count : int;
      key : access unsigned_char;
      iv : access unsigned_char) return int;  -- openssl/evp.h:525
   pragma Import (C, EVP_BytesToKey, "EVP_BytesToKey");

   procedure EVP_CIPHER_CTX_set_flags (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st; flags : int);  -- openssl/evp.h:529
   pragma Import (C, EVP_CIPHER_CTX_set_flags, "EVP_CIPHER_CTX_set_flags");

   procedure EVP_CIPHER_CTX_clear_flags (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st; flags : int);  -- openssl/evp.h:530
   pragma Import (C, EVP_CIPHER_CTX_clear_flags, "EVP_CIPHER_CTX_clear_flags");

   function EVP_CIPHER_CTX_test_flags (ctx : access constant OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st; flags : int) return int;  -- openssl/evp.h:531
   pragma Import (C, EVP_CIPHER_CTX_test_flags, "EVP_CIPHER_CTX_test_flags");

   function EVP_EncryptInit
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      key : access unsigned_char;
      iv : access unsigned_char) return int;  -- openssl/evp.h:533
   pragma Import (C, EVP_EncryptInit, "EVP_EncryptInit");

   function EVP_EncryptInit_ex
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      impl : System.Address;
      key : access unsigned_char;
      iv : access unsigned_char) return int;  -- openssl/evp.h:535
   pragma Import (C, EVP_EncryptInit_ex, "EVP_EncryptInit_ex");

   function EVP_EncryptUpdate
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int;
      c_in : access unsigned_char;
      inl : int) return int;  -- openssl/evp.h:537
   pragma Import (C, EVP_EncryptUpdate, "EVP_EncryptUpdate");

   function EVP_EncryptFinal_ex
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int) return int;  -- openssl/evp.h:539
   pragma Import (C, EVP_EncryptFinal_ex, "EVP_EncryptFinal_ex");

   function EVP_EncryptFinal
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int) return int;  -- openssl/evp.h:540
   pragma Import (C, EVP_EncryptFinal, "EVP_EncryptFinal");

   function EVP_DecryptInit
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      key : access unsigned_char;
      iv : access unsigned_char) return int;  -- openssl/evp.h:542
   pragma Import (C, EVP_DecryptInit, "EVP_DecryptInit");

   function EVP_DecryptInit_ex
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      impl : System.Address;
      key : access unsigned_char;
      iv : access unsigned_char) return int;  -- openssl/evp.h:544
   pragma Import (C, EVP_DecryptInit_ex, "EVP_DecryptInit_ex");

   function EVP_DecryptUpdate
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int;
      c_in : access unsigned_char;
      inl : int) return int;  -- openssl/evp.h:546
   pragma Import (C, EVP_DecryptUpdate, "EVP_DecryptUpdate");

   function EVP_DecryptFinal
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      outm : access unsigned_char;
      outl : access int) return int;  -- openssl/evp.h:548
   pragma Import (C, EVP_DecryptFinal, "EVP_DecryptFinal");

   function EVP_DecryptFinal_ex
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      outm : access unsigned_char;
      outl : access int) return int;  -- openssl/evp.h:549
   pragma Import (C, EVP_DecryptFinal_ex, "EVP_DecryptFinal_ex");

   function EVP_CipherInit
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      key : access unsigned_char;
      iv : access unsigned_char;
      enc : int) return int;  -- openssl/evp.h:551
   pragma Import (C, EVP_CipherInit, "EVP_CipherInit");

   function EVP_CipherInit_ex
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      impl : System.Address;
      key : access unsigned_char;
      iv : access unsigned_char;
      enc : int) return int;  -- openssl/evp.h:554
   pragma Import (C, EVP_CipherInit_ex, "EVP_CipherInit_ex");

   function EVP_CipherUpdate
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int;
      c_in : access unsigned_char;
      inl : int) return int;  -- openssl/evp.h:557
   pragma Import (C, EVP_CipherUpdate, "EVP_CipherUpdate");

   function EVP_CipherFinal
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      outm : access unsigned_char;
      outl : access int) return int;  -- openssl/evp.h:559
   pragma Import (C, EVP_CipherFinal, "EVP_CipherFinal");

   function EVP_CipherFinal_ex
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      outm : access unsigned_char;
      outl : access int) return int;  -- openssl/evp.h:560
   pragma Import (C, EVP_CipherFinal_ex, "EVP_CipherFinal_ex");

   function EVP_SignFinal
     (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
      md : access unsigned_char;
      s : access unsigned;
      pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:562
   pragma Import (C, EVP_SignFinal, "EVP_SignFinal");

   function EVP_VerifyFinal
     (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
      sigbuf : access unsigned_char;
      siglen : unsigned;
      pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:565
   pragma Import (C, EVP_VerifyFinal, "EVP_VerifyFinal");

   function EVP_DigestSignInit
     (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
      pctx : System.Address;
      c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      e : System.Address;
      pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:568
   pragma Import (C, EVP_DigestSignInit, "EVP_DigestSignInit");

   function EVP_DigestSignFinal
     (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
      sigret : access unsigned_char;
      siglen : access size_t) return int;  -- openssl/evp.h:570
   pragma Import (C, EVP_DigestSignFinal, "EVP_DigestSignFinal");

   function EVP_DigestVerifyInit
     (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
      pctx : System.Address;
      c_type : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      e : System.Address;
      pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:573
   pragma Import (C, EVP_DigestVerifyInit, "EVP_DigestVerifyInit");

   function EVP_DigestVerifyFinal
     (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
      sig : access unsigned_char;
      siglen : size_t) return int;  -- openssl/evp.h:575
   pragma Import (C, EVP_DigestVerifyFinal, "EVP_DigestVerifyFinal");

   function EVP_OpenInit
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      c_type : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      ek : access unsigned_char;
      ekl : int;
      iv : access unsigned_char;
      priv : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:578
   pragma Import (C, EVP_OpenInit, "EVP_OpenInit");

   function EVP_OpenFinal
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int) return int;  -- openssl/evp.h:581
   pragma Import (C, EVP_OpenFinal, "EVP_OpenFinal");

   function EVP_SealInit
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      c_type : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      ek : System.Address;
      ekl : access int;
      iv : access unsigned_char;
      pubk : System.Address;
      npubk : int) return int;  -- openssl/evp.h:583
   pragma Import (C, EVP_SealInit, "EVP_SealInit");

   function EVP_SealFinal
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      c_out : access unsigned_char;
      outl : access int) return int;  -- openssl/evp.h:586
   pragma Import (C, EVP_SealFinal, "EVP_SealFinal");

   procedure EVP_EncodeInit (ctx : access EVP_ENCODE_CTX);  -- openssl/evp.h:588
   pragma Import (C, EVP_EncodeInit, "EVP_EncodeInit");

   procedure EVP_EncodeUpdate
     (ctx : access EVP_ENCODE_CTX;
      c_out : access unsigned_char;
      outl : access int;
      c_in : access unsigned_char;
      inl : int);  -- openssl/evp.h:589
   pragma Import (C, EVP_EncodeUpdate, "EVP_EncodeUpdate");

   procedure EVP_EncodeFinal
     (ctx : access EVP_ENCODE_CTX;
      c_out : access unsigned_char;
      outl : access int);  -- openssl/evp.h:591
   pragma Import (C, EVP_EncodeFinal, "EVP_EncodeFinal");

   function EVP_EncodeBlock
     (t : access unsigned_char;
      f : access unsigned_char;
      n : int) return int;  -- openssl/evp.h:592
   pragma Import (C, EVP_EncodeBlock, "EVP_EncodeBlock");

   procedure EVP_DecodeInit (ctx : access EVP_ENCODE_CTX);  -- openssl/evp.h:594
   pragma Import (C, EVP_DecodeInit, "EVP_DecodeInit");

   function EVP_DecodeUpdate
     (ctx : access EVP_ENCODE_CTX;
      c_out : access unsigned_char;
      outl : access int;
      c_in : access unsigned_char;
      inl : int) return int;  -- openssl/evp.h:595
   pragma Import (C, EVP_DecodeUpdate, "EVP_DecodeUpdate");

   function EVP_DecodeFinal
     (ctx : access EVP_ENCODE_CTX;
      c_out : access unsigned_char;
      outl : access int) return int;  -- openssl/evp.h:597
   pragma Import (C, EVP_DecodeFinal, "EVP_DecodeFinal");

   function EVP_DecodeBlock
     (t : access unsigned_char;
      f : access unsigned_char;
      n : int) return int;  -- openssl/evp.h:599
   pragma Import (C, EVP_DecodeBlock, "EVP_DecodeBlock");

   procedure EVP_CIPHER_CTX_init (a : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st);  -- openssl/evp.h:601
   pragma Import (C, EVP_CIPHER_CTX_init, "EVP_CIPHER_CTX_init");

   function EVP_CIPHER_CTX_cleanup (a : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st) return int;  -- openssl/evp.h:602
   pragma Import (C, EVP_CIPHER_CTX_cleanup, "EVP_CIPHER_CTX_cleanup");

   function EVP_CIPHER_CTX_new return access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;  -- openssl/evp.h:603
   pragma Import (C, EVP_CIPHER_CTX_new, "EVP_CIPHER_CTX_new");

   procedure EVP_CIPHER_CTX_free (a : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st);  -- openssl/evp.h:604
   pragma Import (C, EVP_CIPHER_CTX_free, "EVP_CIPHER_CTX_free");

   function EVP_CIPHER_CTX_set_key_length (x : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st; keylen : int) return int;  -- openssl/evp.h:605
   pragma Import (C, EVP_CIPHER_CTX_set_key_length, "EVP_CIPHER_CTX_set_key_length");

   function EVP_CIPHER_CTX_set_padding (c : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st; pad : int) return int;  -- openssl/evp.h:606
   pragma Import (C, EVP_CIPHER_CTX_set_padding, "EVP_CIPHER_CTX_set_padding");

   function EVP_CIPHER_CTX_ctrl
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      c_type : int;
      arg : int;
      ptr : System.Address) return int;  -- openssl/evp.h:607
   pragma Import (C, EVP_CIPHER_CTX_ctrl, "EVP_CIPHER_CTX_ctrl");

   function EVP_CIPHER_CTX_rand_key (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st; key : access unsigned_char) return int;  -- openssl/evp.h:608
   pragma Import (C, EVP_CIPHER_CTX_rand_key, "EVP_CIPHER_CTX_rand_key");

   function BIO_f_md return access OpenSSL.Low_Level.bio_h.BIO_METHOD;  -- openssl/evp.h:611
   pragma Import (C, BIO_f_md, "BIO_f_md");

   function BIO_f_base64 return access OpenSSL.Low_Level.bio_h.BIO_METHOD;  -- openssl/evp.h:612
   pragma Import (C, BIO_f_base64, "BIO_f_base64");

   function BIO_f_cipher return access OpenSSL.Low_Level.bio_h.BIO_METHOD;  -- openssl/evp.h:613
   pragma Import (C, BIO_f_cipher, "BIO_f_cipher");

   function BIO_f_reliable return access OpenSSL.Low_Level.bio_h.BIO_METHOD;  -- openssl/evp.h:614
   pragma Import (C, BIO_f_reliable, "BIO_f_reliable");

   procedure BIO_set_cipher
     (b : access OpenSSL.Low_Level.bio_h.BIO;
      c : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      k : access unsigned_char;
      i : access unsigned_char;
      enc : int);  -- openssl/evp.h:615
   pragma Import (C, BIO_set_cipher, "BIO_set_cipher");

   function EVP_md_null return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:619
   pragma Import (C, EVP_md_null, "EVP_md_null");

   function EVP_md2 return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:621
   pragma Import (C, EVP_md2, "EVP_md2");

   function EVP_md4 return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:624
   pragma Import (C, EVP_md4, "EVP_md4");

   function EVP_md5 return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:627
   pragma Import (C, EVP_md5, "EVP_md5");

   function EVP_sha return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:630
   pragma Import (C, EVP_sha, "EVP_sha");

   function EVP_sha1 return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:631
   pragma Import (C, EVP_sha1, "EVP_sha1");

   function EVP_dss return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:632
   pragma Import (C, EVP_dss, "EVP_dss");

   function EVP_dss1 return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:633
   pragma Import (C, EVP_dss1, "EVP_dss1");

   function EVP_ecdsa return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:634
   pragma Import (C, EVP_ecdsa, "EVP_ecdsa");

   function EVP_sha224 return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:637
   pragma Import (C, EVP_sha224, "EVP_sha224");

   function EVP_sha256 return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:638
   pragma Import (C, EVP_sha256, "EVP_sha256");

   function EVP_sha384 return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:641
   pragma Import (C, EVP_sha384, "EVP_sha384");

   function EVP_sha512 return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:642
   pragma Import (C, EVP_sha512, "EVP_sha512");

   function EVP_ripemd160 return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:648
   pragma Import (C, EVP_ripemd160, "EVP_ripemd160");

   function EVP_whirlpool return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:651
   pragma Import (C, EVP_whirlpool, "EVP_whirlpool");

   function EVP_enc_null return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:653
   pragma Import (C, EVP_enc_null, "EVP_enc_null");

   function EVP_des_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:655
   pragma Import (C, EVP_des_ecb, "EVP_des_ecb");

   function EVP_des_ede return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:656
   pragma Import (C, EVP_des_ede, "EVP_des_ede");

   function EVP_des_ede3 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:657
   pragma Import (C, EVP_des_ede3, "EVP_des_ede3");

   function EVP_des_ede_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:658
   pragma Import (C, EVP_des_ede_ecb, "EVP_des_ede_ecb");

   function EVP_des_ede3_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:659
   pragma Import (C, EVP_des_ede3_ecb, "EVP_des_ede3_ecb");

   function EVP_des_cfb64 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:660
   pragma Import (C, EVP_des_cfb64, "EVP_des_cfb64");

   function EVP_des_cfb1 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:662
   pragma Import (C, EVP_des_cfb1, "EVP_des_cfb1");

   function EVP_des_cfb8 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:663
   pragma Import (C, EVP_des_cfb8, "EVP_des_cfb8");

   function EVP_des_ede_cfb64 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:664
   pragma Import (C, EVP_des_ede_cfb64, "EVP_des_ede_cfb64");

   function EVP_des_ede3_cfb64 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:670
   pragma Import (C, EVP_des_ede3_cfb64, "EVP_des_ede3_cfb64");

   function EVP_des_ede3_cfb1 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:672
   pragma Import (C, EVP_des_ede3_cfb1, "EVP_des_ede3_cfb1");

   function EVP_des_ede3_cfb8 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:673
   pragma Import (C, EVP_des_ede3_cfb8, "EVP_des_ede3_cfb8");

   function EVP_des_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:674
   pragma Import (C, EVP_des_ofb, "EVP_des_ofb");

   function EVP_des_ede_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:675
   pragma Import (C, EVP_des_ede_ofb, "EVP_des_ede_ofb");

   function EVP_des_ede3_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:676
   pragma Import (C, EVP_des_ede3_ofb, "EVP_des_ede3_ofb");

   function EVP_des_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:677
   pragma Import (C, EVP_des_cbc, "EVP_des_cbc");

   function EVP_des_ede_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:678
   pragma Import (C, EVP_des_ede_cbc, "EVP_des_ede_cbc");

   function EVP_des_ede3_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:679
   pragma Import (C, EVP_des_ede3_cbc, "EVP_des_ede3_cbc");

   function EVP_desx_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:680
   pragma Import (C, EVP_desx_cbc, "EVP_desx_cbc");

   function EVP_rc4 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:692
   pragma Import (C, EVP_rc4, "EVP_rc4");

   function EVP_rc4_40 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:693
   pragma Import (C, EVP_rc4_40, "EVP_rc4_40");

   function EVP_rc2_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:696
   pragma Import (C, EVP_rc2_ecb, "EVP_rc2_ecb");

   function EVP_rc2_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:697
   pragma Import (C, EVP_rc2_cbc, "EVP_rc2_cbc");

   function EVP_rc2_40_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:698
   pragma Import (C, EVP_rc2_40_cbc, "EVP_rc2_40_cbc");

   function EVP_rc2_64_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:699
   pragma Import (C, EVP_rc2_64_cbc, "EVP_rc2_64_cbc");

   function EVP_rc2_cfb64 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:700
   pragma Import (C, EVP_rc2_cfb64, "EVP_rc2_cfb64");

   function EVP_rc2_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:702
   pragma Import (C, EVP_rc2_ofb, "EVP_rc2_ofb");

   function EVP_bf_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:705
   pragma Import (C, EVP_bf_ecb, "EVP_bf_ecb");

   function EVP_bf_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:706
   pragma Import (C, EVP_bf_cbc, "EVP_bf_cbc");

   function EVP_bf_cfb64 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:707
   pragma Import (C, EVP_bf_cfb64, "EVP_bf_cfb64");

   function EVP_bf_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:709
   pragma Import (C, EVP_bf_ofb, "EVP_bf_ofb");

   function EVP_cast5_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:712
   pragma Import (C, EVP_cast5_ecb, "EVP_cast5_ecb");

   function EVP_cast5_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:713
   pragma Import (C, EVP_cast5_cbc, "EVP_cast5_cbc");

   function EVP_cast5_cfb64 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:714
   pragma Import (C, EVP_cast5_cfb64, "EVP_cast5_cfb64");

   function EVP_cast5_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:716
   pragma Import (C, EVP_cast5_ofb, "EVP_cast5_ofb");

   function EVP_aes_128_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:719
   pragma Import (C, EVP_aes_128_ecb, "EVP_aes_128_ecb");

   function EVP_aes_128_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:720
   pragma Import (C, EVP_aes_128_cbc, "EVP_aes_128_cbc");

   function EVP_aes_128_cfb1 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:721
   pragma Import (C, EVP_aes_128_cfb1, "EVP_aes_128_cfb1");

   function EVP_aes_128_cfb8 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:722
   pragma Import (C, EVP_aes_128_cfb8, "EVP_aes_128_cfb8");

   function EVP_aes_128_cfb128 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:723
   pragma Import (C, EVP_aes_128_cfb128, "EVP_aes_128_cfb128");

   function EVP_aes_128_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:725
   pragma Import (C, EVP_aes_128_ofb, "EVP_aes_128_ofb");

   function EVP_aes_192_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:729
   pragma Import (C, EVP_aes_192_ecb, "EVP_aes_192_ecb");

   function EVP_aes_192_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:730
   pragma Import (C, EVP_aes_192_cbc, "EVP_aes_192_cbc");

   function EVP_aes_192_cfb1 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:731
   pragma Import (C, EVP_aes_192_cfb1, "EVP_aes_192_cfb1");

   function EVP_aes_192_cfb8 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:732
   pragma Import (C, EVP_aes_192_cfb8, "EVP_aes_192_cfb8");

   function EVP_aes_192_cfb128 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:733
   pragma Import (C, EVP_aes_192_cfb128, "EVP_aes_192_cfb128");

   function EVP_aes_192_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:735
   pragma Import (C, EVP_aes_192_ofb, "EVP_aes_192_ofb");

   function EVP_aes_256_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:739
   pragma Import (C, EVP_aes_256_ecb, "EVP_aes_256_ecb");

   function EVP_aes_256_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:740
   pragma Import (C, EVP_aes_256_cbc, "EVP_aes_256_cbc");

   function EVP_aes_256_cfb1 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:741
   pragma Import (C, EVP_aes_256_cfb1, "EVP_aes_256_cfb1");

   function EVP_aes_256_cfb8 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:742
   pragma Import (C, EVP_aes_256_cfb8, "EVP_aes_256_cfb8");

   function EVP_aes_256_cfb128 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:743
   pragma Import (C, EVP_aes_256_cfb128, "EVP_aes_256_cfb128");

   function EVP_aes_256_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:745
   pragma Import (C, EVP_aes_256_ofb, "EVP_aes_256_ofb");

   function EVP_camellia_128_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:751
   pragma Import (C, EVP_camellia_128_ecb, "EVP_camellia_128_ecb");

   function EVP_camellia_128_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:752
   pragma Import (C, EVP_camellia_128_cbc, "EVP_camellia_128_cbc");

   function EVP_camellia_128_cfb1 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:753
   pragma Import (C, EVP_camellia_128_cfb1, "EVP_camellia_128_cfb1");

   function EVP_camellia_128_cfb8 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:754
   pragma Import (C, EVP_camellia_128_cfb8, "EVP_camellia_128_cfb8");

   function EVP_camellia_128_cfb128 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:755
   pragma Import (C, EVP_camellia_128_cfb128, "EVP_camellia_128_cfb128");

   function EVP_camellia_128_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:757
   pragma Import (C, EVP_camellia_128_ofb, "EVP_camellia_128_ofb");

   function EVP_camellia_192_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:758
   pragma Import (C, EVP_camellia_192_ecb, "EVP_camellia_192_ecb");

   function EVP_camellia_192_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:759
   pragma Import (C, EVP_camellia_192_cbc, "EVP_camellia_192_cbc");

   function EVP_camellia_192_cfb1 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:760
   pragma Import (C, EVP_camellia_192_cfb1, "EVP_camellia_192_cfb1");

   function EVP_camellia_192_cfb8 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:761
   pragma Import (C, EVP_camellia_192_cfb8, "EVP_camellia_192_cfb8");

   function EVP_camellia_192_cfb128 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:762
   pragma Import (C, EVP_camellia_192_cfb128, "EVP_camellia_192_cfb128");

   function EVP_camellia_192_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:764
   pragma Import (C, EVP_camellia_192_ofb, "EVP_camellia_192_ofb");

   function EVP_camellia_256_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:765
   pragma Import (C, EVP_camellia_256_ecb, "EVP_camellia_256_ecb");

   function EVP_camellia_256_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:766
   pragma Import (C, EVP_camellia_256_cbc, "EVP_camellia_256_cbc");

   function EVP_camellia_256_cfb1 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:767
   pragma Import (C, EVP_camellia_256_cfb1, "EVP_camellia_256_cfb1");

   function EVP_camellia_256_cfb8 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:768
   pragma Import (C, EVP_camellia_256_cfb8, "EVP_camellia_256_cfb8");

   function EVP_camellia_256_cfb128 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:769
   pragma Import (C, EVP_camellia_256_cfb128, "EVP_camellia_256_cfb128");

   function EVP_camellia_256_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:771
   pragma Import (C, EVP_camellia_256_ofb, "EVP_camellia_256_ofb");

   function EVP_seed_ecb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:775
   pragma Import (C, EVP_seed_ecb, "EVP_seed_ecb");

   function EVP_seed_cbc return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:776
   pragma Import (C, EVP_seed_cbc, "EVP_seed_cbc");

   function EVP_seed_cfb128 return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:777
   pragma Import (C, EVP_seed_cfb128, "EVP_seed_cfb128");

   function EVP_seed_ofb return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:779
   pragma Import (C, EVP_seed_ofb, "EVP_seed_ofb");

   procedure OPENSSL_add_all_algorithms_noconf;  -- openssl/evp.h:782
   pragma Import (C, OPENSSL_add_all_algorithms_noconf, "OPENSSL_add_all_algorithms_noconf");

   procedure OPENSSL_add_all_algorithms_conf;  -- openssl/evp.h:783
   pragma Import (C, OPENSSL_add_all_algorithms_conf, "OPENSSL_add_all_algorithms_conf");

   procedure OpenSSL_add_all_ciphers;  -- openssl/evp.h:793
   pragma Import (C, OpenSSL_add_all_ciphers, "OpenSSL_add_all_ciphers");

   procedure OpenSSL_add_all_digests;  -- openssl/evp.h:794
   pragma Import (C, OpenSSL_add_all_digests, "OpenSSL_add_all_digests");

   function EVP_add_cipher (cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st) return int;  -- openssl/evp.h:799
   pragma Import (C, EVP_add_cipher, "EVP_add_cipher");

   function EVP_add_digest (digest : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/evp.h:800
   pragma Import (C, EVP_add_digest, "EVP_add_digest");

   function EVP_get_cipherbyname (name : Interfaces.C.Strings.chars_ptr) return access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/evp.h:802
   pragma Import (C, EVP_get_cipherbyname, "EVP_get_cipherbyname");

   function EVP_get_digestbyname (name : Interfaces.C.Strings.chars_ptr) return access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/evp.h:803
   pragma Import (C, EVP_get_digestbyname, "EVP_get_digestbyname");

   procedure EVP_cleanup;  -- openssl/evp.h:804
   pragma Import (C, EVP_cleanup, "EVP_cleanup");

   procedure EVP_CIPHER_do_all (fn : access procedure
        (arg1 : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : System.Address); arg : System.Address);  -- openssl/evp.h:806
   pragma Import (C, EVP_CIPHER_do_all, "EVP_CIPHER_do_all");

   procedure EVP_CIPHER_do_all_sorted (fn : access procedure
        (arg1 : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : System.Address); arg : System.Address);  -- openssl/evp.h:808
   pragma Import (C, EVP_CIPHER_do_all_sorted, "EVP_CIPHER_do_all_sorted");

   procedure EVP_MD_do_all (fn : access procedure
        (arg1 : access constant OpenSSL.Low_Level.evp_h.env_md_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : System.Address); arg : System.Address);  -- openssl/evp.h:811
   pragma Import (C, EVP_MD_do_all, "EVP_MD_do_all");

   procedure EVP_MD_do_all_sorted (fn : access procedure
        (arg1 : access constant OpenSSL.Low_Level.evp_h.env_md_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : System.Address); arg : System.Address);  -- openssl/evp.h:813
   pragma Import (C, EVP_MD_do_all_sorted, "EVP_MD_do_all_sorted");

   function EVP_PKEY_decrypt_old
     (dec_key : access unsigned_char;
      enc_key : access unsigned_char;
      enc_key_len : int;
      private_key : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:816
   pragma Import (C, EVP_PKEY_decrypt_old, "EVP_PKEY_decrypt_old");

   function EVP_PKEY_encrypt_old
     (enc_key : access unsigned_char;
      key : access unsigned_char;
      key_len : int;
      pub_key : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:819
   pragma Import (C, EVP_PKEY_encrypt_old, "EVP_PKEY_encrypt_old");

   function EVP_PKEY_type (c_type : int) return int;  -- openssl/evp.h:822
   pragma Import (C, EVP_PKEY_type, "EVP_PKEY_type");

   function EVP_PKEY_id (pkey : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:823
   pragma Import (C, EVP_PKEY_id, "EVP_PKEY_id");

   function EVP_PKEY_base_id (pkey : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:824
   pragma Import (C, EVP_PKEY_base_id, "EVP_PKEY_base_id");

   function EVP_PKEY_bits (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:825
   pragma Import (C, EVP_PKEY_bits, "EVP_PKEY_bits");

   function EVP_PKEY_size (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:826
   pragma Import (C, EVP_PKEY_size, "EVP_PKEY_size");

   function EVP_PKEY_set_type (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st; c_type : int) return int;  -- openssl/evp.h:827
   pragma Import (C, EVP_PKEY_set_type, "EVP_PKEY_set_type");

   function EVP_PKEY_set_type_str
     (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      str : Interfaces.C.Strings.chars_ptr;
      len : int) return int;  -- openssl/evp.h:828
   pragma Import (C, EVP_PKEY_set_type_str, "EVP_PKEY_set_type_str");

   function EVP_PKEY_assign
     (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      c_type : int;
      key : System.Address) return int;  -- openssl/evp.h:829
   pragma Import (C, EVP_PKEY_assign, "EVP_PKEY_assign");

   function EVP_PKEY_get0 (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return System.Address;  -- openssl/evp.h:830
   pragma Import (C, EVP_PKEY_get0, "EVP_PKEY_get0");

   function EVP_PKEY_set1_RSA (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st; key : access OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/evp.h:834
   pragma Import (C, EVP_PKEY_set1_RSA, "EVP_PKEY_set1_RSA");

   function EVP_PKEY_get1_RSA (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/evp.h:835
   pragma Import (C, EVP_PKEY_get1_RSA, "EVP_PKEY_get1_RSA");

   function EVP_PKEY_set1_DSA (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st; key : access OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/evp.h:839
   pragma Import (C, EVP_PKEY_set1_DSA, "EVP_PKEY_set1_DSA");

   function EVP_PKEY_get1_DSA (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/evp.h:840
   pragma Import (C, EVP_PKEY_get1_DSA, "EVP_PKEY_get1_DSA");

   function EVP_PKEY_set1_DH (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st; key : access OpenSSL.Low_Level.dh_h.dh_st) return int;  -- openssl/evp.h:844
   pragma Import (C, EVP_PKEY_set1_DH, "EVP_PKEY_set1_DH");

   function EVP_PKEY_get1_DH (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return access OpenSSL.Low_Level.dh_h.dh_st;  -- openssl/evp.h:845
   pragma Import (C, EVP_PKEY_get1_DH, "EVP_PKEY_get1_DH");

   function EVP_PKEY_new return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/evp.h:848
   pragma Import (C, EVP_PKEY_new, "EVP_PKEY_new");

   procedure EVP_PKEY_free (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st);  -- openssl/evp.h:849
   pragma Import (C, EVP_PKEY_free, "EVP_PKEY_free");

   function d2i_PublicKey
     (c_type : int;
      a : System.Address;
      pp : System.Address;
      length : long) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/evp.h:851
   pragma Import (C, d2i_PublicKey, "d2i_PublicKey");

   function i2d_PublicKey (a : access OpenSSL.Low_Level.evp_h.evp_pkey_st; pp : System.Address) return int;  -- openssl/evp.h:853
   pragma Import (C, i2d_PublicKey, "i2d_PublicKey");

   function d2i_PrivateKey
     (c_type : int;
      a : System.Address;
      pp : System.Address;
      length : long) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/evp.h:855
   pragma Import (C, d2i_PrivateKey, "d2i_PrivateKey");

   function d2i_AutoPrivateKey
     (a : System.Address;
      pp : System.Address;
      length : long) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/evp.h:857
   pragma Import (C, d2i_AutoPrivateKey, "d2i_AutoPrivateKey");

   function i2d_PrivateKey (a : access OpenSSL.Low_Level.evp_h.evp_pkey_st; pp : System.Address) return int;  -- openssl/evp.h:859
   pragma Import (C, i2d_PrivateKey, "i2d_PrivateKey");

   function EVP_PKEY_copy_parameters (to : access OpenSSL.Low_Level.evp_h.evp_pkey_st; from : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:861
   pragma Import (C, EVP_PKEY_copy_parameters, "EVP_PKEY_copy_parameters");

   function EVP_PKEY_missing_parameters (pkey : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:862
   pragma Import (C, EVP_PKEY_missing_parameters, "EVP_PKEY_missing_parameters");

   function EVP_PKEY_save_parameters (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st; mode : int) return int;  -- openssl/evp.h:863
   pragma Import (C, EVP_PKEY_save_parameters, "EVP_PKEY_save_parameters");

   function EVP_PKEY_cmp_parameters (a : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st; b : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:864
   pragma Import (C, EVP_PKEY_cmp_parameters, "EVP_PKEY_cmp_parameters");

   function EVP_PKEY_cmp (a : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st; b : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:866
   pragma Import (C, EVP_PKEY_cmp, "EVP_PKEY_cmp");

   function EVP_PKEY_print_public
     (c_out : access OpenSSL.Low_Level.bio_h.BIO;
      pkey : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st;
      indent : int;
      pctx : System.Address) return int;  -- openssl/evp.h:868
   pragma Import (C, EVP_PKEY_print_public, "EVP_PKEY_print_public");

   function EVP_PKEY_print_private
     (c_out : access OpenSSL.Low_Level.bio_h.BIO;
      pkey : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st;
      indent : int;
      pctx : System.Address) return int;  -- openssl/evp.h:870
   pragma Import (C, EVP_PKEY_print_private, "EVP_PKEY_print_private");

   function EVP_PKEY_print_params
     (c_out : access OpenSSL.Low_Level.bio_h.BIO;
      pkey : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st;
      indent : int;
      pctx : System.Address) return int;  -- openssl/evp.h:872
   pragma Import (C, EVP_PKEY_print_params, "EVP_PKEY_print_params");

   function EVP_PKEY_get_default_digest_nid (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st; pnid : access int) return int;  -- openssl/evp.h:875
   pragma Import (C, EVP_PKEY_get_default_digest_nid, "EVP_PKEY_get_default_digest_nid");

   function EVP_CIPHER_type (ctx : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st) return int;  -- openssl/evp.h:877
   pragma Import (C, EVP_CIPHER_type, "EVP_CIPHER_type");

   function EVP_CIPHER_param_to_asn1 (c : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st; c_type : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE) return int;  -- openssl/evp.h:880
   pragma Import (C, EVP_CIPHER_param_to_asn1, "EVP_CIPHER_param_to_asn1");

   function EVP_CIPHER_asn1_to_param (c : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st; c_type : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE) return int;  -- openssl/evp.h:881
   pragma Import (C, EVP_CIPHER_asn1_to_param, "EVP_CIPHER_asn1_to_param");

   function EVP_CIPHER_set_asn1_iv (c : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st; c_type : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE) return int;  -- openssl/evp.h:884
   pragma Import (C, EVP_CIPHER_set_asn1_iv, "EVP_CIPHER_set_asn1_iv");

   function EVP_CIPHER_get_asn1_iv (c : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st; c_type : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE) return int;  -- openssl/evp.h:885
   pragma Import (C, EVP_CIPHER_get_asn1_iv, "EVP_CIPHER_get_asn1_iv");

   function PKCS5_PBE_keyivgen
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      param : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      md : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      en_de : int) return int;  -- openssl/evp.h:888
   pragma Import (C, PKCS5_PBE_keyivgen, "PKCS5_PBE_keyivgen");

   function PKCS5_PBKDF2_HMAC_SHA1
     (pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      salt : access unsigned_char;
      saltlen : int;
      iter : int;
      keylen : int;
      c_out : access unsigned_char) return int;  -- openssl/evp.h:891
   pragma Import (C, PKCS5_PBKDF2_HMAC_SHA1, "PKCS5_PBKDF2_HMAC_SHA1");

   function PKCS5_PBKDF2_HMAC
     (pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      salt : access unsigned_char;
      saltlen : int;
      iter : int;
      digest : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      keylen : int;
      c_out : access unsigned_char) return int;  -- openssl/evp.h:894
   pragma Import (C, PKCS5_PBKDF2_HMAC, "PKCS5_PBKDF2_HMAC");

   function PKCS5_v2_PBE_keyivgen
     (ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      param : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      md : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      en_de : int) return int;  -- openssl/evp.h:898
   pragma Import (C, PKCS5_v2_PBE_keyivgen, "PKCS5_v2_PBE_keyivgen");

   procedure PKCS5_PBE_add;  -- openssl/evp.h:902
   pragma Import (C, PKCS5_PBE_add, "PKCS5_PBE_add");

   function EVP_PBE_CipherInit
     (pbe_obj : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;
      pass : Interfaces.C.Strings.chars_ptr;
      passlen : int;
      param : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE;
      ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
      en_de : int) return int;  -- openssl/evp.h:904
   pragma Import (C, EVP_PBE_CipherInit, "EVP_PBE_CipherInit");

   function EVP_PBE_alg_add_type
     (pbe_type : int;
      pbe_nid : int;
      cipher_nid : int;
      md_nid : int;
      keygen : access function
        (arg1 : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE;
         arg5 : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
         arg6 : access constant OpenSSL.Low_Level.evp_h.env_md_st;
         arg7 : int) return int) return int;  -- openssl/evp.h:914
   pragma Import (C, EVP_PBE_alg_add_type, "EVP_PBE_alg_add_type");

   function EVP_PBE_alg_add
     (nid : int;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      md : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      keygen : access function
        (arg1 : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : int;
         arg4 : access OpenSSL.Low_Level.asn1_h.ASN1_TYPE;
         arg5 : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
         arg6 : access constant OpenSSL.Low_Level.evp_h.env_md_st;
         arg7 : int) return int) return int;  -- openssl/evp.h:916
   pragma Import (C, EVP_PBE_alg_add, "EVP_PBE_alg_add");

   function EVP_PBE_find
     (c_type : int;
      pbe_nid : int;
      pcnid : access int;
      pmnid : access int;
      pkeygen : System.Address) return int;  -- openssl/evp.h:918
   pragma Import (C, EVP_PBE_find, "EVP_PBE_find");

   procedure EVP_PBE_cleanup;  -- openssl/evp.h:920
   pragma Import (C, EVP_PBE_cleanup, "EVP_PBE_cleanup");

   function EVP_PKEY_asn1_get_count return int;  -- openssl/evp.h:932
   pragma Import (C, EVP_PKEY_asn1_get_count, "EVP_PKEY_asn1_get_count");

   function EVP_PKEY_asn1_get0 (idx : int) return System.Address;  -- openssl/evp.h:933
   pragma Import (C, EVP_PKEY_asn1_get0, "EVP_PKEY_asn1_get0");

   function EVP_PKEY_asn1_find (pe : System.Address; c_type : int) return System.Address;  -- openssl/evp.h:934
   pragma Import (C, EVP_PKEY_asn1_find, "EVP_PKEY_asn1_find");

   function EVP_PKEY_asn1_find_str
     (pe : System.Address;
      str : Interfaces.C.Strings.chars_ptr;
      len : int) return System.Address;  -- openssl/evp.h:935
   pragma Import (C, EVP_PKEY_asn1_find_str, "EVP_PKEY_asn1_find_str");

   function EVP_PKEY_asn1_add0 (ameth : System.Address) return int;  -- openssl/evp.h:937
   pragma Import (C, EVP_PKEY_asn1_add0, "EVP_PKEY_asn1_add0");

   function EVP_PKEY_asn1_add_alias (to : int; from : int) return int;  -- openssl/evp.h:938
   pragma Import (C, EVP_PKEY_asn1_add_alias, "EVP_PKEY_asn1_add_alias");

   function EVP_PKEY_asn1_get0_info
     (ppkey_id : access int;
      pkey_base_id : access int;
      ppkey_flags : access int;
      pinfo : System.Address;
      ppem_str : System.Address;
      ameth : System.Address) return int;  -- openssl/evp.h:939
   pragma Import (C, EVP_PKEY_asn1_get0_info, "EVP_PKEY_asn1_get0_info");

   function EVP_PKEY_get0_asn1 (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return System.Address;  -- openssl/evp.h:943
   pragma Import (C, EVP_PKEY_get0_asn1, "EVP_PKEY_get0_asn1");

   function EVP_PKEY_asn1_new
     (id : int;
      flags : int;
      pem_str : Interfaces.C.Strings.chars_ptr;
      info : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/evp.h:944
   pragma Import (C, EVP_PKEY_asn1_new, "EVP_PKEY_asn1_new");

   procedure EVP_PKEY_asn1_copy (dst : System.Address; src : System.Address);  -- openssl/evp.h:946
   pragma Import (C, EVP_PKEY_asn1_copy, "EVP_PKEY_asn1_copy");

   procedure EVP_PKEY_asn1_free (ameth : System.Address);  -- openssl/evp.h:948
   pragma Import (C, EVP_PKEY_asn1_free, "EVP_PKEY_asn1_free");

   procedure EVP_PKEY_asn1_set_public
     (ameth : System.Address;
      pub_decode : access function (arg1 : access OpenSSL.Low_Level.evp_h.evp_pkey_st; arg2 : access OpenSSL.Low_Level.x509_h.X509_pubkey_st) return int;
      pub_encode : access function (arg1 : access OpenSSL.Low_Level.x509_h.X509_pubkey_st; arg2 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;
      pub_cmp : access function (arg1 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st; arg2 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;
      pub_print : access function
        (arg1 : access OpenSSL.Low_Level.bio_h.BIO;
         arg2 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st;
         arg3 : int;
         arg4 : System.Address) return int;
      pkey_size : access function (arg1 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;
      pkey_bits : access function (arg1 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int);  -- openssl/evp.h:949
   pragma Import (C, EVP_PKEY_asn1_set_public, "EVP_PKEY_asn1_set_public");

   procedure EVP_PKEY_asn1_set_private
     (ameth : System.Address;
      priv_decode : access function (arg1 : access OpenSSL.Low_Level.evp_h.evp_pkey_st; arg2 : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st) return int;
      priv_encode : access function (arg1 : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st; arg2 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;
      priv_print : access function
        (arg1 : access OpenSSL.Low_Level.bio_h.BIO;
         arg2 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st;
         arg3 : int;
         arg4 : System.Address) return int);  -- openssl/evp.h:957
   pragma Import (C, EVP_PKEY_asn1_set_private, "EVP_PKEY_asn1_set_private");

   procedure EVP_PKEY_asn1_set_param
     (ameth : System.Address;
      param_decode : access function
        (arg1 : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
         arg2 : System.Address;
         arg3 : int) return int;
      param_encode : access function (arg1 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st; arg2 : System.Address) return int;
      param_missing : access function (arg1 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;
      param_copy : access function (arg1 : access OpenSSL.Low_Level.evp_h.evp_pkey_st; arg2 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;
      param_cmp : access function (arg1 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st; arg2 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;
      param_print : access function
        (arg1 : access OpenSSL.Low_Level.bio_h.BIO;
         arg2 : access constant OpenSSL.Low_Level.evp_h.evp_pkey_st;
         arg3 : int;
         arg4 : System.Address) return int);  -- openssl/evp.h:962
   pragma Import (C, EVP_PKEY_asn1_set_param, "EVP_PKEY_asn1_set_param");

   procedure EVP_PKEY_asn1_set_free (ameth : System.Address; pkey_free : access procedure (arg1 : access OpenSSL.Low_Level.evp_h.evp_pkey_st));  -- openssl/evp.h:972
   pragma Import (C, EVP_PKEY_asn1_set_free, "EVP_PKEY_asn1_set_free");

   procedure EVP_PKEY_asn1_set_ctrl (ameth : System.Address; pkey_ctrl : access function
        (arg1 : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
         arg2 : int;
         arg3 : long;
         arg4 : System.Address) return int);  -- openssl/evp.h:974
   pragma Import (C, EVP_PKEY_asn1_set_ctrl, "EVP_PKEY_asn1_set_ctrl");

   function EVP_PKEY_meth_find (c_type : int) return System.Address;  -- openssl/evp.h:1032
   pragma Import (C, EVP_PKEY_meth_find, "EVP_PKEY_meth_find");

   function EVP_PKEY_meth_new (id : int; flags : int) return System.Address;  -- openssl/evp.h:1033
   pragma Import (C, EVP_PKEY_meth_new, "EVP_PKEY_meth_new");

   procedure EVP_PKEY_meth_free (pmeth : System.Address);  -- openssl/evp.h:1034
   pragma Import (C, EVP_PKEY_meth_free, "EVP_PKEY_meth_free");

   function EVP_PKEY_meth_add0 (pmeth : System.Address) return int;  -- openssl/evp.h:1035
   pragma Import (C, EVP_PKEY_meth_add0, "EVP_PKEY_meth_add0");

   function EVP_PKEY_CTX_new (pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st; e : System.Address) return System.Address;  -- openssl/evp.h:1037
   pragma Import (C, EVP_PKEY_CTX_new, "EVP_PKEY_CTX_new");

   function EVP_PKEY_CTX_new_id (id : int; e : System.Address) return System.Address;  -- openssl/evp.h:1038
   pragma Import (C, EVP_PKEY_CTX_new_id, "EVP_PKEY_CTX_new_id");

   function EVP_PKEY_CTX_dup (ctx : System.Address) return System.Address;  -- openssl/evp.h:1039
   pragma Import (C, EVP_PKEY_CTX_dup, "EVP_PKEY_CTX_dup");

   procedure EVP_PKEY_CTX_free (ctx : System.Address);  -- openssl/evp.h:1040
   pragma Import (C, EVP_PKEY_CTX_free, "EVP_PKEY_CTX_free");

   function EVP_PKEY_CTX_ctrl
     (ctx : System.Address;
      keytype : int;
      optype : int;
      cmd : int;
      p1 : int;
      p2 : System.Address) return int;  -- openssl/evp.h:1042
   pragma Import (C, EVP_PKEY_CTX_ctrl, "EVP_PKEY_CTX_ctrl");

   function EVP_PKEY_CTX_ctrl_str
     (ctx : System.Address;
      c_type : Interfaces.C.Strings.chars_ptr;
      value : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/evp.h:1044
   pragma Import (C, EVP_PKEY_CTX_ctrl_str, "EVP_PKEY_CTX_ctrl_str");

   function EVP_PKEY_CTX_get_operation (ctx : System.Address) return int;  -- openssl/evp.h:1047
   pragma Import (C, EVP_PKEY_CTX_get_operation, "EVP_PKEY_CTX_get_operation");

   procedure EVP_PKEY_CTX_set0_keygen_info
     (ctx : System.Address;
      dat : access int;
      datlen : int);  -- openssl/evp.h:1048
   pragma Import (C, EVP_PKEY_CTX_set0_keygen_info, "EVP_PKEY_CTX_set0_keygen_info");

   function EVP_PKEY_new_mac_key
     (c_type : int;
      e : System.Address;
      key : access unsigned_char;
      keylen : int) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/evp.h:1050
   pragma Import (C, EVP_PKEY_new_mac_key, "EVP_PKEY_new_mac_key");

   procedure EVP_PKEY_CTX_set_data (ctx : System.Address; data : System.Address);  -- openssl/evp.h:1053
   pragma Import (C, EVP_PKEY_CTX_set_data, "EVP_PKEY_CTX_set_data");

   function EVP_PKEY_CTX_get_data (ctx : System.Address) return System.Address;  -- openssl/evp.h:1054
   pragma Import (C, EVP_PKEY_CTX_get_data, "EVP_PKEY_CTX_get_data");

   function EVP_PKEY_CTX_get0_pkey (ctx : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/evp.h:1055
   pragma Import (C, EVP_PKEY_CTX_get0_pkey, "EVP_PKEY_CTX_get0_pkey");

   function EVP_PKEY_CTX_get0_peerkey (ctx : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/evp.h:1057
   pragma Import (C, EVP_PKEY_CTX_get0_peerkey, "EVP_PKEY_CTX_get0_peerkey");

   procedure EVP_PKEY_CTX_set_app_data (ctx : System.Address; data : System.Address);  -- openssl/evp.h:1059
   pragma Import (C, EVP_PKEY_CTX_set_app_data, "EVP_PKEY_CTX_set_app_data");

   function EVP_PKEY_CTX_get_app_data (ctx : System.Address) return System.Address;  -- openssl/evp.h:1060
   pragma Import (C, EVP_PKEY_CTX_get_app_data, "EVP_PKEY_CTX_get_app_data");

   function EVP_PKEY_sign_init (ctx : System.Address) return int;  -- openssl/evp.h:1062
   pragma Import (C, EVP_PKEY_sign_init, "EVP_PKEY_sign_init");

   function EVP_PKEY_sign
     (ctx : System.Address;
      sig : access unsigned_char;
      siglen : access size_t;
      tbs : access unsigned_char;
      tbslen : size_t) return int;  -- openssl/evp.h:1063
   pragma Import (C, EVP_PKEY_sign, "EVP_PKEY_sign");

   function EVP_PKEY_verify_init (ctx : System.Address) return int;  -- openssl/evp.h:1066
   pragma Import (C, EVP_PKEY_verify_init, "EVP_PKEY_verify_init");

   function EVP_PKEY_verify
     (ctx : System.Address;
      sig : access unsigned_char;
      siglen : size_t;
      tbs : access unsigned_char;
      tbslen : size_t) return int;  -- openssl/evp.h:1067
   pragma Import (C, EVP_PKEY_verify, "EVP_PKEY_verify");

   function EVP_PKEY_verify_recover_init (ctx : System.Address) return int;  -- openssl/evp.h:1070
   pragma Import (C, EVP_PKEY_verify_recover_init, "EVP_PKEY_verify_recover_init");

   function EVP_PKEY_verify_recover
     (ctx : System.Address;
      rout : access unsigned_char;
      routlen : access size_t;
      sig : access unsigned_char;
      siglen : size_t) return int;  -- openssl/evp.h:1071
   pragma Import (C, EVP_PKEY_verify_recover, "EVP_PKEY_verify_recover");

   function EVP_PKEY_encrypt_init (ctx : System.Address) return int;  -- openssl/evp.h:1074
   pragma Import (C, EVP_PKEY_encrypt_init, "EVP_PKEY_encrypt_init");

   function EVP_PKEY_encrypt
     (ctx : System.Address;
      c_out : access unsigned_char;
      outlen : access size_t;
      c_in : access unsigned_char;
      inlen : size_t) return int;  -- openssl/evp.h:1075
   pragma Import (C, EVP_PKEY_encrypt, "EVP_PKEY_encrypt");

   function EVP_PKEY_decrypt_init (ctx : System.Address) return int;  -- openssl/evp.h:1078
   pragma Import (C, EVP_PKEY_decrypt_init, "EVP_PKEY_decrypt_init");

   function EVP_PKEY_decrypt
     (ctx : System.Address;
      c_out : access unsigned_char;
      outlen : access size_t;
      c_in : access unsigned_char;
      inlen : size_t) return int;  -- openssl/evp.h:1079
   pragma Import (C, EVP_PKEY_decrypt, "EVP_PKEY_decrypt");

   function EVP_PKEY_derive_init (ctx : System.Address) return int;  -- openssl/evp.h:1083
   pragma Import (C, EVP_PKEY_derive_init, "EVP_PKEY_derive_init");

   function EVP_PKEY_derive_set_peer (ctx : System.Address; peer : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/evp.h:1084
   pragma Import (C, EVP_PKEY_derive_set_peer, "EVP_PKEY_derive_set_peer");

   function EVP_PKEY_derive
     (ctx : System.Address;
      key : access unsigned_char;
      keylen : access size_t) return int;  -- openssl/evp.h:1085
   pragma Import (C, EVP_PKEY_derive, "EVP_PKEY_derive");

   --  skipped function type EVP_PKEY_gen_cb

   function EVP_PKEY_paramgen_init (ctx : System.Address) return int;  -- openssl/evp.h:1089
   pragma Import (C, EVP_PKEY_paramgen_init, "EVP_PKEY_paramgen_init");

   function EVP_PKEY_paramgen (ctx : System.Address; ppkey : System.Address) return int;  -- openssl/evp.h:1090
   pragma Import (C, EVP_PKEY_paramgen, "EVP_PKEY_paramgen");

   function EVP_PKEY_keygen_init (ctx : System.Address) return int;  -- openssl/evp.h:1091
   pragma Import (C, EVP_PKEY_keygen_init, "EVP_PKEY_keygen_init");

   function EVP_PKEY_keygen (ctx : System.Address; ppkey : System.Address) return int;  -- openssl/evp.h:1092
   pragma Import (C, EVP_PKEY_keygen, "EVP_PKEY_keygen");

   procedure EVP_PKEY_CTX_set_cb (ctx : System.Address; cb : access function (arg1 : System.Address) return int);  -- openssl/evp.h:1094
   pragma Import (C, EVP_PKEY_CTX_set_cb, "EVP_PKEY_CTX_set_cb");

   function EVP_PKEY_CTX_get_cb (ctx : System.Address) return access function (arg1 : System.Address) return int;  -- openssl/evp.h:1095
   pragma Import (C, EVP_PKEY_CTX_get_cb, "EVP_PKEY_CTX_get_cb");

   function EVP_PKEY_CTX_get_keygen_info (ctx : System.Address; idx : int) return int;  -- openssl/evp.h:1097
   pragma Import (C, EVP_PKEY_CTX_get_keygen_info, "EVP_PKEY_CTX_get_keygen_info");

   procedure EVP_PKEY_meth_set_init (pmeth : System.Address; init : access function (arg1 : System.Address) return int);  -- openssl/evp.h:1099
   pragma Import (C, EVP_PKEY_meth_set_init, "EVP_PKEY_meth_set_init");

   procedure EVP_PKEY_meth_set_copy (pmeth : System.Address; copy : access function (arg1 : System.Address; arg2 : System.Address) return int);  -- openssl/evp.h:1102
   pragma Import (C, EVP_PKEY_meth_set_copy, "EVP_PKEY_meth_set_copy");

   procedure EVP_PKEY_meth_set_cleanup (pmeth : System.Address; cleanup : access procedure (arg1 : System.Address));  -- openssl/evp.h:1105
   pragma Import (C, EVP_PKEY_meth_set_cleanup, "EVP_PKEY_meth_set_cleanup");

   procedure EVP_PKEY_meth_set_paramgen
     (pmeth : System.Address;
      paramgen_init : access function (arg1 : System.Address) return int;
      paramgen : access function (arg1 : System.Address; arg2 : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int);  -- openssl/evp.h:1108
   pragma Import (C, EVP_PKEY_meth_set_paramgen, "EVP_PKEY_meth_set_paramgen");

   procedure EVP_PKEY_meth_set_keygen
     (pmeth : System.Address;
      keygen_init : access function (arg1 : System.Address) return int;
      keygen : access function (arg1 : System.Address; arg2 : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int);  -- openssl/evp.h:1112
   pragma Import (C, EVP_PKEY_meth_set_keygen, "EVP_PKEY_meth_set_keygen");

   procedure EVP_PKEY_meth_set_sign
     (pmeth : System.Address;
      sign_init : access function (arg1 : System.Address) return int;
      sign : access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access size_t;
         arg4 : access unsigned_char;
         arg5 : size_t) return int);  -- openssl/evp.h:1116
   pragma Import (C, EVP_PKEY_meth_set_sign, "EVP_PKEY_meth_set_sign");

   procedure EVP_PKEY_meth_set_verify
     (pmeth : System.Address;
      verify_init : access function (arg1 : System.Address) return int;
      verify : access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : size_t;
         arg4 : access unsigned_char;
         arg5 : size_t) return int);  -- openssl/evp.h:1121
   pragma Import (C, EVP_PKEY_meth_set_verify, "EVP_PKEY_meth_set_verify");

   procedure EVP_PKEY_meth_set_verify_recover
     (pmeth : System.Address;
      verify_recover_init : access function (arg1 : System.Address) return int;
      verify_recover : access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access size_t;
         arg4 : access unsigned_char;
         arg5 : size_t) return int);  -- openssl/evp.h:1126
   pragma Import (C, EVP_PKEY_meth_set_verify_recover, "EVP_PKEY_meth_set_verify_recover");

   procedure EVP_PKEY_meth_set_signctx
     (pmeth : System.Address;
      signctx_init : access function (arg1 : System.Address; arg2 : access OpenSSL.Low_Level.evp_h.env_md_ctx_st) return int;
      signctx : access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access size_t;
         arg4 : access OpenSSL.Low_Level.evp_h.env_md_ctx_st) return int);  -- openssl/evp.h:1132
   pragma Import (C, EVP_PKEY_meth_set_signctx, "EVP_PKEY_meth_set_signctx");

   procedure EVP_PKEY_meth_set_verifyctx
     (pmeth : System.Address;
      verifyctx_init : access function (arg1 : System.Address; arg2 : access OpenSSL.Low_Level.evp_h.env_md_ctx_st) return int;
      verifyctx : access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : int;
         arg4 : access OpenSSL.Low_Level.evp_h.env_md_ctx_st) return int);  -- openssl/evp.h:1137
   pragma Import (C, EVP_PKEY_meth_set_verifyctx, "EVP_PKEY_meth_set_verifyctx");

   procedure EVP_PKEY_meth_set_encrypt
     (pmeth : System.Address;
      encrypt_init : access function (arg1 : System.Address) return int;
      encryptfn : access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access size_t;
         arg4 : access unsigned_char;
         arg5 : size_t) return int);  -- openssl/evp.h:1142
   pragma Import (C, EVP_PKEY_meth_set_encrypt, "EVP_PKEY_meth_set_encrypt");

   procedure EVP_PKEY_meth_set_decrypt
     (pmeth : System.Address;
      decrypt_init : access function (arg1 : System.Address) return int;
      decrypt : access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access size_t;
         arg4 : access unsigned_char;
         arg5 : size_t) return int);  -- openssl/evp.h:1147
   pragma Import (C, EVP_PKEY_meth_set_decrypt, "EVP_PKEY_meth_set_decrypt");

   procedure EVP_PKEY_meth_set_derive
     (pmeth : System.Address;
      derive_init : access function (arg1 : System.Address) return int;
      derive : access function
        (arg1 : System.Address;
         arg2 : access unsigned_char;
         arg3 : access size_t) return int);  -- openssl/evp.h:1152
   pragma Import (C, EVP_PKEY_meth_set_derive, "EVP_PKEY_meth_set_derive");

   procedure EVP_PKEY_meth_set_ctrl
     (pmeth : System.Address;
      ctrl : access function
        (arg1 : System.Address;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      ctrl_str : access function
        (arg1 : System.Address;
         arg2 : Interfaces.C.Strings.chars_ptr;
         arg3 : Interfaces.C.Strings.chars_ptr) return int);  -- openssl/evp.h:1156
   pragma Import (C, EVP_PKEY_meth_set_ctrl, "EVP_PKEY_meth_set_ctrl");

   procedure ERR_load_EVP_strings;  -- openssl/evp.h:1165
   pragma Import (C, ERR_load_EVP_strings, "ERR_load_EVP_strings");

end OpenSSL.Low_Level.evp_h;
