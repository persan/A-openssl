with Interfaces.C; use Interfaces.C;
--  with stddef_h;
limited with OpenSSL.Low_Level.ssl_h;
--  limited --  with OpenSSL.Low_Level.ossl_typ_h;
limited with OpenSSL.Low_Level.x509_h;
limited with OpenSSL.Low_Level.bio_h;
with System;

package OpenSSL.Low_Level.ssl3_h is


   SSL3_CK_SCSV : constant := 16#030000FF#;  --  openssl/ssl3.h:132

   SSL3_CK_RSA_NULL_MD5 : constant := 16#03000001#;  --  openssl/ssl3.h:134
   SSL3_CK_RSA_NULL_SHA : constant := 16#03000002#;  --  openssl/ssl3.h:135
   SSL3_CK_RSA_RC4_40_MD5 : constant := 16#03000003#;  --  openssl/ssl3.h:136
   SSL3_CK_RSA_RC4_128_MD5 : constant := 16#03000004#;  --  openssl/ssl3.h:137
   SSL3_CK_RSA_RC4_128_SHA : constant := 16#03000005#;  --  openssl/ssl3.h:138
   SSL3_CK_RSA_RC2_40_MD5 : constant := 16#03000006#;  --  openssl/ssl3.h:139
   SSL3_CK_RSA_IDEA_128_SHA : constant := 16#03000007#;  --  openssl/ssl3.h:140
   SSL3_CK_RSA_DES_40_CBC_SHA : constant := 16#03000008#;  --  openssl/ssl3.h:141
   SSL3_CK_RSA_DES_64_CBC_SHA : constant := 16#03000009#;  --  openssl/ssl3.h:142
   SSL3_CK_RSA_DES_192_CBC3_SHA : constant := 16#0300000A#;  --  openssl/ssl3.h:143

   SSL3_CK_DH_DSS_DES_40_CBC_SHA : constant := 16#0300000B#;  --  openssl/ssl3.h:145
   SSL3_CK_DH_DSS_DES_64_CBC_SHA : constant := 16#0300000C#;  --  openssl/ssl3.h:146
   SSL3_CK_DH_DSS_DES_192_CBC3_SHA : constant := 16#0300000D#;  --  openssl/ssl3.h:147
   SSL3_CK_DH_RSA_DES_40_CBC_SHA : constant := 16#0300000E#;  --  openssl/ssl3.h:148
   SSL3_CK_DH_RSA_DES_64_CBC_SHA : constant := 16#0300000F#;  --  openssl/ssl3.h:149
   SSL3_CK_DH_RSA_DES_192_CBC3_SHA : constant := 16#03000010#;  --  openssl/ssl3.h:150

   SSL3_CK_EDH_DSS_DES_40_CBC_SHA : constant := 16#03000011#;  --  openssl/ssl3.h:152
   SSL3_CK_EDH_DSS_DES_64_CBC_SHA : constant := 16#03000012#;  --  openssl/ssl3.h:153
   SSL3_CK_EDH_DSS_DES_192_CBC3_SHA : constant := 16#03000013#;  --  openssl/ssl3.h:154
   SSL3_CK_EDH_RSA_DES_40_CBC_SHA : constant := 16#03000014#;  --  openssl/ssl3.h:155
   SSL3_CK_EDH_RSA_DES_64_CBC_SHA : constant := 16#03000015#;  --  openssl/ssl3.h:156
   SSL3_CK_EDH_RSA_DES_192_CBC3_SHA : constant := 16#03000016#;  --  openssl/ssl3.h:157

   SSL3_CK_ADH_RC4_40_MD5 : constant := 16#03000017#;  --  openssl/ssl3.h:159
   SSL3_CK_ADH_RC4_128_MD5 : constant := 16#03000018#;  --  openssl/ssl3.h:160
   SSL3_CK_ADH_DES_40_CBC_SHA : constant := 16#03000019#;  --  openssl/ssl3.h:161
   SSL3_CK_ADH_DES_64_CBC_SHA : constant := 16#0300001A#;  --  openssl/ssl3.h:162
   SSL3_CK_ADH_DES_192_CBC_SHA : constant := 16#0300001B#;  --  openssl/ssl3.h:163

   SSL3_CK_KRB5_DES_64_CBC_SHA : constant := 16#0300001E#;  --  openssl/ssl3.h:177
   SSL3_CK_KRB5_DES_192_CBC3_SHA : constant := 16#0300001F#;  --  openssl/ssl3.h:178
   SSL3_CK_KRB5_RC4_128_SHA : constant := 16#03000020#;  --  openssl/ssl3.h:179
   SSL3_CK_KRB5_IDEA_128_CBC_SHA : constant := 16#03000021#;  --  openssl/ssl3.h:180
   SSL3_CK_KRB5_DES_64_CBC_MD5 : constant := 16#03000022#;  --  openssl/ssl3.h:181
   SSL3_CK_KRB5_DES_192_CBC3_MD5 : constant := 16#03000023#;  --  openssl/ssl3.h:182
   SSL3_CK_KRB5_RC4_128_MD5 : constant := 16#03000024#;  --  openssl/ssl3.h:183
   SSL3_CK_KRB5_IDEA_128_CBC_MD5 : constant := 16#03000025#;  --  openssl/ssl3.h:184

   SSL3_CK_KRB5_DES_40_CBC_SHA : constant := 16#03000026#;  --  openssl/ssl3.h:186
   SSL3_CK_KRB5_RC2_40_CBC_SHA : constant := 16#03000027#;  --  openssl/ssl3.h:187
   SSL3_CK_KRB5_RC4_40_SHA : constant := 16#03000028#;  --  openssl/ssl3.h:188
   SSL3_CK_KRB5_DES_40_CBC_MD5 : constant := 16#03000029#;  --  openssl/ssl3.h:189
   SSL3_CK_KRB5_RC2_40_CBC_MD5 : constant := 16#0300002A#;  --  openssl/ssl3.h:190
   SSL3_CK_KRB5_RC4_40_MD5 : constant := 16#0300002B#;  --  openssl/ssl3.h:191

   SSL3_TXT_RSA_NULL_MD5 : aliased constant String := "NULL-MD5" & ASCII.NUL;  --  openssl/ssl3.h:193
   SSL3_TXT_RSA_NULL_SHA : aliased constant String := "NULL-SHA" & ASCII.NUL;  --  openssl/ssl3.h:194
   SSL3_TXT_RSA_RC4_40_MD5 : aliased constant String := "EXP-RC4-MD5" & ASCII.NUL;  --  openssl/ssl3.h:195
   SSL3_TXT_RSA_RC4_128_MD5 : aliased constant String := "RC4-MD5" & ASCII.NUL;  --  openssl/ssl3.h:196
   SSL3_TXT_RSA_RC4_128_SHA : aliased constant String := "RC4-SHA" & ASCII.NUL;  --  openssl/ssl3.h:197
   SSL3_TXT_RSA_RC2_40_MD5 : aliased constant String := "EXP-RC2-CBC-MD5" & ASCII.NUL;  --  openssl/ssl3.h:198
   SSL3_TXT_RSA_IDEA_128_SHA : aliased constant String := "IDEA-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:199
   SSL3_TXT_RSA_DES_40_CBC_SHA : aliased constant String := "EXP-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:200
   SSL3_TXT_RSA_DES_64_CBC_SHA : aliased constant String := "DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:201
   SSL3_TXT_RSA_DES_192_CBC3_SHA : aliased constant String := "DES-CBC3-SHA" & ASCII.NUL;  --  openssl/ssl3.h:202

   SSL3_TXT_DH_DSS_DES_40_CBC_SHA : aliased constant String := "EXP-DH-DSS-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:204
   SSL3_TXT_DH_DSS_DES_64_CBC_SHA : aliased constant String := "DH-DSS-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:205
   SSL3_TXT_DH_DSS_DES_192_CBC3_SHA : aliased constant String := "DH-DSS-DES-CBC3-SHA" & ASCII.NUL;  --  openssl/ssl3.h:206
   SSL3_TXT_DH_RSA_DES_40_CBC_SHA : aliased constant String := "EXP-DH-RSA-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:207
   SSL3_TXT_DH_RSA_DES_64_CBC_SHA : aliased constant String := "DH-RSA-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:208
   SSL3_TXT_DH_RSA_DES_192_CBC3_SHA : aliased constant String := "DH-RSA-DES-CBC3-SHA" & ASCII.NUL;  --  openssl/ssl3.h:209

   SSL3_TXT_EDH_DSS_DES_40_CBC_SHA : aliased constant String := "EXP-EDH-DSS-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:211
   SSL3_TXT_EDH_DSS_DES_64_CBC_SHA : aliased constant String := "EDH-DSS-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:212
   SSL3_TXT_EDH_DSS_DES_192_CBC3_SHA : aliased constant String := "EDH-DSS-DES-CBC3-SHA" & ASCII.NUL;  --  openssl/ssl3.h:213
   SSL3_TXT_EDH_RSA_DES_40_CBC_SHA : aliased constant String := "EXP-EDH-RSA-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:214
   SSL3_TXT_EDH_RSA_DES_64_CBC_SHA : aliased constant String := "EDH-RSA-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:215
   SSL3_TXT_EDH_RSA_DES_192_CBC3_SHA : aliased constant String := "EDH-RSA-DES-CBC3-SHA" & ASCII.NUL;  --  openssl/ssl3.h:216

   SSL3_TXT_ADH_RC4_40_MD5 : aliased constant String := "EXP-ADH-RC4-MD5" & ASCII.NUL;  --  openssl/ssl3.h:218
   SSL3_TXT_ADH_RC4_128_MD5 : aliased constant String := "ADH-RC4-MD5" & ASCII.NUL;  --  openssl/ssl3.h:219
   SSL3_TXT_ADH_DES_40_CBC_SHA : aliased constant String := "EXP-ADH-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:220
   SSL3_TXT_ADH_DES_64_CBC_SHA : aliased constant String := "ADH-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:221
   SSL3_TXT_ADH_DES_192_CBC_SHA : aliased constant String := "ADH-DES-CBC3-SHA" & ASCII.NUL;  --  openssl/ssl3.h:222

   SSL3_TXT_KRB5_DES_64_CBC_SHA : aliased constant String := "KRB5-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:230
   SSL3_TXT_KRB5_DES_192_CBC3_SHA : aliased constant String := "KRB5-DES-CBC3-SHA" & ASCII.NUL;  --  openssl/ssl3.h:231
   SSL3_TXT_KRB5_RC4_128_SHA : aliased constant String := "KRB5-RC4-SHA" & ASCII.NUL;  --  openssl/ssl3.h:232
   SSL3_TXT_KRB5_IDEA_128_CBC_SHA : aliased constant String := "KRB5-IDEA-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:233
   SSL3_TXT_KRB5_DES_64_CBC_MD5 : aliased constant String := "KRB5-DES-CBC-MD5" & ASCII.NUL;  --  openssl/ssl3.h:234
   SSL3_TXT_KRB5_DES_192_CBC3_MD5 : aliased constant String := "KRB5-DES-CBC3-MD5" & ASCII.NUL;  --  openssl/ssl3.h:235
   SSL3_TXT_KRB5_RC4_128_MD5 : aliased constant String := "KRB5-RC4-MD5" & ASCII.NUL;  --  openssl/ssl3.h:236
   SSL3_TXT_KRB5_IDEA_128_CBC_MD5 : aliased constant String := "KRB5-IDEA-CBC-MD5" & ASCII.NUL;  --  openssl/ssl3.h:237

   SSL3_TXT_KRB5_DES_40_CBC_SHA : aliased constant String := "EXP-KRB5-DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:239
   SSL3_TXT_KRB5_RC2_40_CBC_SHA : aliased constant String := "EXP-KRB5-RC2-CBC-SHA" & ASCII.NUL;  --  openssl/ssl3.h:240
   SSL3_TXT_KRB5_RC4_40_SHA : aliased constant String := "EXP-KRB5-RC4-SHA" & ASCII.NUL;  --  openssl/ssl3.h:241
   SSL3_TXT_KRB5_DES_40_CBC_MD5 : aliased constant String := "EXP-KRB5-DES-CBC-MD5" & ASCII.NUL;  --  openssl/ssl3.h:242
   SSL3_TXT_KRB5_RC2_40_CBC_MD5 : aliased constant String := "EXP-KRB5-RC2-CBC-MD5" & ASCII.NUL;  --  openssl/ssl3.h:243
   SSL3_TXT_KRB5_RC4_40_MD5 : aliased constant String := "EXP-KRB5-RC4-MD5" & ASCII.NUL;  --  openssl/ssl3.h:244

   SSL3_SSL_SESSION_ID_LENGTH : constant := 32;  --  openssl/ssl3.h:246
   SSL3_MAX_SSL_SESSION_ID_LENGTH : constant := 32;  --  openssl/ssl3.h:247

   SSL3_MASTER_SECRET_SIZE : constant := 48;  --  openssl/ssl3.h:249
   SSL3_RANDOM_SIZE : constant := 32;  --  openssl/ssl3.h:250
   SSL3_SESSION_ID_SIZE : constant := 32;  --  openssl/ssl3.h:251
   SSL3_RT_HEADER_LENGTH : constant := 5;  --  openssl/ssl3.h:252

   SSL3_ALIGN_PAYLOAD : constant := 8;  --  openssl/ssl3.h:261

   SSL3_RT_MAX_MD_SIZE : constant := 64;  --  openssl/ssl3.h:274

   SSL_RT_MAX_CIPHER_BLOCK_SIZE : constant := 16;  --  openssl/ssl3.h:279

   SSL3_RT_MAX_EXTRA : constant := (16384);  --  openssl/ssl3.h:281

   SSL3_RT_MAX_PLAIN_LENGTH : constant := 16384;  --  openssl/ssl3.h:284

   SSL3_RT_MAX_COMPRESSED_OVERHEAD : constant := 1024;  --  openssl/ssl3.h:286
   --  unsupported macro: SSL3_RT_MAX_ENCRYPTED_OVERHEAD (256 + SSL3_RT_MAX_MD_SIZE)
   --  unsupported macro: SSL3_RT_SEND_MAX_ENCRYPTED_OVERHEAD (SSL_RT_MAX_CIPHER_BLOCK_SIZE + SSL3_RT_MAX_MD_SIZE)
   --  unsupported macro: SSL3_RT_MAX_COMPRESSED_LENGTH (SSL3_RT_MAX_PLAIN_LENGTH+SSL3_RT_MAX_COMPRESSED_OVERHEAD)
   --  unsupported macro: SSL3_RT_MAX_ENCRYPTED_LENGTH (SSL3_RT_MAX_ENCRYPTED_OVERHEAD+SSL3_RT_MAX_COMPRESSED_LENGTH)
   --  unsupported macro: SSL3_RT_MAX_PACKET_SIZE (SSL3_RT_MAX_ENCRYPTED_LENGTH+SSL3_RT_HEADER_LENGTH)
   --  unsupported macro: SSL3_MD_CLIENT_FINISHED_CONST "\x43\x4C\x4E\x54"
   --  unsupported macro: SSL3_MD_SERVER_FINISHED_CONST "\x53\x52\x56\x52"

   SSL3_VERSION : constant := 16#0300#;  --  openssl/ssl3.h:317
   SSL3_VERSION_MAJOR : constant := 16#03#;  --  openssl/ssl3.h:318
   SSL3_VERSION_MINOR : constant := 16#00#;  --  openssl/ssl3.h:319

   SSL3_RT_CHANGE_CIPHER_SPEC : constant := 20;  --  openssl/ssl3.h:321
   SSL3_RT_ALERT : constant := 21;  --  openssl/ssl3.h:322
   SSL3_RT_HANDSHAKE : constant := 22;  --  openssl/ssl3.h:323
   SSL3_RT_APPLICATION_DATA : constant := 23;  --  openssl/ssl3.h:324

   SSL3_AL_WARNING : constant := 1;  --  openssl/ssl3.h:326
   SSL3_AL_FATAL : constant := 2;  --  openssl/ssl3.h:327

   SSL3_AD_CLOSE_NOTIFY : constant := 0;  --  openssl/ssl3.h:329
   SSL3_AD_UNEXPECTED_MESSAGE : constant := 10;  --  openssl/ssl3.h:330
   SSL3_AD_BAD_RECORD_MAC : constant := 20;  --  openssl/ssl3.h:331
   SSL3_AD_DECOMPRESSION_FAILURE : constant := 30;  --  openssl/ssl3.h:332
   SSL3_AD_HANDSHAKE_FAILURE : constant := 40;  --  openssl/ssl3.h:333
   SSL3_AD_NO_CERTIFICATE : constant := 41;  --  openssl/ssl3.h:334
   SSL3_AD_BAD_CERTIFICATE : constant := 42;  --  openssl/ssl3.h:335
   SSL3_AD_UNSUPPORTED_CERTIFICATE : constant := 43;  --  openssl/ssl3.h:336
   SSL3_AD_CERTIFICATE_REVOKED : constant := 44;  --  openssl/ssl3.h:337
   SSL3_AD_CERTIFICATE_EXPIRED : constant := 45;  --  openssl/ssl3.h:338
   SSL3_AD_CERTIFICATE_UNKNOWN : constant := 46;  --  openssl/ssl3.h:339
   SSL3_AD_ILLEGAL_PARAMETER : constant := 47;  --  openssl/ssl3.h:340

   SSL3_CT_RSA_SIGN : constant := 1;  --  openssl/ssl3.h:363
   SSL3_CT_DSS_SIGN : constant := 2;  --  openssl/ssl3.h:364
   SSL3_CT_RSA_FIXED_DH : constant := 3;  --  openssl/ssl3.h:365
   SSL3_CT_DSS_FIXED_DH : constant := 4;  --  openssl/ssl3.h:366
   SSL3_CT_RSA_EPHEMERAL_DH : constant := 5;  --  openssl/ssl3.h:367
   SSL3_CT_DSS_EPHEMERAL_DH : constant := 6;  --  openssl/ssl3.h:368
   SSL3_CT_FORTEZZA_DMS : constant := 20;  --  openssl/ssl3.h:369

   SSL3_CT_NUMBER : constant := 9;  --  openssl/ssl3.h:374

   SSL3_FLAGS_NO_RENEGOTIATE_CIPHERS : constant := 16#0001#;  --  openssl/ssl3.h:377
   SSL3_FLAGS_DELAY_CLIENT_FINISHED : constant := 16#0002#;  --  openssl/ssl3.h:378
   SSL3_FLAGS_POP_BUFFER : constant := 16#0004#;  --  openssl/ssl3.h:379
   TLS1_FLAGS_TLS_PADDING_BUG : constant := 16#0008#;  --  openssl/ssl3.h:380
   TLS1_FLAGS_SKIP_CERT_VERIFY : constant := 16#0010#;  --  openssl/ssl3.h:381
   --  unsupported macro: SSL3_ST_CW_FLUSH (0x100|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_CLNT_HELLO_A (0x110|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_CLNT_HELLO_B (0x111|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_SRVR_HELLO_A (0x120|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_SRVR_HELLO_B (0x121|SSL_ST_CONNECT)
   --  unsupported macro: DTLS1_ST_CR_HELLO_VERIFY_REQUEST_A (0x126|SSL_ST_CONNECT)
   --  unsupported macro: DTLS1_ST_CR_HELLO_VERIFY_REQUEST_B (0x127|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_CERT_A (0x130|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_CERT_B (0x131|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_KEY_EXCH_A (0x140|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_KEY_EXCH_B (0x141|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_CERT_REQ_A (0x150|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_CERT_REQ_B (0x151|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_SRVR_DONE_A (0x160|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_SRVR_DONE_B (0x161|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_CERT_A (0x170|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_CERT_B (0x171|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_CERT_C (0x172|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_CERT_D (0x173|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_KEY_EXCH_A (0x180|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_KEY_EXCH_B (0x181|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_CERT_VRFY_A (0x190|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_CERT_VRFY_B (0x191|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_CHANGE_A (0x1A0|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_CHANGE_B (0x1A1|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_FINISHED_A (0x1B0|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CW_FINISHED_B (0x1B1|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_CHANGE_A (0x1C0|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_CHANGE_B (0x1C1|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_FINISHED_A (0x1D0|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_FINISHED_B (0x1D1|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_SESSION_TICKET_A (0x1E0|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_SESSION_TICKET_B (0x1E1|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_CERT_STATUS_A (0x1F0|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_CR_CERT_STATUS_B (0x1F1|SSL_ST_CONNECT)
   --  unsupported macro: SSL3_ST_SW_FLUSH (0x100|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_CLNT_HELLO_A (0x110|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_CLNT_HELLO_B (0x111|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_CLNT_HELLO_C (0x112|SSL_ST_ACCEPT)
   --  unsupported macro: DTLS1_ST_SW_HELLO_VERIFY_REQUEST_A (0x113|SSL_ST_ACCEPT)
   --  unsupported macro: DTLS1_ST_SW_HELLO_VERIFY_REQUEST_B (0x114|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_HELLO_REQ_A (0x120|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_HELLO_REQ_B (0x121|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_HELLO_REQ_C (0x122|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_SRVR_HELLO_A (0x130|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_SRVR_HELLO_B (0x131|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_CERT_A (0x140|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_CERT_B (0x141|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_KEY_EXCH_A (0x150|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_KEY_EXCH_B (0x151|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_CERT_REQ_A (0x160|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_CERT_REQ_B (0x161|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_SRVR_DONE_A (0x170|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_SRVR_DONE_B (0x171|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_CERT_A (0x180|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_CERT_B (0x181|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_KEY_EXCH_A (0x190|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_KEY_EXCH_B (0x191|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_CERT_VRFY_A (0x1A0|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_CERT_VRFY_B (0x1A1|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_CHANGE_A (0x1B0|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_CHANGE_B (0x1B1|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_FINISHED_A (0x1C0|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SR_FINISHED_B (0x1C1|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_CHANGE_A (0x1D0|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_CHANGE_B (0x1D1|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_FINISHED_A (0x1E0|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_FINISHED_B (0x1E1|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_SESSION_TICKET_A (0x1F0|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_SESSION_TICKET_B (0x1F1|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_CERT_STATUS_A (0x200|SSL_ST_ACCEPT)
   --  unsupported macro: SSL3_ST_SW_CERT_STATUS_B (0x201|SSL_ST_ACCEPT)

   SSL3_MT_HELLO_REQUEST : constant := 0;  --  openssl/ssl3.h:603
   SSL3_MT_CLIENT_HELLO : constant := 1;  --  openssl/ssl3.h:604
   SSL3_MT_SERVER_HELLO : constant := 2;  --  openssl/ssl3.h:605
   SSL3_MT_NEWSESSION_TICKET : constant := 4;  --  openssl/ssl3.h:606
   SSL3_MT_CERTIFICATE : constant := 11;  --  openssl/ssl3.h:607
   SSL3_MT_SERVER_KEY_EXCHANGE : constant := 12;  --  openssl/ssl3.h:608
   SSL3_MT_CERTIFICATE_REQUEST : constant := 13;  --  openssl/ssl3.h:609
   SSL3_MT_SERVER_DONE : constant := 14;  --  openssl/ssl3.h:610
   SSL3_MT_CERTIFICATE_VERIFY : constant := 15;  --  openssl/ssl3.h:611
   SSL3_MT_CLIENT_KEY_EXCHANGE : constant := 16;  --  openssl/ssl3.h:612
   SSL3_MT_FINISHED : constant := 20;  --  openssl/ssl3.h:613
   SSL3_MT_CERTIFICATE_STATUS : constant := 22;  --  openssl/ssl3.h:614
   DTLS1_MT_HELLO_VERIFY_REQUEST : constant := 3;  --  openssl/ssl3.h:615

   SSL3_MT_CCS : constant := 1;  --  openssl/ssl3.h:618

   SSL3_CC_READ : constant := 16#01#;  --  openssl/ssl3.h:621
   SSL3_CC_WRITE : constant := 16#02#;  --  openssl/ssl3.h:622
   SSL3_CC_CLIENT : constant := 16#10#;  --  openssl/ssl3.h:623
   SSL3_CC_SERVER : constant := 16#20#;  --  openssl/ssl3.h:624
   --  unsupported macro: SSL3_CHANGE_CIPHER_CLIENT_WRITE (SSL3_CC_CLIENT|SSL3_CC_WRITE)
   --  unsupported macro: SSL3_CHANGE_CIPHER_SERVER_READ (SSL3_CC_SERVER|SSL3_CC_READ)
   --  unsupported macro: SSL3_CHANGE_CIPHER_CLIENT_READ (SSL3_CC_CLIENT|SSL3_CC_READ)
   --  unsupported macro: SSL3_CHANGE_CIPHER_SERVER_WRITE (SSL3_CC_SERVER|SSL3_CC_WRITE)

   type ssl3_record_st_seq_num_array is array (0 .. 7) of aliased unsigned_char;
   type ssl3_record_st is record
      c_type : aliased int;  -- openssl/ssl3.h:344
      length : aliased unsigned;  -- openssl/ssl3.h:345
      off : aliased unsigned;  -- openssl/ssl3.h:346
      data : access unsigned_char;  -- openssl/ssl3.h:347
      input : access unsigned_char;  -- openssl/ssl3.h:348
      comp : access unsigned_char;  -- openssl/ssl3.h:349
      epoch : aliased unsigned_long;  -- openssl/ssl3.h:350
      seq_num : aliased ssl3_record_st_seq_num_array;  -- openssl/ssl3.h:351
   end record;
   pragma Convention (C_Pass_By_Copy, ssl3_record_st);  -- openssl/ssl3.h:342

   subtype SSL3_RECORD is ssl3_record_st;

   type ssl3_buffer_st is record
      buf : access unsigned_char;  -- openssl/ssl3.h:356
      len : aliased size_t;  -- openssl/ssl3.h:358
      offset : aliased int;  -- openssl/ssl3.h:359
      left : aliased int;  -- openssl/ssl3.h:360
   end record;
   pragma Convention (C_Pass_By_Copy, ssl3_buffer_st);  -- openssl/ssl3.h:354

   subtype SSL3_BUFFER is ssl3_buffer_st;

   type ssl3_state_st_read_sequence_array is array (0 .. 7) of aliased unsigned_char;
   type ssl3_state_st_read_mac_secret_array is array (0 .. 63) of aliased unsigned_char;
   type ssl3_state_st_write_sequence_array is array (0 .. 7) of aliased unsigned_char;
   type ssl3_state_st_write_mac_secret_array is array (0 .. 63) of aliased unsigned_char;
   type ssl3_state_st_server_random_array is array (0 .. 31) of aliased unsigned_char;
   type ssl3_state_st_client_random_array is array (0 .. 31) of aliased unsigned_char;
   type ssl3_state_st_alert_fragment_array is array (0 .. 1) of aliased unsigned_char;
   type ssl3_state_st_handshake_fragment_array is array (0 .. 3) of aliased unsigned_char;
   type ssl3_state_st_send_alert_array is array (0 .. 1) of aliased unsigned_char;
   type ssl3_state_st_previous_client_finished_array is array (0 .. 63) of aliased unsigned_char;
   type ssl3_state_st_previous_server_finished_array is array (0 .. 63) of aliased unsigned_char;
   type ssl3_state_st;
   type ssl3_state_st_cert_verify_md_array is array (0 .. 127) of aliased unsigned_char;
   type ssl3_state_st_finish_md_array is array (0 .. 127) of aliased unsigned_char;
   type ssl3_state_st_peer_finish_md_array is array (0 .. 127) of aliased unsigned_char;
   subtype ssl3_state_st_ctype_array is Interfaces.C.char_array (0 .. 8);
   type anon_39 is record
      cert_verify_md : aliased ssl3_state_st_cert_verify_md_array;  -- openssl/ssl3.h:460
      finish_md : aliased ssl3_state_st_finish_md_array;  -- openssl/ssl3.h:463
      finish_md_len : aliased int;  -- openssl/ssl3.h:464
      peer_finish_md : aliased ssl3_state_st_peer_finish_md_array;  -- openssl/ssl3.h:465
      peer_finish_md_len : aliased int;  -- openssl/ssl3.h:466
      message_size : aliased unsigned_long;  -- openssl/ssl3.h:468
      message_type : aliased int;  -- openssl/ssl3.h:469
      new_cipher : access constant OpenSSL.Low_Level.ssl_h.SSL_CIPHER;  -- openssl/ssl3.h:472
      the_dh : access OpenSSL.Low_Level.dh_h.dh_st;  -- openssl/ssl3.h:474
      next_state : aliased int;  -- openssl/ssl3.h:479
      reuse_message : aliased int;  -- openssl/ssl3.h:481
      cert_req : aliased int;  -- openssl/ssl3.h:484
      ctype_num : aliased int;  -- openssl/ssl3.h:485
      ctype : aliased ssl3_state_st_ctype_array;  -- openssl/ssl3.h:486
      ca_names : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME;  -- openssl/ssl3.h:487
      use_rsa_tmp : aliased int;  -- openssl/ssl3.h:489
      key_block_length : aliased int;  -- openssl/ssl3.h:491
      key_block : access unsigned_char;  -- openssl/ssl3.h:492
      new_sym_enc : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/ssl3.h:494
      new_hash : access constant OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/ssl3.h:495
      new_mac_pkey_type : aliased int;  -- openssl/ssl3.h:496
      new_mac_secret_size : aliased int;  -- openssl/ssl3.h:497
      new_compression : access constant OpenSSL.Low_Level.ssl_h.SSL_COMP;  -- openssl/ssl3.h:499
      cert_request : aliased int;  -- openssl/ssl3.h:503
   end record;
   pragma Convention (C_Pass_By_Copy, anon_39);
   type ssl3_state_st is record
      flags : aliased long;  -- openssl/ssl3.h:385
      delay_buf_pop_ret : aliased int;  -- openssl/ssl3.h:386
      read_sequence : aliased ssl3_state_st_read_sequence_array;  -- openssl/ssl3.h:388
      read_mac_secret_size : aliased int;  -- openssl/ssl3.h:389
      read_mac_secret : aliased ssl3_state_st_read_mac_secret_array;  -- openssl/ssl3.h:390
      write_sequence : aliased ssl3_state_st_write_sequence_array;  -- openssl/ssl3.h:391
      write_mac_secret_size : aliased int;  -- openssl/ssl3.h:392
      write_mac_secret : aliased ssl3_state_st_write_mac_secret_array;  -- openssl/ssl3.h:393
      server_random : aliased ssl3_state_st_server_random_array;  -- openssl/ssl3.h:395
      client_random : aliased ssl3_state_st_client_random_array;  -- openssl/ssl3.h:396
      need_empty_fragments : aliased int;  -- openssl/ssl3.h:399
      empty_fragment_done : aliased int;  -- openssl/ssl3.h:400
      init_extra : aliased int;  -- openssl/ssl3.h:403
      rbuf : aliased SSL3_BUFFER;  -- openssl/ssl3.h:405
      wbuf : aliased SSL3_BUFFER;  -- openssl/ssl3.h:406
      rrec : aliased SSL3_RECORD;  -- openssl/ssl3.h:408
      wrec : aliased SSL3_RECORD;  -- openssl/ssl3.h:409
      alert_fragment : aliased ssl3_state_st_alert_fragment_array;  -- openssl/ssl3.h:413
      alert_fragment_len : aliased unsigned;  -- openssl/ssl3.h:414
      handshake_fragment : aliased ssl3_state_st_handshake_fragment_array;  -- openssl/ssl3.h:415
      handshake_fragment_len : aliased unsigned;  -- openssl/ssl3.h:416
      wnum : aliased unsigned;  -- openssl/ssl3.h:419
      wpend_tot : aliased int;  -- openssl/ssl3.h:420
      wpend_type : aliased int;  -- openssl/ssl3.h:421
      wpend_ret : aliased int;  -- openssl/ssl3.h:422
      wpend_buf : access unsigned_char;  -- openssl/ssl3.h:423
      handshake_buffer : access OpenSSL.Low_Level.bio_h.BIO;  -- openssl/ssl3.h:426
      handshake_dgst : System.Address;  -- openssl/ssl3.h:430
      change_cipher_spec : aliased int;  -- openssl/ssl3.h:433
      warn_alert : aliased int;  -- openssl/ssl3.h:435
      fatal_alert : aliased int;  -- openssl/ssl3.h:436
      alert_dispatch : aliased int;  -- openssl/ssl3.h:439
      send_alert : aliased ssl3_state_st_send_alert_array;  -- openssl/ssl3.h:440
      renegotiate : aliased int;  -- openssl/ssl3.h:444
      total_renegotiations : aliased int;  -- openssl/ssl3.h:445
      num_renegotiations : aliased int;  -- openssl/ssl3.h:446
      in_read_app_data : aliased int;  -- openssl/ssl3.h:448
      client_opaque_prf_input : System.Address;  -- openssl/ssl3.h:453
      client_opaque_prf_input_len : aliased size_t;  -- openssl/ssl3.h:454
      server_opaque_prf_input : System.Address;  -- openssl/ssl3.h:455
      server_opaque_prf_input_len : aliased size_t;  -- openssl/ssl3.h:456
      tmp : aliased anon_39;  -- openssl/ssl3.h:504
      previous_client_finished : aliased ssl3_state_st_previous_client_finished_array;  -- openssl/ssl3.h:507
      previous_client_finished_len : aliased unsigned_char;  -- openssl/ssl3.h:508
      previous_server_finished : aliased ssl3_state_st_previous_server_finished_array;  -- openssl/ssl3.h:509
      previous_server_finished_len : aliased unsigned_char;  -- openssl/ssl3.h:510
      send_connection_binding : aliased int;  -- openssl/ssl3.h:511
   end record;
   pragma Convention (C_Pass_By_Copy, ssl3_state_st);  -- openssl/ssl3.h:383

   subtype SSL3_STATE is ssl3_state_st;

end OpenSSL.Low_Level.ssl3_h;
