with Interfaces.C; use Interfaces.C;
--  limited --  with OpenSSL.Low_Level.ossl_typ_h;
with Interfaces.C.Strings;
with System;

package OpenSSL.Low_Level.tls1_h is


   TLS1_ALLOW_EXPERIMENTAL_CIPHERSUITES : constant := 0;  --  openssl/tls1.h:160

   TLS1_VERSION : constant := 16#0301#;  --  openssl/tls1.h:162
   TLS1_VERSION_MAJOR : constant := 16#03#;  --  openssl/tls1.h:163
   TLS1_VERSION_MINOR : constant := 16#01#;  --  openssl/tls1.h:164

   TLS1_AD_DECRYPTION_FAILED : constant := 21;  --  openssl/tls1.h:166
   TLS1_AD_RECORD_OVERFLOW : constant := 22;  --  openssl/tls1.h:167
   TLS1_AD_UNKNOWN_CA : constant := 48;  --  openssl/tls1.h:168
   TLS1_AD_ACCESS_DENIED : constant := 49;  --  openssl/tls1.h:169
   TLS1_AD_DECODE_ERROR : constant := 50;  --  openssl/tls1.h:170
   TLS1_AD_DECRYPT_ERROR : constant := 51;  --  openssl/tls1.h:171
   TLS1_AD_EXPORT_RESTRICTION : constant := 60;  --  openssl/tls1.h:172
   TLS1_AD_PROTOCOL_VERSION : constant := 70;  --  openssl/tls1.h:173
   TLS1_AD_INSUFFICIENT_SECURITY : constant := 71;  --  openssl/tls1.h:174
   TLS1_AD_INTERNAL_ERROR : constant := 80;  --  openssl/tls1.h:175
   TLS1_AD_USER_CANCELLED : constant := 90;  --  openssl/tls1.h:176
   TLS1_AD_NO_RENEGOTIATION : constant := 100;  --  openssl/tls1.h:177

   TLS1_AD_UNSUPPORTED_EXTENSION : constant := 110;  --  openssl/tls1.h:179
   TLS1_AD_CERTIFICATE_UNOBTAINABLE : constant := 111;  --  openssl/tls1.h:180
   TLS1_AD_UNRECOGNIZED_NAME : constant := 112;  --  openssl/tls1.h:181
   TLS1_AD_BAD_CERTIFICATE_STATUS_RESPONSE : constant := 113;  --  openssl/tls1.h:182
   TLS1_AD_BAD_CERTIFICATE_HASH_VALUE : constant := 114;  --  openssl/tls1.h:183
   TLS1_AD_UNKNOWN_PSK_IDENTITY : constant := 115;  --  openssl/tls1.h:184

   TLSEXT_TYPE_server_name : constant := 0;  --  openssl/tls1.h:187
   TLSEXT_TYPE_max_fragment_length : constant := 1;  --  openssl/tls1.h:188
   TLSEXT_TYPE_client_certificate_url : constant := 2;  --  openssl/tls1.h:189
   TLSEXT_TYPE_trusted_ca_keys : constant := 3;  --  openssl/tls1.h:190
   TLSEXT_TYPE_truncated_hmac : constant := 4;  --  openssl/tls1.h:191
   TLSEXT_TYPE_status_request : constant := 5;  --  openssl/tls1.h:192

   TLSEXT_TYPE_elliptic_curves : constant := 10;  --  openssl/tls1.h:194
   TLSEXT_TYPE_ec_point_formats : constant := 11;  --  openssl/tls1.h:195
   TLSEXT_TYPE_session_ticket : constant := 35;  --  openssl/tls1.h:196

   TLSEXT_TYPE_renegotiate : constant := 16#ff01#;  --  openssl/tls1.h:205

   TLSEXT_NAMETYPE_host_name : constant := 0;  --  openssl/tls1.h:208

   TLSEXT_STATUSTYPE_ocsp : constant := 1;  --  openssl/tls1.h:210

   TLSEXT_ECPOINTFORMAT_first : constant := 0;  --  openssl/tls1.h:213
   TLSEXT_ECPOINTFORMAT_uncompressed : constant := 0;  --  openssl/tls1.h:214
   TLSEXT_ECPOINTFORMAT_ansiX962_compressed_prime : constant := 1;  --  openssl/tls1.h:215
   TLSEXT_ECPOINTFORMAT_ansiX962_compressed_char2 : constant := 2;  --  openssl/tls1.h:216
   TLSEXT_ECPOINTFORMAT_last : constant := 2;  --  openssl/tls1.h:217

   TLSEXT_MAXLEN_host_name : constant := 255;  --  openssl/tls1.h:221
   --  arg-macro: procedure SSL_set_tlsext_host_name (s, name)
   --    SSL_ctrl(s,SSL_CTRL_SET_TLSEXT_HOSTNAME,TLSEXT_NAMETYPE_host_name,(char *)name)
   --  arg-macro: procedure SSL_set_tlsext_debug_callback (ssl, cb)
   --    SSL_callback_ctrl(ssl,SSL_CTRL_SET_TLSEXT_DEBUG_CB,(void (*)(void))cb)
   --  arg-macro: procedure SSL_set_tlsext_debug_arg (ssl, arg)
   --    SSL_ctrl(ssl,SSL_CTRL_SET_TLSEXT_DEBUG_ARG,0, (void *)arg)
   --  arg-macro: procedure SSL_set_tlsext_status_type (ssl, type)
   --    SSL_ctrl(ssl,SSL_CTRL_SET_TLSEXT_STATUS_REQ_TYPE,type, NULL)
   --  arg-macro: procedure SSL_get_tlsext_status_exts (ssl, arg)
   --    SSL_ctrl(ssl,SSL_CTRL_GET_TLSEXT_STATUS_REQ_EXTS,0, (void *)arg)
   --  arg-macro: procedure SSL_set_tlsext_status_exts (ssl, arg)
   --    SSL_ctrl(ssl,SSL_CTRL_SET_TLSEXT_STATUS_REQ_EXTS,0, (void *)arg)
   --  arg-macro: procedure SSL_get_tlsext_status_ids (ssl, arg)
   --    SSL_ctrl(ssl,SSL_CTRL_GET_TLSEXT_STATUS_REQ_IDS,0, (void *)arg)
   --  arg-macro: procedure SSL_set_tlsext_status_ids (ssl, arg)
   --    SSL_ctrl(ssl,SSL_CTRL_SET_TLSEXT_STATUS_REQ_IDS,0, (void *)arg)
   --  arg-macro: procedure SSL_get_tlsext_status_ocsp_resp (ssl, arg)
   --    SSL_ctrl(ssl,SSL_CTRL_GET_TLSEXT_STATUS_REQ_OCSP_RESP,0, (void *)arg)
   --  arg-macro: procedure SSL_set_tlsext_status_ocsp_resp (ssl, arg, argleSSL_ctrl(ssl,SSL_CTRL_SET_TLSEXT_STATUS_REQ_OCSP_RESP,arglen, (void *)arg)
   --    SSL_ctrl(ssl,SSL_CTRL_SET_TLSEXT_STATUS_REQ_OCSP_RESP,arglen, (void *)arg)
   --  arg-macro: procedure SSL_CTX_set_tlsext_servername_callback (ctx, cb)
   --    SSL_CTX_callback_ctrl(ctx,SSL_CTRL_SET_TLSEXT_SERVERNAME_CB,(void (*)(void))cb)

   SSL_TLSEXT_ERR_OK : constant := 0;  --  openssl/tls1.h:259
   SSL_TLSEXT_ERR_ALERT_WARNING : constant := 1;  --  openssl/tls1.h:260
   SSL_TLSEXT_ERR_ALERT_FATAL : constant := 2;  --  openssl/tls1.h:261
   SSL_TLSEXT_ERR_NOACK : constant := 3;  --  openssl/tls1.h:262
   --  arg-macro: procedure SSL_CTX_set_tlsext_servername_arg (ctx, arg)
   --    SSL_CTX_ctrl(ctx,SSL_CTRL_SET_TLSEXT_SERVERNAME_ARG,0, (void *)arg)
   --  arg-macro: procedure SSL_CTX_get_tlsext_ticket_keys (ctx, keys, keylSSL_CTX_ctrl((ctx),SSL_CTRL_GET_TLSEXT_TICKET_KEYS,(keylen),(keys))
   --    SSL_CTX_ctrl((ctx),SSL_CTRL_GET_TLSEXT_TICKET_KEYS,(keylen),(keys))
   --  arg-macro: procedure SSL_CTX_set_tlsext_ticket_keys (ctx, keys, keylSSL_CTX_ctrl((ctx),SSL_CTRL_SET_TLSEXT_TICKET_KEYS,(keylen),(keys))
   --    SSL_CTX_ctrl((ctx),SSL_CTRL_SET_TLSEXT_TICKET_KEYS,(keylen),(keys))
   --  arg-macro: procedure SSL_CTX_set_tlsext_status_cb (ssl, cb)
   --    SSL_CTX_callback_ctrl(ssl,SSL_CTRL_SET_TLSEXT_STATUS_REQ_CB,(void (*)(void))cb)
   --  arg-macro: procedure SSL_CTX_set_tlsext_status_arg (ssl, arg)
   --    SSL_CTX_ctrl(ssl,SSL_CTRL_SET_TLSEXT_STATUS_REQ_CB_ARG,0, (void *)arg)
   --  arg-macro: procedure SSL_set_tlsext_opaque_prf_input (s, src, len)
   --    SSL_ctrl(s,SSL_CTRL_SET_TLSEXT_OPAQUE_PRF_INPUT, len, src)
   --  arg-macro: procedure SSL_CTX_set_tlsext_opaque_prf_input_callback (ctx, cb)
   --    SSL_CTX_callback_ctrl(ctx,SSL_CTRL_SET_TLSEXT_OPAQUE_PRF_INPUT_CB, (void (*)(void))cb)
   --  arg-macro: procedure SSL_CTX_set_tlsext_opaque_prf_input_callback_arg (ctx, arg)
   --    SSL_CTX_ctrl(ctx,SSL_CTRL_SET_TLSEXT_OPAQUE_PRF_INPUT_CB_ARG, 0, arg)
   --  arg-macro: procedure SSL_CTX_set_tlsext_ticket_key_cb (ssl, cb)
   --    SSL_CTX_callback_ctrl(ssl,SSL_CTRL_SET_TLSEXT_TICKET_KEY_CB,(void (*)(void))cb)

   TLS1_CK_PSK_WITH_RC4_128_SHA : constant := 16#0300008A#;  --  openssl/tls1.h:291
   TLS1_CK_PSK_WITH_3DES_EDE_CBC_SHA : constant := 16#0300008B#;  --  openssl/tls1.h:292
   TLS1_CK_PSK_WITH_AES_128_CBC_SHA : constant := 16#0300008C#;  --  openssl/tls1.h:293
   TLS1_CK_PSK_WITH_AES_256_CBC_SHA : constant := 16#0300008D#;  --  openssl/tls1.h:294

   TLS1_CK_RSA_EXPORT1024_WITH_RC4_56_MD5 : constant := 16#03000060#;  --  openssl/tls1.h:301
   TLS1_CK_RSA_EXPORT1024_WITH_RC2_CBC_56_MD5 : constant := 16#03000061#;  --  openssl/tls1.h:302
   TLS1_CK_RSA_EXPORT1024_WITH_DES_CBC_SHA : constant := 16#03000062#;  --  openssl/tls1.h:303
   TLS1_CK_DHE_DSS_EXPORT1024_WITH_DES_CBC_SHA : constant := 16#03000063#;  --  openssl/tls1.h:304
   TLS1_CK_RSA_EXPORT1024_WITH_RC4_56_SHA : constant := 16#03000064#;  --  openssl/tls1.h:305
   TLS1_CK_DHE_DSS_EXPORT1024_WITH_RC4_56_SHA : constant := 16#03000065#;  --  openssl/tls1.h:306
   TLS1_CK_DHE_DSS_WITH_RC4_128_SHA : constant := 16#03000066#;  --  openssl/tls1.h:307

   TLS1_CK_RSA_WITH_AES_128_SHA : constant := 16#0300002F#;  --  openssl/tls1.h:311
   TLS1_CK_DH_DSS_WITH_AES_128_SHA : constant := 16#03000030#;  --  openssl/tls1.h:312
   TLS1_CK_DH_RSA_WITH_AES_128_SHA : constant := 16#03000031#;  --  openssl/tls1.h:313
   TLS1_CK_DHE_DSS_WITH_AES_128_SHA : constant := 16#03000032#;  --  openssl/tls1.h:314
   TLS1_CK_DHE_RSA_WITH_AES_128_SHA : constant := 16#03000033#;  --  openssl/tls1.h:315
   TLS1_CK_ADH_WITH_AES_128_SHA : constant := 16#03000034#;  --  openssl/tls1.h:316

   TLS1_CK_RSA_WITH_AES_256_SHA : constant := 16#03000035#;  --  openssl/tls1.h:318
   TLS1_CK_DH_DSS_WITH_AES_256_SHA : constant := 16#03000036#;  --  openssl/tls1.h:319
   TLS1_CK_DH_RSA_WITH_AES_256_SHA : constant := 16#03000037#;  --  openssl/tls1.h:320
   TLS1_CK_DHE_DSS_WITH_AES_256_SHA : constant := 16#03000038#;  --  openssl/tls1.h:321
   TLS1_CK_DHE_RSA_WITH_AES_256_SHA : constant := 16#03000039#;  --  openssl/tls1.h:322
   TLS1_CK_ADH_WITH_AES_256_SHA : constant := 16#0300003A#;  --  openssl/tls1.h:323

   TLS1_CK_RSA_WITH_CAMELLIA_128_CBC_SHA : constant := 16#03000041#;  --  openssl/tls1.h:326
   TLS1_CK_DH_DSS_WITH_CAMELLIA_128_CBC_SHA : constant := 16#03000042#;  --  openssl/tls1.h:327
   TLS1_CK_DH_RSA_WITH_CAMELLIA_128_CBC_SHA : constant := 16#03000043#;  --  openssl/tls1.h:328
   TLS1_CK_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA : constant := 16#03000044#;  --  openssl/tls1.h:329
   TLS1_CK_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA : constant := 16#03000045#;  --  openssl/tls1.h:330
   TLS1_CK_ADH_WITH_CAMELLIA_128_CBC_SHA : constant := 16#03000046#;  --  openssl/tls1.h:331

   TLS1_CK_RSA_WITH_CAMELLIA_256_CBC_SHA : constant := 16#03000084#;  --  openssl/tls1.h:333
   TLS1_CK_DH_DSS_WITH_CAMELLIA_256_CBC_SHA : constant := 16#03000085#;  --  openssl/tls1.h:334
   TLS1_CK_DH_RSA_WITH_CAMELLIA_256_CBC_SHA : constant := 16#03000086#;  --  openssl/tls1.h:335
   TLS1_CK_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA : constant := 16#03000087#;  --  openssl/tls1.h:336
   TLS1_CK_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA : constant := 16#03000088#;  --  openssl/tls1.h:337
   TLS1_CK_ADH_WITH_CAMELLIA_256_CBC_SHA : constant := 16#03000089#;  --  openssl/tls1.h:338

   TLS1_CK_RSA_WITH_SEED_SHA : constant := 16#03000096#;  --  openssl/tls1.h:341
   TLS1_CK_DH_DSS_WITH_SEED_SHA : constant := 16#03000097#;  --  openssl/tls1.h:342
   TLS1_CK_DH_RSA_WITH_SEED_SHA : constant := 16#03000098#;  --  openssl/tls1.h:343
   TLS1_CK_DHE_DSS_WITH_SEED_SHA : constant := 16#03000099#;  --  openssl/tls1.h:344
   TLS1_CK_DHE_RSA_WITH_SEED_SHA : constant := 16#0300009A#;  --  openssl/tls1.h:345
   TLS1_CK_ADH_WITH_SEED_SHA : constant := 16#0300009B#;  --  openssl/tls1.h:346

   TLS1_CK_ECDH_ECDSA_WITH_NULL_SHA : constant := 16#0300C001#;  --  openssl/tls1.h:349
   TLS1_CK_ECDH_ECDSA_WITH_RC4_128_SHA : constant := 16#0300C002#;  --  openssl/tls1.h:350
   TLS1_CK_ECDH_ECDSA_WITH_DES_192_CBC3_SHA : constant := 16#0300C003#;  --  openssl/tls1.h:351
   TLS1_CK_ECDH_ECDSA_WITH_AES_128_CBC_SHA : constant := 16#0300C004#;  --  openssl/tls1.h:352
   TLS1_CK_ECDH_ECDSA_WITH_AES_256_CBC_SHA : constant := 16#0300C005#;  --  openssl/tls1.h:353

   TLS1_CK_ECDHE_ECDSA_WITH_NULL_SHA : constant := 16#0300C006#;  --  openssl/tls1.h:355
   TLS1_CK_ECDHE_ECDSA_WITH_RC4_128_SHA : constant := 16#0300C007#;  --  openssl/tls1.h:356
   TLS1_CK_ECDHE_ECDSA_WITH_DES_192_CBC3_SHA : constant := 16#0300C008#;  --  openssl/tls1.h:357
   TLS1_CK_ECDHE_ECDSA_WITH_AES_128_CBC_SHA : constant := 16#0300C009#;  --  openssl/tls1.h:358
   TLS1_CK_ECDHE_ECDSA_WITH_AES_256_CBC_SHA : constant := 16#0300C00A#;  --  openssl/tls1.h:359

   TLS1_CK_ECDH_RSA_WITH_NULL_SHA : constant := 16#0300C00B#;  --  openssl/tls1.h:361
   TLS1_CK_ECDH_RSA_WITH_RC4_128_SHA : constant := 16#0300C00C#;  --  openssl/tls1.h:362
   TLS1_CK_ECDH_RSA_WITH_DES_192_CBC3_SHA : constant := 16#0300C00D#;  --  openssl/tls1.h:363
   TLS1_CK_ECDH_RSA_WITH_AES_128_CBC_SHA : constant := 16#0300C00E#;  --  openssl/tls1.h:364
   TLS1_CK_ECDH_RSA_WITH_AES_256_CBC_SHA : constant := 16#0300C00F#;  --  openssl/tls1.h:365

   TLS1_CK_ECDHE_RSA_WITH_NULL_SHA : constant := 16#0300C010#;  --  openssl/tls1.h:367
   TLS1_CK_ECDHE_RSA_WITH_RC4_128_SHA : constant := 16#0300C011#;  --  openssl/tls1.h:368
   TLS1_CK_ECDHE_RSA_WITH_DES_192_CBC3_SHA : constant := 16#0300C012#;  --  openssl/tls1.h:369
   TLS1_CK_ECDHE_RSA_WITH_AES_128_CBC_SHA : constant := 16#0300C013#;  --  openssl/tls1.h:370
   TLS1_CK_ECDHE_RSA_WITH_AES_256_CBC_SHA : constant := 16#0300C014#;  --  openssl/tls1.h:371

   TLS1_CK_ECDH_anon_WITH_NULL_SHA : constant := 16#0300C015#;  --  openssl/tls1.h:373
   TLS1_CK_ECDH_anon_WITH_RC4_128_SHA : constant := 16#0300C016#;  --  openssl/tls1.h:374
   TLS1_CK_ECDH_anon_WITH_DES_192_CBC3_SHA : constant := 16#0300C017#;  --  openssl/tls1.h:375
   TLS1_CK_ECDH_anon_WITH_AES_128_CBC_SHA : constant := 16#0300C018#;  --  openssl/tls1.h:376
   TLS1_CK_ECDH_anon_WITH_AES_256_CBC_SHA : constant := 16#0300C019#;  --  openssl/tls1.h:377

   TLS1_TXT_RSA_EXPORT1024_WITH_RC4_56_MD5 : aliased constant String := "EXP1024-RC4-MD5" & ASCII.NUL;  --  openssl/tls1.h:386
   TLS1_TXT_RSA_EXPORT1024_WITH_RC2_CBC_56_MD5 : aliased constant String := "EXP1024-RC2-CBC-MD5" & ASCII.NUL;  --  openssl/tls1.h:387
   TLS1_TXT_RSA_EXPORT1024_WITH_DES_CBC_SHA : aliased constant String := "EXP1024-DES-CBC-SHA" & ASCII.NUL;  --  openssl/tls1.h:388
   TLS1_TXT_DHE_DSS_EXPORT1024_WITH_DES_CBC_SHA : aliased constant String := "EXP1024-DHE-DSS-DES-CBC-SHA" & ASCII.NUL;  --  openssl/tls1.h:389
   TLS1_TXT_RSA_EXPORT1024_WITH_RC4_56_SHA : aliased constant String := "EXP1024-RC4-SHA" & ASCII.NUL;  --  openssl/tls1.h:390
   TLS1_TXT_DHE_DSS_EXPORT1024_WITH_RC4_56_SHA : aliased constant String := "EXP1024-DHE-DSS-RC4-SHA" & ASCII.NUL;  --  openssl/tls1.h:391
   TLS1_TXT_DHE_DSS_WITH_RC4_128_SHA : aliased constant String := "DHE-DSS-RC4-SHA" & ASCII.NUL;  --  openssl/tls1.h:392

   TLS1_TXT_RSA_WITH_AES_128_SHA : aliased constant String := "AES128-SHA" & ASCII.NUL;  --  openssl/tls1.h:395
   TLS1_TXT_DH_DSS_WITH_AES_128_SHA : aliased constant String := "DH-DSS-AES128-SHA" & ASCII.NUL;  --  openssl/tls1.h:396
   TLS1_TXT_DH_RSA_WITH_AES_128_SHA : aliased constant String := "DH-RSA-AES128-SHA" & ASCII.NUL;  --  openssl/tls1.h:397
   TLS1_TXT_DHE_DSS_WITH_AES_128_SHA : aliased constant String := "DHE-DSS-AES128-SHA" & ASCII.NUL;  --  openssl/tls1.h:398
   TLS1_TXT_DHE_RSA_WITH_AES_128_SHA : aliased constant String := "DHE-RSA-AES128-SHA" & ASCII.NUL;  --  openssl/tls1.h:399
   TLS1_TXT_ADH_WITH_AES_128_SHA : aliased constant String := "ADH-AES128-SHA" & ASCII.NUL;  --  openssl/tls1.h:400

   TLS1_TXT_RSA_WITH_AES_256_SHA : aliased constant String := "AES256-SHA" & ASCII.NUL;  --  openssl/tls1.h:402
   TLS1_TXT_DH_DSS_WITH_AES_256_SHA : aliased constant String := "DH-DSS-AES256-SHA" & ASCII.NUL;  --  openssl/tls1.h:403
   TLS1_TXT_DH_RSA_WITH_AES_256_SHA : aliased constant String := "DH-RSA-AES256-SHA" & ASCII.NUL;  --  openssl/tls1.h:404
   TLS1_TXT_DHE_DSS_WITH_AES_256_SHA : aliased constant String := "DHE-DSS-AES256-SHA" & ASCII.NUL;  --  openssl/tls1.h:405
   TLS1_TXT_DHE_RSA_WITH_AES_256_SHA : aliased constant String := "DHE-RSA-AES256-SHA" & ASCII.NUL;  --  openssl/tls1.h:406
   TLS1_TXT_ADH_WITH_AES_256_SHA : aliased constant String := "ADH-AES256-SHA" & ASCII.NUL;  --  openssl/tls1.h:407

   TLS1_TXT_ECDH_ECDSA_WITH_NULL_SHA : aliased constant String := "ECDH-ECDSA-NULL-SHA" & ASCII.NUL;  --  openssl/tls1.h:410
   TLS1_TXT_ECDH_ECDSA_WITH_RC4_128_SHA : aliased constant String := "ECDH-ECDSA-RC4-SHA" & ASCII.NUL;  --  openssl/tls1.h:411
   TLS1_TXT_ECDH_ECDSA_WITH_DES_192_CBC3_SHA : aliased constant String := "ECDH-ECDSA-DES-CBC3-SHA" & ASCII.NUL;  --  openssl/tls1.h:412
   TLS1_TXT_ECDH_ECDSA_WITH_AES_128_CBC_SHA : aliased constant String := "ECDH-ECDSA-AES128-SHA" & ASCII.NUL;  --  openssl/tls1.h:413
   TLS1_TXT_ECDH_ECDSA_WITH_AES_256_CBC_SHA : aliased constant String := "ECDH-ECDSA-AES256-SHA" & ASCII.NUL;  --  openssl/tls1.h:414

   TLS1_TXT_ECDHE_ECDSA_WITH_NULL_SHA : aliased constant String := "ECDHE-ECDSA-NULL-SHA" & ASCII.NUL;  --  openssl/tls1.h:416
   TLS1_TXT_ECDHE_ECDSA_WITH_RC4_128_SHA : aliased constant String := "ECDHE-ECDSA-RC4-SHA" & ASCII.NUL;  --  openssl/tls1.h:417
   TLS1_TXT_ECDHE_ECDSA_WITH_DES_192_CBC3_SHA : aliased constant String := "ECDHE-ECDSA-DES-CBC3-SHA" & ASCII.NUL;  --  openssl/tls1.h:418
   TLS1_TXT_ECDHE_ECDSA_WITH_AES_128_CBC_SHA : aliased constant String := "ECDHE-ECDSA-AES128-SHA" & ASCII.NUL;  --  openssl/tls1.h:419
   TLS1_TXT_ECDHE_ECDSA_WITH_AES_256_CBC_SHA : aliased constant String := "ECDHE-ECDSA-AES256-SHA" & ASCII.NUL;  --  openssl/tls1.h:420

   TLS1_TXT_ECDH_RSA_WITH_NULL_SHA : aliased constant String := "ECDH-RSA-NULL-SHA" & ASCII.NUL;  --  openssl/tls1.h:422
   TLS1_TXT_ECDH_RSA_WITH_RC4_128_SHA : aliased constant String := "ECDH-RSA-RC4-SHA" & ASCII.NUL;  --  openssl/tls1.h:423
   TLS1_TXT_ECDH_RSA_WITH_DES_192_CBC3_SHA : aliased constant String := "ECDH-RSA-DES-CBC3-SHA" & ASCII.NUL;  --  openssl/tls1.h:424
   TLS1_TXT_ECDH_RSA_WITH_AES_128_CBC_SHA : aliased constant String := "ECDH-RSA-AES128-SHA" & ASCII.NUL;  --  openssl/tls1.h:425
   TLS1_TXT_ECDH_RSA_WITH_AES_256_CBC_SHA : aliased constant String := "ECDH-RSA-AES256-SHA" & ASCII.NUL;  --  openssl/tls1.h:426

   TLS1_TXT_ECDHE_RSA_WITH_NULL_SHA : aliased constant String := "ECDHE-RSA-NULL-SHA" & ASCII.NUL;  --  openssl/tls1.h:428
   TLS1_TXT_ECDHE_RSA_WITH_RC4_128_SHA : aliased constant String := "ECDHE-RSA-RC4-SHA" & ASCII.NUL;  --  openssl/tls1.h:429
   TLS1_TXT_ECDHE_RSA_WITH_DES_192_CBC3_SHA : aliased constant String := "ECDHE-RSA-DES-CBC3-SHA" & ASCII.NUL;  --  openssl/tls1.h:430
   TLS1_TXT_ECDHE_RSA_WITH_AES_128_CBC_SHA : aliased constant String := "ECDHE-RSA-AES128-SHA" & ASCII.NUL;  --  openssl/tls1.h:431
   TLS1_TXT_ECDHE_RSA_WITH_AES_256_CBC_SHA : aliased constant String := "ECDHE-RSA-AES256-SHA" & ASCII.NUL;  --  openssl/tls1.h:432

   TLS1_TXT_ECDH_anon_WITH_NULL_SHA : aliased constant String := "AECDH-NULL-SHA" & ASCII.NUL;  --  openssl/tls1.h:434
   TLS1_TXT_ECDH_anon_WITH_RC4_128_SHA : aliased constant String := "AECDH-RC4-SHA" & ASCII.NUL;  --  openssl/tls1.h:435
   TLS1_TXT_ECDH_anon_WITH_DES_192_CBC3_SHA : aliased constant String := "AECDH-DES-CBC3-SHA" & ASCII.NUL;  --  openssl/tls1.h:436
   TLS1_TXT_ECDH_anon_WITH_AES_128_CBC_SHA : aliased constant String := "AECDH-AES128-SHA" & ASCII.NUL;  --  openssl/tls1.h:437
   TLS1_TXT_ECDH_anon_WITH_AES_256_CBC_SHA : aliased constant String := "AECDH-AES256-SHA" & ASCII.NUL;  --  openssl/tls1.h:438

   TLS1_TXT_PSK_WITH_RC4_128_SHA : aliased constant String := "PSK-RC4-SHA" & ASCII.NUL;  --  openssl/tls1.h:441
   TLS1_TXT_PSK_WITH_3DES_EDE_CBC_SHA : aliased constant String := "PSK-3DES-EDE-CBC-SHA" & ASCII.NUL;  --  openssl/tls1.h:442
   TLS1_TXT_PSK_WITH_AES_128_CBC_SHA : aliased constant String := "PSK-AES128-CBC-SHA" & ASCII.NUL;  --  openssl/tls1.h:443
   TLS1_TXT_PSK_WITH_AES_256_CBC_SHA : aliased constant String := "PSK-AES256-CBC-SHA" & ASCII.NUL;  --  openssl/tls1.h:444

   TLS1_TXT_RSA_WITH_CAMELLIA_128_CBC_SHA : aliased constant String := "CAMELLIA128-SHA" & ASCII.NUL;  --  openssl/tls1.h:447
   TLS1_TXT_DH_DSS_WITH_CAMELLIA_128_CBC_SHA : aliased constant String := "DH-DSS-CAMELLIA128-SHA" & ASCII.NUL;  --  openssl/tls1.h:448
   TLS1_TXT_DH_RSA_WITH_CAMELLIA_128_CBC_SHA : aliased constant String := "DH-RSA-CAMELLIA128-SHA" & ASCII.NUL;  --  openssl/tls1.h:449
   TLS1_TXT_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA : aliased constant String := "DHE-DSS-CAMELLIA128-SHA" & ASCII.NUL;  --  openssl/tls1.h:450
   TLS1_TXT_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA : aliased constant String := "DHE-RSA-CAMELLIA128-SHA" & ASCII.NUL;  --  openssl/tls1.h:451
   TLS1_TXT_ADH_WITH_CAMELLIA_128_CBC_SHA : aliased constant String := "ADH-CAMELLIA128-SHA" & ASCII.NUL;  --  openssl/tls1.h:452

   TLS1_TXT_RSA_WITH_CAMELLIA_256_CBC_SHA : aliased constant String := "CAMELLIA256-SHA" & ASCII.NUL;  --  openssl/tls1.h:454
   TLS1_TXT_DH_DSS_WITH_CAMELLIA_256_CBC_SHA : aliased constant String := "DH-DSS-CAMELLIA256-SHA" & ASCII.NUL;  --  openssl/tls1.h:455
   TLS1_TXT_DH_RSA_WITH_CAMELLIA_256_CBC_SHA : aliased constant String := "DH-RSA-CAMELLIA256-SHA" & ASCII.NUL;  --  openssl/tls1.h:456
   TLS1_TXT_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA : aliased constant String := "DHE-DSS-CAMELLIA256-SHA" & ASCII.NUL;  --  openssl/tls1.h:457
   TLS1_TXT_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA : aliased constant String := "DHE-RSA-CAMELLIA256-SHA" & ASCII.NUL;  --  openssl/tls1.h:458
   TLS1_TXT_ADH_WITH_CAMELLIA_256_CBC_SHA : aliased constant String := "ADH-CAMELLIA256-SHA" & ASCII.NUL;  --  openssl/tls1.h:459

   TLS1_TXT_RSA_WITH_SEED_SHA : aliased constant String := "SEED-SHA" & ASCII.NUL;  --  openssl/tls1.h:462
   TLS1_TXT_DH_DSS_WITH_SEED_SHA : aliased constant String := "DH-DSS-SEED-SHA" & ASCII.NUL;  --  openssl/tls1.h:463
   TLS1_TXT_DH_RSA_WITH_SEED_SHA : aliased constant String := "DH-RSA-SEED-SHA" & ASCII.NUL;  --  openssl/tls1.h:464
   TLS1_TXT_DHE_DSS_WITH_SEED_SHA : aliased constant String := "DHE-DSS-SEED-SHA" & ASCII.NUL;  --  openssl/tls1.h:465
   TLS1_TXT_DHE_RSA_WITH_SEED_SHA : aliased constant String := "DHE-RSA-SEED-SHA" & ASCII.NUL;  --  openssl/tls1.h:466
   TLS1_TXT_ADH_WITH_SEED_SHA : aliased constant String := "ADH-SEED-SHA" & ASCII.NUL;  --  openssl/tls1.h:467

   TLS_CT_RSA_SIGN : constant := 1;  --  openssl/tls1.h:470
   TLS_CT_DSS_SIGN : constant := 2;  --  openssl/tls1.h:471
   TLS_CT_RSA_FIXED_DH : constant := 3;  --  openssl/tls1.h:472
   TLS_CT_DSS_FIXED_DH : constant := 4;  --  openssl/tls1.h:473
   TLS_CT_ECDSA_SIGN : constant := 64;  --  openssl/tls1.h:474
   TLS_CT_RSA_FIXED_ECDH : constant := 65;  --  openssl/tls1.h:475
   TLS_CT_ECDSA_FIXED_ECDH : constant := 66;  --  openssl/tls1.h:476
   TLS_CT_GOST94_SIGN : constant := 21;  --  openssl/tls1.h:477
   TLS_CT_GOST01_SIGN : constant := 22;  --  openssl/tls1.h:478

   TLS_CT_NUMBER : constant := 9;  --  openssl/tls1.h:481

   TLS1_FINISH_MAC_LENGTH : constant := 12;  --  openssl/tls1.h:483

   TLS_MD_MAX_CONST_SIZE : constant := 20;  --  openssl/tls1.h:485
   TLS_MD_CLIENT_FINISH_CONST : aliased constant String := "client finished" & ASCII.NUL;  --  openssl/tls1.h:486
   TLS_MD_CLIENT_FINISH_CONST_SIZE : constant := 15;  --  openssl/tls1.h:487
   TLS_MD_SERVER_FINISH_CONST : aliased constant String := "server finished" & ASCII.NUL;  --  openssl/tls1.h:488
   TLS_MD_SERVER_FINISH_CONST_SIZE : constant := 15;  --  openssl/tls1.h:489

   TLS_MD_KEY_EXPANSION_CONST : aliased constant String := "key expansion" & ASCII.NUL;  --  openssl/tls1.h:492
   TLS_MD_KEY_EXPANSION_CONST_SIZE : constant := 13;  --  openssl/tls1.h:493
   TLS_MD_CLIENT_WRITE_KEY_CONST : aliased constant String := "client write key" & ASCII.NUL;  --  openssl/tls1.h:494
   TLS_MD_CLIENT_WRITE_KEY_CONST_SIZE : constant := 16;  --  openssl/tls1.h:495
   TLS_MD_SERVER_WRITE_KEY_CONST : aliased constant String := "server write key" & ASCII.NUL;  --  openssl/tls1.h:496
   TLS_MD_SERVER_WRITE_KEY_CONST_SIZE : constant := 16;  --  openssl/tls1.h:497
   TLS_MD_IV_BLOCK_CONST : aliased constant String := "IV block" & ASCII.NUL;  --  openssl/tls1.h:498
   TLS_MD_IV_BLOCK_CONST_SIZE : constant := 8;  --  openssl/tls1.h:499
   TLS_MD_MASTER_SECRET_CONST : aliased constant String := "master secret" & ASCII.NUL;  --  openssl/tls1.h:500
   TLS_MD_MASTER_SECRET_CONST_SIZE : constant := 13;  --  openssl/tls1.h:501

   function SSL_get_servername (s : access constant OpenSSL.Low_Level.ssl_h.ssl_st; c_type : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/tls1.h:223
   pragma Import (C, SSL_get_servername, "SSL_get_servername");

   function SSL_get_servername_type (s : access constant OpenSSL.Low_Level.ssl_h.ssl_st) return int;  -- openssl/tls1.h:224
   pragma Import (C, SSL_get_servername_type, "SSL_get_servername_type");

   type tls_session_ticket_ext_st is record
      length : aliased unsigned_short;  -- openssl/tls1.h:525
      data : System.Address;  -- openssl/tls1.h:526
   end record;
   pragma Convention (C_Pass_By_Copy, tls_session_ticket_ext_st);  -- openssl/tls1.h:523

end OpenSSL.Low_Level.tls1_h;
