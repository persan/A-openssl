with Interfaces.C; use Interfaces.C;
with OpenSSL.Low_Level.stack_h;
with OpenSSL.Low_Level.asn1_h;
with System;
with OpenSSL.Low_Level.bio_h;
with Interfaces.C.Strings;
with OpenSSL.Low_Level.x509_h;
with Interfaces.C_Streams;
with OpenSSL.Low_Level.evp_h;
with OpenSSL.Low_Level.x509_vfy_h;
with OpenSSL.Low_Level.asn1t_h;
--  with stddef_h;

package OpenSSL.Low_Level.cms_h is

   package defs is

      CMS_SIGNERINFO_ISSUER_SERIAL : constant := 0;  --  openssl/cms.h:83
      CMS_SIGNERINFO_KEYIDENTIFIER : constant := 1;  --  openssl/cms.h:84

      CMS_RECIPINFO_TRANS          : constant := 0;  --  openssl/cms.h:86
      CMS_RECIPINFO_AGREE          : constant := 1;  --  openssl/cms.h:87
      CMS_RECIPINFO_KEK            : constant := 2;  --  openssl/cms.h:88
      CMS_RECIPINFO_PASS           : constant := 3;  --  openssl/cms.h:89
      CMS_RECIPINFO_OTHER          : constant := 4;  --  openssl/cms.h:90

      CMS_TEXT                     : constant := 16#1#;  --  openssl/cms.h:94
      CMS_NOCERTS                  : constant := 16#2#;  --  openssl/cms.h:95
      CMS_NO_CONTENT_VERIFY        : constant := 16#4#;  --  openssl/cms.h:96
      CMS_NO_ATTR_VERIFY           : constant := 16#8#;  --  openssl/cms.h:97
      --  unsupported macro: CMS_NOSIGS (CMS_NO_CONTENT_VERIFY|CMS_NO_ATTR_VERIFY)

      CMS_NOINTERN                 : constant := 16#10#;  --  openssl/cms.h:100
      CMS_NO_SIGNER_CERT_VERIFY    : constant := 16#20#;  --  openssl/cms.h:101
      CMS_NOVERIFY                 : constant := 16#20#;  --  openssl/cms.h:102
      CMS_DETACHED                 : constant := 16#40#;  --  openssl/cms.h:103
      CMS_BINARY                   : constant := 16#80#;  --  openssl/cms.h:104
      CMS_NOATTR                   : constant := 16#100#;  --  openssl/cms.h:105
      CMS_NOSMIMECAP               : constant := 16#200#;  --  openssl/cms.h:106
      CMS_NOOLDMIMETYPE            : constant := 16#400#;  --  openssl/cms.h:107
      CMS_CRLFEOL                  : constant := 16#800#;  --  openssl/cms.h:108
      CMS_STREAM                   : constant := 16#1000#;  --  openssl/cms.h:109
      CMS_NOCRL                    : constant := 16#2000#;  --  openssl/cms.h:110
      CMS_PARTIAL                  : constant := 16#4000#;  --  openssl/cms.h:111
      CMS_REUSE_DIGEST             : constant := 16#8000#;  --  openssl/cms.h:112
      CMS_USE_KEYID                : constant := 16#10000#;  --  openssl/cms.h:113

      CMS_F_CHECK_CONTENT          : constant := 99;  --  openssl/cms.h:330
      CMS_F_CMS_ADD0_CERT          : constant := 164;  --  openssl/cms.h:331
      CMS_F_CMS_ADD0_RECIPIENT_KEY : constant := 100;  --  openssl/cms.h:332
      CMS_F_CMS_ADD1_RECEIPTREQUEST : constant := 158;  --  openssl/cms.h:333
      CMS_F_CMS_ADD1_RECIPIENT_CERT : constant := 101;  --  openssl/cms.h:334
      CMS_F_CMS_ADD1_SIGNER        : constant := 102;  --  openssl/cms.h:335
      CMS_F_CMS_ADD1_SIGNINGTIME   : constant := 103;  --  openssl/cms.h:336
      CMS_F_CMS_COMPRESS           : constant := 104;  --  openssl/cms.h:337
      CMS_F_CMS_COMPRESSEDDATA_CREATE : constant := 105;  --  openssl/cms.h:338
      CMS_F_CMS_COMPRESSEDDATA_INIT_BIO : constant := 106;  --  openssl/cms.h:339
      CMS_F_CMS_COPY_CONTENT       : constant := 107;  --  openssl/cms.h:340
      CMS_F_CMS_COPY_MESSAGEDIGEST : constant := 108;  --  openssl/cms.h:341
      CMS_F_CMS_DATA               : constant := 109;  --  openssl/cms.h:342
      CMS_F_CMS_DATAFINAL          : constant := 110;  --  openssl/cms.h:343
      CMS_F_CMS_DATAINIT           : constant := 111;  --  openssl/cms.h:344
      CMS_F_CMS_DECRYPT            : constant := 112;  --  openssl/cms.h:345
      CMS_F_CMS_DECRYPT_SET1_KEY   : constant := 113;  --  openssl/cms.h:346
      CMS_F_CMS_DECRYPT_SET1_PKEY  : constant := 114;  --  openssl/cms.h:347
      CMS_F_CMS_DIGESTALGORITHM_FIND_CTX : constant := 115;  --  openssl/cms.h:348
      CMS_F_CMS_DIGESTALGORITHM_INIT_BIO : constant := 116;  --  openssl/cms.h:349
      CMS_F_CMS_DIGESTEDDATA_DO_FINAL : constant := 117;  --  openssl/cms.h:350
      CMS_F_CMS_DIGEST_VERIFY      : constant := 118;  --  openssl/cms.h:351
      CMS_F_CMS_ENCODE_RECEIPT     : constant := 161;  --  openssl/cms.h:352
      CMS_F_CMS_ENCRYPT            : constant := 119;  --  openssl/cms.h:353
      CMS_F_CMS_ENCRYPTEDCONTENT_INIT_BIO : constant := 120;  --  openssl/cms.h:354
      CMS_F_CMS_ENCRYPTEDDATA_DECRYPT : constant := 121;  --  openssl/cms.h:355
      CMS_F_CMS_ENCRYPTEDDATA_ENCRYPT : constant := 122;  --  openssl/cms.h:356
      CMS_F_CMS_ENCRYPTEDDATA_SET1_KEY : constant := 123;  --  openssl/cms.h:357
      CMS_F_CMS_ENVELOPEDDATA_CREATE : constant := 124;  --  openssl/cms.h:358
      CMS_F_CMS_ENVELOPEDDATA_INIT_BIO : constant := 125;  --  openssl/cms.h:359
      CMS_F_CMS_ENVELOPED_DATA_INIT : constant := 126;  --  openssl/cms.h:360
      CMS_F_CMS_FINAL              : constant := 127;  --  openssl/cms.h:361
      CMS_F_CMS_GET0_CERTIFICATE_CHOICES : constant := 128;  --  openssl/cms.h:362
      CMS_F_CMS_GET0_CONTENT       : constant := 129;  --  openssl/cms.h:363
      CMS_F_CMS_GET0_ECONTENT_TYPE : constant := 130;  --  openssl/cms.h:364
      CMS_F_CMS_GET0_ENVELOPED     : constant := 131;  --  openssl/cms.h:365
      CMS_F_CMS_GET0_REVOCATION_CHOICES : constant := 132;  --  openssl/cms.h:366
      CMS_F_CMS_GET0_SIGNED        : constant := 133;  --  openssl/cms.h:367
      CMS_F_CMS_MSGSIGDIGEST_ADD1  : constant := 162;  --  openssl/cms.h:368
      CMS_F_CMS_RECEIPTREQUEST_CREATE0 : constant := 159;  --  openssl/cms.h:369
      CMS_F_CMS_RECEIPT_VERIFY     : constant := 160;  --  openssl/cms.h:370
      CMS_F_CMS_RECIPIENTINFO_DECRYPT : constant := 134;  --  openssl/cms.h:371
      CMS_F_CMS_RECIPIENTINFO_KEKRI_DECRYPT : constant := 135;  --  openssl/cms.h:372
      CMS_F_CMS_RECIPIENTINFO_KEKRI_ENCRYPT : constant := 136;  --  openssl/cms.h:373
      CMS_F_CMS_RECIPIENTINFO_KEKRI_GET0_ID : constant := 137;  --  openssl/cms.h:374
      CMS_F_CMS_RECIPIENTINFO_KEKRI_ID_CMP : constant := 138;  --  openssl/cms.h:375
      CMS_F_CMS_RECIPIENTINFO_KTRI_CERT_CMP : constant := 139;  --  openssl/cms.h:376
      CMS_F_CMS_RECIPIENTINFO_KTRI_DECRYPT : constant := 140;  --  openssl/cms.h:377
      CMS_F_CMS_RECIPIENTINFO_KTRI_ENCRYPT : constant := 141;  --  openssl/cms.h:378
      CMS_F_CMS_RECIPIENTINFO_KTRI_GET0_ALGS : constant := 142;  --  openssl/cms.h:379
      CMS_F_CMS_RECIPIENTINFO_KTRI_GET0_SIGNER_ID : constant := 143;  --  openssl/cms.h:380
      CMS_F_CMS_RECIPIENTINFO_SET0_KEY : constant := 144;  --  openssl/cms.h:381
      CMS_F_CMS_RECIPIENTINFO_SET0_PKEY : constant := 145;  --  openssl/cms.h:382
      CMS_F_CMS_SET1_SIGNERIDENTIFIER : constant := 146;  --  openssl/cms.h:383
      CMS_F_CMS_SET_DETACHED       : constant := 147;  --  openssl/cms.h:384
      CMS_F_CMS_SIGN               : constant := 148;  --  openssl/cms.h:385
      CMS_F_CMS_SIGNED_DATA_INIT   : constant := 149;  --  openssl/cms.h:386
      CMS_F_CMS_SIGNERINFO_CONTENT_SIGN : constant := 150;  --  openssl/cms.h:387
      CMS_F_CMS_SIGNERINFO_SIGN    : constant := 151;  --  openssl/cms.h:388
      CMS_F_CMS_SIGNERINFO_VERIFY  : constant := 152;  --  openssl/cms.h:389
      CMS_F_CMS_SIGNERINFO_VERIFY_CERT : constant := 153;  --  openssl/cms.h:390
      CMS_F_CMS_SIGNERINFO_VERIFY_CONTENT : constant := 154;  --  openssl/cms.h:391
      CMS_F_CMS_SIGN_RECEIPT       : constant := 163;  --  openssl/cms.h:392
      CMS_F_CMS_STREAM             : constant := 155;  --  openssl/cms.h:393
      CMS_F_CMS_UNCOMPRESS         : constant := 156;  --  openssl/cms.h:394
      CMS_F_CMS_VERIFY             : constant := 157;  --  openssl/cms.h:395

      CMS_R_ADD_SIGNER_ERROR       : constant := 99;  --  openssl/cms.h:398
      CMS_R_CERTIFICATE_ALREADY_PRESENT : constant := 175;  --  openssl/cms.h:399
      CMS_R_CERTIFICATE_HAS_NO_KEYID : constant := 160;  --  openssl/cms.h:400
      CMS_R_CERTIFICATE_VERIFY_ERROR : constant := 100;  --  openssl/cms.h:401
      CMS_R_CIPHER_INITIALISATION_ERROR : constant := 101;  --  openssl/cms.h:402
      CMS_R_CIPHER_PARAMETER_INITIALISATION_ERROR : constant := 102;  --  openssl/cms.h:403
      CMS_R_CMS_DATAFINAL_ERROR    : constant := 103;  --  openssl/cms.h:404
      CMS_R_CMS_LIB                : constant := 104;  --  openssl/cms.h:405
      CMS_R_CONTENTIDENTIFIER_MISMATCH : constant := 170;  --  openssl/cms.h:406
      CMS_R_CONTENT_NOT_FOUND      : constant := 105;  --  openssl/cms.h:407
      CMS_R_CONTENT_TYPE_MISMATCH  : constant := 171;  --  openssl/cms.h:408
      CMS_R_CONTENT_TYPE_NOT_COMPRESSED_DATA : constant := 106;  --  openssl/cms.h:409
      CMS_R_CONTENT_TYPE_NOT_ENVELOPED_DATA : constant := 107;  --  openssl/cms.h:410
      CMS_R_CONTENT_TYPE_NOT_SIGNED_DATA : constant := 108;  --  openssl/cms.h:411
      CMS_R_CONTENT_VERIFY_ERROR   : constant := 109;  --  openssl/cms.h:412
      CMS_R_CTRL_ERROR             : constant := 110;  --  openssl/cms.h:413
      CMS_R_CTRL_FAILURE           : constant := 111;  --  openssl/cms.h:414
      CMS_R_DECRYPT_ERROR          : constant := 112;  --  openssl/cms.h:415
      CMS_R_DIGEST_ERROR           : constant := 161;  --  openssl/cms.h:416
      CMS_R_ERROR_GETTING_PUBLIC_KEY : constant := 113;  --  openssl/cms.h:417
      CMS_R_ERROR_READING_MESSAGEDIGEST_ATTRIBUTE : constant := 114;  --  openssl/cms.h:418
      CMS_R_ERROR_SETTING_KEY      : constant := 115;  --  openssl/cms.h:419
      CMS_R_ERROR_SETTING_RECIPIENTINFO : constant := 116;  --  openssl/cms.h:420
      CMS_R_INVALID_ENCRYPTED_KEY_LENGTH : constant := 117;  --  openssl/cms.h:421
      CMS_R_INVALID_KEY_LENGTH     : constant := 118;  --  openssl/cms.h:422
      CMS_R_MD_BIO_INIT_ERROR      : constant := 119;  --  openssl/cms.h:423
      CMS_R_MESSAGEDIGEST_ATTRIBUTE_WRONG_LENGTH : constant := 120;  --  openssl/cms.h:424
      CMS_R_MESSAGEDIGEST_WRONG_LENGTH : constant := 121;  --  openssl/cms.h:425
      CMS_R_MSGSIGDIGEST_ERROR     : constant := 172;  --  openssl/cms.h:426
      CMS_R_MSGSIGDIGEST_VERIFICATION_FAILURE : constant := 162;  --  openssl/cms.h:427
      CMS_R_MSGSIGDIGEST_WRONG_LENGTH : constant := 163;  --  openssl/cms.h:428
      CMS_R_NEED_ONE_SIGNER        : constant := 164;  --  openssl/cms.h:429
      CMS_R_NOT_A_SIGNED_RECEIPT   : constant := 165;  --  openssl/cms.h:430
      CMS_R_NOT_ENCRYPTED_DATA     : constant := 122;  --  openssl/cms.h:431
      CMS_R_NOT_KEK                : constant := 123;  --  openssl/cms.h:432
      CMS_R_NOT_KEY_TRANSPORT      : constant := 124;  --  openssl/cms.h:433
      CMS_R_NOT_SUPPORTED_FOR_THIS_KEY_TYPE : constant := 125;  --  openssl/cms.h:434
      CMS_R_NO_CIPHER              : constant := 126;  --  openssl/cms.h:435
      CMS_R_NO_CONTENT             : constant := 127;  --  openssl/cms.h:436
      CMS_R_NO_CONTENT_TYPE        : constant := 173;  --  openssl/cms.h:437
      CMS_R_NO_DEFAULT_DIGEST      : constant := 128;  --  openssl/cms.h:438
      CMS_R_NO_DIGEST_SET          : constant := 129;  --  openssl/cms.h:439
      CMS_R_NO_KEY                 : constant := 130;  --  openssl/cms.h:440
      CMS_R_NO_KEY_OR_CERT         : constant := 174;  --  openssl/cms.h:441
      CMS_R_NO_MATCHING_DIGEST     : constant := 131;  --  openssl/cms.h:442
      CMS_R_NO_MATCHING_RECIPIENT  : constant := 132;  --  openssl/cms.h:443
      CMS_R_NO_MATCHING_SIGNATURE  : constant := 166;  --  openssl/cms.h:444
      CMS_R_NO_MSGSIGDIGEST        : constant := 167;  --  openssl/cms.h:445
      CMS_R_NO_PRIVATE_KEY         : constant := 133;  --  openssl/cms.h:446
      CMS_R_NO_PUBLIC_KEY          : constant := 134;  --  openssl/cms.h:447
      CMS_R_NO_RECEIPT_REQUEST     : constant := 168;  --  openssl/cms.h:448
      CMS_R_NO_SIGNERS             : constant := 135;  --  openssl/cms.h:449
      CMS_R_PRIVATE_KEY_DOES_NOT_MATCH_CERTIFICATE : constant := 136;  --  openssl/cms.h:450
      CMS_R_RECEIPT_DECODE_ERROR   : constant := 169;  --  openssl/cms.h:451
      CMS_R_RECIPIENT_ERROR        : constant := 137;  --  openssl/cms.h:452
      CMS_R_SIGNER_CERTIFICATE_NOT_FOUND : constant := 138;  --  openssl/cms.h:453
      CMS_R_SIGNFINAL_ERROR        : constant := 139;  --  openssl/cms.h:454
      CMS_R_SMIME_TEXT_ERROR       : constant := 140;  --  openssl/cms.h:455
      CMS_R_STORE_INIT_ERROR       : constant := 141;  --  openssl/cms.h:456
      CMS_R_TYPE_NOT_COMPRESSED_DATA : constant := 142;  --  openssl/cms.h:457
      CMS_R_TYPE_NOT_DATA          : constant := 143;  --  openssl/cms.h:458
      CMS_R_TYPE_NOT_DIGESTED_DATA : constant := 144;  --  openssl/cms.h:459
      CMS_R_TYPE_NOT_ENCRYPTED_DATA : constant := 145;  --  openssl/cms.h:460
      CMS_R_TYPE_NOT_ENVELOPED_DATA : constant := 146;  --  openssl/cms.h:461
      CMS_R_UNABLE_TO_FINALIZE_CONTEXT : constant := 147;  --  openssl/cms.h:462
      CMS_R_UNKNOWN_CIPHER         : constant := 148;  --  openssl/cms.h:463
      CMS_R_UNKNOWN_DIGEST_ALGORIHM : constant := 149;  --  openssl/cms.h:464
      CMS_R_UNKNOWN_ID             : constant := 150;  --  openssl/cms.h:465
      CMS_R_UNSUPPORTED_COMPRESSION_ALGORITHM : constant := 151;  --  openssl/cms.h:466
      CMS_R_UNSUPPORTED_CONTENT_TYPE : constant := 152;  --  openssl/cms.h:467
      CMS_R_UNSUPPORTED_KEK_ALGORITHM : constant := 153;  --  openssl/cms.h:468
      CMS_R_UNSUPPORTED_RECIPIENT_TYPE : constant := 154;  --  openssl/cms.h:469
      CMS_R_UNSUPPORTED_RECPIENTINFO_TYPE : constant := 155;  --  openssl/cms.h:470
      CMS_R_UNSUPPORTED_TYPE       : constant := 156;  --  openssl/cms.h:471
      CMS_R_UNWRAP_ERROR           : constant := 157;  --  openssl/cms.h:472
      CMS_R_VERIFICATION_FAILURE   : constant := 158;  --  openssl/cms.h:473
      CMS_R_WRAP_ERROR             : constant := 159;  --  openssl/cms.h:474

      --  skipped empty struct CMS_ContentInfo_st

      --  skipped empty struct CMS_ContentInfo

      --  skipped empty struct CMS_SignerInfo_st

      --  skipped empty struct CMS_SignerInfo

      --  skipped empty struct CMS_CertificateChoices

      --  skipped empty struct CMS_RevocationInfoChoice_st

      --  skipped empty struct CMS_RevocationInfoChoice

      --  skipped empty struct CMS_RecipientInfo_st

      --  skipped empty struct CMS_RecipientInfo

      --  skipped empty struct CMS_ReceiptRequest_st

      --  skipped empty struct CMS_ReceiptRequest

      --  skipped empty struct CMS_Receipt_st

      --  skipped empty struct CMS_Receipt
   end defs;
   type stack_st_CMS_SignerInfo is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/cms.h:77
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_CMS_SignerInfo);  -- openssl/cms.h:77

   type stack_st_GENERAL_NAMES is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/cms.h:78
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_GENERAL_NAMES);  -- openssl/cms.h:78

   CMS_ContentInfo_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/cms.h:79
   pragma Import (C, CMS_ContentInfo_it, "CMS_ContentInfo_it");

   function i2d_CMS_ContentInfo (a : System.Address; c_out : System.Address) return int;  -- openssl/cms.h:79
   pragma Import (C, i2d_CMS_ContentInfo, "i2d_CMS_ContentInfo");

   function d2i_CMS_ContentInfo
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return System.Address;  -- openssl/cms.h:79
   pragma Import (C, d2i_CMS_ContentInfo, "d2i_CMS_ContentInfo");

   procedure CMS_ContentInfo_free (a : System.Address);  -- openssl/cms.h:79
   pragma Import (C, CMS_ContentInfo_free, "CMS_ContentInfo_free");

   function CMS_ContentInfo_new return System.Address;  -- openssl/cms.h:79
   pragma Import (C, CMS_ContentInfo_new, "CMS_ContentInfo_new");

   CMS_ReceiptRequest_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/cms.h:80
   pragma Import (C, CMS_ReceiptRequest_it, "CMS_ReceiptRequest_it");

   function i2d_CMS_ReceiptRequest (a : System.Address; c_out : System.Address) return int;  -- openssl/cms.h:80
   pragma Import (C, i2d_CMS_ReceiptRequest, "i2d_CMS_ReceiptRequest");

   function d2i_CMS_ReceiptRequest
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return System.Address;  -- openssl/cms.h:80
   pragma Import (C, d2i_CMS_ReceiptRequest, "d2i_CMS_ReceiptRequest");

   procedure CMS_ReceiptRequest_free (a : System.Address);  -- openssl/cms.h:80
   pragma Import (C, CMS_ReceiptRequest_free, "CMS_ReceiptRequest_free");

   function CMS_ReceiptRequest_new return System.Address;  -- openssl/cms.h:80
   pragma Import (C, CMS_ReceiptRequest_new, "CMS_ReceiptRequest_new");

   function CMS_ContentInfo_print_ctx
     (c_out  : access OpenSSL.Low_Level.bio_h.bio_st;
      x      : System.Address;
      indent : int;
      pctx   : System.Address) return int;  -- openssl/cms.h:81
   pragma Import (C, CMS_ContentInfo_print_ctx, "CMS_ContentInfo_print_ctx");

   function CMS_get0_type (cms : System.Address) return access constant OpenSSL.Low_Level.asn1_h.asn1_object_st;  -- openssl/cms.h:115
   pragma Import (C, CMS_get0_type, "CMS_get0_type");

   function CMS_dataInit (cms : System.Address; icont : access OpenSSL.Low_Level.bio_h.bio_st) return access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/cms.h:117
   pragma Import (C, CMS_dataInit, "CMS_dataInit");

   function CMS_dataFinal (cms : System.Address; the_bio : access OpenSSL.Low_Level.bio_h.bio_st) return int;  -- openssl/cms.h:118
   pragma Import (C, CMS_dataFinal, "CMS_dataFinal");

   function CMS_get0_content (cms : System.Address) return System.Address;  -- openssl/cms.h:120
   pragma Import (C, CMS_get0_content, "CMS_get0_content");

   function CMS_is_detached (cms : System.Address) return int;  -- openssl/cms.h:121
   pragma Import (C, CMS_is_detached, "CMS_is_detached");

   function CMS_set_detached (cms : System.Address; detached : int) return int;  -- openssl/cms.h:122
   pragma Import (C, CMS_set_detached, "CMS_set_detached");

   function PEM_write_CMS (fp : access Interfaces.C_Streams.FILEs; x : System.Address) return int;  -- openssl/cms.h:125
   pragma Import (C, PEM_write_CMS, "PEM_write_CMS");

   function PEM_write_bio_CMS (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : System.Address) return int;  -- openssl/cms.h:125
   pragma Import (C, PEM_write_bio_CMS, "PEM_write_bio_CMS");

   function PEM_read_CMS
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return System.Address;  -- openssl/cms.h:125
   pragma Import (C, PEM_read_CMS, "PEM_read_CMS");

   function PEM_read_bio_CMS
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return System.Address;  -- openssl/cms.h:125
   pragma Import (C, PEM_read_bio_CMS, "PEM_read_bio_CMS");

   function CMS_stream (boundary : System.Address; cms : System.Address) return int;  -- openssl/cms.h:128
   pragma Import (C, CMS_stream, "CMS_stream");

   function d2i_CMS_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; cms : System.Address) return System.Address;  -- openssl/cms.h:129
   pragma Import (C, d2i_CMS_bio, "d2i_CMS_bio");

   function i2d_CMS_bio (bp : access OpenSSL.Low_Level.bio_h.bio_st; cms : System.Address) return int;  -- openssl/cms.h:130
   pragma Import (C, i2d_CMS_bio, "i2d_CMS_bio");

   function BIO_new_CMS (c_out : access OpenSSL.Low_Level.bio_h.bio_st; cms : System.Address) return access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/cms.h:132
   pragma Import (C, BIO_new_CMS, "BIO_new_CMS");

   function i2d_CMS_bio_stream
     (c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      cms   : System.Address;
      c_in  : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : int) return int;  -- openssl/cms.h:133
   pragma Import (C, i2d_CMS_bio_stream, "i2d_CMS_bio_stream");

   function PEM_write_bio_CMS_stream
     (c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      cms   : System.Address;
      c_in  : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : int) return int;  -- openssl/cms.h:134
   pragma Import (C, PEM_write_bio_CMS_stream, "PEM_write_bio_CMS_stream");

   function SMIME_read_CMS (the_bio : access OpenSSL.Low_Level.bio_h.bio_st; bcont : System.Address) return System.Address;  -- openssl/cms.h:135
   pragma Import (C, SMIME_read_CMS, "SMIME_read_CMS");

   function SMIME_write_CMS
     (the_bio : access OpenSSL.Low_Level.bio_h.bio_st;
      cms     : System.Address;
      data    : access OpenSSL.Low_Level.bio_h.bio_st;
      flags   : int) return int;  -- openssl/cms.h:136
   pragma Import (C, SMIME_write_CMS, "SMIME_write_CMS");

   function CMS_final
     (cms   : System.Address;
      data  : access OpenSSL.Low_Level.bio_h.bio_st;
      dcont : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : unsigned) return int;  -- openssl/cms.h:138
   pragma Import (C, CMS_final, "CMS_final");

   function CMS_sign
     (signcert : access OpenSSL.Low_Level.x509_h.x509_st;
      pkey     : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      certs    : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      data     : access OpenSSL.Low_Level.bio_h.bio_st;
      flags    : unsigned) return System.Address;  -- openssl/cms.h:140
   pragma Import (C, CMS_sign, "CMS_sign");

   function CMS_sign_receipt
     (si       : System.Address;
      signcert : access OpenSSL.Low_Level.x509_h.x509_st;
      pkey     : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      certs    : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      flags    : unsigned) return System.Address;  -- openssl/cms.h:143
   pragma Import (C, CMS_sign_receipt, "CMS_sign_receipt");

   function CMS_data
     (cms   : System.Address;
      c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : unsigned) return int;  -- openssl/cms.h:148
   pragma Import (C, CMS_data, "CMS_data");

   function CMS_data_create (c_in : access OpenSSL.Low_Level.bio_h.bio_st; flags : unsigned) return System.Address;  -- openssl/cms.h:149
   pragma Import (C, CMS_data_create, "CMS_data_create");

   function CMS_digest_verify
     (cms   : System.Address;
      dcont : access OpenSSL.Low_Level.bio_h.bio_st;
      c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : unsigned) return int;  -- openssl/cms.h:151
   pragma Import (C, CMS_digest_verify, "CMS_digest_verify");

   function CMS_digest_create
     (c_in  : access OpenSSL.Low_Level.bio_h.bio_st;
      md    : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      flags : unsigned) return System.Address;  -- openssl/cms.h:153
   pragma Import (C, CMS_digest_create, "CMS_digest_create");

   function CMS_EncryptedData_decrypt
     (cms    : System.Address;
      key    : access unsigned_char;
      keylen : size_t;
      dcont  : access OpenSSL.Low_Level.bio_h.bio_st;
      c_out  : access OpenSSL.Low_Level.bio_h.bio_st;
      flags  : unsigned) return int;  -- openssl/cms.h:156
   pragma Import (C, CMS_EncryptedData_decrypt, "CMS_EncryptedData_decrypt");

   function CMS_EncryptedData_encrypt
     (c_in   : access OpenSSL.Low_Level.bio_h.bio_st;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      key    : access unsigned_char;
      keylen : size_t;
      flags  : unsigned) return System.Address;  -- openssl/cms.h:160
   pragma Import (C, CMS_EncryptedData_encrypt, "CMS_EncryptedData_encrypt");

   function CMS_EncryptedData_set1_key
     (cms    : System.Address;
      ciph   : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      key    : access unsigned_char;
      keylen : size_t) return int;  -- openssl/cms.h:164
   pragma Import (C, CMS_EncryptedData_set1_key, "CMS_EncryptedData_set1_key");

   function CMS_verify
     (cms   : System.Address;
      certs : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      store : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;
      dcont : access OpenSSL.Low_Level.bio_h.bio_st;
      c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : unsigned) return int;  -- openssl/cms.h:167
   pragma Import (C, CMS_verify, "CMS_verify");

   function CMS_verify_receipt
     (rcms  : System.Address;
      ocms  : System.Address;
      certs : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      store : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st;
      flags : unsigned) return int;  -- openssl/cms.h:170
   pragma Import (C, CMS_verify_receipt, "CMS_verify_receipt");

   function CMS_get0_signers (cms : System.Address) return access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/cms.h:174
   pragma Import (C, CMS_get0_signers, "CMS_get0_signers");

   function CMS_encrypt
     (certs  : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      c_in   : access OpenSSL.Low_Level.bio_h.bio_st;
      cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      flags  : unsigned) return System.Address;  -- openssl/cms.h:176
   pragma Import (C, CMS_encrypt, "CMS_encrypt");

   function CMS_decrypt
     (cms   : System.Address;
      pkey  : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      cert  : access OpenSSL.Low_Level.x509_h.x509_st;
      dcont : access OpenSSL.Low_Level.bio_h.bio_st;
      c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : unsigned) return int;  -- openssl/cms.h:179
   pragma Import (C, CMS_decrypt, "CMS_decrypt");

   function CMS_decrypt_set1_pkey
     (cms  : System.Address;
      pk   : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      cert : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/cms.h:183
   pragma Import (C, CMS_decrypt_set1_pkey, "CMS_decrypt_set1_pkey");

   function CMS_decrypt_set1_key
     (cms    : System.Address;
      key    : access unsigned_char;
      keylen : size_t;
      id     : access unsigned_char;
      idlen  : size_t) return int;  -- openssl/cms.h:184
   pragma Import (C, CMS_decrypt_set1_key, "CMS_decrypt_set1_key");

   --  skipped empty struct stack_st_CMS_RecipientInfo

   function CMS_get0_RecipientInfos (cms : System.Address) return System.Address;  -- openssl/cms.h:188
   pragma Import (C, CMS_get0_RecipientInfos, "CMS_get0_RecipientInfos");

   function CMS_RecipientInfo_type (ri : System.Address) return int;  -- openssl/cms.h:189
   pragma Import (C, CMS_RecipientInfo_type, "CMS_RecipientInfo_type");

   function CMS_EnvelopedData_create (cipher : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st) return System.Address;  -- openssl/cms.h:190
   pragma Import (C, CMS_EnvelopedData_create, "CMS_EnvelopedData_create");

   function CMS_add1_recipient_cert
     (cms   : System.Address;
      recip : access OpenSSL.Low_Level.x509_h.x509_st;
      flags : unsigned) return System.Address;  -- openssl/cms.h:191
   pragma Import (C, CMS_add1_recipient_cert, "CMS_add1_recipient_cert");

   function CMS_RecipientInfo_set0_pkey (ri : System.Address; pkey : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/cms.h:193
   pragma Import (C, CMS_RecipientInfo_set0_pkey, "CMS_RecipientInfo_set0_pkey");

   function CMS_RecipientInfo_ktri_cert_cmp (ri : System.Address; cert : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/cms.h:194
   pragma Import (C, CMS_RecipientInfo_ktri_cert_cmp, "CMS_RecipientInfo_ktri_cert_cmp");

   function CMS_RecipientInfo_ktri_get0_algs
     (ri    : System.Address;
      pk    : System.Address;
      recip : System.Address;
      palg  : System.Address) return int;  -- openssl/cms.h:195
   pragma Import (C, CMS_RecipientInfo_ktri_get0_algs, "CMS_RecipientInfo_ktri_get0_algs");

   function CMS_RecipientInfo_ktri_get0_signer_id
     (ri     : System.Address;
      keyid  : System.Address;
      issuer : System.Address;
      sno    : System.Address) return int;  -- openssl/cms.h:198
   pragma Import (C, CMS_RecipientInfo_ktri_get0_signer_id, "CMS_RecipientInfo_ktri_get0_signer_id");

   function CMS_add0_recipient_key
     (cms         : System.Address;
      nid         : int;
      key         : access unsigned_char;
      keylen      : size_t;
      id          : access unsigned_char;
      idlen       : size_t;
      date        : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      otherTypeId : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      otherType   : access OpenSSL.Low_Level.asn1_h.asn1_type_st) return System.Address;  -- openssl/cms.h:202
   pragma Import (C, CMS_add0_recipient_key, "CMS_add0_recipient_key");

   function CMS_RecipientInfo_kekri_get0_id
     (ri         : System.Address;
      palg       : System.Address;
      pid        : System.Address;
      pdate      : System.Address;
      potherid   : System.Address;
      pothertype : System.Address) return int;  -- openssl/cms.h:209
   pragma Import (C, CMS_RecipientInfo_kekri_get0_id, "CMS_RecipientInfo_kekri_get0_id");

   function CMS_RecipientInfo_set0_key
     (ri     : System.Address;
      key    : access unsigned_char;
      keylen : size_t) return int;  -- openssl/cms.h:216
   pragma Import (C, CMS_RecipientInfo_set0_key, "CMS_RecipientInfo_set0_key");

   function CMS_RecipientInfo_kekri_id_cmp
     (ri    : System.Address;
      id    : access unsigned_char;
      idlen : size_t) return int;  -- openssl/cms.h:219
   pragma Import (C, CMS_RecipientInfo_kekri_id_cmp, "CMS_RecipientInfo_kekri_id_cmp");

   function CMS_RecipientInfo_decrypt (cms : System.Address; ri : System.Address) return int;  -- openssl/cms.h:222
   pragma Import (C, CMS_RecipientInfo_decrypt, "CMS_RecipientInfo_decrypt");

   function CMS_uncompress
     (cms   : System.Address;
      dcont : access OpenSSL.Low_Level.bio_h.bio_st;
      c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : unsigned) return int;  -- openssl/cms.h:224
   pragma Import (C, CMS_uncompress, "CMS_uncompress");

   function CMS_compress
     (c_in     : access OpenSSL.Low_Level.bio_h.bio_st;
      comp_nid : int;
      flags    : unsigned) return System.Address;  -- openssl/cms.h:226
   pragma Import (C, CMS_compress, "CMS_compress");

   function CMS_set1_eContentType (cms : System.Address; oid : access constant OpenSSL.Low_Level.asn1_h.asn1_object_st) return int;  -- openssl/cms.h:228
   pragma Import (C, CMS_set1_eContentType, "CMS_set1_eContentType");

   function CMS_get0_eContentType (cms : System.Address) return access constant OpenSSL.Low_Level.asn1_h.asn1_object_st;  -- openssl/cms.h:229
   pragma Import (C, CMS_get0_eContentType, "CMS_get0_eContentType");

   function CMS_add0_CertificateChoices (cms : System.Address) return System.Address;  -- openssl/cms.h:231
   pragma Import (C, CMS_add0_CertificateChoices, "CMS_add0_CertificateChoices");

   function CMS_add0_cert (cms : System.Address; cert : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/cms.h:232
   pragma Import (C, CMS_add0_cert, "CMS_add0_cert");

   function CMS_add1_cert (cms : System.Address; cert : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/cms.h:233
   pragma Import (C, CMS_add1_cert, "CMS_add1_cert");

   function CMS_get1_certs (cms : System.Address) return access OpenSSL.Low_Level.x509_h.stack_st_X509;  -- openssl/cms.h:234
   pragma Import (C, CMS_get1_certs, "CMS_get1_certs");

   function CMS_add0_RevocationInfoChoice (cms : System.Address) return System.Address;  -- openssl/cms.h:236
   pragma Import (C, CMS_add0_RevocationInfoChoice, "CMS_add0_RevocationInfoChoice");

   function CMS_add0_crl (cms : System.Address; crl : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/cms.h:237
   pragma Import (C, CMS_add0_crl, "CMS_add0_crl");

   function CMS_add1_crl (cms : System.Address; crl : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/cms.h:238
   pragma Import (C, CMS_add1_crl, "CMS_add1_crl");

   function CMS_get1_crls (cms : System.Address) return access OpenSSL.Low_Level.x509_h.stack_st_X509_CRL;  -- openssl/cms.h:239
   pragma Import (C, CMS_get1_crls, "CMS_get1_crls");

   function CMS_SignedData_init (cms : System.Address) return int;  -- openssl/cms.h:241
   pragma Import (C, CMS_SignedData_init, "CMS_SignedData_init");

   function CMS_add1_signer
     (cms    : System.Address;
      signer : access OpenSSL.Low_Level.x509_h.x509_st;
      pk     : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      md     : access constant OpenSSL.Low_Level.evp_h.env_md_st;
      flags  : unsigned) return System.Address;  -- openssl/cms.h:242
   pragma Import (C, CMS_add1_signer, "CMS_add1_signer");

   function CMS_get0_SignerInfos (cms : System.Address) return access stack_st_CMS_SignerInfo;  -- openssl/cms.h:245
   pragma Import (C, CMS_get0_SignerInfos, "CMS_get0_SignerInfos");

   procedure CMS_SignerInfo_set1_signer_cert (si : System.Address; signer : access OpenSSL.Low_Level.x509_h.x509_st);  -- openssl/cms.h:247
   pragma Import (C, CMS_SignerInfo_set1_signer_cert, "CMS_SignerInfo_set1_signer_cert");

   function CMS_SignerInfo_get0_signer_id
     (si     : System.Address;
      keyid  : System.Address;
      issuer : System.Address;
      sno    : System.Address) return int;  -- openssl/cms.h:248
   pragma Import (C, CMS_SignerInfo_get0_signer_id, "CMS_SignerInfo_get0_signer_id");

   function CMS_SignerInfo_cert_cmp (si : System.Address; cert : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/cms.h:251
   pragma Import (C, CMS_SignerInfo_cert_cmp, "CMS_SignerInfo_cert_cmp");

   function CMS_set1_signers_certs
     (cms   : System.Address;
      certs : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      flags : unsigned) return int;  -- openssl/cms.h:252
   pragma Import (C, CMS_set1_signers_certs, "CMS_set1_signers_certs");

   procedure CMS_SignerInfo_get0_algs
     (si     : System.Address;
      pk     : System.Address;
      signer : System.Address;
      pdig   : System.Address;
      psig   : System.Address);  -- openssl/cms.h:254
   pragma Import (C, CMS_SignerInfo_get0_algs, "CMS_SignerInfo_get0_algs");

   function CMS_SignerInfo_sign (si : System.Address) return int;  -- openssl/cms.h:256
   pragma Import (C, CMS_SignerInfo_sign, "CMS_SignerInfo_sign");

   function CMS_SignerInfo_verify (si : System.Address) return int;  -- openssl/cms.h:257
   pragma Import (C, CMS_SignerInfo_verify, "CMS_SignerInfo_verify");

   function CMS_SignerInfo_verify_content (si : System.Address; chain : access OpenSSL.Low_Level.bio_h.bio_st) return int;  -- openssl/cms.h:258
   pragma Import (C, CMS_SignerInfo_verify_content, "CMS_SignerInfo_verify_content");

   function CMS_add_smimecap (si : System.Address; algs : access OpenSSL.Low_Level.asn1_h.stack_st_X509_ALGOR) return int;  -- openssl/cms.h:260
   pragma Import (C, CMS_add_smimecap, "CMS_add_smimecap");

   function CMS_add_simple_smimecap
     (algs    : System.Address;
      algnid  : int;
      keysize : int) return int;  -- openssl/cms.h:261
   pragma Import (C, CMS_add_simple_smimecap, "CMS_add_simple_smimecap");

   function CMS_add_standard_smimecap (smcap : System.Address) return int;  -- openssl/cms.h:263
   pragma Import (C, CMS_add_standard_smimecap, "CMS_add_standard_smimecap");

   function CMS_signed_get_attr_count (si : System.Address) return int;  -- openssl/cms.h:265
   pragma Import (C, CMS_signed_get_attr_count, "CMS_signed_get_attr_count");

   function CMS_signed_get_attr_by_NID
     (si      : System.Address;
      nid     : int;
      lastpos : int) return int;  -- openssl/cms.h:266
   pragma Import (C, CMS_signed_get_attr_by_NID, "CMS_signed_get_attr_by_NID");

   function CMS_signed_get_attr_by_OBJ
     (si      : System.Address;
      obj     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int) return int;  -- openssl/cms.h:268
   pragma Import (C, CMS_signed_get_attr_by_OBJ, "CMS_signed_get_attr_by_OBJ");

   function CMS_signed_get_attr (si : System.Address; loc : int) return access OpenSSL.Low_Level.x509_h.X509_ATTRIBUTE;  -- openssl/cms.h:270
   pragma Import (C, CMS_signed_get_attr, "CMS_signed_get_attr");

   function CMS_signed_delete_attr (si : System.Address; loc : int) return access OpenSSL.Low_Level.x509_h.X509_ATTRIBUTE;  -- openssl/cms.h:271
   pragma Import (C, CMS_signed_delete_attr, "CMS_signed_delete_attr");

   function CMS_signed_add1_attr (si : System.Address; attr : access OpenSSL.Low_Level.x509_h.X509_ATTRIBUTE) return int;  -- openssl/cms.h:272
   pragma Import (C, CMS_signed_add1_attr, "CMS_signed_add1_attr");

   function CMS_signed_add1_attr_by_OBJ
     (si     : System.Address;
      obj    : access constant OpenSSL.Low_Level.asn1_h.asn1_object_st;
      c_type : int;
      bytes  : System.Address;
      len    : int) return int;  -- openssl/cms.h:273
   pragma Import (C, CMS_signed_add1_attr_by_OBJ, "CMS_signed_add1_attr_by_OBJ");

   function CMS_signed_add1_attr_by_NID
     (si     : System.Address;
      nid    : int;
      c_type : int;
      bytes  : System.Address;
      len    : int) return int;  -- openssl/cms.h:276
   pragma Import (C, CMS_signed_add1_attr_by_NID, "CMS_signed_add1_attr_by_NID");

   function CMS_signed_add1_attr_by_txt
     (si       : System.Address;
      attrname : Interfaces.C.Strings.chars_ptr;
      c_type   : int;
      bytes    : System.Address;
      len      : int) return int;  -- openssl/cms.h:279
   pragma Import (C, CMS_signed_add1_attr_by_txt, "CMS_signed_add1_attr_by_txt");

   function CMS_signed_get0_data_by_OBJ
     (si      : System.Address;
      oid     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int;
      c_type  : int) return System.Address;  -- openssl/cms.h:282
   pragma Import (C, CMS_signed_get0_data_by_OBJ, "CMS_signed_get0_data_by_OBJ");

   function CMS_unsigned_get_attr_count (si : System.Address) return int;  -- openssl/cms.h:285
   pragma Import (C, CMS_unsigned_get_attr_count, "CMS_unsigned_get_attr_count");

   function CMS_unsigned_get_attr_by_NID
     (si      : System.Address;
      nid     : int;
      lastpos : int) return int;  -- openssl/cms.h:286
   pragma Import (C, CMS_unsigned_get_attr_by_NID, "CMS_unsigned_get_attr_by_NID");

   function CMS_unsigned_get_attr_by_OBJ
     (si      : System.Address;
      obj     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int) return int;  -- openssl/cms.h:288
   pragma Import (C, CMS_unsigned_get_attr_by_OBJ, "CMS_unsigned_get_attr_by_OBJ");

   function CMS_unsigned_get_attr (si : System.Address; loc : int) return access OpenSSL.Low_Level.x509_h.X509_ATTRIBUTE;  -- openssl/cms.h:290
   pragma Import (C, CMS_unsigned_get_attr, "CMS_unsigned_get_attr");

   function CMS_unsigned_delete_attr (si : System.Address; loc : int) return access OpenSSL.Low_Level.x509_h.X509_ATTRIBUTE;  -- openssl/cms.h:291
   pragma Import (C, CMS_unsigned_delete_attr, "CMS_unsigned_delete_attr");

   function CMS_unsigned_add1_attr (si : System.Address; attr : access OpenSSL.Low_Level.x509_h.X509_ATTRIBUTE) return int;  -- openssl/cms.h:292
   pragma Import (C, CMS_unsigned_add1_attr, "CMS_unsigned_add1_attr");

   function CMS_unsigned_add1_attr_by_OBJ
     (si     : System.Address;
      obj    : access constant OpenSSL.Low_Level.asn1_h.asn1_object_st;
      c_type : int;
      bytes  : System.Address;
      len    : int) return int;  -- openssl/cms.h:293
   pragma Import (C, CMS_unsigned_add1_attr_by_OBJ, "CMS_unsigned_add1_attr_by_OBJ");

   function CMS_unsigned_add1_attr_by_NID
     (si     : System.Address;
      nid    : int;
      c_type : int;
      bytes  : System.Address;
      len    : int) return int;  -- openssl/cms.h:296
   pragma Import (C, CMS_unsigned_add1_attr_by_NID, "CMS_unsigned_add1_attr_by_NID");

   function CMS_unsigned_add1_attr_by_txt
     (si       : System.Address;
      attrname : Interfaces.C.Strings.chars_ptr;
      c_type   : int;
      bytes    : System.Address;
      len      : int) return int;  -- openssl/cms.h:299
   pragma Import (C, CMS_unsigned_add1_attr_by_txt, "CMS_unsigned_add1_attr_by_txt");

   function CMS_unsigned_get0_data_by_OBJ
     (si      : System.Address;
      oid     : access OpenSSL.Low_Level.asn1_h.asn1_object_st;
      lastpos : int;
      c_type  : int) return System.Address;  -- openssl/cms.h:302
   pragma Import (C, CMS_unsigned_get0_data_by_OBJ, "CMS_unsigned_get0_data_by_OBJ");

   procedure ERR_load_CMS_strings;  -- openssl/cms.h:325
   pragma Import (C, ERR_load_CMS_strings, "ERR_load_CMS_strings");

end OpenSSL.Low_Level.cms_h;
