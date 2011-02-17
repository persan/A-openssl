with Interfaces.C; use Interfaces.C;
with System;
with OpenSSL.Low_Level.tls1_h;
with Interfaces.C.Strings;
with OpenSSL.Low_Level.stack_h;
limited with OpenSSL.Low_Level.comp_h;
limited with OpenSSL.Low_Level.x509_vfy_h;
limited with OpenSSL.Low_Level.x509_h;
limited with OpenSSL.Low_Level.hmac_h;
limited with OpenSSL.Low_Level.bio_h;
limited with OpenSSL.Low_Level.ssl2_h;
limited with OpenSSL.Low_Level.ssl3_h;
limited with OpenSSL.Low_Level.dtls1_h;
limited with OpenSSL.Low_Level.kssl_h;
limited with OpenSSL.Low_Level.ocsp_h;
limited with OpenSSL.Low_Level.evp_h;
with Interfaces.C_Streams;
with OpenSSL.Low_Level.crypto_h;
limited with OpenSSL.Low_Level.buffer_h;
limited with OpenSSL.Low_Level.rsa_h;
limited with OpenSSL.Low_Level.dh_h;

package OpenSSL.Low_Level.ssl_h is
   package defs is

      SSL_SESSION_ASN1_VERSION : constant := 16#0001#;  --  openssl/ssl.h:177
      --  unsupported macro: SSL_TXT_NULL_WITH_MD5 SSL2_TXT_NULL_WITH_MD5
      --  unsupported macro: SSL_TXT_RC4_128_WITH_MD5 SSL2_TXT_RC4_128_WITH_MD5
      --  unsupported macro: SSL_TXT_RC4_128_EXPORT40_WITH_MD5 SSL2_TXT_RC4_128_EXPORT40_WITH_MD5
      --  unsupported macro: SSL_TXT_RC2_128_CBC_WITH_MD5 SSL2_TXT_RC2_128_CBC_WITH_MD5
      --  unsupported macro: SSL_TXT_RC2_128_CBC_EXPORT40_WITH_MD5 SSL2_TXT_RC2_128_CBC_EXPORT40_WITH_MD5
      --  unsupported macro: SSL_TXT_IDEA_128_CBC_WITH_MD5 SSL2_TXT_IDEA_128_CBC_WITH_MD5
      --  unsupported macro: SSL_TXT_DES_64_CBC_WITH_MD5 SSL2_TXT_DES_64_CBC_WITH_MD5
      --  unsupported macro: SSL_TXT_DES_64_CBC_WITH_SHA SSL2_TXT_DES_64_CBC_WITH_SHA
      --  unsupported macro: SSL_TXT_DES_192_EDE3_CBC_WITH_MD5 SSL2_TXT_DES_192_EDE3_CBC_WITH_MD5
      --  unsupported macro: SSL_TXT_DES_192_EDE3_CBC_WITH_SHA SSL2_TXT_DES_192_EDE3_CBC_WITH_SHA
      --  unsupported macro: SSL_TXT_KRB5_RC4_128_SHA SSL3_TXT_KRB5_RC4_128_SHA
      --  unsupported macro: SSL_TXT_KRB5_IDEA_128_CBC_SHA SSL3_TXT_KRB5_IDEA_128_CBC_SHA
      --  unsupported macro: SSL_TXT_KRB5_RC4_128_MD5 SSL3_TXT_KRB5_RC4_128_MD5
      --  unsupported macro: SSL_TXT_KRB5_IDEA_128_CBC_MD5 SSL3_TXT_KRB5_IDEA_128_CBC_MD5
      --  unsupported macro: SSL_TXT_KRB5_RC2_40_CBC_SHA SSL3_TXT_KRB5_RC2_40_CBC_SHA
      --  unsupported macro: SSL_TXT_KRB5_RC4_40_SHA SSL3_TXT_KRB5_RC4_40_SHA
      --  unsupported macro: SSL_TXT_KRB5_RC2_40_CBC_MD5 SSL3_TXT_KRB5_RC2_40_CBC_MD5
      --  unsupported macro: SSL_TXT_KRB5_RC4_40_MD5 SSL3_TXT_KRB5_RC4_40_MD5
      --  unsupported macro: SSL_TXT_KRB5_DES_40_CBC_SHA SSL3_TXT_KRB5_DES_40_CBC_SHA
      --  unsupported macro: SSL_TXT_KRB5_DES_40_CBC_MD5 SSL3_TXT_KRB5_DES_40_CBC_MD5
      --  unsupported macro: SSL_TXT_KRB5_DES_64_CBC_SHA SSL3_TXT_KRB5_DES_64_CBC_SHA
      --  unsupported macro: SSL_TXT_KRB5_DES_64_CBC_MD5 SSL3_TXT_KRB5_DES_64_CBC_MD5
      --  unsupported macro: SSL_TXT_KRB5_DES_192_CBC3_SHA SSL3_TXT_KRB5_DES_192_CBC3_SHA
      --  unsupported macro: SSL_TXT_KRB5_DES_192_CBC3_MD5 SSL3_TXT_KRB5_DES_192_CBC3_MD5

      SSL_MAX_KRB5_PRINCIPAL_LENGTH : constant := 256;  --  openssl/ssl.h:215

      SSL_MAX_SSL_SESSION_ID_LENGTH : constant := 32;  --  openssl/ssl.h:217
      SSL_MAX_SID_CTX_LENGTH   : constant := 32;  --  openssl/ssl.h:218

      SSL_MIN_RSA_MODULUS_LENGTH_IN_BYTES : constant := (512 / 8);  --  openssl/ssl.h:220
      SSL_MAX_KEY_ARG_LENGTH   : constant := 8;  --  openssl/ssl.h:221
      SSL_MAX_MASTER_KEY_LENGTH : constant := 48;  --  openssl/ssl.h:222

      SSL_TXT_EXP40            : aliased constant String := "EXPORT40" & ASCII.NUL;  --  openssl/ssl.h:227
      SSL_TXT_EXP56            : aliased constant String := "EXPORT56" & ASCII.NUL;  --  openssl/ssl.h:228
      SSL_TXT_LOW              : aliased constant String := "LOW" & ASCII.NUL;  --  openssl/ssl.h:229
      SSL_TXT_MEDIUM           : aliased constant String := "MEDIUM" & ASCII.NUL;  --  openssl/ssl.h:230
      SSL_TXT_HIGH             : aliased constant String := "HIGH" & ASCII.NUL;  --  openssl/ssl.h:231
      SSL_TXT_FIPS             : aliased constant String := "FIPS" & ASCII.NUL;  --  openssl/ssl.h:232

      SSL_TXT_kFZA             : aliased constant String := "kFZA" & ASCII.NUL;  --  openssl/ssl.h:234
      SSL_TXT_aFZA             : aliased constant String := "aFZA" & ASCII.NUL;  --  openssl/ssl.h:235
      SSL_TXT_eFZA             : aliased constant String := "eFZA" & ASCII.NUL;  --  openssl/ssl.h:236
      SSL_TXT_FZA              : aliased constant String := "FZA" & ASCII.NUL;  --  openssl/ssl.h:237

      SSL_TXT_aNULL            : aliased constant String := "aNULL" & ASCII.NUL;  --  openssl/ssl.h:239
      SSL_TXT_eNULL            : aliased constant String := "eNULL" & ASCII.NUL;  --  openssl/ssl.h:240
      SSL_TXT_NULL             : aliased constant String := "NULL" & ASCII.NUL;  --  openssl/ssl.h:241

      SSL_TXT_kRSA             : aliased constant String := "kRSA" & ASCII.NUL;  --  openssl/ssl.h:243
      SSL_TXT_kDHr             : aliased constant String := "kDHr" & ASCII.NUL;  --  openssl/ssl.h:244
      SSL_TXT_kDHd             : aliased constant String := "kDHd" & ASCII.NUL;  --  openssl/ssl.h:245
      SSL_TXT_kDH              : aliased constant String := "kDH" & ASCII.NUL;  --  openssl/ssl.h:246
      SSL_TXT_kEDH             : aliased constant String := "kEDH" & ASCII.NUL;  --  openssl/ssl.h:247
      SSL_TXT_kKRB5            : aliased constant String := "kKRB5" & ASCII.NUL;  --  openssl/ssl.h:248
      SSL_TXT_kECDHr           : aliased constant String := "kECDHr" & ASCII.NUL;  --  openssl/ssl.h:249
      SSL_TXT_kECDHe           : aliased constant String := "kECDHe" & ASCII.NUL;  --  openssl/ssl.h:250
      SSL_TXT_kECDH            : aliased constant String := "kECDH" & ASCII.NUL;  --  openssl/ssl.h:251
      SSL_TXT_kEECDH           : aliased constant String := "kEECDH" & ASCII.NUL;  --  openssl/ssl.h:252
      SSL_TXT_kPSK             : aliased constant String := "kPSK" & ASCII.NUL;  --  openssl/ssl.h:253
      SSL_TXT_kGOST            : aliased constant String := "kGOST" & ASCII.NUL;  --  openssl/ssl.h:254

      SSL_TXT_aRSA             : aliased constant String := "aRSA" & ASCII.NUL;  --  openssl/ssl.h:256
      SSL_TXT_aDSS             : aliased constant String := "aDSS" & ASCII.NUL;  --  openssl/ssl.h:257
      SSL_TXT_aDH              : aliased constant String := "aDH" & ASCII.NUL;  --  openssl/ssl.h:258
      SSL_TXT_aECDH            : aliased constant String := "aECDH" & ASCII.NUL;  --  openssl/ssl.h:259
      SSL_TXT_aKRB5            : aliased constant String := "aKRB5" & ASCII.NUL;  --  openssl/ssl.h:260
      SSL_TXT_aECDSA           : aliased constant String := "aECDSA" & ASCII.NUL;  --  openssl/ssl.h:261
      SSL_TXT_aPSK             : aliased constant String := "aPSK" & ASCII.NUL;  --  openssl/ssl.h:262
      SSL_TXT_aGOST94          : aliased constant String := "aGOST94" & ASCII.NUL;  --  openssl/ssl.h:263
      SSL_TXT_aGOST01          : aliased constant String := "aGOST01" & ASCII.NUL;  --  openssl/ssl.h:264
      SSL_TXT_aGOST            : aliased constant String := "aGOST" & ASCII.NUL;  --  openssl/ssl.h:265

      SSL_TXT_DSS              : aliased constant String := "DSS" & ASCII.NUL;  --  openssl/ssl.h:267
      SSL_TXT_DH               : aliased constant String := "DH" & ASCII.NUL;  --  openssl/ssl.h:268
      SSL_TXT_EDH              : aliased constant String := "EDH" & ASCII.NUL;  --  openssl/ssl.h:269
      SSL_TXT_ADH_2              : aliased constant String := "ADH" & ASCII.NUL;  --  openssl/ssl.h:270
      SSL_TXT_RSA              : aliased constant String := "RSA" & ASCII.NUL;  --  openssl/ssl.h:271
      SSL_TXT_ECDH             : aliased constant String := "ECDH" & ASCII.NUL;  --  openssl/ssl.h:272
      SSL_TXT_EECDH            : aliased constant String := "EECDH" & ASCII.NUL;  --  openssl/ssl.h:273
      SSL_TXT_AECDH_2            : aliased constant String := "AECDH" & ASCII.NUL;  --  openssl/ssl.h:274
      SSL_TXT_ECDSA            : aliased constant String := "ECDSA" & ASCII.NUL;  --  openssl/ssl.h:275
      SSL_TXT_KRB5             : aliased constant String := "KRB5" & ASCII.NUL;  --  openssl/ssl.h:276
      SSL_TXT_PSK              : aliased constant String := "PSK" & ASCII.NUL;  --  openssl/ssl.h:277

      SSL_TXT_DES              : aliased constant String := "DES" & ASCII.NUL;  --  openssl/ssl.h:279
      SSL_TXT_3DES             : aliased constant String := "3DES" & ASCII.NUL;  --  openssl/ssl.h:280
      SSL_TXT_RC4              : aliased constant String := "RC4" & ASCII.NUL;  --  openssl/ssl.h:281
      SSL_TXT_RC2              : aliased constant String := "RC2" & ASCII.NUL;  --  openssl/ssl.h:282
      SSL_TXT_IDEA             : aliased constant String := "IDEA" & ASCII.NUL;  --  openssl/ssl.h:283
      SSL_TXT_SEED             : aliased constant String := "SEED" & ASCII.NUL;  --  openssl/ssl.h:284
      SSL_TXT_AES128           : aliased constant String := "AES128" & ASCII.NUL;  --  openssl/ssl.h:285
      SSL_TXT_AES256           : aliased constant String := "AES256" & ASCII.NUL;  --  openssl/ssl.h:286
      SSL_TXT_AES              : aliased constant String := "AES" & ASCII.NUL;  --  openssl/ssl.h:287
      SSL_TXT_CAMELLIA128      : aliased constant String := "CAMELLIA128" & ASCII.NUL;  --  openssl/ssl.h:288
      SSL_TXT_CAMELLIA256      : aliased constant String := "CAMELLIA256" & ASCII.NUL;  --  openssl/ssl.h:289
      SSL_TXT_CAMELLIA         : aliased constant String := "CAMELLIA" & ASCII.NUL;  --  openssl/ssl.h:290

      SSL_TXT_MD5              : aliased constant String := "MD5" & ASCII.NUL;  --  openssl/ssl.h:292
      SSL_TXT_SHA1             : aliased constant String := "SHA1" & ASCII.NUL;  --  openssl/ssl.h:293
      SSL_TXT_SHA              : aliased constant String := "SHA" & ASCII.NUL;  --  openssl/ssl.h:294
      SSL_TXT_GOST94           : aliased constant String := "GOST94" & ASCII.NUL;  --  openssl/ssl.h:295
      SSL_TXT_GOST89MAC        : aliased constant String := "GOST89MAC" & ASCII.NUL;  --  openssl/ssl.h:296

      SSL_TXT_SSLV2            : aliased constant String := "SSLv2" & ASCII.NUL;  --  openssl/ssl.h:298
      SSL_TXT_SSLV3            : aliased constant String := "SSLv3" & ASCII.NUL;  --  openssl/ssl.h:299
      SSL_TXT_TLSV1            : aliased constant String := "TLSv1" & ASCII.NUL;  --  openssl/ssl.h:300

      SSL_TXT_EXP              : aliased constant String := "EXP" & ASCII.NUL;  --  openssl/ssl.h:302
      SSL_TXT_EXPORT           : aliased constant String := "EXPORT" & ASCII.NUL;  --  openssl/ssl.h:303

      SSL_TXT_ALL              : aliased constant String := "ALL" & ASCII.NUL;  --  openssl/ssl.h:305

      SSL_TXT_CMPALL           : aliased constant String := "COMPLEMENTOFALL" & ASCII.NUL;  --  openssl/ssl.h:321
      SSL_TXT_CMPDEF           : aliased constant String := "COMPLEMENTOFDEFAULT" & ASCII.NUL;  --  openssl/ssl.h:322

      SSL_DEFAULT_CIPHER_LIST  : aliased constant String := "ALL:!aNULL:!eNULL:!SSLv2" & ASCII.NUL;  --  openssl/ssl.h:327

      SSL_SENT_SHUTDOWN        : constant := 1;  --  openssl/ssl.h:336
      SSL_RECEIVED_SHUTDOWN    : constant := 2;  --  openssl/ssl.h:337
      --  unsupported macro: SSL_FILETYPE_ASN1 X509_FILETYPE_ASN1
      --  unsupported macro: SSL_FILETYPE_PEM X509_FILETYPE_PEM

      SSL_OP_MICROSOFT_SESS_ID_BUG : constant := 16#00000001#;  --  openssl/ssl.h:512
      SSL_OP_NETSCAPE_CHALLENGE_BUG : constant := 16#00000002#;  --  openssl/ssl.h:513

      SSL_OP_LEGACY_SERVER_CONNECT : constant := 16#00000004#;  --  openssl/ssl.h:515
      SSL_OP_NETSCAPE_REUSE_CIPHER_CHANGE_BUG : constant := 16#00000008#;  --  openssl/ssl.h:516
      SSL_OP_SSLREF2_REUSE_CERT_TYPE_BUG : constant := 16#00000010#;  --  openssl/ssl.h:517
      SSL_OP_MICROSOFT_BIG_SSLV3_BUFFER : constant := 16#00000020#;  --  openssl/ssl.h:518
      SSL_OP_MSIE_SSLV2_RSA_PADDING : constant := 16#00000040#;  --  openssl/ssl.h:519
      SSL_OP_SSLEAY_080_CLIENT_DH_BUG : constant := 16#00000080#;  --  openssl/ssl.h:520
      SSL_OP_TLS_D5_BUG        : constant := 16#00000100#;  --  openssl/ssl.h:521
      SSL_OP_TLS_BLOCK_PADDING_BUG : constant := 16#00000200#;  --  openssl/ssl.h:522

      SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS : constant := 16#00000800#;  --  openssl/ssl.h:529

      SSL_OP_ALL               : constant := 16#80000FF7#;  --  openssl/ssl.h:533

      SSL_OP_NO_QUERY_MTU      : constant := 16#00001000#;  --  openssl/ssl.h:536

      SSL_OP_COOKIE_EXCHANGE   : constant := 16#00002000#;  --  openssl/ssl.h:538

      SSL_OP_NO_TICKET         : constant := 16#00004000#;  --  openssl/ssl.h:540

      SSL_OP_CISCO_ANYCONNECT  : constant := 16#00008000#;  --  openssl/ssl.h:542

      SSL_OP_NO_SESSION_RESUMPTION_ON_RENEGOTIATION : constant := 16#00010000#;  --  openssl/ssl.h:545

      SSL_OP_NO_COMPRESSION    : constant := 16#00020000#;  --  openssl/ssl.h:547

      SSL_OP_ALLOW_UNSAFE_LEGACY_RENEGOTIATION : constant := 16#00040000#;  --  openssl/ssl.h:549

      SSL_OP_SINGLE_ECDH_USE   : constant := 16#00080000#;  --  openssl/ssl.h:551

      SSL_OP_SINGLE_DH_USE     : constant := 16#00100000#;  --  openssl/ssl.h:553

      SSL_OP_EPHEMERAL_RSA     : constant := 16#00200000#;  --  openssl/ssl.h:556

      SSL_OP_CIPHER_SERVER_PREFERENCE : constant := 16#00400000#;  --  openssl/ssl.h:559

      SSL_OP_TLS_ROLLBACK_BUG  : constant := 16#00800000#;  --  openssl/ssl.h:564

      SSL_OP_NO_SSLv2          : constant := 16#01000000#;  --  openssl/ssl.h:566
      SSL_OP_NO_SSLv3          : constant := 16#02000000#;  --  openssl/ssl.h:567
      SSL_OP_NO_TLSv1          : constant := 16#04000000#;  --  openssl/ssl.h:568

      SSL_OP_PKCS1_CHECK_1     : constant := 16#08000000#;  --  openssl/ssl.h:572
      SSL_OP_PKCS1_CHECK_2     : constant := 16#10000000#;  --  openssl/ssl.h:573
      SSL_OP_NETSCAPE_CA_DN_BUG : constant := 16#20000000#;  --  openssl/ssl.h:574
      SSL_OP_NETSCAPE_DEMO_CIPHER_CHANGE_BUG : constant := 16#40000000#;  --  openssl/ssl.h:575

      SSL_OP_CRYPTOPRO_TLSEXT_BUG : constant := 16#80000000#;  --  openssl/ssl.h:580

      SSL_MODE_ENABLE_PARTIAL_WRITE : constant := 16#00000001#;  --  openssl/ssl.h:584

      SSL_MODE_ACCEPT_MOVING_WRITE_BUFFER : constant := 16#00000002#;  --  openssl/ssl.h:589

      SSL_MODE_AUTO_RETRY      : constant := 16#00000004#;  --  openssl/ssl.h:592

      SSL_MODE_NO_AUTO_CHAIN   : constant := 16#00000008#;  --  openssl/ssl.h:594

      SSL_MODE_RELEASE_BUFFERS : constant := 16#00000010#;  --  openssl/ssl.h:598
      --  arg-macro: procedure SSL_CTX_set_options (ctx, op)
      --    SSL_CTX_ctrl((ctx),SSL_CTRL_OPTIONS,(op),NULL)
      --  arg-macro: procedure SSL_CTX_clear_options (ctx, op)
      --    SSL_CTX_ctrl((ctx),SSL_CTRL_CLEAR_OPTIONS,(op),NULL)
      --  arg-macro: procedure SSL_CTX_get_options (ctx)
      --    SSL_CTX_ctrl((ctx),SSL_CTRL_OPTIONS,0,NULL)
      --  arg-macro: procedure SSL_set_options (ssl, op)
      --    SSL_ctrl((ssl),SSL_CTRL_OPTIONS,(op),NULL)
      --  arg-macro: procedure SSL_clear_options (ssl, op)
      --    SSL_ctrl((ssl),SSL_CTRL_CLEAR_OPTIONS,(op),NULL)
      --  arg-macro: procedure SSL_get_options (ssl)
      --    SSL_ctrl((ssl),SSL_CTRL_OPTIONS,0,NULL)
      --  arg-macro: procedure SSL_CTX_set_mode (ctx, op)
      --    SSL_CTX_ctrl((ctx),SSL_CTRL_MODE,(op),NULL)
      --  arg-macro: procedure SSL_CTX_clear_mode (ctx, op)
      --    SSL_CTX_ctrl((ctx),SSL_CTRL_CLEAR_MODE,(op),NULL)
      --  arg-macro: procedure SSL_CTX_get_mode (ctx)
      --    SSL_CTX_ctrl((ctx),SSL_CTRL_MODE,0,NULL)
      --  arg-macro: procedure SSL_clear_mode (ssl, op)
      --    SSL_ctrl((ssl),SSL_CTRL_CLEAR_MODE,(op),NULL)
      --  arg-macro: procedure SSL_set_mode (ssl, op)
      --    SSL_ctrl((ssl),SSL_CTRL_MODE,(op),NULL)
      --  arg-macro: procedure SSL_get_mode (ssl)
      --    SSL_ctrl((ssl),SSL_CTRL_MODE,0,NULL)
      --  arg-macro: procedure SSL_set_mtu (ssl, mtu)
      --    SSL_ctrl((ssl),SSL_CTRL_SET_MTU,(mtu),NULL)
      --  arg-macro: procedure SSL_get_secure_renegotiation_support (ssl)
      --    SSL_ctrl((ssl), SSL_CTRL_GET_RI_SUPPORT, 0, NULL)
      --  arg-macro: procedure SSL_CTX_set_msg_callback_arg (ctx, arg)
      --    SSL_CTX_ctrl((ctx), SSL_CTRL_SET_MSG_CALLBACK_ARG, 0, (arg))
      --  arg-macro: procedure SSL_set_msg_callback_arg (ssl, arg)
      --    SSL_ctrl((ssl), SSL_CTRL_SET_MSG_CALLBACK_ARG, 0, (arg))

      SSL_MAX_CERT_LIST_DEFAULT : constant := 1024 * 100;  --  openssl/ssl.h:644

      SSL_SESSION_CACHE_MAX_SIZE_DEFAULT : constant := (1024 * 20);  --  openssl/ssl.h:647

      SSL_MAX_BUF_FREELIST_LEN_DEFAULT : constant := 32;  --  openssl/ssl.h:859

      SSL_SESS_CACHE_OFF       : constant := 16#0000#;  --  openssl/ssl.h:866
      SSL_SESS_CACHE_CLIENT    : constant := 16#0001#;  --  openssl/ssl.h:867
      SSL_SESS_CACHE_SERVER    : constant := 16#0002#;  --  openssl/ssl.h:868
      --  unsupported macro: SSL_SESS_CACHE_BOTH (SSL_SESS_CACHE_CLIENT|SSL_SESS_CACHE_SERVER)

      SSL_SESS_CACHE_NO_AUTO_CLEAR : constant := 16#0080#;  --  openssl/ssl.h:870

      SSL_SESS_CACHE_NO_INTERNAL_LOOKUP : constant := 16#0100#;  --  openssl/ssl.h:872
      SSL_SESS_CACHE_NO_INTERNAL_STORE : constant := 16#0200#;  --  openssl/ssl.h:873
      --  unsupported macro: SSL_SESS_CACHE_NO_INTERNAL (SSL_SESS_CACHE_NO_INTERNAL_LOOKUP|SSL_SESS_CACHE_NO_INTERNAL_STORE)
      --  arg-macro: procedure SSL_CTX_sess_number (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SESS_NUMBER,0,NULL)
      --  arg-macro: procedure SSL_CTX_sess_connect (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SESS_CONNECT,0,NULL)
      --  arg-macro: procedure SSL_CTX_sess_connect_good (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SESS_CONNECT_GOOD,0,NULL)
      --  arg-macro: procedure SSL_CTX_sess_connect_renegotiate (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SESS_CONNECT_RENEGOTIATE,0,NULL)
      --  arg-macro: procedure SSL_CTX_sess_accept (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SESS_ACCEPT,0,NULL)
      --  arg-macro: procedure SSL_CTX_sess_accept_renegotiate (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SESS_ACCEPT_RENEGOTIATE,0,NULL)
      --  arg-macro: procedure SSL_CTX_sess_accept_good (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SESS_ACCEPT_GOOD,0,NULL)
      --  arg-macro: procedure SSL_CTX_sess_hits (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SESS_HIT,0,NULL)
      --  arg-macro: procedure SSL_CTX_sess_cb_hits (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SESS_CB_HIT,0,NULL)
      --  arg-macro: procedure SSL_CTX_sess_misses (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SESS_MISSES,0,NULL)
      --  arg-macro: procedure SSL_CTX_sess_timeouts (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SESS_TIMEOUTS,0,NULL)
      --  arg-macro: procedure SSL_CTX_sess_cache_full (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SESS_CACHE_FULL,0,NULL)

      PSK_MAX_IDENTITY_LEN     : constant := 128;  --  openssl/ssl.h:922
      PSK_MAX_PSK_LEN          : constant := 256;  --  openssl/ssl.h:923

      SSL_NOTHING              : constant := 1;  --  openssl/ssl.h:944
      SSL_WRITING              : constant := 2;  --  openssl/ssl.h:945
      SSL_READING              : constant := 3;  --  openssl/ssl.h:946
      SSL_X509_LOOKUP          : constant := 4;  --  openssl/ssl.h:947
      --  arg-macro: function SSL_want_nothing (s)
      --    return SSL_want(s) = SSL_NOTHING;
      --  arg-macro: function SSL_want_read (s)
      --    return SSL_want(s) = SSL_READING;
      --  arg-macro: function SSL_want_write (s)
      --    return SSL_want(s) = SSL_WRITING;
      --  arg-macro: function SSL_want_x509_lookup (s)
      --    return SSL_want(s) = SSL_X509_LOOKUP;

      SSL_MAC_FLAG_READ_MAC_STREAM : constant := 1;  --  openssl/ssl.h:955
      SSL_MAC_FLAG_WRITE_MAC_STREAM : constant := 2;  --  openssl/ssl.h:956
      --  unsupported macro: session_ctx initial_ctx
      --  arg-macro: function SSL_set_app_data (s, arg)
      --    return SSL_set_ex_data(s,0,(char *)arg);
      --  arg-macro: function SSL_get_app_data (s)
      --    return SSL_get_ex_data(s,0);
      --  arg-macro: function SSL_SESSION_set_app_data (s, a)
      --    return SSL_SESSION_set_ex_data(s,0,(char *)a);
      --  arg-macro: function SSL_SESSION_get_app_data (s)
      --    return SSL_SESSION_get_ex_data(s,0);
      --  arg-macro: function SSL_CTX_get_app_data (ctx)
      --    return SSL_CTX_get_ex_data(ctx,0);
      --  arg-macro: function SSL_CTX_set_app_data (ctx, arg)
      --    return SSL_CTX_set_ex_data(ctx,0,(char *)arg);

      SSL_ST_CONNECT           : constant := 16#1000#;  --  openssl/ssl.h:1203
      SSL_ST_ACCEPT            : constant := 16#2000#;  --  openssl/ssl.h:1204
      SSL_ST_MASK              : constant := 16#0FFF#;  --  openssl/ssl.h:1205
      --  unsupported macro: SSL_ST_INIT (SSL_ST_CONNECT|SSL_ST_ACCEPT)

      SSL_ST_BEFORE            : constant := 16#4000#;  --  openssl/ssl.h:1207
      SSL_ST_OK                : constant := 16#03#;  --  openssl/ssl.h:1208
      --  unsupported macro: SSL_ST_RENEGOTIATE (0x04|SSL_ST_INIT)

      SSL_CB_LOOP              : constant := 16#01#;  --  openssl/ssl.h:1211
      SSL_CB_EXIT              : constant := 16#02#;  --  openssl/ssl.h:1212
      SSL_CB_READ              : constant := 16#04#;  --  openssl/ssl.h:1213
      SSL_CB_WRITE             : constant := 16#08#;  --  openssl/ssl.h:1214
      SSL_CB_ALERT             : constant := 16#4000#;  --  openssl/ssl.h:1215
      --  unsupported macro: SSL_CB_READ_ALERT (SSL_CB_ALERT|SSL_CB_READ)
      --  unsupported macro: SSL_CB_WRITE_ALERT (SSL_CB_ALERT|SSL_CB_WRITE)
      --  unsupported macro: SSL_CB_ACCEPT_LOOP (SSL_ST_ACCEPT|SSL_CB_LOOP)
      --  unsupported macro: SSL_CB_ACCEPT_EXIT (SSL_ST_ACCEPT|SSL_CB_EXIT)
      --  unsupported macro: SSL_CB_CONNECT_LOOP (SSL_ST_CONNECT|SSL_CB_LOOP)
      --  unsupported macro: SSL_CB_CONNECT_EXIT (SSL_ST_CONNECT|SSL_CB_EXIT)

      SSL_CB_HANDSHAKE_START   : constant := 16#10#;  --  openssl/ssl.h:1222
      SSL_CB_HANDSHAKE_DONE    : constant := 16#20#;  --  openssl/ssl.h:1223
      --  arg-macro: procedure SSL_get_state (a)
      --    SSL_state(a)
      --  arg-macro: function SSL_is_init_finished (a)
      --    return SSL_state(a) = SSL_ST_OK;
      --  arg-macro: function SSL_in_init (a)
      --    return SSL_state(a)andSSL_ST_INIT;
      --  arg-macro: function SSL_in_before (a)
      --    return SSL_state(a)andSSL_ST_BEFORE;
      --  arg-macro: function SSL_in_connect_init (a)
      --    return SSL_state(a)andSSL_ST_CONNECT;
      --  arg-macro: function SSL_in_accept_init (a)
      --    return SSL_state(a)andSSL_ST_ACCEPT;

      SSL_ST_READ_HEADER       : constant := 16#F0#;  --  openssl/ssl.h:1235
      SSL_ST_READ_BODY         : constant := 16#F1#;  --  openssl/ssl.h:1236
      SSL_ST_READ_DONE         : constant := 16#F2#;  --  openssl/ssl.h:1237

      SSL_VERIFY_NONE          : constant := 16#00#;  --  openssl/ssl.h:1248
      SSL_VERIFY_PEER          : constant := 16#01#;  --  openssl/ssl.h:1249
      SSL_VERIFY_FAIL_IF_NO_PEER_CERT : constant := 16#02#;  --  openssl/ssl.h:1250
      SSL_VERIFY_CLIENT_ONCE   : constant := 16#04#;  --  openssl/ssl.h:1251
      --  arg-macro: procedure OpenSSL_add_ssl_algorithms ()
      --    SSL_library_init()
      --  arg-macro: procedure SSLeay_add_ssl_algorithms ()
      --    SSL_library_init()
      --  arg-macro: procedure SSL_get_cipher (s)
      --    SSL_CIPHER_get_name(SSL_get_current_cipher(s))
      --  arg-macro: procedure SSL_get_cipher_bits (s, np)
      --    SSL_CIPHER_get_bits(SSL_get_current_cipher(s),np)
      --  arg-macro: procedure SSL_get_cipher_version (s)
      --    SSL_CIPHER_get_version(SSL_get_current_cipher(s))
      --  arg-macro: procedure SSL_get_cipher_name (s)
      --    SSL_CIPHER_get_name(SSL_get_current_cipher(s))
      --  arg-macro: procedure SSL_get_time (a)
      --    SSL_SESSION_get_time(a)
      --  arg-macro: procedure SSL_set_time (a, b)
      --    SSL_SESSION_set_time((a),(b))
      --  arg-macro: procedure SSL_get_timeout (a)
      --    SSL_SESSION_get_timeout(a)
      --  arg-macro: procedure SSL_set_timeout (a, b)
      --    SSL_SESSION_set_timeout((a),(b))
      --  arg-macro: procedure d2i_SSL_SESSION_bio (bp, s_id)
      --    ASN1_d2i_bio_of(SSL_SESSION,SSL_SESSION_new,d2i_SSL_SESSION,bp,s_id)
      --  arg-macro: procedure i2d_SSL_SESSION_bio (bp, s_id)
      --    ASN1_i2d_bio_of(SSL_SESSION,i2d_SSL_SESSION,bp,s_id)

      SSL_AD_REASON_OFFSET     : constant := 1000;  --  openssl/ssl.h:1283
      --  unsupported macro: SSL_AD_CLOSE_NOTIFY SSL3_AD_CLOSE_NOTIFY
      --  unsupported macro: SSL_AD_UNEXPECTED_MESSAGE SSL3_AD_UNEXPECTED_MESSAGE
      --  unsupported macro: SSL_AD_BAD_RECORD_MAC SSL3_AD_BAD_RECORD_MAC
      --  unsupported macro: SSL_AD_DECRYPTION_FAILED TLS1_AD_DECRYPTION_FAILED
      --  unsupported macro: SSL_AD_RECORD_OVERFLOW TLS1_AD_RECORD_OVERFLOW
      --  unsupported macro: SSL_AD_DECOMPRESSION_FAILURE SSL3_AD_DECOMPRESSION_FAILURE
      --  unsupported macro: SSL_AD_HANDSHAKE_FAILURE SSL3_AD_HANDSHAKE_FAILURE
      --  unsupported macro: SSL_AD_NO_CERTIFICATE SSL3_AD_NO_CERTIFICATE
      --  unsupported macro: SSL_AD_BAD_CERTIFICATE SSL3_AD_BAD_CERTIFICATE
      --  unsupported macro: SSL_AD_UNSUPPORTED_CERTIFICATE SSL3_AD_UNSUPPORTED_CERTIFICATE
      --  unsupported macro: SSL_AD_CERTIFICATE_REVOKED SSL3_AD_CERTIFICATE_REVOKED
      --  unsupported macro: SSL_AD_CERTIFICATE_EXPIRED SSL3_AD_CERTIFICATE_EXPIRED
      --  unsupported macro: SSL_AD_CERTIFICATE_UNKNOWN SSL3_AD_CERTIFICATE_UNKNOWN
      --  unsupported macro: SSL_AD_ILLEGAL_PARAMETER SSL3_AD_ILLEGAL_PARAMETER
      --  unsupported macro: SSL_AD_UNKNOWN_CA TLS1_AD_UNKNOWN_CA
      --  unsupported macro: SSL_AD_ACCESS_DENIED TLS1_AD_ACCESS_DENIED
      --  unsupported macro: SSL_AD_DECODE_ERROR TLS1_AD_DECODE_ERROR
      --  unsupported macro: SSL_AD_DECRYPT_ERROR TLS1_AD_DECRYPT_ERROR
      --  unsupported macro: SSL_AD_EXPORT_RESTRICTION TLS1_AD_EXPORT_RESTRICTION
      --  unsupported macro: SSL_AD_PROTOCOL_VERSION TLS1_AD_PROTOCOL_VERSION
      --  unsupported macro: SSL_AD_INSUFFICIENT_SECURITY TLS1_AD_INSUFFICIENT_SECURITY
      --  unsupported macro: SSL_AD_INTERNAL_ERROR TLS1_AD_INTERNAL_ERROR
      --  unsupported macro: SSL_AD_USER_CANCELLED TLS1_AD_USER_CANCELLED
      --  unsupported macro: SSL_AD_NO_RENEGOTIATION TLS1_AD_NO_RENEGOTIATION
      --  unsupported macro: SSL_AD_UNSUPPORTED_EXTENSION TLS1_AD_UNSUPPORTED_EXTENSION
      --  unsupported macro: SSL_AD_CERTIFICATE_UNOBTAINABLE TLS1_AD_CERTIFICATE_UNOBTAINABLE
      --  unsupported macro: SSL_AD_UNRECOGNIZED_NAME TLS1_AD_UNRECOGNIZED_NAME
      --  unsupported macro: SSL_AD_BAD_CERTIFICATE_STATUS_RESPONSE TLS1_AD_BAD_CERTIFICATE_STATUS_RESPONSE
      --  unsupported macro: SSL_AD_BAD_CERTIFICATE_HASH_VALUE TLS1_AD_BAD_CERTIFICATE_HASH_VALUE
      --  unsupported macro: SSL_AD_UNKNOWN_PSK_IDENTITY TLS1_AD_UNKNOWN_PSK_IDENTITY

      SSL_ERROR_NONE           : constant := 0;  --  openssl/ssl.h:1317
      SSL_ERROR_SSL            : constant := 1;  --  openssl/ssl.h:1318
      SSL_ERROR_WANT_READ      : constant := 2;  --  openssl/ssl.h:1319
      SSL_ERROR_WANT_WRITE     : constant := 3;  --  openssl/ssl.h:1320
      SSL_ERROR_WANT_X509_LOOKUP : constant := 4;  --  openssl/ssl.h:1321
      SSL_ERROR_SYSCALL        : constant := 5;  --  openssl/ssl.h:1322
      SSL_ERROR_ZERO_RETURN    : constant := 6;  --  openssl/ssl.h:1323
      SSL_ERROR_WANT_CONNECT   : constant := 7;  --  openssl/ssl.h:1324
      SSL_ERROR_WANT_ACCEPT    : constant := 8;  --  openssl/ssl.h:1325

      SSL_CTRL_NEED_TMP_RSA    : constant := 1;  --  openssl/ssl.h:1327
      SSL_CTRL_SET_TMP_RSA     : constant := 2;  --  openssl/ssl.h:1328
      SSL_CTRL_SET_TMP_DH      : constant := 3;  --  openssl/ssl.h:1329
      SSL_CTRL_SET_TMP_ECDH    : constant := 4;  --  openssl/ssl.h:1330
      SSL_CTRL_SET_TMP_RSA_CB  : constant := 5;  --  openssl/ssl.h:1331
      SSL_CTRL_SET_TMP_DH_CB   : constant := 6;  --  openssl/ssl.h:1332
      SSL_CTRL_SET_TMP_ECDH_CB : constant := 7;  --  openssl/ssl.h:1333

      SSL_CTRL_GET_SESSION_REUSED : constant := 8;  --  openssl/ssl.h:1335
      SSL_CTRL_GET_CLIENT_CERT_REQUEST : constant := 9;  --  openssl/ssl.h:1336
      SSL_CTRL_GET_NUM_RENEGOTIATIONS : constant := 10;  --  openssl/ssl.h:1337
      SSL_CTRL_CLEAR_NUM_RENEGOTIATIONS : constant := 11;  --  openssl/ssl.h:1338
      SSL_CTRL_GET_TOTAL_RENEGOTIATIONS : constant := 12;  --  openssl/ssl.h:1339
      SSL_CTRL_GET_FLAGS       : constant := 13;  --  openssl/ssl.h:1340
      SSL_CTRL_EXTRA_CHAIN_CERT : constant := 14;  --  openssl/ssl.h:1341

      SSL_CTRL_SET_MSG_CALLBACK : constant := 15;  --  openssl/ssl.h:1343
      SSL_CTRL_SET_MSG_CALLBACK_ARG : constant := 16;  --  openssl/ssl.h:1344

      SSL_CTRL_SET_MTU         : constant := 17;  --  openssl/ssl.h:1347

      SSL_CTRL_SESS_NUMBER     : constant := 20;  --  openssl/ssl.h:1349
      SSL_CTRL_SESS_CONNECT    : constant := 21;  --  openssl/ssl.h:1350
      SSL_CTRL_SESS_CONNECT_GOOD : constant := 22;  --  openssl/ssl.h:1351
      SSL_CTRL_SESS_CONNECT_RENEGOTIATE : constant := 23;  --  openssl/ssl.h:1352
      SSL_CTRL_SESS_ACCEPT     : constant := 24;  --  openssl/ssl.h:1353
      SSL_CTRL_SESS_ACCEPT_GOOD : constant := 25;  --  openssl/ssl.h:1354
      SSL_CTRL_SESS_ACCEPT_RENEGOTIATE : constant := 26;  --  openssl/ssl.h:1355
      SSL_CTRL_SESS_HIT        : constant := 27;  --  openssl/ssl.h:1356
      SSL_CTRL_SESS_CB_HIT     : constant := 28;  --  openssl/ssl.h:1357
      SSL_CTRL_SESS_MISSES     : constant := 29;  --  openssl/ssl.h:1358
      SSL_CTRL_SESS_TIMEOUTS   : constant := 30;  --  openssl/ssl.h:1359
      SSL_CTRL_SESS_CACHE_FULL : constant := 31;  --  openssl/ssl.h:1360
      SSL_CTRL_OPTIONS         : constant := 32;  --  openssl/ssl.h:1361
      SSL_CTRL_MODE            : constant := 33;  --  openssl/ssl.h:1362

      SSL_CTRL_GET_READ_AHEAD  : constant := 40;  --  openssl/ssl.h:1364
      SSL_CTRL_SET_READ_AHEAD  : constant := 41;  --  openssl/ssl.h:1365
      SSL_CTRL_SET_SESS_CACHE_SIZE : constant := 42;  --  openssl/ssl.h:1366
      SSL_CTRL_GET_SESS_CACHE_SIZE : constant := 43;  --  openssl/ssl.h:1367
      SSL_CTRL_SET_SESS_CACHE_MODE : constant := 44;  --  openssl/ssl.h:1368
      SSL_CTRL_GET_SESS_CACHE_MODE : constant := 45;  --  openssl/ssl.h:1369

      SSL_CTRL_GET_MAX_CERT_LIST : constant := 50;  --  openssl/ssl.h:1371
      SSL_CTRL_SET_MAX_CERT_LIST : constant := 51;  --  openssl/ssl.h:1372

      SSL_CTRL_SET_MAX_SEND_FRAGMENT : constant := 52;  --  openssl/ssl.h:1374

      SSL_CTRL_SET_TLSEXT_SERVERNAME_CB : constant := 53;  --  openssl/ssl.h:1378
      SSL_CTRL_SET_TLSEXT_SERVERNAME_ARG : constant := 54;  --  openssl/ssl.h:1379
      SSL_CTRL_SET_TLSEXT_HOSTNAME : constant := 55;  --  openssl/ssl.h:1380
      SSL_CTRL_SET_TLSEXT_DEBUG_CB : constant := 56;  --  openssl/ssl.h:1381
      SSL_CTRL_SET_TLSEXT_DEBUG_ARG : constant := 57;  --  openssl/ssl.h:1382
      SSL_CTRL_GET_TLSEXT_TICKET_KEYS : constant := 58;  --  openssl/ssl.h:1383
      SSL_CTRL_SET_TLSEXT_TICKET_KEYS : constant := 59;  --  openssl/ssl.h:1384
      SSL_CTRL_SET_TLSEXT_OPAQUE_PRF_INPUT : constant := 60;  --  openssl/ssl.h:1385
      SSL_CTRL_SET_TLSEXT_OPAQUE_PRF_INPUT_CB : constant := 61;  --  openssl/ssl.h:1386
      SSL_CTRL_SET_TLSEXT_OPAQUE_PRF_INPUT_CB_ARG : constant := 62;  --  openssl/ssl.h:1387
      SSL_CTRL_SET_TLSEXT_STATUS_REQ_CB : constant := 63;  --  openssl/ssl.h:1388
      SSL_CTRL_SET_TLSEXT_STATUS_REQ_CB_ARG : constant := 64;  --  openssl/ssl.h:1389
      SSL_CTRL_SET_TLSEXT_STATUS_REQ_TYPE : constant := 65;  --  openssl/ssl.h:1390
      SSL_CTRL_GET_TLSEXT_STATUS_REQ_EXTS : constant := 66;  --  openssl/ssl.h:1391
      SSL_CTRL_SET_TLSEXT_STATUS_REQ_EXTS : constant := 67;  --  openssl/ssl.h:1392
      SSL_CTRL_GET_TLSEXT_STATUS_REQ_IDS : constant := 68;  --  openssl/ssl.h:1393
      SSL_CTRL_SET_TLSEXT_STATUS_REQ_IDS : constant := 69;  --  openssl/ssl.h:1394
      SSL_CTRL_GET_TLSEXT_STATUS_REQ_OCSP_RESP : constant := 70;  --  openssl/ssl.h:1395
      SSL_CTRL_SET_TLSEXT_STATUS_REQ_OCSP_RESP : constant := 71;  --  openssl/ssl.h:1396

      SSL_CTRL_SET_TLSEXT_TICKET_KEY_CB : constant := 72;  --  openssl/ssl.h:1398

      DTLS_CTRL_GET_TIMEOUT    : constant := 73;  --  openssl/ssl.h:1401
      DTLS_CTRL_HANDLE_TIMEOUT : constant := 74;  --  openssl/ssl.h:1402
      DTLS_CTRL_LISTEN         : constant := 75;  --  openssl/ssl.h:1403

      SSL_CTRL_GET_RI_SUPPORT  : constant := 76;  --  openssl/ssl.h:1405
      SSL_CTRL_CLEAR_OPTIONS   : constant := 77;  --  openssl/ssl.h:1406
      SSL_CTRL_CLEAR_MODE      : constant := 78;  --  openssl/ssl.h:1407
      --  arg-macro: procedure DTLSv1_get_timeout (ssl, arg)
      --    SSL_ctrl(ssl,DTLS_CTRL_GET_TIMEOUT,0, (void *)arg)
      --  arg-macro: procedure DTLSv1_handle_timeout (ssl)
      --    SSL_ctrl(ssl,DTLS_CTRL_HANDLE_TIMEOUT,0, NULL)
      --  arg-macro: procedure DTLSv1_listen (ssl, peer)
      --    SSL_ctrl(ssl,DTLS_CTRL_LISTEN,0, (void *)peer)
      --  arg-macro: procedure SSL_session_reused (ssl)
      --    SSL_ctrl((ssl),SSL_CTRL_GET_SESSION_REUSED,0,NULL)
      --  arg-macro: procedure SSL_num_renegotiations (ssl)
      --    SSL_ctrl((ssl),SSL_CTRL_GET_NUM_RENEGOTIATIONS,0,NULL)
      --  arg-macro: procedure SSL_clear_num_renegotiations (ssl)
      --    SSL_ctrl((ssl),SSL_CTRL_CLEAR_NUM_RENEGOTIATIONS,0,NULL)
      --  arg-macro: procedure SSL_total_renegotiations (ssl)
      --    SSL_ctrl((ssl),SSL_CTRL_GET_TOTAL_RENEGOTIATIONS,0,NULL)
      --  arg-macro: procedure SSL_CTX_need_tmp_RSA (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_NEED_TMP_RSA,0,NULL)
      --  arg-macro: procedure SSL_CTX_set_tmp_rsa (ctx, rsa)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SET_TMP_RSA,0,(char *)rsa)
      --  arg-macro: procedure SSL_CTX_set_tmp_dh (ctx, dh)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SET_TMP_DH,0,(char *)dh)
      --  arg-macro: procedure SSL_CTX_set_tmp_ecdh (ctx, ecdh)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SET_TMP_ECDH,0,(char *)ecdh)
      --  arg-macro: procedure SSL_need_tmp_RSA (ssl)
      --    SSL_ctrl(ssl,SSL_CTRL_NEED_TMP_RSA,0,NULL)
      --  arg-macro: procedure SSL_set_tmp_rsa (ssl, rsa)
      --    SSL_ctrl(ssl,SSL_CTRL_SET_TMP_RSA,0,(char *)rsa)
      --  arg-macro: procedure SSL_set_tmp_dh (ssl, dh)
      --    SSL_ctrl(ssl,SSL_CTRL_SET_TMP_DH,0,(char *)dh)
      --  arg-macro: procedure SSL_set_tmp_ecdh (ssl, ecdh)
      --    SSL_ctrl(ssl,SSL_CTRL_SET_TMP_ECDH,0,(char *)ecdh)
      --  arg-macro: procedure SSL_CTX_add_extra_chain_cert (ctx, x509)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_EXTRA_CHAIN_CERT,0,(char *)x509)
      --  unsupported macro: SSL_get0_session SSL_get_session
      --  arg-macro: procedure SSL_CTX_sess_set_cache_size (ctx, t)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SET_SESS_CACHE_SIZE,t,NULL)
      --  arg-macro: procedure SSL_CTX_sess_get_cache_size (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_GET_SESS_CACHE_SIZE,0,NULL)
      --  arg-macro: procedure SSL_CTX_set_session_cache_mode (ctx, m)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SET_SESS_CACHE_MODE,m,NULL)
      --  arg-macro: procedure SSL_CTX_get_session_cache_mode (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_GET_SESS_CACHE_MODE,0,NULL)
      --  arg-macro: procedure SSL_CTX_get_default_read_ahead (ctx)
      --    SSL_CTX_get_read_ahead(ctx)
      --  arg-macro: procedure SSL_CTX_set_default_read_ahead (ctx, m)
      --    SSL_CTX_set_read_ahead(ctx,m)
      --  arg-macro: procedure SSL_CTX_get_read_ahead (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_GET_READ_AHEAD,0,NULL)
      --  arg-macro: procedure SSL_CTX_set_read_ahead (ctx, m)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SET_READ_AHEAD,m,NULL)
      --  arg-macro: procedure SSL_CTX_get_max_cert_list (ctx)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_GET_MAX_CERT_LIST,0,NULL)
      --  arg-macro: procedure SSL_CTX_set_max_cert_list (ctx, m)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SET_MAX_CERT_LIST,m,NULL)
      --  arg-macro: procedure SSL_get_max_cert_list (ssl)
      --    SSL_ctrl(ssl,SSL_CTRL_GET_MAX_CERT_LIST,0,NULL)
      --  arg-macro: procedure SSL_set_max_cert_list (ssl, m)
      --    SSL_ctrl(ssl,SSL_CTRL_SET_MAX_CERT_LIST,m,NULL)
      --  arg-macro: procedure SSL_CTX_set_max_send_fragment (ctx, m)
      --    SSL_CTX_ctrl(ctx,SSL_CTRL_SET_MAX_SEND_FRAGMENT,m,NULL)
      --  arg-macro: procedure SSL_set_max_send_fragment (ssl, m)
      --    SSL_ctrl(ssl,SSL_CTRL_SET_MAX_SEND_FRAGMENT,m,NULL)

      SSL_F_CLIENT_CERTIFICATE : constant := 100;  --  openssl/ssl.h:1798
      SSL_F_CLIENT_FINISHED    : constant := 167;  --  openssl/ssl.h:1799
      SSL_F_CLIENT_HELLO       : constant := 101;  --  openssl/ssl.h:1800
      SSL_F_CLIENT_MASTER_KEY  : constant := 102;  --  openssl/ssl.h:1801
      SSL_F_D2I_SSL_SESSION    : constant := 103;  --  openssl/ssl.h:1802
      SSL_F_DO_DTLS1_WRITE     : constant := 245;  --  openssl/ssl.h:1803
      SSL_F_DO_SSL3_WRITE      : constant := 104;  --  openssl/ssl.h:1804
      SSL_F_DTLS1_ACCEPT       : constant := 246;  --  openssl/ssl.h:1805
      SSL_F_DTLS1_ADD_CERT_TO_BUF : constant := 295;  --  openssl/ssl.h:1806
      SSL_F_DTLS1_BUFFER_RECORD : constant := 247;  --  openssl/ssl.h:1807
      SSL_F_DTLS1_CLIENT_HELLO : constant := 248;  --  openssl/ssl.h:1808
      SSL_F_DTLS1_CONNECT      : constant := 249;  --  openssl/ssl.h:1809
      SSL_F_DTLS1_ENC          : constant := 250;  --  openssl/ssl.h:1810
      SSL_F_DTLS1_GET_HELLO_VERIFY : constant := 251;  --  openssl/ssl.h:1811
      SSL_F_DTLS1_GET_MESSAGE  : constant := 252;  --  openssl/ssl.h:1812
      SSL_F_DTLS1_GET_MESSAGE_FRAGMENT : constant := 253;  --  openssl/ssl.h:1813
      SSL_F_DTLS1_GET_RECORD   : constant := 254;  --  openssl/ssl.h:1814
      SSL_F_DTLS1_HANDLE_TIMEOUT : constant := 297;  --  openssl/ssl.h:1815
      SSL_F_DTLS1_OUTPUT_CERT_CHAIN : constant := 255;  --  openssl/ssl.h:1816
      SSL_F_DTLS1_PREPROCESS_FRAGMENT : constant := 288;  --  openssl/ssl.h:1817
      SSL_F_DTLS1_PROCESS_OUT_OF_SEQ_MESSAGE : constant := 256;  --  openssl/ssl.h:1818
      SSL_F_DTLS1_PROCESS_RECORD : constant := 257;  --  openssl/ssl.h:1819
      SSL_F_DTLS1_READ_BYTES   : constant := 258;  --  openssl/ssl.h:1820
      SSL_F_DTLS1_READ_FAILED  : constant := 259;  --  openssl/ssl.h:1821
      SSL_F_DTLS1_SEND_CERTIFICATE_REQUEST : constant := 260;  --  openssl/ssl.h:1822
      SSL_F_DTLS1_SEND_CLIENT_CERTIFICATE : constant := 261;  --  openssl/ssl.h:1823
      SSL_F_DTLS1_SEND_CLIENT_KEY_EXCHANGE : constant := 262;  --  openssl/ssl.h:1824
      SSL_F_DTLS1_SEND_CLIENT_VERIFY : constant := 263;  --  openssl/ssl.h:1825
      SSL_F_DTLS1_SEND_HELLO_VERIFY_REQUEST : constant := 264;  --  openssl/ssl.h:1826
      SSL_F_DTLS1_SEND_SERVER_CERTIFICATE : constant := 265;  --  openssl/ssl.h:1827
      SSL_F_DTLS1_SEND_SERVER_HELLO : constant := 266;  --  openssl/ssl.h:1828
      SSL_F_DTLS1_SEND_SERVER_KEY_EXCHANGE : constant := 267;  --  openssl/ssl.h:1829
      SSL_F_DTLS1_WRITE_APP_DATA_BYTES : constant := 268;  --  openssl/ssl.h:1830
      SSL_F_GET_CLIENT_FINISHED : constant := 105;  --  openssl/ssl.h:1831
      SSL_F_GET_CLIENT_HELLO   : constant := 106;  --  openssl/ssl.h:1832
      SSL_F_GET_CLIENT_MASTER_KEY : constant := 107;  --  openssl/ssl.h:1833
      SSL_F_GET_SERVER_FINISHED : constant := 108;  --  openssl/ssl.h:1834
      SSL_F_GET_SERVER_HELLO   : constant := 109;  --  openssl/ssl.h:1835
      SSL_F_GET_SERVER_VERIFY  : constant := 110;  --  openssl/ssl.h:1836
      SSL_F_I2D_SSL_SESSION    : constant := 111;  --  openssl/ssl.h:1837
      SSL_F_READ_N             : constant := 112;  --  openssl/ssl.h:1838
      SSL_F_REQUEST_CERTIFICATE : constant := 113;  --  openssl/ssl.h:1839
      SSL_F_SERVER_FINISH      : constant := 239;  --  openssl/ssl.h:1840
      SSL_F_SERVER_HELLO       : constant := 114;  --  openssl/ssl.h:1841
      SSL_F_SERVER_VERIFY      : constant := 240;  --  openssl/ssl.h:1842
      SSL_F_SSL23_ACCEPT       : constant := 115;  --  openssl/ssl.h:1843
      SSL_F_SSL23_CLIENT_HELLO : constant := 116;  --  openssl/ssl.h:1844
      SSL_F_SSL23_CONNECT      : constant := 117;  --  openssl/ssl.h:1845
      SSL_F_SSL23_GET_CLIENT_HELLO : constant := 118;  --  openssl/ssl.h:1846
      SSL_F_SSL23_GET_SERVER_HELLO : constant := 119;  --  openssl/ssl.h:1847
      SSL_F_SSL23_PEEK         : constant := 237;  --  openssl/ssl.h:1848
      SSL_F_SSL23_READ         : constant := 120;  --  openssl/ssl.h:1849
      SSL_F_SSL23_WRITE        : constant := 121;  --  openssl/ssl.h:1850
      SSL_F_SSL2_ACCEPT        : constant := 122;  --  openssl/ssl.h:1851
      SSL_F_SSL2_CONNECT       : constant := 123;  --  openssl/ssl.h:1852
      SSL_F_SSL2_ENC_INIT      : constant := 124;  --  openssl/ssl.h:1853
      SSL_F_SSL2_GENERATE_KEY_MATERIAL : constant := 241;  --  openssl/ssl.h:1854
      SSL_F_SSL2_PEEK          : constant := 234;  --  openssl/ssl.h:1855
      SSL_F_SSL2_READ          : constant := 125;  --  openssl/ssl.h:1856
      SSL_F_SSL2_READ_INTERNAL : constant := 236;  --  openssl/ssl.h:1857
      SSL_F_SSL2_SET_CERTIFICATE : constant := 126;  --  openssl/ssl.h:1858
      SSL_F_SSL2_WRITE         : constant := 127;  --  openssl/ssl.h:1859
      SSL_F_SSL3_ACCEPT        : constant := 128;  --  openssl/ssl.h:1860
      SSL_F_SSL3_ADD_CERT_TO_BUF : constant := 296;  --  openssl/ssl.h:1861
      SSL_F_SSL3_CALLBACK_CTRL : constant := 233;  --  openssl/ssl.h:1862
      SSL_F_SSL3_CHANGE_CIPHER_STATE : constant := 129;  --  openssl/ssl.h:1863
      SSL_F_SSL3_CHECK_CERT_AND_ALGORITHM : constant := 130;  --  openssl/ssl.h:1864
      SSL_F_SSL3_CLIENT_HELLO  : constant := 131;  --  openssl/ssl.h:1865
      SSL_F_SSL3_CONNECT       : constant := 132;  --  openssl/ssl.h:1866
      SSL_F_SSL3_CTRL          : constant := 213;  --  openssl/ssl.h:1867
      SSL_F_SSL3_CTX_CTRL      : constant := 133;  --  openssl/ssl.h:1868
      SSL_F_SSL3_DIGEST_CACHED_RECORDS : constant := 293;  --  openssl/ssl.h:1869
      SSL_F_SSL3_DO_CHANGE_CIPHER_SPEC : constant := 292;  --  openssl/ssl.h:1870
      SSL_F_SSL3_ENC           : constant := 134;  --  openssl/ssl.h:1871
      SSL_F_SSL3_GENERATE_KEY_BLOCK : constant := 238;  --  openssl/ssl.h:1872
      SSL_F_SSL3_GET_CERTIFICATE_REQUEST : constant := 135;  --  openssl/ssl.h:1873
      SSL_F_SSL3_GET_CERT_STATUS : constant := 289;  --  openssl/ssl.h:1874
      SSL_F_SSL3_GET_CERT_VERIFY : constant := 136;  --  openssl/ssl.h:1875
      SSL_F_SSL3_GET_CLIENT_CERTIFICATE : constant := 137;  --  openssl/ssl.h:1876
      SSL_F_SSL3_GET_CLIENT_HELLO : constant := 138;  --  openssl/ssl.h:1877
      SSL_F_SSL3_GET_CLIENT_KEY_EXCHANGE : constant := 139;  --  openssl/ssl.h:1878
      SSL_F_SSL3_GET_FINISHED  : constant := 140;  --  openssl/ssl.h:1879
      SSL_F_SSL3_GET_KEY_EXCHANGE : constant := 141;  --  openssl/ssl.h:1880
      SSL_F_SSL3_GET_MESSAGE   : constant := 142;  --  openssl/ssl.h:1881
      SSL_F_SSL3_GET_NEW_SESSION_TICKET : constant := 283;  --  openssl/ssl.h:1882
      SSL_F_SSL3_GET_RECORD    : constant := 143;  --  openssl/ssl.h:1883
      SSL_F_SSL3_GET_SERVER_CERTIFICATE : constant := 144;  --  openssl/ssl.h:1884
      SSL_F_SSL3_GET_SERVER_DONE : constant := 145;  --  openssl/ssl.h:1885
      SSL_F_SSL3_GET_SERVER_HELLO : constant := 146;  --  openssl/ssl.h:1886
      SSL_F_SSL3_HANDSHAKE_MAC : constant := 285;  --  openssl/ssl.h:1887
      SSL_F_SSL3_NEW_SESSION_TICKET : constant := 287;  --  openssl/ssl.h:1888
      SSL_F_SSL3_OUTPUT_CERT_CHAIN : constant := 147;  --  openssl/ssl.h:1889
      SSL_F_SSL3_PEEK          : constant := 235;  --  openssl/ssl.h:1890
      SSL_F_SSL3_READ_BYTES    : constant := 148;  --  openssl/ssl.h:1891
      SSL_F_SSL3_READ_N        : constant := 149;  --  openssl/ssl.h:1892
      SSL_F_SSL3_SEND_CERTIFICATE_REQUEST : constant := 150;  --  openssl/ssl.h:1893
      SSL_F_SSL3_SEND_CLIENT_CERTIFICATE : constant := 151;  --  openssl/ssl.h:1894
      SSL_F_SSL3_SEND_CLIENT_KEY_EXCHANGE : constant := 152;  --  openssl/ssl.h:1895
      SSL_F_SSL3_SEND_CLIENT_VERIFY : constant := 153;  --  openssl/ssl.h:1896
      SSL_F_SSL3_SEND_SERVER_CERTIFICATE : constant := 154;  --  openssl/ssl.h:1897
      SSL_F_SSL3_SEND_SERVER_HELLO : constant := 242;  --  openssl/ssl.h:1898
      SSL_F_SSL3_SEND_SERVER_KEY_EXCHANGE : constant := 155;  --  openssl/ssl.h:1899
      SSL_F_SSL3_SETUP_KEY_BLOCK : constant := 157;  --  openssl/ssl.h:1900
      SSL_F_SSL3_SETUP_READ_BUFFER : constant := 156;  --  openssl/ssl.h:1901
      SSL_F_SSL3_SETUP_WRITE_BUFFER : constant := 291;  --  openssl/ssl.h:1902
      SSL_F_SSL3_WRITE_BYTES   : constant := 158;  --  openssl/ssl.h:1903
      SSL_F_SSL3_WRITE_PENDING : constant := 159;  --  openssl/ssl.h:1904
      SSL_F_SSL_ADD_CLIENTHELLO_RENEGOTIATE_EXT : constant := 298;  --  openssl/ssl.h:1905
      SSL_F_SSL_ADD_CLIENTHELLO_TLSEXT : constant := 277;  --  openssl/ssl.h:1906
      SSL_F_SSL_ADD_DIR_CERT_SUBJECTS_TO_STACK : constant := 215;  --  openssl/ssl.h:1907
      SSL_F_SSL_ADD_FILE_CERT_SUBJECTS_TO_STACK : constant := 216;  --  openssl/ssl.h:1908
      SSL_F_SSL_ADD_SERVERHELLO_RENEGOTIATE_EXT : constant := 299;  --  openssl/ssl.h:1909
      SSL_F_SSL_ADD_SERVERHELLO_TLSEXT : constant := 278;  --  openssl/ssl.h:1910
      SSL_F_SSL_BAD_METHOD     : constant := 160;  --  openssl/ssl.h:1911
      SSL_F_SSL_BYTES_TO_CIPHER_LIST : constant := 161;  --  openssl/ssl.h:1912
      SSL_F_SSL_CERT_DUP       : constant := 221;  --  openssl/ssl.h:1913
      SSL_F_SSL_CERT_INST      : constant := 222;  --  openssl/ssl.h:1914
      SSL_F_SSL_CERT_INSTANTIATE : constant := 214;  --  openssl/ssl.h:1915
      SSL_F_SSL_CERT_NEW       : constant := 162;  --  openssl/ssl.h:1916
      SSL_F_SSL_CHECK_PRIVATE_KEY : constant := 163;  --  openssl/ssl.h:1917
      SSL_F_SSL_CHECK_SERVERHELLO_TLSEXT : constant := 280;  --  openssl/ssl.h:1918
      SSL_F_SSL_CHECK_SRVR_ECC_CERT_AND_ALG : constant := 279;  --  openssl/ssl.h:1919
      SSL_F_SSL_CIPHER_PROCESS_RULESTR : constant := 230;  --  openssl/ssl.h:1920
      SSL_F_SSL_CIPHER_STRENGTH_SORT : constant := 231;  --  openssl/ssl.h:1921
      SSL_F_SSL_CLEAR          : constant := 164;  --  openssl/ssl.h:1922
      SSL_F_SSL_COMP_ADD_COMPRESSION_METHOD : constant := 165;  --  openssl/ssl.h:1923
      SSL_F_SSL_CREATE_CIPHER_LIST : constant := 166;  --  openssl/ssl.h:1924
      SSL_F_SSL_CTRL           : constant := 232;  --  openssl/ssl.h:1925
      SSL_F_SSL_CTX_CHECK_PRIVATE_KEY : constant := 168;  --  openssl/ssl.h:1926
      SSL_F_SSL_CTX_NEW        : constant := 169;  --  openssl/ssl.h:1927
      SSL_F_SSL_CTX_SET_CIPHER_LIST : constant := 269;  --  openssl/ssl.h:1928
      SSL_F_SSL_CTX_SET_CLIENT_CERT_ENGINE : constant := 290;  --  openssl/ssl.h:1929
      SSL_F_SSL_CTX_SET_PURPOSE : constant := 226;  --  openssl/ssl.h:1930
      SSL_F_SSL_CTX_SET_SESSION_ID_CONTEXT : constant := 219;  --  openssl/ssl.h:1931
      SSL_F_SSL_CTX_SET_SSL_VERSION : constant := 170;  --  openssl/ssl.h:1932
      SSL_F_SSL_CTX_SET_TRUST  : constant := 229;  --  openssl/ssl.h:1933
      SSL_F_SSL_CTX_USE_CERTIFICATE : constant := 171;  --  openssl/ssl.h:1934
      SSL_F_SSL_CTX_USE_CERTIFICATE_ASN1 : constant := 172;  --  openssl/ssl.h:1935
      SSL_F_SSL_CTX_USE_CERTIFICATE_CHAIN_FILE : constant := 220;  --  openssl/ssl.h:1936
      SSL_F_SSL_CTX_USE_CERTIFICATE_FILE : constant := 173;  --  openssl/ssl.h:1937
      SSL_F_SSL_CTX_USE_PRIVATEKEY : constant := 174;  --  openssl/ssl.h:1938
      SSL_F_SSL_CTX_USE_PRIVATEKEY_ASN1 : constant := 175;  --  openssl/ssl.h:1939
      SSL_F_SSL_CTX_USE_PRIVATEKEY_FILE : constant := 176;  --  openssl/ssl.h:1940
      SSL_F_SSL_CTX_USE_PSK_IDENTITY_HINT : constant := 272;  --  openssl/ssl.h:1941
      SSL_F_SSL_CTX_USE_RSAPRIVATEKEY : constant := 177;  --  openssl/ssl.h:1942
      SSL_F_SSL_CTX_USE_RSAPRIVATEKEY_ASN1 : constant := 178;  --  openssl/ssl.h:1943
      SSL_F_SSL_CTX_USE_RSAPRIVATEKEY_FILE : constant := 179;  --  openssl/ssl.h:1944
      SSL_F_SSL_DO_HANDSHAKE   : constant := 180;  --  openssl/ssl.h:1945
      SSL_F_SSL_GET_NEW_SESSION : constant := 181;  --  openssl/ssl.h:1946
      SSL_F_SSL_GET_PREV_SESSION : constant := 217;  --  openssl/ssl.h:1947
      SSL_F_SSL_GET_SERVER_SEND_CERT : constant := 182;  --  openssl/ssl.h:1948
      SSL_F_SSL_GET_SIGN_PKEY  : constant := 183;  --  openssl/ssl.h:1949
      SSL_F_SSL_INIT_WBIO_BUFFER : constant := 184;  --  openssl/ssl.h:1950
      SSL_F_SSL_LOAD_CLIENT_CA_FILE : constant := 185;  --  openssl/ssl.h:1951
      SSL_F_SSL_NEW            : constant := 186;  --  openssl/ssl.h:1952
      SSL_F_SSL_PARSE_CLIENTHELLO_RENEGOTIATE_EXT : constant := 300;  --  openssl/ssl.h:1953
      SSL_F_SSL_PARSE_CLIENTHELLO_TLSEXT : constant := 302;  --  openssl/ssl.h:1954
      SSL_F_SSL_PARSE_SERVERHELLO_RENEGOTIATE_EXT : constant := 301;  --  openssl/ssl.h:1955
      SSL_F_SSL_PARSE_SERVERHELLO_TLSEXT : constant := 303;  --  openssl/ssl.h:1956
      SSL_F_SSL_PEEK           : constant := 270;  --  openssl/ssl.h:1957
      SSL_F_SSL_PREPARE_CLIENTHELLO_TLSEXT : constant := 281;  --  openssl/ssl.h:1958
      SSL_F_SSL_PREPARE_SERVERHELLO_TLSEXT : constant := 282;  --  openssl/ssl.h:1959
      SSL_F_SSL_READ           : constant := 223;  --  openssl/ssl.h:1960
      SSL_F_SSL_RSA_PRIVATE_DECRYPT : constant := 187;  --  openssl/ssl.h:1961
      SSL_F_SSL_RSA_PUBLIC_ENCRYPT : constant := 188;  --  openssl/ssl.h:1962
      SSL_F_SSL_SESSION_NEW    : constant := 189;  --  openssl/ssl.h:1963
      SSL_F_SSL_SESSION_PRINT_FP : constant := 190;  --  openssl/ssl.h:1964
      SSL_F_SSL_SESS_CERT_NEW  : constant := 225;  --  openssl/ssl.h:1965
      SSL_F_SSL_SET_CERT       : constant := 191;  --  openssl/ssl.h:1966
      SSL_F_SSL_SET_CIPHER_LIST : constant := 271;  --  openssl/ssl.h:1967
      SSL_F_SSL_SET_FD         : constant := 192;  --  openssl/ssl.h:1968
      SSL_F_SSL_SET_PKEY       : constant := 193;  --  openssl/ssl.h:1969
      SSL_F_SSL_SET_PURPOSE    : constant := 227;  --  openssl/ssl.h:1970
      SSL_F_SSL_SET_RFD        : constant := 194;  --  openssl/ssl.h:1971
      SSL_F_SSL_SET_SESSION    : constant := 195;  --  openssl/ssl.h:1972
      SSL_F_SSL_SET_SESSION_ID_CONTEXT : constant := 218;  --  openssl/ssl.h:1973
      SSL_F_SSL_SET_SESSION_TICKET_EXT : constant := 294;  --  openssl/ssl.h:1974
      SSL_F_SSL_SET_TRUST      : constant := 228;  --  openssl/ssl.h:1975
      SSL_F_SSL_SET_WFD        : constant := 196;  --  openssl/ssl.h:1976
      SSL_F_SSL_SHUTDOWN       : constant := 224;  --  openssl/ssl.h:1977
      SSL_F_SSL_UNDEFINED_CONST_FUNCTION : constant := 243;  --  openssl/ssl.h:1978
      SSL_F_SSL_UNDEFINED_FUNCTION : constant := 197;  --  openssl/ssl.h:1979
      SSL_F_SSL_UNDEFINED_VOID_FUNCTION : constant := 244;  --  openssl/ssl.h:1980
      SSL_F_SSL_USE_CERTIFICATE : constant := 198;  --  openssl/ssl.h:1981
      SSL_F_SSL_USE_CERTIFICATE_ASN1 : constant := 199;  --  openssl/ssl.h:1982
      SSL_F_SSL_USE_CERTIFICATE_FILE : constant := 200;  --  openssl/ssl.h:1983
      SSL_F_SSL_USE_PRIVATEKEY : constant := 201;  --  openssl/ssl.h:1984
      SSL_F_SSL_USE_PRIVATEKEY_ASN1 : constant := 202;  --  openssl/ssl.h:1985
      SSL_F_SSL_USE_PRIVATEKEY_FILE : constant := 203;  --  openssl/ssl.h:1986
      SSL_F_SSL_USE_PSK_IDENTITY_HINT : constant := 273;  --  openssl/ssl.h:1987
      SSL_F_SSL_USE_RSAPRIVATEKEY : constant := 204;  --  openssl/ssl.h:1988
      SSL_F_SSL_USE_RSAPRIVATEKEY_ASN1 : constant := 205;  --  openssl/ssl.h:1989
      SSL_F_SSL_USE_RSAPRIVATEKEY_FILE : constant := 206;  --  openssl/ssl.h:1990
      SSL_F_SSL_VERIFY_CERT_CHAIN : constant := 207;  --  openssl/ssl.h:1991
      SSL_F_SSL_WRITE          : constant := 208;  --  openssl/ssl.h:1992
      SSL_F_TLS1_CERT_VERIFY_MAC : constant := 286;  --  openssl/ssl.h:1993
      SSL_F_TLS1_CHANGE_CIPHER_STATE : constant := 209;  --  openssl/ssl.h:1994
      SSL_F_TLS1_CHECK_SERVERHELLO_TLSEXT : constant := 274;  --  openssl/ssl.h:1995
      SSL_F_TLS1_ENC           : constant := 210;  --  openssl/ssl.h:1996
      SSL_F_TLS1_PREPARE_CLIENTHELLO_TLSEXT : constant := 275;  --  openssl/ssl.h:1997
      SSL_F_TLS1_PREPARE_SERVERHELLO_TLSEXT : constant := 276;  --  openssl/ssl.h:1998
      SSL_F_TLS1_PRF           : constant := 284;  --  openssl/ssl.h:1999
      SSL_F_TLS1_SETUP_KEY_BLOCK : constant := 211;  --  openssl/ssl.h:2000
      SSL_F_WRITE_PENDING      : constant := 212;  --  openssl/ssl.h:2001

      SSL_R_APP_DATA_IN_HANDSHAKE : constant := 100;  --  openssl/ssl.h:2004
      SSL_R_ATTEMPT_TO_REUSE_SESSION_IN_DIFFERENT_CONTEXT : constant := 272;  --  openssl/ssl.h:2005
      SSL_R_BAD_ALERT_RECORD   : constant := 101;  --  openssl/ssl.h:2006
      SSL_R_BAD_AUTHENTICATION_TYPE : constant := 102;  --  openssl/ssl.h:2007
      SSL_R_BAD_CHANGE_CIPHER_SPEC : constant := 103;  --  openssl/ssl.h:2008
      SSL_R_BAD_CHECKSUM       : constant := 104;  --  openssl/ssl.h:2009
      SSL_R_BAD_DATA_RETURNED_BY_CALLBACK : constant := 106;  --  openssl/ssl.h:2010
      SSL_R_BAD_DECOMPRESSION  : constant := 107;  --  openssl/ssl.h:2011
      SSL_R_BAD_DH_G_LENGTH    : constant := 108;  --  openssl/ssl.h:2012
      SSL_R_BAD_DH_PUB_KEY_LENGTH : constant := 109;  --  openssl/ssl.h:2013
      SSL_R_BAD_DH_P_LENGTH    : constant := 110;  --  openssl/ssl.h:2014
      SSL_R_BAD_DIGEST_LENGTH  : constant := 111;  --  openssl/ssl.h:2015
      SSL_R_BAD_DSA_SIGNATURE  : constant := 112;  --  openssl/ssl.h:2016
      SSL_R_BAD_ECC_CERT       : constant := 304;  --  openssl/ssl.h:2017
      SSL_R_BAD_ECDSA_SIGNATURE : constant := 305;  --  openssl/ssl.h:2018
      SSL_R_BAD_ECPOINT        : constant := 306;  --  openssl/ssl.h:2019
      SSL_R_BAD_HANDSHAKE_LENGTH : constant := 332;  --  openssl/ssl.h:2020
      SSL_R_BAD_HELLO_REQUEST  : constant := 105;  --  openssl/ssl.h:2021
      SSL_R_BAD_LENGTH         : constant := 271;  --  openssl/ssl.h:2022
      SSL_R_BAD_MAC_DECODE     : constant := 113;  --  openssl/ssl.h:2023
      SSL_R_BAD_MAC_LENGTH     : constant := 333;  --  openssl/ssl.h:2024
      SSL_R_BAD_MESSAGE_TYPE   : constant := 114;  --  openssl/ssl.h:2025
      SSL_R_BAD_PACKET_LENGTH  : constant := 115;  --  openssl/ssl.h:2026
      SSL_R_BAD_PROTOCOL_VERSION_NUMBER : constant := 116;  --  openssl/ssl.h:2027
      SSL_R_BAD_PSK_IDENTITY_HINT_LENGTH : constant := 316;  --  openssl/ssl.h:2028
      SSL_R_BAD_RESPONSE_ARGUMENT : constant := 117;  --  openssl/ssl.h:2029
      SSL_R_BAD_RSA_DECRYPT    : constant := 118;  --  openssl/ssl.h:2030
      SSL_R_BAD_RSA_ENCRYPT    : constant := 119;  --  openssl/ssl.h:2031
      SSL_R_BAD_RSA_E_LENGTH   : constant := 120;  --  openssl/ssl.h:2032
      SSL_R_BAD_RSA_MODULUS_LENGTH : constant := 121;  --  openssl/ssl.h:2033
      SSL_R_BAD_RSA_SIGNATURE  : constant := 122;  --  openssl/ssl.h:2034
      SSL_R_BAD_SIGNATURE      : constant := 123;  --  openssl/ssl.h:2035
      SSL_R_BAD_SSL_FILETYPE   : constant := 124;  --  openssl/ssl.h:2036
      SSL_R_BAD_SSL_SESSION_ID_LENGTH : constant := 125;  --  openssl/ssl.h:2037
      SSL_R_BAD_STATE          : constant := 126;  --  openssl/ssl.h:2038
      SSL_R_BAD_WRITE_RETRY    : constant := 127;  --  openssl/ssl.h:2039
      SSL_R_BIO_NOT_SET        : constant := 128;  --  openssl/ssl.h:2040
      SSL_R_BLOCK_CIPHER_PAD_IS_WRONG : constant := 129;  --  openssl/ssl.h:2041
      SSL_R_BN_LIB             : constant := 130;  --  openssl/ssl.h:2042
      SSL_R_CA_DN_LENGTH_MISMATCH : constant := 131;  --  openssl/ssl.h:2043
      SSL_R_CA_DN_TOO_LONG     : constant := 132;  --  openssl/ssl.h:2044
      SSL_R_CCS_RECEIVED_EARLY : constant := 133;  --  openssl/ssl.h:2045
      SSL_R_CERTIFICATE_VERIFY_FAILED : constant := 134;  --  openssl/ssl.h:2046
      SSL_R_CERT_LENGTH_MISMATCH : constant := 135;  --  openssl/ssl.h:2047
      SSL_R_CHALLENGE_IS_DIFFERENT : constant := 136;  --  openssl/ssl.h:2048
      SSL_R_CIPHER_CODE_WRONG_LENGTH : constant := 137;  --  openssl/ssl.h:2049
      SSL_R_CIPHER_OR_HASH_UNAVAILABLE : constant := 138;  --  openssl/ssl.h:2050
      SSL_R_CIPHER_TABLE_SRC_ERROR : constant := 139;  --  openssl/ssl.h:2051
      SSL_R_CLIENTHELLO_TLSEXT : constant := 226;  --  openssl/ssl.h:2052
      SSL_R_COMPRESSED_LENGTH_TOO_LONG : constant := 140;  --  openssl/ssl.h:2053
      SSL_R_COMPRESSION_DISABLED : constant := 343;  --  openssl/ssl.h:2054
      SSL_R_COMPRESSION_FAILURE : constant := 141;  --  openssl/ssl.h:2055
      SSL_R_COMPRESSION_ID_NOT_WITHIN_PRIVATE_RANGE : constant := 307;  --  openssl/ssl.h:2056
      SSL_R_COMPRESSION_LIBRARY_ERROR : constant := 142;  --  openssl/ssl.h:2057
      SSL_R_CONNECTION_ID_IS_DIFFERENT : constant := 143;  --  openssl/ssl.h:2058
      SSL_R_CONNECTION_TYPE_NOT_SET : constant := 144;  --  openssl/ssl.h:2059
      SSL_R_COOKIE_MISMATCH    : constant := 308;  --  openssl/ssl.h:2060
      SSL_R_DATA_BETWEEN_CCS_AND_FINISHED : constant := 145;  --  openssl/ssl.h:2061
      SSL_R_DATA_LENGTH_TOO_LONG : constant := 146;  --  openssl/ssl.h:2062
      SSL_R_DECRYPTION_FAILED  : constant := 147;  --  openssl/ssl.h:2063
      SSL_R_DECRYPTION_FAILED_OR_BAD_RECORD_MAC : constant := 281;  --  openssl/ssl.h:2064
      SSL_R_DH_PUBLIC_VALUE_LENGTH_IS_WRONG : constant := 148;  --  openssl/ssl.h:2065
      SSL_R_DIGEST_CHECK_FAILED : constant := 149;  --  openssl/ssl.h:2066
      SSL_R_DTLS_MESSAGE_TOO_BIG : constant := 334;  --  openssl/ssl.h:2067
      SSL_R_DUPLICATE_COMPRESSION_ID : constant := 309;  --  openssl/ssl.h:2068
      SSL_R_ECC_CERT_NOT_FOR_KEY_AGREEMENT : constant := 317;  --  openssl/ssl.h:2069
      SSL_R_ECC_CERT_NOT_FOR_SIGNING : constant := 318;  --  openssl/ssl.h:2070
      SSL_R_ECC_CERT_SHOULD_HAVE_RSA_SIGNATURE : constant := 322;  --  openssl/ssl.h:2071
      SSL_R_ECC_CERT_SHOULD_HAVE_SHA1_SIGNATURE : constant := 323;  --  openssl/ssl.h:2072
      SSL_R_ECGROUP_TOO_LARGE_FOR_CIPHER : constant := 310;  --  openssl/ssl.h:2073
      SSL_R_ENCRYPTED_LENGTH_TOO_LONG : constant := 150;  --  openssl/ssl.h:2074
      SSL_R_ERROR_GENERATING_TMP_RSA_KEY : constant := 282;  --  openssl/ssl.h:2075
      SSL_R_ERROR_IN_RECEIVED_CIPHER_LIST : constant := 151;  --  openssl/ssl.h:2076
      SSL_R_EXCESSIVE_MESSAGE_SIZE : constant := 152;  --  openssl/ssl.h:2077
      SSL_R_EXTRA_DATA_IN_MESSAGE : constant := 153;  --  openssl/ssl.h:2078
      SSL_R_GOT_A_FIN_BEFORE_A_CCS : constant := 154;  --  openssl/ssl.h:2079
      SSL_R_HTTPS_PROXY_REQUEST : constant := 155;  --  openssl/ssl.h:2080
      SSL_R_HTTP_REQUEST       : constant := 156;  --  openssl/ssl.h:2081
      SSL_R_ILLEGAL_PADDING    : constant := 283;  --  openssl/ssl.h:2082
      SSL_R_INCONSISTENT_COMPRESSION : constant := 340;  --  openssl/ssl.h:2083
      SSL_R_INVALID_CHALLENGE_LENGTH : constant := 158;  --  openssl/ssl.h:2084
      SSL_R_INVALID_COMMAND    : constant := 280;  --  openssl/ssl.h:2085
      SSL_R_INVALID_COMPRESSION_ALGORITHM : constant := 341;  --  openssl/ssl.h:2086
      SSL_R_INVALID_PURPOSE    : constant := 278;  --  openssl/ssl.h:2087
      SSL_R_INVALID_STATUS_RESPONSE : constant := 328;  --  openssl/ssl.h:2088
      SSL_R_INVALID_TICKET_KEYS_LENGTH : constant := 325;  --  openssl/ssl.h:2089
      SSL_R_INVALID_TRUST      : constant := 279;  --  openssl/ssl.h:2090
      SSL_R_KEY_ARG_TOO_LONG   : constant := 284;  --  openssl/ssl.h:2091
      SSL_R_KRB5               : constant := 285;  --  openssl/ssl.h:2092
      SSL_R_KRB5_C_CC_PRINC    : constant := 286;  --  openssl/ssl.h:2093
      SSL_R_KRB5_C_GET_CRED    : constant := 287;  --  openssl/ssl.h:2094
      SSL_R_KRB5_C_INIT        : constant := 288;  --  openssl/ssl.h:2095
      SSL_R_KRB5_C_MK_REQ      : constant := 289;  --  openssl/ssl.h:2096
      SSL_R_KRB5_S_BAD_TICKET  : constant := 290;  --  openssl/ssl.h:2097
      SSL_R_KRB5_S_INIT        : constant := 291;  --  openssl/ssl.h:2098
      SSL_R_KRB5_S_RD_REQ      : constant := 292;  --  openssl/ssl.h:2099
      SSL_R_KRB5_S_TKT_EXPIRED : constant := 293;  --  openssl/ssl.h:2100
      SSL_R_KRB5_S_TKT_NYV     : constant := 294;  --  openssl/ssl.h:2101
      SSL_R_KRB5_S_TKT_SKEW    : constant := 295;  --  openssl/ssl.h:2102
      SSL_R_LENGTH_MISMATCH    : constant := 159;  --  openssl/ssl.h:2103
      SSL_R_LENGTH_TOO_SHORT   : constant := 160;  --  openssl/ssl.h:2104
      SSL_R_LIBRARY_BUG        : constant := 274;  --  openssl/ssl.h:2105
      SSL_R_LIBRARY_HAS_NO_CIPHERS : constant := 161;  --  openssl/ssl.h:2106
      SSL_R_MESSAGE_TOO_LONG   : constant := 296;  --  openssl/ssl.h:2107
      SSL_R_MISSING_DH_DSA_CERT : constant := 162;  --  openssl/ssl.h:2108
      SSL_R_MISSING_DH_KEY     : constant := 163;  --  openssl/ssl.h:2109
      SSL_R_MISSING_DH_RSA_CERT : constant := 164;  --  openssl/ssl.h:2110
      SSL_R_MISSING_DSA_SIGNING_CERT : constant := 165;  --  openssl/ssl.h:2111
      SSL_R_MISSING_EXPORT_TMP_DH_KEY : constant := 166;  --  openssl/ssl.h:2112
      SSL_R_MISSING_EXPORT_TMP_RSA_KEY : constant := 167;  --  openssl/ssl.h:2113
      SSL_R_MISSING_RSA_CERTIFICATE : constant := 168;  --  openssl/ssl.h:2114
      SSL_R_MISSING_RSA_ENCRYPTING_CERT : constant := 169;  --  openssl/ssl.h:2115
      SSL_R_MISSING_RSA_SIGNING_CERT : constant := 170;  --  openssl/ssl.h:2116
      SSL_R_MISSING_TMP_DH_KEY : constant := 171;  --  openssl/ssl.h:2117
      SSL_R_MISSING_TMP_ECDH_KEY : constant := 311;  --  openssl/ssl.h:2118
      SSL_R_MISSING_TMP_RSA_KEY : constant := 172;  --  openssl/ssl.h:2119
      SSL_R_MISSING_TMP_RSA_PKEY : constant := 173;  --  openssl/ssl.h:2120
      SSL_R_MISSING_VERIFY_MESSAGE : constant := 174;  --  openssl/ssl.h:2121
      SSL_R_NON_SSLV2_INITIAL_PACKET : constant := 175;  --  openssl/ssl.h:2122
      SSL_R_NO_CERTIFICATES_RETURNED : constant := 176;  --  openssl/ssl.h:2123
      SSL_R_NO_CERTIFICATE_ASSIGNED : constant := 177;  --  openssl/ssl.h:2124
      SSL_R_NO_CERTIFICATE_RETURNED : constant := 178;  --  openssl/ssl.h:2125
      SSL_R_NO_CERTIFICATE_SET : constant := 179;  --  openssl/ssl.h:2126
      SSL_R_NO_CERTIFICATE_SPECIFIED : constant := 180;  --  openssl/ssl.h:2127
      SSL_R_NO_CIPHERS_AVAILABLE : constant := 181;  --  openssl/ssl.h:2128
      SSL_R_NO_CIPHERS_PASSED  : constant := 182;  --  openssl/ssl.h:2129
      SSL_R_NO_CIPHERS_SPECIFIED : constant := 183;  --  openssl/ssl.h:2130
      SSL_R_NO_CIPHER_LIST     : constant := 184;  --  openssl/ssl.h:2131
      SSL_R_NO_CIPHER_MATCH    : constant := 185;  --  openssl/ssl.h:2132
      SSL_R_NO_CLIENT_CERT_METHOD : constant := 331;  --  openssl/ssl.h:2133
      SSL_R_NO_CLIENT_CERT_RECEIVED : constant := 186;  --  openssl/ssl.h:2134
      SSL_R_NO_COMPRESSION_SPECIFIED : constant := 187;  --  openssl/ssl.h:2135
      SSL_R_NO_GOST_CERTIFICATE_SENT_BY_PEER : constant := 330;  --  openssl/ssl.h:2136
      SSL_R_NO_METHOD_SPECIFIED : constant := 188;  --  openssl/ssl.h:2137
      SSL_R_NO_PRIVATEKEY      : constant := 189;  --  openssl/ssl.h:2138
      SSL_R_NO_PRIVATE_KEY_ASSIGNED : constant := 190;  --  openssl/ssl.h:2139
      SSL_R_NO_PROTOCOLS_AVAILABLE : constant := 191;  --  openssl/ssl.h:2140
      SSL_R_NO_PUBLICKEY       : constant := 192;  --  openssl/ssl.h:2141
      SSL_R_NO_RENEGOTIATION   : constant := 339;  --  openssl/ssl.h:2142
      SSL_R_NO_REQUIRED_DIGEST : constant := 324;  --  openssl/ssl.h:2143
      SSL_R_NO_SHARED_CIPHER   : constant := 193;  --  openssl/ssl.h:2144
      SSL_R_NO_VERIFY_CALLBACK : constant := 194;  --  openssl/ssl.h:2145
      SSL_R_NULL_SSL_CTX       : constant := 195;  --  openssl/ssl.h:2146
      SSL_R_NULL_SSL_METHOD_PASSED : constant := 196;  --  openssl/ssl.h:2147
      SSL_R_OLD_SESSION_CIPHER_NOT_RETURNED : constant := 197;  --  openssl/ssl.h:2148
      SSL_R_OLD_SESSION_COMPRESSION_ALGORITHM_NOT_RETURNED : constant := 344;  --  openssl/ssl.h:2149
      SSL_R_ONLY_TLS_ALLOWED_IN_FIPS_MODE : constant := 297;  --  openssl/ssl.h:2150
      SSL_R_OPAQUE_PRF_INPUT_TOO_LONG : constant := 327;  --  openssl/ssl.h:2151
      SSL_R_PACKET_LENGTH_TOO_LONG : constant := 198;  --  openssl/ssl.h:2152
      SSL_R_PARSE_TLSEXT       : constant := 227;  --  openssl/ssl.h:2153
      SSL_R_PATH_TOO_LONG      : constant := 270;  --  openssl/ssl.h:2154
      SSL_R_PEER_DID_NOT_RETURN_A_CERTIFICATE : constant := 199;  --  openssl/ssl.h:2155
      SSL_R_PEER_ERROR         : constant := 200;  --  openssl/ssl.h:2156
      SSL_R_PEER_ERROR_CERTIFICATE : constant := 201;  --  openssl/ssl.h:2157
      SSL_R_PEER_ERROR_NO_CERTIFICATE : constant := 202;  --  openssl/ssl.h:2158
      SSL_R_PEER_ERROR_NO_CIPHER : constant := 203;  --  openssl/ssl.h:2159
      SSL_R_PEER_ERROR_UNSUPPORTED_CERTIFICATE_TYPE : constant := 204;  --  openssl/ssl.h:2160
      SSL_R_PRE_MAC_LENGTH_TOO_LONG : constant := 205;  --  openssl/ssl.h:2161
      SSL_R_PROBLEMS_MAPPING_CIPHER_FUNCTIONS : constant := 206;  --  openssl/ssl.h:2162
      SSL_R_PROTOCOL_IS_SHUTDOWN : constant := 207;  --  openssl/ssl.h:2163
      SSL_R_PSK_IDENTITY_NOT_FOUND : constant := 223;  --  openssl/ssl.h:2164
      SSL_R_PSK_NO_CLIENT_CB   : constant := 224;  --  openssl/ssl.h:2165
      SSL_R_PSK_NO_SERVER_CB   : constant := 225;  --  openssl/ssl.h:2166
      SSL_R_PUBLIC_KEY_ENCRYPT_ERROR : constant := 208;  --  openssl/ssl.h:2167
      SSL_R_PUBLIC_KEY_IS_NOT_RSA : constant := 209;  --  openssl/ssl.h:2168
      SSL_R_PUBLIC_KEY_NOT_RSA : constant := 210;  --  openssl/ssl.h:2169
      SSL_R_READ_BIO_NOT_SET   : constant := 211;  --  openssl/ssl.h:2170
      SSL_R_READ_TIMEOUT_EXPIRED : constant := 312;  --  openssl/ssl.h:2171
      SSL_R_READ_WRONG_PACKET_TYPE : constant := 212;  --  openssl/ssl.h:2172
      SSL_R_RECORD_LENGTH_MISMATCH : constant := 213;  --  openssl/ssl.h:2173
      SSL_R_RECORD_TOO_LARGE   : constant := 214;  --  openssl/ssl.h:2174
      SSL_R_RECORD_TOO_SMALL   : constant := 298;  --  openssl/ssl.h:2175
      SSL_R_RENEGOTIATE_EXT_TOO_LONG : constant := 335;  --  openssl/ssl.h:2176
      SSL_R_RENEGOTIATION_ENCODING_ERR : constant := 336;  --  openssl/ssl.h:2177
      SSL_R_RENEGOTIATION_MISMATCH : constant := 337;  --  openssl/ssl.h:2178
      SSL_R_REQUIRED_CIPHER_MISSING : constant := 215;  --  openssl/ssl.h:2179
      SSL_R_REQUIRED_COMPRESSSION_ALGORITHM_MISSING : constant := 342;  --  openssl/ssl.h:2180
      SSL_R_REUSE_CERT_LENGTH_NOT_ZERO : constant := 216;  --  openssl/ssl.h:2181
      SSL_R_REUSE_CERT_TYPE_NOT_ZERO : constant := 217;  --  openssl/ssl.h:2182
      SSL_R_REUSE_CIPHER_LIST_NOT_ZERO : constant := 218;  --  openssl/ssl.h:2183
      SSL_R_SCSV_RECEIVED_WHEN_RENEGOTIATING : constant := 345;  --  openssl/ssl.h:2184
      SSL_R_SERVERHELLO_TLSEXT : constant := 275;  --  openssl/ssl.h:2185
      SSL_R_SESSION_ID_CONTEXT_UNINITIALIZED : constant := 277;  --  openssl/ssl.h:2186
      SSL_R_SHORT_READ         : constant := 219;  --  openssl/ssl.h:2187
      SSL_R_SIGNATURE_FOR_NON_SIGNING_CERTIFICATE : constant := 220;  --  openssl/ssl.h:2188
      SSL_R_SSL23_DOING_SESSION_ID_REUSE : constant := 221;  --  openssl/ssl.h:2189
      SSL_R_SSL2_CONNECTION_ID_TOO_LONG : constant := 299;  --  openssl/ssl.h:2190
      SSL_R_SSL3_EXT_INVALID_ECPOINTFORMAT : constant := 321;  --  openssl/ssl.h:2191
      SSL_R_SSL3_EXT_INVALID_SERVERNAME : constant := 319;  --  openssl/ssl.h:2192
      SSL_R_SSL3_EXT_INVALID_SERVERNAME_TYPE : constant := 320;  --  openssl/ssl.h:2193
      SSL_R_SSL3_SESSION_ID_TOO_LONG : constant := 300;  --  openssl/ssl.h:2194
      SSL_R_SSL3_SESSION_ID_TOO_SHORT : constant := 222;  --  openssl/ssl.h:2195
      SSL_R_SSLV3_ALERT_BAD_CERTIFICATE : constant := 1042;  --  openssl/ssl.h:2196
      SSL_R_SSLV3_ALERT_BAD_RECORD_MAC : constant := 1020;  --  openssl/ssl.h:2197
      SSL_R_SSLV3_ALERT_CERTIFICATE_EXPIRED : constant := 1045;  --  openssl/ssl.h:2198
      SSL_R_SSLV3_ALERT_CERTIFICATE_REVOKED : constant := 1044;  --  openssl/ssl.h:2199
      SSL_R_SSLV3_ALERT_CERTIFICATE_UNKNOWN : constant := 1046;  --  openssl/ssl.h:2200
      SSL_R_SSLV3_ALERT_DECOMPRESSION_FAILURE : constant := 1030;  --  openssl/ssl.h:2201
      SSL_R_SSLV3_ALERT_HANDSHAKE_FAILURE : constant := 1040;  --  openssl/ssl.h:2202
      SSL_R_SSLV3_ALERT_ILLEGAL_PARAMETER : constant := 1047;  --  openssl/ssl.h:2203
      SSL_R_SSLV3_ALERT_NO_CERTIFICATE : constant := 1041;  --  openssl/ssl.h:2204
      SSL_R_SSLV3_ALERT_UNEXPECTED_MESSAGE : constant := 1010;  --  openssl/ssl.h:2205
      SSL_R_SSLV3_ALERT_UNSUPPORTED_CERTIFICATE : constant := 1043;  --  openssl/ssl.h:2206
      SSL_R_SSL_CTX_HAS_NO_DEFAULT_SSL_VERSION : constant := 228;  --  openssl/ssl.h:2207
      SSL_R_SSL_HANDSHAKE_FAILURE : constant := 229;  --  openssl/ssl.h:2208
      SSL_R_SSL_LIBRARY_HAS_NO_CIPHERS : constant := 230;  --  openssl/ssl.h:2209
      SSL_R_SSL_SESSION_ID_CALLBACK_FAILED : constant := 301;  --  openssl/ssl.h:2210
      SSL_R_SSL_SESSION_ID_CONFLICT : constant := 302;  --  openssl/ssl.h:2211
      SSL_R_SSL_SESSION_ID_CONTEXT_TOO_LONG : constant := 273;  --  openssl/ssl.h:2212
      SSL_R_SSL_SESSION_ID_HAS_BAD_LENGTH : constant := 303;  --  openssl/ssl.h:2213
      SSL_R_SSL_SESSION_ID_IS_DIFFERENT : constant := 231;  --  openssl/ssl.h:2214
      SSL_R_TLSV1_ALERT_ACCESS_DENIED : constant := 1049;  --  openssl/ssl.h:2215
      SSL_R_TLSV1_ALERT_DECODE_ERROR : constant := 1050;  --  openssl/ssl.h:2216
      SSL_R_TLSV1_ALERT_DECRYPTION_FAILED : constant := 1021;  --  openssl/ssl.h:2217
      SSL_R_TLSV1_ALERT_DECRYPT_ERROR : constant := 1051;  --  openssl/ssl.h:2218
      SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION : constant := 1060;  --  openssl/ssl.h:2219
      SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY : constant := 1071;  --  openssl/ssl.h:2220
      SSL_R_TLSV1_ALERT_INTERNAL_ERROR : constant := 1080;  --  openssl/ssl.h:2221
      SSL_R_TLSV1_ALERT_NO_RENEGOTIATION : constant := 1100;  --  openssl/ssl.h:2222
      SSL_R_TLSV1_ALERT_PROTOCOL_VERSION : constant := 1070;  --  openssl/ssl.h:2223
      SSL_R_TLSV1_ALERT_RECORD_OVERFLOW : constant := 1022;  --  openssl/ssl.h:2224
      SSL_R_TLSV1_ALERT_UNKNOWN_CA : constant := 1048;  --  openssl/ssl.h:2225
      SSL_R_TLSV1_ALERT_USER_CANCELLED : constant := 1090;  --  openssl/ssl.h:2226
      SSL_R_TLSV1_BAD_CERTIFICATE_HASH_VALUE : constant := 1114;  --  openssl/ssl.h:2227
      SSL_R_TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE : constant := 1113;  --  openssl/ssl.h:2228
      SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE : constant := 1111;  --  openssl/ssl.h:2229
      SSL_R_TLSV1_UNRECOGNIZED_NAME : constant := 1112;  --  openssl/ssl.h:2230
      SSL_R_TLSV1_UNSUPPORTED_EXTENSION : constant := 1110;  --  openssl/ssl.h:2231
      SSL_R_TLS_CLIENT_CERT_REQ_WITH_ANON_CIPHER : constant := 232;  --  openssl/ssl.h:2232
      SSL_R_TLS_INVALID_ECPOINTFORMAT_LIST : constant := 157;  --  openssl/ssl.h:2233
      SSL_R_TLS_PEER_DID_NOT_RESPOND_WITH_CERTIFICATE_LIST : constant := 233;  --  openssl/ssl.h:2234
      SSL_R_TLS_RSA_ENCRYPTED_VALUE_LENGTH_IS_WRONG : constant := 234;  --  openssl/ssl.h:2235
      SSL_R_TRIED_TO_USE_UNSUPPORTED_CIPHER : constant := 235;  --  openssl/ssl.h:2236
      SSL_R_UNABLE_TO_DECODE_DH_CERTS : constant := 236;  --  openssl/ssl.h:2237
      SSL_R_UNABLE_TO_DECODE_ECDH_CERTS : constant := 313;  --  openssl/ssl.h:2238
      SSL_R_UNABLE_TO_EXTRACT_PUBLIC_KEY : constant := 237;  --  openssl/ssl.h:2239
      SSL_R_UNABLE_TO_FIND_DH_PARAMETERS : constant := 238;  --  openssl/ssl.h:2240
      SSL_R_UNABLE_TO_FIND_ECDH_PARAMETERS : constant := 314;  --  openssl/ssl.h:2241
      SSL_R_UNABLE_TO_FIND_PUBLIC_KEY_PARAMETERS : constant := 239;  --  openssl/ssl.h:2242
      SSL_R_UNABLE_TO_FIND_SSL_METHOD : constant := 240;  --  openssl/ssl.h:2243
      SSL_R_UNABLE_TO_LOAD_SSL2_MD5_ROUTINES : constant := 241;  --  openssl/ssl.h:2244
      SSL_R_UNABLE_TO_LOAD_SSL3_MD5_ROUTINES : constant := 242;  --  openssl/ssl.h:2245
      SSL_R_UNABLE_TO_LOAD_SSL3_SHA1_ROUTINES : constant := 243;  --  openssl/ssl.h:2246
      SSL_R_UNEXPECTED_MESSAGE : constant := 244;  --  openssl/ssl.h:2247
      SSL_R_UNEXPECTED_RECORD  : constant := 245;  --  openssl/ssl.h:2248
      SSL_R_UNINITIALIZED      : constant := 276;  --  openssl/ssl.h:2249
      SSL_R_UNKNOWN_ALERT_TYPE : constant := 246;  --  openssl/ssl.h:2250
      SSL_R_UNKNOWN_CERTIFICATE_TYPE : constant := 247;  --  openssl/ssl.h:2251
      SSL_R_UNKNOWN_CIPHER_RETURNED : constant := 248;  --  openssl/ssl.h:2252
      SSL_R_UNKNOWN_CIPHER_TYPE : constant := 249;  --  openssl/ssl.h:2253
      SSL_R_UNKNOWN_KEY_EXCHANGE_TYPE : constant := 250;  --  openssl/ssl.h:2254
      SSL_R_UNKNOWN_PKEY_TYPE  : constant := 251;  --  openssl/ssl.h:2255
      SSL_R_UNKNOWN_PROTOCOL   : constant := 252;  --  openssl/ssl.h:2256
      SSL_R_UNKNOWN_REMOTE_ERROR_TYPE : constant := 253;  --  openssl/ssl.h:2257
      SSL_R_UNKNOWN_SSL_VERSION : constant := 254;  --  openssl/ssl.h:2258
      SSL_R_UNKNOWN_STATE      : constant := 255;  --  openssl/ssl.h:2259
      SSL_R_UNSAFE_LEGACY_RENEGOTIATION_DISABLED : constant := 338;  --  openssl/ssl.h:2260
      SSL_R_UNSUPPORTED_CIPHER : constant := 256;  --  openssl/ssl.h:2261
      SSL_R_UNSUPPORTED_COMPRESSION_ALGORITHM : constant := 257;  --  openssl/ssl.h:2262
      SSL_R_UNSUPPORTED_DIGEST_TYPE : constant := 326;  --  openssl/ssl.h:2263
      SSL_R_UNSUPPORTED_ELLIPTIC_CURVE : constant := 315;  --  openssl/ssl.h:2264
      SSL_R_UNSUPPORTED_PROTOCOL : constant := 258;  --  openssl/ssl.h:2265
      SSL_R_UNSUPPORTED_SSL_VERSION : constant := 259;  --  openssl/ssl.h:2266
      SSL_R_UNSUPPORTED_STATUS_TYPE : constant := 329;  --  openssl/ssl.h:2267
      SSL_R_WRITE_BIO_NOT_SET  : constant := 260;  --  openssl/ssl.h:2268
      SSL_R_WRONG_CIPHER_RETURNED : constant := 261;  --  openssl/ssl.h:2269
      SSL_R_WRONG_MESSAGE_TYPE : constant := 262;  --  openssl/ssl.h:2270
      SSL_R_WRONG_NUMBER_OF_KEY_BITS : constant := 263;  --  openssl/ssl.h:2271
      SSL_R_WRONG_SIGNATURE_LENGTH : constant := 264;  --  openssl/ssl.h:2272
      SSL_R_WRONG_SIGNATURE_SIZE : constant := 265;  --  openssl/ssl.h:2273
      SSL_R_WRONG_SSL_VERSION  : constant := 266;  --  openssl/ssl.h:2274
      SSL_R_WRONG_VERSION_NUMBER : constant := 267;  --  openssl/ssl.h:2275
      SSL_R_X509_LIB           : constant := 268;  --  openssl/ssl.h:2276
      SSL_R_X509_VERIFICATION_SETUP_PROBLEMS : constant := 269;  --  openssl/ssl.h:2277
   end defs;
   type ssl_crock_st is new System.Address;  -- openssl/ssl.h:357

   subtype TLS_SESSION_TICKET_EXT is OpenSSL.Low_Level.tls1_h.tls_session_ticket_ext_st;

   type ssl_cipher_st is record
      valid          : aliased int;  -- openssl/ssl.h:363
      name           : Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:364
      id             : aliased unsigned_long;  -- openssl/ssl.h:365
      algorithm_mkey : aliased unsigned_long;  -- openssl/ssl.h:368
      algorithm_auth : aliased unsigned_long;  -- openssl/ssl.h:369
      algorithm_enc  : aliased unsigned_long;  -- openssl/ssl.h:370
      algorithm_mac  : aliased unsigned_long;  -- openssl/ssl.h:371
      algorithm_ssl  : aliased unsigned_long;  -- openssl/ssl.h:372
      algo_strength  : aliased unsigned_long;  -- openssl/ssl.h:374
      algorithm2     : aliased unsigned_long;  -- openssl/ssl.h:375
      strength_bits  : aliased int;  -- openssl/ssl.h:376
      alg_bits       : aliased int;  -- openssl/ssl.h:377
   end record;
   pragma Convention (C_Pass_By_Copy, ssl_cipher_st);  -- openssl/ssl.h:361

   subtype SSL_CIPHER is ssl_cipher_st;

   type stack_st_SSL_CIPHER is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/ssl.h:380
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_SSL_CIPHER);  -- openssl/ssl.h:380

   type tls_session_ticket_ext_cb_fn is access function
     (arg1 : System.Address;
      arg2 : access unsigned_char;
      arg3 : int;
      arg4 : System.Address) return int;  -- openssl/ssl.h:382

   type tls_session_secret_cb_fn is access function
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : access int;
      arg4 : access stack_st_SSL_CIPHER;
      arg5 : System.Address;
      arg6 : System.Address) return int;  -- openssl/ssl.h:383
   type ssl_st;
   type ssl_method_st is record
      version               : aliased int;  -- openssl/ssl.h:388
      ssl_new               : access function (arg1 : System.Address) return int;  -- openssl/ssl.h:389
      ssl_clear             : access procedure (arg1 : System.Address);  -- openssl/ssl.h:390
      ssl_free              : access procedure (arg1 : System.Address);  -- openssl/ssl.h:391
      ssl_accept            : access function (arg1 : System.Address) return int;  -- openssl/ssl.h:392
      ssl_connect           : access function (arg1 : System.Address) return int;  -- openssl/ssl.h:393
      ssl_read              : access function
        (arg1 : System.Address;
         arg2                  : System.Address;
         arg3                  : int) return int;  -- openssl/ssl.h:394
      ssl_peek              : access function
        (arg1 : System.Address;
         arg2                  : System.Address;
         arg3                  : int) return int;  -- openssl/ssl.h:395
      ssl_write             : access function
        (arg1 : System.Address;
         arg2                  : System.Address;
         arg3                  : int) return int;  -- openssl/ssl.h:396
      ssl_shutdown          : access function (arg1 : System.Address) return int;  -- openssl/ssl.h:397
      ssl_renegotiate       : access function (arg1 : System.Address) return int;  -- openssl/ssl.h:398
      ssl_renegotiate_check : access function (arg1 : System.Address) return int;  -- openssl/ssl.h:399
      ssl_get_message       : access function
        (arg1 : System.Address;
         arg2                  : int;
         arg3                  : int;
         arg4                  : int;
         arg5                  : long;
         arg6                  : access int) return long;  -- openssl/ssl.h:401
      ssl_read_bytes        : access function
        (arg1 : System.Address;
         arg2                  : int;
         arg3                  : access unsigned_char;
         arg4                  : int;
         arg5                  : int) return int;  -- openssl/ssl.h:403
      ssl_write_bytes       : access function
        (arg1 : System.Address;
         arg2                  : int;
         arg3                  : System.Address;
         arg4                  : int) return int;  -- openssl/ssl.h:404
      ssl_dispatch_alert    : access function (arg1 : System.Address) return int;  -- openssl/ssl.h:405
      ssl_ctrl              : access function
        (arg1 : System.Address;
         arg2                  : int;
         arg3                  : long;
         arg4                  : System.Address) return long;  -- openssl/ssl.h:406
      ssl_ctx_ctrl          : access function
        (arg1 : System.Address;
         arg2                  : int;
         arg3                  : long;
         arg4                  : System.Address) return long;  -- openssl/ssl.h:407
      get_cipher_by_char    : access function (arg1 : access unsigned_char) return System.Address;  -- openssl/ssl.h:408
      put_cipher_by_char    : access function (arg1 : System.Address; arg2 : access unsigned_char) return int;  -- openssl/ssl.h:409
      ssl_pending           : access function (arg1 : access constant  ssl_st) return int;  -- openssl/ssl.h:410
      num_ciphers           : access function return int;  -- openssl/ssl.h:411
      get_cipher            : access function (arg1 : unsigned) return System.Address;  -- openssl/ssl.h:412
      get_ssl_method        : access function (arg1 : int) return System.Address;  -- openssl/ssl.h:413
      get_timeout           : access function return long;  -- openssl/ssl.h:414
      ssl3_enc              : System.Address;  -- openssl/ssl.h:415
      ssl_version           : access function return int;  -- openssl/ssl.h:416
      ssl_callback_ctrl     : access function
        (arg1 : System.Address;
         arg2                  : int;
         arg3                  : access procedure) return long;  -- openssl/ssl.h:417
      ssl_ctx_callback_ctrl : access function
        (arg1 : System.Address;
         arg2                  : int;
         arg3                  : access procedure) return long;  -- openssl/ssl.h:418
   end record;
   pragma Convention (C_Pass_By_Copy, ssl_method_st);  -- openssl/ssl.h:386

   --  skipped empty struct ssl3_enc_method

   subtype SSL_METHOD is ssl_method_st;

   type ssl_session_st_key_arg_array is array (0 .. 7) of aliased unsigned_char;
   type ssl_session_st_master_key_array is array (0 .. 47) of aliased unsigned_char;
   type ssl_session_st_session_id_array is array (0 .. 31) of aliased unsigned_char;
   type ssl_session_st_sid_ctx_array is array (0 .. 31) of aliased unsigned_char;
   type ssl_session_st_krb5_client_princ_array is array (0 .. 255) of aliased unsigned_char;
   type ssl_session_st is record
      ssl_version               : aliased int;  -- openssl/ssl.h:445
      key_arg_length            : aliased unsigned;  -- openssl/ssl.h:449
      key_arg                   : aliased ssl_session_st_key_arg_array;  -- openssl/ssl.h:450
      master_key_length         : aliased int;  -- openssl/ssl.h:451
      master_key                : aliased ssl_session_st_master_key_array;  -- openssl/ssl.h:452
      session_id_length         : aliased unsigned;  -- openssl/ssl.h:454
      session_id                : aliased ssl_session_st_session_id_array;  -- openssl/ssl.h:455
      sid_ctx_length            : aliased unsigned;  -- openssl/ssl.h:459
      sid_ctx                   : aliased ssl_session_st_sid_ctx_array;  -- openssl/ssl.h:460
      krb5_client_princ_len     : aliased unsigned;  -- openssl/ssl.h:463
      krb5_client_princ         : aliased ssl_session_st_krb5_client_princ_array;  -- openssl/ssl.h:464
      psk_identity_hint         : Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:467
      psk_identity              : Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:468
      not_resumable             : aliased int;  -- openssl/ssl.h:470
      sess_cert                 : System.Address;  -- openssl/ssl.h:473
      peer                      : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/ssl.h:479
      verify_result             : aliased long;  -- openssl/ssl.h:482
      references                : aliased int;  -- openssl/ssl.h:484
      timeout                   : aliased long;  -- openssl/ssl.h:485
      time                      : aliased long;  -- openssl/ssl.h:486
      compress_meth             : aliased unsigned;  -- openssl/ssl.h:488
      cipher                    : System.Address;  -- openssl/ssl.h:490
      cipher_id                 : aliased unsigned_long;  -- openssl/ssl.h:491
      ciphers                   : access stack_st_SSL_CIPHER;  -- openssl/ssl.h:495
      ex_data                   : aliased OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;  -- openssl/ssl.h:497
      prev                      : access ssl_session_st;  -- openssl/ssl.h:501
      next                      : access ssl_session_st;  -- openssl/ssl.h:501
      tlsext_hostname           : Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:503
      tlsext_tick               : access unsigned_char;  -- openssl/ssl.h:505
      tlsext_ticklen            : aliased size_t;  -- openssl/ssl.h:506
      tlsext_tick_lifetime_hint : aliased long;  -- openssl/ssl.h:507
   end record;
   pragma Convention (C_Pass_By_Copy, ssl_session_st);  -- openssl/ssl.h:443

   --  skipped empty struct sess_cert_st

   subtype SSL_SESSION is ssl_session_st;

   procedure SSL_CTX_set_msg_callback (ctx : System.Address; cb : access procedure
                                         (arg1 : int;
                                          arg2 : int;
                                          arg3 : int;
                                          arg4 : System.Address;
                                          arg5 : size_t;
                                          arg6 : System.Address;
                                          arg7 : System.Address));  -- openssl/ssl.h:634
   pragma Import (C, SSL_CTX_set_msg_callback, "SSL_CTX_set_msg_callback");

   procedure SSL_set_msg_callback (the_ssl : System.Address; cb : access procedure
                                     (arg1 : int;
                                      arg2 : int;
                                      arg3 : int;
                                      arg4 : System.Address;
                                      arg5 : size_t;
                                      arg6 : System.Address;
                                      arg7 : System.Address));  -- openssl/ssl.h:635
   pragma Import (C, SSL_set_msg_callback, "SSL_set_msg_callback");

   type GEN_SESSION_CB is access function
     (arg1 : access constant  ssl_st;
      arg2 : access unsigned_char;
      arg3 : access unsigned) return int;  -- openssl/ssl.h:662

   type ssl_comp_st is record
      id     : aliased int;  -- openssl/ssl.h:667
      name   : Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:668
      method : access OpenSSL.Low_Level.comp_h.comp_method_st;  -- openssl/ssl.h:670
   end record;
   pragma Convention (C_Pass_By_Copy, ssl_comp_st);  -- openssl/ssl.h:665

   subtype SSL_COMP is ssl_comp_st;

   type stack_st_SSL_COMP is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/ssl.h:676
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_SSL_COMP);  -- openssl/ssl.h:676

   type lhash_st_SSL_SESSION is record
      dummy : aliased int;  -- openssl/ssl.h:677
   end record;
   pragma Convention (C_Pass_By_Copy, lhash_st_SSL_SESSION);  -- openssl/ssl.h:677

   type ssl_ctx_st_sid_ctx_array is array (0 .. 31) of aliased unsigned_char;
   type ssl_ctx_st_tlsext_tick_key_name_array is array (0 .. 15) of aliased unsigned_char;
   type ssl_ctx_st_tlsext_tick_hmac_key_array is array (0 .. 15) of aliased unsigned_char;
   type ssl_ctx_st_tlsext_tick_aes_key_array is array (0 .. 15) of aliased unsigned_char;
   type ssl_ctx_st;
   type anon_37 is record
      sess_connect             : aliased int;  -- openssl/ssl.h:722
      sess_connect_renegotiate : aliased int;  -- openssl/ssl.h:723
      sess_connect_good        : aliased int;  -- openssl/ssl.h:724
      sess_accept              : aliased int;  -- openssl/ssl.h:725
      sess_accept_renegotiate  : aliased int;  -- openssl/ssl.h:726
      sess_accept_good         : aliased int;  -- openssl/ssl.h:727
      sess_miss                : aliased int;  -- openssl/ssl.h:728
      sess_timeout             : aliased int;  -- openssl/ssl.h:729
      sess_cache_full          : aliased int;  -- openssl/ssl.h:730
      sess_hit                 : aliased int;  -- openssl/ssl.h:731
      sess_cb_hit              : aliased int;  -- openssl/ssl.h:732
   end record;
   pragma Convention (C_Pass_By_Copy, anon_37);
   type ssl_ctx_st is record
      method                               : System.Address;  -- openssl/ssl.h:681
      cipher_list                          : access stack_st_SSL_CIPHER;  -- openssl/ssl.h:683
      cipher_list_by_id                    : access stack_st_SSL_CIPHER;  -- openssl/ssl.h:685
      cert_store                           : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;  -- openssl/ssl.h:687
      sessions                             : access lhash_st_SSL_SESSION;  -- openssl/ssl.h:688
      session_cache_size                   : aliased unsigned_long;  -- openssl/ssl.h:691
      session_cache_head                   : access ssl_session_st;  -- openssl/ssl.h:692
      session_cache_tail                   : access ssl_session_st;  -- openssl/ssl.h:693
      session_cache_mode                   : aliased int;  -- openssl/ssl.h:700
      session_timeout                      : aliased long;  -- openssl/ssl.h:705
      new_session_cb                       : access function (arg1 : System.Address; arg2          : access SSL_SESSION) return int;  -- openssl/ssl.h:715
      remove_session_cb                    : access procedure (arg1 : access ssl_ctx_st; arg2       : access SSL_SESSION);  -- openssl/ssl.h:716
      get_session_cb                       : access function
        (arg1 : System.Address;
         arg2                                 : access unsigned_char;
         arg3                                 : int;
         arg4                                 : access int) return access SSL_SESSION;  -- openssl/ssl.h:718
      stats                                : aliased anon_37;  -- openssl/ssl.h:738
      references                           : aliased int;  -- openssl/ssl.h:740
      app_verify_callback                  : access function (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st; arg2 : System.Address) return int;  -- openssl/ssl.h:743
      app_verify_arg                       : System.Address;  -- openssl/ssl.h:744
      default_passwd_callback              : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2                                 : int;
         arg3                                 : int;
         arg4                                 : System.Address) return int;  -- openssl/ssl.h:749
      default_passwd_callback_userdata     : System.Address;  -- openssl/ssl.h:752
      client_cert_cb                       : access function
        (arg1 : System.Address;
         arg2                                 : System.Address;
         arg3                                 : System.Address) return int;  -- openssl/ssl.h:755
      app_gen_cookie_cb                    : access function
        (arg1 : System.Address;
         arg2                                 : access unsigned_char;
         arg3                                 : access unsigned) return int;  -- openssl/ssl.h:759
      app_verify_cookie_cb                 : access function
        (arg1 : System.Address;
         arg2                                 : access unsigned_char;
         arg3                                 : unsigned) return int;  -- openssl/ssl.h:763
      ex_data                              : aliased OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;  -- openssl/ssl.h:765
      rsa_md5                              : access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/ssl.h:767
      md5                                  : access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/ssl.h:768
      sha1                                 : access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/ssl.h:769
      extra_certs                          : access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/ssl.h:771
      comp_methods                         : access stack_st_SSL_COMP;  -- openssl/ssl.h:772
      info_callback                        : access procedure
        (arg1 : access constant  ssl_st;
         arg2                                 : int;
         arg3                                 : int);  -- openssl/ssl.h:777
      client_CA                            : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME;  -- openssl/ssl.h:780
      options                              : aliased unsigned_long;  -- openssl/ssl.h:785
      mode                                 : aliased unsigned_long;  -- openssl/ssl.h:786
      max_cert_list                        : aliased long;  -- openssl/ssl.h:787
      cert                                 : System.Address;  -- openssl/ssl.h:789
      read_ahead                           : aliased int;  -- openssl/ssl.h:790
      msg_callback                         : access procedure
        (arg1 : int;
         arg2                                 : int;
         arg3                                 : int;
         arg4                                 : System.Address;
         arg5                                 : size_t;
         arg6                                 : System.Address;
         arg7                                 : System.Address);  -- openssl/ssl.h:793
      msg_callback_arg                     : System.Address;  -- openssl/ssl.h:794
      verify_mode                          : aliased int;  -- openssl/ssl.h:796
      sid_ctx_length                       : aliased unsigned;  -- openssl/ssl.h:797
      sid_ctx                              : aliased ssl_ctx_st_sid_ctx_array;  -- openssl/ssl.h:798
      default_verify_callback              : access function (arg1 : int; arg2 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st) return int;  -- openssl/ssl.h:799
      generate_session_id                  : access function
        (arg1 : access constant  ssl_st;
         arg2                                 : access unsigned_char;
         arg3                                 : access unsigned) return int;  -- openssl/ssl.h:802
      param                                : access OpenSSL.Low_Level.x509_vfy_h.X509_VERIFY_PARAM_st;  -- openssl/ssl.h:804
      quiet_shutdown                       : aliased int;  -- openssl/ssl.h:811
      max_send_fragment                    : aliased unsigned;  -- openssl/ssl.h:817
      client_cert_engine                   : System.Address;  -- openssl/ssl.h:822
      tlsext_servername_callback           : access function
        (arg1 : System.Address;
         arg2                                 : access int;
         arg3                                 : System.Address) return int;  -- openssl/ssl.h:827
      tlsext_servername_arg                : System.Address;  -- openssl/ssl.h:828
      tlsext_tick_key_name                 : aliased ssl_ctx_st_tlsext_tick_key_name_array;  -- openssl/ssl.h:830
      tlsext_tick_hmac_key                 : aliased ssl_ctx_st_tlsext_tick_hmac_key_array;  -- openssl/ssl.h:831
      tlsext_tick_aes_key                  : aliased ssl_ctx_st_tlsext_tick_aes_key_array;  -- openssl/ssl.h:832
      tlsext_ticket_key_cb                 : access function
        (arg1 : System.Address;
         arg2                                 : access unsigned_char;
         arg3                                 : access unsigned_char;
         arg4                                 : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;
         arg5                                 : access OpenSSL.Low_Level.hmac_h.hmac_ctx_st;
         arg6                                 : int) return int;  -- openssl/ssl.h:837
      tlsext_status_cb                     : access function (arg1 : System.Address; arg2          : System.Address) return int;  -- openssl/ssl.h:841
      tlsext_status_arg                    : System.Address;  -- openssl/ssl.h:842
      tlsext_opaque_prf_input_callback     : access function
        (arg1 : System.Address;
         arg2                                 : System.Address;
         arg3                                 : size_t;
         arg4                                 : System.Address) return int;  -- openssl/ssl.h:845
      tlsext_opaque_prf_input_callback_arg : System.Address;  -- openssl/ssl.h:846
      psk_identity_hint                    : Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:850
      psk_client_callback                  : access function
        (arg1 : System.Address;
         arg2                                 : Interfaces.C.Strings.chars_ptr;
         arg3                                 : Interfaces.C.Strings.chars_ptr;
         arg4                                 : unsigned;
         arg5                                 : access unsigned_char;
         arg6                                 : unsigned) return unsigned;  -- openssl/ssl.h:853
      psk_server_callback                  : access function
        (arg1 : System.Address;
         arg2                                 : Interfaces.C.Strings.chars_ptr;
         arg3                                 : access unsigned_char;
         arg4                                 : unsigned) return unsigned;  -- openssl/ssl.h:855
      freelist_max_len                     : aliased unsigned;  -- openssl/ssl.h:860
      wbuf_freelist                        : System.Address;  -- openssl/ssl.h:861
      rbuf_freelist                        : System.Address;  -- openssl/ssl.h:862
   end record;
   pragma Convention (C_Pass_By_Copy, ssl_ctx_st);  -- openssl/ssl.h:679

   --  skipped empty struct cert_st

   --  skipped empty struct ssl3_buf_freelist_st

   function SSL_CTX_sessions (ctx : access  ssl_ctx_st) return access lhash_st_SSL_SESSION;  -- openssl/ssl.h:877
   pragma Import (C, SSL_CTX_sessions, "SSL_CTX_sessions");

   procedure SSL_CTX_sess_set_new_cb (ctx : access  ssl_ctx_st; new_session_cb : access function (arg1 : System.Address; arg2 : access SSL_SESSION) return int);  -- openssl/ssl.h:903
   pragma Import (C, SSL_CTX_sess_set_new_cb, "SSL_CTX_sess_set_new_cb");

   function SSL_CTX_sess_get_new_cb (ctx : access  ssl_ctx_st) return access function (arg1 : System.Address; arg2 : access SSL_SESSION) return int;  -- openssl/ssl.h:904
   pragma Import (C, SSL_CTX_sess_get_new_cb, "SSL_CTX_sess_get_new_cb");

   procedure SSL_CTX_sess_set_remove_cb (ctx : access  ssl_ctx_st; remove_session_cb : access procedure (arg1 : access ssl_ctx_st; arg2 : access SSL_SESSION));  -- openssl/ssl.h:905
   pragma Import (C, SSL_CTX_sess_set_remove_cb, "SSL_CTX_sess_set_remove_cb");

   function SSL_CTX_sess_get_remove_cb (ctx : access  ssl_ctx_st) return access procedure (arg1 : access ssl_ctx_st; arg2 : access SSL_SESSION);  -- openssl/ssl.h:906
   pragma Import (C, SSL_CTX_sess_get_remove_cb, "SSL_CTX_sess_get_remove_cb");

   procedure SSL_CTX_sess_set_get_cb (ctx : access  ssl_ctx_st; get_session_cb : access function
                                        (arg1 : System.Address;
                                         arg2 : access unsigned_char;
                                         arg3 : int;
                                         arg4 : access int) return access SSL_SESSION);  -- openssl/ssl.h:907
   pragma Import (C, SSL_CTX_sess_set_get_cb, "SSL_CTX_sess_set_get_cb");

   function SSL_CTX_sess_get_get_cb (ctx : access  ssl_ctx_st) return access function
     (arg1 : System.Address;
      arg2 : access unsigned_char;
      arg3 : int;
      arg4 : access int) return access SSL_SESSION;  -- openssl/ssl.h:908
   pragma Import (C, SSL_CTX_sess_get_get_cb, "SSL_CTX_sess_get_get_cb");

   procedure SSL_CTX_set_info_callback (ctx : access  ssl_ctx_st; cb : access procedure
                                          (arg1 : access constant  ssl_st;
                                           arg2 : int;
                                           arg3 : int));  -- openssl/ssl.h:909
   pragma Import (C, SSL_CTX_set_info_callback, "SSL_CTX_set_info_callback");

   function SSL_CTX_get_info_callback (ctx : access  ssl_ctx_st) return access procedure
     (arg1 : access constant  ssl_st;
      arg2 : int;
      arg3 : int);  -- openssl/ssl.h:910
   pragma Import (C, SSL_CTX_get_info_callback, "SSL_CTX_get_info_callback");

   procedure SSL_CTX_set_client_cert_cb (ctx : access  ssl_ctx_st; client_cert_cb : access function
                                           (arg1 : System.Address;
                                            arg2 : System.Address;
                                            arg3 : System.Address) return int);  -- openssl/ssl.h:911
   pragma Import (C, SSL_CTX_set_client_cert_cb, "SSL_CTX_set_client_cert_cb");

   function SSL_CTX_get_client_cert_cb (ctx : access  ssl_ctx_st) return access function
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : System.Address) return int;  -- openssl/ssl.h:912
   pragma Import (C, SSL_CTX_get_client_cert_cb, "SSL_CTX_get_client_cert_cb");

   function SSL_CTX_set_client_cert_engine (ctx : access  ssl_ctx_st; e : System.Address) return int;  -- openssl/ssl.h:914
   pragma Import (C, SSL_CTX_set_client_cert_engine, "SSL_CTX_set_client_cert_engine");

   procedure SSL_CTX_set_cookie_generate_cb (ctx : access  ssl_ctx_st; app_gen_cookie_cb : access function
                                               (arg1 : System.Address;
                                                arg2 : access unsigned_char;
                                                arg3 : access unsigned) return int);  -- openssl/ssl.h:916
   pragma Import (C, SSL_CTX_set_cookie_generate_cb, "SSL_CTX_set_cookie_generate_cb");

   procedure SSL_CTX_set_cookie_verify_cb (ctx : access  ssl_ctx_st; app_verify_cookie_cb : access function
                                             (arg1 : System.Address;
                                              arg2 : access unsigned_char;
                                              arg3 : unsigned) return int);  -- openssl/ssl.h:917
   pragma Import (C, SSL_CTX_set_cookie_verify_cb, "SSL_CTX_set_cookie_verify_cb");

   procedure SSL_CTX_set_psk_client_callback (ctx : access  ssl_ctx_st; psk_client_callback : access function
                                                (arg1 : System.Address;
                                                 arg2 : Interfaces.C.Strings.chars_ptr;
                                                 arg3 : Interfaces.C.Strings.chars_ptr;
                                                 arg4 : unsigned;
                                                 arg5 : access unsigned_char;
                                                 arg6 : unsigned) return unsigned);  -- openssl/ssl.h:924
   pragma Import (C, SSL_CTX_set_psk_client_callback, "SSL_CTX_set_psk_client_callback");

   procedure SSL_set_psk_client_callback (the_ssl : System.Address; psk_client_callback : access function
                                            (arg1 : System.Address;
                                             arg2 : Interfaces.C.Strings.chars_ptr;
                                             arg3 : Interfaces.C.Strings.chars_ptr;
                                             arg4 : unsigned;
                                             arg5 : access unsigned_char;
                                             arg6 : unsigned) return unsigned);  -- openssl/ssl.h:928
   pragma Import (C, SSL_set_psk_client_callback, "SSL_set_psk_client_callback");

   procedure SSL_CTX_set_psk_server_callback (ctx : access  ssl_ctx_st; psk_server_callback : access function
                                                (arg1 : System.Address;
                                                 arg2 : Interfaces.C.Strings.chars_ptr;
                                                 arg3 : access unsigned_char;
                                                 arg4 : unsigned) return unsigned);  -- openssl/ssl.h:932
   pragma Import (C, SSL_CTX_set_psk_server_callback, "SSL_CTX_set_psk_server_callback");

   procedure SSL_set_psk_server_callback (the_ssl : System.Address; psk_server_callback : access function
                                            (arg1 : System.Address;
                                             arg2 : Interfaces.C.Strings.chars_ptr;
                                             arg3 : access unsigned_char;
                                             arg4 : unsigned) return unsigned);  -- openssl/ssl.h:935
   pragma Import (C, SSL_set_psk_server_callback, "SSL_set_psk_server_callback");

   function SSL_CTX_use_psk_identity_hint (ctx : access  ssl_ctx_st; identity_hint : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ssl.h:938
   pragma Import (C, SSL_CTX_use_psk_identity_hint, "SSL_CTX_use_psk_identity_hint");

   function SSL_use_psk_identity_hint (s : System.Address; identity_hint : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ssl.h:939
   pragma Import (C, SSL_use_psk_identity_hint, "SSL_use_psk_identity_hint");

   function SSL_get_psk_identity_hint (s : access constant  ssl_st) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:940
   pragma Import (C, SSL_get_psk_identity_hint, "SSL_get_psk_identity_hint");

   function SSL_get_psk_identity (s : access constant  ssl_st) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:941
   pragma Import (C, SSL_get_psk_identity, "SSL_get_psk_identity");

   type ssl_st_sid_ctx_array is array (0 .. 31) of aliased unsigned_char;
   type ssl_st is record
      version                       : aliased int;  -- openssl/ssl.h:963
      c_type                        : aliased int;  -- openssl/ssl.h:964
      method                        : System.Address;  -- openssl/ssl.h:966
      rbio                          : access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/ssl.h:973
      wbio                          : access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/ssl.h:974
      bbio                          : access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/ssl.h:975
      rwstate                       : aliased int;  -- openssl/ssl.h:986
      in_handshake                  : aliased int;  -- openssl/ssl.h:989
      handshake_func                : access function (arg1 : access  ssl_st) return int;  -- openssl/ssl.h:990
      server                        : aliased int;  -- openssl/ssl.h:1000
      new_session                   : aliased int;  -- openssl/ssl.h:1002
      quiet_shutdown                : aliased int;  -- openssl/ssl.h:1008
      shutdown                      : aliased int;  -- openssl/ssl.h:1009
      state                         : aliased int;  -- openssl/ssl.h:1011
      rstate                        : aliased int;  -- openssl/ssl.h:1012
      init_buf                      : access OpenSSL.Low_Level.buffer_h.buf_mem_st;  -- openssl/ssl.h:1014
      init_msg                      : System.Address;  -- openssl/ssl.h:1015
      init_num                      : aliased int;  -- openssl/ssl.h:1016
      init_off                      : aliased int;  -- openssl/ssl.h:1017
      packet                        : access unsigned_char;  -- openssl/ssl.h:1020
      packet_length                 : aliased unsigned;  -- openssl/ssl.h:1021
      s2                            : access OpenSSL.Low_Level.ssl2_h.ssl2_state_st;  -- openssl/ssl.h:1023
      s3                            : access OpenSSL.Low_Level.ssl3_h.ssl3_state_st;  -- openssl/ssl.h:1024
      d1                            : access OpenSSL.Low_Level.dtls1_h.dtls1_state_st;  -- openssl/ssl.h:1025
      read_ahead                    : aliased int;  -- openssl/ssl.h:1027
      msg_callback                  : access procedure
        (arg1 : int;
         arg2                          : int;
         arg3                          : int;
         arg4                          : System.Address;
         arg5                          : size_t;
         arg6                          : access  ssl_st;
         arg7                          : System.Address);  -- openssl/ssl.h:1031
      msg_callback_arg              : System.Address;  -- openssl/ssl.h:1032
      hit                           : aliased int;  -- openssl/ssl.h:1034
      param                         : access OpenSSL.Low_Level.x509_vfy_h.X509_VERIFY_PARAM_st;  -- openssl/ssl.h:1036
      cipher_list                   : access stack_st_SSL_CIPHER;  -- openssl/ssl.h:1044
      cipher_list_by_id             : access stack_st_SSL_CIPHER;  -- openssl/ssl.h:1045
      mac_flags                     : aliased int;  -- openssl/ssl.h:1049
      enc_read_ctx                  : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;  -- openssl/ssl.h:1050
      read_hash                     : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;  -- openssl/ssl.h:1051
      expand                        : access OpenSSL.Low_Level.comp_h.comp_ctx_st;  -- openssl/ssl.h:1053
      enc_write_ctx                 : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;  -- openssl/ssl.h:1058
      write_hash                    : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;  -- openssl/ssl.h:1059
      compress                      : access OpenSSL.Low_Level.comp_h.comp_ctx_st;  -- openssl/ssl.h:1061
      cert                          : System.Address;  -- openssl/ssl.h:1070
      sid_ctx_length                : aliased unsigned;  -- openssl/ssl.h:1074
      sid_ctx                       : aliased ssl_st_sid_ctx_array;  -- openssl/ssl.h:1075
      session                       : access SSL_SESSION;  -- openssl/ssl.h:1078
      generate_session_id           : access function
        (arg1 : access constant  ssl_st;
         arg2                          : access unsigned_char;
         arg3                          : access unsigned) return int;  -- openssl/ssl.h:1081
      verify_mode                   : aliased int;  -- openssl/ssl.h:1084
      verify_callback               : access function (arg1 : int; arg2              : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st) return int;  -- openssl/ssl.h:1086
      info_callback                 : access procedure
        (arg1 : access constant  ssl_st;
         arg2                          : int;
         arg3                          : int);  -- openssl/ssl.h:1088
      error                         : aliased int;  -- openssl/ssl.h:1090
      error_code                    : aliased int;  -- openssl/ssl.h:1091
      the_kssl_ctx                  : access OpenSSL.Low_Level.kssl_h.kssl_ctx_st;  -- openssl/ssl.h:1094
      psk_client_callback           : access function
        (arg1 : access  ssl_st;
         arg2                          : Interfaces.C.Strings.chars_ptr;
         arg3                          : Interfaces.C.Strings.chars_ptr;
         arg4                          : unsigned;
         arg5                          : access unsigned_char;
         arg6                          : unsigned) return unsigned;  -- openssl/ssl.h:1100
      psk_server_callback           : access function
        (arg1 : access  ssl_st;
         arg2                          : Interfaces.C.Strings.chars_ptr;
         arg3                          : access unsigned_char;
         arg4                          : unsigned) return unsigned;  -- openssl/ssl.h:1102
      ctx                           : access  ssl_ctx_st;  -- openssl/ssl.h:1105
      debug                         : aliased int;  -- openssl/ssl.h:1108
      verify_result                 : aliased long;  -- openssl/ssl.h:1111
      ex_data                       : aliased OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;  -- openssl/ssl.h:1112
      client_CA                     : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME;  -- openssl/ssl.h:1115
      references                    : aliased int;  -- openssl/ssl.h:1117
      options                       : aliased unsigned_long;  -- openssl/ssl.h:1118
      mode                          : aliased unsigned_long;  -- openssl/ssl.h:1119
      max_cert_list                 : aliased long;  -- openssl/ssl.h:1120
      first_packet                  : aliased int;  -- openssl/ssl.h:1121
      client_version                : aliased int;  -- openssl/ssl.h:1122
      max_send_fragment             : aliased unsigned;  -- openssl/ssl.h:1124
      tlsext_debug_cb               : access procedure
        (arg1 : access  ssl_st;
         arg2                          : int;
         arg3                          : int;
         arg4                          : access unsigned_char;
         arg5                          : int;
         arg6                          : System.Address);  -- openssl/ssl.h:1129
      tlsext_debug_arg              : System.Address;  -- openssl/ssl.h:1130
      tlsext_hostname               : Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1131
      servername_done               : aliased int;  -- openssl/ssl.h:1132
      tlsext_status_type            : aliased int;  -- openssl/ssl.h:1139
      tlsext_status_expected        : aliased int;  -- openssl/ssl.h:1141
      tlsext_ocsp_ids               : access OpenSSL.Low_Level.ocsp_h.stack_st_OCSP_RESPID;  -- openssl/ssl.h:1143
      tlsext_ocsp_exts              : access OpenSSL.Low_Level.x509_h.stack_st_X509_EXTENSION;  -- openssl/ssl.h:1144
      tlsext_ocsp_resp              : access unsigned_char;  -- openssl/ssl.h:1146
      tlsext_ocsp_resplen           : aliased int;  -- openssl/ssl.h:1147
      tlsext_ticket_expected        : aliased int;  -- openssl/ssl.h:1150
      tlsext_opaque_prf_input       : System.Address;  -- openssl/ssl.h:1153
      tlsext_opaque_prf_input_len   : aliased size_t;  -- openssl/ssl.h:1154
      tlsext_session_ticket         : access TLS_SESSION_TICKET_EXT;  -- openssl/ssl.h:1157
      tls_session_ticket_ext_cb     : access function
        (arg1 : access  ssl_st;
         arg2                          : access unsigned_char;
         arg3                          : int;
         arg4                          : System.Address) return int;  -- openssl/ssl.h:1160
      tls_session_ticket_ext_cb_arg : System.Address;  -- openssl/ssl.h:1161
      tls_session_secret_cb         : access function
        (arg1 : access  ssl_st;
         arg2                          : System.Address;
         arg3                          : access int;
         arg4                          : access stack_st_SSL_CIPHER;
         arg5                          : System.Address;
         arg6                          : System.Address) return int;  -- openssl/ssl.h:1164
      tls_session_secret_cb_arg     : System.Address;  -- openssl/ssl.h:1165
      initial_ctx                   : access  ssl_ctx_st;  -- openssl/ssl.h:1167
   end record;
   pragma Convention (C_Pass_By_Copy, ssl_st);  -- openssl/ssl.h:958

   function SSL_get_finished
     (s     : access constant  ssl_st;
      buf   : System.Address;
      count : size_t) return size_t;  -- openssl/ssl.h:1243
   pragma Import (C, SSL_get_finished, "SSL_get_finished");

   function SSL_get_peer_finished
     (s     : access constant  ssl_st;
      buf   : System.Address;
      count : size_t) return size_t;  -- openssl/ssl.h:1244
   pragma Import (C, SSL_get_peer_finished, "SSL_get_peer_finished");

   function PEM_write_SSL_SESSION (fp : access Interfaces.C_Streams.FILEs; x : access SSL_SESSION) return int;  -- openssl/ssl.h:1281
   pragma Import (C, PEM_write_SSL_SESSION, "PEM_write_SSL_SESSION");

   function PEM_write_bio_SSL_SESSION (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access SSL_SESSION) return int;  -- openssl/ssl.h:1281
   pragma Import (C, PEM_write_bio_SSL_SESSION, "PEM_write_bio_SSL_SESSION");

   function PEM_read_SSL_SESSION
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access SSL_SESSION;  -- openssl/ssl.h:1281
   pragma Import (C, PEM_read_SSL_SESSION, "PEM_read_SSL_SESSION");

   function PEM_read_bio_SSL_SESSION
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access SSL_SESSION;  -- openssl/ssl.h:1281
   pragma Import (C, PEM_read_bio_SSL_SESSION, "PEM_read_bio_SSL_SESSION");

   function BIO_f_ssl return access OpenSSL.Low_Level.bio_h.bio_method_st;  -- openssl/ssl.h:1447
   pragma Import (C, BIO_f_ssl, "BIO_f_ssl");

   function BIO_new_ssl (ctx : access  ssl_ctx_st; client : int) return access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/ssl.h:1448
   pragma Import (C, BIO_new_ssl, "BIO_new_ssl");

   function BIO_new_ssl_connect (ctx : access  ssl_ctx_st) return access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/ssl.h:1449
   pragma Import (C, BIO_new_ssl_connect, "BIO_new_ssl_connect");

   function BIO_new_buffer_ssl_connect (ctx : access  ssl_ctx_st) return access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/ssl.h:1450
   pragma Import (C, BIO_new_buffer_ssl_connect, "BIO_new_buffer_ssl_connect");

   function BIO_ssl_copy_session_id (to : access OpenSSL.Low_Level.bio_h.bio_st; from : access OpenSSL.Low_Level.bio_h.bio_st) return int;  -- openssl/ssl.h:1451
   pragma Import (C, BIO_ssl_copy_session_id, "BIO_ssl_copy_session_id");

   procedure BIO_ssl_shutdown (ssl_bio : access OpenSSL.Low_Level.bio_h.bio_st);  -- openssl/ssl.h:1452
   pragma Import (C, BIO_ssl_shutdown, "BIO_ssl_shutdown");

   function SSL_CTX_set_cipher_list (arg1 : access  ssl_ctx_st; str : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ssl.h:1456
   pragma Import (C, SSL_CTX_set_cipher_list, "SSL_CTX_set_cipher_list");

   function SSL_CTX_new (meth : System.Address) return access  ssl_ctx_st;  -- openssl/ssl.h:1457
   pragma Import (C, SSL_CTX_new, "SSL_CTX_new");

   procedure SSL_CTX_free (arg1 : access  ssl_ctx_st);  -- openssl/ssl.h:1458
   pragma Import (C, SSL_CTX_free, "SSL_CTX_free");

   function SSL_CTX_set_timeout (ctx : access  ssl_ctx_st; t : long) return long;  -- openssl/ssl.h:1459
   pragma Import (C, SSL_CTX_set_timeout, "SSL_CTX_set_timeout");

   function SSL_CTX_get_timeout (ctx : access constant  ssl_ctx_st) return long;  -- openssl/ssl.h:1460
   pragma Import (C, SSL_CTX_get_timeout, "SSL_CTX_get_timeout");

   function SSL_CTX_get_cert_store (arg1 : access constant  ssl_ctx_st) return access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;  -- openssl/ssl.h:1461
   pragma Import (C, SSL_CTX_get_cert_store, "SSL_CTX_get_cert_store");

   procedure SSL_CTX_set_cert_store (arg1 : access  ssl_ctx_st; arg2 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st);  -- openssl/ssl.h:1462
   pragma Import (C, SSL_CTX_set_cert_store, "SSL_CTX_set_cert_store");

   function SSL_want (s : access constant  ssl_st) return int;  -- openssl/ssl.h:1463
   pragma Import (C, SSL_want, "SSL_want");

   function SSL_clear (s : access  ssl_st) return int;  -- openssl/ssl.h:1464
   pragma Import (C, SSL_clear, "SSL_clear");

   procedure SSL_CTX_flush_sessions (ctx : access  ssl_ctx_st; tm : long);  -- openssl/ssl.h:1466
   pragma Import (C, SSL_CTX_flush_sessions, "SSL_CTX_flush_sessions");

   function SSL_get_current_cipher (s : access constant  ssl_st) return System.Address;  -- openssl/ssl.h:1468
   pragma Import (C, SSL_get_current_cipher, "SSL_get_current_cipher");

   function SSL_CIPHER_get_bits (c : System.Address; alg_bits : access int) return int;  -- openssl/ssl.h:1469
   pragma Import (C, SSL_CIPHER_get_bits, "SSL_CIPHER_get_bits");

   function SSL_CIPHER_get_version (c : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1470
   pragma Import (C, SSL_CIPHER_get_version, "SSL_CIPHER_get_version");

   function SSL_CIPHER_get_name (c : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1471
   pragma Import (C, SSL_CIPHER_get_name, "SSL_CIPHER_get_name");

   function SSL_get_fd (s : access constant  ssl_st) return int;  -- openssl/ssl.h:1473
   pragma Import (C, SSL_get_fd, "SSL_get_fd");

   function SSL_get_rfd (s : access constant  ssl_st) return int;  -- openssl/ssl.h:1474
   pragma Import (C, SSL_get_rfd, "SSL_get_rfd");

   function SSL_get_wfd (s : access constant  ssl_st) return int;  -- openssl/ssl.h:1475
   pragma Import (C, SSL_get_wfd, "SSL_get_wfd");

   function SSL_get_cipher_list (s : access constant  ssl_st; n : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1476
   pragma Import (C, SSL_get_cipher_list, "SSL_get_cipher_list");

   function SSL_get_shared_ciphers
     (s   : access constant  ssl_st;
      buf : Interfaces.C.Strings.chars_ptr;
      len : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1477
   pragma Import (C, SSL_get_shared_ciphers, "SSL_get_shared_ciphers");

   function SSL_get_read_ahead (s : access constant  ssl_st) return int;  -- openssl/ssl.h:1478
   pragma Import (C, SSL_get_read_ahead, "SSL_get_read_ahead");

   function SSL_pending (s : access constant  ssl_st) return int;  -- openssl/ssl.h:1479
   pragma Import (C, SSL_pending, "SSL_pending");

   function SSL_set_fd (s : access  ssl_st; fd : int) return int;  -- openssl/ssl.h:1481
   pragma Import (C, SSL_set_fd, "SSL_set_fd");

   function SSL_set_rfd (s : access  ssl_st; fd : int) return int;  -- openssl/ssl.h:1482
   pragma Import (C, SSL_set_rfd, "SSL_set_rfd");

   function SSL_set_wfd (s : access  ssl_st; fd : int) return int;  -- openssl/ssl.h:1483
   pragma Import (C, SSL_set_wfd, "SSL_set_wfd");

   procedure SSL_set_bio
     (s    : access  ssl_st;
      rbio : access OpenSSL.Low_Level.bio_h.bio_st;
      wbio : access OpenSSL.Low_Level.bio_h.bio_st);  -- openssl/ssl.h:1486
   pragma Import (C, SSL_set_bio, "SSL_set_bio");

   function SSL_get_rbio (s : access constant  ssl_st) return access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/ssl.h:1487
   pragma Import (C, SSL_get_rbio, "SSL_get_rbio");

   function SSL_get_wbio (s : access constant  ssl_st) return access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/ssl.h:1488
   pragma Import (C, SSL_get_wbio, "SSL_get_wbio");

   function SSL_set_cipher_list (s : access  ssl_st; str : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ssl.h:1490
   pragma Import (C, SSL_set_cipher_list, "SSL_set_cipher_list");

   procedure SSL_set_read_ahead (s : access  ssl_st; yes : int);  -- openssl/ssl.h:1491
   pragma Import (C, SSL_set_read_ahead, "SSL_set_read_ahead");

   function SSL_get_verify_mode (s : access constant  ssl_st) return int;  -- openssl/ssl.h:1492
   pragma Import (C, SSL_get_verify_mode, "SSL_get_verify_mode");

   function SSL_get_verify_depth (s : access constant  ssl_st) return int;  -- openssl/ssl.h:1493
   pragma Import (C, SSL_get_verify_depth, "SSL_get_verify_depth");

   function SSL_get_verify_callback (s : access constant  ssl_st) return access function (arg1 : int; arg2 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st) return int;  -- openssl/ssl.h:1494
   pragma Import (C, SSL_get_verify_callback, "SSL_get_verify_callback");

   procedure SSL_set_verify
     (s        : access  ssl_st;
      mode     : int;
      callback : access function (arg1 : int; arg2 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st) return int);  -- openssl/ssl.h:1495
   pragma Import (C, SSL_set_verify, "SSL_set_verify");

   procedure SSL_set_verify_depth (s : access  ssl_st; depth : int);  -- openssl/ssl.h:1497
   pragma Import (C, SSL_set_verify_depth, "SSL_set_verify_depth");

   function SSL_use_RSAPrivateKey (the_ssl : access  ssl_st; the_rsa : access OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/ssl.h:1499
   pragma Import (C, SSL_use_RSAPrivateKey, "SSL_use_RSAPrivateKey");

   function SSL_use_RSAPrivateKey_ASN1
     (the_ssl : access  ssl_st;
      d       : access unsigned_char;
      len     : long) return int;  -- openssl/ssl.h:1501
   pragma Import (C, SSL_use_RSAPrivateKey_ASN1, "SSL_use_RSAPrivateKey_ASN1");

   function SSL_use_PrivateKey (the_ssl : access  ssl_st; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/ssl.h:1502
   pragma Import (C, SSL_use_PrivateKey, "SSL_use_PrivateKey");

   function SSL_use_PrivateKey_ASN1
     (pk      : int;
      the_ssl : access  ssl_st;
      d       : access unsigned_char;
      len     : long) return int;  -- openssl/ssl.h:1503
   pragma Import (C, SSL_use_PrivateKey_ASN1, "SSL_use_PrivateKey_ASN1");

   function SSL_use_certificate (the_ssl : access  ssl_st; x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/ssl.h:1504
   pragma Import (C, SSL_use_certificate, "SSL_use_certificate");

   function SSL_use_certificate_ASN1
     (the_ssl : access  ssl_st;
      d       : access unsigned_char;
      len     : int) return int;  -- openssl/ssl.h:1505
   pragma Import (C, SSL_use_certificate_ASN1, "SSL_use_certificate_ASN1");

   function SSL_use_RSAPrivateKey_file
     (the_ssl : access  ssl_st;
      file    : Interfaces.C.Strings.chars_ptr;
      c_type  : int) return int;  -- openssl/ssl.h:1508
   pragma Import (C, SSL_use_RSAPrivateKey_file, "SSL_use_RSAPrivateKey_file");

   function SSL_use_PrivateKey_file
     (the_ssl : access  ssl_st;
      file    : Interfaces.C.Strings.chars_ptr;
      c_type  : int) return int;  -- openssl/ssl.h:1509
   pragma Import (C, SSL_use_PrivateKey_file, "SSL_use_PrivateKey_file");

   function SSL_use_certificate_file
     (the_ssl : access  ssl_st;
      file    : Interfaces.C.Strings.chars_ptr;
      c_type  : int) return int;  -- openssl/ssl.h:1510
   pragma Import (C, SSL_use_certificate_file, "SSL_use_certificate_file");

   function SSL_CTX_use_RSAPrivateKey_file
     (ctx    : access  ssl_ctx_st;
      file   : Interfaces.C.Strings.chars_ptr;
      c_type : int) return int;  -- openssl/ssl.h:1511
   pragma Import (C, SSL_CTX_use_RSAPrivateKey_file, "SSL_CTX_use_RSAPrivateKey_file");

   function SSL_CTX_use_PrivateKey_file
     (ctx    : access  ssl_ctx_st;
      file   : Interfaces.C.Strings.chars_ptr;
      c_type : int) return int;  -- openssl/ssl.h:1512
   pragma Import (C, SSL_CTX_use_PrivateKey_file, "SSL_CTX_use_PrivateKey_file");

   function SSL_CTX_use_certificate_file
     (ctx    : access  ssl_ctx_st;
      file   : Interfaces.C.Strings.chars_ptr;
      c_type : int) return int;  -- openssl/ssl.h:1513
   pragma Import (C, SSL_CTX_use_certificate_file, "SSL_CTX_use_certificate_file");

   function SSL_CTX_use_certificate_chain_file (ctx : access  ssl_ctx_st; file : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ssl.h:1514
   pragma Import (C, SSL_CTX_use_certificate_chain_file, "SSL_CTX_use_certificate_chain_file");

   function SSL_load_client_CA_file (file : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME;  -- openssl/ssl.h:1515
   pragma Import (C, SSL_load_client_CA_file, "SSL_load_client_CA_file");

   function SSL_add_file_cert_subjects_to_stack (stackCAs : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME; file : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ssl.h:1516
   pragma Import (C, SSL_add_file_cert_subjects_to_stack, "SSL_add_file_cert_subjects_to_stack");

   function SSL_add_dir_cert_subjects_to_stack (stackCAs : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME; dir : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ssl.h:1520
   pragma Import (C, SSL_add_dir_cert_subjects_to_stack, "SSL_add_dir_cert_subjects_to_stack");

   procedure SSL_load_error_strings;  -- openssl/ssl.h:1527
   pragma Import (C, SSL_load_error_strings, "SSL_load_error_strings");

   function SSL_state_string (s : access constant  ssl_st) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1528
   pragma Import (C, SSL_state_string, "SSL_state_string");

   function SSL_rstate_string (s : access constant  ssl_st) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1529
   pragma Import (C, SSL_rstate_string, "SSL_rstate_string");

   function SSL_state_string_long (s : access constant  ssl_st) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1530
   pragma Import (C, SSL_state_string_long, "SSL_state_string_long");

   function SSL_rstate_string_long (s : access constant  ssl_st) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1531
   pragma Import (C, SSL_rstate_string_long, "SSL_rstate_string_long");

   function SSL_SESSION_get_time (s : System.Address) return long;  -- openssl/ssl.h:1532
   pragma Import (C, SSL_SESSION_get_time, "SSL_SESSION_get_time");

   function SSL_SESSION_set_time (s : access SSL_SESSION; t : long) return long;  -- openssl/ssl.h:1533
   pragma Import (C, SSL_SESSION_set_time, "SSL_SESSION_set_time");

   function SSL_SESSION_get_timeout (s : System.Address) return long;  -- openssl/ssl.h:1534
   pragma Import (C, SSL_SESSION_get_timeout, "SSL_SESSION_get_timeout");

   function SSL_SESSION_set_timeout (s : access SSL_SESSION; t : long) return long;  -- openssl/ssl.h:1535
   pragma Import (C, SSL_SESSION_set_timeout, "SSL_SESSION_set_timeout");

   procedure SSL_copy_session_id (to : access  ssl_st; from : access constant  ssl_st);  -- openssl/ssl.h:1536
   pragma Import (C, SSL_copy_session_id, "SSL_copy_session_id");

   function SSL_SESSION_new return access SSL_SESSION;  -- openssl/ssl.h:1538
   pragma Import (C, SSL_SESSION_new, "SSL_SESSION_new");

   function SSL_SESSION_get_id (s : System.Address; len : access unsigned) return access unsigned_char;  -- openssl/ssl.h:1539
   pragma Import (C, SSL_SESSION_get_id, "SSL_SESSION_get_id");

   function SSL_SESSION_print_fp (fp : access Interfaces.C_Streams.FILEs; ses : System.Address) return int;  -- openssl/ssl.h:1542
   pragma Import (C, SSL_SESSION_print_fp, "SSL_SESSION_print_fp");

   function SSL_SESSION_print (fp : access OpenSSL.Low_Level.bio_h.bio_st; ses : System.Address) return int;  -- openssl/ssl.h:1545
   pragma Import (C, SSL_SESSION_print, "SSL_SESSION_print");

   procedure SSL_SESSION_free (ses : access SSL_SESSION);  -- openssl/ssl.h:1547
   pragma Import (C, SSL_SESSION_free, "SSL_SESSION_free");

   function i2d_SSL_SESSION (c_in : access SSL_SESSION; pp : System.Address) return int;  -- openssl/ssl.h:1548
   pragma Import (C, i2d_SSL_SESSION, "i2d_SSL_SESSION");

   function SSL_set_session (to : access  ssl_st; session : access SSL_SESSION) return int;  -- openssl/ssl.h:1549
   pragma Import (C, SSL_set_session, "SSL_set_session");

   function SSL_CTX_add_session (s : access  ssl_ctx_st; c : access SSL_SESSION) return int;  -- openssl/ssl.h:1550
   pragma Import (C, SSL_CTX_add_session, "SSL_CTX_add_session");

   function SSL_CTX_remove_session (arg1 : access  ssl_ctx_st; c : access SSL_SESSION) return int;  -- openssl/ssl.h:1551
   pragma Import (C, SSL_CTX_remove_session, "SSL_CTX_remove_session");

   function SSL_CTX_set_generate_session_id (arg1 : access  ssl_ctx_st; arg2 : access function
                                               (arg1 : access constant  ssl_st;
                                                arg2 : access unsigned_char;
                                                arg3 : access unsigned) return int) return int;  -- openssl/ssl.h:1552
   pragma Import (C, SSL_CTX_set_generate_session_id, "SSL_CTX_set_generate_session_id");

   function SSL_set_generate_session_id (arg1 : access  ssl_st; arg2 : access function
                                           (arg1 : access constant  ssl_st;
                                            arg2 : access unsigned_char;
                                            arg3 : access unsigned) return int) return int;  -- openssl/ssl.h:1553
   pragma Import (C, SSL_set_generate_session_id, "SSL_set_generate_session_id");

   function SSL_has_matching_session_id
     (the_ssl : access constant  ssl_st;
      id      : access unsigned_char;
      id_len  : unsigned) return int;  -- openssl/ssl.h:1554
   pragma Import (C, SSL_has_matching_session_id, "SSL_has_matching_session_id");

   function d2i_SSL_SESSION
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access SSL_SESSION;  -- openssl/ssl.h:1556
   pragma Import (C, d2i_SSL_SESSION, "d2i_SSL_SESSION");

   function SSL_get_peer_certificate (s : access constant  ssl_st) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/ssl.h:1560
   pragma Import (C, SSL_get_peer_certificate, "SSL_get_peer_certificate");

   function SSL_get_peer_cert_chain (s : access constant  ssl_st) return access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/ssl.h:1563
   pragma Import (C, SSL_get_peer_cert_chain, "SSL_get_peer_cert_chain");

   function SSL_CTX_get_verify_mode (ctx : access constant  ssl_ctx_st) return int;  -- openssl/ssl.h:1565
   pragma Import (C, SSL_CTX_get_verify_mode, "SSL_CTX_get_verify_mode");

   function SSL_CTX_get_verify_depth (ctx : access constant  ssl_ctx_st) return int;  -- openssl/ssl.h:1566
   pragma Import (C, SSL_CTX_get_verify_depth, "SSL_CTX_get_verify_depth");

   function SSL_CTX_get_verify_callback (ctx : access constant  ssl_ctx_st) return access function (arg1 : int; arg2 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st) return int;  -- openssl/ssl.h:1567
   pragma Import (C, SSL_CTX_get_verify_callback, "SSL_CTX_get_verify_callback");

   procedure SSL_CTX_set_verify
     (ctx      : access  ssl_ctx_st;
      mode     : int;
      callback : access function (arg1 : int; arg2 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st) return int);  -- openssl/ssl.h:1568
   pragma Import (C, SSL_CTX_set_verify, "SSL_CTX_set_verify");

   procedure SSL_CTX_set_verify_depth (ctx : access  ssl_ctx_st; depth : int);  -- openssl/ssl.h:1570
   pragma Import (C, SSL_CTX_set_verify_depth, "SSL_CTX_set_verify_depth");

   procedure SSL_CTX_set_cert_verify_callback
     (ctx : access  ssl_ctx_st;
      cb  : access function (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st; arg2 : System.Address) return int;
      arg : System.Address);  -- openssl/ssl.h:1571
   pragma Import (C, SSL_CTX_set_cert_verify_callback, "SSL_CTX_set_cert_verify_callback");

   function SSL_CTX_use_RSAPrivateKey (ctx : access  ssl_ctx_st; the_rsa : access OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/ssl.h:1573
   pragma Import (C, SSL_CTX_use_RSAPrivateKey, "SSL_CTX_use_RSAPrivateKey");

   function SSL_CTX_use_RSAPrivateKey_ASN1
     (ctx : access  ssl_ctx_st;
      d   : access unsigned_char;
      len : long) return int;  -- openssl/ssl.h:1575
   pragma Import (C, SSL_CTX_use_RSAPrivateKey_ASN1, "SSL_CTX_use_RSAPrivateKey_ASN1");

   function SSL_CTX_use_PrivateKey (ctx : access  ssl_ctx_st; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/ssl.h:1576
   pragma Import (C, SSL_CTX_use_PrivateKey, "SSL_CTX_use_PrivateKey");

   function SSL_CTX_use_PrivateKey_ASN1
     (pk  : int;
      ctx : access  ssl_ctx_st;
      d   : access unsigned_char;
      len : long) return int;  -- openssl/ssl.h:1577
   pragma Import (C, SSL_CTX_use_PrivateKey_ASN1, "SSL_CTX_use_PrivateKey_ASN1");

   function SSL_CTX_use_certificate (ctx : access  ssl_ctx_st; x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/ssl.h:1579
   pragma Import (C, SSL_CTX_use_certificate, "SSL_CTX_use_certificate");

   function SSL_CTX_use_certificate_ASN1
     (ctx : access  ssl_ctx_st;
      len : int;
      d   : access unsigned_char) return int;  -- openssl/ssl.h:1580
   pragma Import (C, SSL_CTX_use_certificate_ASN1, "SSL_CTX_use_certificate_ASN1");

   procedure SSL_CTX_set_default_passwd_cb (ctx : access  ssl_ctx_st; cb : access function
                                              (arg1 : Interfaces.C.Strings.chars_ptr;
                                               arg2 : int;
                                               arg3 : int;
                                               arg4 : System.Address) return int);  -- openssl/ssl.h:1582
   pragma Import (C, SSL_CTX_set_default_passwd_cb, "SSL_CTX_set_default_passwd_cb");

   procedure SSL_CTX_set_default_passwd_cb_userdata (ctx : access  ssl_ctx_st; u : System.Address);  -- openssl/ssl.h:1583
   pragma Import (C, SSL_CTX_set_default_passwd_cb_userdata, "SSL_CTX_set_default_passwd_cb_userdata");

   function SSL_CTX_check_private_key (ctx : access constant  ssl_ctx_st) return int;  -- openssl/ssl.h:1585
   pragma Import (C, SSL_CTX_check_private_key, "SSL_CTX_check_private_key");

   function SSL_check_private_key (ctx : access constant  ssl_st) return int;  -- openssl/ssl.h:1586
   pragma Import (C, SSL_check_private_key, "SSL_check_private_key");

   function SSL_CTX_set_session_id_context
     (ctx         : access  ssl_ctx_st;
      sid_ctx     : access unsigned_char;
      sid_ctx_len : unsigned) return int;  -- openssl/ssl.h:1588
   pragma Import (C, SSL_CTX_set_session_id_context, "SSL_CTX_set_session_id_context");

   function SSL_new (ctx : access  ssl_ctx_st) return access  ssl_st;  -- openssl/ssl.h:1591
   pragma Import (C, SSL_new, "SSL_new");

   function SSL_set_session_id_context
     (the_ssl     : access  ssl_st;
      sid_ctx     : access unsigned_char;
      sid_ctx_len : unsigned) return int;  -- openssl/ssl.h:1592
   pragma Import (C, SSL_set_session_id_context, "SSL_set_session_id_context");

   function SSL_CTX_set_purpose (s : access  ssl_ctx_st; purpose : int) return int;  -- openssl/ssl.h:1595
   pragma Import (C, SSL_CTX_set_purpose, "SSL_CTX_set_purpose");

   function SSL_set_purpose (s : access  ssl_st; purpose : int) return int;  -- openssl/ssl.h:1596
   pragma Import (C, SSL_set_purpose, "SSL_set_purpose");

   function SSL_CTX_set_trust (s : access  ssl_ctx_st; trust : int) return int;  -- openssl/ssl.h:1597
   pragma Import (C, SSL_CTX_set_trust, "SSL_CTX_set_trust");

   function SSL_set_trust (s : access  ssl_st; trust : int) return int;  -- openssl/ssl.h:1598
   pragma Import (C, SSL_set_trust, "SSL_set_trust");

   function SSL_CTX_set1_param (ctx : access  ssl_ctx_st; vpm : access OpenSSL.Low_Level.x509_vfy_h.X509_VERIFY_PARAM_st) return int;  -- openssl/ssl.h:1600
   pragma Import (C, SSL_CTX_set1_param, "SSL_CTX_set1_param");

   function SSL_set1_param (the_ssl : access  ssl_st; vpm : access OpenSSL.Low_Level.x509_vfy_h.X509_VERIFY_PARAM_st) return int;  -- openssl/ssl.h:1601
   pragma Import (C, SSL_set1_param, "SSL_set1_param");

   procedure SSL_free (the_ssl : access  ssl_st);  -- openssl/ssl.h:1603
   pragma Import (C, SSL_free, "SSL_free");

   function SSL_accept (the_ssl : access  ssl_st) return int;  -- openssl/ssl.h:1604
   pragma Import (C, SSL_accept, "SSL_accept");

   function SSL_connect (the_ssl : access  ssl_st) return int;  -- openssl/ssl.h:1605
   pragma Import (C, SSL_connect, "SSL_connect");

   function SSL_read
     (the_ssl : access  ssl_st;
      buf     : System.Address;
      num     : int) return int;  -- openssl/ssl.h:1606
   pragma Import (C, SSL_read, "SSL_read");

   function SSL_peek
     (the_ssl : access  ssl_st;
      buf     : System.Address;
      num     : int) return int;  -- openssl/ssl.h:1607
   pragma Import (C, SSL_peek, "SSL_peek");

   function SSL_write
     (the_ssl : access  ssl_st;
      buf     : System.Address;
      num     : int) return int;  -- openssl/ssl.h:1608
   pragma Import (C, SSL_write, "SSL_write");

   function SSL_ctrl
     (the_ssl : access  ssl_st;
      cmd     : int;
      larg    : long;
      parg    : System.Address) return long;  -- openssl/ssl.h:1609
   pragma Import (C, SSL_ctrl, "SSL_ctrl");

   function SSL_callback_ctrl
     (arg1 : access  ssl_st;
      arg2 : int;
      arg3 : access procedure) return long;  -- openssl/ssl.h:1610
   pragma Import (C, SSL_callback_ctrl, "SSL_callback_ctrl");

   function SSL_CTX_ctrl
     (ctx  : access  ssl_ctx_st;
      cmd  : int;
      larg : long;
      parg : System.Address) return long;  -- openssl/ssl.h:1611
   pragma Import (C, SSL_CTX_ctrl, "SSL_CTX_ctrl");

   function SSL_CTX_callback_ctrl
     (arg1 : access  ssl_ctx_st;
      arg2 : int;
      arg3 : access procedure) return long;  -- openssl/ssl.h:1612
   pragma Import (C, SSL_CTX_callback_ctrl, "SSL_CTX_callback_ctrl");

   function SSL_get_error (s : access constant  ssl_st; ret_code : int) return int;  -- openssl/ssl.h:1614
   pragma Import (C, SSL_get_error, "SSL_get_error");

   function SSL_get_version (s : access constant  ssl_st) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1615
   pragma Import (C, SSL_get_version, "SSL_get_version");

   function SSL_CTX_set_ssl_version (ctx : access  ssl_ctx_st; meth : System.Address) return int;  -- openssl/ssl.h:1618
   pragma Import (C, SSL_CTX_set_ssl_version, "SSL_CTX_set_ssl_version");

   function SSLv2_method return System.Address;  -- openssl/ssl.h:1621
   pragma Import (C, SSLv2_method, "SSLv2_method");

   function SSLv2_server_method return System.Address;  -- openssl/ssl.h:1622
   pragma Import (C, SSLv2_server_method, "SSLv2_server_method");

   function SSLv2_client_method return System.Address;  -- openssl/ssl.h:1623
   pragma Import (C, SSLv2_client_method, "SSLv2_client_method");

   function SSLv3_method return System.Address;  -- openssl/ssl.h:1626
   pragma Import (C, SSLv3_method, "SSLv3_method");

   function SSLv3_server_method return System.Address;  -- openssl/ssl.h:1627
   pragma Import (C, SSLv3_server_method, "SSLv3_server_method");

   function SSLv3_client_method return System.Address;  -- openssl/ssl.h:1628
   pragma Import (C, SSLv3_client_method, "SSLv3_client_method");

   function SSLv23_method return System.Address;  -- openssl/ssl.h:1630
   pragma Import (C, SSLv23_method, "SSLv23_method");

   function SSLv23_server_method return System.Address;  -- openssl/ssl.h:1631
   pragma Import (C, SSLv23_server_method, "SSLv23_server_method");

   function SSLv23_client_method return System.Address;  -- openssl/ssl.h:1632
   pragma Import (C, SSLv23_client_method, "SSLv23_client_method");

   function TLSv1_method return System.Address;  -- openssl/ssl.h:1634
   pragma Import (C, TLSv1_method, "TLSv1_method");

   function TLSv1_server_method return System.Address;  -- openssl/ssl.h:1635
   pragma Import (C, TLSv1_server_method, "TLSv1_server_method");

   function TLSv1_client_method return System.Address;  -- openssl/ssl.h:1636
   pragma Import (C, TLSv1_client_method, "TLSv1_client_method");

   function DTLSv1_method return System.Address;  -- openssl/ssl.h:1638
   pragma Import (C, DTLSv1_method, "DTLSv1_method");

   function DTLSv1_server_method return System.Address;  -- openssl/ssl.h:1639
   pragma Import (C, DTLSv1_server_method, "DTLSv1_server_method");

   function DTLSv1_client_method return System.Address;  -- openssl/ssl.h:1640
   pragma Import (C, DTLSv1_client_method, "DTLSv1_client_method");

   function SSL_get_ciphers (s : access constant  ssl_st) return access stack_st_SSL_CIPHER;  -- openssl/ssl.h:1642
   pragma Import (C, SSL_get_ciphers, "SSL_get_ciphers");

   function SSL_do_handshake (s : access  ssl_st) return int;  -- openssl/ssl.h:1644
   pragma Import (C, SSL_do_handshake, "SSL_do_handshake");

   function SSL_renegotiate (s : access  ssl_st) return int;  -- openssl/ssl.h:1645
   pragma Import (C, SSL_renegotiate, "SSL_renegotiate");

   function SSL_renegotiate_pending (s : access  ssl_st) return int;  -- openssl/ssl.h:1646
   pragma Import (C, SSL_renegotiate_pending, "SSL_renegotiate_pending");

   function SSL_shutdown (s : access  ssl_st) return int;  -- openssl/ssl.h:1647
   pragma Import (C, SSL_shutdown, "SSL_shutdown");

   function SSL_get_ssl_method (s : access  ssl_st) return System.Address;  -- openssl/ssl.h:1649
   pragma Import (C, SSL_get_ssl_method, "SSL_get_ssl_method");

   function SSL_set_ssl_method (s : access  ssl_st; method : System.Address) return int;  -- openssl/ssl.h:1650
   pragma Import (C, SSL_set_ssl_method, "SSL_set_ssl_method");

   function SSL_alert_type_string_long (value : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1651
   pragma Import (C, SSL_alert_type_string_long, "SSL_alert_type_string_long");

   function SSL_alert_type_string (value : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1652
   pragma Import (C, SSL_alert_type_string, "SSL_alert_type_string");

   function SSL_alert_desc_string_long (value : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1653
   pragma Import (C, SSL_alert_desc_string_long, "SSL_alert_desc_string_long");

   function SSL_alert_desc_string (value : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1654
   pragma Import (C, SSL_alert_desc_string, "SSL_alert_desc_string");

   procedure SSL_set_client_CA_list (s : access  ssl_st; name_list : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME);  -- openssl/ssl.h:1656
   pragma Import (C, SSL_set_client_CA_list, "SSL_set_client_CA_list");

   procedure SSL_CTX_set_client_CA_list (ctx : access  ssl_ctx_st; name_list : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME);  -- openssl/ssl.h:1657
   pragma Import (C, SSL_CTX_set_client_CA_list, "SSL_CTX_set_client_CA_list");

   function SSL_get_client_CA_list (s : access constant  ssl_st) return access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME;  -- openssl/ssl.h:1658
   pragma Import (C, SSL_get_client_CA_list, "SSL_get_client_CA_list");

   function SSL_CTX_get_client_CA_list (s : access constant  ssl_ctx_st) return access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME;  -- openssl/ssl.h:1659
   pragma Import (C, SSL_CTX_get_client_CA_list, "SSL_CTX_get_client_CA_list");

   function SSL_add_client_CA (the_ssl : access  ssl_st; x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/ssl.h:1660
   pragma Import (C, SSL_add_client_CA, "SSL_add_client_CA");

   function SSL_CTX_add_client_CA (ctx : access  ssl_ctx_st; x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/ssl.h:1661
   pragma Import (C, SSL_CTX_add_client_CA, "SSL_CTX_add_client_CA");

   procedure SSL_set_connect_state (s : access  ssl_st);  -- openssl/ssl.h:1663
   pragma Import (C, SSL_set_connect_state, "SSL_set_connect_state");

   procedure SSL_set_accept_state (s : access  ssl_st);  -- openssl/ssl.h:1664
   pragma Import (C, SSL_set_accept_state, "SSL_set_accept_state");

   function SSL_get_default_timeout (s : access constant  ssl_st) return long;  -- openssl/ssl.h:1666
   pragma Import (C, SSL_get_default_timeout, "SSL_get_default_timeout");

   function SSL_library_init return int;  -- openssl/ssl.h:1668
   pragma Import (C, SSL_library_init, "SSL_library_init");

   function SSL_CIPHER_description
     (arg1 : System.Address;
      buf  : Interfaces.C.Strings.chars_ptr;
      size : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1670
   pragma Import (C, SSL_CIPHER_description, "SSL_CIPHER_description");

   function SSL_dup_CA_list (sk : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME) return access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME;  -- openssl/ssl.h:1671
   pragma Import (C, SSL_dup_CA_list, "SSL_dup_CA_list");

   function SSL_dup (the_ssl : access  ssl_st) return access  ssl_st;  -- openssl/ssl.h:1673
   pragma Import (C, SSL_dup, "SSL_dup");

   function SSL_get_certificate (the_ssl : access constant  ssl_st) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/ssl.h:1675
   pragma Import (C, SSL_get_certificate, "SSL_get_certificate");

   function SSL_get_privatekey (the_ssl : access  ssl_st) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/ssl.h:1676
   pragma Import (C, SSL_get_privatekey, "SSL_get_privatekey");

   procedure SSL_CTX_set_quiet_shutdown (ctx : access  ssl_ctx_st; mode : int);  -- openssl/ssl.h:1678
   pragma Import (C, SSL_CTX_set_quiet_shutdown, "SSL_CTX_set_quiet_shutdown");

   function SSL_CTX_get_quiet_shutdown (ctx : access constant  ssl_ctx_st) return int;  -- openssl/ssl.h:1679
   pragma Import (C, SSL_CTX_get_quiet_shutdown, "SSL_CTX_get_quiet_shutdown");

   procedure SSL_set_quiet_shutdown (the_ssl : access  ssl_st; mode : int);  -- openssl/ssl.h:1680
   pragma Import (C, SSL_set_quiet_shutdown, "SSL_set_quiet_shutdown");

   function SSL_get_quiet_shutdown (the_ssl : access constant  ssl_st) return int;  -- openssl/ssl.h:1681
   pragma Import (C, SSL_get_quiet_shutdown, "SSL_get_quiet_shutdown");

   procedure SSL_set_shutdown (the_ssl : access  ssl_st; mode : int);  -- openssl/ssl.h:1682
   pragma Import (C, SSL_set_shutdown, "SSL_set_shutdown");

   function SSL_get_shutdown (the_ssl : access constant  ssl_st) return int;  -- openssl/ssl.h:1683
   pragma Import (C, SSL_get_shutdown, "SSL_get_shutdown");

   function SSL_version (the_ssl : access constant  ssl_st) return int;  -- openssl/ssl.h:1684
   pragma Import (C, SSL_version, "SSL_version");

   function SSL_CTX_set_default_verify_paths (ctx : access  ssl_ctx_st) return int;  -- openssl/ssl.h:1685
   pragma Import (C, SSL_CTX_set_default_verify_paths, "SSL_CTX_set_default_verify_paths");

   function SSL_CTX_load_verify_locations
     (ctx    : access  ssl_ctx_st;
      CAfile : Interfaces.C.Strings.chars_ptr;
      CApath : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ssl.h:1686
   pragma Import (C, SSL_CTX_load_verify_locations, "SSL_CTX_load_verify_locations");

   function SSL_get_session (the_ssl : access constant  ssl_st) return access SSL_SESSION;  -- openssl/ssl.h:1689
   pragma Import (C, SSL_get_session, "SSL_get_session");

   function SSL_get1_session (the_ssl : access  ssl_st) return access SSL_SESSION;  -- openssl/ssl.h:1690
   pragma Import (C, SSL_get1_session, "SSL_get1_session");

   function SSL_get_SSL_CTX (the_ssl : access constant  ssl_st) return access  ssl_ctx_st;  -- openssl/ssl.h:1691
   pragma Import (C, SSL_get_SSL_CTX, "SSL_get_SSL_CTX");

   function SSL_set_SSL_CTX (the_ssl : access  ssl_st; ctx : access  ssl_ctx_st) return access  ssl_ctx_st;  -- openssl/ssl.h:1692
   pragma Import (C, SSL_set_SSL_CTX, "SSL_set_SSL_CTX");

   procedure SSL_set_info_callback (the_ssl : access  ssl_st; cb : access procedure
                                      (arg1 : access constant  ssl_st;
                                       arg2 : int;
                                       arg3 : int));  -- openssl/ssl.h:1693
   pragma Import (C, SSL_set_info_callback, "SSL_set_info_callback");

   function SSL_get_info_callback (the_ssl : access constant  ssl_st) return access procedure
     (arg1 : access constant  ssl_st;
      arg2 : int;
      arg3 : int);  -- openssl/ssl.h:1695
   pragma Import (C, SSL_get_info_callback, "SSL_get_info_callback");

   function SSL_state (the_ssl : access constant  ssl_st) return int;  -- openssl/ssl.h:1696
   pragma Import (C, SSL_state, "SSL_state");

   procedure SSL_set_verify_result (the_ssl : access  ssl_st; v : long);  -- openssl/ssl.h:1698
   pragma Import (C, SSL_set_verify_result, "SSL_set_verify_result");

   function SSL_get_verify_result (the_ssl : access constant  ssl_st) return long;  -- openssl/ssl.h:1699
   pragma Import (C, SSL_get_verify_result, "SSL_get_verify_result");

   function SSL_set_ex_data
     (the_ssl : access  ssl_st;
      idx     : int;
      data    : System.Address) return int;  -- openssl/ssl.h:1701
   pragma Import (C, SSL_set_ex_data, "SSL_set_ex_data");

   function SSL_get_ex_data (the_ssl : access constant  ssl_st; idx : int) return System.Address;  -- openssl/ssl.h:1702
   pragma Import (C, SSL_get_ex_data, "SSL_get_ex_data");

   function SSL_get_ex_new_index
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
         arg6 : System.Address)) return int;  -- openssl/ssl.h:1703
   pragma Import (C, SSL_get_ex_new_index, "SSL_get_ex_new_index");

   function SSL_SESSION_set_ex_data
     (ss   : access SSL_SESSION;
      idx  : int;
      data : System.Address) return int;  -- openssl/ssl.h:1706
   pragma Import (C, SSL_SESSION_set_ex_data, "SSL_SESSION_set_ex_data");

   function SSL_SESSION_get_ex_data (ss : System.Address; idx : int) return System.Address;  -- openssl/ssl.h:1707
   pragma Import (C, SSL_SESSION_get_ex_data, "SSL_SESSION_get_ex_data");

   function SSL_SESSION_get_ex_new_index
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
         arg6 : System.Address)) return int;  -- openssl/ssl.h:1708
   pragma Import (C, SSL_SESSION_get_ex_new_index, "SSL_SESSION_get_ex_new_index");

   function SSL_CTX_set_ex_data
     (ssl  : access  ssl_ctx_st;
      idx  : int;
      data : System.Address) return int;  -- openssl/ssl.h:1711
   pragma Import (C, SSL_CTX_set_ex_data, "SSL_CTX_set_ex_data");

   function SSL_CTX_get_ex_data (ssl : access constant  ssl_ctx_st; idx : int) return System.Address;  -- openssl/ssl.h:1712
   pragma Import (C, SSL_CTX_get_ex_data, "SSL_CTX_get_ex_data");

   function SSL_CTX_get_ex_new_index
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
         arg6 : System.Address)) return int;  -- openssl/ssl.h:1713
   pragma Import (C, SSL_CTX_get_ex_new_index, "SSL_CTX_get_ex_new_index");

   function SSL_get_ex_data_X509_STORE_CTX_idx return int;  -- openssl/ssl.h:1716
   pragma Import (C, SSL_get_ex_data_X509_STORE_CTX_idx, "SSL_get_ex_data_X509_STORE_CTX_idx");

   procedure SSL_CTX_set_tmp_rsa_callback (ctx : access  ssl_ctx_st; cb : access function
                                             (arg1 : access  ssl_st;
                                              arg2 : int;
                                              arg3 : int) return access OpenSSL.Low_Level.rsa_h.rsa_st);  -- openssl/ssl.h:1749
   pragma Import (C, SSL_CTX_set_tmp_rsa_callback, "SSL_CTX_set_tmp_rsa_callback");

   procedure SSL_set_tmp_rsa_callback (the_ssl : access  ssl_st; cb : access function
                                         (arg1 : access  ssl_st;
                                          arg2 : int;
                                          arg3 : int) return access OpenSSL.Low_Level.rsa_h.rsa_st);  -- openssl/ssl.h:1753
   pragma Import (C, SSL_set_tmp_rsa_callback, "SSL_set_tmp_rsa_callback");

   procedure SSL_CTX_set_tmp_dh_callback (ctx : access  ssl_ctx_st; dh : access function
                                            (arg1 : access  ssl_st;
                                             arg2 : int;
                                             arg3 : int) return access OpenSSL.Low_Level.dh_h.dh_st);  -- openssl/ssl.h:1758
   pragma Import (C, SSL_CTX_set_tmp_dh_callback, "SSL_CTX_set_tmp_dh_callback");

   procedure SSL_set_tmp_dh_callback (the_ssl : access  ssl_st; dh : access function
                                        (arg1 : access  ssl_st;
                                         arg2 : int;
                                         arg3 : int) return access OpenSSL.Low_Level.dh_h.dh_st);  -- openssl/ssl.h:1761
   pragma Import (C, SSL_set_tmp_dh_callback, "SSL_set_tmp_dh_callback");

   function SSL_get_current_compression (s : access  ssl_st) return access constant OpenSSL.Low_Level.comp_h.comp_method_st;  -- openssl/ssl.h:1767
   pragma Import (C, SSL_get_current_compression, "SSL_get_current_compression");

   function SSL_get_current_expansion (s : access  ssl_st) return access constant OpenSSL.Low_Level.comp_h.comp_method_st;  -- openssl/ssl.h:1768
   pragma Import (C, SSL_get_current_expansion, "SSL_get_current_expansion");

   function SSL_COMP_get_name (comp : access constant OpenSSL.Low_Level.comp_h.comp_method_st) return Interfaces.C.Strings.chars_ptr;  -- openssl/ssl.h:1769
   pragma Import (C, SSL_COMP_get_name, "SSL_COMP_get_name");

   function SSL_COMP_get_compression_methods return access stack_st_SSL_COMP;  -- openssl/ssl.h:1770
   pragma Import (C, SSL_COMP_get_compression_methods, "SSL_COMP_get_compression_methods");

   function SSL_COMP_add_compression_method (id : int; cm : access OpenSSL.Low_Level.comp_h.comp_method_st) return int;  -- openssl/ssl.h:1771
   pragma Import (C, SSL_COMP_add_compression_method, "SSL_COMP_add_compression_method");

   function SSL_set_session_ticket_ext
     (s        : access  ssl_st;
      ext_data : System.Address;
      ext_len  : int) return int;  -- openssl/ssl.h:1781
   pragma Import (C, SSL_set_session_ticket_ext, "SSL_set_session_ticket_ext");

   function SSL_set_session_ticket_ext_cb
     (s   : access  ssl_st;
      cb  : access function
        (arg1 : access  ssl_st;
         arg2 : access unsigned_char;
         arg3 : int;
         arg4 : System.Address) return int;
      arg : System.Address) return int;  -- openssl/ssl.h:1783
   pragma Import (C, SSL_set_session_ticket_ext_cb, "SSL_set_session_ticket_ext_cb");

   function SSL_set_session_secret_cb
     (s                     : access  ssl_st;
      tls_session_secret_cb : access function
        (arg1 : access  ssl_st;
         arg2 : System.Address;
         arg3 : access int;
         arg4 : access stack_st_SSL_CIPHER;
         arg5 : System.Address;
         arg6 : System.Address) return int;
      arg                   : System.Address) return int;  -- openssl/ssl.h:1787
   pragma Import (C, SSL_set_session_secret_cb, "SSL_set_session_secret_cb");

   procedure ERR_load_SSL_strings;  -- openssl/ssl.h:1793
   pragma Import (C, ERR_load_SSL_strings, "ERR_load_SSL_strings");

end OpenSSL.Low_Level.ssl_h;
