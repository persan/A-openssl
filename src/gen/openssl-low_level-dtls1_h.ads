with Interfaces.C; use Interfaces.C;
with OpenSSL.Low_Level.comp_h;
with OpenSSL.Low_Level.ssl_h;
with OpenSSL.Low_Level.pqueue_h;
with OpenSSL.Low_Level.ssl3_h;
with OpenSSL.Low_Level.evp_h;
package OpenSSL.Low_Level.dtls1_h is

   package defs is

      DTLS1_VERSION : constant := 16#FEFF#;  --  openssl/dtls1.h:82
      DTLS1_BAD_VER : constant := 16#0100#;  --  openssl/dtls1.h:83

      DTLS1_COOKIE_LENGTH : constant := 256;  --  openssl/dtls1.h:91

      DTLS1_RT_HEADER_LENGTH : constant := 13;  --  openssl/dtls1.h:93

      DTLS1_HM_HEADER_LENGTH : constant := 12;  --  openssl/dtls1.h:95

      DTLS1_HM_BAD_FRAGMENT : constant := -2;  --  openssl/dtls1.h:97
      DTLS1_HM_FRAGMENT_RETRY : constant := -3;  --  openssl/dtls1.h:98

      DTLS1_CCS_HEADER_LENGTH : constant := 1;  --  openssl/dtls1.h:100

      DTLS1_AL_HEADER_LENGTH : constant := 2;  --  openssl/dtls1.h:105

      DTLS1_TMO_READ_COUNT : constant := 2;  --  openssl/dtls1.h:258
      DTLS1_TMO_WRITE_COUNT : constant := 2;  --  openssl/dtls1.h:259

      DTLS1_TMO_ALERT_COUNT : constant := 12;  --  openssl/dtls1.h:261
   end defs;
   type dtls1_bitmap_st_max_seq_num_array is array (0 .. 7) of aliased unsigned_char;
   type dtls1_bitmap_st is record
      map : aliased unsigned_long;  -- openssl/dtls1.h:111
      max_seq_num : aliased dtls1_bitmap_st_max_seq_num_array;  -- openssl/dtls1.h:113
   end record;
   pragma Convention (C_Pass_By_Copy, dtls1_bitmap_st);  -- openssl/dtls1.h:109

   subtype DTLS1_BITMAP is dtls1_bitmap_st;

   type dtls1_retransmit_state is record
      enc_write_ctx : access OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;  -- openssl/dtls1.h:120
      write_hash : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;  -- openssl/dtls1.h:121
      compress : access OpenSSL.Low_Level.comp_h.COMP_CTX;  -- openssl/dtls1.h:123
      session : access OpenSSL.Low_Level.ssl_h.SSL_SESSION;  -- openssl/dtls1.h:127
      epoch : aliased unsigned_short;  -- openssl/dtls1.h:128
   end record;
   pragma Convention (C_Pass_By_Copy, dtls1_retransmit_state);  -- openssl/dtls1.h:118

   type hm_header_st is record
      c_type : aliased unsigned_char;  -- openssl/dtls1.h:133
      msg_len : aliased unsigned_long;  -- openssl/dtls1.h:134
      seq : aliased unsigned_short;  -- openssl/dtls1.h:135
      frag_off : aliased unsigned_long;  -- openssl/dtls1.h:136
      frag_len : aliased unsigned_long;  -- openssl/dtls1.h:137
      is_ccs : aliased unsigned;  -- openssl/dtls1.h:138
      saved_retransmit_state : aliased dtls1_retransmit_state;  -- openssl/dtls1.h:139
   end record;
   pragma Convention (C_Pass_By_Copy, hm_header_st);  -- openssl/dtls1.h:131

   type ccs_header_st is record
      c_type : aliased unsigned_char;  -- openssl/dtls1.h:144
      seq : aliased unsigned_short;  -- openssl/dtls1.h:145
   end record;
   pragma Convention (C_Pass_By_Copy, ccs_header_st);  -- openssl/dtls1.h:142

   type dtls1_timeout_st is record
      read_timeouts : aliased unsigned;  -- openssl/dtls1.h:151
      write_timeouts : aliased unsigned;  -- openssl/dtls1.h:154
      num_alerts : aliased unsigned;  -- openssl/dtls1.h:157
   end record;
   pragma Convention (C_Pass_By_Copy, dtls1_timeout_st);  -- openssl/dtls1.h:148

   type record_pqueue_st is record
      epoch : aliased unsigned_short;  -- openssl/dtls1.h:162
      q : OpenSSL.Low_Level.pqueue_h.pqueue;  -- openssl/dtls1.h:163
   end record;
   pragma Convention (C_Pass_By_Copy, record_pqueue_st);  -- openssl/dtls1.h:160

   subtype record_pqueue is record_pqueue_st;

   type hm_fragment_st is record
      msg_header : aliased hm_header_st;  -- openssl/dtls1.h:168
      fragment : access unsigned_char;  -- openssl/dtls1.h:169
      reassembly : access unsigned_char;  -- openssl/dtls1.h:170
   end record;
   pragma Convention (C_Pass_By_Copy, hm_fragment_st);  -- openssl/dtls1.h:166

   subtype hm_fragment is hm_fragment_st;

   type dtls1_state_st_cookie_array is array (0 .. 255) of aliased unsigned_char;
   type dtls1_state_st_rcvd_cookie_array is array (0 .. 255) of aliased unsigned_char;
   type dtls1_state_st_last_write_sequence_array is array (0 .. 7) of aliased unsigned_char;
   type dtls1_state_st_alert_fragment_array is array (0 .. 1) of aliased unsigned_char;
   type dtls1_state_st_handshake_fragment_array is array (0 .. 11) of aliased unsigned_char;
   type dtls1_state_st is record
      send_cookie : aliased unsigned;  -- openssl/dtls1.h:175
      cookie : aliased dtls1_state_st_cookie_array;  -- openssl/dtls1.h:176
      rcvd_cookie : aliased dtls1_state_st_rcvd_cookie_array;  -- openssl/dtls1.h:177
      cookie_len : aliased unsigned;  -- openssl/dtls1.h:178
      r_epoch : aliased unsigned_short;  -- openssl/dtls1.h:185
      w_epoch : aliased unsigned_short;  -- openssl/dtls1.h:186
      bitmap : aliased DTLS1_BITMAP;  -- openssl/dtls1.h:189
      next_bitmap : aliased DTLS1_BITMAP;  -- openssl/dtls1.h:192
      handshake_write_seq : aliased unsigned_short;  -- openssl/dtls1.h:195
      next_handshake_write_seq : aliased unsigned_short;  -- openssl/dtls1.h:196
      handshake_read_seq : aliased unsigned_short;  -- openssl/dtls1.h:198
      last_write_sequence : aliased dtls1_state_st_last_write_sequence_array;  -- openssl/dtls1.h:201
      unprocessed_rcds : aliased record_pqueue;  -- openssl/dtls1.h:204
      processed_rcds : aliased record_pqueue;  -- openssl/dtls1.h:205
      buffered_messages : OpenSSL.Low_Level.pqueue_h.pqueue;  -- openssl/dtls1.h:208
      sent_messages : OpenSSL.Low_Level.pqueue_h.pqueue;  -- openssl/dtls1.h:211
      buffered_app_data : aliased record_pqueue;  -- openssl/dtls1.h:218
      mtu : aliased unsigned;  -- openssl/dtls1.h:220
      w_msg_hdr : aliased hm_header_st;  -- openssl/dtls1.h:222
      r_msg_hdr : aliased hm_header_st;  -- openssl/dtls1.h:223
      timeout : aliased dtls1_timeout_st;  -- openssl/dtls1.h:225
      next_timeout : aliased bits_time_h.timeval;  -- openssl/dtls1.h:228
      timeout_duration : aliased unsigned_short;  -- openssl/dtls1.h:231
      alert_fragment : aliased dtls1_state_st_alert_fragment_array;  -- openssl/dtls1.h:235
      alert_fragment_len : aliased unsigned;  -- openssl/dtls1.h:236
      handshake_fragment : aliased dtls1_state_st_handshake_fragment_array;  -- openssl/dtls1.h:237
      handshake_fragment_len : aliased unsigned;  -- openssl/dtls1.h:238
      retransmitting : aliased unsigned;  -- openssl/dtls1.h:240
      change_cipher_spec_ok : aliased unsigned;  -- openssl/dtls1.h:241
      listen : aliased unsigned;  -- openssl/dtls1.h:244
   end record;
   pragma Convention (C_Pass_By_Copy, dtls1_state_st);  -- openssl/dtls1.h:173

   subtype DTLS1_STATE is dtls1_state_st;

   type dtls1_record_data_st is record
      packet : access unsigned_char;  -- openssl/dtls1.h:250
      packet_length : aliased unsigned;  -- openssl/dtls1.h:251
      rbuf : aliased OpenSSL.Low_Level.ssl3_h.SSL3_BUFFER;  -- openssl/dtls1.h:252
      rrec : aliased OpenSSL.Low_Level.ssl3_h.SSL3_RECORD;  -- openssl/dtls1.h:253
   end record;
   pragma Convention (C_Pass_By_Copy, dtls1_record_data_st);  -- openssl/dtls1.h:248

   subtype DTLS1_RECORD_DATA is dtls1_record_data_st;

end OpenSSL.Low_Level.dtls1_h;
