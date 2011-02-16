with Interfaces.C; use Interfaces.C;

package OpenSSL.Low_Level.ssl2_h is


   SSL2_VERSION : constant := 16#0002#;  --  openssl/ssl2.h:67
   SSL2_VERSION_MAJOR : constant := 16#00#;  --  openssl/ssl2.h:68
   SSL2_VERSION_MINOR : constant := 16#02#;  --  openssl/ssl2.h:69

   SSL2_MT_ERROR : constant := 0;  --  openssl/ssl2.h:74
   SSL2_MT_CLIENT_HELLO : constant := 1;  --  openssl/ssl2.h:75
   SSL2_MT_CLIENT_MASTER_KEY : constant := 2;  --  openssl/ssl2.h:76
   SSL2_MT_CLIENT_FINISHED : constant := 3;  --  openssl/ssl2.h:77
   SSL2_MT_SERVER_HELLO : constant := 4;  --  openssl/ssl2.h:78
   SSL2_MT_SERVER_VERIFY : constant := 5;  --  openssl/ssl2.h:79
   SSL2_MT_SERVER_FINISHED : constant := 6;  --  openssl/ssl2.h:80
   SSL2_MT_REQUEST_CERTIFICATE : constant := 7;  --  openssl/ssl2.h:81
   SSL2_MT_CLIENT_CERTIFICATE : constant := 8;  --  openssl/ssl2.h:82

   SSL2_PE_UNDEFINED_ERROR : constant := 16#0000#;  --  openssl/ssl2.h:85
   SSL2_PE_NO_CIPHER : constant := 16#0001#;  --  openssl/ssl2.h:86
   SSL2_PE_NO_CERTIFICATE : constant := 16#0002#;  --  openssl/ssl2.h:87
   SSL2_PE_BAD_CERTIFICATE : constant := 16#0004#;  --  openssl/ssl2.h:88
   SSL2_PE_UNSUPPORTED_CERTIFICATE_TYPE : constant := 16#0006#;  --  openssl/ssl2.h:89

   SSL2_CK_NULL_WITH_MD5 : constant := 16#02000000#;  --  openssl/ssl2.h:92
   SSL2_CK_RC4_128_WITH_MD5 : constant := 16#02010080#;  --  openssl/ssl2.h:93
   SSL2_CK_RC4_128_EXPORT40_WITH_MD5 : constant := 16#02020080#;  --  openssl/ssl2.h:94
   SSL2_CK_RC2_128_CBC_WITH_MD5 : constant := 16#02030080#;  --  openssl/ssl2.h:95
   SSL2_CK_RC2_128_CBC_EXPORT40_WITH_MD5 : constant := 16#02040080#;  --  openssl/ssl2.h:96
   SSL2_CK_IDEA_128_CBC_WITH_MD5 : constant := 16#02050080#;  --  openssl/ssl2.h:97
   SSL2_CK_DES_64_CBC_WITH_MD5 : constant := 16#02060040#;  --  openssl/ssl2.h:98
   SSL2_CK_DES_64_CBC_WITH_SHA : constant := 16#02060140#;  --  openssl/ssl2.h:99
   SSL2_CK_DES_192_EDE3_CBC_WITH_MD5 : constant := 16#020700c0#;  --  openssl/ssl2.h:100
   SSL2_CK_DES_192_EDE3_CBC_WITH_SHA : constant := 16#020701c0#;  --  openssl/ssl2.h:101
   SSL2_CK_RC4_64_WITH_MD5 : constant := 16#02080080#;  --  openssl/ssl2.h:102

   SSL2_CK_DES_64_CFB64_WITH_MD5_1 : constant := 16#02ff0800#;  --  openssl/ssl2.h:104
   SSL2_CK_NULL : constant := 16#02ff0810#;  --  openssl/ssl2.h:105

   SSL2_TXT_DES_64_CFB64_WITH_MD5_1 : aliased constant String := "DES-CFB-M1" & ASCII.NUL;  --  openssl/ssl2.h:107
   SSL2_TXT_NULL_WITH_MD5 : aliased constant String := "NULL-MD5" & ASCII.NUL;  --  openssl/ssl2.h:108
   SSL2_TXT_RC4_128_WITH_MD5 : aliased constant String := "RC4-MD5" & ASCII.NUL;  --  openssl/ssl2.h:109
   SSL2_TXT_RC4_128_EXPORT40_WITH_MD5 : aliased constant String := "EXP-RC4-MD5" & ASCII.NUL;  --  openssl/ssl2.h:110
   SSL2_TXT_RC2_128_CBC_WITH_MD5 : aliased constant String := "RC2-CBC-MD5" & ASCII.NUL;  --  openssl/ssl2.h:111
   SSL2_TXT_RC2_128_CBC_EXPORT40_WITH_MD5 : aliased constant String := "EXP-RC2-CBC-MD5" & ASCII.NUL;  --  openssl/ssl2.h:112
   SSL2_TXT_IDEA_128_CBC_WITH_MD5 : aliased constant String := "IDEA-CBC-MD5" & ASCII.NUL;  --  openssl/ssl2.h:113
   SSL2_TXT_DES_64_CBC_WITH_MD5 : aliased constant String := "DES-CBC-MD5" & ASCII.NUL;  --  openssl/ssl2.h:114
   SSL2_TXT_DES_64_CBC_WITH_SHA : aliased constant String := "DES-CBC-SHA" & ASCII.NUL;  --  openssl/ssl2.h:115
   SSL2_TXT_DES_192_EDE3_CBC_WITH_MD5 : aliased constant String := "DES-CBC3-MD5" & ASCII.NUL;  --  openssl/ssl2.h:116
   SSL2_TXT_DES_192_EDE3_CBC_WITH_SHA : aliased constant String := "DES-CBC3-SHA" & ASCII.NUL;  --  openssl/ssl2.h:117
   SSL2_TXT_RC4_64_WITH_MD5 : aliased constant String := "RC4-64-MD5" & ASCII.NUL;  --  openssl/ssl2.h:118

   SSL2_TXT_NULL : aliased constant String := "NULL" & ASCII.NUL;  --  openssl/ssl2.h:120

   SSL2_CF_5_BYTE_ENC : constant := 16#01#;  --  openssl/ssl2.h:123
   SSL2_CF_8_BYTE_ENC : constant := 16#02#;  --  openssl/ssl2.h:124

   SSL2_CT_X509_CERTIFICATE : constant := 16#01#;  --  openssl/ssl2.h:127

   SSL2_AT_MD5_WITH_RSA_ENCRYPTION : constant := 16#01#;  --  openssl/ssl2.h:130

   SSL2_MAX_SSL_SESSION_ID_LENGTH : constant := 32;  --  openssl/ssl2.h:132

   SSL2_MAX_MASTER_KEY_LENGTH_IN_BITS : constant := 256;  --  openssl/ssl2.h:135

   SSL2_MAX_RECORD_LENGTH_2_BYTE_HEADER : constant := 32767;  --  openssl/ssl2.h:139

   SSL2_MAX_RECORD_LENGTH_3_BYTE_HEADER : constant := 16383;  --  openssl/ssl2.h:141

   SSL2_CHALLENGE_LENGTH : constant := 16;  --  openssl/ssl2.h:143

   SSL2_MIN_CHALLENGE_LENGTH : constant := 16;  --  openssl/ssl2.h:145
   SSL2_MAX_CHALLENGE_LENGTH : constant := 32;  --  openssl/ssl2.h:146
   SSL2_CONNECTION_ID_LENGTH : constant := 16;  --  openssl/ssl2.h:147
   SSL2_MAX_CONNECTION_ID_LENGTH : constant := 16;  --  openssl/ssl2.h:148
   SSL2_SSL_SESSION_ID_LENGTH : constant := 16;  --  openssl/ssl2.h:149
   SSL2_MAX_CERT_CHALLENGE_LENGTH : constant := 32;  --  openssl/ssl2.h:150
   SSL2_MIN_CERT_CHALLENGE_LENGTH : constant := 16;  --  openssl/ssl2.h:151
   SSL2_MAX_KEY_MATERIAL_LENGTH : constant := 24;  --  openssl/ssl2.h:152
   --  unsupported macro: CERT char
   --  unsupported macro: SSL2_ST_SEND_CLIENT_HELLO_A (0x10|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_SEND_CLIENT_HELLO_B (0x11|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_GET_SERVER_HELLO_A (0x20|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_GET_SERVER_HELLO_B (0x21|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_SEND_CLIENT_MASTER_KEY_A (0x30|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_SEND_CLIENT_MASTER_KEY_B (0x31|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_SEND_CLIENT_FINISHED_A (0x40|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_SEND_CLIENT_FINISHED_B (0x41|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_SEND_CLIENT_CERTIFICATE_A (0x50|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_SEND_CLIENT_CERTIFICATE_B (0x51|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_SEND_CLIENT_CERTIFICATE_C (0x52|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_SEND_CLIENT_CERTIFICATE_D (0x53|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_GET_SERVER_VERIFY_A (0x60|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_GET_SERVER_VERIFY_B (0x61|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_GET_SERVER_FINISHED_A (0x70|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_GET_SERVER_FINISHED_B (0x71|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_CLIENT_START_ENCRYPTION (0x80|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_X509_GET_CLIENT_CERTIFICATE (0x90|SSL_ST_CONNECT)
   --  unsupported macro: SSL2_ST_GET_CLIENT_HELLO_A (0x10|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_GET_CLIENT_HELLO_B (0x11|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_GET_CLIENT_HELLO_C (0x12|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_SEND_SERVER_HELLO_A (0x20|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_SEND_SERVER_HELLO_B (0x21|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_GET_CLIENT_MASTER_KEY_A (0x30|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_GET_CLIENT_MASTER_KEY_B (0x31|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_SEND_SERVER_VERIFY_A (0x40|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_SEND_SERVER_VERIFY_B (0x41|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_SEND_SERVER_VERIFY_C (0x42|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_GET_CLIENT_FINISHED_A (0x50|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_GET_CLIENT_FINISHED_B (0x51|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_SEND_SERVER_FINISHED_A (0x60|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_SEND_SERVER_FINISHED_B (0x61|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_SEND_REQUEST_CERTIFICATE_A (0x70|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_SEND_REQUEST_CERTIFICATE_B (0x71|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_SEND_REQUEST_CERTIFICATE_C (0x72|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_SEND_REQUEST_CERTIFICATE_D (0x73|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_SERVER_START_ENCRYPTION (0x80|SSL_ST_ACCEPT)
   --  unsupported macro: SSL2_ST_X509_GET_SERVER_CERTIFICATE (0x90|SSL_ST_ACCEPT)

   type ssl2_state_st_challenge_array is array (0 .. 31) of aliased unsigned_char;
   type ssl2_state_st_conn_id_array is array (0 .. 15) of aliased unsigned_char;
   type ssl2_state_st_key_material_array is array (0 .. 47) of aliased unsigned_char;
   type ssl2_state_st;
   type ssl2_state_st_ccl_array is array (0 .. 31) of aliased unsigned_char;
   type anon_38 is record
      conn_id_length : aliased unsigned;  -- openssl/ssl2.h:208
      cert_type : aliased unsigned;  -- openssl/ssl2.h:209
      cert_length : aliased unsigned;  -- openssl/ssl2.h:210
      csl : aliased unsigned;  -- openssl/ssl2.h:211
      clear : aliased unsigned;  -- openssl/ssl2.h:212
      enc : aliased unsigned;  -- openssl/ssl2.h:213
      ccl : aliased ssl2_state_st_ccl_array;  -- openssl/ssl2.h:214
      cipher_spec_length : aliased unsigned;  -- openssl/ssl2.h:215
      session_id_length : aliased unsigned;  -- openssl/ssl2.h:216
      clen : aliased unsigned;  -- openssl/ssl2.h:217
      rlen : aliased unsigned;  -- openssl/ssl2.h:218
   end record;
   pragma Convention (C_Pass_By_Copy, anon_38);
   type ssl2_state_st is record
      three_byte_header : aliased int;  -- openssl/ssl2.h:160
      clear_text : aliased int;  -- openssl/ssl2.h:161
      escape : aliased int;  -- openssl/ssl2.h:162
      ssl2_rollback : aliased int;  -- openssl/ssl2.h:163
      wnum : aliased unsigned;  -- openssl/ssl2.h:167
      wpend_tot : aliased int;  -- openssl/ssl2.h:168
      wpend_buf : access unsigned_char;  -- openssl/ssl2.h:169
      wpend_off : aliased int;  -- openssl/ssl2.h:171
      wpend_len : aliased int;  -- openssl/ssl2.h:172
      wpend_ret : aliased int;  -- openssl/ssl2.h:173
      rbuf_left : aliased int;  -- openssl/ssl2.h:176
      rbuf_offs : aliased int;  -- openssl/ssl2.h:177
      rbuf : access unsigned_char;  -- openssl/ssl2.h:178
      wbuf : access unsigned_char;  -- openssl/ssl2.h:179
      write_ptr : access unsigned_char;  -- openssl/ssl2.h:181
      padding : aliased unsigned;  -- openssl/ssl2.h:184
      rlength : aliased unsigned;  -- openssl/ssl2.h:185
      ract_data_length : aliased int;  -- openssl/ssl2.h:186
      wlength : aliased unsigned;  -- openssl/ssl2.h:187
      wact_data_length : aliased int;  -- openssl/ssl2.h:188
      ract_data : access unsigned_char;  -- openssl/ssl2.h:189
      wact_data : access unsigned_char;  -- openssl/ssl2.h:190
      mac_data : access unsigned_char;  -- openssl/ssl2.h:191
      read_key : access unsigned_char;  -- openssl/ssl2.h:193
      write_key : access unsigned_char;  -- openssl/ssl2.h:194
      challenge_length : aliased unsigned;  -- openssl/ssl2.h:197
      challenge : aliased ssl2_state_st_challenge_array;  -- openssl/ssl2.h:198
      conn_id_length : aliased unsigned;  -- openssl/ssl2.h:199
      conn_id : aliased ssl2_state_st_conn_id_array;  -- openssl/ssl2.h:200
      key_material_length : aliased unsigned;  -- openssl/ssl2.h:201
      key_material : aliased ssl2_state_st_key_material_array;  -- openssl/ssl2.h:202
      read_sequence : aliased unsigned_long;  -- openssl/ssl2.h:204
      write_sequence : aliased unsigned_long;  -- openssl/ssl2.h:205
      tmp : aliased anon_38;  -- openssl/ssl2.h:219
   end record;
   pragma Convention (C_Pass_By_Copy, ssl2_state_st);  -- openssl/ssl2.h:158

   subtype SSL2_STATE is ssl2_state_st;

end OpenSSL.Low_Level.ssl2_h;
