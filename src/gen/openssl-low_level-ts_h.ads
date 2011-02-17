with Interfaces.C; use Interfaces.C;
with OpenSSL.Low_Level.asn1_h;
with OpenSSL.Low_Level.x509_h;
with OpenSSL.Low_Level.x509v3_h;
with OpenSSL.Low_Level.stack_h;
with OpenSSL.Low_Level.pkcs7_h;
with System;
with OpenSSL.Low_Level.bio_h;
with Interfaces.C.Strings;
with OpenSSL.Low_Level.conf_h;
package OpenSSL.Low_Level.ts_h is

   package defs is

      TS_STATUS_GRANTED                 : constant := 0;  --  openssl/ts.h:201
      TS_STATUS_GRANTED_WITH_MODS       : constant := 1;  --  openssl/ts.h:202
      TS_STATUS_REJECTION               : constant := 2;  --  openssl/ts.h:203
      TS_STATUS_WAITING                 : constant := 3;  --  openssl/ts.h:204
      TS_STATUS_REVOCATION_WARNING      : constant := 4;  --  openssl/ts.h:205
      TS_STATUS_REVOCATION_NOTIFICATION : constant := 5;  --  openssl/ts.h:206

      TS_INFO_BAD_ALG                   : constant := 0;  --  openssl/ts.h:210
      TS_INFO_BAD_REQUEST               : constant := 2;  --  openssl/ts.h:211
      TS_INFO_BAD_DATA_FORMAT           : constant := 5;  --  openssl/ts.h:212
      TS_INFO_TIME_NOT_AVAILABLE        : constant := 14;  --  openssl/ts.h:213
      TS_INFO_UNACCEPTED_POLICY         : constant := 15;  --  openssl/ts.h:214
      TS_INFO_UNACCEPTED_EXTENSION      : constant := 16;  --  openssl/ts.h:215
      TS_INFO_ADD_INFO_NOT_AVAILABLE    : constant := 17;  --  openssl/ts.h:216
      TS_INFO_SYSTEM_FAILURE            : constant := 25;  --  openssl/ts.h:217

      TS_TSA_NAME                       : constant := 16#01#;  --  openssl/ts.h:473

      TS_ORDERING                       : constant := 16#02#;  --  openssl/ts.h:476

      TS_ESS_CERT_ID_CHAIN              : constant := 16#04#;  --  openssl/ts.h:483

      TS_MAX_CLOCK_PRECISION_DIGITS     : constant := 6;  --  openssl/ts.h:570

      TS_VFY_SIGNATURE                  : constant := (2 ** 0);  --  openssl/ts.h:620

      TS_VFY_VERSION                    : constant := (2 ** 1);  --  openssl/ts.h:622

      TS_VFY_POLICY                     : constant := (2 ** 2);  --  openssl/ts.h:624

      TS_VFY_IMPRINT                    : constant := (2 ** 3);  --  openssl/ts.h:627

      TS_VFY_DATA                       : constant := (2 ** 4);  --  openssl/ts.h:631

      TS_VFY_NONCE                      : constant := (2 ** 5);  --  openssl/ts.h:633

      TS_VFY_SIGNER                     : constant := (2 ** 6);  --  openssl/ts.h:635

      TS_VFY_TSA_NAME                   : constant := (2 ** 7);  --  openssl/ts.h:637
      --  unsupported macro: TS_VFY_ALL_IMPRINT (TS_VFY_SIGNATURE | TS_VFY_VERSION | TS_VFY_POLICY | TS_VFY_IMPRINT | TS_VFY_NONCE | TS_VFY_SIGNER | TS_VFY_TSA_NAME)
      --  unsupported macro: TS_VFY_ALL_DATA (TS_VFY_SIGNATURE | TS_VFY_VERSION | TS_VFY_POLICY | TS_VFY_DATA | TS_VFY_NONCE | TS_VFY_SIGNER | TS_VFY_TSA_NAME)

      TS_F_D2I_TS_RESP                  : constant := 147;  --  openssl/ts.h:769
      TS_F_DEF_SERIAL_CB                : constant := 110;  --  openssl/ts.h:770
      TS_F_DEF_TIME_CB                  : constant := 111;  --  openssl/ts.h:771
      TS_F_ESS_ADD_SIGNING_CERT         : constant := 112;  --  openssl/ts.h:772
      TS_F_ESS_CERT_ID_NEW_INIT         : constant := 113;  --  openssl/ts.h:773
      TS_F_ESS_SIGNING_CERT_NEW_INIT    : constant := 114;  --  openssl/ts.h:774
      TS_F_INT_TS_RESP_VERIFY_TOKEN     : constant := 149;  --  openssl/ts.h:775
      TS_F_PKCS7_TO_TS_TST_INFO         : constant := 148;  --  openssl/ts.h:776
      TS_F_TS_ACCURACY_SET_MICROS       : constant := 115;  --  openssl/ts.h:777
      TS_F_TS_ACCURACY_SET_MILLIS       : constant := 116;  --  openssl/ts.h:778
      TS_F_TS_ACCURACY_SET_SECONDS      : constant := 117;  --  openssl/ts.h:779
      TS_F_TS_CHECK_IMPRINTS            : constant := 100;  --  openssl/ts.h:780
      TS_F_TS_CHECK_NONCES              : constant := 101;  --  openssl/ts.h:781
      TS_F_TS_CHECK_POLICY              : constant := 102;  --  openssl/ts.h:782
      TS_F_TS_CHECK_SIGNING_CERTS       : constant := 103;  --  openssl/ts.h:783
      TS_F_TS_CHECK_STATUS_INFO         : constant := 104;  --  openssl/ts.h:784
      TS_F_TS_COMPUTE_IMPRINT           : constant := 145;  --  openssl/ts.h:785
      TS_F_TS_CONF_SET_DEFAULT_ENGINE   : constant := 146;  --  openssl/ts.h:786
      TS_F_TS_GET_STATUS_TEXT           : constant := 105;  --  openssl/ts.h:787
      TS_F_TS_MSG_IMPRINT_SET_ALGO      : constant := 118;  --  openssl/ts.h:788
      TS_F_TS_REQ_SET_MSG_IMPRINT       : constant := 119;  --  openssl/ts.h:789
      TS_F_TS_REQ_SET_NONCE             : constant := 120;  --  openssl/ts.h:790
      TS_F_TS_REQ_SET_POLICY_ID         : constant := 121;  --  openssl/ts.h:791
      TS_F_TS_RESP_CREATE_RESPONSE      : constant := 122;  --  openssl/ts.h:792
      TS_F_TS_RESP_CREATE_TST_INFO      : constant := 123;  --  openssl/ts.h:793
      TS_F_TS_RESP_CTX_ADD_FAILURE_INFO : constant := 124;  --  openssl/ts.h:794
      TS_F_TS_RESP_CTX_ADD_MD           : constant := 125;  --  openssl/ts.h:795
      TS_F_TS_RESP_CTX_ADD_POLICY       : constant := 126;  --  openssl/ts.h:796
      TS_F_TS_RESP_CTX_NEW              : constant := 127;  --  openssl/ts.h:797
      TS_F_TS_RESP_CTX_SET_ACCURACY     : constant := 128;  --  openssl/ts.h:798
      TS_F_TS_RESP_CTX_SET_CERTS        : constant := 129;  --  openssl/ts.h:799
      TS_F_TS_RESP_CTX_SET_DEF_POLICY   : constant := 130;  --  openssl/ts.h:800
      TS_F_TS_RESP_CTX_SET_SIGNER_CERT  : constant := 131;  --  openssl/ts.h:801
      TS_F_TS_RESP_CTX_SET_STATUS_INFO  : constant := 132;  --  openssl/ts.h:802
      TS_F_TS_RESP_GET_POLICY           : constant := 133;  --  openssl/ts.h:803
      TS_F_TS_RESP_SET_GENTIME_WITH_PRECISION : constant := 134;  --  openssl/ts.h:804
      TS_F_TS_RESP_SET_STATUS_INFO      : constant := 135;  --  openssl/ts.h:805
      TS_F_TS_RESP_SET_TST_INFO         : constant := 150;  --  openssl/ts.h:806
      TS_F_TS_RESP_SIGN                 : constant := 136;  --  openssl/ts.h:807
      TS_F_TS_RESP_VERIFY_SIGNATURE     : constant := 106;  --  openssl/ts.h:808
      TS_F_TS_RESP_VERIFY_TOKEN         : constant := 107;  --  openssl/ts.h:809
      TS_F_TS_TST_INFO_SET_ACCURACY     : constant := 137;  --  openssl/ts.h:810
      TS_F_TS_TST_INFO_SET_MSG_IMPRINT  : constant := 138;  --  openssl/ts.h:811
      TS_F_TS_TST_INFO_SET_NONCE        : constant := 139;  --  openssl/ts.h:812
      TS_F_TS_TST_INFO_SET_POLICY_ID    : constant := 140;  --  openssl/ts.h:813
      TS_F_TS_TST_INFO_SET_SERIAL       : constant := 141;  --  openssl/ts.h:814
      TS_F_TS_TST_INFO_SET_TIME         : constant := 142;  --  openssl/ts.h:815
      TS_F_TS_TST_INFO_SET_TSA          : constant := 143;  --  openssl/ts.h:816
      TS_F_TS_VERIFY                    : constant := 108;  --  openssl/ts.h:817
      TS_F_TS_VERIFY_CERT               : constant := 109;  --  openssl/ts.h:818
      TS_F_TS_VERIFY_CTX_NEW            : constant := 144;  --  openssl/ts.h:819

      TS_R_BAD_PKCS7_TYPE               : constant := 132;  --  openssl/ts.h:822
      TS_R_BAD_TYPE                     : constant := 133;  --  openssl/ts.h:823
      TS_R_CERTIFICATE_VERIFY_ERROR     : constant := 100;  --  openssl/ts.h:824
      TS_R_COULD_NOT_SET_ENGINE         : constant := 127;  --  openssl/ts.h:825
      TS_R_COULD_NOT_SET_TIME           : constant := 115;  --  openssl/ts.h:826
      TS_R_D2I_TS_RESP_INT_FAILED       : constant := 128;  --  openssl/ts.h:827
      TS_R_DETACHED_CONTENT             : constant := 134;  --  openssl/ts.h:828
      TS_R_ESS_ADD_SIGNING_CERT_ERROR   : constant := 116;  --  openssl/ts.h:829
      TS_R_ESS_SIGNING_CERTIFICATE_ERROR : constant := 101;  --  openssl/ts.h:830
      TS_R_INVALID_NULL_POINTER         : constant := 102;  --  openssl/ts.h:831
      TS_R_INVALID_SIGNER_CERTIFICATE_PURPOSE : constant := 117;  --  openssl/ts.h:832
      TS_R_MESSAGE_IMPRINT_MISMATCH     : constant := 103;  --  openssl/ts.h:833
      TS_R_NONCE_MISMATCH               : constant := 104;  --  openssl/ts.h:834
      TS_R_NONCE_NOT_RETURNED           : constant := 105;  --  openssl/ts.h:835
      TS_R_NO_CONTENT                   : constant := 106;  --  openssl/ts.h:836
      TS_R_NO_TIME_STAMP_TOKEN          : constant := 107;  --  openssl/ts.h:837
      TS_R_PKCS7_ADD_SIGNATURE_ERROR    : constant := 118;  --  openssl/ts.h:838
      TS_R_PKCS7_ADD_SIGNED_ATTR_ERROR  : constant := 119;  --  openssl/ts.h:839
      TS_R_PKCS7_TO_TS_TST_INFO_FAILED  : constant := 129;  --  openssl/ts.h:840
      TS_R_POLICY_MISMATCH              : constant := 108;  --  openssl/ts.h:841
      TS_R_PRIVATE_KEY_DOES_NOT_MATCH_CERTIFICATE : constant := 120;  --  openssl/ts.h:842
      TS_R_RESPONSE_SETUP_ERROR         : constant := 121;  --  openssl/ts.h:843
      TS_R_SIGNATURE_FAILURE            : constant := 109;  --  openssl/ts.h:844
      TS_R_THERE_MUST_BE_ONE_SIGNER     : constant := 110;  --  openssl/ts.h:845
      TS_R_TIME_SYSCALL_ERROR           : constant := 122;  --  openssl/ts.h:846
      TS_R_TOKEN_NOT_PRESENT            : constant := 130;  --  openssl/ts.h:847
      TS_R_TOKEN_PRESENT                : constant := 131;  --  openssl/ts.h:848
      TS_R_TSA_NAME_MISMATCH            : constant := 111;  --  openssl/ts.h:849
      TS_R_TSA_UNTRUSTED                : constant := 112;  --  openssl/ts.h:850
      TS_R_TST_INFO_SETUP_ERROR         : constant := 123;  --  openssl/ts.h:851
      TS_R_TS_DATASIGN                  : constant := 124;  --  openssl/ts.h:852
      TS_R_UNACCEPTABLE_POLICY          : constant := 125;  --  openssl/ts.h:853
      TS_R_UNSUPPORTED_MD_ALGORITHM     : constant := 126;  --  openssl/ts.h:854
      TS_R_UNSUPPORTED_VERSION          : constant := 113;  --  openssl/ts.h:855
      TS_R_WRONG_CONTENT_TYPE           : constant := 114;  --  openssl/ts.h:856
   end defs;
   type TS_msg_imprint_st is record
      hash_algo  : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/ts.h:112
      hashed_msg : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:113
   end record;
   pragma Convention (C_Pass_By_Copy, TS_msg_imprint_st);  -- openssl/ts.h:110

   subtype TS_MSG_IMPRINT is TS_msg_imprint_st;

   type TS_req_st is record
      version     : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:130
      msg_imprint : access TS_MSG_IMPRINT;  -- openssl/ts.h:131
      policy_id   : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/ts.h:132
      nonce       : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:133
      cert_req    : aliased Interfaces.C.int;  -- openssl/ts.h:134
      extensions  : access OpenSSL.Low_Level.x509_h.stack_st_X509_EXTENSION;  -- openssl/ts.h:135
   end record;
   pragma Convention (C_Pass_By_Copy, TS_req_st);  -- openssl/ts.h:128

   subtype TS_REQ is TS_req_st;

   type TS_accuracy_st is record
      seconds : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:147
      millis  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:148
      micros  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:149
   end record;
   pragma Convention (C_Pass_By_Copy, TS_accuracy_st);  -- openssl/ts.h:145

   subtype TS_ACCURACY is TS_accuracy_st;

   type TS_tst_info_st is record
      version     : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:174
      policy_id   : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/ts.h:175
      msg_imprint : access TS_MSG_IMPRINT;  -- openssl/ts.h:176
      serial      : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:177
      time        : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:178
      accuracy    : access TS_ACCURACY;  -- openssl/ts.h:179
      ordering    : aliased Interfaces.C.int;  -- openssl/ts.h:180
      nonce       : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:181
      tsa         : access OpenSSL.Low_Level.x509v3_h.GENERAL_NAME;  -- openssl/ts.h:182
      extensions  : access OpenSSL.Low_Level.x509_h.stack_st_X509_EXTENSION;  -- openssl/ts.h:183
   end record;
   pragma Convention (C_Pass_By_Copy, TS_tst_info_st);  -- openssl/ts.h:172

   subtype TS_TST_INFO is TS_tst_info_st;

   type stack_st_ASN1_UTF8STRING;
   type TS_status_info_st is record
      status       : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:221
      text         : access stack_st_ASN1_UTF8STRING;  -- openssl/ts.h:222
      failure_info : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:223
   end record;
   pragma Convention (C_Pass_By_Copy, TS_status_info_st);  -- openssl/ts.h:219

   subtype TS_STATUS_INFO is TS_status_info_st;

   type stack_st_ASN1_UTF8STRING is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/ts.h:226
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_ASN1_UTF8STRING);  -- openssl/ts.h:226

   type TS_resp_st is record
      status_info : access TS_STATUS_INFO;  -- openssl/ts.h:237
      token       : access OpenSSL.Low_Level.pkcs7_h.PKCS7;  -- openssl/ts.h:238
      tst_info    : access TS_TST_INFO;  -- openssl/ts.h:239
   end record;
   pragma Convention (C_Pass_By_Copy, TS_resp_st);  -- openssl/ts.h:235

   subtype TS_RESP is TS_resp_st;

   type ESS_issuer_serial is record
      issuer : access OpenSSL.Low_Level.x509v3_h.stack_st_GENERAL_NAME;  -- openssl/ts.h:253
      serial : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:254
   end record;
   pragma Convention (C_Pass_By_Copy, ESS_issuer_serial);  -- openssl/ts.h:251

   type ESS_cert_id is record
      hash          : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:266
      issuer_serial : access ESS_ISSUER_SERIAL;  -- openssl/ts.h:267
   end record;
   pragma Convention (C_Pass_By_Copy, ESS_cert_id);  -- openssl/ts.h:264

   type stack_st_ESS_CERT_ID is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/ts.h:270
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_ESS_CERT_ID);  -- openssl/ts.h:270

   type ESS_signing_cert is record
      cert_ids    : access stack_st_ESS_CERT_ID;  -- openssl/ts.h:282
      policy_info : access OpenSSL.Low_Level.x509v3_h.stack_st_POLICYINFO;  -- openssl/ts.h:283
   end record;
   pragma Convention (C_Pass_By_Copy, ESS_signing_cert);  -- openssl/ts.h:280

   function TS_REQ_new return access TS_REQ;  -- openssl/ts.h:287
   pragma Import (C, TS_REQ_new, "TS_REQ_new");

   procedure TS_REQ_free (a : access TS_REQ);  -- openssl/ts.h:288
   pragma Import (C, TS_REQ_free, "TS_REQ_free");

   function i2d_TS_REQ (a : System.Address; pp : System.Address) return int;  -- openssl/ts.h:289
   pragma Import (C, i2d_TS_REQ, "i2d_TS_REQ");

   function d2i_TS_REQ
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access TS_REQ;  -- openssl/ts.h:290
   pragma Import (C, d2i_TS_REQ, "d2i_TS_REQ");

   function TS_REQ_dup (a : access TS_REQ) return access TS_REQ;  -- openssl/ts.h:292
   pragma Import (C, TS_REQ_dup, "TS_REQ_dup");

   function d2i_TS_REQ_fp (fp : access Interfaces.C_Streams.FILEs; a : System.Address) return access TS_REQ;  -- openssl/ts.h:294
   pragma Import (C, d2i_TS_REQ_fp, "d2i_TS_REQ_fp");

   function i2d_TS_REQ_fp (fp : access Interfaces.C_Streams.FILEs; a : access TS_REQ) return int;  -- openssl/ts.h:295
   pragma Import (C, i2d_TS_REQ_fp, "i2d_TS_REQ_fp");

   function d2i_TS_REQ_bio (fp : access OpenSSL.Low_Level.bio_h.bio_st; a : System.Address) return access TS_REQ;  -- openssl/ts.h:296
   pragma Import (C, d2i_TS_REQ_bio, "d2i_TS_REQ_bio");

   function i2d_TS_REQ_bio (fp : access OpenSSL.Low_Level.bio_h.bio_st; a : access TS_REQ) return int;  -- openssl/ts.h:297
   pragma Import (C, i2d_TS_REQ_bio, "i2d_TS_REQ_bio");

   function TS_MSG_IMPRINT_new return access TS_MSG_IMPRINT;  -- openssl/ts.h:299
   pragma Import (C, TS_MSG_IMPRINT_new, "TS_MSG_IMPRINT_new");

   procedure TS_MSG_IMPRINT_free (a : access TS_MSG_IMPRINT);  -- openssl/ts.h:300
   pragma Import (C, TS_MSG_IMPRINT_free, "TS_MSG_IMPRINT_free");

   function i2d_TS_MSG_IMPRINT (a : System.Address; pp : System.Address) return int;  -- openssl/ts.h:301
   pragma Import (C, i2d_TS_MSG_IMPRINT, "i2d_TS_MSG_IMPRINT");

   function d2i_TS_MSG_IMPRINT
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access TS_MSG_IMPRINT;  -- openssl/ts.h:302
   pragma Import (C, d2i_TS_MSG_IMPRINT, "d2i_TS_MSG_IMPRINT");

   function TS_MSG_IMPRINT_dup (a : access TS_MSG_IMPRINT) return access TS_MSG_IMPRINT;  -- openssl/ts.h:305
   pragma Import (C, TS_MSG_IMPRINT_dup, "TS_MSG_IMPRINT_dup");

   function d2i_TS_MSG_IMPRINT_fp (fp : access Interfaces.C_Streams.FILEs; a : System.Address) return access TS_MSG_IMPRINT;  -- openssl/ts.h:307
   pragma Import (C, d2i_TS_MSG_IMPRINT_fp, "d2i_TS_MSG_IMPRINT_fp");

   function i2d_TS_MSG_IMPRINT_fp (fp : access Interfaces.C_Streams.FILEs; a : access TS_MSG_IMPRINT) return int;  -- openssl/ts.h:308
   pragma Import (C, i2d_TS_MSG_IMPRINT_fp, "i2d_TS_MSG_IMPRINT_fp");

   function d2i_TS_MSG_IMPRINT_bio (fp : access OpenSSL.Low_Level.bio_h.bio_st; a : System.Address) return access TS_MSG_IMPRINT;  -- openssl/ts.h:309
   pragma Import (C, d2i_TS_MSG_IMPRINT_bio, "d2i_TS_MSG_IMPRINT_bio");

   function i2d_TS_MSG_IMPRINT_bio (fp : access OpenSSL.Low_Level.bio_h.bio_st; a : access TS_MSG_IMPRINT) return int;  -- openssl/ts.h:310
   pragma Import (C, i2d_TS_MSG_IMPRINT_bio, "i2d_TS_MSG_IMPRINT_bio");

   function TS_RESP_new return access TS_RESP;  -- openssl/ts.h:312
   pragma Import (C, TS_RESP_new, "TS_RESP_new");

   procedure TS_RESP_free (a : access TS_RESP);  -- openssl/ts.h:313
   pragma Import (C, TS_RESP_free, "TS_RESP_free");

   function i2d_TS_RESP (a : System.Address; pp : System.Address) return int;  -- openssl/ts.h:314
   pragma Import (C, i2d_TS_RESP, "i2d_TS_RESP");

   function d2i_TS_RESP
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access TS_RESP;  -- openssl/ts.h:315
   pragma Import (C, d2i_TS_RESP, "d2i_TS_RESP");

   function PKCS7_to_TS_TST_INFO (token : access OpenSSL.Low_Level.pkcs7_h.PKCS7) return access TS_TST_INFO;  -- openssl/ts.h:316
   pragma Import (C, PKCS7_to_TS_TST_INFO, "PKCS7_to_TS_TST_INFO");

   function TS_RESP_dup (a : access TS_RESP) return access TS_RESP;  -- openssl/ts.h:317
   pragma Import (C, TS_RESP_dup, "TS_RESP_dup");

   function d2i_TS_RESP_fp (fp : access Interfaces.C_Streams.FILEs; a : System.Address) return access TS_RESP;  -- openssl/ts.h:319
   pragma Import (C, d2i_TS_RESP_fp, "d2i_TS_RESP_fp");

   function i2d_TS_RESP_fp (fp : access Interfaces.C_Streams.FILEs; a : access TS_RESP) return int;  -- openssl/ts.h:320
   pragma Import (C, i2d_TS_RESP_fp, "i2d_TS_RESP_fp");

   function d2i_TS_RESP_bio (fp : access OpenSSL.Low_Level.bio_h.bio_st; a : System.Address) return access TS_RESP;  -- openssl/ts.h:321
   pragma Import (C, d2i_TS_RESP_bio, "d2i_TS_RESP_bio");

   function i2d_TS_RESP_bio (fp : access OpenSSL.Low_Level.bio_h.bio_st; a : access TS_RESP) return int;  -- openssl/ts.h:322
   pragma Import (C, i2d_TS_RESP_bio, "i2d_TS_RESP_bio");

   function TS_STATUS_INFO_new return access TS_STATUS_INFO;  -- openssl/ts.h:324
   pragma Import (C, TS_STATUS_INFO_new, "TS_STATUS_INFO_new");

   procedure TS_STATUS_INFO_free (a : access TS_STATUS_INFO);  -- openssl/ts.h:325
   pragma Import (C, TS_STATUS_INFO_free, "TS_STATUS_INFO_free");

   function i2d_TS_STATUS_INFO (a : System.Address; pp : System.Address) return int;  -- openssl/ts.h:326
   pragma Import (C, i2d_TS_STATUS_INFO, "i2d_TS_STATUS_INFO");

   function d2i_TS_STATUS_INFO
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access TS_STATUS_INFO;  -- openssl/ts.h:327
   pragma Import (C, d2i_TS_STATUS_INFO, "d2i_TS_STATUS_INFO");

   function TS_STATUS_INFO_dup (a : access TS_STATUS_INFO) return access TS_STATUS_INFO;  -- openssl/ts.h:329
   pragma Import (C, TS_STATUS_INFO_dup, "TS_STATUS_INFO_dup");

   function TS_TST_INFO_new return access TS_TST_INFO;  -- openssl/ts.h:331
   pragma Import (C, TS_TST_INFO_new, "TS_TST_INFO_new");

   procedure TS_TST_INFO_free (a : access TS_TST_INFO);  -- openssl/ts.h:332
   pragma Import (C, TS_TST_INFO_free, "TS_TST_INFO_free");

   function i2d_TS_TST_INFO (a : System.Address; pp : System.Address) return int;  -- openssl/ts.h:333
   pragma Import (C, i2d_TS_TST_INFO, "i2d_TS_TST_INFO");

   function d2i_TS_TST_INFO
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access TS_TST_INFO;  -- openssl/ts.h:334
   pragma Import (C, d2i_TS_TST_INFO, "d2i_TS_TST_INFO");

   function TS_TST_INFO_dup (a : access TS_TST_INFO) return access TS_TST_INFO;  -- openssl/ts.h:336
   pragma Import (C, TS_TST_INFO_dup, "TS_TST_INFO_dup");

   function d2i_TS_TST_INFO_fp (fp : access Interfaces.C_Streams.FILEs; a : System.Address) return access TS_TST_INFO;  -- openssl/ts.h:338
   pragma Import (C, d2i_TS_TST_INFO_fp, "d2i_TS_TST_INFO_fp");

   function i2d_TS_TST_INFO_fp (fp : access Interfaces.C_Streams.FILEs; a : access TS_TST_INFO) return int;  -- openssl/ts.h:339
   pragma Import (C, i2d_TS_TST_INFO_fp, "i2d_TS_TST_INFO_fp");

   function d2i_TS_TST_INFO_bio (fp : access OpenSSL.Low_Level.bio_h.bio_st; a : System.Address) return access TS_TST_INFO;  -- openssl/ts.h:340
   pragma Import (C, d2i_TS_TST_INFO_bio, "d2i_TS_TST_INFO_bio");

   function i2d_TS_TST_INFO_bio (fp : access OpenSSL.Low_Level.bio_h.bio_st; a : access TS_TST_INFO) return int;  -- openssl/ts.h:341
   pragma Import (C, i2d_TS_TST_INFO_bio, "i2d_TS_TST_INFO_bio");

   function TS_ACCURACY_new return access TS_ACCURACY;  -- openssl/ts.h:343
   pragma Import (C, TS_ACCURACY_new, "TS_ACCURACY_new");

   procedure TS_ACCURACY_free (a : access TS_ACCURACY);  -- openssl/ts.h:344
   pragma Import (C, TS_ACCURACY_free, "TS_ACCURACY_free");

   function i2d_TS_ACCURACY (a : System.Address; pp : System.Address) return int;  -- openssl/ts.h:345
   pragma Import (C, i2d_TS_ACCURACY, "i2d_TS_ACCURACY");

   function d2i_TS_ACCURACY
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access TS_ACCURACY;  -- openssl/ts.h:346
   pragma Import (C, d2i_TS_ACCURACY, "d2i_TS_ACCURACY");

   function TS_ACCURACY_dup (a : access TS_ACCURACY) return access TS_ACCURACY;  -- openssl/ts.h:348
   pragma Import (C, TS_ACCURACY_dup, "TS_ACCURACY_dup");

   function ESS_ISSUER_SERIAL_new return access ESS_ISSUER_SERIAL;  -- openssl/ts.h:350
   pragma Import (C, ESS_ISSUER_SERIAL_new, "ESS_ISSUER_SERIAL_new");

   procedure ESS_ISSUER_SERIAL_free (a : access ESS_ISSUER_SERIAL);  -- openssl/ts.h:351
   pragma Import (C, ESS_ISSUER_SERIAL_free, "ESS_ISSUER_SERIAL_free");

   function i2d_ESS_ISSUER_SERIAL (a : System.Address; pp : System.Address) return int;  -- openssl/ts.h:352
   pragma Import (C, i2d_ESS_ISSUER_SERIAL, "i2d_ESS_ISSUER_SERIAL");

   function d2i_ESS_ISSUER_SERIAL
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access ESS_ISSUER_SERIAL;  -- openssl/ts.h:354
   pragma Import (C, d2i_ESS_ISSUER_SERIAL, "d2i_ESS_ISSUER_SERIAL");

   function ESS_ISSUER_SERIAL_dup (a : access ESS_ISSUER_SERIAL) return access ESS_ISSUER_SERIAL;  -- openssl/ts.h:356
   pragma Import (C, ESS_ISSUER_SERIAL_dup, "ESS_ISSUER_SERIAL_dup");

   function ESS_CERT_ID_new return access ESS_CERT_ID;  -- openssl/ts.h:358
   pragma Import (C, ESS_CERT_ID_new, "ESS_CERT_ID_new");

   procedure ESS_CERT_ID_free (a : access ESS_CERT_ID);  -- openssl/ts.h:359
   pragma Import (C, ESS_CERT_ID_free, "ESS_CERT_ID_free");

   function i2d_ESS_CERT_ID (a : System.Address; pp : System.Address) return int;  -- openssl/ts.h:360
   pragma Import (C, i2d_ESS_CERT_ID, "i2d_ESS_CERT_ID");

   function d2i_ESS_CERT_ID
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access ESS_CERT_ID;  -- openssl/ts.h:361
   pragma Import (C, d2i_ESS_CERT_ID, "d2i_ESS_CERT_ID");

   function ESS_CERT_ID_dup (a : access ESS_CERT_ID) return access ESS_CERT_ID;  -- openssl/ts.h:363
   pragma Import (C, ESS_CERT_ID_dup, "ESS_CERT_ID_dup");

   function ESS_SIGNING_CERT_new return access ESS_SIGNING_CERT;  -- openssl/ts.h:365
   pragma Import (C, ESS_SIGNING_CERT_new, "ESS_SIGNING_CERT_new");

   procedure ESS_SIGNING_CERT_free (a : access ESS_SIGNING_CERT);  -- openssl/ts.h:366
   pragma Import (C, ESS_SIGNING_CERT_free, "ESS_SIGNING_CERT_free");

   function i2d_ESS_SIGNING_CERT (a : System.Address; pp : System.Address) return int;  -- openssl/ts.h:367
   pragma Import (C, i2d_ESS_SIGNING_CERT, "i2d_ESS_SIGNING_CERT");

   function d2i_ESS_SIGNING_CERT
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access ESS_SIGNING_CERT;  -- openssl/ts.h:369
   pragma Import (C, d2i_ESS_SIGNING_CERT, "d2i_ESS_SIGNING_CERT");

   function ESS_SIGNING_CERT_dup (a : access ESS_SIGNING_CERT) return access ESS_SIGNING_CERT;  -- openssl/ts.h:371
   pragma Import (C, ESS_SIGNING_CERT_dup, "ESS_SIGNING_CERT_dup");

   function TS_REQ_set_version (a : access TS_REQ; version : long) return int;  -- openssl/ts.h:375
   pragma Import (C, TS_REQ_set_version, "TS_REQ_set_version");

   function TS_REQ_get_version (a : System.Address) return long;  -- openssl/ts.h:376
   pragma Import (C, TS_REQ_get_version, "TS_REQ_get_version");

   function TS_REQ_set_msg_imprint (a : access TS_REQ; msg_imprint : access TS_MSG_IMPRINT) return int;  -- openssl/ts.h:378
   pragma Import (C, TS_REQ_set_msg_imprint, "TS_REQ_set_msg_imprint");

   function TS_REQ_get_msg_imprint (a : access TS_REQ) return access TS_MSG_IMPRINT;  -- openssl/ts.h:379
   pragma Import (C, TS_REQ_get_msg_imprint, "TS_REQ_get_msg_imprint");

   function TS_MSG_IMPRINT_set_algo (a : access TS_MSG_IMPRINT; alg : access OpenSSL.Low_Level.x509_h.X509_algor_st) return int;  -- openssl/ts.h:381
   pragma Import (C, TS_MSG_IMPRINT_set_algo, "TS_MSG_IMPRINT_set_algo");

   function TS_MSG_IMPRINT_get_algo (a : access TS_MSG_IMPRINT) return access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/ts.h:382
   pragma Import (C, TS_MSG_IMPRINT_get_algo, "TS_MSG_IMPRINT_get_algo");

   function TS_MSG_IMPRINT_set_msg
     (a   : access TS_MSG_IMPRINT;
      d   : access unsigned_char;
      len : int) return int;  -- openssl/ts.h:384
   pragma Import (C, TS_MSG_IMPRINT_set_msg, "TS_MSG_IMPRINT_set_msg");

   function TS_MSG_IMPRINT_get_msg (a : access TS_MSG_IMPRINT) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:385
   pragma Import (C, TS_MSG_IMPRINT_get_msg, "TS_MSG_IMPRINT_get_msg");

   function TS_REQ_set_policy_id (a : access TS_REQ; policy : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT) return int;  -- openssl/ts.h:387
   pragma Import (C, TS_REQ_set_policy_id, "TS_REQ_set_policy_id");

   function TS_REQ_get_policy_id (a : access TS_REQ) return access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/ts.h:388
   pragma Import (C, TS_REQ_get_policy_id, "TS_REQ_get_policy_id");

   function TS_REQ_set_nonce (a : access TS_REQ; nonce : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/ts.h:390
   pragma Import (C, TS_REQ_set_nonce, "TS_REQ_set_nonce");

   function TS_REQ_get_nonce (a : System.Address) return access constant OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:391
   pragma Import (C, TS_REQ_get_nonce, "TS_REQ_get_nonce");

   function TS_REQ_set_cert_req (a : access TS_REQ; cert_req : int) return int;  -- openssl/ts.h:393
   pragma Import (C, TS_REQ_set_cert_req, "TS_REQ_set_cert_req");

   function TS_REQ_get_cert_req (a : System.Address) return int;  -- openssl/ts.h:394
   pragma Import (C, TS_REQ_get_cert_req, "TS_REQ_get_cert_req");

   function TS_REQ_get_exts (a : access TS_REQ) return access OpenSSL.Low_Level.x509_h.stack_st_X509_EXTENSION;  -- openssl/ts.h:396
   pragma Import (C, TS_REQ_get_exts, "TS_REQ_get_exts");

   procedure TS_REQ_ext_free (a : access TS_REQ);  -- openssl/ts.h:397
   pragma Import (C, TS_REQ_ext_free, "TS_REQ_ext_free");

   function TS_REQ_get_ext_count (a : access TS_REQ) return int;  -- openssl/ts.h:398
   pragma Import (C, TS_REQ_get_ext_count, "TS_REQ_get_ext_count");

   function TS_REQ_get_ext_by_NID
     (a       : access TS_REQ;
      nid     : int;
      lastpos : int) return int;  -- openssl/ts.h:399
   pragma Import (C, TS_REQ_get_ext_by_NID, "TS_REQ_get_ext_by_NID");

   function TS_REQ_get_ext_by_OBJ
     (a       : access TS_REQ;
      obj     : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;
      lastpos : int) return int;  -- openssl/ts.h:400
   pragma Import (C, TS_REQ_get_ext_by_OBJ, "TS_REQ_get_ext_by_OBJ");

   function TS_REQ_get_ext_by_critical
     (a       : access TS_REQ;
      crit    : int;
      lastpos : int) return int;  -- openssl/ts.h:401
   pragma Import (C, TS_REQ_get_ext_by_critical, "TS_REQ_get_ext_by_critical");

   function TS_REQ_get_ext (a : access TS_REQ; loc : int) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ts.h:402
   pragma Import (C, TS_REQ_get_ext, "TS_REQ_get_ext");

   function TS_REQ_delete_ext (a : access TS_REQ; loc : int) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ts.h:403
   pragma Import (C, TS_REQ_delete_ext, "TS_REQ_delete_ext");

   function TS_REQ_add_ext
     (a   : access TS_REQ;
      ex  : access OpenSSL.Low_Level.x509_h.X509_EXTENSION;
      loc : int) return int;  -- openssl/ts.h:404
   pragma Import (C, TS_REQ_add_ext, "TS_REQ_add_ext");

   function TS_REQ_get_ext_d2i
     (a    : access TS_REQ;
      nid  : int;
      crit : access int;
      idx  : access int) return System.Address;  -- openssl/ts.h:405
   pragma Import (C, TS_REQ_get_ext_d2i, "TS_REQ_get_ext_d2i");

   function TS_REQ_print_bio (the_bio : access OpenSSL.Low_Level.bio_h.bio_st; a : access TS_REQ) return int;  -- openssl/ts.h:409
   pragma Import (C, TS_REQ_print_bio, "TS_REQ_print_bio");

   function TS_RESP_set_status_info (a : access TS_RESP; info : access TS_STATUS_INFO) return int;  -- openssl/ts.h:413
   pragma Import (C, TS_RESP_set_status_info, "TS_RESP_set_status_info");

   function TS_RESP_get_status_info (a : access TS_RESP) return access TS_STATUS_INFO;  -- openssl/ts.h:414
   pragma Import (C, TS_RESP_get_status_info, "TS_RESP_get_status_info");

   procedure TS_RESP_set_tst_info
     (a        : access TS_RESP;
      p7       : access OpenSSL.Low_Level.pkcs7_h.PKCS7;
      tst_info : access TS_TST_INFO);  -- openssl/ts.h:417
   pragma Import (C, TS_RESP_set_tst_info, "TS_RESP_set_tst_info");

   function TS_RESP_get_token (a : access TS_RESP) return access OpenSSL.Low_Level.pkcs7_h.PKCS7;  -- openssl/ts.h:418
   pragma Import (C, TS_RESP_get_token, "TS_RESP_get_token");

   function TS_RESP_get_tst_info (a : access TS_RESP) return access TS_TST_INFO;  -- openssl/ts.h:419
   pragma Import (C, TS_RESP_get_tst_info, "TS_RESP_get_tst_info");

   function TS_TST_INFO_set_version (a : access TS_TST_INFO; version : long) return int;  -- openssl/ts.h:421
   pragma Import (C, TS_TST_INFO_set_version, "TS_TST_INFO_set_version");

   function TS_TST_INFO_get_version (a : System.Address) return long;  -- openssl/ts.h:422
   pragma Import (C, TS_TST_INFO_get_version, "TS_TST_INFO_get_version");

   function TS_TST_INFO_set_policy_id (a : access TS_TST_INFO; policy_id : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT) return int;  -- openssl/ts.h:424
   pragma Import (C, TS_TST_INFO_set_policy_id, "TS_TST_INFO_set_policy_id");

   function TS_TST_INFO_get_policy_id (a : access TS_TST_INFO) return access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/ts.h:425
   pragma Import (C, TS_TST_INFO_get_policy_id, "TS_TST_INFO_get_policy_id");

   function TS_TST_INFO_set_msg_imprint (a : access TS_TST_INFO; msg_imprint : access TS_MSG_IMPRINT) return int;  -- openssl/ts.h:427
   pragma Import (C, TS_TST_INFO_set_msg_imprint, "TS_TST_INFO_set_msg_imprint");

   function TS_TST_INFO_get_msg_imprint (a : access TS_TST_INFO) return access TS_MSG_IMPRINT;  -- openssl/ts.h:428
   pragma Import (C, TS_TST_INFO_get_msg_imprint, "TS_TST_INFO_get_msg_imprint");

   function TS_TST_INFO_set_serial (a : access TS_TST_INFO; serial : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/ts.h:430
   pragma Import (C, TS_TST_INFO_set_serial, "TS_TST_INFO_set_serial");

   function TS_TST_INFO_get_serial (a : System.Address) return access constant OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:431
   pragma Import (C, TS_TST_INFO_get_serial, "TS_TST_INFO_get_serial");

   function TS_TST_INFO_set_time (a : access TS_TST_INFO; gtime : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/ts.h:433
   pragma Import (C, TS_TST_INFO_set_time, "TS_TST_INFO_set_time");

   function TS_TST_INFO_get_time (a : System.Address) return access constant OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:434
   pragma Import (C, TS_TST_INFO_get_time, "TS_TST_INFO_get_time");

   function TS_TST_INFO_set_accuracy (a : access TS_TST_INFO; accuracy : access TS_ACCURACY) return int;  -- openssl/ts.h:436
   pragma Import (C, TS_TST_INFO_set_accuracy, "TS_TST_INFO_set_accuracy");

   function TS_TST_INFO_get_accuracy (a : access TS_TST_INFO) return access TS_ACCURACY;  -- openssl/ts.h:437
   pragma Import (C, TS_TST_INFO_get_accuracy, "TS_TST_INFO_get_accuracy");

   function TS_ACCURACY_set_seconds (a : access TS_ACCURACY; seconds : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/ts.h:439
   pragma Import (C, TS_ACCURACY_set_seconds, "TS_ACCURACY_set_seconds");

   function TS_ACCURACY_get_seconds (a : System.Address) return access constant OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:440
   pragma Import (C, TS_ACCURACY_get_seconds, "TS_ACCURACY_get_seconds");

   function TS_ACCURACY_set_millis (a : access TS_ACCURACY; millis : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/ts.h:442
   pragma Import (C, TS_ACCURACY_set_millis, "TS_ACCURACY_set_millis");

   function TS_ACCURACY_get_millis (a : System.Address) return access constant OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:443
   pragma Import (C, TS_ACCURACY_get_millis, "TS_ACCURACY_get_millis");

   function TS_ACCURACY_set_micros (a : access TS_ACCURACY; micros : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/ts.h:445
   pragma Import (C, TS_ACCURACY_set_micros, "TS_ACCURACY_set_micros");

   function TS_ACCURACY_get_micros (a : System.Address) return access constant OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:446
   pragma Import (C, TS_ACCURACY_get_micros, "TS_ACCURACY_get_micros");

   function TS_TST_INFO_set_ordering (a : access TS_TST_INFO; ordering : int) return int;  -- openssl/ts.h:448
   pragma Import (C, TS_TST_INFO_set_ordering, "TS_TST_INFO_set_ordering");

   function TS_TST_INFO_get_ordering (a : System.Address) return int;  -- openssl/ts.h:449
   pragma Import (C, TS_TST_INFO_get_ordering, "TS_TST_INFO_get_ordering");

   function TS_TST_INFO_set_nonce (a : access TS_TST_INFO; nonce : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/ts.h:451
   pragma Import (C, TS_TST_INFO_set_nonce, "TS_TST_INFO_set_nonce");

   function TS_TST_INFO_get_nonce (a : System.Address) return access constant OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:452
   pragma Import (C, TS_TST_INFO_get_nonce, "TS_TST_INFO_get_nonce");

   function TS_TST_INFO_set_tsa (a : access TS_TST_INFO; tsa : access OpenSSL.Low_Level.x509v3_h.GENERAL_NAME) return int;  -- openssl/ts.h:454
   pragma Import (C, TS_TST_INFO_set_tsa, "TS_TST_INFO_set_tsa");

   function TS_TST_INFO_get_tsa (a : access TS_TST_INFO) return access OpenSSL.Low_Level.x509v3_h.GENERAL_NAME;  -- openssl/ts.h:455
   pragma Import (C, TS_TST_INFO_get_tsa, "TS_TST_INFO_get_tsa");

   function TS_TST_INFO_get_exts (a : access TS_TST_INFO) return access OpenSSL.Low_Level.x509_h.stack_st_X509_EXTENSION;  -- openssl/ts.h:457
   pragma Import (C, TS_TST_INFO_get_exts, "TS_TST_INFO_get_exts");

   procedure TS_TST_INFO_ext_free (a : access TS_TST_INFO);  -- openssl/ts.h:458
   pragma Import (C, TS_TST_INFO_ext_free, "TS_TST_INFO_ext_free");

   function TS_TST_INFO_get_ext_count (a : access TS_TST_INFO) return int;  -- openssl/ts.h:459
   pragma Import (C, TS_TST_INFO_get_ext_count, "TS_TST_INFO_get_ext_count");

   function TS_TST_INFO_get_ext_by_NID
     (a       : access TS_TST_INFO;
      nid     : int;
      lastpos : int) return int;  -- openssl/ts.h:460
   pragma Import (C, TS_TST_INFO_get_ext_by_NID, "TS_TST_INFO_get_ext_by_NID");

   function TS_TST_INFO_get_ext_by_OBJ
     (a       : access TS_TST_INFO;
      obj     : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;
      lastpos : int) return int;  -- openssl/ts.h:461
   pragma Import (C, TS_TST_INFO_get_ext_by_OBJ, "TS_TST_INFO_get_ext_by_OBJ");

   function TS_TST_INFO_get_ext_by_critical
     (a       : access TS_TST_INFO;
      crit    : int;
      lastpos : int) return int;  -- openssl/ts.h:462
   pragma Import (C, TS_TST_INFO_get_ext_by_critical, "TS_TST_INFO_get_ext_by_critical");

   function TS_TST_INFO_get_ext (a : access TS_TST_INFO; loc : int) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ts.h:463
   pragma Import (C, TS_TST_INFO_get_ext, "TS_TST_INFO_get_ext");

   function TS_TST_INFO_delete_ext (a : access TS_TST_INFO; loc : int) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ts.h:464
   pragma Import (C, TS_TST_INFO_delete_ext, "TS_TST_INFO_delete_ext");

   function TS_TST_INFO_add_ext
     (a   : access TS_TST_INFO;
      ex  : access OpenSSL.Low_Level.x509_h.X509_EXTENSION;
      loc : int) return int;  -- openssl/ts.h:465
   pragma Import (C, TS_TST_INFO_add_ext, "TS_TST_INFO_add_ext");

   function TS_TST_INFO_get_ext_d2i
     (a    : access TS_TST_INFO;
      nid  : int;
      crit : access int;
      idx  : access int) return System.Address;  -- openssl/ts.h:466
   pragma Import (C, TS_TST_INFO_get_ext_d2i, "TS_TST_INFO_get_ext_d2i");

   type TS_serial_cb is access function (arg1 : System.Address; arg2 : System.Address) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:489

   type TS_time_cb is access function
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : access long;
      arg4 : access long) return int;  -- openssl/ts.h:494

   type TS_extension_cb is access function
     (arg1 : System.Address;
      arg2 : access OpenSSL.Low_Level.x509_h.X509_EXTENSION;
      arg3 : System.Address) return int;  -- openssl/ts.h:501

   type stack_st_EVP_MD;
   type TS_resp_ctx is record
      signer_cert            : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/ts.h:505
      signer_key             : access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/ts.h:506
      certs                  : access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/ts.h:507
      policies               : access OpenSSL.Low_Level.asn1_h.stack_st_ASN1_OBJECT;  -- openssl/ts.h:508
      default_policy         : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/ts.h:509
      mds                    : access stack_st_EVP_MD;  -- openssl/ts.h:510
      seconds                : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:511
      millis                 : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:512
      micros                 : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:513
      clock_precision_digits : aliased unsigned;  -- openssl/ts.h:514
      flags                  : aliased unsigned;  -- openssl/ts.h:516
      serial_cb              : access function (arg1 : access TS_resp_ctx; arg2 : System.Address) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:519
      serial_cb_data         : System.Address;  -- openssl/ts.h:520
      time_cb                : access function
        (arg1 : access TS_resp_ctx;
         arg2                   : System.Address;
         arg3                   : access long;
         arg4                   : access long) return int;  -- openssl/ts.h:522
      time_cb_data           : System.Address;  -- openssl/ts.h:523
      extension_cb           : access function
        (arg1 : access TS_resp_ctx;
         arg2                   : access OpenSSL.Low_Level.x509_h.X509_EXTENSION;
         arg3                   : System.Address) return int;  -- openssl/ts.h:525
      extension_cb_data      : System.Address;  -- openssl/ts.h:526
      request                : access TS_REQ;  -- openssl/ts.h:529
      response               : access TS_RESP;  -- openssl/ts.h:530
      tst_info               : access TS_TST_INFO;  -- openssl/ts.h:531
   end record;
   pragma Convention (C_Pass_By_Copy, TS_resp_ctx);  -- openssl/ts.h:503

   type stack_st_EVP_MD is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/ts.h:534
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_EVP_MD);  -- openssl/ts.h:534

   function TS_RESP_CTX_new return access TS_RESP_CTX;  -- openssl/ts.h:538
   pragma Import (C, TS_RESP_CTX_new, "TS_RESP_CTX_new");

   procedure TS_RESP_CTX_free (ctx : access TS_RESP_CTX);  -- openssl/ts.h:539
   pragma Import (C, TS_RESP_CTX_free, "TS_RESP_CTX_free");

   function TS_RESP_CTX_set_signer_cert (ctx : access TS_RESP_CTX; signer : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/ts.h:542
   pragma Import (C, TS_RESP_CTX_set_signer_cert, "TS_RESP_CTX_set_signer_cert");

   function TS_RESP_CTX_set_signer_key (ctx : access TS_RESP_CTX; key : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/ts.h:545
   pragma Import (C, TS_RESP_CTX_set_signer_key, "TS_RESP_CTX_set_signer_key");

   function TS_RESP_CTX_set_def_policy (ctx : access TS_RESP_CTX; def_policy : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT) return int;  -- openssl/ts.h:548
   pragma Import (C, TS_RESP_CTX_set_def_policy, "TS_RESP_CTX_set_def_policy");

   function TS_RESP_CTX_set_certs (ctx : access TS_RESP_CTX; certs : access OpenSSL.Low_Level.x509_h.stack_st_X509) return int;  -- openssl/ts.h:551
   pragma Import (C, TS_RESP_CTX_set_certs, "TS_RESP_CTX_set_certs");

   function TS_RESP_CTX_add_policy (ctx : access TS_RESP_CTX; policy : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT) return int;  -- openssl/ts.h:555
   pragma Import (C, TS_RESP_CTX_add_policy, "TS_RESP_CTX_add_policy");

   function TS_RESP_CTX_add_md (ctx : access TS_RESP_CTX; md : access constant OpenSSL.Low_Level.evp_h.env_md_st) return int;  -- openssl/ts.h:559
   pragma Import (C, TS_RESP_CTX_add_md, "TS_RESP_CTX_add_md");

   function TS_RESP_CTX_set_accuracy
     (ctx    : access TS_RESP_CTX;
      secs   : int;
      millis : int;
      micros : int) return int;  -- openssl/ts.h:562
   pragma Import (C, TS_RESP_CTX_set_accuracy, "TS_RESP_CTX_set_accuracy");

   function TS_RESP_CTX_set_clock_precision_digits (ctx : access TS_RESP_CTX; clock_precision_digits : unsigned) return int;  -- openssl/ts.h:567
   pragma Import (C, TS_RESP_CTX_set_clock_precision_digits, "TS_RESP_CTX_set_clock_precision_digits");

   procedure TS_RESP_CTX_add_flags (ctx : access TS_RESP_CTX; flags : int);  -- openssl/ts.h:573
   pragma Import (C, TS_RESP_CTX_add_flags, "TS_RESP_CTX_add_flags");

   procedure TS_RESP_CTX_set_serial_cb
     (ctx  : access TS_RESP_CTX;
      cb   : access function (arg1 : access TS_resp_ctx; arg2 : System.Address) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      data : System.Address);  -- openssl/ts.h:576
   pragma Import (C, TS_RESP_CTX_set_serial_cb, "TS_RESP_CTX_set_serial_cb");

   procedure TS_RESP_CTX_set_time_cb
     (ctx  : access TS_RESP_CTX;
      cb   : access function
        (arg1 : access TS_resp_ctx;
         arg2 : System.Address;
         arg3 : access long;
         arg4 : access long) return int;
      data : System.Address);  -- openssl/ts.h:579
   pragma Import (C, TS_RESP_CTX_set_time_cb, "TS_RESP_CTX_set_time_cb");

   procedure TS_RESP_CTX_set_extension_cb
     (ctx  : access TS_RESP_CTX;
      cb   : access function
        (arg1 : access TS_resp_ctx;
         arg2 : access OpenSSL.Low_Level.x509_h.X509_EXTENSION;
         arg3 : System.Address) return int;
      data : System.Address);  -- openssl/ts.h:584
   pragma Import (C, TS_RESP_CTX_set_extension_cb, "TS_RESP_CTX_set_extension_cb");

   function TS_RESP_CTX_set_status_info
     (ctx    : access TS_RESP_CTX;
      status : int;
      text   : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ts.h:588
   pragma Import (C, TS_RESP_CTX_set_status_info, "TS_RESP_CTX_set_status_info");

   function TS_RESP_CTX_set_status_info_cond
     (ctx    : access TS_RESP_CTX;
      status : int;
      text   : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ts.h:592
   pragma Import (C, TS_RESP_CTX_set_status_info_cond, "TS_RESP_CTX_set_status_info_cond");

   function TS_RESP_CTX_add_failure_info (ctx : access TS_RESP_CTX; failure : int) return int;  -- openssl/ts.h:595
   pragma Import (C, TS_RESP_CTX_add_failure_info, "TS_RESP_CTX_add_failure_info");

   function TS_RESP_CTX_get_request (ctx : access TS_RESP_CTX) return access TS_REQ;  -- openssl/ts.h:598
   pragma Import (C, TS_RESP_CTX_get_request, "TS_RESP_CTX_get_request");

   function TS_RESP_CTX_get_tst_info (ctx : access TS_RESP_CTX) return access TS_TST_INFO;  -- openssl/ts.h:600
   pragma Import (C, TS_RESP_CTX_get_tst_info, "TS_RESP_CTX_get_tst_info");

   function TS_RESP_create_response (ctx : access TS_RESP_CTX; req_bio : access OpenSSL.Low_Level.bio_h.bio_st) return access TS_RESP;  -- openssl/ts.h:607
   pragma Import (C, TS_RESP_create_response, "TS_RESP_create_response");

   function TS_RESP_verify_signature
     (token      : access OpenSSL.Low_Level.pkcs7_h.PKCS7;
      certs      : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      store      : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;
      signer_out : System.Address) return int;  -- openssl/ts.h:614
   pragma Import (C, TS_RESP_verify_signature, "TS_RESP_verify_signature");

   type TS_verify_ctx is record
      flags       : aliased unsigned;  -- openssl/ts.h:658
      store       : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;  -- openssl/ts.h:661
      certs       : access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/ts.h:662
      policy      : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/ts.h:665
      md_alg      : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/ts.h:669
      imprint     : access unsigned_char;  -- openssl/ts.h:670
      imprint_len : aliased unsigned;  -- openssl/ts.h:671
      data        : access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/ts.h:674
      nonce       : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ts.h:677
      tsa_name    : access OpenSSL.Low_Level.x509v3_h.GENERAL_NAME;  -- openssl/ts.h:680
   end record;
   pragma Convention (C_Pass_By_Copy, TS_verify_ctx);  -- openssl/ts.h:655

   function TS_RESP_verify_response (ctx : access TS_VERIFY_CTX; response : access TS_RESP) return int;  -- openssl/ts.h:683
   pragma Import (C, TS_RESP_verify_response, "TS_RESP_verify_response");

   function TS_RESP_verify_token (ctx : access TS_VERIFY_CTX; token : access OpenSSL.Low_Level.pkcs7_h.PKCS7) return int;  -- openssl/ts.h:684
   pragma Import (C, TS_RESP_verify_token, "TS_RESP_verify_token");

   function TS_VERIFY_CTX_new return access TS_VERIFY_CTX;  -- openssl/ts.h:692
   pragma Import (C, TS_VERIFY_CTX_new, "TS_VERIFY_CTX_new");

   procedure TS_VERIFY_CTX_init (ctx : access TS_VERIFY_CTX);  -- openssl/ts.h:693
   pragma Import (C, TS_VERIFY_CTX_init, "TS_VERIFY_CTX_init");

   procedure TS_VERIFY_CTX_free (ctx : access TS_VERIFY_CTX);  -- openssl/ts.h:694
   pragma Import (C, TS_VERIFY_CTX_free, "TS_VERIFY_CTX_free");

   procedure TS_VERIFY_CTX_cleanup (ctx : access TS_VERIFY_CTX);  -- openssl/ts.h:695
   pragma Import (C, TS_VERIFY_CTX_cleanup, "TS_VERIFY_CTX_cleanup");

   function TS_REQ_to_TS_VERIFY_CTX (req : access TS_REQ; ctx : access TS_VERIFY_CTX) return access TS_VERIFY_CTX;  -- openssl/ts.h:713
   pragma Import (C, TS_REQ_to_TS_VERIFY_CTX, "TS_REQ_to_TS_VERIFY_CTX");

   function TS_RESP_print_bio (the_bio : access OpenSSL.Low_Level.bio_h.bio_st; a : access TS_RESP) return int;  -- openssl/ts.h:717
   pragma Import (C, TS_RESP_print_bio, "TS_RESP_print_bio");

   function TS_STATUS_INFO_print_bio (the_bio : access OpenSSL.Low_Level.bio_h.bio_st; a : access TS_STATUS_INFO) return int;  -- openssl/ts.h:718
   pragma Import (C, TS_STATUS_INFO_print_bio, "TS_STATUS_INFO_print_bio");

   function TS_TST_INFO_print_bio (the_bio : access OpenSSL.Low_Level.bio_h.bio_st; a : access TS_TST_INFO) return int;  -- openssl/ts.h:719
   pragma Import (C, TS_TST_INFO_print_bio, "TS_TST_INFO_print_bio");

   function TS_ASN1_INTEGER_print_bio (the_bio : access OpenSSL.Low_Level.bio_h.bio_st; num : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/ts.h:723
   pragma Import (C, TS_ASN1_INTEGER_print_bio, "TS_ASN1_INTEGER_print_bio");

   function TS_OBJ_print_bio (the_bio : access OpenSSL.Low_Level.bio_h.bio_st; obj : access constant OpenSSL.Low_Level.asn1_h.ASN1_OBJECT) return int;  -- openssl/ts.h:724
   pragma Import (C, TS_OBJ_print_bio, "TS_OBJ_print_bio");

   function TS_ext_print_bio (the_bio : access OpenSSL.Low_Level.bio_h.bio_st; extensions : access constant OpenSSL.Low_Level.x509_h.stack_st_X509_EXTENSION) return int;  -- openssl/ts.h:725
   pragma Import (C, TS_ext_print_bio, "TS_ext_print_bio");

   function TS_X509_ALGOR_print_bio (the_bio : access OpenSSL.Low_Level.bio_h.bio_st; alg : access constant OpenSSL.Low_Level.x509_h.X509_algor_st) return int;  -- openssl/ts.h:726
   pragma Import (C, TS_X509_ALGOR_print_bio, "TS_X509_ALGOR_print_bio");

   function TS_MSG_IMPRINT_print_bio (the_bio : access OpenSSL.Low_Level.bio_h.bio_st; msg : access TS_MSG_IMPRINT) return int;  -- openssl/ts.h:727
   pragma Import (C, TS_MSG_IMPRINT_print_bio, "TS_MSG_IMPRINT_print_bio");

   function TS_CONF_load_cert (file : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/ts.h:732
   pragma Import (C, TS_CONF_load_cert, "TS_CONF_load_cert");

   function TS_CONF_load_certs (file : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/ts.h:733
   pragma Import (C, TS_CONF_load_certs, "TS_CONF_load_certs");

   function TS_CONF_load_key (file : Interfaces.C.Strings.chars_ptr; pass : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/ts.h:734
   pragma Import (C, TS_CONF_load_key, "TS_CONF_load_key");

   function TS_CONF_get_tsa_section (the_conf : access OpenSSL.Low_Level.conf_h.conf_st; section : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/ts.h:735
   pragma Import (C, TS_CONF_get_tsa_section, "TS_CONF_get_tsa_section");

   function TS_CONF_set_serial
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      cb       : access function (arg1 : access TS_resp_ctx; arg2 : System.Address) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      ctx      : access TS_RESP_CTX) return int;  -- openssl/ts.h:736
   pragma Import (C, TS_CONF_set_serial, "TS_CONF_set_serial");

   function TS_CONF_set_crypto_device
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      device   : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ts.h:738
   pragma Import (C, TS_CONF_set_crypto_device, "TS_CONF_set_crypto_device");

   function TS_CONF_set_default_engine (name : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ts.h:740
   pragma Import (C, TS_CONF_set_default_engine, "TS_CONF_set_default_engine");

   function TS_CONF_set_signer_cert
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      cert     : Interfaces.C.Strings.chars_ptr;
      ctx      : access TS_RESP_CTX) return int;  -- openssl/ts.h:741
   pragma Import (C, TS_CONF_set_signer_cert, "TS_CONF_set_signer_cert");

   function TS_CONF_set_certs
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      certs    : Interfaces.C.Strings.chars_ptr;
      ctx      : access TS_RESP_CTX) return int;  -- openssl/ts.h:743
   pragma Import (C, TS_CONF_set_certs, "TS_CONF_set_certs");

   function TS_CONF_set_signer_key
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      key      : Interfaces.C.Strings.chars_ptr;
      pass     : Interfaces.C.Strings.chars_ptr;
      ctx      : access TS_RESP_CTX) return int;  -- openssl/ts.h:745
   pragma Import (C, TS_CONF_set_signer_key, "TS_CONF_set_signer_key");

   function TS_CONF_set_def_policy
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      policy   : Interfaces.C.Strings.chars_ptr;
      ctx      : access TS_RESP_CTX) return int;  -- openssl/ts.h:747
   pragma Import (C, TS_CONF_set_def_policy, "TS_CONF_set_def_policy");

   function TS_CONF_set_policies
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      ctx      : access TS_RESP_CTX) return int;  -- openssl/ts.h:749
   pragma Import (C, TS_CONF_set_policies, "TS_CONF_set_policies");

   function TS_CONF_set_digests
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      ctx      : access TS_RESP_CTX) return int;  -- openssl/ts.h:750
   pragma Import (C, TS_CONF_set_digests, "TS_CONF_set_digests");

   function TS_CONF_set_accuracy
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      ctx      : access TS_RESP_CTX) return int;  -- openssl/ts.h:751
   pragma Import (C, TS_CONF_set_accuracy, "TS_CONF_set_accuracy");

   function TS_CONF_set_clock_precision_digits
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      ctx      : access TS_RESP_CTX) return int;  -- openssl/ts.h:752
   pragma Import (C, TS_CONF_set_clock_precision_digits, "TS_CONF_set_clock_precision_digits");

   function TS_CONF_set_ordering
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      ctx      : access TS_RESP_CTX) return int;  -- openssl/ts.h:754
   pragma Import (C, TS_CONF_set_ordering, "TS_CONF_set_ordering");

   function TS_CONF_set_tsa_name
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      ctx      : access TS_RESP_CTX) return int;  -- openssl/ts.h:755
   pragma Import (C, TS_CONF_set_tsa_name, "TS_CONF_set_tsa_name");

   function TS_CONF_set_ess_cert_id_chain
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      section  : Interfaces.C.Strings.chars_ptr;
      ctx      : access TS_RESP_CTX) return int;  -- openssl/ts.h:756
   pragma Import (C, TS_CONF_set_ess_cert_id_chain, "TS_CONF_set_ess_cert_id_chain");

   procedure ERR_load_TS_strings;  -- openssl/ts.h:764
   pragma Import (C, ERR_load_TS_strings, "ERR_load_TS_strings");

end OpenSSL.Low_Level.ts_h;
