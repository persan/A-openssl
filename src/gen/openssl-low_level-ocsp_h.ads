with Interfaces.C; use Interfaces.C;
--  with OpenSSL.Low_Level.ossl_typ_h;
with OpenSSL.Low_Level.stack_h;
limited with OpenSSL.Low_Level.x509_h;
limited with OpenSSL.Low_Level.x509v3_h;
with OpenSSL.Low_Level.asn1_h;
with OpenSSL.Low_Level.bio_h;
with OpenSSL.Low_Level.bio_h;
with Interfaces.C.Strings;
with System;
with OpenSSL.Low_Level.evp_h;
with OpenSSL.Low_Level.x509_vfy_h;
with OpenSSL.Low_Level.x509_vfy_h;

package OpenSSL.Low_Level.ocsp_h is

   package defs is

      OCSP_DEFAULT_NONCE_LENGTH : constant := 16;  --  openssl/ocsp.h:78

      OCSP_NOCERTS              : constant := 16#1#;  --  openssl/ocsp.h:80
      OCSP_NOINTERN             : constant := 16#2#;  --  openssl/ocsp.h:81
      OCSP_NOSIGS               : constant := 16#4#;  --  openssl/ocsp.h:82
      OCSP_NOCHAIN              : constant := 16#8#;  --  openssl/ocsp.h:83
      OCSP_NOVERIFY             : constant := 16#10#;  --  openssl/ocsp.h:84
      OCSP_NOEXPLICIT           : constant := 16#20#;  --  openssl/ocsp.h:85
      OCSP_NOCASIGN             : constant := 16#40#;  --  openssl/ocsp.h:86
      OCSP_NODELEGATED          : constant := 16#80#;  --  openssl/ocsp.h:87
      OCSP_NOCHECKS             : constant := 16#100#;  --  openssl/ocsp.h:88
      OCSP_TRUSTOTHER           : constant := 16#200#;  --  openssl/ocsp.h:89
      OCSP_RESPID_KEY           : constant := 16#400#;  --  openssl/ocsp.h:90
      OCSP_NOTIME               : constant := 16#800#;  --  openssl/ocsp.h:91

      OCSP_RESPONSE_STATUS_SUCCESSFUL : constant := 0;  --  openssl/ocsp.h:169
      OCSP_RESPONSE_STATUS_MALFORMEDREQUEST : constant := 1;  --  openssl/ocsp.h:170
      OCSP_RESPONSE_STATUS_INTERNALERROR : constant := 2;  --  openssl/ocsp.h:171
      OCSP_RESPONSE_STATUS_TRYLATER : constant := 3;  --  openssl/ocsp.h:172
      OCSP_RESPONSE_STATUS_SIGREQUIRED : constant := 5;  --  openssl/ocsp.h:173
      OCSP_RESPONSE_STATUS_UNAUTHORIZED : constant := 6;  --  openssl/ocsp.h:174

      V_OCSP_RESPID_NAME        : constant := 0;  --  openssl/ocsp.h:200
      V_OCSP_RESPID_KEY         : constant := 1;  --  openssl/ocsp.h:201

      V_OCSP_CERTSTATUS_GOOD    : constant := 0;  --  openssl/ocsp.h:233
      V_OCSP_CERTSTATUS_REVOKED : constant := 1;  --  openssl/ocsp.h:234
      V_OCSP_CERTSTATUS_UNKNOWN : constant := 2;  --  openssl/ocsp.h:235

      OCSP_REVOKED_STATUS_NOSTATUS : constant := -1;  --  openssl/ocsp.h:322
      OCSP_REVOKED_STATUS_UNSPECIFIED : constant := 0;  --  openssl/ocsp.h:323
      OCSP_REVOKED_STATUS_KEYCOMPROMISE : constant := 1;  --  openssl/ocsp.h:324
      OCSP_REVOKED_STATUS_CACOMPROMISE : constant := 2;  --  openssl/ocsp.h:325
      OCSP_REVOKED_STATUS_AFFILIATIONCHANGED : constant := 3;  --  openssl/ocsp.h:326
      OCSP_REVOKED_STATUS_SUPERSEDED : constant := 4;  --  openssl/ocsp.h:327
      OCSP_REVOKED_STATUS_CESSATIONOFOPERATION : constant := 5;  --  openssl/ocsp.h:328
      OCSP_REVOKED_STATUS_CERTIFICATEHOLD : constant := 6;  --  openssl/ocsp.h:329
      OCSP_REVOKED_STATUS_REMOVEFROMCRL : constant := 8;  --  openssl/ocsp.h:330

      PEM_STRING_OCSP_REQUEST   : aliased constant String := "OCSP REQUEST" & ASCII.NUL;  --  openssl/ocsp.h:354
      PEM_STRING_OCSP_RESPONSE  : aliased constant String := "OCSP RESPONSE" & ASCII.NUL;  --  openssl/ocsp.h:355
      --  arg-macro: procedure d2i_OCSP_REQUEST_bio (bp, p)
      --    ASN1_d2i_bio_of(OCSP_REQUEST,OCSP_REQUEST_new,d2i_OCSP_REQUEST,bp,p)
      --  arg-macro: procedure d2i_OCSP_RESPONSE_bio (bp, p)
      --    ASN1_d2i_bio_of(OCSP_RESPONSE,OCSP_RESPONSE_new,d2i_OCSP_RESPONSE,bp,p)
      --  arg-macro: function PEM_read_bio_OCSP_REQUEST (bp, x, cb)
      --    return OCSP_REQUEST *)PEM_ASN1_read_bio( (char *(*)())d2i_OCSP_REQUEST,PEM_STRING_OCSP_REQUEST,bp,(char **)x,cb,NULL;
      --  arg-macro: function PEM_read_bio_OCSP_RESPONSE (bp, x, cb)
      --    return OCSP_RESPONSE *)PEM_ASN1_read_bio( (char *(*)())d2i_OCSP_RESPONSE,PEM_STRING_OCSP_RESPONSE,bp,(char **)x,cb,NULL;
      --  arg-macro: procedure PEM_write_bio_OCSP_REQUEST (bp, o)
      --    PEM_ASN1_write_bio((int (*)())i2d_OCSP_REQUEST,PEM_STRING_OCSP_REQUEST, bp,(char *)o, NULL,NULL,0,NULL,NULL)
      --  arg-macro: procedure PEM_write_bio_OCSP_RESPONSE (bp, o)
      --    PEM_ASN1_write_bio((int (*)())i2d_OCSP_RESPONSE,PEM_STRING_OCSP_RESPONSE, bp,(char *)o, NULL,NULL,0,NULL,NULL)
      --  arg-macro: procedure i2d_OCSP_RESPONSE_bio (bp, o)
      --    ASN1_i2d_bio_of(OCSP_RESPONSE,i2d_OCSP_RESPONSE,bp,o)
      --  arg-macro: procedure i2d_OCSP_REQUEST_bio (bp, o)
      --    ASN1_i2d_bio_of(OCSP_REQUEST,i2d_OCSP_REQUEST,bp,o)
      --  arg-macro: procedure OCSP_REQUEST_sign (o, pkey, md)
      --    ASN1_item_sign(ASN1_ITEM_rptr(OCSP_REQINFO), o.optionalSignature.signatureAlgorithm,NULL, o.optionalSignature.signature,o.tbsRequest,pkey,md)
      --  arg-macro: procedure OCSP_BASICRESP_sign (o, pkey, md, d)ASN1_item_sign(ASN1_ITEM_rptr(OCSP_RESPDATA),o.signatureAlgorithm,NULL, o.signature,o.tbsResponseData,pkey,md)
      --    ASN1_item_sign(ASN1_ITEM_rptr(OCSP_RESPDATA),o.signatureAlgorithm,NULL, o.signature,o.tbsResponseData,pkey,md)
      --  arg-macro: procedure OCSP_REQUEST_verify (a, r)
      --    ASN1_item_verify(ASN1_ITEM_rptr(OCSP_REQINFO), a.optionalSignature.signatureAlgorithm, a.optionalSignature.signature,a.tbsRequest,r)
      --  arg-macro: procedure OCSP_BASICRESP_verify (a, r, d)
      --    ASN1_item_verify(ASN1_ITEM_rptr(OCSP_RESPDATA), a.signatureAlgorithm,a.signature,a.tbsResponseData,r)
      --  arg-macro: procedure ASN1_BIT_STRING_digest (data, type, md,ASN1_item_digest(ASN1_ITEM_rptr(ASN1_BIT_STRING),type,data,md,len)
      --    ASN1_item_digest(ASN1_ITEM_rptr(ASN1_BIT_STRING),type,data,md,len)
      --  arg-macro: function OCSP_CERTSTATUS_dup (cs)
      --    return OCSP_CERTSTATUS*)ASN1_dup((int(*)())i2d_OCSP_CERTSTATUS, (char *(*)())d2i_OCSP_CERTSTATUS,(char *)(cs);

      OCSP_F_ASN1_STRING_ENCODE : constant := 100;  --  openssl/ocsp.h:568
      OCSP_F_D2I_OCSP_NONCE     : constant := 102;  --  openssl/ocsp.h:569
      OCSP_F_OCSP_BASIC_ADD1_STATUS : constant := 103;  --  openssl/ocsp.h:570
      OCSP_F_OCSP_BASIC_SIGN    : constant := 104;  --  openssl/ocsp.h:571
      OCSP_F_OCSP_BASIC_VERIFY  : constant := 105;  --  openssl/ocsp.h:572
      OCSP_F_OCSP_CERT_ID_NEW   : constant := 101;  --  openssl/ocsp.h:573
      OCSP_F_OCSP_CHECK_DELEGATED : constant := 106;  --  openssl/ocsp.h:574
      OCSP_F_OCSP_CHECK_IDS     : constant := 107;  --  openssl/ocsp.h:575
      OCSP_F_OCSP_CHECK_ISSUER  : constant := 108;  --  openssl/ocsp.h:576
      OCSP_F_OCSP_CHECK_VALIDITY : constant := 115;  --  openssl/ocsp.h:577
      OCSP_F_OCSP_MATCH_ISSUERID : constant := 109;  --  openssl/ocsp.h:578
      OCSP_F_OCSP_PARSE_URL     : constant := 114;  --  openssl/ocsp.h:579
      OCSP_F_OCSP_REQUEST_SIGN  : constant := 110;  --  openssl/ocsp.h:580
      OCSP_F_OCSP_REQUEST_VERIFY : constant := 116;  --  openssl/ocsp.h:581
      OCSP_F_OCSP_RESPONSE_GET1_BASIC : constant := 111;  --  openssl/ocsp.h:582
      OCSP_F_OCSP_SENDREQ_BIO   : constant := 112;  --  openssl/ocsp.h:583
      OCSP_F_OCSP_SENDREQ_NBIO  : constant := 117;  --  openssl/ocsp.h:584
      OCSP_F_PARSE_HTTP_LINE1   : constant := 118;  --  openssl/ocsp.h:585
      OCSP_F_REQUEST_VERIFY     : constant := 113;  --  openssl/ocsp.h:586

      OCSP_R_BAD_DATA           : constant := 100;  --  openssl/ocsp.h:589
      OCSP_R_CERTIFICATE_VERIFY_ERROR : constant := 101;  --  openssl/ocsp.h:590
      OCSP_R_DIGEST_ERR         : constant := 102;  --  openssl/ocsp.h:591
      OCSP_R_ERROR_IN_NEXTUPDATE_FIELD : constant := 122;  --  openssl/ocsp.h:592
      OCSP_R_ERROR_IN_THISUPDATE_FIELD : constant := 123;  --  openssl/ocsp.h:593
      OCSP_R_ERROR_PARSING_URL  : constant := 121;  --  openssl/ocsp.h:594
      OCSP_R_MISSING_OCSPSIGNING_USAGE : constant := 103;  --  openssl/ocsp.h:595
      OCSP_R_NEXTUPDATE_BEFORE_THISUPDATE : constant := 124;  --  openssl/ocsp.h:596
      OCSP_R_NOT_BASIC_RESPONSE : constant := 104;  --  openssl/ocsp.h:597
      OCSP_R_NO_CERTIFICATES_IN_CHAIN : constant := 105;  --  openssl/ocsp.h:598
      OCSP_R_NO_CONTENT         : constant := 106;  --  openssl/ocsp.h:599
      OCSP_R_NO_PUBLIC_KEY      : constant := 107;  --  openssl/ocsp.h:600
      OCSP_R_NO_RESPONSE_DATA   : constant := 108;  --  openssl/ocsp.h:601
      OCSP_R_NO_REVOKED_TIME    : constant := 109;  --  openssl/ocsp.h:602
      OCSP_R_PRIVATE_KEY_DOES_NOT_MATCH_CERTIFICATE : constant := 110;  --  openssl/ocsp.h:603
      OCSP_R_REQUEST_NOT_SIGNED : constant := 128;  --  openssl/ocsp.h:604
      OCSP_R_RESPONSE_CONTAINS_NO_REVOCATION_DATA : constant := 111;  --  openssl/ocsp.h:605
      OCSP_R_ROOT_CA_NOT_TRUSTED : constant := 112;  --  openssl/ocsp.h:606
      OCSP_R_SERVER_READ_ERROR  : constant := 113;  --  openssl/ocsp.h:607
      OCSP_R_SERVER_RESPONSE_ERROR : constant := 114;  --  openssl/ocsp.h:608
      OCSP_R_SERVER_RESPONSE_PARSE_ERROR : constant := 115;  --  openssl/ocsp.h:609
      OCSP_R_SERVER_WRITE_ERROR : constant := 116;  --  openssl/ocsp.h:610
      OCSP_R_SIGNATURE_FAILURE  : constant := 117;  --  openssl/ocsp.h:611
      OCSP_R_SIGNER_CERTIFICATE_NOT_FOUND : constant := 118;  --  openssl/ocsp.h:612
      OCSP_R_STATUS_EXPIRED     : constant := 125;  --  openssl/ocsp.h:613
      OCSP_R_STATUS_NOT_YET_VALID : constant := 126;  --  openssl/ocsp.h:614
      OCSP_R_STATUS_TOO_OLD     : constant := 127;  --  openssl/ocsp.h:615
      OCSP_R_UNKNOWN_MESSAGE_DIGEST : constant := 119;  --  openssl/ocsp.h:616
      OCSP_R_UNKNOWN_NID        : constant := 120;  --  openssl/ocsp.h:617
      OCSP_R_UNSUPPORTED_REQUESTORNAME_TYPE : constant := 129;  --  openssl/ocsp.h:618
   end defs;
   type ocsp_cert_id_st is record
      hashAlgorithm  : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/ocsp.h:101
      issuerNameHash : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:102
      issuerKeyHash  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:103
      serialNumber   : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:104
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_cert_id_st);  -- openssl/ocsp.h:99

   subtype OCSP_CERTID is ocsp_cert_id_st;

   type stack_st_OCSP_CERTID is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/ocsp.h:107
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_OCSP_CERTID);  -- openssl/ocsp.h:107

   type ocsp_one_request_st is record
      reqCert                 : access OCSP_CERTID;  -- openssl/ocsp.h:115
      singleRequestExtensions : access OpenSSL.Low_Level.x509_h.stack_st_X509_EXTENSION;  -- openssl/ocsp.h:116
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_one_request_st);  -- openssl/ocsp.h:113

   subtype OCSP_ONEREQ is ocsp_one_request_st;

   type stack_st_OCSP_ONEREQ is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/ocsp.h:119
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_OCSP_ONEREQ);  -- openssl/ocsp.h:119

   type ocsp_req_info_st is record
      version           : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:131
      requestorName     : access OpenSSL.Low_Level.x509v3_h.GENERAL_NAME;  -- openssl/ocsp.h:132
      requestList       : access stack_st_OCSP_ONEREQ;  -- openssl/ocsp.h:133
      requestExtensions : access OpenSSL.Low_Level.x509_h.stack_st_X509_EXTENSION;  -- openssl/ocsp.h:134
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_req_info_st);  -- openssl/ocsp.h:129

   subtype OCSP_REQINFO is ocsp_req_info_st;

   type ocsp_signature_st is record
      signatureAlgorithm : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/ocsp.h:144
      signature          : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:145
      certs              : access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/ocsp.h:146
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_signature_st);  -- openssl/ocsp.h:142

   subtype OCSP_SIGNATURE is ocsp_signature_st;

   type ocsp_request_st is record
      tbsRequest        : access OCSP_REQINFO;  -- openssl/ocsp.h:155
      optionalSignature : access OCSP_SIGNATURE;  -- openssl/ocsp.h:156
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_request_st);  -- openssl/ocsp.h:153

   subtype OCSP_REQUEST is ocsp_request_st;

   type ocsp_resp_bytes_st is record
      responseType : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/ocsp.h:182
      response     : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:183
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_resp_bytes_st);  -- openssl/ocsp.h:180

   subtype OCSP_RESPBYTES is ocsp_resp_bytes_st;

   type ocsp_response_st is record
      responseStatus : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:192
      responseBytes  : access OCSP_RESPBYTES;  -- openssl/ocsp.h:193
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_response_st);  -- openssl/ocsp.h:190

   type anon_51 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            byName : access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/ocsp.h:206
         when others =>
            byKey  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:207
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_51);
   pragma Unchecked_Union (anon_51);
   type ocsp_responder_id_st is record
      c_type : aliased int;  -- openssl/ocsp.h:204
      value  : anon_51;  -- openssl/ocsp.h:208
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_responder_id_st);  -- openssl/ocsp.h:202

   type stack_st_OCSP_RESPID is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/ocsp.h:211
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_OCSP_RESPID);  -- openssl/ocsp.h:211

   type ocsp_revoked_info_st is record
      revocationTime   : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:224
      revocationReason : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:225
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_revoked_info_st);  -- openssl/ocsp.h:222

   subtype OCSP_REVOKEDINFO is ocsp_revoked_info_st;

   type anon_52 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            good    : access Interfaces.C.int;  -- openssl/ocsp.h:240
         when 1 =>
            revoked : access OCSP_REVOKEDINFO;  -- openssl/ocsp.h:241
         when others =>
            unknown : access Interfaces.C.int;  -- openssl/ocsp.h:242
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_52);
   pragma Unchecked_Union (anon_52);
   type ocsp_cert_status_st is record
      c_type : aliased int;  -- openssl/ocsp.h:238
      value  : anon_52;  -- openssl/ocsp.h:243
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_cert_status_st);  -- openssl/ocsp.h:236

   subtype OCSP_CERTSTATUS is ocsp_cert_status_st;

   type ocsp_single_response_st is record
      certId           : access OCSP_CERTID;  -- openssl/ocsp.h:255
      certStatus       : access OCSP_CERTSTATUS;  -- openssl/ocsp.h:256
      thisUpdate       : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:257
      nextUpdate       : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:258
      singleExtensions : access OpenSSL.Low_Level.x509_h.stack_st_X509_EXTENSION;  -- openssl/ocsp.h:259
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_single_response_st);  -- openssl/ocsp.h:253

   subtype OCSP_SINGLERESP is ocsp_single_response_st;

   type stack_st_OCSP_SINGLERESP is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/ocsp.h:262
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_OCSP_SINGLERESP);  -- openssl/ocsp.h:262

   type ocsp_response_data_st is record
      version            : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:274
      responderId        : access OpenSSL.Low_Level.ocsp_h.ocsp_responder_id_st;  -- openssl/ocsp.h:275
      producedAt         : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:276
      responses          : access stack_st_OCSP_SINGLERESP;  -- openssl/ocsp.h:277
      responseExtensions : access OpenSSL.Low_Level.x509_h.stack_st_X509_EXTENSION;  -- openssl/ocsp.h:278
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_response_data_st);  -- openssl/ocsp.h:272

   subtype OCSP_RESPDATA is ocsp_response_data_st;

   type ocsp_basic_response_st is record
      tbsResponseData    : access OCSP_RESPDATA;  -- openssl/ocsp.h:305
      signatureAlgorithm : access OpenSSL.Low_Level.x509_h.X509_algor_st;  -- openssl/ocsp.h:306
      signature          : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:307
      certs              : access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/ocsp.h:308
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_basic_response_st);  -- openssl/ocsp.h:303

   subtype OCSP_BASICRESP is ocsp_basic_response_st;

   type ocsp_crl_id_st is record
      crlUrl  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:339
      crlNum  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:340
      crlTime : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/ocsp.h:341
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_crl_id_st);  -- openssl/ocsp.h:337

   subtype OCSP_CRLID is ocsp_crl_id_st;

   type ocsp_service_locator_st is record
      issuer  : access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/ocsp.h:350
      locator : access OpenSSL.Low_Level.x509v3_h.stack_st_ACCESS_DESCRIPTION;  -- openssl/ocsp.h:351
   end record;
   pragma Convention (C_Pass_By_Copy, ocsp_service_locator_st);  -- openssl/ocsp.h:348

   subtype OCSP_SERVICELOC is ocsp_service_locator_st;

   function OCSP_CERTID_dup (id : access OCSP_CERTID) return access OCSP_CERTID;  -- openssl/ocsp.h:402
   pragma Import (C, OCSP_CERTID_dup, "OCSP_CERTID_dup");

   function OCSP_sendreq_bio
     (b    : access OpenSSL.Low_Level.bio_h.bio_st;
      path : Interfaces.C.Strings.chars_ptr;
      req  : access OCSP_REQUEST) return access OpenSSL.Low_Level.ocsp_h.ocsp_response_st;  -- openssl/ocsp.h:404
   pragma Import (C, OCSP_sendreq_bio, "OCSP_sendreq_bio");

   function OCSP_sendreq_new
     (io      : access OpenSSL.Low_Level.bio_h.bio_st;
      path    : Interfaces.C.Strings.chars_ptr;
      req     : access OCSP_REQUEST;
      maxline : int) return System.Address;  -- openssl/ocsp.h:405
   pragma Import (C, OCSP_sendreq_new, "OCSP_sendreq_new");

   function OCSP_sendreq_nbio (presp : System.Address; rctx : System.Address) return int;  -- openssl/ocsp.h:407
   pragma Import (C, OCSP_sendreq_nbio, "OCSP_sendreq_nbio");

   procedure OCSP_REQ_CTX_free (rctx : System.Address);  -- openssl/ocsp.h:408
   pragma Import (C, OCSP_REQ_CTX_free, "OCSP_REQ_CTX_free");

   function OCSP_REQ_CTX_set1_req (rctx : System.Address; req : access OCSP_REQUEST) return int;  -- openssl/ocsp.h:409
   pragma Import (C, OCSP_REQ_CTX_set1_req, "OCSP_REQ_CTX_set1_req");

   function OCSP_REQ_CTX_add1_header
     (rctx  : System.Address;
      name  : Interfaces.C.Strings.chars_ptr;
      value : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/ocsp.h:410
   pragma Import (C, OCSP_REQ_CTX_add1_header, "OCSP_REQ_CTX_add1_header");

   function OCSP_cert_to_id
     (dgst    : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      subject : access OpenSSL.Low_Level.x509_h.x509_st;
      issuer  : access OpenSSL.Low_Level.x509_h.x509_st) return access OCSP_CERTID;  -- openssl/ocsp.h:413
   pragma Import (C, OCSP_cert_to_id, "OCSP_cert_to_id");

   function OCSP_cert_id_new
     (dgst         : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      issuerName   : access OpenSSL.Low_Level.x509_h.X509_name_st;
      issuerKey    : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      serialNumber : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return access OCSP_CERTID;  -- openssl/ocsp.h:415
   pragma Import (C, OCSP_cert_id_new, "OCSP_cert_id_new");

   function OCSP_request_add0_id (req : access OCSP_REQUEST; cid : access OCSP_CERTID) return access OCSP_ONEREQ;  -- openssl/ocsp.h:420
   pragma Import (C, OCSP_request_add0_id, "OCSP_request_add0_id");

   function OCSP_request_add1_nonce
     (req : access OCSP_REQUEST;
      val : access unsigned_char;
      len : int) return int;  -- openssl/ocsp.h:422
   pragma Import (C, OCSP_request_add1_nonce, "OCSP_request_add1_nonce");

   function OCSP_basic_add1_nonce
     (resp : access OCSP_BASICRESP;
      val  : access unsigned_char;
      len  : int) return int;  -- openssl/ocsp.h:423
   pragma Import (C, OCSP_basic_add1_nonce, "OCSP_basic_add1_nonce");

   function OCSP_check_nonce (req : access OCSP_REQUEST; bs : access OCSP_BASICRESP) return int;  -- openssl/ocsp.h:424
   pragma Import (C, OCSP_check_nonce, "OCSP_check_nonce");

   function OCSP_copy_nonce (resp : access OCSP_BASICRESP; req : access OCSP_REQUEST) return int;  -- openssl/ocsp.h:425
   pragma Import (C, OCSP_copy_nonce, "OCSP_copy_nonce");

   function OCSP_request_set1_name (req : access OCSP_REQUEST; nm : access OpenSSL.Low_Level.x509_h.X509_name_st) return int;  -- openssl/ocsp.h:427
   pragma Import (C, OCSP_request_set1_name, "OCSP_request_set1_name");

   function OCSP_request_add1_cert (req : access OCSP_REQUEST; cert : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/ocsp.h:428
   pragma Import (C, OCSP_request_add1_cert, "OCSP_request_add1_cert");

   function OCSP_request_sign
     (req    : access OCSP_REQUEST;
      signer : access OpenSSL.Low_Level.x509_h.x509_st;
      key    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      dgst   : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      certs  : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      flags  : unsigned_long) return int;  -- openssl/ocsp.h:430
   pragma Import (C, OCSP_request_sign, "OCSP_request_sign");

   function OCSP_response_status (resp : access OpenSSL.Low_Level.ocsp_h.ocsp_response_st) return int;  -- openssl/ocsp.h:437
   pragma Import (C, OCSP_response_status, "OCSP_response_status");

   function OCSP_response_get1_basic (resp : access OpenSSL.Low_Level.ocsp_h.ocsp_response_st) return access OCSP_BASICRESP;  -- openssl/ocsp.h:438
   pragma Import (C, OCSP_response_get1_basic, "OCSP_response_get1_basic");

   function OCSP_resp_count (bs : access OCSP_BASICRESP) return int;  -- openssl/ocsp.h:440
   pragma Import (C, OCSP_resp_count, "OCSP_resp_count");

   function OCSP_resp_get0 (bs : access OCSP_BASICRESP; idx : int) return access OCSP_SINGLERESP;  -- openssl/ocsp.h:441
   pragma Import (C, OCSP_resp_get0, "OCSP_resp_get0");

   function OCSP_resp_find
     (bs   : access OCSP_BASICRESP;
      id   : access OCSP_CERTID;
      last : int) return int;  -- openssl/ocsp.h:442
   pragma Import (C, OCSP_resp_find, "OCSP_resp_find");

   function OCSP_single_get0_status
     (single  : access OCSP_SINGLERESP;
      reason  : access int;
      revtime : System.Address;
      thisupd : System.Address;
      nextupd : System.Address) return int;  -- openssl/ocsp.h:443
   pragma Import (C, OCSP_single_get0_status, "OCSP_single_get0_status");

   function OCSP_resp_find_status
     (bs      : access OCSP_BASICRESP;
      id      : access OCSP_CERTID;
      status  : access int;
      reason  : access int;
      revtime : System.Address;
      thisupd : System.Address;
      nextupd : System.Address) return int;  -- openssl/ocsp.h:447
   pragma Import (C, OCSP_resp_find_status, "OCSP_resp_find_status");

   function OCSP_check_validity
     (thisupd : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      nextupd : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      sec     : long;
      maxsec  : long) return int;  -- openssl/ocsp.h:452
   pragma Import (C, OCSP_check_validity, "OCSP_check_validity");

   function OCSP_request_verify
     (req   : access OCSP_REQUEST;
      certs : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      store : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;
      flags : unsigned_long) return int;  -- openssl/ocsp.h:456
   pragma Import (C, OCSP_request_verify, "OCSP_request_verify");

   function OCSP_parse_url
     (url   : Interfaces.C.Strings.chars_ptr;
      phost : System.Address;
      pport : System.Address;
      ppath : System.Address;
      pssl  : access int) return int;  -- openssl/ocsp.h:458
   pragma Import (C, OCSP_parse_url, "OCSP_parse_url");

   function OCSP_id_issuer_cmp (a : access OCSP_CERTID; b : access OCSP_CERTID) return int;  -- openssl/ocsp.h:460
   pragma Import (C, OCSP_id_issuer_cmp, "OCSP_id_issuer_cmp");

   function OCSP_id_cmp (a : access OCSP_CERTID; b : access OCSP_CERTID) return int;  -- openssl/ocsp.h:461
   pragma Import (C, OCSP_id_cmp, "OCSP_id_cmp");

   function OCSP_request_onereq_count (req : access OCSP_REQUEST) return int;  -- openssl/ocsp.h:463
   pragma Import (C, OCSP_request_onereq_count, "OCSP_request_onereq_count");

   function OCSP_request_onereq_get0 (req : access OCSP_REQUEST; i : int) return access OCSP_ONEREQ;  -- openssl/ocsp.h:464
   pragma Import (C, OCSP_request_onereq_get0, "OCSP_request_onereq_get0");

   function OCSP_onereq_get0_id (one : access OCSP_ONEREQ) return access OCSP_CERTID;  -- openssl/ocsp.h:465
   pragma Import (C, OCSP_onereq_get0_id, "OCSP_onereq_get0_id");

   function OCSP_id_get0_info
     (piNameHash : System.Address;
      pmd        : System.Address;
      pikeyHash  : System.Address;
      pserial    : System.Address;
      cid        : access OCSP_CERTID) return int;  -- openssl/ocsp.h:466
   pragma Import (C, OCSP_id_get0_info, "OCSP_id_get0_info");

   function OCSP_request_is_signed (req : access OCSP_REQUEST) return int;  -- openssl/ocsp.h:469
   pragma Import (C, OCSP_request_is_signed, "OCSP_request_is_signed");

   function OCSP_response_create (status : int; bs : access OCSP_BASICRESP) return access OpenSSL.Low_Level.ocsp_h.ocsp_response_st;  -- openssl/ocsp.h:470
   pragma Import (C, OCSP_response_create, "OCSP_response_create");

   function OCSP_basic_add1_status
     (rsp     : access OCSP_BASICRESP;
      cid     : access OCSP_CERTID;
      status  : int;
      reason  : int;
      revtime : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      thisupd : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      nextupd : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return access OCSP_SINGLERESP;  -- openssl/ocsp.h:471
   pragma Import (C, OCSP_basic_add1_status, "OCSP_basic_add1_status");

   function OCSP_basic_add1_cert (resp : access OCSP_BASICRESP; cert : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/ocsp.h:476
   pragma Import (C, OCSP_basic_add1_cert, "OCSP_basic_add1_cert");

   function OCSP_basic_sign
     (brsp   : access OCSP_BASICRESP;
      signer : access OpenSSL.Low_Level.x509_h.x509_st;
      key    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      dgst   : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      certs  : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      flags  : unsigned_long) return int;  -- openssl/ocsp.h:477
   pragma Import (C, OCSP_basic_sign, "OCSP_basic_sign");

   function OCSP_crlID_new
     (url : Interfaces.C.Strings.chars_ptr;
      n   : access long;
      tim : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ocsp.h:481
   pragma Import (C, OCSP_crlID_new, "OCSP_crlID_new");

   function OCSP_accept_responses_new (oids : System.Address) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ocsp.h:483
   pragma Import (C, OCSP_accept_responses_new, "OCSP_accept_responses_new");

   function OCSP_archive_cutoff_new (tim : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ocsp.h:485
   pragma Import (C, OCSP_archive_cutoff_new, "OCSP_archive_cutoff_new");

   function OCSP_url_svcloc_new (issuer : access OpenSSL.Low_Level.x509_h.X509_name_st; urls : System.Address) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ocsp.h:487
   pragma Import (C, OCSP_url_svcloc_new, "OCSP_url_svcloc_new");

   function OCSP_REQUEST_get_ext_count (x : access OCSP_REQUEST) return int;  -- openssl/ocsp.h:489
   pragma Import (C, OCSP_REQUEST_get_ext_count, "OCSP_REQUEST_get_ext_count");

   function OCSP_REQUEST_get_ext_by_NID
     (x       : access OCSP_REQUEST;
      nid     : int;
      lastpos : int) return int;  -- openssl/ocsp.h:490
   pragma Import (C, OCSP_REQUEST_get_ext_by_NID, "OCSP_REQUEST_get_ext_by_NID");

   function OCSP_REQUEST_get_ext_by_OBJ
     (x       : access OCSP_REQUEST;
      obj     : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;
      lastpos : int) return int;  -- openssl/ocsp.h:491
   pragma Import (C, OCSP_REQUEST_get_ext_by_OBJ, "OCSP_REQUEST_get_ext_by_OBJ");

   function OCSP_REQUEST_get_ext_by_critical
     (x       : access OCSP_REQUEST;
      crit    : int;
      lastpos : int) return int;  -- openssl/ocsp.h:492
   pragma Import (C, OCSP_REQUEST_get_ext_by_critical, "OCSP_REQUEST_get_ext_by_critical");

   function OCSP_REQUEST_get_ext (x : access OCSP_REQUEST; loc : int) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ocsp.h:493
   pragma Import (C, OCSP_REQUEST_get_ext, "OCSP_REQUEST_get_ext");

   function OCSP_REQUEST_delete_ext (x : access OCSP_REQUEST; loc : int) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ocsp.h:494
   pragma Import (C, OCSP_REQUEST_delete_ext, "OCSP_REQUEST_delete_ext");

   function OCSP_REQUEST_get1_ext_d2i
     (x    : access OCSP_REQUEST;
      nid  : int;
      crit : access int;
      idx  : access int) return System.Address;  -- openssl/ocsp.h:495
   pragma Import (C, OCSP_REQUEST_get1_ext_d2i, "OCSP_REQUEST_get1_ext_d2i");

   function OCSP_REQUEST_add1_ext_i2d
     (x     : access OCSP_REQUEST;
      nid   : int;
      value : System.Address;
      crit  : int;
      flags : unsigned_long) return int;  -- openssl/ocsp.h:496
   pragma Import (C, OCSP_REQUEST_add1_ext_i2d, "OCSP_REQUEST_add1_ext_i2d");

   function OCSP_REQUEST_add_ext
     (x   : access OCSP_REQUEST;
      ex  : access OpenSSL.Low_Level.x509_h.X509_EXTENSION;
      loc : int) return int;  -- openssl/ocsp.h:498
   pragma Import (C, OCSP_REQUEST_add_ext, "OCSP_REQUEST_add_ext");

   function OCSP_ONEREQ_get_ext_count (x : access OCSP_ONEREQ) return int;  -- openssl/ocsp.h:500
   pragma Import (C, OCSP_ONEREQ_get_ext_count, "OCSP_ONEREQ_get_ext_count");

   function OCSP_ONEREQ_get_ext_by_NID
     (x       : access OCSP_ONEREQ;
      nid     : int;
      lastpos : int) return int;  -- openssl/ocsp.h:501
   pragma Import (C, OCSP_ONEREQ_get_ext_by_NID, "OCSP_ONEREQ_get_ext_by_NID");

   function OCSP_ONEREQ_get_ext_by_OBJ
     (x       : access OCSP_ONEREQ;
      obj     : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;
      lastpos : int) return int;  -- openssl/ocsp.h:502
   pragma Import (C, OCSP_ONEREQ_get_ext_by_OBJ, "OCSP_ONEREQ_get_ext_by_OBJ");

   function OCSP_ONEREQ_get_ext_by_critical
     (x       : access OCSP_ONEREQ;
      crit    : int;
      lastpos : int) return int;  -- openssl/ocsp.h:503
   pragma Import (C, OCSP_ONEREQ_get_ext_by_critical, "OCSP_ONEREQ_get_ext_by_critical");

   function OCSP_ONEREQ_get_ext (x : access OCSP_ONEREQ; loc : int) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ocsp.h:504
   pragma Import (C, OCSP_ONEREQ_get_ext, "OCSP_ONEREQ_get_ext");

   function OCSP_ONEREQ_delete_ext (x : access OCSP_ONEREQ; loc : int) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ocsp.h:505
   pragma Import (C, OCSP_ONEREQ_delete_ext, "OCSP_ONEREQ_delete_ext");

   function OCSP_ONEREQ_get1_ext_d2i
     (x    : access OCSP_ONEREQ;
      nid  : int;
      crit : access int;
      idx  : access int) return System.Address;  -- openssl/ocsp.h:506
   pragma Import (C, OCSP_ONEREQ_get1_ext_d2i, "OCSP_ONEREQ_get1_ext_d2i");

   function OCSP_ONEREQ_add1_ext_i2d
     (x     : access OCSP_ONEREQ;
      nid   : int;
      value : System.Address;
      crit  : int;
      flags : unsigned_long) return int;  -- openssl/ocsp.h:507
   pragma Import (C, OCSP_ONEREQ_add1_ext_i2d, "OCSP_ONEREQ_add1_ext_i2d");

   function OCSP_ONEREQ_add_ext
     (x   : access OCSP_ONEREQ;
      ex  : access OpenSSL.Low_Level.x509_h.X509_EXTENSION;
      loc : int) return int;  -- openssl/ocsp.h:509
   pragma Import (C, OCSP_ONEREQ_add_ext, "OCSP_ONEREQ_add_ext");

   function OCSP_BASICRESP_get_ext_count (x : access OCSP_BASICRESP) return int;  -- openssl/ocsp.h:511
   pragma Import (C, OCSP_BASICRESP_get_ext_count, "OCSP_BASICRESP_get_ext_count");

   function OCSP_BASICRESP_get_ext_by_NID
     (x       : access OCSP_BASICRESP;
      nid     : int;
      lastpos : int) return int;  -- openssl/ocsp.h:512
   pragma Import (C, OCSP_BASICRESP_get_ext_by_NID, "OCSP_BASICRESP_get_ext_by_NID");

   function OCSP_BASICRESP_get_ext_by_OBJ
     (x       : access OCSP_BASICRESP;
      obj     : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;
      lastpos : int) return int;  -- openssl/ocsp.h:513
   pragma Import (C, OCSP_BASICRESP_get_ext_by_OBJ, "OCSP_BASICRESP_get_ext_by_OBJ");

   function OCSP_BASICRESP_get_ext_by_critical
     (x       : access OCSP_BASICRESP;
      crit    : int;
      lastpos : int) return int;  -- openssl/ocsp.h:514
   pragma Import (C, OCSP_BASICRESP_get_ext_by_critical, "OCSP_BASICRESP_get_ext_by_critical");

   function OCSP_BASICRESP_get_ext (x : access OCSP_BASICRESP; loc : int) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ocsp.h:515
   pragma Import (C, OCSP_BASICRESP_get_ext, "OCSP_BASICRESP_get_ext");

   function OCSP_BASICRESP_delete_ext (x : access OCSP_BASICRESP; loc : int) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ocsp.h:516
   pragma Import (C, OCSP_BASICRESP_delete_ext, "OCSP_BASICRESP_delete_ext");

   function OCSP_BASICRESP_get1_ext_d2i
     (x    : access OCSP_BASICRESP;
      nid  : int;
      crit : access int;
      idx  : access int) return System.Address;  -- openssl/ocsp.h:517
   pragma Import (C, OCSP_BASICRESP_get1_ext_d2i, "OCSP_BASICRESP_get1_ext_d2i");

   function OCSP_BASICRESP_add1_ext_i2d
     (x     : access OCSP_BASICRESP;
      nid   : int;
      value : System.Address;
      crit  : int;
      flags : unsigned_long) return int;  -- openssl/ocsp.h:518
   pragma Import (C, OCSP_BASICRESP_add1_ext_i2d, "OCSP_BASICRESP_add1_ext_i2d");

   function OCSP_BASICRESP_add_ext
     (x   : access OCSP_BASICRESP;
      ex  : access OpenSSL.Low_Level.x509_h.X509_EXTENSION;
      loc : int) return int;  -- openssl/ocsp.h:520
   pragma Import (C, OCSP_BASICRESP_add_ext, "OCSP_BASICRESP_add_ext");

   function OCSP_SINGLERESP_get_ext_count (x : access OCSP_SINGLERESP) return int;  -- openssl/ocsp.h:522
   pragma Import (C, OCSP_SINGLERESP_get_ext_count, "OCSP_SINGLERESP_get_ext_count");

   function OCSP_SINGLERESP_get_ext_by_NID
     (x       : access OCSP_SINGLERESP;
      nid     : int;
      lastpos : int) return int;  -- openssl/ocsp.h:523
   pragma Import (C, OCSP_SINGLERESP_get_ext_by_NID, "OCSP_SINGLERESP_get_ext_by_NID");

   function OCSP_SINGLERESP_get_ext_by_OBJ
     (x       : access OCSP_SINGLERESP;
      obj     : access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;
      lastpos : int) return int;  -- openssl/ocsp.h:524
   pragma Import (C, OCSP_SINGLERESP_get_ext_by_OBJ, "OCSP_SINGLERESP_get_ext_by_OBJ");

   function OCSP_SINGLERESP_get_ext_by_critical
     (x       : access OCSP_SINGLERESP;
      crit    : int;
      lastpos : int) return int;  -- openssl/ocsp.h:525
   pragma Import (C, OCSP_SINGLERESP_get_ext_by_critical, "OCSP_SINGLERESP_get_ext_by_critical");

   function OCSP_SINGLERESP_get_ext (x : access OCSP_SINGLERESP; loc : int) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ocsp.h:526
   pragma Import (C, OCSP_SINGLERESP_get_ext, "OCSP_SINGLERESP_get_ext");

   function OCSP_SINGLERESP_delete_ext (x : access OCSP_SINGLERESP; loc : int) return access OpenSSL.Low_Level.x509_h.X509_EXTENSION;  -- openssl/ocsp.h:527
   pragma Import (C, OCSP_SINGLERESP_delete_ext, "OCSP_SINGLERESP_delete_ext");

   function OCSP_SINGLERESP_get1_ext_d2i
     (x    : access OCSP_SINGLERESP;
      nid  : int;
      crit : access int;
      idx  : access int) return System.Address;  -- openssl/ocsp.h:528
   pragma Import (C, OCSP_SINGLERESP_get1_ext_d2i, "OCSP_SINGLERESP_get1_ext_d2i");

   function OCSP_SINGLERESP_add1_ext_i2d
     (x     : access OCSP_SINGLERESP;
      nid   : int;
      value : System.Address;
      crit  : int;
      flags : unsigned_long) return int;  -- openssl/ocsp.h:529
   pragma Import (C, OCSP_SINGLERESP_add1_ext_i2d, "OCSP_SINGLERESP_add1_ext_i2d");

   function OCSP_SINGLERESP_add_ext
     (x   : access OCSP_SINGLERESP;
      ex  : access OpenSSL.Low_Level.x509_h.X509_EXTENSION;
      loc : int) return int;  -- openssl/ocsp.h:531
   pragma Import (C, OCSP_SINGLERESP_add_ext, "OCSP_SINGLERESP_add_ext");

   OCSP_SINGLERESP_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:533
   pragma Import (C, OCSP_SINGLERESP_it, "OCSP_SINGLERESP_it");

   function i2d_OCSP_SINGLERESP (a : access OCSP_SINGLERESP; c_out : System.Address) return int;  -- openssl/ocsp.h:533
   pragma Import (C, i2d_OCSP_SINGLERESP, "i2d_OCSP_SINGLERESP");

   function d2i_OCSP_SINGLERESP
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_SINGLERESP;  -- openssl/ocsp.h:533
   pragma Import (C, d2i_OCSP_SINGLERESP, "d2i_OCSP_SINGLERESP");

   procedure OCSP_SINGLERESP_free (a : access OCSP_SINGLERESP);  -- openssl/ocsp.h:533
   pragma Import (C, OCSP_SINGLERESP_free, "OCSP_SINGLERESP_free");

   function OCSP_SINGLERESP_new return access OCSP_SINGLERESP;  -- openssl/ocsp.h:533
   pragma Import (C, OCSP_SINGLERESP_new, "OCSP_SINGLERESP_new");

   OCSP_CERTSTATUS_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:534
   pragma Import (C, OCSP_CERTSTATUS_it, "OCSP_CERTSTATUS_it");

   function i2d_OCSP_CERTSTATUS (a : access OCSP_CERTSTATUS; c_out : System.Address) return int;  -- openssl/ocsp.h:534
   pragma Import (C, i2d_OCSP_CERTSTATUS, "i2d_OCSP_CERTSTATUS");

   function d2i_OCSP_CERTSTATUS
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_CERTSTATUS;  -- openssl/ocsp.h:534
   pragma Import (C, d2i_OCSP_CERTSTATUS, "d2i_OCSP_CERTSTATUS");

   procedure OCSP_CERTSTATUS_free (a : access OCSP_CERTSTATUS);  -- openssl/ocsp.h:534
   pragma Import (C, OCSP_CERTSTATUS_free, "OCSP_CERTSTATUS_free");

   function OCSP_CERTSTATUS_new return access OCSP_CERTSTATUS;  -- openssl/ocsp.h:534
   pragma Import (C, OCSP_CERTSTATUS_new, "OCSP_CERTSTATUS_new");

   OCSP_REVOKEDINFO_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:535
   pragma Import (C, OCSP_REVOKEDINFO_it, "OCSP_REVOKEDINFO_it");

   function i2d_OCSP_REVOKEDINFO (a : access OCSP_REVOKEDINFO; c_out : System.Address) return int;  -- openssl/ocsp.h:535
   pragma Import (C, i2d_OCSP_REVOKEDINFO, "i2d_OCSP_REVOKEDINFO");

   function d2i_OCSP_REVOKEDINFO
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_REVOKEDINFO;  -- openssl/ocsp.h:535
   pragma Import (C, d2i_OCSP_REVOKEDINFO, "d2i_OCSP_REVOKEDINFO");

   procedure OCSP_REVOKEDINFO_free (a : access OCSP_REVOKEDINFO);  -- openssl/ocsp.h:535
   pragma Import (C, OCSP_REVOKEDINFO_free, "OCSP_REVOKEDINFO_free");

   function OCSP_REVOKEDINFO_new return access OCSP_REVOKEDINFO;  -- openssl/ocsp.h:535
   pragma Import (C, OCSP_REVOKEDINFO_new, "OCSP_REVOKEDINFO_new");

   OCSP_BASICRESP_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:536
   pragma Import (C, OCSP_BASICRESP_it, "OCSP_BASICRESP_it");

   function i2d_OCSP_BASICRESP (a : access OCSP_BASICRESP; c_out : System.Address) return int;  -- openssl/ocsp.h:536
   pragma Import (C, i2d_OCSP_BASICRESP, "i2d_OCSP_BASICRESP");

   function d2i_OCSP_BASICRESP
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_BASICRESP;  -- openssl/ocsp.h:536
   pragma Import (C, d2i_OCSP_BASICRESP, "d2i_OCSP_BASICRESP");

   procedure OCSP_BASICRESP_free (a : access OCSP_BASICRESP);  -- openssl/ocsp.h:536
   pragma Import (C, OCSP_BASICRESP_free, "OCSP_BASICRESP_free");

   function OCSP_BASICRESP_new return access OCSP_BASICRESP;  -- openssl/ocsp.h:536
   pragma Import (C, OCSP_BASICRESP_new, "OCSP_BASICRESP_new");

   OCSP_RESPDATA_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:537
   pragma Import (C, OCSP_RESPDATA_it, "OCSP_RESPDATA_it");

   function i2d_OCSP_RESPDATA (a : access OCSP_RESPDATA; c_out : System.Address) return int;  -- openssl/ocsp.h:537
   pragma Import (C, i2d_OCSP_RESPDATA, "i2d_OCSP_RESPDATA");

   function d2i_OCSP_RESPDATA
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_RESPDATA;  -- openssl/ocsp.h:537
   pragma Import (C, d2i_OCSP_RESPDATA, "d2i_OCSP_RESPDATA");

   procedure OCSP_RESPDATA_free (a : access OCSP_RESPDATA);  -- openssl/ocsp.h:537
   pragma Import (C, OCSP_RESPDATA_free, "OCSP_RESPDATA_free");

   function OCSP_RESPDATA_new return access OCSP_RESPDATA;  -- openssl/ocsp.h:537
   pragma Import (C, OCSP_RESPDATA_new, "OCSP_RESPDATA_new");

   OCSP_RESPID_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:538
   pragma Import (C, OCSP_RESPID_it, "OCSP_RESPID_it");

   function i2d_OCSP_RESPID (a : access OpenSSL.Low_Level.ocsp_h.ocsp_responder_id_st; c_out : System.Address) return int;  -- openssl/ocsp.h:538
   pragma Import (C, i2d_OCSP_RESPID, "i2d_OCSP_RESPID");

   function d2i_OCSP_RESPID
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.ocsp_h.ocsp_responder_id_st;  -- openssl/ocsp.h:538
   pragma Import (C, d2i_OCSP_RESPID, "d2i_OCSP_RESPID");

   procedure OCSP_RESPID_free (a : access OpenSSL.Low_Level.ocsp_h.ocsp_responder_id_st);  -- openssl/ocsp.h:538
   pragma Import (C, OCSP_RESPID_free, "OCSP_RESPID_free");

   function OCSP_RESPID_new return access OpenSSL.Low_Level.ocsp_h.ocsp_responder_id_st;  -- openssl/ocsp.h:538
   pragma Import (C, OCSP_RESPID_new, "OCSP_RESPID_new");

   OCSP_RESPONSE_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:539
   pragma Import (C, OCSP_RESPONSE_it, "OCSP_RESPONSE_it");

   function i2d_OCSP_RESPONSE (a : access OpenSSL.Low_Level.ocsp_h.ocsp_response_st; c_out : System.Address) return int;  -- openssl/ocsp.h:539
   pragma Import (C, i2d_OCSP_RESPONSE, "i2d_OCSP_RESPONSE");

   function d2i_OCSP_RESPONSE
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.ocsp_h.ocsp_response_st;  -- openssl/ocsp.h:539
   pragma Import (C, d2i_OCSP_RESPONSE, "d2i_OCSP_RESPONSE");

   procedure OCSP_RESPONSE_free (a : access OpenSSL.Low_Level.ocsp_h.ocsp_response_st);  -- openssl/ocsp.h:539
   pragma Import (C, OCSP_RESPONSE_free, "OCSP_RESPONSE_free");

   function OCSP_RESPONSE_new return access OpenSSL.Low_Level.ocsp_h.ocsp_response_st;  -- openssl/ocsp.h:539
   pragma Import (C, OCSP_RESPONSE_new, "OCSP_RESPONSE_new");

   OCSP_RESPBYTES_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:540
   pragma Import (C, OCSP_RESPBYTES_it, "OCSP_RESPBYTES_it");

   function i2d_OCSP_RESPBYTES (a : access OCSP_RESPBYTES; c_out : System.Address) return int;  -- openssl/ocsp.h:540
   pragma Import (C, i2d_OCSP_RESPBYTES, "i2d_OCSP_RESPBYTES");

   function d2i_OCSP_RESPBYTES
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_RESPBYTES;  -- openssl/ocsp.h:540
   pragma Import (C, d2i_OCSP_RESPBYTES, "d2i_OCSP_RESPBYTES");

   procedure OCSP_RESPBYTES_free (a : access OCSP_RESPBYTES);  -- openssl/ocsp.h:540
   pragma Import (C, OCSP_RESPBYTES_free, "OCSP_RESPBYTES_free");

   function OCSP_RESPBYTES_new return access OCSP_RESPBYTES;  -- openssl/ocsp.h:540
   pragma Import (C, OCSP_RESPBYTES_new, "OCSP_RESPBYTES_new");

   OCSP_ONEREQ_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:541
   pragma Import (C, OCSP_ONEREQ_it, "OCSP_ONEREQ_it");

   function i2d_OCSP_ONEREQ (a : access OCSP_ONEREQ; c_out : System.Address) return int;  -- openssl/ocsp.h:541
   pragma Import (C, i2d_OCSP_ONEREQ, "i2d_OCSP_ONEREQ");

   function d2i_OCSP_ONEREQ
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_ONEREQ;  -- openssl/ocsp.h:541
   pragma Import (C, d2i_OCSP_ONEREQ, "d2i_OCSP_ONEREQ");

   procedure OCSP_ONEREQ_free (a : access OCSP_ONEREQ);  -- openssl/ocsp.h:541
   pragma Import (C, OCSP_ONEREQ_free, "OCSP_ONEREQ_free");

   function OCSP_ONEREQ_new return access OCSP_ONEREQ;  -- openssl/ocsp.h:541
   pragma Import (C, OCSP_ONEREQ_new, "OCSP_ONEREQ_new");

   OCSP_CERTID_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:542
   pragma Import (C, OCSP_CERTID_it, "OCSP_CERTID_it");

   function i2d_OCSP_CERTID (a : access OCSP_CERTID; c_out : System.Address) return int;  -- openssl/ocsp.h:542
   pragma Import (C, i2d_OCSP_CERTID, "i2d_OCSP_CERTID");

   function d2i_OCSP_CERTID
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_CERTID;  -- openssl/ocsp.h:542
   pragma Import (C, d2i_OCSP_CERTID, "d2i_OCSP_CERTID");

   procedure OCSP_CERTID_free (a : access OCSP_CERTID);  -- openssl/ocsp.h:542
   pragma Import (C, OCSP_CERTID_free, "OCSP_CERTID_free");

   function OCSP_CERTID_new return access OCSP_CERTID;  -- openssl/ocsp.h:542
   pragma Import (C, OCSP_CERTID_new, "OCSP_CERTID_new");

   OCSP_REQUEST_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:543
   pragma Import (C, OCSP_REQUEST_it, "OCSP_REQUEST_it");

   function i2d_OCSP_REQUEST (a : access OCSP_REQUEST; c_out : System.Address) return int;  -- openssl/ocsp.h:543
   pragma Import (C, i2d_OCSP_REQUEST, "i2d_OCSP_REQUEST");

   function d2i_OCSP_REQUEST
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_REQUEST;  -- openssl/ocsp.h:543
   pragma Import (C, d2i_OCSP_REQUEST, "d2i_OCSP_REQUEST");

   procedure OCSP_REQUEST_free (a : access OCSP_REQUEST);  -- openssl/ocsp.h:543
   pragma Import (C, OCSP_REQUEST_free, "OCSP_REQUEST_free");

   function OCSP_REQUEST_new return access OCSP_REQUEST;  -- openssl/ocsp.h:543
   pragma Import (C, OCSP_REQUEST_new, "OCSP_REQUEST_new");

   OCSP_SIGNATURE_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:544
   pragma Import (C, OCSP_SIGNATURE_it, "OCSP_SIGNATURE_it");

   function i2d_OCSP_SIGNATURE (a : access OCSP_SIGNATURE; c_out : System.Address) return int;  -- openssl/ocsp.h:544
   pragma Import (C, i2d_OCSP_SIGNATURE, "i2d_OCSP_SIGNATURE");

   function d2i_OCSP_SIGNATURE
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_SIGNATURE;  -- openssl/ocsp.h:544
   pragma Import (C, d2i_OCSP_SIGNATURE, "d2i_OCSP_SIGNATURE");

   procedure OCSP_SIGNATURE_free (a : access OCSP_SIGNATURE);  -- openssl/ocsp.h:544
   pragma Import (C, OCSP_SIGNATURE_free, "OCSP_SIGNATURE_free");

   function OCSP_SIGNATURE_new return access OCSP_SIGNATURE;  -- openssl/ocsp.h:544
   pragma Import (C, OCSP_SIGNATURE_new, "OCSP_SIGNATURE_new");

   OCSP_REQINFO_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:545
   pragma Import (C, OCSP_REQINFO_it, "OCSP_REQINFO_it");

   function i2d_OCSP_REQINFO (a : access OCSP_REQINFO; c_out : System.Address) return int;  -- openssl/ocsp.h:545
   pragma Import (C, i2d_OCSP_REQINFO, "i2d_OCSP_REQINFO");

   function d2i_OCSP_REQINFO
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_REQINFO;  -- openssl/ocsp.h:545
   pragma Import (C, d2i_OCSP_REQINFO, "d2i_OCSP_REQINFO");

   procedure OCSP_REQINFO_free (a : access OCSP_REQINFO);  -- openssl/ocsp.h:545
   pragma Import (C, OCSP_REQINFO_free, "OCSP_REQINFO_free");

   function OCSP_REQINFO_new return access OCSP_REQINFO;  -- openssl/ocsp.h:545
   pragma Import (C, OCSP_REQINFO_new, "OCSP_REQINFO_new");

   OCSP_CRLID_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:546
   pragma Import (C, OCSP_CRLID_it, "OCSP_CRLID_it");

   function i2d_OCSP_CRLID (a : access OCSP_CRLID; c_out : System.Address) return int;  -- openssl/ocsp.h:546
   pragma Import (C, i2d_OCSP_CRLID, "i2d_OCSP_CRLID");

   function d2i_OCSP_CRLID
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_CRLID;  -- openssl/ocsp.h:546
   pragma Import (C, d2i_OCSP_CRLID, "d2i_OCSP_CRLID");

   procedure OCSP_CRLID_free (a : access OCSP_CRLID);  -- openssl/ocsp.h:546
   pragma Import (C, OCSP_CRLID_free, "OCSP_CRLID_free");

   function OCSP_CRLID_new return access OCSP_CRLID;  -- openssl/ocsp.h:546
   pragma Import (C, OCSP_CRLID_new, "OCSP_CRLID_new");

   OCSP_SERVICELOC_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/ocsp.h:547
   pragma Import (C, OCSP_SERVICELOC_it, "OCSP_SERVICELOC_it");

   function i2d_OCSP_SERVICELOC (a : access OCSP_SERVICELOC; c_out : System.Address) return int;  -- openssl/ocsp.h:547
   pragma Import (C, i2d_OCSP_SERVICELOC, "i2d_OCSP_SERVICELOC");

   function d2i_OCSP_SERVICELOC
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OCSP_SERVICELOC;  -- openssl/ocsp.h:547
   pragma Import (C, d2i_OCSP_SERVICELOC, "d2i_OCSP_SERVICELOC");

   procedure OCSP_SERVICELOC_free (a : access OCSP_SERVICELOC);  -- openssl/ocsp.h:547
   pragma Import (C, OCSP_SERVICELOC_free, "OCSP_SERVICELOC_free");

   function OCSP_SERVICELOC_new return access OCSP_SERVICELOC;  -- openssl/ocsp.h:547
   pragma Import (C, OCSP_SERVICELOC_new, "OCSP_SERVICELOC_new");

   function OCSP_response_status_str (s : long) return Interfaces.C.Strings.chars_ptr;  -- openssl/ocsp.h:549
   pragma Import (C, OCSP_response_status_str, "OCSP_response_status_str");

   function OCSP_cert_status_str (s : long) return Interfaces.C.Strings.chars_ptr;  -- openssl/ocsp.h:550
   pragma Import (C, OCSP_cert_status_str, "OCSP_cert_status_str");

   function OCSP_crl_reason_str (s : long) return Interfaces.C.Strings.chars_ptr;  -- openssl/ocsp.h:551
   pragma Import (C, OCSP_crl_reason_str, "OCSP_crl_reason_str");

   function OCSP_REQUEST_print
     (bp    : access OpenSSL.Low_Level.bio_h.bio_st;
      a     : access OCSP_REQUEST;
      flags : unsigned_long) return int;  -- openssl/ocsp.h:553
   pragma Import (C, OCSP_REQUEST_print, "OCSP_REQUEST_print");

   function OCSP_RESPONSE_print
     (bp    : access OpenSSL.Low_Level.bio_h.bio_st;
      o     : access OpenSSL.Low_Level.ocsp_h.ocsp_response_st;
      flags : unsigned_long) return int;  -- openssl/ocsp.h:554
   pragma Import (C, OCSP_RESPONSE_print, "OCSP_RESPONSE_print");

   function OCSP_basic_verify
     (bs    : access OCSP_BASICRESP;
      certs : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      st    : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;
      flags : unsigned_long) return int;  -- openssl/ocsp.h:556
   pragma Import (C, OCSP_basic_verify, "OCSP_basic_verify");

   procedure ERR_load_OCSP_strings;  -- openssl/ocsp.h:563
   pragma Import (C, ERR_load_OCSP_strings, "ERR_load_OCSP_strings");

end OpenSSL.Low_Level.ocsp_h;
