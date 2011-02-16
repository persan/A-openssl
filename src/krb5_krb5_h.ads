with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with et_com_err_h;
package krb5_krb5_h is
   package stdio_h is
      type va_list is new System.Address;
   end  stdio_h;

   KRB5_DEPRECATED : constant := 0;  --  /usr/include/krb5/krb5.h:64
   --  arg-macro: procedure THREEPARAMOPEN (x, y, z)
   --    open(x,y,z)
   --  unsupported macro: KRB5INT_BEGIN_DECLS extern "C" {
   --  unsupported macro: KRB5INT_END_DECLS }
   --  unsupported macro: VALID_INT_BITS INT_MAX
   --  unsupported macro: VALID_UINT_BITS UINT_MAX

   KRB5_INT32_MAX : constant := 2147483647;  --  /usr/include/krb5/krb5.h:169
   --  unsupported macro: KRB5_INT32_MIN (-KRB5_INT32_MAX-1)

   KRB5_INT16_MAX : constant := 65535;  --  /usr/include/krb5/krb5.h:174
   --  unsupported macro: KRB5_INT16_MIN (-KRB5_INT16_MAX-1)

   FALSE : constant := 0;  --  /usr/include/krb5/krb5.h:192

   TRUE : constant := 1;  --  /usr/include/krb5/krb5.h:195
   --  unsupported macro: SALT_TYPE_AFS_LENGTH UINT_MAX
   --  unsupported macro: SALT_TYPE_NO_LENGTH UINT_MAX

   KRB5_NT_UNKNOWN : constant := 0;  --  /usr/include/krb5/krb5.h:256

   KRB5_NT_PRINCIPAL : constant := 1;  --  /usr/include/krb5/krb5.h:258

   KRB5_NT_SRV_INST : constant := 2;  --  /usr/include/krb5/krb5.h:260

   KRB5_NT_SRV_HST : constant := 3;  --  /usr/include/krb5/krb5.h:262

   KRB5_NT_SRV_XHST : constant := 4;  --  /usr/include/krb5/krb5.h:264

   KRB5_NT_UID : constant := 5;  --  /usr/include/krb5/krb5.h:266

   KRB5_NT_X500_PRINCIPAL : constant := 6;  --  /usr/include/krb5/krb5.h:268

   KRB5_NT_SMTP_NAME : constant := 7;  --  /usr/include/krb5/krb5.h:270

   KRB5_NT_ENTERPRISE_PRINCIPAL : constant := 10;  --  /usr/include/krb5/krb5.h:272
   KRB5_NT_WELLKNOWN : constant := 11;  --  /usr/include/krb5/krb5.h:273

   KRB5_WELLKNOWN_NAMESTR : aliased constant String := "WELLKNOWN" & ASCII.NUL;  --  /usr/include/krb5/krb5.h:275

   KRB5_NT_MS_PRINCIPAL : constant := -128;  --  /usr/include/krb5/krb5.h:277

   KRB5_NT_MS_PRINCIPAL_AND_ID : constant := -129;  --  /usr/include/krb5/krb5.h:279

   KRB5_NT_ENT_PRINCIPAL_AND_ID : constant := -130;  --  /usr/include/krb5/krb5.h:281
   --  arg-macro: function krb5_princ_realm (context, princ)(and(princ).realm
   --    return and(princ).realm;
   --  arg-macro: function krb5_princ_set_realm (context, princ,((princ).realm := *(value)
   --    return (princ).realm := *(value);
   --  arg-macro: function krb5_princ_set_realm_length (context, princ,(princ).realm.length := (value
   --    return princ).realm.length := (value;
   --  arg-macro: function krb5_princ_set_realm_data (context, princ,(princ).realm.data := (value
   --    return princ).realm.data := (value;
   --  arg-macro: procedure krb5_princ_size (context, princ)(princ).length
   --    (princ).length
   --  arg-macro: procedure krb5_princ_type (context, princ)(princ).type
   --    (princ).type
   --  arg-macro: procedure krb5_princ_name (context, princ)(princ).data
   --    (princ).data
   --  arg-macro: function krb5_princ_component (context, princ,(((i) < krb5_princ_size(context, princ)) ? (princ).data + (i) : NULL
   --    return ((i) < krb5_princ_size(context, princ)) ? (princ).data + (i) : NULL;

   KRB5_REFERRAL_REALM : aliased constant String := "" & ASCII.NUL;  --  /usr/include/krb5/krb5.h:301

   KRB5_ANONYMOUS_REALMSTR : aliased constant String := "WELLKNOWN:ANONYMOUS" & ASCII.NUL;  --  /usr/include/krb5/krb5.h:312
   KRB5_ANONYMOUS_PRINCSTR : aliased constant String := "ANONYMOUS" & ASCII.NUL;  --  /usr/include/krb5/krb5.h:313

   ADDRTYPE_INET : constant := 16#0002#;  --  /usr/include/krb5/krb5.h:331
   ADDRTYPE_CHAOS : constant := 16#0005#;  --  /usr/include/krb5/krb5.h:332
   ADDRTYPE_XNS : constant := 16#0006#;  --  /usr/include/krb5/krb5.h:333
   ADDRTYPE_ISO : constant := 16#0007#;  --  /usr/include/krb5/krb5.h:334
   ADDRTYPE_DDP : constant := 16#0010#;  --  /usr/include/krb5/krb5.h:335
   ADDRTYPE_NETBIOS : constant := 16#0014#;  --  /usr/include/krb5/krb5.h:336
   ADDRTYPE_INET6 : constant := 16#0018#;  --  /usr/include/krb5/krb5.h:337

   ADDRTYPE_ADDRPORT : constant := 16#0100#;  --  /usr/include/krb5/krb5.h:339
   ADDRTYPE_IPPORT : constant := 16#0101#;  --  /usr/include/krb5/krb5.h:340
   --  arg-macro: function ADDRTYPE_IS_LOCAL (addrtype)
   --    return addrtype and 16#8000#;

   ENCTYPE_NULL : constant := 16#0000#;  --  /usr/include/krb5/krb5.h:410
   ENCTYPE_DES_CBC_CRC : constant := 16#0001#;  --  /usr/include/krb5/krb5.h:411
   ENCTYPE_DES_CBC_MD4 : constant := 16#0002#;  --  /usr/include/krb5/krb5.h:412
   ENCTYPE_DES_CBC_MD5 : constant := 16#0003#;  --  /usr/include/krb5/krb5.h:413
   ENCTYPE_DES_CBC_RAW : constant := 16#0004#;  --  /usr/include/krb5/krb5.h:414

   ENCTYPE_DES3_CBC_SHA : constant := 16#0005#;  --  /usr/include/krb5/krb5.h:416
   ENCTYPE_DES3_CBC_RAW : constant := 16#0006#;  --  /usr/include/krb5/krb5.h:417
   ENCTYPE_DES_HMAC_SHA1 : constant := 16#0008#;  --  /usr/include/krb5/krb5.h:418

   ENCTYPE_DSA_SHA1_CMS : constant := 16#0009#;  --  /usr/include/krb5/krb5.h:420
   ENCTYPE_MD5_RSA_CMS : constant := 16#000a#;  --  /usr/include/krb5/krb5.h:421
   ENCTYPE_SHA1_RSA_CMS : constant := 16#000b#;  --  /usr/include/krb5/krb5.h:422
   ENCTYPE_RC2_CBC_ENV : constant := 16#000c#;  --  /usr/include/krb5/krb5.h:423
   ENCTYPE_RSA_ENV : constant := 16#000d#;  --  /usr/include/krb5/krb5.h:424
   ENCTYPE_RSA_ES_OAEP_ENV : constant := 16#000e#;  --  /usr/include/krb5/krb5.h:425
   ENCTYPE_DES3_CBC_ENV : constant := 16#000f#;  --  /usr/include/krb5/krb5.h:426

   ENCTYPE_DES3_CBC_SHA1 : constant := 16#0010#;  --  /usr/include/krb5/krb5.h:428
   ENCTYPE_AES128_CTS_HMAC_SHA1_96 : constant := 16#0011#;  --  /usr/include/krb5/krb5.h:429
   ENCTYPE_AES256_CTS_HMAC_SHA1_96 : constant := 16#0012#;  --  /usr/include/krb5/krb5.h:430
   ENCTYPE_ARCFOUR_HMAC : constant := 16#0017#;  --  /usr/include/krb5/krb5.h:431
   ENCTYPE_ARCFOUR_HMAC_EXP : constant := 16#0018#;  --  /usr/include/krb5/krb5.h:432
   ENCTYPE_UNKNOWN : constant := 16#01ff#;  --  /usr/include/krb5/krb5.h:433

   CKSUMTYPE_CRC32 : constant := 16#0001#;  --  /usr/include/krb5/krb5.h:435
   CKSUMTYPE_RSA_MD4 : constant := 16#0002#;  --  /usr/include/krb5/krb5.h:436
   CKSUMTYPE_RSA_MD4_DES : constant := 16#0003#;  --  /usr/include/krb5/krb5.h:437
   CKSUMTYPE_DESCBC : constant := 16#0004#;  --  /usr/include/krb5/krb5.h:438

   CKSUMTYPE_RSA_MD5 : constant := 16#0007#;  --  /usr/include/krb5/krb5.h:441
   CKSUMTYPE_RSA_MD5_DES : constant := 16#0008#;  --  /usr/include/krb5/krb5.h:442
   CKSUMTYPE_NIST_SHA : constant := 16#0009#;  --  /usr/include/krb5/krb5.h:443
   CKSUMTYPE_HMAC_SHA1_DES3 : constant := 16#000c#;  --  /usr/include/krb5/krb5.h:444
   CKSUMTYPE_HMAC_SHA1_96_AES128 : constant := 16#000f#;  --  /usr/include/krb5/krb5.h:445
   CKSUMTYPE_HMAC_SHA1_96_AES256 : constant := 16#0010#;  --  /usr/include/krb5/krb5.h:446
   CKSUMTYPE_MD5_HMAC_ARCFOUR : constant := -137;  --  /usr/include/krb5/krb5.h:447
   CKSUMTYPE_HMAC_MD5_ARCFOUR : constant := -138;  --  /usr/include/krb5/krb5.h:448
   --  arg-macro: function krb5_roundup (x, y)
   --    return (((x) + (y) - 1)/(y))*(y);
   --  arg-macro: function krb5_x (ptr, args)
   --    return (ptr)?((*(ptr)) args):(abort(),1);
   --  arg-macro: function krb5_xc (ptr, args)
   --    return (ptr)?((*(ptr)) args):(abort(),(char*)0);

   KRB5_KEYUSAGE_AS_REQ_PA_ENC_TS : constant := 1;  --  /usr/include/krb5/krb5.h:607
   KRB5_KEYUSAGE_KDC_REP_TICKET : constant := 2;  --  /usr/include/krb5/krb5.h:608
   KRB5_KEYUSAGE_AS_REP_ENCPART : constant := 3;  --  /usr/include/krb5/krb5.h:609
   KRB5_KEYUSAGE_TGS_REQ_AD_SESSKEY : constant := 4;  --  /usr/include/krb5/krb5.h:610
   KRB5_KEYUSAGE_TGS_REQ_AD_SUBKEY : constant := 5;  --  /usr/include/krb5/krb5.h:611
   KRB5_KEYUSAGE_TGS_REQ_AUTH_CKSUM : constant := 6;  --  /usr/include/krb5/krb5.h:612
   KRB5_KEYUSAGE_TGS_REQ_AUTH : constant := 7;  --  /usr/include/krb5/krb5.h:613
   KRB5_KEYUSAGE_TGS_REP_ENCPART_SESSKEY : constant := 8;  --  /usr/include/krb5/krb5.h:614
   KRB5_KEYUSAGE_TGS_REP_ENCPART_SUBKEY : constant := 9;  --  /usr/include/krb5/krb5.h:615
   KRB5_KEYUSAGE_AP_REQ_AUTH_CKSUM : constant := 10;  --  /usr/include/krb5/krb5.h:616
   KRB5_KEYUSAGE_AP_REQ_AUTH : constant := 11;  --  /usr/include/krb5/krb5.h:617
   KRB5_KEYUSAGE_AP_REP_ENCPART : constant := 12;  --  /usr/include/krb5/krb5.h:618
   KRB5_KEYUSAGE_KRB_PRIV_ENCPART : constant := 13;  --  /usr/include/krb5/krb5.h:619
   KRB5_KEYUSAGE_KRB_CRED_ENCPART : constant := 14;  --  /usr/include/krb5/krb5.h:620
   KRB5_KEYUSAGE_KRB_SAFE_CKSUM : constant := 15;  --  /usr/include/krb5/krb5.h:621
   KRB5_KEYUSAGE_APP_DATA_ENCRYPT : constant := 16;  --  /usr/include/krb5/krb5.h:622
   KRB5_KEYUSAGE_APP_DATA_CKSUM : constant := 17;  --  /usr/include/krb5/krb5.h:623
   KRB5_KEYUSAGE_KRB_ERROR_CKSUM : constant := 18;  --  /usr/include/krb5/krb5.h:624
   KRB5_KEYUSAGE_AD_KDCISSUED_CKSUM : constant := 19;  --  /usr/include/krb5/krb5.h:625
   KRB5_KEYUSAGE_AD_MTE : constant := 20;  --  /usr/include/krb5/krb5.h:626
   KRB5_KEYUSAGE_AD_ITE : constant := 21;  --  /usr/include/krb5/krb5.h:627

   KRB5_KEYUSAGE_GSS_TOK_MIC : constant := 22;  --  /usr/include/krb5/krb5.h:631
   KRB5_KEYUSAGE_GSS_TOK_WRAP_INTEG : constant := 23;  --  /usr/include/krb5/krb5.h:632
   KRB5_KEYUSAGE_GSS_TOK_WRAP_PRIV : constant := 24;  --  /usr/include/krb5/krb5.h:633

   KRB5_KEYUSAGE_PA_SAM_CHALLENGE_CKSUM : constant := 25;  --  /usr/include/krb5/krb5.h:637
   KRB5_KEYUSAGE_PA_SAM_CHALLENGE_TRACKID : constant := 26;  --  /usr/include/krb5/krb5.h:638
   KRB5_KEYUSAGE_PA_SAM_RESPONSE : constant := 27;  --  /usr/include/krb5/krb5.h:639

   KRB5_KEYUSAGE_PA_REFERRAL : constant := 26;  --  /usr/include/krb5/krb5.h:642

   KRB5_KEYUSAGE_PA_S4U_X509_USER_REQUEST : constant := 26;  --  /usr/include/krb5/krb5.h:645
   KRB5_KEYUSAGE_PA_S4U_X509_USER_REPLY : constant := 27;  --  /usr/include/krb5/krb5.h:646

   KRB5_KEYUSAGE_AD_SIGNEDPATH : constant := -21;  --  /usr/include/krb5/krb5.h:648
   KRB5_KEYUSAGE_PA_PKINIT_KX : constant := 44;  --  /usr/include/krb5/krb5.h:649

   KRB5_KEYUSAGE_FAST_REQ_CHKSUM : constant := 50;  --  /usr/include/krb5/krb5.h:651
   KRB5_KEYUSAGE_FAST_ENC : constant := 51;  --  /usr/include/krb5/krb5.h:652
   KRB5_KEYUSAGE_FAST_REP : constant := 52;  --  /usr/include/krb5/krb5.h:653
   KRB5_KEYUSAGE_FAST_FINISHED : constant := 53;  --  /usr/include/krb5/krb5.h:654
   KRB5_KEYUSAGE_ENC_CHALLENGE_CLIENT : constant := 54;  --  /usr/include/krb5/krb5.h:655
   KRB5_KEYUSAGE_ENC_CHALLENGE_KDC : constant := 55;  --  /usr/include/krb5/krb5.h:656
   KRB5_KEYUSAGE_AS_REQ : constant := 56;  --  /usr/include/krb5/krb5.h:657

   KRB5_CRYPTO_TYPE_EMPTY : constant := 0;  --  /usr/include/krb5/krb5.h:665
   KRB5_CRYPTO_TYPE_HEADER : constant := 1;  --  /usr/include/krb5/krb5.h:666
   KRB5_CRYPTO_TYPE_DATA : constant := 2;  --  /usr/include/krb5/krb5.h:667
   KRB5_CRYPTO_TYPE_SIGN_ONLY : constant := 3;  --  /usr/include/krb5/krb5.h:668
   KRB5_CRYPTO_TYPE_PADDING : constant := 4;  --  /usr/include/krb5/krb5.h:669
   KRB5_CRYPTO_TYPE_TRAILER : constant := 5;  --  /usr/include/krb5/krb5.h:670
   KRB5_CRYPTO_TYPE_CHECKSUM : constant := 6;  --  /usr/include/krb5/krb5.h:671
   KRB5_CRYPTO_TYPE_STREAM : constant := 7;  --  /usr/include/krb5/krb5.h:672

   KDC_OPT_FORWARDABLE : constant := 16#40000000#;  --  /usr/include/krb5/krb5.h:846
   KDC_OPT_FORWARDED : constant := 16#20000000#;  --  /usr/include/krb5/krb5.h:847
   KDC_OPT_PROXIABLE : constant := 16#10000000#;  --  /usr/include/krb5/krb5.h:848
   KDC_OPT_PROXY : constant := 16#08000000#;  --  /usr/include/krb5/krb5.h:849
   KDC_OPT_ALLOW_POSTDATE : constant := 16#04000000#;  --  /usr/include/krb5/krb5.h:850
   KDC_OPT_POSTDATED : constant := 16#02000000#;  --  /usr/include/krb5/krb5.h:851

   KDC_OPT_RENEWABLE : constant := 16#00800000#;  --  /usr/include/krb5/krb5.h:853

   KDC_OPT_CNAME_IN_ADDL_TKT : constant := 16#00020000#;  --  /usr/include/krb5/krb5.h:859
   KDC_OPT_CANONICALIZE : constant := 16#00010000#;  --  /usr/include/krb5/krb5.h:860
   KDC_OPT_REQUEST_ANONYMOUS : constant := 16#00008000#;  --  /usr/include/krb5/krb5.h:861

   KDC_OPT_DISABLE_TRANSITED_CHECK : constant := 16#00000020#;  --  /usr/include/krb5/krb5.h:871
   KDC_OPT_RENEWABLE_OK : constant := 16#00000010#;  --  /usr/include/krb5/krb5.h:872
   KDC_OPT_ENC_TKT_IN_SKEY : constant := 16#00000008#;  --  /usr/include/krb5/krb5.h:873

   KDC_OPT_RENEW : constant := 16#00000002#;  --  /usr/include/krb5/krb5.h:875
   KDC_OPT_VALIDATE : constant := 16#00000001#;  --  /usr/include/krb5/krb5.h:876

   KDC_TKT_COMMON_MASK : constant := 16#54800000#;  --  /usr/include/krb5/krb5.h:885

   AP_OPTS_RESERVED : constant := 16#80000000#;  --  /usr/include/krb5/krb5.h:890
   AP_OPTS_USE_SESSION_KEY : constant := 16#40000000#;  --  /usr/include/krb5/krb5.h:891
   AP_OPTS_MUTUAL_REQUIRED : constant := 16#20000000#;  --  /usr/include/krb5/krb5.h:892

   AP_OPTS_ETYPE_NEGOTIATION : constant := 16#00000002#;  --  /usr/include/krb5/krb5.h:920
   AP_OPTS_USE_SUBKEY : constant := 16#00000001#;  --  /usr/include/krb5/krb5.h:921

   AP_OPTS_WIRE_MASK : constant := 16#fffffff0#;  --  /usr/include/krb5/krb5.h:923

   AD_TYPE_RESERVED : constant := 16#8000#;  --  /usr/include/krb5/krb5.h:926
   AD_TYPE_EXTERNAL : constant := 16#4000#;  --  /usr/include/krb5/krb5.h:927
   AD_TYPE_REGISTERED : constant := 16#2000#;  --  /usr/include/krb5/krb5.h:928

   AD_TYPE_FIELD_TYPE_MASK : constant := 16#1fff#;  --  /usr/include/krb5/krb5.h:930

   TKT_FLG_FORWARDABLE : constant := 16#40000000#;  --  /usr/include/krb5/krb5.h:936
   TKT_FLG_FORWARDED : constant := 16#20000000#;  --  /usr/include/krb5/krb5.h:937
   TKT_FLG_PROXIABLE : constant := 16#10000000#;  --  /usr/include/krb5/krb5.h:938
   TKT_FLG_PROXY : constant := 16#08000000#;  --  /usr/include/krb5/krb5.h:939
   TKT_FLG_MAY_POSTDATE : constant := 16#04000000#;  --  /usr/include/krb5/krb5.h:940
   TKT_FLG_POSTDATED : constant := 16#02000000#;  --  /usr/include/krb5/krb5.h:941
   TKT_FLG_INVALID : constant := 16#01000000#;  --  /usr/include/krb5/krb5.h:942
   TKT_FLG_RENEWABLE : constant := 16#00800000#;  --  /usr/include/krb5/krb5.h:943
   TKT_FLG_INITIAL : constant := 16#00400000#;  --  /usr/include/krb5/krb5.h:944
   TKT_FLG_PRE_AUTH : constant := 16#00200000#;  --  /usr/include/krb5/krb5.h:945
   TKT_FLG_HW_AUTH : constant := 16#00100000#;  --  /usr/include/krb5/krb5.h:946
   TKT_FLG_TRANSIT_POLICY_CHECKED : constant := 16#00080000#;  --  /usr/include/krb5/krb5.h:947
   TKT_FLG_OK_AS_DELEGATE : constant := 16#00040000#;  --  /usr/include/krb5/krb5.h:948
   TKT_FLG_ENC_PA_REP : constant := 16#00010000#;  --  /usr/include/krb5/krb5.h:949
   TKT_FLG_ANONYMOUS : constant := 16#00008000#;  --  /usr/include/krb5/krb5.h:950

   LR_TYPE_THIS_SERVER_ONLY : constant := 16#8000#;  --  /usr/include/krb5/krb5.h:968

   LR_TYPE_INTERPRETATION_MASK : constant := 16#7fff#;  --  /usr/include/krb5/krb5.h:970

   MSEC_DIRBIT : constant := 16#8000#;  --  /usr/include/krb5/krb5.h:973
   MSEC_VAL_MASK : constant := 16#7fff#;  --  /usr/include/krb5/krb5.h:974

   KRB5_PVNO : constant := 5;  --  /usr/include/krb5/krb5.h:985
   --  unsupported macro: KRB5_AS_REQ ((krb5_msgtype)10)
   --  unsupported macro: KRB5_AS_REP ((krb5_msgtype)11)
   --  unsupported macro: KRB5_TGS_REQ ((krb5_msgtype)12)
   --  unsupported macro: KRB5_TGS_REP ((krb5_msgtype)13)
   --  unsupported macro: KRB5_AP_REQ ((krb5_msgtype)14)
   --  unsupported macro: KRB5_AP_REP ((krb5_msgtype)15)
   --  unsupported macro: KRB5_SAFE ((krb5_msgtype)20)
   --  unsupported macro: KRB5_PRIV ((krb5_msgtype)21)
   --  unsupported macro: KRB5_CRED ((krb5_msgtype)22)
   --  unsupported macro: KRB5_ERROR ((krb5_msgtype)30)

   KRB5_LRQ_NONE : constant := 0;  --  /usr/include/krb5/krb5.h:1001
   KRB5_LRQ_ALL_LAST_TGT : constant := 1;  --  /usr/include/krb5/krb5.h:1002
   KRB5_LRQ_ONE_LAST_TGT : constant := (-1);  --  /usr/include/krb5/krb5.h:1003
   KRB5_LRQ_ALL_LAST_INITIAL : constant := 2;  --  /usr/include/krb5/krb5.h:1004
   KRB5_LRQ_ONE_LAST_INITIAL : constant := (-2);  --  /usr/include/krb5/krb5.h:1005
   KRB5_LRQ_ALL_LAST_TGT_ISSUED : constant := 3;  --  /usr/include/krb5/krb5.h:1006
   KRB5_LRQ_ONE_LAST_TGT_ISSUED : constant := (-3);  --  /usr/include/krb5/krb5.h:1007
   KRB5_LRQ_ALL_LAST_RENEWAL : constant := 4;  --  /usr/include/krb5/krb5.h:1008
   KRB5_LRQ_ONE_LAST_RENEWAL : constant := (-4);  --  /usr/include/krb5/krb5.h:1009
   KRB5_LRQ_ALL_LAST_REQ : constant := 5;  --  /usr/include/krb5/krb5.h:1010
   KRB5_LRQ_ONE_LAST_REQ : constant := (-5);  --  /usr/include/krb5/krb5.h:1011
   KRB5_LRQ_ALL_PW_EXPTIME : constant := 6;  --  /usr/include/krb5/krb5.h:1012
   KRB5_LRQ_ONE_PW_EXPTIME : constant := (-6);  --  /usr/include/krb5/krb5.h:1013

   KRB5_PADATA_NONE : constant := 0;  --  /usr/include/krb5/krb5.h:1016
   KRB5_PADATA_AP_REQ : constant := 1;  --  /usr/include/krb5/krb5.h:1017
   --  unsupported macro: KRB5_PADATA_TGS_REQ KRB5_PADATA_AP_REQ

   KRB5_PADATA_ENC_TIMESTAMP : constant := 2;  --  /usr/include/krb5/krb5.h:1019
   KRB5_PADATA_PW_SALT : constant := 3;  --  /usr/include/krb5/krb5.h:1020

   KRB5_PADATA_ENC_UNIX_TIME : constant := 5;  --  /usr/include/krb5/krb5.h:1024
   KRB5_PADATA_ENC_SANDIA_SECURID : constant := 6;  --  /usr/include/krb5/krb5.h:1025
   KRB5_PADATA_SESAME : constant := 7;  --  /usr/include/krb5/krb5.h:1026
   KRB5_PADATA_OSF_DCE : constant := 8;  --  /usr/include/krb5/krb5.h:1027
   KRB5_CYBERSAFE_SECUREID : constant := 9;  --  /usr/include/krb5/krb5.h:1028
   KRB5_PADATA_AFS3_SALT : constant := 10;  --  /usr/include/krb5/krb5.h:1029
   KRB5_PADATA_ETYPE_INFO : constant := 11;  --  /usr/include/krb5/krb5.h:1030
   KRB5_PADATA_SAM_CHALLENGE : constant := 12;  --  /usr/include/krb5/krb5.h:1031
   KRB5_PADATA_SAM_RESPONSE : constant := 13;  --  /usr/include/krb5/krb5.h:1032
   KRB5_PADATA_PK_AS_REQ_OLD : constant := 14;  --  /usr/include/krb5/krb5.h:1033
   KRB5_PADATA_PK_AS_REP_OLD : constant := 15;  --  /usr/include/krb5/krb5.h:1034
   KRB5_PADATA_PK_AS_REQ : constant := 16;  --  /usr/include/krb5/krb5.h:1035
   KRB5_PADATA_PK_AS_REP : constant := 17;  --  /usr/include/krb5/krb5.h:1036
   KRB5_PADATA_ETYPE_INFO2 : constant := 19;  --  /usr/include/krb5/krb5.h:1037
   KRB5_PADATA_USE_SPECIFIED_KVNO : constant := 20;  --  /usr/include/krb5/krb5.h:1038
   KRB5_PADATA_SVR_REFERRAL_INFO : constant := 20;  --  /usr/include/krb5/krb5.h:1039
   KRB5_PADATA_SAM_REDIRECT : constant := 21;  --  /usr/include/krb5/krb5.h:1040
   KRB5_PADATA_GET_FROM_TYPED_DATA : constant := 22;  --  /usr/include/krb5/krb5.h:1041
   KRB5_PADATA_REFERRAL : constant := 25;  --  /usr/include/krb5/krb5.h:1042
   KRB5_PADATA_SAM_CHALLENGE_2 : constant := 30;  --  /usr/include/krb5/krb5.h:1043
   KRB5_PADATA_SAM_RESPONSE_2 : constant := 31;  --  /usr/include/krb5/krb5.h:1044
   KRB5_PADATA_PAC_REQUEST : constant := 128;  --  /usr/include/krb5/krb5.h:1045
   KRB5_PADATA_FOR_USER : constant := 129;  --  /usr/include/krb5/krb5.h:1046
   KRB5_PADATA_S4U_X509_USER : constant := 130;  --  /usr/include/krb5/krb5.h:1047
   KRB5_PADATA_FX_COOKIE : constant := 133;  --  /usr/include/krb5/krb5.h:1048
   KRB5_PADATA_FX_FAST : constant := 136;  --  /usr/include/krb5/krb5.h:1049
   KRB5_PADATA_FX_ERROR : constant := 137;  --  /usr/include/krb5/krb5.h:1050
   KRB5_PADATA_ENCRYPTED_CHALLENGE : constant := 138;  --  /usr/include/krb5/krb5.h:1051
   KRB5_PADATA_PKINIT_KX : constant := 147;  --  /usr/include/krb5/krb5.h:1052
   KRB5_ENCPADATA_REQ_ENC_PA_REP : constant := 149;  --  /usr/include/krb5/krb5.h:1053

   KRB5_SAM_USE_SAD_AS_KEY : constant := 16#80000000#;  --  /usr/include/krb5/krb5.h:1055
   KRB5_SAM_SEND_ENCRYPTED_SAD : constant := 16#40000000#;  --  /usr/include/krb5/krb5.h:1056
   KRB5_SAM_MUST_PK_ENCRYPT_SAD : constant := 16#20000000#;  --  /usr/include/krb5/krb5.h:1057

   KRB5_PADATA_DASS : constant := 16;  --  /usr/include/krb5/krb5.h:1060

   KRB5_DOMAIN_X500_COMPRESS : constant := 1;  --  /usr/include/krb5/krb5.h:1063

   KRB5_ALTAUTH_ATT_CHALLENGE_RESPONSE : constant := 64;  --  /usr/include/krb5/krb5.h:1066

   KRB5_AUTHDATA_IF_RELEVANT : constant := 1;  --  /usr/include/krb5/krb5.h:1069
   KRB5_AUTHDATA_KDC_ISSUED : constant := 4;  --  /usr/include/krb5/krb5.h:1070
   KRB5_AUTHDATA_AND_OR : constant := 5;  --  /usr/include/krb5/krb5.h:1071
   KRB5_AUTHDATA_MANDATORY_FOR_KDC : constant := 8;  --  /usr/include/krb5/krb5.h:1072
   KRB5_AUTHDATA_INITIAL_VERIFIED_CAS : constant := 9;  --  /usr/include/krb5/krb5.h:1073
   KRB5_AUTHDATA_OSF_DCE : constant := 64;  --  /usr/include/krb5/krb5.h:1074
   KRB5_AUTHDATA_SESAME : constant := 65;  --  /usr/include/krb5/krb5.h:1075
   KRB5_AUTHDATA_WIN2K_PAC : constant := 128;  --  /usr/include/krb5/krb5.h:1076
   KRB5_AUTHDATA_ETYPE_NEGOTIATION : constant := 129;  --  /usr/include/krb5/krb5.h:1077
   KRB5_AUTHDATA_SIGNTICKET : constant := 512;  --  /usr/include/krb5/krb5.h:1078
   KRB5_AUTHDATA_FX_ARMOR : constant := 71;  --  /usr/include/krb5/krb5.h:1079

   KRB5_KPASSWD_SUCCESS : constant := 0;  --  /usr/include/krb5/krb5.h:1082
   KRB5_KPASSWD_MALFORMED : constant := 1;  --  /usr/include/krb5/krb5.h:1083
   KRB5_KPASSWD_HARDERROR : constant := 2;  --  /usr/include/krb5/krb5.h:1084
   KRB5_KPASSWD_AUTHERROR : constant := 3;  --  /usr/include/krb5/krb5.h:1085
   KRB5_KPASSWD_SOFTERROR : constant := 4;  --  /usr/include/krb5/krb5.h:1086

   KRB5_KPASSWD_ACCESSDENIED : constant := 5;  --  /usr/include/krb5/krb5.h:1089
   KRB5_KPASSWD_BAD_VERSION : constant := 6;  --  /usr/include/krb5/krb5.h:1090
   KRB5_KPASSWD_INITIAL_FLAG_NEEDED : constant := 7;  --  /usr/include/krb5/krb5.h:1091

   KRB5_AUTH_CONTEXT_DO_TIME : constant := 16#00000001#;  --  /usr/include/krb5/krb5.h:1379
   KRB5_AUTH_CONTEXT_RET_TIME : constant := 16#00000002#;  --  /usr/include/krb5/krb5.h:1380
   KRB5_AUTH_CONTEXT_DO_SEQUENCE : constant := 16#00000004#;  --  /usr/include/krb5/krb5.h:1381
   KRB5_AUTH_CONTEXT_RET_SEQUENCE : constant := 16#00000008#;  --  /usr/include/krb5/krb5.h:1382
   KRB5_AUTH_CONTEXT_PERMIT_ALL : constant := 16#00000010#;  --  /usr/include/krb5/krb5.h:1383
   KRB5_AUTH_CONTEXT_USE_SUBKEY : constant := 16#00000020#;  --  /usr/include/krb5/krb5.h:1384

   KRB5_AUTH_CONTEXT_GENERATE_LOCAL_ADDR : constant := 16#00000001#;  --  /usr/include/krb5/krb5.h:1393
   KRB5_AUTH_CONTEXT_GENERATE_REMOTE_ADDR : constant := 16#00000002#;  --  /usr/include/krb5/krb5.h:1394
   KRB5_AUTH_CONTEXT_GENERATE_LOCAL_FULL_ADDR : constant := 16#00000004#;  --  /usr/include/krb5/krb5.h:1395
   KRB5_AUTH_CONTEXT_GENERATE_REMOTE_FULL_ADDR : constant := 16#00000008#;  --  /usr/include/krb5/krb5.h:1396

   KRB5_TC_MATCH_TIMES : constant := 16#00000001#;  --  /usr/include/krb5/krb5.h:1428
   KRB5_TC_MATCH_IS_SKEY : constant := 16#00000002#;  --  /usr/include/krb5/krb5.h:1429
   KRB5_TC_MATCH_FLAGS : constant := 16#00000004#;  --  /usr/include/krb5/krb5.h:1430
   KRB5_TC_MATCH_TIMES_EXACT : constant := 16#00000008#;  --  /usr/include/krb5/krb5.h:1431
   KRB5_TC_MATCH_FLAGS_EXACT : constant := 16#00000010#;  --  /usr/include/krb5/krb5.h:1432
   KRB5_TC_MATCH_AUTHDATA : constant := 16#00000020#;  --  /usr/include/krb5/krb5.h:1433
   KRB5_TC_MATCH_SRV_NAMEONLY : constant := 16#00000040#;  --  /usr/include/krb5/krb5.h:1434
   KRB5_TC_MATCH_2ND_TKT : constant := 16#00000080#;  --  /usr/include/krb5/krb5.h:1435
   KRB5_TC_MATCH_KTYPE : constant := 16#00000100#;  --  /usr/include/krb5/krb5.h:1436
   KRB5_TC_SUPPORTED_KTYPES : constant := 16#00000200#;  --  /usr/include/krb5/krb5.h:1437

   KRB5_TC_OPENCLOSE : constant := 16#00000001#;  --  /usr/include/krb5/krb5.h:1440
   KRB5_TC_NOTICKET : constant := 16#00000002#;  --  /usr/include/krb5/krb5.h:1441

   MAX_KEYTAB_NAME_LEN : constant := 1100;  --  /usr/include/krb5/krb5.h:1553

   KRB5_GC_USER_USER : constant := 1;  --  /usr/include/krb5/krb5.h:1624
   KRB5_GC_CACHED : constant := 2;  --  /usr/include/krb5/krb5.h:1625
   KRB5_GC_CANONICALIZE : constant := 4;  --  /usr/include/krb5/krb5.h:1626
   KRB5_GC_NO_STORE : constant := 8;  --  /usr/include/krb5/krb5.h:1627
   KRB5_GC_FORWARDABLE : constant := 16;  --  /usr/include/krb5/krb5.h:1628
   KRB5_GC_NO_TRANSIT_CHECK : constant := 32;  --  /usr/include/krb5/krb5.h:1629
   KRB5_GC_CONSTRAINED_DELEGATION : constant := 64;  --  /usr/include/krb5/krb5.h:1630

   KRB5_PRINCIPAL_PARSE_NO_REALM : constant := 16#1#;  --  /usr/include/krb5/krb5.h:1683
   KRB5_PRINCIPAL_PARSE_REQUIRE_REALM : constant := 16#2#;  --  /usr/include/krb5/krb5.h:1684
   KRB5_PRINCIPAL_PARSE_ENTERPRISE : constant := 16#4#;  --  /usr/include/krb5/krb5.h:1685

   KRB5_PRINCIPAL_UNPARSE_SHORT : constant := 16#1#;  --  /usr/include/krb5/krb5.h:1696
   KRB5_PRINCIPAL_UNPARSE_NO_REALM : constant := 16#2#;  --  /usr/include/krb5/krb5.h:1697
   KRB5_PRINCIPAL_UNPARSE_DISPLAY : constant := 16#4#;  --  /usr/include/krb5/krb5.h:1698

   KRB5_PRINCIPAL_COMPARE_IGNORE_REALM : constant := 1;  --  /usr/include/krb5/krb5.h:1729
   KRB5_PRINCIPAL_COMPARE_ENTERPRISE : constant := 2;  --  /usr/include/krb5/krb5.h:1730
   KRB5_PRINCIPAL_COMPARE_CASEFOLD : constant := 4;  --  /usr/include/krb5/krb5.h:1731
   KRB5_PRINCIPAL_COMPARE_UTF8 : constant := 8;  --  /usr/include/krb5/krb5.h:1732

   KRB5_REALM_BRANCH_CHAR : aliased constant Character := '.';  --  /usr/include/krb5/krb5.h:2123

   KRB5_TGS_NAME : aliased constant String := "krbtgt" & ASCII.NUL;  --  /usr/include/krb5/krb5.h:2186
   KRB5_TGS_NAME_SIZE : constant := 6;  --  /usr/include/krb5/krb5.h:2187

   KRB5_RECVAUTH_SKIP_VERSION : constant := 16#0001#;  --  /usr/include/krb5/krb5.h:2190
   KRB5_RECVAUTH_BADAUTHVERS : constant := 16#0002#;  --  /usr/include/krb5/krb5.h:2191

   KRB5_GET_INIT_CREDS_OPT_TKT_LIFE : constant := 16#0001#;  --  /usr/include/krb5/krb5.h:2224
   KRB5_GET_INIT_CREDS_OPT_RENEW_LIFE : constant := 16#0002#;  --  /usr/include/krb5/krb5.h:2225
   KRB5_GET_INIT_CREDS_OPT_FORWARDABLE : constant := 16#0004#;  --  /usr/include/krb5/krb5.h:2226
   KRB5_GET_INIT_CREDS_OPT_PROXIABLE : constant := 16#0008#;  --  /usr/include/krb5/krb5.h:2227
   KRB5_GET_INIT_CREDS_OPT_ETYPE_LIST : constant := 16#0010#;  --  /usr/include/krb5/krb5.h:2228
   KRB5_GET_INIT_CREDS_OPT_ADDRESS_LIST : constant := 16#0020#;  --  /usr/include/krb5/krb5.h:2229
   KRB5_GET_INIT_CREDS_OPT_PREAUTH_LIST : constant := 16#0040#;  --  /usr/include/krb5/krb5.h:2230
   KRB5_GET_INIT_CREDS_OPT_SALT : constant := 16#0080#;  --  /usr/include/krb5/krb5.h:2231
   KRB5_GET_INIT_CREDS_OPT_CHG_PWD_PRMPT : constant := 16#0100#;  --  /usr/include/krb5/krb5.h:2232
   KRB5_GET_INIT_CREDS_OPT_CANONICALIZE : constant := 16#0200#;  --  /usr/include/krb5/krb5.h:2233
   KRB5_GET_INIT_CREDS_OPT_ANONYMOUS : constant := 16#0400#;  --  /usr/include/krb5/krb5.h:2234

   KRB5_FAST_REQUIRED : constant := 2**0;  --  /usr/include/krb5/krb5.h:2363

   KRB5_VERIFY_INIT_CREDS_OPT_AP_REQ_NOFAIL : constant := 16#0001#;  --  /usr/include/krb5/krb5.h:2431

   KRB5_PROMPT_TYPE_PASSWORD : constant := 16#1#;  --  /usr/include/krb5/krb5.h:2474
   KRB5_PROMPT_TYPE_NEW_PASSWORD : constant := 16#2#;  --  /usr/include/krb5/krb5.h:2475
   KRB5_PROMPT_TYPE_NEW_PASSWORD_AGAIN : constant := 16#3#;  --  /usr/include/krb5/krb5.h:2476
   KRB5_PROMPT_TYPE_PREAUTH : constant := 16#4#;  --  /usr/include/krb5/krb5.h:2477
   --  unsupported macro: krb5_const const

   KRB5KDC_ERR_NONE : constant := (-1765328384);  --  /usr/include/krb5/krb5.h:2603
   KRB5KDC_ERR_NAME_EXP : constant := (-1765328383);  --  /usr/include/krb5/krb5.h:2604
   KRB5KDC_ERR_SERVICE_EXP : constant := (-1765328382);  --  /usr/include/krb5/krb5.h:2605
   KRB5KDC_ERR_BAD_PVNO : constant := (-1765328381);  --  /usr/include/krb5/krb5.h:2606
   KRB5KDC_ERR_C_OLD_MAST_KVNO : constant := (-1765328380);  --  /usr/include/krb5/krb5.h:2607
   KRB5KDC_ERR_S_OLD_MAST_KVNO : constant := (-1765328379);  --  /usr/include/krb5/krb5.h:2608
   KRB5KDC_ERR_C_PRINCIPAL_UNKNOWN : constant := (-1765328378);  --  /usr/include/krb5/krb5.h:2609
   KRB5KDC_ERR_S_PRINCIPAL_UNKNOWN : constant := (-1765328377);  --  /usr/include/krb5/krb5.h:2610
   KRB5KDC_ERR_PRINCIPAL_NOT_UNIQUE : constant := (-1765328376);  --  /usr/include/krb5/krb5.h:2611
   KRB5KDC_ERR_NULL_KEY : constant := (-1765328375);  --  /usr/include/krb5/krb5.h:2612
   KRB5KDC_ERR_CANNOT_POSTDATE : constant := (-1765328374);  --  /usr/include/krb5/krb5.h:2613
   KRB5KDC_ERR_NEVER_VALID : constant := (-1765328373);  --  /usr/include/krb5/krb5.h:2614
   KRB5KDC_ERR_POLICY : constant := (-1765328372);  --  /usr/include/krb5/krb5.h:2615
   KRB5KDC_ERR_BADOPTION : constant := (-1765328371);  --  /usr/include/krb5/krb5.h:2616
   KRB5KDC_ERR_ETYPE_NOSUPP : constant := (-1765328370);  --  /usr/include/krb5/krb5.h:2617
   KRB5KDC_ERR_SUMTYPE_NOSUPP : constant := (-1765328369);  --  /usr/include/krb5/krb5.h:2618
   KRB5KDC_ERR_PADATA_TYPE_NOSUPP : constant := (-1765328368);  --  /usr/include/krb5/krb5.h:2619
   KRB5KDC_ERR_TRTYPE_NOSUPP : constant := (-1765328367);  --  /usr/include/krb5/krb5.h:2620
   KRB5KDC_ERR_CLIENT_REVOKED : constant := (-1765328366);  --  /usr/include/krb5/krb5.h:2621
   KRB5KDC_ERR_SERVICE_REVOKED : constant := (-1765328365);  --  /usr/include/krb5/krb5.h:2622
   KRB5KDC_ERR_TGT_REVOKED : constant := (-1765328364);  --  /usr/include/krb5/krb5.h:2623
   KRB5KDC_ERR_CLIENT_NOTYET : constant := (-1765328363);  --  /usr/include/krb5/krb5.h:2624
   KRB5KDC_ERR_SERVICE_NOTYET : constant := (-1765328362);  --  /usr/include/krb5/krb5.h:2625
   KRB5KDC_ERR_KEY_EXP : constant := (-1765328361);  --  /usr/include/krb5/krb5.h:2626
   KRB5KDC_ERR_PREAUTH_FAILED : constant := (-1765328360);  --  /usr/include/krb5/krb5.h:2627
   KRB5KDC_ERR_PREAUTH_REQUIRED : constant := (-1765328359);  --  /usr/include/krb5/krb5.h:2628
   KRB5KDC_ERR_SERVER_NOMATCH : constant := (-1765328358);  --  /usr/include/krb5/krb5.h:2629
   KRB5KDC_ERR_MUST_USE_USER2USER : constant := (-1765328357);  --  /usr/include/krb5/krb5.h:2630
   KRB5KDC_ERR_PATH_NOT_ACCEPTED : constant := (-1765328356);  --  /usr/include/krb5/krb5.h:2631
   KRB5KDC_ERR_SVC_UNAVAILABLE : constant := (-1765328355);  --  /usr/include/krb5/krb5.h:2632
   KRB5PLACEHOLD_30 : constant := (-1765328354);  --  /usr/include/krb5/krb5.h:2633
   KRB5KRB_AP_ERR_BAD_INTEGRITY : constant := (-1765328353);  --  /usr/include/krb5/krb5.h:2634
   KRB5KRB_AP_ERR_TKT_EXPIRED : constant := (-1765328352);  --  /usr/include/krb5/krb5.h:2635
   KRB5KRB_AP_ERR_TKT_NYV : constant := (-1765328351);  --  /usr/include/krb5/krb5.h:2636
   KRB5KRB_AP_ERR_REPEAT : constant := (-1765328350);  --  /usr/include/krb5/krb5.h:2637
   KRB5KRB_AP_ERR_NOT_US : constant := (-1765328349);  --  /usr/include/krb5/krb5.h:2638
   KRB5KRB_AP_ERR_BADMATCH : constant := (-1765328348);  --  /usr/include/krb5/krb5.h:2639
   KRB5KRB_AP_ERR_SKEW : constant := (-1765328347);  --  /usr/include/krb5/krb5.h:2640
   KRB5KRB_AP_ERR_BADADDR : constant := (-1765328346);  --  /usr/include/krb5/krb5.h:2641
   KRB5KRB_AP_ERR_BADVERSION : constant := (-1765328345);  --  /usr/include/krb5/krb5.h:2642
   KRB5KRB_AP_ERR_MSG_TYPE : constant := (-1765328344);  --  /usr/include/krb5/krb5.h:2643
   KRB5KRB_AP_ERR_MODIFIED : constant := (-1765328343);  --  /usr/include/krb5/krb5.h:2644
   KRB5KRB_AP_ERR_BADORDER : constant := (-1765328342);  --  /usr/include/krb5/krb5.h:2645
   KRB5KRB_AP_ERR_ILL_CR_TKT : constant := (-1765328341);  --  /usr/include/krb5/krb5.h:2646
   KRB5KRB_AP_ERR_BADKEYVER : constant := (-1765328340);  --  /usr/include/krb5/krb5.h:2647
   KRB5KRB_AP_ERR_NOKEY : constant := (-1765328339);  --  /usr/include/krb5/krb5.h:2648
   KRB5KRB_AP_ERR_MUT_FAIL : constant := (-1765328338);  --  /usr/include/krb5/krb5.h:2649
   KRB5KRB_AP_ERR_BADDIRECTION : constant := (-1765328337);  --  /usr/include/krb5/krb5.h:2650
   KRB5KRB_AP_ERR_METHOD : constant := (-1765328336);  --  /usr/include/krb5/krb5.h:2651
   KRB5KRB_AP_ERR_BADSEQ : constant := (-1765328335);  --  /usr/include/krb5/krb5.h:2652
   KRB5KRB_AP_ERR_INAPP_CKSUM : constant := (-1765328334);  --  /usr/include/krb5/krb5.h:2653
   KRB5KRB_AP_PATH_NOT_ACCEPTED : constant := (-1765328333);  --  /usr/include/krb5/krb5.h:2654
   KRB5KRB_ERR_RESPONSE_TOO_BIG : constant := (-1765328332);  --  /usr/include/krb5/krb5.h:2655
   KRB5PLACEHOLD_53 : constant := (-1765328331);  --  /usr/include/krb5/krb5.h:2656
   KRB5PLACEHOLD_54 : constant := (-1765328330);  --  /usr/include/krb5/krb5.h:2657
   KRB5PLACEHOLD_55 : constant := (-1765328329);  --  /usr/include/krb5/krb5.h:2658
   KRB5PLACEHOLD_56 : constant := (-1765328328);  --  /usr/include/krb5/krb5.h:2659
   KRB5PLACEHOLD_57 : constant := (-1765328327);  --  /usr/include/krb5/krb5.h:2660
   KRB5PLACEHOLD_58 : constant := (-1765328326);  --  /usr/include/krb5/krb5.h:2661
   KRB5PLACEHOLD_59 : constant := (-1765328325);  --  /usr/include/krb5/krb5.h:2662
   KRB5KRB_ERR_GENERIC : constant := (-1765328324);  --  /usr/include/krb5/krb5.h:2663
   KRB5KRB_ERR_FIELD_TOOLONG : constant := (-1765328323);  --  /usr/include/krb5/krb5.h:2664
   KRB5KDC_ERR_CLIENT_NOT_TRUSTED : constant := (-1765328322);  --  /usr/include/krb5/krb5.h:2665
   KRB5KDC_ERR_KDC_NOT_TRUSTED : constant := (-1765328321);  --  /usr/include/krb5/krb5.h:2666
   KRB5KDC_ERR_INVALID_SIG : constant := (-1765328320);  --  /usr/include/krb5/krb5.h:2667
   KRB5KDC_ERR_DH_KEY_PARAMETERS_NOT_ACCEPTED : constant := (-1765328319);  --  /usr/include/krb5/krb5.h:2668
   KRB5KDC_ERR_CERTIFICATE_MISMATCH : constant := (-1765328318);  --  /usr/include/krb5/krb5.h:2669
   KRB5KRB_AP_ERR_NO_TGT : constant := (-1765328317);  --  /usr/include/krb5/krb5.h:2670
   KRB5KDC_ERR_WRONG_REALM : constant := (-1765328316);  --  /usr/include/krb5/krb5.h:2671
   KRB5KRB_AP_ERR_USER_TO_USER_REQUIRED : constant := (-1765328315);  --  /usr/include/krb5/krb5.h:2672
   KRB5KDC_ERR_CANT_VERIFY_CERTIFICATE : constant := (-1765328314);  --  /usr/include/krb5/krb5.h:2673
   KRB5KDC_ERR_INVALID_CERTIFICATE : constant := (-1765328313);  --  /usr/include/krb5/krb5.h:2674
   KRB5KDC_ERR_REVOKED_CERTIFICATE : constant := (-1765328312);  --  /usr/include/krb5/krb5.h:2675
   KRB5KDC_ERR_REVOCATION_STATUS_UNKNOWN : constant := (-1765328311);  --  /usr/include/krb5/krb5.h:2676
   KRB5KDC_ERR_REVOCATION_STATUS_UNAVAILABLE : constant := (-1765328310);  --  /usr/include/krb5/krb5.h:2677
   KRB5KDC_ERR_CLIENT_NAME_MISMATCH : constant := (-1765328309);  --  /usr/include/krb5/krb5.h:2678
   KRB5KDC_ERR_KDC_NAME_MISMATCH : constant := (-1765328308);  --  /usr/include/krb5/krb5.h:2679
   KRB5KDC_ERR_INCONSISTENT_KEY_PURPOSE : constant := (-1765328307);  --  /usr/include/krb5/krb5.h:2680
   KRB5KDC_ERR_DIGEST_IN_CERT_NOT_ACCEPTED : constant := (-1765328306);  --  /usr/include/krb5/krb5.h:2681
   KRB5KDC_ERR_PA_CHECKSUM_MUST_BE_INCLUDED : constant := (-1765328305);  --  /usr/include/krb5/krb5.h:2682
   KRB5KDC_ERR_DIGEST_IN_SIGNED_DATA_NOT_ACCEPTED : constant := (-1765328304);  --  /usr/include/krb5/krb5.h:2683
   KRB5KDC_ERR_PUBLIC_KEY_ENCRYPTION_NOT_SUPPORTED : constant := (-1765328303);  --  /usr/include/krb5/krb5.h:2684
   KRB5PLACEHOLD_82 : constant := (-1765328302);  --  /usr/include/krb5/krb5.h:2685
   KRB5PLACEHOLD_83 : constant := (-1765328301);  --  /usr/include/krb5/krb5.h:2686
   KRB5PLACEHOLD_84 : constant := (-1765328300);  --  /usr/include/krb5/krb5.h:2687
   KRB5PLACEHOLD_85 : constant := (-1765328299);  --  /usr/include/krb5/krb5.h:2688
   KRB5PLACEHOLD_86 : constant := (-1765328298);  --  /usr/include/krb5/krb5.h:2689
   KRB5PLACEHOLD_87 : constant := (-1765328297);  --  /usr/include/krb5/krb5.h:2690
   KRB5PLACEHOLD_88 : constant := (-1765328296);  --  /usr/include/krb5/krb5.h:2691
   KRB5PLACEHOLD_89 : constant := (-1765328295);  --  /usr/include/krb5/krb5.h:2692
   KRB5PLACEHOLD_90 : constant := (-1765328294);  --  /usr/include/krb5/krb5.h:2693
   KRB5PLACEHOLD_91 : constant := (-1765328293);  --  /usr/include/krb5/krb5.h:2694
   KRB5PLACEHOLD_92 : constant := (-1765328292);  --  /usr/include/krb5/krb5.h:2695
   KRB5KDC_ERR_UNKNOWN_CRITICAL_FAST_OPTION : constant := (-1765328291);  --  /usr/include/krb5/krb5.h:2696
   KRB5PLACEHOLD_94 : constant := (-1765328290);  --  /usr/include/krb5/krb5.h:2697
   KRB5PLACEHOLD_95 : constant := (-1765328289);  --  /usr/include/krb5/krb5.h:2698
   KRB5PLACEHOLD_96 : constant := (-1765328288);  --  /usr/include/krb5/krb5.h:2699
   KRB5PLACEHOLD_97 : constant := (-1765328287);  --  /usr/include/krb5/krb5.h:2700
   KRB5PLACEHOLD_98 : constant := (-1765328286);  --  /usr/include/krb5/krb5.h:2701
   KRB5PLACEHOLD_99 : constant := (-1765328285);  --  /usr/include/krb5/krb5.h:2702
   KRB5PLACEHOLD_100 : constant := (-1765328284);  --  /usr/include/krb5/krb5.h:2703
   KRB5PLACEHOLD_101 : constant := (-1765328283);  --  /usr/include/krb5/krb5.h:2704
   KRB5PLACEHOLD_102 : constant := (-1765328282);  --  /usr/include/krb5/krb5.h:2705
   KRB5PLACEHOLD_103 : constant := (-1765328281);  --  /usr/include/krb5/krb5.h:2706
   KRB5PLACEHOLD_104 : constant := (-1765328280);  --  /usr/include/krb5/krb5.h:2707
   KRB5PLACEHOLD_105 : constant := (-1765328279);  --  /usr/include/krb5/krb5.h:2708
   KRB5PLACEHOLD_106 : constant := (-1765328278);  --  /usr/include/krb5/krb5.h:2709
   KRB5PLACEHOLD_107 : constant := (-1765328277);  --  /usr/include/krb5/krb5.h:2710
   KRB5PLACEHOLD_108 : constant := (-1765328276);  --  /usr/include/krb5/krb5.h:2711
   KRB5PLACEHOLD_109 : constant := (-1765328275);  --  /usr/include/krb5/krb5.h:2712
   KRB5PLACEHOLD_110 : constant := (-1765328274);  --  /usr/include/krb5/krb5.h:2713
   KRB5PLACEHOLD_111 : constant := (-1765328273);  --  /usr/include/krb5/krb5.h:2714
   KRB5PLACEHOLD_112 : constant := (-1765328272);  --  /usr/include/krb5/krb5.h:2715
   KRB5PLACEHOLD_113 : constant := (-1765328271);  --  /usr/include/krb5/krb5.h:2716
   KRB5PLACEHOLD_114 : constant := (-1765328270);  --  /usr/include/krb5/krb5.h:2717
   KRB5PLACEHOLD_115 : constant := (-1765328269);  --  /usr/include/krb5/krb5.h:2718
   KRB5PLACEHOLD_116 : constant := (-1765328268);  --  /usr/include/krb5/krb5.h:2719
   KRB5PLACEHOLD_117 : constant := (-1765328267);  --  /usr/include/krb5/krb5.h:2720
   KRB5PLACEHOLD_118 : constant := (-1765328266);  --  /usr/include/krb5/krb5.h:2721
   KRB5PLACEHOLD_119 : constant := (-1765328265);  --  /usr/include/krb5/krb5.h:2722
   KRB5PLACEHOLD_120 : constant := (-1765328264);  --  /usr/include/krb5/krb5.h:2723
   KRB5PLACEHOLD_121 : constant := (-1765328263);  --  /usr/include/krb5/krb5.h:2724
   KRB5PLACEHOLD_122 : constant := (-1765328262);  --  /usr/include/krb5/krb5.h:2725
   KRB5PLACEHOLD_123 : constant := (-1765328261);  --  /usr/include/krb5/krb5.h:2726
   KRB5PLACEHOLD_124 : constant := (-1765328260);  --  /usr/include/krb5/krb5.h:2727
   KRB5PLACEHOLD_125 : constant := (-1765328259);  --  /usr/include/krb5/krb5.h:2728
   KRB5PLACEHOLD_126 : constant := (-1765328258);  --  /usr/include/krb5/krb5.h:2729
   KRB5PLACEHOLD_127 : constant := (-1765328257);  --  /usr/include/krb5/krb5.h:2730
   KRB5_ERR_RCSID : constant := (-1765328256);  --  /usr/include/krb5/krb5.h:2731
   KRB5_LIBOS_BADLOCKFLAG : constant := (-1765328255);  --  /usr/include/krb5/krb5.h:2732
   KRB5_LIBOS_CANTREADPWD : constant := (-1765328254);  --  /usr/include/krb5/krb5.h:2733
   KRB5_LIBOS_BADPWDMATCH : constant := (-1765328253);  --  /usr/include/krb5/krb5.h:2734
   KRB5_LIBOS_PWDINTR : constant := (-1765328252);  --  /usr/include/krb5/krb5.h:2735
   KRB5_PARSE_ILLCHAR : constant := (-1765328251);  --  /usr/include/krb5/krb5.h:2736
   KRB5_PARSE_MALFORMED : constant := (-1765328250);  --  /usr/include/krb5/krb5.h:2737
   KRB5_CONFIG_CANTOPEN : constant := (-1765328249);  --  /usr/include/krb5/krb5.h:2738
   KRB5_CONFIG_BADFORMAT : constant := (-1765328248);  --  /usr/include/krb5/krb5.h:2739
   KRB5_CONFIG_NOTENUFSPACE : constant := (-1765328247);  --  /usr/include/krb5/krb5.h:2740
   KRB5_BADMSGTYPE : constant := (-1765328246);  --  /usr/include/krb5/krb5.h:2741
   KRB5_CC_BADNAME : constant := (-1765328245);  --  /usr/include/krb5/krb5.h:2742
   KRB5_CC_UNKNOWN_TYPE : constant := (-1765328244);  --  /usr/include/krb5/krb5.h:2743
   KRB5_CC_NOTFOUND : constant := (-1765328243);  --  /usr/include/krb5/krb5.h:2744
   KRB5_CC_END : constant := (-1765328242);  --  /usr/include/krb5/krb5.h:2745
   KRB5_NO_TKT_SUPPLIED : constant := (-1765328241);  --  /usr/include/krb5/krb5.h:2746
   KRB5KRB_AP_WRONG_PRINC : constant := (-1765328240);  --  /usr/include/krb5/krb5.h:2747
   KRB5KRB_AP_ERR_TKT_INVALID : constant := (-1765328239);  --  /usr/include/krb5/krb5.h:2748
   KRB5_PRINC_NOMATCH : constant := (-1765328238);  --  /usr/include/krb5/krb5.h:2749
   KRB5_KDCREP_MODIFIED : constant := (-1765328237);  --  /usr/include/krb5/krb5.h:2750
   KRB5_KDCREP_SKEW : constant := (-1765328236);  --  /usr/include/krb5/krb5.h:2751
   KRB5_IN_TKT_REALM_MISMATCH : constant := (-1765328235);  --  /usr/include/krb5/krb5.h:2752
   KRB5_PROG_ETYPE_NOSUPP : constant := (-1765328234);  --  /usr/include/krb5/krb5.h:2753
   KRB5_PROG_KEYTYPE_NOSUPP : constant := (-1765328233);  --  /usr/include/krb5/krb5.h:2754
   KRB5_WRONG_ETYPE : constant := (-1765328232);  --  /usr/include/krb5/krb5.h:2755
   KRB5_PROG_SUMTYPE_NOSUPP : constant := (-1765328231);  --  /usr/include/krb5/krb5.h:2756
   KRB5_REALM_UNKNOWN : constant := (-1765328230);  --  /usr/include/krb5/krb5.h:2757
   KRB5_SERVICE_UNKNOWN : constant := (-1765328229);  --  /usr/include/krb5/krb5.h:2758
   KRB5_KDC_UNREACH : constant := (-1765328228);  --  /usr/include/krb5/krb5.h:2759
   KRB5_NO_LOCALNAME : constant := (-1765328227);  --  /usr/include/krb5/krb5.h:2760
   KRB5_MUTUAL_FAILED : constant := (-1765328226);  --  /usr/include/krb5/krb5.h:2761
   KRB5_RC_TYPE_EXISTS : constant := (-1765328225);  --  /usr/include/krb5/krb5.h:2762
   KRB5_RC_MALLOC : constant := (-1765328224);  --  /usr/include/krb5/krb5.h:2763
   KRB5_RC_TYPE_NOTFOUND : constant := (-1765328223);  --  /usr/include/krb5/krb5.h:2764
   KRB5_RC_UNKNOWN : constant := (-1765328222);  --  /usr/include/krb5/krb5.h:2765
   KRB5_RC_REPLAY : constant := (-1765328221);  --  /usr/include/krb5/krb5.h:2766
   KRB5_RC_IO : constant := (-1765328220);  --  /usr/include/krb5/krb5.h:2767
   KRB5_RC_NOIO : constant := (-1765328219);  --  /usr/include/krb5/krb5.h:2768
   KRB5_RC_PARSE : constant := (-1765328218);  --  /usr/include/krb5/krb5.h:2769
   KRB5_RC_IO_EOF : constant := (-1765328217);  --  /usr/include/krb5/krb5.h:2770
   KRB5_RC_IO_MALLOC : constant := (-1765328216);  --  /usr/include/krb5/krb5.h:2771
   KRB5_RC_IO_PERM : constant := (-1765328215);  --  /usr/include/krb5/krb5.h:2772
   KRB5_RC_IO_IO : constant := (-1765328214);  --  /usr/include/krb5/krb5.h:2773
   KRB5_RC_IO_UNKNOWN : constant := (-1765328213);  --  /usr/include/krb5/krb5.h:2774
   KRB5_RC_IO_SPACE : constant := (-1765328212);  --  /usr/include/krb5/krb5.h:2775
   KRB5_TRANS_CANTOPEN : constant := (-1765328211);  --  /usr/include/krb5/krb5.h:2776
   KRB5_TRANS_BADFORMAT : constant := (-1765328210);  --  /usr/include/krb5/krb5.h:2777
   KRB5_LNAME_CANTOPEN : constant := (-1765328209);  --  /usr/include/krb5/krb5.h:2778
   KRB5_LNAME_NOTRANS : constant := (-1765328208);  --  /usr/include/krb5/krb5.h:2779
   KRB5_LNAME_BADFORMAT : constant := (-1765328207);  --  /usr/include/krb5/krb5.h:2780
   KRB5_CRYPTO_INTERNAL : constant := (-1765328206);  --  /usr/include/krb5/krb5.h:2781
   KRB5_KT_BADNAME : constant := (-1765328205);  --  /usr/include/krb5/krb5.h:2782
   KRB5_KT_UNKNOWN_TYPE : constant := (-1765328204);  --  /usr/include/krb5/krb5.h:2783
   KRB5_KT_NOTFOUND : constant := (-1765328203);  --  /usr/include/krb5/krb5.h:2784
   KRB5_KT_END : constant := (-1765328202);  --  /usr/include/krb5/krb5.h:2785
   KRB5_KT_NOWRITE : constant := (-1765328201);  --  /usr/include/krb5/krb5.h:2786
   KRB5_KT_IOERR : constant := (-1765328200);  --  /usr/include/krb5/krb5.h:2787
   KRB5_NO_TKT_IN_RLM : constant := (-1765328199);  --  /usr/include/krb5/krb5.h:2788
   KRB5DES_BAD_KEYPAR : constant := (-1765328198);  --  /usr/include/krb5/krb5.h:2789
   KRB5DES_WEAK_KEY : constant := (-1765328197);  --  /usr/include/krb5/krb5.h:2790
   KRB5_BAD_ENCTYPE : constant := (-1765328196);  --  /usr/include/krb5/krb5.h:2791
   KRB5_BAD_KEYSIZE : constant := (-1765328195);  --  /usr/include/krb5/krb5.h:2792
   KRB5_BAD_MSIZE : constant := (-1765328194);  --  /usr/include/krb5/krb5.h:2793
   KRB5_CC_TYPE_EXISTS : constant := (-1765328193);  --  /usr/include/krb5/krb5.h:2794
   KRB5_KT_TYPE_EXISTS : constant := (-1765328192);  --  /usr/include/krb5/krb5.h:2795
   KRB5_CC_IO : constant := (-1765328191);  --  /usr/include/krb5/krb5.h:2796
   KRB5_FCC_PERM : constant := (-1765328190);  --  /usr/include/krb5/krb5.h:2797
   KRB5_FCC_NOFILE : constant := (-1765328189);  --  /usr/include/krb5/krb5.h:2798
   KRB5_FCC_INTERNAL : constant := (-1765328188);  --  /usr/include/krb5/krb5.h:2799
   KRB5_CC_WRITE : constant := (-1765328187);  --  /usr/include/krb5/krb5.h:2800
   KRB5_CC_NOMEM : constant := (-1765328186);  --  /usr/include/krb5/krb5.h:2801
   KRB5_CC_FORMAT : constant := (-1765328185);  --  /usr/include/krb5/krb5.h:2802
   KRB5_CC_NOT_KTYPE : constant := (-1765328184);  --  /usr/include/krb5/krb5.h:2803
   KRB5_INVALID_FLAGS : constant := (-1765328183);  --  /usr/include/krb5/krb5.h:2804
   KRB5_NO_2ND_TKT : constant := (-1765328182);  --  /usr/include/krb5/krb5.h:2805
   KRB5_NOCREDS_SUPPLIED : constant := (-1765328181);  --  /usr/include/krb5/krb5.h:2806
   KRB5_SENDAUTH_BADAUTHVERS : constant := (-1765328180);  --  /usr/include/krb5/krb5.h:2807
   KRB5_SENDAUTH_BADAPPLVERS : constant := (-1765328179);  --  /usr/include/krb5/krb5.h:2808
   KRB5_SENDAUTH_BADRESPONSE : constant := (-1765328178);  --  /usr/include/krb5/krb5.h:2809
   KRB5_SENDAUTH_REJECTED : constant := (-1765328177);  --  /usr/include/krb5/krb5.h:2810
   KRB5_PREAUTH_BAD_TYPE : constant := (-1765328176);  --  /usr/include/krb5/krb5.h:2811
   KRB5_PREAUTH_NO_KEY : constant := (-1765328175);  --  /usr/include/krb5/krb5.h:2812
   KRB5_PREAUTH_FAILED : constant := (-1765328174);  --  /usr/include/krb5/krb5.h:2813
   KRB5_RCACHE_BADVNO : constant := (-1765328173);  --  /usr/include/krb5/krb5.h:2814
   KRB5_CCACHE_BADVNO : constant := (-1765328172);  --  /usr/include/krb5/krb5.h:2815
   KRB5_KEYTAB_BADVNO : constant := (-1765328171);  --  /usr/include/krb5/krb5.h:2816
   KRB5_PROG_ATYPE_NOSUPP : constant := (-1765328170);  --  /usr/include/krb5/krb5.h:2817
   KRB5_RC_REQUIRED : constant := (-1765328169);  --  /usr/include/krb5/krb5.h:2818
   KRB5_ERR_BAD_HOSTNAME : constant := (-1765328168);  --  /usr/include/krb5/krb5.h:2819
   KRB5_ERR_HOST_REALM_UNKNOWN : constant := (-1765328167);  --  /usr/include/krb5/krb5.h:2820
   KRB5_SNAME_UNSUPP_NAMETYPE : constant := (-1765328166);  --  /usr/include/krb5/krb5.h:2821
   KRB5KRB_AP_ERR_V4_REPLY : constant := (-1765328165);  --  /usr/include/krb5/krb5.h:2822
   KRB5_REALM_CANT_RESOLVE : constant := (-1765328164);  --  /usr/include/krb5/krb5.h:2823
   KRB5_TKT_NOT_FORWARDABLE : constant := (-1765328163);  --  /usr/include/krb5/krb5.h:2824
   KRB5_FWD_BAD_PRINCIPAL : constant := (-1765328162);  --  /usr/include/krb5/krb5.h:2825
   KRB5_GET_IN_TKT_LOOP : constant := (-1765328161);  --  /usr/include/krb5/krb5.h:2826
   KRB5_CONFIG_NODEFREALM : constant := (-1765328160);  --  /usr/include/krb5/krb5.h:2827
   KRB5_SAM_UNSUPPORTED : constant := (-1765328159);  --  /usr/include/krb5/krb5.h:2828
   KRB5_SAM_INVALID_ETYPE : constant := (-1765328158);  --  /usr/include/krb5/krb5.h:2829
   KRB5_SAM_NO_CHECKSUM : constant := (-1765328157);  --  /usr/include/krb5/krb5.h:2830
   KRB5_SAM_BAD_CHECKSUM : constant := (-1765328156);  --  /usr/include/krb5/krb5.h:2831
   KRB5_KT_NAME_TOOLONG : constant := (-1765328155);  --  /usr/include/krb5/krb5.h:2832
   KRB5_KT_KVNONOTFOUND : constant := (-1765328154);  --  /usr/include/krb5/krb5.h:2833
   KRB5_APPL_EXPIRED : constant := (-1765328153);  --  /usr/include/krb5/krb5.h:2834
   KRB5_LIB_EXPIRED : constant := (-1765328152);  --  /usr/include/krb5/krb5.h:2835
   KRB5_CHPW_PWDNULL : constant := (-1765328151);  --  /usr/include/krb5/krb5.h:2836
   KRB5_CHPW_FAIL : constant := (-1765328150);  --  /usr/include/krb5/krb5.h:2837
   KRB5_KT_FORMAT : constant := (-1765328149);  --  /usr/include/krb5/krb5.h:2838
   KRB5_NOPERM_ETYPE : constant := (-1765328148);  --  /usr/include/krb5/krb5.h:2839
   KRB5_CONFIG_ETYPE_NOSUPP : constant := (-1765328147);  --  /usr/include/krb5/krb5.h:2840
   KRB5_OBSOLETE_FN : constant := (-1765328146);  --  /usr/include/krb5/krb5.h:2841
   KRB5_EAI_FAIL : constant := (-1765328145);  --  /usr/include/krb5/krb5.h:2842
   KRB5_EAI_NODATA : constant := (-1765328144);  --  /usr/include/krb5/krb5.h:2843
   KRB5_EAI_NONAME : constant := (-1765328143);  --  /usr/include/krb5/krb5.h:2844
   KRB5_EAI_SERVICE : constant := (-1765328142);  --  /usr/include/krb5/krb5.h:2845
   KRB5_ERR_NUMERIC_REALM : constant := (-1765328141);  --  /usr/include/krb5/krb5.h:2846
   KRB5_ERR_BAD_S2K_PARAMS : constant := (-1765328140);  --  /usr/include/krb5/krb5.h:2847
   KRB5_ERR_NO_SERVICE : constant := (-1765328139);  --  /usr/include/krb5/krb5.h:2848
   KRB5_CC_READONLY : constant := (-1765328138);  --  /usr/include/krb5/krb5.h:2849
   KRB5_CC_NOSUPP : constant := (-1765328137);  --  /usr/include/krb5/krb5.h:2850
   KRB5_DELTAT_BADFORMAT : constant := (-1765328136);  --  /usr/include/krb5/krb5.h:2851
   KRB5_PLUGIN_NO_HANDLE : constant := (-1765328135);  --  /usr/include/krb5/krb5.h:2852
   KRB5_PLUGIN_OP_NOTSUPP : constant := (-1765328134);  --  /usr/include/krb5/krb5.h:2853
   KRB5_ERR_INVALID_UTF8 : constant := (-1765328133);  --  /usr/include/krb5/krb5.h:2854
   KRB5_ERR_FAST_REQUIRED : constant := (-1765328132);  --  /usr/include/krb5/krb5.h:2855
   KRB5_LOCAL_ADDR_REQUIRED : constant := (-1765328131);  --  /usr/include/krb5/krb5.h:2856
   KRB5_REMOTE_ADDR_REQUIRED : constant := (-1765328130);  --  /usr/include/krb5/krb5.h:2857

   ERROR_TABLE_BASE_krb5 : constant := (-1765328384);  --  /usr/include/krb5/krb5.h:2864
   --  unsupported macro: init_krb5_err_tbl initialize_krb5_error_table
   --  unsupported macro: krb5_err_base ERROR_TABLE_BASE_krb5

   KRB5_KDB_RCSID : constant := (-1780008448);  --  /usr/include/krb5/krb5.h:2876
   KRB5_KDB_INUSE : constant := (-1780008447);  --  /usr/include/krb5/krb5.h:2877
   KRB5_KDB_UK_SERROR : constant := (-1780008446);  --  /usr/include/krb5/krb5.h:2878
   KRB5_KDB_UK_RERROR : constant := (-1780008445);  --  /usr/include/krb5/krb5.h:2879
   KRB5_KDB_UNAUTH : constant := (-1780008444);  --  /usr/include/krb5/krb5.h:2880
   KRB5_KDB_NOENTRY : constant := (-1780008443);  --  /usr/include/krb5/krb5.h:2881
   KRB5_KDB_ILL_WILDCARD : constant := (-1780008442);  --  /usr/include/krb5/krb5.h:2882
   KRB5_KDB_DB_INUSE : constant := (-1780008441);  --  /usr/include/krb5/krb5.h:2883
   KRB5_KDB_DB_CHANGED : constant := (-1780008440);  --  /usr/include/krb5/krb5.h:2884
   KRB5_KDB_TRUNCATED_RECORD : constant := (-1780008439);  --  /usr/include/krb5/krb5.h:2885
   KRB5_KDB_RECURSIVELOCK : constant := (-1780008438);  --  /usr/include/krb5/krb5.h:2886
   KRB5_KDB_NOTLOCKED : constant := (-1780008437);  --  /usr/include/krb5/krb5.h:2887
   KRB5_KDB_BADLOCKMODE : constant := (-1780008436);  --  /usr/include/krb5/krb5.h:2888
   KRB5_KDB_DBNOTINITED : constant := (-1780008435);  --  /usr/include/krb5/krb5.h:2889
   KRB5_KDB_DBINITED : constant := (-1780008434);  --  /usr/include/krb5/krb5.h:2890
   KRB5_KDB_ILLDIRECTION : constant := (-1780008433);  --  /usr/include/krb5/krb5.h:2891
   KRB5_KDB_NOMASTERKEY : constant := (-1780008432);  --  /usr/include/krb5/krb5.h:2892
   KRB5_KDB_BADMASTERKEY : constant := (-1780008431);  --  /usr/include/krb5/krb5.h:2893
   KRB5_KDB_INVALIDKEYSIZE : constant := (-1780008430);  --  /usr/include/krb5/krb5.h:2894
   KRB5_KDB_CANTREAD_STORED : constant := (-1780008429);  --  /usr/include/krb5/krb5.h:2895
   KRB5_KDB_BADSTORED_MKEY : constant := (-1780008428);  --  /usr/include/krb5/krb5.h:2896
   KRB5_KDB_NOACTMASTERKEY : constant := (-1780008427);  --  /usr/include/krb5/krb5.h:2897
   KRB5_KDB_KVNONOMATCH : constant := (-1780008426);  --  /usr/include/krb5/krb5.h:2898
   KRB5_KDB_STORED_MKEY_NOTCURRENT : constant := (-1780008425);  --  /usr/include/krb5/krb5.h:2899
   KRB5_KDB_CANTLOCK_DB : constant := (-1780008424);  --  /usr/include/krb5/krb5.h:2900
   KRB5_KDB_DB_CORRUPT : constant := (-1780008423);  --  /usr/include/krb5/krb5.h:2901
   KRB5_KDB_BAD_VERSION : constant := (-1780008422);  --  /usr/include/krb5/krb5.h:2902
   KRB5_KDB_BAD_SALTTYPE : constant := (-1780008421);  --  /usr/include/krb5/krb5.h:2903
   KRB5_KDB_BAD_ENCTYPE : constant := (-1780008420);  --  /usr/include/krb5/krb5.h:2904
   KRB5_KDB_BAD_CREATEFLAGS : constant := (-1780008419);  --  /usr/include/krb5/krb5.h:2905
   KRB5_KDB_NO_PERMITTED_KEY : constant := (-1780008418);  --  /usr/include/krb5/krb5.h:2906
   KRB5_KDB_NO_MATCHING_KEY : constant := (-1780008417);  --  /usr/include/krb5/krb5.h:2907
   KRB5_KDB_DBTYPE_NOTFOUND : constant := (-1780008416);  --  /usr/include/krb5/krb5.h:2908
   KRB5_KDB_DBTYPE_NOSUP : constant := (-1780008415);  --  /usr/include/krb5/krb5.h:2909
   KRB5_KDB_DBTYPE_INIT : constant := (-1780008414);  --  /usr/include/krb5/krb5.h:2910
   KRB5_KDB_SERVER_INTERNAL_ERR : constant := (-1780008413);  --  /usr/include/krb5/krb5.h:2911
   KRB5_KDB_ACCESS_ERROR : constant := (-1780008412);  --  /usr/include/krb5/krb5.h:2912
   KRB5_KDB_INTERNAL_ERROR : constant := (-1780008411);  --  /usr/include/krb5/krb5.h:2913
   KRB5_KDB_CONSTRAINT_VIOLATION : constant := (-1780008410);  --  /usr/include/krb5/krb5.h:2914
   KRB5_LOG_CONV : constant := (-1780008409);  --  /usr/include/krb5/krb5.h:2915
   KRB5_LOG_UNSTABLE : constant := (-1780008408);  --  /usr/include/krb5/krb5.h:2916
   KRB5_LOG_CORRUPT : constant := (-1780008407);  --  /usr/include/krb5/krb5.h:2917
   KRB5_LOG_ERROR : constant := (-1780008406);  --  /usr/include/krb5/krb5.h:2918

   ERROR_TABLE_BASE_kdb5 : constant := (-1780008448);  --  /usr/include/krb5/krb5.h:2925
   --  unsupported macro: init_kdb5_err_tbl initialize_kdb5_error_table
   --  unsupported macro: kdb5_err_base ERROR_TABLE_BASE_kdb5

   KV5M_NONE : constant := (-1760647424);  --  /usr/include/krb5/krb5.h:2937
   KV5M_PRINCIPAL : constant := (-1760647423);  --  /usr/include/krb5/krb5.h:2938
   KV5M_DATA : constant := (-1760647422);  --  /usr/include/krb5/krb5.h:2939
   KV5M_KEYBLOCK : constant := (-1760647421);  --  /usr/include/krb5/krb5.h:2940
   KV5M_CHECKSUM : constant := (-1760647420);  --  /usr/include/krb5/krb5.h:2941
   KV5M_ENCRYPT_BLOCK : constant := (-1760647419);  --  /usr/include/krb5/krb5.h:2942
   KV5M_ENC_DATA : constant := (-1760647418);  --  /usr/include/krb5/krb5.h:2943
   KV5M_CRYPTOSYSTEM_ENTRY : constant := (-1760647417);  --  /usr/include/krb5/krb5.h:2944
   KV5M_CS_TABLE_ENTRY : constant := (-1760647416);  --  /usr/include/krb5/krb5.h:2945
   KV5M_CHECKSUM_ENTRY : constant := (-1760647415);  --  /usr/include/krb5/krb5.h:2946
   KV5M_AUTHDATA : constant := (-1760647414);  --  /usr/include/krb5/krb5.h:2947
   KV5M_TRANSITED : constant := (-1760647413);  --  /usr/include/krb5/krb5.h:2948
   KV5M_ENC_TKT_PART : constant := (-1760647412);  --  /usr/include/krb5/krb5.h:2949
   KV5M_TICKET : constant := (-1760647411);  --  /usr/include/krb5/krb5.h:2950
   KV5M_AUTHENTICATOR : constant := (-1760647410);  --  /usr/include/krb5/krb5.h:2951
   KV5M_TKT_AUTHENT : constant := (-1760647409);  --  /usr/include/krb5/krb5.h:2952
   KV5M_CREDS : constant := (-1760647408);  --  /usr/include/krb5/krb5.h:2953
   KV5M_LAST_REQ_ENTRY : constant := (-1760647407);  --  /usr/include/krb5/krb5.h:2954
   KV5M_PA_DATA : constant := (-1760647406);  --  /usr/include/krb5/krb5.h:2955
   KV5M_KDC_REQ : constant := (-1760647405);  --  /usr/include/krb5/krb5.h:2956
   KV5M_ENC_KDC_REP_PART : constant := (-1760647404);  --  /usr/include/krb5/krb5.h:2957
   KV5M_KDC_REP : constant := (-1760647403);  --  /usr/include/krb5/krb5.h:2958
   KV5M_ERROR : constant := (-1760647402);  --  /usr/include/krb5/krb5.h:2959
   KV5M_AP_REQ : constant := (-1760647401);  --  /usr/include/krb5/krb5.h:2960
   KV5M_AP_REP : constant := (-1760647400);  --  /usr/include/krb5/krb5.h:2961
   KV5M_AP_REP_ENC_PART : constant := (-1760647399);  --  /usr/include/krb5/krb5.h:2962
   KV5M_RESPONSE : constant := (-1760647398);  --  /usr/include/krb5/krb5.h:2963
   KV5M_SAFE : constant := (-1760647397);  --  /usr/include/krb5/krb5.h:2964
   KV5M_PRIV : constant := (-1760647396);  --  /usr/include/krb5/krb5.h:2965
   KV5M_PRIV_ENC_PART : constant := (-1760647395);  --  /usr/include/krb5/krb5.h:2966
   KV5M_CRED : constant := (-1760647394);  --  /usr/include/krb5/krb5.h:2967
   KV5M_CRED_INFO : constant := (-1760647393);  --  /usr/include/krb5/krb5.h:2968
   KV5M_CRED_ENC_PART : constant := (-1760647392);  --  /usr/include/krb5/krb5.h:2969
   KV5M_PWD_DATA : constant := (-1760647391);  --  /usr/include/krb5/krb5.h:2970
   KV5M_ADDRESS : constant := (-1760647390);  --  /usr/include/krb5/krb5.h:2971
   KV5M_KEYTAB_ENTRY : constant := (-1760647389);  --  /usr/include/krb5/krb5.h:2972
   KV5M_CONTEXT : constant := (-1760647388);  --  /usr/include/krb5/krb5.h:2973
   KV5M_OS_CONTEXT : constant := (-1760647387);  --  /usr/include/krb5/krb5.h:2974
   KV5M_ALT_METHOD : constant := (-1760647386);  --  /usr/include/krb5/krb5.h:2975
   KV5M_ETYPE_INFO_ENTRY : constant := (-1760647385);  --  /usr/include/krb5/krb5.h:2976
   KV5M_DB_CONTEXT : constant := (-1760647384);  --  /usr/include/krb5/krb5.h:2977
   KV5M_AUTH_CONTEXT : constant := (-1760647383);  --  /usr/include/krb5/krb5.h:2978
   KV5M_KEYTAB : constant := (-1760647382);  --  /usr/include/krb5/krb5.h:2979
   KV5M_RCACHE : constant := (-1760647381);  --  /usr/include/krb5/krb5.h:2980
   KV5M_CCACHE : constant := (-1760647380);  --  /usr/include/krb5/krb5.h:2981
   KV5M_PREAUTH_OPS : constant := (-1760647379);  --  /usr/include/krb5/krb5.h:2982
   KV5M_SAM_CHALLENGE : constant := (-1760647378);  --  /usr/include/krb5/krb5.h:2983
   KV5M_SAM_CHALLENGE_2 : constant := (-1760647377);  --  /usr/include/krb5/krb5.h:2984
   KV5M_SAM_KEY : constant := (-1760647376);  --  /usr/include/krb5/krb5.h:2985
   KV5M_ENC_SAM_RESPONSE_ENC : constant := (-1760647375);  --  /usr/include/krb5/krb5.h:2986
   KV5M_ENC_SAM_RESPONSE_ENC_2 : constant := (-1760647374);  --  /usr/include/krb5/krb5.h:2987
   KV5M_SAM_RESPONSE : constant := (-1760647373);  --  /usr/include/krb5/krb5.h:2988
   KV5M_SAM_RESPONSE_2 : constant := (-1760647372);  --  /usr/include/krb5/krb5.h:2989
   KV5M_PREDICTED_SAM_RESPONSE : constant := (-1760647371);  --  /usr/include/krb5/krb5.h:2990
   KV5M_PASSWD_PHRASE_ELEMENT : constant := (-1760647370);  --  /usr/include/krb5/krb5.h:2991
   KV5M_GSS_OID : constant := (-1760647369);  --  /usr/include/krb5/krb5.h:2992
   KV5M_GSS_QUEUE : constant := (-1760647368);  --  /usr/include/krb5/krb5.h:2993
   KV5M_FAST_ARMORED_REQ : constant := (-1760647367);  --  /usr/include/krb5/krb5.h:2994
   KV5M_FAST_REQ : constant := (-1760647366);  --  /usr/include/krb5/krb5.h:2995
   KV5M_FAST_RESPONSE : constant := (-1760647365);  --  /usr/include/krb5/krb5.h:2996
   KV5M_AUTHDATA_CONTEXT : constant := (-1760647364);  --  /usr/include/krb5/krb5.h:2997

   ERROR_TABLE_BASE_kv5m : constant := (-1760647424);  --  /usr/include/krb5/krb5.h:3004
   --  unsupported macro: init_kv5m_err_tbl initialize_kv5m_error_table
   --  unsupported macro: kv5m_err_base ERROR_TABLE_BASE_kv5m

   KRB524_BADKEY : constant := (-1750206208);  --  /usr/include/krb5/krb5.h:3016
   KRB524_BADADDR : constant := (-1750206207);  --  /usr/include/krb5/krb5.h:3017
   KRB524_BADPRINC : constant := (-1750206206);  --  /usr/include/krb5/krb5.h:3018
   KRB524_BADREALM : constant := (-1750206205);  --  /usr/include/krb5/krb5.h:3019
   KRB524_V4ERR : constant := (-1750206204);  --  /usr/include/krb5/krb5.h:3020
   KRB524_ENCFULL : constant := (-1750206203);  --  /usr/include/krb5/krb5.h:3021
   KRB524_DECEMPTY : constant := (-1750206202);  --  /usr/include/krb5/krb5.h:3022
   KRB524_NOTRESP : constant := (-1750206201);  --  /usr/include/krb5/krb5.h:3023
   KRB524_KRB4_DISABLED : constant := (-1750206200);  --  /usr/include/krb5/krb5.h:3024

   ERROR_TABLE_BASE_k524 : constant := (-1750206208);  --  /usr/include/krb5/krb5.h:3031
   --  unsupported macro: init_k524_err_tbl initialize_k524_error_table
   --  unsupported macro: k524_err_base ERROR_TABLE_BASE_k524

   ASN1_BAD_TIMEFORMAT : constant := (1859794432);  --  /usr/include/krb5/krb5.h:3043
   ASN1_MISSING_FIELD : constant := (1859794433);  --  /usr/include/krb5/krb5.h:3044
   ASN1_MISPLACED_FIELD : constant := (1859794434);  --  /usr/include/krb5/krb5.h:3045
   ASN1_TYPE_MISMATCH : constant := (1859794435);  --  /usr/include/krb5/krb5.h:3046
   ASN1_OVERFLOW : constant := (1859794436);  --  /usr/include/krb5/krb5.h:3047
   ASN1_OVERRUN : constant := (1859794437);  --  /usr/include/krb5/krb5.h:3048
   ASN1_BAD_ID : constant := (1859794438);  --  /usr/include/krb5/krb5.h:3049
   ASN1_BAD_LENGTH : constant := (1859794439);  --  /usr/include/krb5/krb5.h:3050
   ASN1_BAD_FORMAT : constant := (1859794440);  --  /usr/include/krb5/krb5.h:3051
   ASN1_PARSE_ERROR : constant := (1859794441);  --  /usr/include/krb5/krb5.h:3052
   ASN1_BAD_GMTIME : constant := (1859794442);  --  /usr/include/krb5/krb5.h:3053
   ASN1_MISMATCH_INDEF : constant := (1859794443);  --  /usr/include/krb5/krb5.h:3054
   ASN1_MISSING_EOC : constant := (1859794444);  --  /usr/include/krb5/krb5.h:3055

   ERROR_TABLE_BASE_asn1 : constant := (1859794432);  --  /usr/include/krb5/krb5.h:3062
   --  unsupported macro: init_asn1_err_tbl initialize_asn1_error_table
   --  unsupported macro: asn1_err_base ERROR_TABLE_BASE_asn1

   --  skipped empty struct u_profile_t

   subtype krb5_octet is unsigned_char;  -- /usr/include/krb5/krb5.h:141

   subtype krb5_int16 is short;  -- /usr/include/krb5/krb5.h:147

   subtype krb5_ui_2 is unsigned_short;  -- /usr/include/krb5/krb5.h:148

   subtype krb5_int32 is int;  -- /usr/include/krb5/krb5.h:154

   subtype krb5_ui_4 is unsigned;  -- /usr/include/krb5/krb5.h:155

   subtype krb5_boolean is unsigned;  -- /usr/include/krb5/krb5.h:198

   subtype krb5_msgtype is unsigned;  -- /usr/include/krb5/krb5.h:199

   subtype krb5_kvno is unsigned;  -- /usr/include/krb5/krb5.h:200

   subtype krb5_addrtype is krb5_int32;  -- /usr/include/krb5/krb5.h:202

   subtype krb5_enctype is krb5_int32;  -- /usr/include/krb5/krb5.h:203

   subtype krb5_cksumtype is krb5_int32;  -- /usr/include/krb5/krb5.h:204

   subtype krb5_authdatatype is krb5_int32;  -- /usr/include/krb5/krb5.h:205

   subtype krb5_keyusage is krb5_int32;  -- /usr/include/krb5/krb5.h:206

   subtype krb5_cryptotype is krb5_int32;  -- /usr/include/krb5/krb5.h:207

   subtype krb5_preauthtype is krb5_int32;  -- /usr/include/krb5/krb5.h:209

   subtype krb5_flags is krb5_int32;  -- /usr/include/krb5/krb5.h:210

   subtype krb5_timestamp is krb5_int32;  -- /usr/include/krb5/krb5.h:211

   subtype krb5_error_code is krb5_int32;  -- /usr/include/krb5/krb5.h:212

   subtype krb5_deltat is krb5_int32;  -- /usr/include/krb5/krb5.h:213

   subtype krb5_magic is krb5_error_code;  -- /usr/include/krb5/krb5.h:215

   type u_krb5_data is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:218
      length : aliased unsigned;  -- /usr/include/krb5/krb5.h:219
      data : Interfaces.C.Strings.chars_ptr;  -- /usr/include/krb5/krb5.h:220
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_data);  -- /usr/include/krb5/krb5.h:217

   subtype krb5_data is u_krb5_data;

   type u_krb5_octet_data is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:224
      length : aliased unsigned;  -- /usr/include/krb5/krb5.h:225
      data : access krb5_octet;  -- /usr/include/krb5/krb5.h:226
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_octet_data);  -- /usr/include/krb5/krb5.h:223

   subtype krb5_octet_data is u_krb5_octet_data;

   type krb5_pointer is new System.Address;  -- /usr/include/krb5/krb5.h:238

   type krb5_const_pointer is new System.Address;  -- /usr/include/krb5/krb5.h:239

   type krb5_principal_data is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:242
      realm : aliased krb5_data;  -- /usr/include/krb5/krb5.h:243
      data : access krb5_data;  -- /usr/include/krb5/krb5.h:244
      length : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:245
      c_type : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:246
   end record;
   pragma Convention (C_Pass_By_Copy, krb5_principal_data);  -- /usr/include/krb5/krb5.h:241

   type krb5_principal is access all krb5_principal_data;  -- /usr/include/krb5/krb5.h:249

   type krb5_const_principal is access constant krb5_principal_data;  -- /usr/include/krb5/krb5.h:284

   function krb5_is_referral_realm (arg1 : System.Address) return krb5_boolean;  -- /usr/include/krb5/krb5.h:306
   pragma Import (C, krb5_is_referral_realm, "krb5_is_referral_realm");

   function krb5_anonymous_realm return System.Address;  -- /usr/include/krb5/krb5.h:309
   pragma Import (C, krb5_anonymous_realm, "krb5_anonymous_realm");

   function krb5_anonymous_principal return krb5_const_principal;  -- /usr/include/krb5/krb5.h:310
   pragma Import (C, krb5_anonymous_principal, "krb5_anonymous_principal");

   type u_krb5_address is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:324
      addrtype : aliased krb5_addrtype;  -- /usr/include/krb5/krb5.h:325
      length : aliased unsigned;  -- /usr/include/krb5/krb5.h:326
      contents : access krb5_octet;  -- /usr/include/krb5/krb5.h:327
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_address);  -- /usr/include/krb5/krb5.h:323

   subtype krb5_address is u_krb5_address;

   --  skipped empty struct u_krb5_context

   type krb5_context is new System.Address;  -- /usr/include/krb5/krb5.h:351

   --  skipped empty struct u_krb5_auth_context

   type krb5_auth_context is new System.Address;  -- /usr/include/krb5/krb5.h:354

   --  skipped empty struct u_krb5_cryptosystem_entry

   type u_krb5_keyblock is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:364
      enctype : aliased krb5_enctype;  -- /usr/include/krb5/krb5.h:365
      length : aliased unsigned;  -- /usr/include/krb5/krb5.h:366
      contents : access krb5_octet;  -- /usr/include/krb5/krb5.h:367
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_keyblock);  -- /usr/include/krb5/krb5.h:363

   subtype krb5_keyblock is u_krb5_keyblock;

   --  skipped empty struct krb5_key_st

   type krb5_key is new System.Address;  -- /usr/include/krb5/krb5.h:378

   type u_krb5_encrypt_block is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:382
      crypto_entry : aliased krb5_enctype;  -- /usr/include/krb5/krb5.h:383
      key : access krb5_keyblock;  -- /usr/include/krb5/krb5.h:386
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_encrypt_block);  -- /usr/include/krb5/krb5.h:381

   subtype krb5_encrypt_block is u_krb5_encrypt_block;

   type u_krb5_checksum is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:391
      checksum_type : aliased krb5_cksumtype;  -- /usr/include/krb5/krb5.h:392
      length : aliased unsigned;  -- /usr/include/krb5/krb5.h:393
      contents : access krb5_octet;  -- /usr/include/krb5/krb5.h:394
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_checksum);  -- /usr/include/krb5/krb5.h:390

   subtype krb5_checksum is u_krb5_checksum;

   type u_krb5_enc_data is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:398
      enctype : aliased krb5_enctype;  -- /usr/include/krb5/krb5.h:399
      kvno : aliased krb5_kvno;  -- /usr/include/krb5/krb5.h:400
      ciphertext : aliased krb5_data;  -- /usr/include/krb5/krb5.h:401
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_enc_data);  -- /usr/include/krb5/krb5.h:397

   subtype krb5_enc_data is u_krb5_enc_data;

   type u_krb5_crypto_iov is record
      flags : aliased krb5_cryptotype;  -- /usr/include/krb5/krb5.h:405
      data : aliased krb5_data;  -- /usr/include/krb5/krb5.h:406
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_crypto_iov);  -- /usr/include/krb5/krb5.h:404

   subtype krb5_crypto_iov is u_krb5_crypto_iov;

   function krb5_c_encrypt
     (context : krb5_context;
      key : System.Address;
      usage : krb5_keyusage;
      cipher_state : System.Address;
      input : System.Address;
      output : access krb5_enc_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:487
   pragma Import (C, krb5_c_encrypt, "krb5_c_encrypt");

   function krb5_c_decrypt
     (context : krb5_context;
      key : System.Address;
      usage : krb5_keyusage;
      cipher_state : System.Address;
      input : System.Address;
      output : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:492
   pragma Import (C, krb5_c_decrypt, "krb5_c_decrypt");

   function krb5_c_encrypt_length
     (context : krb5_context;
      enctype : krb5_enctype;
      inputlen : size_t;
      length : access size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:497
   pragma Import (C, krb5_c_encrypt_length, "krb5_c_encrypt_length");

   function krb5_c_block_size
     (context : krb5_context;
      enctype : krb5_enctype;
      blocksize : access size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:501
   pragma Import (C, krb5_c_block_size, "krb5_c_block_size");

   function krb5_c_keylengths
     (context : krb5_context;
      enctype : krb5_enctype;
      keybytes : access size_t;
      keylength : access size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:505
   pragma Import (C, krb5_c_keylengths, "krb5_c_keylengths");

   function krb5_c_init_state
     (context : krb5_context;
      key : System.Address;
      usage : krb5_keyusage;
      new_state : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:509
   pragma Import (C, krb5_c_init_state, "krb5_c_init_state");

   function krb5_c_free_state
     (context : krb5_context;
      key : System.Address;
      state : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:513
   pragma Import (C, krb5_c_free_state, "krb5_c_free_state");

   function krb5_c_prf
     (arg1 : krb5_context;
      arg2 : System.Address;
      c_in : access krb5_data;
      c_out : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:517
   pragma Import (C, krb5_c_prf, "krb5_c_prf");

   function krb5_c_prf_length
     (arg1 : krb5_context;
      arg2 : krb5_enctype;
      outlen : access size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:520
   pragma Import (C, krb5_c_prf_length, "krb5_c_prf_length");

   function krb5_c_fx_cf2_simple
     (context : krb5_context;
      k1 : access krb5_keyblock;
      pepper1 : Interfaces.C.Strings.chars_ptr;
      k2 : access krb5_keyblock;
      pepper2 : Interfaces.C.Strings.chars_ptr;
      c_out : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:523
   pragma Import (C, krb5_c_fx_cf2_simple, "krb5_c_fx_cf2_simple");

   function krb5_c_make_random_key
     (context : krb5_context;
      enctype : krb5_enctype;
      k5_random_key : access krb5_keyblock) return krb5_error_code;  -- /usr/include/krb5/krb5.h:538
   pragma Import (C, krb5_c_make_random_key, "krb5_c_make_random_key");

   function krb5_c_random_to_key
     (context : krb5_context;
      enctype : krb5_enctype;
      random_data : access krb5_data;
      k5_random_key : access krb5_keyblock) return krb5_error_code;  -- /usr/include/krb5/krb5.h:542
   pragma Import (C, krb5_c_random_to_key, "krb5_c_random_to_key");

   function krb5_c_random_add_entropy
     (context : krb5_context;
      randsource_id : unsigned;
      data : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:551
   pragma Import (C, krb5_c_random_add_entropy, "krb5_c_random_add_entropy");

   function krb5_c_random_make_octets (context : krb5_context; data : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:555
   pragma Import (C, krb5_c_random_make_octets, "krb5_c_random_make_octets");

   function krb5_c_random_os_entropy
     (context : krb5_context;
      strong : int;
      success : access int) return krb5_error_code;  -- /usr/include/krb5/krb5.h:567
   pragma Import (C, krb5_c_random_os_entropy, "krb5_c_random_os_entropy");

   function krb5_c_random_seed (context : krb5_context; data : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:570
   pragma Import (C, krb5_c_random_seed, "krb5_c_random_seed");

   function krb5_c_string_to_key
     (context : krb5_context;
      enctype : krb5_enctype;
      string : System.Address;
      salt : System.Address;
      key : access krb5_keyblock) return krb5_error_code;  -- /usr/include/krb5/krb5.h:573
   pragma Import (C, krb5_c_string_to_key, "krb5_c_string_to_key");

   function krb5_c_string_to_key_with_params
     (context : krb5_context;
      enctype : krb5_enctype;
      string : System.Address;
      salt : System.Address;
      params : System.Address;
      key : access krb5_keyblock) return krb5_error_code;  -- /usr/include/krb5/krb5.h:578
   pragma Import (C, krb5_c_string_to_key_with_params, "krb5_c_string_to_key_with_params");

   function krb5_c_enctype_compare
     (context : krb5_context;
      e1 : krb5_enctype;
      e2 : krb5_enctype;
      similar : access krb5_boolean) return krb5_error_code;  -- /usr/include/krb5/krb5.h:586
   pragma Import (C, krb5_c_enctype_compare, "krb5_c_enctype_compare");

   function krb5_c_make_checksum
     (context : krb5_context;
      cksumtype : krb5_cksumtype;
      key : System.Address;
      usage : krb5_keyusage;
      input : System.Address;
      cksum : access krb5_checksum) return krb5_error_code;  -- /usr/include/krb5/krb5.h:590
   pragma Import (C, krb5_c_make_checksum, "krb5_c_make_checksum");

   function krb5_c_verify_checksum
     (context : krb5_context;
      key : System.Address;
      usage : krb5_keyusage;
      data : System.Address;
      cksum : System.Address;
      valid : access krb5_boolean) return krb5_error_code;  -- /usr/include/krb5/krb5.h:595
   pragma Import (C, krb5_c_verify_checksum, "krb5_c_verify_checksum");

   function krb5_c_checksum_length
     (context : krb5_context;
      cksumtype : krb5_cksumtype;
      length : access size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:600
   pragma Import (C, krb5_c_checksum_length, "krb5_c_checksum_length");

   function krb5_c_keyed_checksum_types
     (context : krb5_context;
      enctype : krb5_enctype;
      count : access unsigned;
      cksumtypes : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:604
   pragma Import (C, krb5_c_keyed_checksum_types, "krb5_c_keyed_checksum_types");

   function krb5_c_valid_enctype (ktype : krb5_enctype) return krb5_boolean;  -- /usr/include/krb5/krb5.h:659
   pragma Import (C, krb5_c_valid_enctype, "krb5_c_valid_enctype");

   function krb5_c_valid_cksumtype (ctype : krb5_cksumtype) return krb5_boolean;  -- /usr/include/krb5/krb5.h:660
   pragma Import (C, krb5_c_valid_cksumtype, "krb5_c_valid_cksumtype");

   function krb5_c_is_coll_proof_cksum (ctype : krb5_cksumtype) return krb5_boolean;  -- /usr/include/krb5/krb5.h:661
   pragma Import (C, krb5_c_is_coll_proof_cksum, "krb5_c_is_coll_proof_cksum");

   function krb5_c_is_keyed_cksum (ctype : krb5_cksumtype) return krb5_boolean;  -- /usr/include/krb5/krb5.h:662
   pragma Import (C, krb5_c_is_keyed_cksum, "krb5_c_is_keyed_cksum");

   function krb5_c_make_checksum_iov
     (context : krb5_context;
      cksumtype : krb5_cksumtype;
      key : System.Address;
      usage : krb5_keyusage;
      data : access krb5_crypto_iov;
      num_data : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:675
   pragma Import (C, krb5_c_make_checksum_iov, "krb5_c_make_checksum_iov");

   function krb5_c_verify_checksum_iov
     (context : krb5_context;
      cksumtype : krb5_cksumtype;
      key : System.Address;
      usage : krb5_keyusage;
      data : System.Address;
      num_data : size_t;
      valid : access krb5_boolean) return krb5_error_code;  -- /usr/include/krb5/krb5.h:680
   pragma Import (C, krb5_c_verify_checksum_iov, "krb5_c_verify_checksum_iov");

   function krb5_c_encrypt_iov
     (context : krb5_context;
      key : System.Address;
      usage : krb5_keyusage;
      cipher_state : System.Address;
      data : access krb5_crypto_iov;
      num_data : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:686
   pragma Import (C, krb5_c_encrypt_iov, "krb5_c_encrypt_iov");

   function krb5_c_decrypt_iov
     (context : krb5_context;
      key : System.Address;
      usage : krb5_keyusage;
      cipher_state : System.Address;
      data : access krb5_crypto_iov;
      num_data : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:691
   pragma Import (C, krb5_c_decrypt_iov, "krb5_c_decrypt_iov");

   function krb5_c_crypto_length
     (context : krb5_context;
      enctype : krb5_enctype;
      c_type : krb5_cryptotype;
      size : access unsigned) return krb5_error_code;  -- /usr/include/krb5/krb5.h:696
   pragma Import (C, krb5_c_crypto_length, "krb5_c_crypto_length");

   function krb5_c_crypto_length_iov
     (context : krb5_context;
      enctype : krb5_enctype;
      data : access krb5_crypto_iov;
      num_data : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:700
   pragma Import (C, krb5_c_crypto_length_iov, "krb5_c_crypto_length_iov");

   function krb5_c_padding_length
     (context : krb5_context;
      enctype : krb5_enctype;
      data_length : size_t;
      size : access unsigned) return krb5_error_code;  -- /usr/include/krb5/krb5.h:704
   pragma Import (C, krb5_c_padding_length, "krb5_c_padding_length");

   function krb5_k_create_key
     (context : krb5_context;
      key_data : System.Address;
      c_out : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:708
   pragma Import (C, krb5_k_create_key, "krb5_k_create_key");

   procedure krb5_k_reference_key (context : krb5_context; key : krb5_key);  -- /usr/include/krb5/krb5.h:712
   pragma Import (C, krb5_k_reference_key, "krb5_k_reference_key");

   procedure krb5_k_free_key (context : krb5_context; key : krb5_key);  -- /usr/include/krb5/krb5.h:715
   pragma Import (C, krb5_k_free_key, "krb5_k_free_key");

   function krb5_k_key_keyblock
     (context : krb5_context;
      key : krb5_key;
      key_data : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:718
   pragma Import (C, krb5_k_key_keyblock, "krb5_k_key_keyblock");

   function krb5_k_key_enctype (context : krb5_context; key : krb5_key) return krb5_enctype;  -- /usr/include/krb5/krb5.h:722
   pragma Import (C, krb5_k_key_enctype, "krb5_k_key_enctype");

   function krb5_k_encrypt
     (context : krb5_context;
      key : krb5_key;
      usage : krb5_keyusage;
      cipher_state : System.Address;
      input : System.Address;
      output : access krb5_enc_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:725
   pragma Import (C, krb5_k_encrypt, "krb5_k_encrypt");

   function krb5_k_encrypt_iov
     (context : krb5_context;
      key : krb5_key;
      usage : krb5_keyusage;
      cipher_state : System.Address;
      data : access krb5_crypto_iov;
      num_data : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:730
   pragma Import (C, krb5_k_encrypt_iov, "krb5_k_encrypt_iov");

   function krb5_k_decrypt
     (context : krb5_context;
      key : krb5_key;
      usage : krb5_keyusage;
      cipher_state : System.Address;
      input : System.Address;
      output : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:735
   pragma Import (C, krb5_k_decrypt, "krb5_k_decrypt");

   function krb5_k_decrypt_iov
     (context : krb5_context;
      key : krb5_key;
      usage : krb5_keyusage;
      cipher_state : System.Address;
      data : access krb5_crypto_iov;
      num_data : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:740
   pragma Import (C, krb5_k_decrypt_iov, "krb5_k_decrypt_iov");

   function krb5_k_make_checksum
     (context : krb5_context;
      cksumtype : krb5_cksumtype;
      key : krb5_key;
      usage : krb5_keyusage;
      input : System.Address;
      cksum : access krb5_checksum) return krb5_error_code;  -- /usr/include/krb5/krb5.h:745
   pragma Import (C, krb5_k_make_checksum, "krb5_k_make_checksum");

   function krb5_k_make_checksum_iov
     (context : krb5_context;
      cksumtype : krb5_cksumtype;
      key : krb5_key;
      usage : krb5_keyusage;
      data : access krb5_crypto_iov;
      num_data : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:750
   pragma Import (C, krb5_k_make_checksum_iov, "krb5_k_make_checksum_iov");

   function krb5_k_verify_checksum
     (context : krb5_context;
      key : krb5_key;
      usage : krb5_keyusage;
      data : System.Address;
      cksum : System.Address;
      valid : access krb5_boolean) return krb5_error_code;  -- /usr/include/krb5/krb5.h:755
   pragma Import (C, krb5_k_verify_checksum, "krb5_k_verify_checksum");

   function krb5_k_verify_checksum_iov
     (context : krb5_context;
      cksumtype : krb5_cksumtype;
      key : krb5_key;
      usage : krb5_keyusage;
      data : System.Address;
      num_data : size_t;
      valid : access krb5_boolean) return krb5_error_code;  -- /usr/include/krb5/krb5.h:760
   pragma Import (C, krb5_k_verify_checksum_iov, "krb5_k_verify_checksum_iov");

   function krb5_k_prf
     (context : krb5_context;
      key : krb5_key;
      c_in : access krb5_data;
      c_out : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:766
   pragma Import (C, krb5_k_prf, "krb5_k_prf");

   function krb5_encrypt
     (context : krb5_context;
      inptr : krb5_const_pointer;
      outptr : krb5_pointer;
      size : size_t;
      eblock : access krb5_encrypt_block;
      ivec : krb5_pointer) return krb5_error_code;  -- /usr/include/krb5/krb5.h:774
   pragma Import (C, krb5_encrypt, "krb5_encrypt");

   function krb5_decrypt
     (context : krb5_context;
      inptr : krb5_const_pointer;
      outptr : krb5_pointer;
      size : size_t;
      eblock : access krb5_encrypt_block;
      ivec : krb5_pointer) return krb5_error_code;  -- /usr/include/krb5/krb5.h:779
   pragma Import (C, krb5_decrypt, "krb5_decrypt");

   function krb5_process_key
     (context : krb5_context;
      eblock : access krb5_encrypt_block;
      key : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:784
   pragma Import (C, krb5_process_key, "krb5_process_key");

   function krb5_finish_key (context : krb5_context; eblock : access krb5_encrypt_block) return krb5_error_code;  -- /usr/include/krb5/krb5.h:788
   pragma Import (C, krb5_finish_key, "krb5_finish_key");

   function krb5_string_to_key
     (context : krb5_context;
      eblock : System.Address;
      keyblock : access krb5_keyblock;
      data : System.Address;
      salt : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:791
   pragma Import (C, krb5_string_to_key, "krb5_string_to_key");

   function krb5_init_random_key
     (context : krb5_context;
      eblock : System.Address;
      keyblock : System.Address;
      ptr : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:796
   pragma Import (C, krb5_init_random_key, "krb5_init_random_key");

   function krb5_finish_random_key
     (context : krb5_context;
      eblock : System.Address;
      ptr : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:800
   pragma Import (C, krb5_finish_random_key, "krb5_finish_random_key");

   function krb5_random_key
     (context : krb5_context;
      eblock : System.Address;
      ptr : krb5_pointer;
      keyblock : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:804
   pragma Import (C, krb5_random_key, "krb5_random_key");

   function krb5_eblock_enctype (context : krb5_context; eblock : System.Address) return krb5_enctype;  -- /usr/include/krb5/krb5.h:808
   pragma Import (C, krb5_eblock_enctype, "krb5_eblock_enctype");

   function krb5_use_enctype
     (context : krb5_context;
      eblock : access krb5_encrypt_block;
      enctype : krb5_enctype) return krb5_error_code;  -- /usr/include/krb5/krb5.h:811
   pragma Import (C, krb5_use_enctype, "krb5_use_enctype");

   function krb5_encrypt_size (length : size_t; crypto : krb5_enctype) return size_t;  -- /usr/include/krb5/krb5.h:815
   pragma Import (C, krb5_encrypt_size, "krb5_encrypt_size");

   function krb5_checksum_size (context : krb5_context; ctype : krb5_cksumtype) return size_t;  -- /usr/include/krb5/krb5.h:818
   pragma Import (C, krb5_checksum_size, "krb5_checksum_size");

   function krb5_calculate_checksum
     (context : krb5_context;
      ctype : krb5_cksumtype;
      c_in : krb5_const_pointer;
      in_length : size_t;
      seed : krb5_const_pointer;
      seed_length : size_t;
      outcksum : access krb5_checksum) return krb5_error_code;  -- /usr/include/krb5/krb5.h:821
   pragma Import (C, krb5_calculate_checksum, "krb5_calculate_checksum");

   function krb5_verify_checksum
     (context : krb5_context;
      ctype : krb5_cksumtype;
      cksum : System.Address;
      c_in : krb5_const_pointer;
      in_length : size_t;
      seed : krb5_const_pointer;
      seed_length : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:827
   pragma Import (C, krb5_verify_checksum, "krb5_verify_checksum");

   type u_krb5_ticket_times is record
      authtime : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1099
      starttime : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1101
      endtime : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1103
      renew_till : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1104
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_ticket_times);  -- /usr/include/krb5/krb5.h:1098

   subtype krb5_ticket_times is u_krb5_ticket_times;

   type u_krb5_authdata is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1109
      ad_type : aliased krb5_authdatatype;  -- /usr/include/krb5/krb5.h:1110
      length : aliased unsigned;  -- /usr/include/krb5/krb5.h:1111
      contents : access krb5_octet;  -- /usr/include/krb5/krb5.h:1112
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_authdata);  -- /usr/include/krb5/krb5.h:1108

   subtype krb5_authdata is u_krb5_authdata;

   type u_krb5_transited is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1117
      tr_type : aliased krb5_octet;  -- /usr/include/krb5/krb5.h:1118
      tr_contents : aliased krb5_data;  -- /usr/include/krb5/krb5.h:1119
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_transited);  -- /usr/include/krb5/krb5.h:1116

   subtype krb5_transited is u_krb5_transited;

   type u_krb5_enc_tkt_part is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1123
      flags : aliased krb5_flags;  -- /usr/include/krb5/krb5.h:1125
      session : access krb5_keyblock;  -- /usr/include/krb5/krb5.h:1126
      client : krb5_principal;  -- /usr/include/krb5/krb5.h:1127
      transited : aliased krb5_transited;  -- /usr/include/krb5/krb5.h:1128
      times : aliased krb5_ticket_times;  -- /usr/include/krb5/krb5.h:1129
      caddrs : System.Address;  -- /usr/include/krb5/krb5.h:1130
      authorization_data : System.Address;  -- /usr/include/krb5/krb5.h:1131
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_enc_tkt_part);  -- /usr/include/krb5/krb5.h:1122

   subtype krb5_enc_tkt_part is u_krb5_enc_tkt_part;

   type u_krb5_ticket is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1135
      server : krb5_principal;  -- /usr/include/krb5/krb5.h:1137
      enc_part : aliased krb5_enc_data;  -- /usr/include/krb5/krb5.h:1138
      enc_part2 : access krb5_enc_tkt_part;  -- /usr/include/krb5/krb5.h:1140
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_ticket);  -- /usr/include/krb5/krb5.h:1134

   subtype krb5_ticket is u_krb5_ticket;

   type u_krb5_authenticator is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1146
      client : krb5_principal;  -- /usr/include/krb5/krb5.h:1147
      checksum : access krb5_checksum;  -- /usr/include/krb5/krb5.h:1148
      cusec : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:1149
      ctime : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1150
      subkey : access krb5_keyblock;  -- /usr/include/krb5/krb5.h:1151
      seq_number : aliased krb5_ui_4;  -- /usr/include/krb5/krb5.h:1152
      authorization_data : System.Address;  -- /usr/include/krb5/krb5.h:1153
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_authenticator);  -- /usr/include/krb5/krb5.h:1145

   subtype krb5_authenticator is u_krb5_authenticator;

   type u_krb5_tkt_authent is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1157
      ticket : access krb5_ticket;  -- /usr/include/krb5/krb5.h:1158
      authenticator : access krb5_authenticator;  -- /usr/include/krb5/krb5.h:1159
      ap_options : aliased krb5_flags;  -- /usr/include/krb5/krb5.h:1160
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_tkt_authent);  -- /usr/include/krb5/krb5.h:1156

   subtype krb5_tkt_authent is u_krb5_tkt_authent;

   type u_krb5_creds is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1165
      client : krb5_principal;  -- /usr/include/krb5/krb5.h:1166
      server : krb5_principal;  -- /usr/include/krb5/krb5.h:1167
      keyblock : aliased krb5_keyblock;  -- /usr/include/krb5/krb5.h:1168
      times : aliased krb5_ticket_times;  -- /usr/include/krb5/krb5.h:1169
      is_skey : aliased krb5_boolean;  -- /usr/include/krb5/krb5.h:1170
      ticket_flags : aliased krb5_flags;  -- /usr/include/krb5/krb5.h:1172
      addresses : System.Address;  -- /usr/include/krb5/krb5.h:1173
      ticket : aliased krb5_data;  -- /usr/include/krb5/krb5.h:1174
      second_ticket : aliased krb5_data;  -- /usr/include/krb5/krb5.h:1175
      authdata : System.Address;  -- /usr/include/krb5/krb5.h:1178
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_creds);  -- /usr/include/krb5/krb5.h:1164

   subtype krb5_creds is u_krb5_creds;

   type u_krb5_last_req_entry is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1183
      lr_type : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:1184
      value : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1185
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_last_req_entry);  -- /usr/include/krb5/krb5.h:1182

   subtype krb5_last_req_entry is u_krb5_last_req_entry;

   type u_krb5_pa_data is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1190
      pa_type : aliased krb5_preauthtype;  -- /usr/include/krb5/krb5.h:1191
      length : aliased unsigned;  -- /usr/include/krb5/krb5.h:1192
      contents : access krb5_octet;  -- /usr/include/krb5/krb5.h:1193
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_pa_data);  -- /usr/include/krb5/krb5.h:1189

   subtype krb5_pa_data is u_krb5_pa_data;

   type u_krb5_typed_data is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1203
      c_type : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:1204
      length : aliased unsigned;  -- /usr/include/krb5/krb5.h:1205
      data : access krb5_octet;  -- /usr/include/krb5/krb5.h:1206
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_typed_data);  -- /usr/include/krb5/krb5.h:1202

   subtype krb5_typed_data is u_krb5_typed_data;

   type u_krb5_kdc_req is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1210
      msg_type : aliased krb5_msgtype;  -- /usr/include/krb5/krb5.h:1211
      padata : System.Address;  -- /usr/include/krb5/krb5.h:1212
      kdc_options : aliased krb5_flags;  -- /usr/include/krb5/krb5.h:1214
      client : krb5_principal;  -- /usr/include/krb5/krb5.h:1215
      server : krb5_principal;  -- /usr/include/krb5/krb5.h:1216
      from : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1218
      till : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1219
      rtime : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1220
      nonce : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:1221
      nktypes : aliased int;  -- /usr/include/krb5/krb5.h:1222
      ktype : access krb5_enctype;  -- /usr/include/krb5/krb5.h:1223
      addresses : System.Address;  -- /usr/include/krb5/krb5.h:1224
      authorization_data : aliased krb5_enc_data;  -- /usr/include/krb5/krb5.h:1225
      unenc_authdata : System.Address;  -- /usr/include/krb5/krb5.h:1226
      second_ticket : System.Address;  -- /usr/include/krb5/krb5.h:1228
      kdc_state : System.Address;  -- /usr/include/krb5/krb5.h:1235
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_kdc_req);  -- /usr/include/krb5/krb5.h:1209

   subtype krb5_kdc_req is u_krb5_kdc_req;

   type u_krb5_enc_kdc_rep_part is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1239
      msg_type : aliased krb5_msgtype;  -- /usr/include/krb5/krb5.h:1241
      session : access krb5_keyblock;  -- /usr/include/krb5/krb5.h:1242
      last_req : System.Address;  -- /usr/include/krb5/krb5.h:1243
      nonce : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:1244
      key_exp : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1245
      flags : aliased krb5_flags;  -- /usr/include/krb5/krb5.h:1246
      times : aliased krb5_ticket_times;  -- /usr/include/krb5/krb5.h:1247
      server : krb5_principal;  -- /usr/include/krb5/krb5.h:1248
      caddrs : System.Address;  -- /usr/include/krb5/krb5.h:1249
      enc_padata : System.Address;  -- /usr/include/krb5/krb5.h:1251
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_enc_kdc_rep_part);  -- /usr/include/krb5/krb5.h:1238

   subtype krb5_enc_kdc_rep_part is u_krb5_enc_kdc_rep_part;

   type u_krb5_kdc_rep is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1255
      msg_type : aliased krb5_msgtype;  -- /usr/include/krb5/krb5.h:1257
      padata : System.Address;  -- /usr/include/krb5/krb5.h:1258
      client : krb5_principal;  -- /usr/include/krb5/krb5.h:1259
      ticket : access krb5_ticket;  -- /usr/include/krb5/krb5.h:1260
      enc_part : aliased krb5_enc_data;  -- /usr/include/krb5/krb5.h:1261
      enc_part2 : access krb5_enc_kdc_rep_part;  -- /usr/include/krb5/krb5.h:1263
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_kdc_rep);  -- /usr/include/krb5/krb5.h:1254

   subtype krb5_kdc_rep is u_krb5_kdc_rep;

   type u_krb5_error is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1268
      ctime : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1270
      cusec : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:1271
      susec : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:1272
      stime : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1273
      error : aliased krb5_ui_4;  -- /usr/include/krb5/krb5.h:1274
      client : krb5_principal;  -- /usr/include/krb5/krb5.h:1275
      server : krb5_principal;  -- /usr/include/krb5/krb5.h:1277
      text : aliased krb5_data;  -- /usr/include/krb5/krb5.h:1278
      e_data : aliased krb5_data;  -- /usr/include/krb5/krb5.h:1279
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_error);  -- /usr/include/krb5/krb5.h:1267

   subtype krb5_error is u_krb5_error;

   type u_krb5_ap_req is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1283
      ap_options : aliased krb5_flags;  -- /usr/include/krb5/krb5.h:1284
      ticket : access krb5_ticket;  -- /usr/include/krb5/krb5.h:1285
      authenticator : aliased krb5_enc_data;  -- /usr/include/krb5/krb5.h:1286
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_ap_req);  -- /usr/include/krb5/krb5.h:1282

   subtype krb5_ap_req is u_krb5_ap_req;

   type u_krb5_ap_rep is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1290
      enc_part : aliased krb5_enc_data;  -- /usr/include/krb5/krb5.h:1291
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_ap_rep);  -- /usr/include/krb5/krb5.h:1289

   subtype krb5_ap_rep is u_krb5_ap_rep;

   type u_krb5_ap_rep_enc_part is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1295
      ctime : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1296
      cusec : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:1297
      subkey : access krb5_keyblock;  -- /usr/include/krb5/krb5.h:1298
      seq_number : aliased krb5_ui_4;  -- /usr/include/krb5/krb5.h:1299
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_ap_rep_enc_part);  -- /usr/include/krb5/krb5.h:1294

   subtype krb5_ap_rep_enc_part is u_krb5_ap_rep_enc_part;

   type u_krb5_response is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1303
      message_type : aliased krb5_octet;  -- /usr/include/krb5/krb5.h:1304
      response : aliased krb5_data;  -- /usr/include/krb5/krb5.h:1305
      expected_nonce : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:1306
      request_time : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1307
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_response);  -- /usr/include/krb5/krb5.h:1302

   subtype krb5_response is u_krb5_response;

   type u_krb5_cred_info is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1311
      session : access krb5_keyblock;  -- /usr/include/krb5/krb5.h:1312
      client : krb5_principal;  -- /usr/include/krb5/krb5.h:1314
      server : krb5_principal;  -- /usr/include/krb5/krb5.h:1315
      flags : aliased krb5_flags;  -- /usr/include/krb5/krb5.h:1316
      times : aliased krb5_ticket_times;  -- /usr/include/krb5/krb5.h:1317
      caddrs : System.Address;  -- /usr/include/krb5/krb5.h:1319
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_cred_info);  -- /usr/include/krb5/krb5.h:1310

   subtype krb5_cred_info is u_krb5_cred_info;

   type u_krb5_cred_enc_part is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1323
      nonce : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:1324
      timestamp : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1325
      usec : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:1326
      s_address : access krb5_address;  -- /usr/include/krb5/krb5.h:1327
      r_address : access krb5_address;  -- /usr/include/krb5/krb5.h:1328
      ticket_info : System.Address;  -- /usr/include/krb5/krb5.h:1329
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_cred_enc_part);  -- /usr/include/krb5/krb5.h:1322

   subtype krb5_cred_enc_part is u_krb5_cred_enc_part;

   type u_krb5_cred is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1333
      tickets : System.Address;  -- /usr/include/krb5/krb5.h:1334
      enc_part : aliased krb5_enc_data;  -- /usr/include/krb5/krb5.h:1335
      enc_part2 : access krb5_cred_enc_part;  -- /usr/include/krb5/krb5.h:1336
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_cred);  -- /usr/include/krb5/krb5.h:1332

   subtype krb5_cred is u_krb5_cred;

   type u_passwd_phrase_element is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1341
      passwd : access krb5_data;  -- /usr/include/krb5/krb5.h:1342
      phrase : access krb5_data;  -- /usr/include/krb5/krb5.h:1343
   end record;
   pragma Convention (C_Pass_By_Copy, u_passwd_phrase_element);  -- /usr/include/krb5/krb5.h:1340

   subtype passwd_phrase_element is u_passwd_phrase_element;

   type u_krb5_pwd_data is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1347
      sequence_count : aliased int;  -- /usr/include/krb5/krb5.h:1348
      element : System.Address;  -- /usr/include/krb5/krb5.h:1349
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_pwd_data);  -- /usr/include/krb5/krb5.h:1346

   subtype krb5_pwd_data is u_krb5_pwd_data;

   type u_krb5_pa_svr_referral_data is record
      principal : krb5_principal;  -- /usr/include/krb5/krb5.h:1359
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_pa_svr_referral_data);  -- /usr/include/krb5/krb5.h:1357

   subtype krb5_pa_svr_referral_data is u_krb5_pa_svr_referral_data;

   type u_krb5_pa_server_referral_data is record
      referred_realm : access krb5_data;  -- /usr/include/krb5/krb5.h:1363
      true_principal_name : krb5_principal;  -- /usr/include/krb5/krb5.h:1364
      requested_principal_name : krb5_principal;  -- /usr/include/krb5/krb5.h:1365
      referral_valid_until : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1366
      rep_cksum : aliased krb5_checksum;  -- /usr/include/krb5/krb5.h:1367
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_pa_server_referral_data);  -- /usr/include/krb5/krb5.h:1362

   subtype krb5_pa_server_referral_data is u_krb5_pa_server_referral_data;

   type u_krb5_pa_pac_req is record
      include_pac : aliased krb5_boolean;  -- /usr/include/krb5/krb5.h:1372
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_pa_pac_req);  -- /usr/include/krb5/krb5.h:1370

   subtype krb5_pa_pac_req is u_krb5_pa_pac_req;

   type krb5_replay_data is record
      timestamp : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1387
      usec : aliased krb5_int32;  -- /usr/include/krb5/krb5.h:1388
      seq : aliased krb5_ui_4;  -- /usr/include/krb5/krb5.h:1389
   end record;
   pragma Convention (C_Pass_By_Copy, krb5_replay_data);  -- /usr/include/krb5/krb5.h:1386

   type krb5_mk_req_checksum_func is access function
        (arg1 : krb5_context;
         arg2 : krb5_auth_context;
         arg3 : System.Address;
         arg4 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1402

   subtype krb5_cc_cursor is krb5_pointer;  -- /usr/include/krb5/krb5.h:1414

   --  skipped empty struct u_krb5_ccache

   type krb5_ccache is new System.Address;  -- /usr/include/krb5/krb5.h:1417

   --  skipped empty struct u_krb5_cc_ops

   --  skipped empty struct krb5_cc_ops

   --  skipped empty struct u_krb5_cccol_cursor

   type krb5_cccol_cursor is new System.Address;  -- /usr/include/krb5/krb5.h:1425

   function krb5_cc_get_name (context : krb5_context; cache : krb5_ccache) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/krb5/krb5.h:1444
   pragma Import (C, krb5_cc_get_name, "krb5_cc_get_name");

   function krb5_cc_gen_new (context : krb5_context; cache : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1447
   pragma Import (C, krb5_cc_gen_new, "krb5_cc_gen_new");

   function krb5_cc_initialize
     (context : krb5_context;
      cache : krb5_ccache;
      principal : krb5_principal) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1450
   pragma Import (C, krb5_cc_initialize, "krb5_cc_initialize");

   function krb5_cc_destroy (context : krb5_context; cache : krb5_ccache) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1454
   pragma Import (C, krb5_cc_destroy, "krb5_cc_destroy");

   function krb5_cc_close (context : krb5_context; cache : krb5_ccache) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1457
   pragma Import (C, krb5_cc_close, "krb5_cc_close");

   function krb5_cc_store_cred
     (context : krb5_context;
      cache : krb5_ccache;
      creds : access krb5_creds) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1460
   pragma Import (C, krb5_cc_store_cred, "krb5_cc_store_cred");

   function krb5_cc_retrieve_cred
     (context : krb5_context;
      cache : krb5_ccache;
      flags : krb5_flags;
      mcreds : access krb5_creds;
      creds : access krb5_creds) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1463
   pragma Import (C, krb5_cc_retrieve_cred, "krb5_cc_retrieve_cred");

   function krb5_cc_get_principal
     (context : krb5_context;
      cache : krb5_ccache;
      principal : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1468
   pragma Import (C, krb5_cc_get_principal, "krb5_cc_get_principal");

   function krb5_cc_start_seq_get
     (context : krb5_context;
      cache : krb5_ccache;
      cursor : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1472
   pragma Import (C, krb5_cc_start_seq_get, "krb5_cc_start_seq_get");

   function krb5_cc_next_cred
     (context : krb5_context;
      cache : krb5_ccache;
      cursor : System.Address;
      creds : access krb5_creds) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1476
   pragma Import (C, krb5_cc_next_cred, "krb5_cc_next_cred");

   function krb5_cc_end_seq_get
     (context : krb5_context;
      cache : krb5_ccache;
      cursor : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1480
   pragma Import (C, krb5_cc_end_seq_get, "krb5_cc_end_seq_get");

   function krb5_cc_remove_cred
     (context : krb5_context;
      cache : krb5_ccache;
      flags : krb5_flags;
      creds : access krb5_creds) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1484
   pragma Import (C, krb5_cc_remove_cred, "krb5_cc_remove_cred");

   function krb5_cc_set_flags
     (context : krb5_context;
      cache : krb5_ccache;
      flags : krb5_flags) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1488
   pragma Import (C, krb5_cc_set_flags, "krb5_cc_set_flags");

   function krb5_cc_get_flags
     (context : krb5_context;
      cache : krb5_ccache;
      flags : access krb5_flags) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1491
   pragma Import (C, krb5_cc_get_flags, "krb5_cc_get_flags");

   function krb5_cc_get_type (context : krb5_context; cache : krb5_ccache) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/krb5/krb5.h:1494
   pragma Import (C, krb5_cc_get_type, "krb5_cc_get_type");

   function krb5_cc_move
     (context : krb5_context;
      src : krb5_ccache;
      dst : krb5_ccache) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1497
   pragma Import (C, krb5_cc_move, "krb5_cc_move");

   function krb5_cc_last_change_time
     (context : krb5_context;
      ccache : krb5_ccache;
      change_time : access krb5_timestamp) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1500
   pragma Import (C, krb5_cc_last_change_time, "krb5_cc_last_change_time");

   function krb5_cc_lock (context : krb5_context; ccache : krb5_ccache) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1504
   pragma Import (C, krb5_cc_lock, "krb5_cc_lock");

   function krb5_cc_unlock (context : krb5_context; ccache : krb5_ccache) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1507
   pragma Import (C, krb5_cc_unlock, "krb5_cc_unlock");

   function krb5_cccol_cursor_new (context : krb5_context; cursor : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1510
   pragma Import (C, krb5_cccol_cursor_new, "krb5_cccol_cursor_new");

   function krb5_cccol_cursor_next
     (context : krb5_context;
      cursor : krb5_cccol_cursor;
      ccache : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1513
   pragma Import (C, krb5_cccol_cursor_next, "krb5_cccol_cursor_next");

   function krb5_cccol_cursor_free (context : krb5_context; cursor : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1517
   pragma Import (C, krb5_cccol_cursor_free, "krb5_cccol_cursor_free");

   function krb5_cccol_last_change_time (context : krb5_context; change_time : access krb5_timestamp) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1520
   pragma Import (C, krb5_cccol_last_change_time, "krb5_cccol_last_change_time");

   function krb5_cccol_lock (context : krb5_context) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1523
   pragma Import (C, krb5_cccol_lock, "krb5_cccol_lock");

   function krb5_cccol_unlock (context : krb5_context) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1526
   pragma Import (C, krb5_cccol_unlock, "krb5_cccol_unlock");

   function krb5_cc_new_unique
     (context : krb5_context;
      c_type : Interfaces.C.Strings.chars_ptr;
      hint : Interfaces.C.Strings.chars_ptr;
      id : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1529
   pragma Import (C, krb5_cc_new_unique, "krb5_cc_new_unique");

   --  skipped empty struct krb5_rc_st

   type krb5_rcache is new System.Address;  -- /usr/include/krb5/krb5.h:1541

   subtype krb5_kt_cursor is krb5_pointer;  -- /usr/include/krb5/krb5.h:1555

   type krb5_keytab_entry_st is record
      magic : aliased krb5_magic;  -- /usr/include/krb5/krb5.h:1558
      principal : krb5_principal;  -- /usr/include/krb5/krb5.h:1559
      timestamp : aliased krb5_timestamp;  -- /usr/include/krb5/krb5.h:1560
      vno : aliased krb5_kvno;  -- /usr/include/krb5/krb5.h:1561
      key : aliased krb5_keyblock;  -- /usr/include/krb5/krb5.h:1562
   end record;
   pragma Convention (C_Pass_By_Copy, krb5_keytab_entry_st);  -- /usr/include/krb5/krb5.h:1557

   subtype krb5_keytab_entry is krb5_keytab_entry_st;

   --  skipped empty struct u_krb5_kt

   type krb5_keytab is new System.Address;  -- /usr/include/krb5/krb5.h:1566

   function krb5_kt_get_type (arg1 : krb5_context; keytab : krb5_keytab) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/krb5/krb5.h:1569
   pragma Import (C, krb5_kt_get_type, "krb5_kt_get_type");

   function krb5_kt_get_name
     (context : krb5_context;
      keytab : krb5_keytab;
      name : Interfaces.C.Strings.chars_ptr;
      namelen : unsigned) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1572
   pragma Import (C, krb5_kt_get_name, "krb5_kt_get_name");

   function krb5_kt_close (context : krb5_context; keytab : krb5_keytab) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1576
   pragma Import (C, krb5_kt_close, "krb5_kt_close");

   function krb5_kt_get_entry
     (context : krb5_context;
      keytab : krb5_keytab;
      principal : krb5_const_principal;
      vno : krb5_kvno;
      enctype : krb5_enctype;
      c_entry : access krb5_keytab_entry) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1579
   pragma Import (C, krb5_kt_get_entry, "krb5_kt_get_entry");

   function krb5_kt_start_seq_get
     (context : krb5_context;
      keytab : krb5_keytab;
      cursor : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1584
   pragma Import (C, krb5_kt_start_seq_get, "krb5_kt_start_seq_get");

   function krb5_kt_next_entry
     (context : krb5_context;
      keytab : krb5_keytab;
      c_entry : access krb5_keytab_entry;
      cursor : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1588
   pragma Import (C, krb5_kt_next_entry, "krb5_kt_next_entry");

   function krb5_kt_end_seq_get
     (context : krb5_context;
      keytab : krb5_keytab;
      cursor : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1592
   pragma Import (C, krb5_kt_end_seq_get, "krb5_kt_end_seq_get");

   function krb5_init_context (arg1 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1603
   pragma Import (C, krb5_init_context, "krb5_init_context");

   function krb5_init_secure_context (arg1 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1604
   pragma Import (C, krb5_init_secure_context, "krb5_init_secure_context");

   procedure krb5_free_context (arg1 : krb5_context);  -- /usr/include/krb5/krb5.h:1605
   pragma Import (C, krb5_free_context, "krb5_free_context");

   function krb5_copy_context (arg1 : krb5_context; arg2 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1606
   pragma Import (C, krb5_copy_context, "krb5_copy_context");

   function krb5_set_default_tgs_enctypes (arg1 : krb5_context; arg2 : access krb5_enctype) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1609
   pragma Import (C, krb5_set_default_tgs_enctypes, "krb5_set_default_tgs_enctypes");

   function krb5_get_permitted_enctypes (arg1 : krb5_context; arg2 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1612
   pragma Import (C, krb5_get_permitted_enctypes, "krb5_get_permitted_enctypes");

   function krb5_is_thread_safe return krb5_boolean;  -- /usr/include/krb5/krb5.h:1614
   pragma Import (C, krb5_is_thread_safe, "krb5_is_thread_safe");

   function krb5_server_decrypt_ticket_keytab
     (context : krb5_context;
      kt : krb5_keytab;
      ticket : access krb5_ticket) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1619
   pragma Import (C, krb5_server_decrypt_ticket_keytab, "krb5_server_decrypt_ticket_keytab");

   procedure krb5_free_tgt_creds (arg1 : krb5_context; arg2 : System.Address);  -- /usr/include/krb5/krb5.h:1622
   pragma Import (C, krb5_free_tgt_creds, "krb5_free_tgt_creds");

   function krb5_get_credentials
     (arg1 : krb5_context;
      arg2 : krb5_flags;
      arg3 : krb5_ccache;
      arg4 : access krb5_creds;
      arg5 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1633
   pragma Import (C, krb5_get_credentials, "krb5_get_credentials");

   function krb5_get_credentials_validate
     (arg1 : krb5_context;
      arg2 : krb5_flags;
      arg3 : krb5_ccache;
      arg4 : access krb5_creds;
      arg5 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1637
   pragma Import (C, krb5_get_credentials_validate, "krb5_get_credentials_validate");

   function krb5_get_credentials_renew
     (arg1 : krb5_context;
      arg2 : krb5_flags;
      arg3 : krb5_ccache;
      arg4 : access krb5_creds;
      arg5 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1641
   pragma Import (C, krb5_get_credentials_renew, "krb5_get_credentials_renew");

   function krb5_mk_req
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : krb5_flags;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : Interfaces.C.Strings.chars_ptr;
      arg6 : access krb5_data;
      arg7 : krb5_ccache;
      arg8 : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1645
   pragma Import (C, krb5_mk_req, "krb5_mk_req");

   function krb5_mk_req_extended
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : krb5_flags;
      arg4 : access krb5_data;
      arg5 : access krb5_creds;
      arg6 : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1649
   pragma Import (C, krb5_mk_req_extended, "krb5_mk_req_extended");

   function krb5_mk_rep
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1653
   pragma Import (C, krb5_mk_rep, "krb5_mk_rep");

   function krb5_mk_rep_dce
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1656
   pragma Import (C, krb5_mk_rep_dce, "krb5_mk_rep_dce");

   function krb5_rd_rep
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address;
      arg4 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1659
   pragma Import (C, krb5_rd_rep, "krb5_rd_rep");

   function krb5_rd_rep_dce
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address;
      arg4 : access krb5_ui_4) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1663
   pragma Import (C, krb5_rd_rep_dce, "krb5_rd_rep_dce");

   function krb5_mk_error
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1667
   pragma Import (C, krb5_mk_error, "krb5_mk_error");

   function krb5_rd_error
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1670
   pragma Import (C, krb5_rd_error, "krb5_rd_error");

   function krb5_rd_safe
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address;
      arg4 : access krb5_data;
      arg5 : access krb5_replay_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1673
   pragma Import (C, krb5_rd_safe, "krb5_rd_safe");

   function krb5_rd_priv
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address;
      arg4 : access krb5_data;
      arg5 : access krb5_replay_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1677
   pragma Import (C, krb5_rd_priv, "krb5_rd_priv");

   function krb5_parse_name
     (arg1 : krb5_context;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1681
   pragma Import (C, krb5_parse_name, "krb5_parse_name");

   function krb5_parse_name_flags
     (arg1 : krb5_context;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int;
      arg4 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1687
   pragma Import (C, krb5_parse_name_flags, "krb5_parse_name_flags");

   function krb5_unparse_name
     (arg1 : krb5_context;
      arg2 : krb5_const_principal;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1690
   pragma Import (C, krb5_unparse_name, "krb5_unparse_name");

   function krb5_unparse_name_ext
     (arg1 : krb5_context;
      arg2 : krb5_const_principal;
      arg3 : System.Address;
      arg4 : access unsigned) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1693
   pragma Import (C, krb5_unparse_name_ext, "krb5_unparse_name_ext");

   function krb5_unparse_name_flags
     (arg1 : krb5_context;
      arg2 : krb5_const_principal;
      arg3 : int;
      arg4 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1700
   pragma Import (C, krb5_unparse_name_flags, "krb5_unparse_name_flags");

   function krb5_unparse_name_flags_ext
     (arg1 : krb5_context;
      arg2 : krb5_const_principal;
      arg3 : int;
      arg4 : System.Address;
      arg5 : access unsigned) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1703
   pragma Import (C, krb5_unparse_name_flags_ext, "krb5_unparse_name_flags_ext");

   function krb5_set_principal_realm
     (arg1 : krb5_context;
      arg2 : krb5_principal;
      arg3 : Interfaces.C.Strings.chars_ptr) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1707
   pragma Import (C, krb5_set_principal_realm, "krb5_set_principal_realm");

   function krb5_address_search
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return krb5_boolean;  -- /usr/include/krb5/krb5.h:1710
   pragma Import (C, krb5_address_search, "krb5_address_search");

   function krb5_address_compare
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return krb5_boolean;  -- /usr/include/krb5/krb5.h:1713
   pragma Import (C, krb5_address_compare, "krb5_address_compare");

   function krb5_address_order
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return int;  -- /usr/include/krb5/krb5.h:1716
   pragma Import (C, krb5_address_order, "krb5_address_order");

   function krb5_realm_compare
     (arg1 : krb5_context;
      arg2 : krb5_const_principal;
      arg3 : krb5_const_principal) return krb5_boolean;  -- /usr/include/krb5/krb5.h:1719
   pragma Import (C, krb5_realm_compare, "krb5_realm_compare");

   function krb5_principal_compare
     (arg1 : krb5_context;
      arg2 : krb5_const_principal;
      arg3 : krb5_const_principal) return krb5_boolean;  -- /usr/include/krb5/krb5.h:1722
   pragma Import (C, krb5_principal_compare, "krb5_principal_compare");

   function krb5_principal_compare_any_realm
     (arg1 : krb5_context;
      arg2 : krb5_const_principal;
      arg3 : krb5_const_principal) return krb5_boolean;  -- /usr/include/krb5/krb5.h:1726
   pragma Import (C, krb5_principal_compare_any_realm, "krb5_principal_compare_any_realm");

   function krb5_principal_compare_flags
     (arg1 : krb5_context;
      arg2 : krb5_const_principal;
      arg3 : krb5_const_principal;
      arg4 : int) return krb5_boolean;  -- /usr/include/krb5/krb5.h:1735
   pragma Import (C, krb5_principal_compare_flags, "krb5_principal_compare_flags");

   function krb5_init_keyblock
     (arg1 : krb5_context;
      enctype : krb5_enctype;
      length : size_t;
      c_out : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1739
   pragma Import (C, krb5_init_keyblock, "krb5_init_keyblock");

   function krb5_copy_keyblock
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1749
   pragma Import (C, krb5_copy_keyblock, "krb5_copy_keyblock");

   function krb5_copy_keyblock_contents
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : access krb5_keyblock) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1752
   pragma Import (C, krb5_copy_keyblock_contents, "krb5_copy_keyblock_contents");

   function krb5_copy_creds
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1756
   pragma Import (C, krb5_copy_creds, "krb5_copy_creds");

   function krb5_copy_data
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1759
   pragma Import (C, krb5_copy_data, "krb5_copy_data");

   function krb5_copy_principal
     (arg1 : krb5_context;
      arg2 : krb5_const_principal;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1762
   pragma Import (C, krb5_copy_principal, "krb5_copy_principal");

   function krb5_copy_addresses
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1765
   pragma Import (C, krb5_copy_addresses, "krb5_copy_addresses");

   function krb5_copy_ticket
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1768
   pragma Import (C, krb5_copy_ticket, "krb5_copy_ticket");

   function krb5_copy_authdata
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1771
   pragma Import (C, krb5_copy_authdata, "krb5_copy_authdata");

   function krb5_merge_authdata
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address;
      arg4 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1776
   pragma Import (C, krb5_merge_authdata, "krb5_merge_authdata");

   function krb5_copy_authenticator
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1780
   pragma Import (C, krb5_copy_authenticator, "krb5_copy_authenticator");

   function krb5_copy_checksum
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1784
   pragma Import (C, krb5_copy_checksum, "krb5_copy_checksum");

   function krb5_get_server_rcache
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1787
   pragma Import (C, krb5_get_server_rcache, "krb5_get_server_rcache");

   function krb5_build_principal_ext
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : unsigned;
      arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1790
   pragma Import (C, krb5_build_principal_ext, "krb5_build_principal_ext");

   function krb5_build_principal
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : unsigned;
      arg4 : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1794
   pragma Import (C, krb5_build_principal, "krb5_build_principal");

   function krb5_build_principal_alloc_va
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : unsigned;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : stdio_h.va_list) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1808
   pragma Import (C, krb5_build_principal_alloc_va, "krb5_build_principal_alloc_va");

   function krb5_425_conv_principal
     (arg1 : krb5_context;
      name : Interfaces.C.Strings.chars_ptr;
      instance : Interfaces.C.Strings.chars_ptr;
      realm : Interfaces.C.Strings.chars_ptr;
      princ : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1812
   pragma Import (C, krb5_425_conv_principal, "krb5_425_conv_principal");

   function krb5_524_conv_principal
     (context : krb5_context;
      princ : krb5_const_principal;
      name : Interfaces.C.Strings.chars_ptr;
      inst : Interfaces.C.Strings.chars_ptr;
      realm : Interfaces.C.Strings.chars_ptr) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1816
   pragma Import (C, krb5_524_conv_principal, "krb5_524_conv_principal");

   --  skipped empty struct credentials

   function krb5_524_convert_creds
     (context : krb5_context;
      v5creds : access krb5_creds;
      v4creds : System.Address) return int;  -- /usr/include/krb5/krb5.h:1821
   pragma Import (C, krb5_524_convert_creds, "krb5_524_convert_creds");

   function krb5_kt_resolve
     (arg1 : krb5_context;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1830
   pragma Import (C, krb5_kt_resolve, "krb5_kt_resolve");

   function krb5_kt_default_name
     (arg1 : krb5_context;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : int) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1833
   pragma Import (C, krb5_kt_default_name, "krb5_kt_default_name");

   function krb5_kt_default (arg1 : krb5_context; arg2 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1836
   pragma Import (C, krb5_kt_default, "krb5_kt_default");

   function krb5_free_keytab_entry_contents (arg1 : krb5_context; arg2 : access krb5_keytab_entry) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1839
   pragma Import (C, krb5_free_keytab_entry_contents, "krb5_free_keytab_entry_contents");

   function krb5_kt_free_entry (arg1 : krb5_context; arg2 : access krb5_keytab_entry) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1843
   pragma Import (C, krb5_kt_free_entry, "krb5_kt_free_entry");

   function krb5_kt_remove_entry
     (arg1 : krb5_context;
      arg2 : krb5_keytab;
      arg3 : access krb5_keytab_entry) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1849
   pragma Import (C, krb5_kt_remove_entry, "krb5_kt_remove_entry");

   function krb5_kt_add_entry
     (arg1 : krb5_context;
      arg2 : krb5_keytab;
      arg3 : access krb5_keytab_entry) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1852
   pragma Import (C, krb5_kt_add_entry, "krb5_kt_add_entry");

   function krb5_principal2salt
     (arg1 : krb5_context;
      arg2 : krb5_const_principal;
      arg3 : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1855
   pragma Import (C, krb5_principal2salt, "krb5_principal2salt");

   function krb5_cc_resolve
     (arg1 : krb5_context;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1860
   pragma Import (C, krb5_cc_resolve, "krb5_cc_resolve");

   function krb5_cc_default_name (arg1 : krb5_context) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/krb5/krb5.h:1863
   pragma Import (C, krb5_cc_default_name, "krb5_cc_default_name");

   function krb5_cc_set_default_name (arg1 : krb5_context; arg2 : Interfaces.C.Strings.chars_ptr) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1866
   pragma Import (C, krb5_cc_set_default_name, "krb5_cc_set_default_name");

   function krb5_cc_default (arg1 : krb5_context; arg2 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1869
   pragma Import (C, krb5_cc_default, "krb5_cc_default");

   function krb5_cc_copy_creds
     (context : krb5_context;
      incc : krb5_ccache;
      outcc : krb5_ccache) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1872
   pragma Import (C, krb5_cc_copy_creds, "krb5_cc_copy_creds");

   function krb5_cc_get_config
     (arg1 : krb5_context;
      arg2 : krb5_ccache;
      arg3 : krb5_const_principal;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1875
   pragma Import (C, krb5_cc_get_config, "krb5_cc_get_config");

   function krb5_cc_set_config
     (arg1 : krb5_context;
      arg2 : krb5_ccache;
      arg3 : krb5_const_principal;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1880
   pragma Import (C, krb5_cc_set_config, "krb5_cc_set_config");

   function krb5_is_config_principal (arg1 : krb5_context; arg2 : krb5_const_principal) return krb5_boolean;  -- /usr/include/krb5/krb5.h:1885
   pragma Import (C, krb5_is_config_principal, "krb5_is_config_principal");

   procedure krb5_free_principal (arg1 : krb5_context; arg2 : krb5_principal);  -- /usr/include/krb5/krb5.h:1889
   pragma Import (C, krb5_free_principal, "krb5_free_principal");

   procedure krb5_free_authenticator (arg1 : krb5_context; arg2 : access krb5_authenticator);  -- /usr/include/krb5/krb5.h:1890
   pragma Import (C, krb5_free_authenticator, "krb5_free_authenticator");

   procedure krb5_free_addresses (arg1 : krb5_context; arg2 : System.Address);  -- /usr/include/krb5/krb5.h:1892
   pragma Import (C, krb5_free_addresses, "krb5_free_addresses");

   procedure krb5_free_authdata (arg1 : krb5_context; arg2 : System.Address);  -- /usr/include/krb5/krb5.h:1893
   pragma Import (C, krb5_free_authdata, "krb5_free_authdata");

   procedure krb5_free_ticket (arg1 : krb5_context; arg2 : access krb5_ticket);  -- /usr/include/krb5/krb5.h:1894
   pragma Import (C, krb5_free_ticket, "krb5_free_ticket");

   procedure krb5_free_error (arg1 : krb5_context; arg2 : access krb5_error);  -- /usr/include/krb5/krb5.h:1895
   pragma Import (C, krb5_free_error, "krb5_free_error");

   procedure krb5_free_creds (arg1 : krb5_context; arg2 : access krb5_creds);  -- /usr/include/krb5/krb5.h:1896
   pragma Import (C, krb5_free_creds, "krb5_free_creds");

   procedure krb5_free_cred_contents (arg1 : krb5_context; arg2 : access krb5_creds);  -- /usr/include/krb5/krb5.h:1897
   pragma Import (C, krb5_free_cred_contents, "krb5_free_cred_contents");

   procedure krb5_free_checksum (arg1 : krb5_context; arg2 : access krb5_checksum);  -- /usr/include/krb5/krb5.h:1898
   pragma Import (C, krb5_free_checksum, "krb5_free_checksum");

   procedure krb5_free_checksum_contents (arg1 : krb5_context; arg2 : access krb5_checksum);  -- /usr/include/krb5/krb5.h:1899
   pragma Import (C, krb5_free_checksum_contents, "krb5_free_checksum_contents");

   procedure krb5_free_keyblock (arg1 : krb5_context; arg2 : access krb5_keyblock);  -- /usr/include/krb5/krb5.h:1900
   pragma Import (C, krb5_free_keyblock, "krb5_free_keyblock");

   procedure krb5_free_keyblock_contents (arg1 : krb5_context; arg2 : access krb5_keyblock);  -- /usr/include/krb5/krb5.h:1901
   pragma Import (C, krb5_free_keyblock_contents, "krb5_free_keyblock_contents");

   procedure krb5_free_ap_rep_enc_part (arg1 : krb5_context; arg2 : access krb5_ap_rep_enc_part);  -- /usr/include/krb5/krb5.h:1902
   pragma Import (C, krb5_free_ap_rep_enc_part, "krb5_free_ap_rep_enc_part");

   procedure krb5_free_data (arg1 : krb5_context; arg2 : access krb5_data);  -- /usr/include/krb5/krb5.h:1904
   pragma Import (C, krb5_free_data, "krb5_free_data");

   procedure krb5_free_data_contents (arg1 : krb5_context; arg2 : access krb5_data);  -- /usr/include/krb5/krb5.h:1905
   pragma Import (C, krb5_free_data_contents, "krb5_free_data_contents");

   procedure krb5_free_unparsed_name (arg1 : krb5_context; arg2 : Interfaces.C.Strings.chars_ptr);  -- /usr/include/krb5/krb5.h:1906
   pragma Import (C, krb5_free_unparsed_name, "krb5_free_unparsed_name");

   procedure krb5_free_cksumtypes (arg1 : krb5_context; arg2 : access krb5_cksumtype);  -- /usr/include/krb5/krb5.h:1907
   pragma Import (C, krb5_free_cksumtypes, "krb5_free_cksumtypes");

   function krb5_us_timeofday
     (arg1 : krb5_context;
      arg2 : access krb5_timestamp;
      arg3 : access krb5_int32) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1911
   pragma Import (C, krb5_us_timeofday, "krb5_us_timeofday");

   function krb5_timeofday (arg1 : krb5_context; arg2 : access krb5_timestamp) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1914
   pragma Import (C, krb5_timeofday, "krb5_timeofday");

   function krb5_os_localaddr (arg1 : krb5_context; arg2 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1918
   pragma Import (C, krb5_os_localaddr, "krb5_os_localaddr");

   function krb5_get_default_realm (arg1 : krb5_context; arg2 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1921
   pragma Import (C, krb5_get_default_realm, "krb5_get_default_realm");

   function krb5_set_default_realm (arg1 : krb5_context; arg2 : Interfaces.C.Strings.chars_ptr) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1924
   pragma Import (C, krb5_set_default_realm, "krb5_set_default_realm");

   procedure krb5_free_default_realm (arg1 : krb5_context; arg2 : Interfaces.C.Strings.chars_ptr);  -- /usr/include/krb5/krb5.h:1927
   pragma Import (C, krb5_free_default_realm, "krb5_free_default_realm");

   function krb5_sname_to_principal
     (arg1 : krb5_context;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : krb5_int32;
      arg5 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1930
   pragma Import (C, krb5_sname_to_principal, "krb5_sname_to_principal");

   function krb5_change_password
     (context : krb5_context;
      creds : access krb5_creds;
      newpw : Interfaces.C.Strings.chars_ptr;
      result_code : access int;
      result_code_string : access krb5_data;
      result_string : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1934
   pragma Import (C, krb5_change_password, "krb5_change_password");

   function krb5_set_password
     (context : krb5_context;
      creds : access krb5_creds;
      newpw : Interfaces.C.Strings.chars_ptr;
      change_password_for : krb5_principal;
      result_code : access int;
      result_code_string : access krb5_data;
      result_string : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1939
   pragma Import (C, krb5_set_password, "krb5_set_password");

   function krb5_set_password_using_ccache
     (context : krb5_context;
      ccache : krb5_ccache;
      newpw : Interfaces.C.Strings.chars_ptr;
      change_password_for : krb5_principal;
      result_code : access int;
      result_code_string : access krb5_data;
      result_string : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1944
   pragma Import (C, krb5_set_password_using_ccache, "krb5_set_password_using_ccache");

   function krb5_get_profile (arg1 : krb5_context; arg2 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1950
   pragma Import (C, krb5_get_profile, "krb5_get_profile");

   function krb5_rd_req
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : System.Address;
      arg4 : krb5_const_principal;
      arg5 : krb5_keytab;
      arg6 : access krb5_flags;
      arg7 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1982
   pragma Import (C, krb5_rd_req, "krb5_rd_req");

   function krb5_kt_read_service_key
     (arg1 : krb5_context;
      arg2 : krb5_pointer;
      arg3 : krb5_principal;
      arg4 : krb5_kvno;
      arg5 : krb5_enctype;
      arg6 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1986
   pragma Import (C, krb5_kt_read_service_key, "krb5_kt_read_service_key");

   function krb5_mk_safe
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address;
      arg4 : access krb5_data;
      arg5 : access krb5_replay_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1990
   pragma Import (C, krb5_mk_safe, "krb5_mk_safe");

   function krb5_mk_priv
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address;
      arg4 : access krb5_data;
      arg5 : access krb5_replay_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1994
   pragma Import (C, krb5_mk_priv, "krb5_mk_priv");

   function krb5_sendauth
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : krb5_pointer;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : krb5_principal;
      arg6 : krb5_principal;
      arg7 : krb5_flags;
      arg8 : access krb5_data;
      arg9 : access krb5_creds;
      arg10 : krb5_ccache;
      arg11 : System.Address;
      arg12 : System.Address;
      arg13 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:1998
   pragma Import (C, krb5_sendauth, "krb5_sendauth");

   function krb5_recvauth
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : krb5_pointer;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : krb5_principal;
      arg6 : krb5_int32;
      arg7 : krb5_keytab;
      arg8 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2004
   pragma Import (C, krb5_recvauth, "krb5_recvauth");

   function krb5_recvauth_version
     (arg1 : krb5_context;
      arg2 : System.Address;
      arg3 : krb5_pointer;
      arg4 : krb5_principal;
      arg5 : krb5_int32;
      arg6 : krb5_keytab;
      arg7 : System.Address;
      arg8 : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2008
   pragma Import (C, krb5_recvauth_version, "krb5_recvauth_version");

   function krb5_mk_ncred
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address;
      arg4 : System.Address;
      arg5 : access krb5_replay_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2013
   pragma Import (C, krb5_mk_ncred, "krb5_mk_ncred");

   function krb5_mk_1cred
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access krb5_creds;
      arg4 : System.Address;
      arg5 : access krb5_replay_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2017
   pragma Import (C, krb5_mk_1cred, "krb5_mk_1cred");

   function krb5_rd_cred
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access krb5_data;
      arg4 : System.Address;
      arg5 : access krb5_replay_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2021
   pragma Import (C, krb5_rd_cred, "krb5_rd_cred");

   function krb5_fwd_tgt_creds
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : krb5_principal;
      arg5 : krb5_principal;
      arg6 : krb5_ccache;
      forwardable : int;
      arg8 : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2025
   pragma Import (C, krb5_fwd_tgt_creds, "krb5_fwd_tgt_creds");

   function krb5_auth_con_init (arg1 : krb5_context; arg2 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2029
   pragma Import (C, krb5_auth_con_init, "krb5_auth_con_init");

   function krb5_auth_con_free (arg1 : krb5_context; arg2 : krb5_auth_context) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2032
   pragma Import (C, krb5_auth_con_free, "krb5_auth_con_free");

   function krb5_auth_con_setflags
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : krb5_int32) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2035
   pragma Import (C, krb5_auth_con_setflags, "krb5_auth_con_setflags");

   function krb5_auth_con_getflags
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access krb5_int32) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2038
   pragma Import (C, krb5_auth_con_getflags, "krb5_auth_con_getflags");

   function krb5_auth_con_set_checksum_func
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access function
        (arg1 : krb5_context;
         arg2 : krb5_auth_context;
         arg3 : System.Address;
         arg4 : System.Address) return krb5_error_code;
      arg4 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2041
   pragma Import (C, krb5_auth_con_set_checksum_func, "krb5_auth_con_set_checksum_func");

   function krb5_auth_con_get_checksum_func
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address;
      arg4 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2045
   pragma Import (C, krb5_auth_con_get_checksum_func, "krb5_auth_con_get_checksum_func");

   function krb5_auth_con_setaddrs
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access krb5_address;
      arg4 : access krb5_address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2049
   pragma Import (C, krb5_auth_con_setaddrs, "krb5_auth_con_setaddrs");

   function krb5_auth_con_getaddrs
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address;
      arg4 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2053
   pragma Import (C, krb5_auth_con_getaddrs, "krb5_auth_con_getaddrs");

   function krb5_auth_con_setports
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access krb5_address;
      arg4 : access krb5_address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2057
   pragma Import (C, krb5_auth_con_setports, "krb5_auth_con_setports");

   function krb5_auth_con_setuseruserkey
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access krb5_keyblock) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2061
   pragma Import (C, krb5_auth_con_setuseruserkey, "krb5_auth_con_setuseruserkey");

   function krb5_auth_con_getkey
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2064
   pragma Import (C, krb5_auth_con_getkey, "krb5_auth_con_getkey");

   function krb5_auth_con_getkey_k
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2067
   pragma Import (C, krb5_auth_con_getkey_k, "krb5_auth_con_getkey_k");

   function krb5_auth_con_getsendsubkey
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2070
   pragma Import (C, krb5_auth_con_getsendsubkey, "krb5_auth_con_getsendsubkey");

   function krb5_auth_con_getsendsubkey_k
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2073
   pragma Import (C, krb5_auth_con_getsendsubkey_k, "krb5_auth_con_getsendsubkey_k");

   function krb5_auth_con_getrecvsubkey
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2076
   pragma Import (C, krb5_auth_con_getrecvsubkey, "krb5_auth_con_getrecvsubkey");

   function krb5_auth_con_getrecvsubkey_k
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2079
   pragma Import (C, krb5_auth_con_getrecvsubkey_k, "krb5_auth_con_getrecvsubkey_k");

   function krb5_auth_con_setsendsubkey
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access krb5_keyblock) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2082
   pragma Import (C, krb5_auth_con_setsendsubkey, "krb5_auth_con_setsendsubkey");

   function krb5_auth_con_setrecvsubkey
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access krb5_keyblock) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2085
   pragma Import (C, krb5_auth_con_setrecvsubkey, "krb5_auth_con_setrecvsubkey");

   function krb5_auth_con_getlocalseqnumber
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access krb5_int32) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2098
   pragma Import (C, krb5_auth_con_getlocalseqnumber, "krb5_auth_con_getlocalseqnumber");

   function krb5_auth_con_getremoteseqnumber
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : access krb5_int32) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2101
   pragma Import (C, krb5_auth_con_getremoteseqnumber, "krb5_auth_con_getremoteseqnumber");

   function krb5_auth_con_setrcache
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : krb5_rcache) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2110
   pragma Import (C, krb5_auth_con_setrcache, "krb5_auth_con_setrcache");

   function krb5_auth_con_getrcache
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2113
   pragma Import (C, krb5_auth_con_getrcache, "krb5_auth_con_getrcache");

   function krb5_auth_con_getauthenticator
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2116
   pragma Import (C, krb5_auth_con_getauthenticator, "krb5_auth_con_getauthenticator");

   function krb5_auth_con_set_req_cksumtype
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : krb5_cksumtype) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2120
   pragma Import (C, krb5_auth_con_set_req_cksumtype, "krb5_auth_con_set_req_cksumtype");

   function krb5_read_password
     (arg1 : krb5_context;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : access unsigned) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2134
   pragma Import (C, krb5_read_password, "krb5_read_password");

   function krb5_aname_to_localname
     (arg1 : krb5_context;
      arg2 : krb5_const_principal;
      arg3 : int;
      arg4 : Interfaces.C.Strings.chars_ptr) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2138
   pragma Import (C, krb5_aname_to_localname, "krb5_aname_to_localname");

   function krb5_get_host_realm
     (arg1 : krb5_context;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2141
   pragma Import (C, krb5_get_host_realm, "krb5_get_host_realm");

   function krb5_get_fallback_host_realm
     (arg1 : krb5_context;
      arg2 : access krb5_data;
      arg3 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2144
   pragma Import (C, krb5_get_fallback_host_realm, "krb5_get_fallback_host_realm");

   function krb5_free_host_realm (arg1 : krb5_context; arg2 : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2147
   pragma Import (C, krb5_free_host_realm, "krb5_free_host_realm");

   function krb5_kuserok
     (arg1 : krb5_context;
      arg2 : krb5_principal;
      arg3 : Interfaces.C.Strings.chars_ptr) return krb5_boolean;  -- /usr/include/krb5/krb5.h:2150
   pragma Import (C, krb5_kuserok, "krb5_kuserok");

   function krb5_auth_con_genaddrs
     (arg1 : krb5_context;
      arg2 : krb5_auth_context;
      arg3 : int;
      arg4 : int) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2153
   pragma Import (C, krb5_auth_con_genaddrs, "krb5_auth_con_genaddrs");

   function krb5_set_real_time
     (arg1 : krb5_context;
      arg2 : krb5_timestamp;
      arg3 : krb5_int32) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2156
   pragma Import (C, krb5_set_real_time, "krb5_set_real_time");

   function krb5_get_time_offsets
     (arg1 : krb5_context;
      arg2 : access krb5_timestamp;
      arg3 : access krb5_int32) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2159
   pragma Import (C, krb5_get_time_offsets, "krb5_get_time_offsets");

   function krb5_string_to_enctype (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : access krb5_enctype) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2162
   pragma Import (C, krb5_string_to_enctype, "krb5_string_to_enctype");

   function krb5_string_to_salttype (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : access krb5_int32) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2163
   pragma Import (C, krb5_string_to_salttype, "krb5_string_to_salttype");

   function krb5_string_to_cksumtype (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : access krb5_cksumtype) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2164
   pragma Import (C, krb5_string_to_cksumtype, "krb5_string_to_cksumtype");

   function krb5_string_to_timestamp (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : access krb5_timestamp) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2166
   pragma Import (C, krb5_string_to_timestamp, "krb5_string_to_timestamp");

   function krb5_string_to_deltat (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : access krb5_deltat) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2168
   pragma Import (C, krb5_string_to_deltat, "krb5_string_to_deltat");

   function krb5_enctype_to_string
     (arg1 : krb5_enctype;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2169
   pragma Import (C, krb5_enctype_to_string, "krb5_enctype_to_string");

   function krb5_salttype_to_string
     (arg1 : krb5_int32;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2171
   pragma Import (C, krb5_salttype_to_string, "krb5_salttype_to_string");

   function krb5_cksumtype_to_string
     (arg1 : krb5_cksumtype;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2173
   pragma Import (C, krb5_cksumtype_to_string, "krb5_cksumtype_to_string");

   function krb5_timestamp_to_string
     (arg1 : krb5_timestamp;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2175
   pragma Import (C, krb5_timestamp_to_string, "krb5_timestamp_to_string");

   function krb5_timestamp_to_sfstring
     (arg1 : krb5_timestamp;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t;
      arg4 : Interfaces.C.Strings.chars_ptr) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2177
   pragma Import (C, krb5_timestamp_to_sfstring, "krb5_timestamp_to_sfstring");

   function krb5_deltat_to_string
     (arg1 : krb5_deltat;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : size_t) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2180
   pragma Import (C, krb5_deltat_to_string, "krb5_deltat_to_string");

   type u_krb5_prompt is record
      prompt : Interfaces.C.Strings.chars_ptr;  -- /usr/include/krb5/krb5.h:2195
      hidden : aliased int;  -- /usr/include/krb5/krb5.h:2196
      reply : access krb5_data;  -- /usr/include/krb5/krb5.h:2197
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_prompt);  -- /usr/include/krb5/krb5.h:2194

   subtype krb5_prompt is u_krb5_prompt;

   type krb5_prompter_fct is access function
        (arg1 : krb5_context;
         arg2 : System.Address;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : Interfaces.C.Strings.chars_ptr;
         arg5 : int;
         arg6 : access krb5_prompt) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2201

   function krb5_prompter_posix
     (context : krb5_context;
      data : System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      banner : Interfaces.C.Strings.chars_ptr;
      num_prompts : int;
      prompts : access krb5_prompt) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2206
   pragma Import (C, krb5_prompter_posix, "krb5_prompter_posix");

   type u_krb5_get_init_creds_opt is record
      flags : aliased krb5_flags;  -- /usr/include/krb5/krb5.h:2211
      tkt_life : aliased krb5_deltat;  -- /usr/include/krb5/krb5.h:2212
      renew_life : aliased krb5_deltat;  -- /usr/include/krb5/krb5.h:2213
      forwardable : aliased int;  -- /usr/include/krb5/krb5.h:2214
      proxiable : aliased int;  -- /usr/include/krb5/krb5.h:2215
      etype_list : access krb5_enctype;  -- /usr/include/krb5/krb5.h:2216
      etype_list_length : aliased int;  -- /usr/include/krb5/krb5.h:2217
      address_list : System.Address;  -- /usr/include/krb5/krb5.h:2218
      preauth_list : access krb5_preauthtype;  -- /usr/include/krb5/krb5.h:2219
      preauth_list_length : aliased int;  -- /usr/include/krb5/krb5.h:2220
      salt : access krb5_data;  -- /usr/include/krb5/krb5.h:2221
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_get_init_creds_opt);  -- /usr/include/krb5/krb5.h:2210

   subtype krb5_get_init_creds_opt is u_krb5_get_init_creds_opt;

   function krb5_get_init_creds_opt_alloc (context : krb5_context; opt : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2238
   pragma Import (C, krb5_get_init_creds_opt_alloc, "krb5_get_init_creds_opt_alloc");

   procedure krb5_get_init_creds_opt_free (context : krb5_context; opt : access krb5_get_init_creds_opt);  -- /usr/include/krb5/krb5.h:2242
   pragma Import (C, krb5_get_init_creds_opt_free, "krb5_get_init_creds_opt_free");

   procedure krb5_get_init_creds_opt_init (opt : access krb5_get_init_creds_opt);  -- /usr/include/krb5/krb5.h:2246
   pragma Import (C, krb5_get_init_creds_opt_init, "krb5_get_init_creds_opt_init");

   procedure krb5_get_init_creds_opt_set_tkt_life (opt : access krb5_get_init_creds_opt; tkt_life : krb5_deltat);  -- /usr/include/krb5/krb5.h:2249
   pragma Import (C, krb5_get_init_creds_opt_set_tkt_life, "krb5_get_init_creds_opt_set_tkt_life");

   procedure krb5_get_init_creds_opt_set_renew_life (opt : access krb5_get_init_creds_opt; renew_life : krb5_deltat);  -- /usr/include/krb5/krb5.h:2253
   pragma Import (C, krb5_get_init_creds_opt_set_renew_life, "krb5_get_init_creds_opt_set_renew_life");

   procedure krb5_get_init_creds_opt_set_forwardable (opt : access krb5_get_init_creds_opt; forwardable : int);  -- /usr/include/krb5/krb5.h:2257
   pragma Import (C, krb5_get_init_creds_opt_set_forwardable, "krb5_get_init_creds_opt_set_forwardable");

   procedure krb5_get_init_creds_opt_set_proxiable (opt : access krb5_get_init_creds_opt; proxiable : int);  -- /usr/include/krb5/krb5.h:2261
   pragma Import (C, krb5_get_init_creds_opt_set_proxiable, "krb5_get_init_creds_opt_set_proxiable");

   procedure krb5_get_init_creds_opt_set_canonicalize (opt : access krb5_get_init_creds_opt; canonicalize : int);  -- /usr/include/krb5/krb5.h:2265
   pragma Import (C, krb5_get_init_creds_opt_set_canonicalize, "krb5_get_init_creds_opt_set_canonicalize");

   procedure krb5_get_init_creds_opt_set_anonymous (opt : access krb5_get_init_creds_opt; anonymous : int);  -- /usr/include/krb5/krb5.h:2280
   pragma Import (C, krb5_get_init_creds_opt_set_anonymous, "krb5_get_init_creds_opt_set_anonymous");

   procedure krb5_get_init_creds_opt_set_etype_list
     (opt : access krb5_get_init_creds_opt;
      etype_list : access krb5_enctype;
      etype_list_length : int);  -- /usr/include/krb5/krb5.h:2284
   pragma Import (C, krb5_get_init_creds_opt_set_etype_list, "krb5_get_init_creds_opt_set_etype_list");

   procedure krb5_get_init_creds_opt_set_address_list (opt : access krb5_get_init_creds_opt; addresses : System.Address);  -- /usr/include/krb5/krb5.h:2289
   pragma Import (C, krb5_get_init_creds_opt_set_address_list, "krb5_get_init_creds_opt_set_address_list");

   procedure krb5_get_init_creds_opt_set_preauth_list
     (opt : access krb5_get_init_creds_opt;
      preauth_list : access krb5_preauthtype;
      preauth_list_length : int);  -- /usr/include/krb5/krb5.h:2293
   pragma Import (C, krb5_get_init_creds_opt_set_preauth_list, "krb5_get_init_creds_opt_set_preauth_list");

   procedure krb5_get_init_creds_opt_set_salt (opt : access krb5_get_init_creds_opt; salt : access krb5_data);  -- /usr/include/krb5/krb5.h:2298
   pragma Import (C, krb5_get_init_creds_opt_set_salt, "krb5_get_init_creds_opt_set_salt");

   procedure krb5_get_init_creds_opt_set_change_password_prompt (opt : access krb5_get_init_creds_opt; prompt : int);  -- /usr/include/krb5/krb5.h:2302
   pragma Import (C, krb5_get_init_creds_opt_set_change_password_prompt, "krb5_get_init_creds_opt_set_change_password_prompt");

   type u_krb5_gic_opt_pa_data is record
      attr : Interfaces.C.Strings.chars_ptr;  -- /usr/include/krb5/krb5.h:2307
      value : Interfaces.C.Strings.chars_ptr;  -- /usr/include/krb5/krb5.h:2308
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_gic_opt_pa_data);  -- /usr/include/krb5/krb5.h:2306

   subtype krb5_gic_opt_pa_data is u_krb5_gic_opt_pa_data;

   function krb5_get_init_creds_opt_set_pa
     (context : krb5_context;
      opt : access krb5_get_init_creds_opt;
      attr : Interfaces.C.Strings.chars_ptr;
      value : Interfaces.C.Strings.chars_ptr) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2320
   pragma Import (C, krb5_get_init_creds_opt_set_pa, "krb5_get_init_creds_opt_set_pa");

   function krb5_get_init_creds_opt_set_fast_ccache_name
     (context : krb5_context;
      opt : access krb5_get_init_creds_opt;
      fast_ccache_name : Interfaces.C.Strings.chars_ptr) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2336
   pragma Import (C, krb5_get_init_creds_opt_set_fast_ccache_name, "krb5_get_init_creds_opt_set_fast_ccache_name");

   function krb5_get_init_creds_opt_set_out_ccache
     (context : krb5_context;
      opt : access krb5_get_init_creds_opt;
      ccache : krb5_ccache) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2348
   pragma Import (C, krb5_get_init_creds_opt_set_out_ccache, "krb5_get_init_creds_opt_set_out_ccache");

   function krb5_get_init_creds_opt_set_fast_flags
     (context : krb5_context;
      opt : access krb5_get_init_creds_opt;
      flags : krb5_flags) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2353
   pragma Import (C, krb5_get_init_creds_opt_set_fast_flags, "krb5_get_init_creds_opt_set_fast_flags");

   function krb5_get_init_creds_opt_get_fast_flags
     (context : krb5_context;
      opt : access krb5_get_init_creds_opt;
      out_flags : access krb5_flags) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2358
   pragma Import (C, krb5_get_init_creds_opt_get_fast_flags, "krb5_get_init_creds_opt_get_fast_flags");

   function krb5_get_init_creds_password
     (context : krb5_context;
      creds : access krb5_creds;
      client : krb5_principal;
      password : Interfaces.C.Strings.chars_ptr;
      prompter : access function
        (arg1 : krb5_context;
         arg2 : System.Address;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : Interfaces.C.Strings.chars_ptr;
         arg5 : int;
         arg6 : access krb5_prompt) return krb5_error_code;
      data : System.Address;
      start_time : krb5_deltat;
      in_tkt_service : Interfaces.C.Strings.chars_ptr;
      k5_gic_options : access krb5_get_init_creds_opt) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2366
   pragma Import (C, krb5_get_init_creds_password, "krb5_get_init_creds_password");

   --  skipped empty struct u_krb5_init_creds_context

   type krb5_init_creds_context is new System.Address;  -- /usr/include/krb5/krb5.h:2373

   procedure krb5_init_creds_free (context : krb5_context; ctx : krb5_init_creds_context);  -- /usr/include/krb5/krb5.h:2376
   pragma Import (C, krb5_init_creds_free, "krb5_init_creds_free");

   function krb5_init_creds_get (context : krb5_context; ctx : krb5_init_creds_context) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2379
   pragma Import (C, krb5_init_creds_get, "krb5_init_creds_get");

   function krb5_init_creds_get_creds
     (context : krb5_context;
      ctx : krb5_init_creds_context;
      creds : access krb5_creds) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2382
   pragma Import (C, krb5_init_creds_get_creds, "krb5_init_creds_get_creds");

   function krb5_init_creds_get_error
     (context : krb5_context;
      ctx : krb5_init_creds_context;
      error : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2386
   pragma Import (C, krb5_init_creds_get_error, "krb5_init_creds_get_error");

   function krb5_init_creds_init
     (context : krb5_context;
      client : krb5_principal;
      prompter : access function
        (arg1 : krb5_context;
         arg2 : System.Address;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : Interfaces.C.Strings.chars_ptr;
         arg5 : int;
         arg6 : access krb5_prompt) return krb5_error_code;
      data : System.Address;
      start_time : krb5_deltat;
      options : access krb5_get_init_creds_opt;
      ctx : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2390
   pragma Import (C, krb5_init_creds_init, "krb5_init_creds_init");

   function krb5_init_creds_set_keyblock
     (context : krb5_context;
      ctx : krb5_init_creds_context;
      keyblock : access krb5_keyblock) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2396
   pragma Import (C, krb5_init_creds_set_keyblock, "krb5_init_creds_set_keyblock");

   function krb5_init_creds_set_keytab
     (context : krb5_context;
      ctx : krb5_init_creds_context;
      keytab : krb5_keytab) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2400
   pragma Import (C, krb5_init_creds_set_keytab, "krb5_init_creds_set_keytab");

   function krb5_init_creds_step
     (context : krb5_context;
      ctx : krb5_init_creds_context;
      c_in : access krb5_data;
      c_out : access krb5_data;
      realm : access krb5_data;
      flags : access unsigned) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2404
   pragma Import (C, krb5_init_creds_step, "krb5_init_creds_step");

   function krb5_init_creds_set_password
     (context : krb5_context;
      ctx : krb5_init_creds_context;
      password : Interfaces.C.Strings.chars_ptr) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2409
   pragma Import (C, krb5_init_creds_set_password, "krb5_init_creds_set_password");

   function krb5_init_creds_set_service
     (context : krb5_context;
      ctx : krb5_init_creds_context;
      service : Interfaces.C.Strings.chars_ptr) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2413
   pragma Import (C, krb5_init_creds_set_service, "krb5_init_creds_set_service");

   function krb5_init_creds_get_times
     (context : krb5_context;
      ctx : krb5_init_creds_context;
      times : access krb5_ticket_times) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2417
   pragma Import (C, krb5_init_creds_get_times, "krb5_init_creds_get_times");

   function krb5_get_init_creds_keytab
     (context : krb5_context;
      creds : access krb5_creds;
      client : krb5_principal;
      arg_keytab : krb5_keytab;
      start_time : krb5_deltat;
      in_tkt_service : Interfaces.C.Strings.chars_ptr;
      k5_gic_options : access krb5_get_init_creds_opt) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2421
   pragma Import (C, krb5_get_init_creds_keytab, "krb5_get_init_creds_keytab");

   type u_krb5_verify_init_creds_opt is record
      flags : aliased krb5_flags;  -- /usr/include/krb5/krb5.h:2427
      ap_req_nofail : aliased int;  -- /usr/include/krb5/krb5.h:2428
   end record;
   pragma Convention (C_Pass_By_Copy, u_krb5_verify_init_creds_opt);  -- /usr/include/krb5/krb5.h:2426

   subtype krb5_verify_init_creds_opt is u_krb5_verify_init_creds_opt;

   procedure krb5_verify_init_creds_opt_init (k5_vic_options : access krb5_verify_init_creds_opt);  -- /usr/include/krb5/krb5.h:2434
   pragma Import (C, krb5_verify_init_creds_opt_init, "krb5_verify_init_creds_opt_init");

   procedure krb5_verify_init_creds_opt_set_ap_req_nofail (k5_vic_options : access krb5_verify_init_creds_opt; ap_req_nofail : int);  -- /usr/include/krb5/krb5.h:2437
   pragma Import (C, krb5_verify_init_creds_opt_set_ap_req_nofail, "krb5_verify_init_creds_opt_set_ap_req_nofail");

   function krb5_verify_init_creds
     (context : krb5_context;
      creds : access krb5_creds;
      ap_req_server : krb5_principal;
      ap_req_keytab : krb5_keytab;
      ccache : System.Address;
      k5_vic_options : access krb5_verify_init_creds_opt) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2442
   pragma Import (C, krb5_verify_init_creds, "krb5_verify_init_creds");

   function krb5_get_validated_creds
     (context : krb5_context;
      creds : access krb5_creds;
      client : krb5_principal;
      ccache : krb5_ccache;
      in_tkt_service : Interfaces.C.Strings.chars_ptr) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2448
   pragma Import (C, krb5_get_validated_creds, "krb5_get_validated_creds");

   function krb5_get_renewed_creds
     (context : krb5_context;
      creds : access krb5_creds;
      client : krb5_principal;
      ccache : krb5_ccache;
      in_tkt_service : Interfaces.C.Strings.chars_ptr) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2453
   pragma Import (C, krb5_get_renewed_creds, "krb5_get_renewed_creds");

   function krb5_decode_ticket (code : System.Address; rep : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2458
   pragma Import (C, krb5_decode_ticket, "krb5_decode_ticket");

   procedure krb5_appdefault_string
     (context : krb5_context;
      appname : Interfaces.C.Strings.chars_ptr;
      realm : System.Address;
      option : Interfaces.C.Strings.chars_ptr;
      default_value : Interfaces.C.Strings.chars_ptr;
      ret_value : System.Address);  -- /usr/include/krb5/krb5.h:2461
   pragma Import (C, krb5_appdefault_string, "krb5_appdefault_string");

   procedure krb5_appdefault_boolean
     (context : krb5_context;
      appname : Interfaces.C.Strings.chars_ptr;
      realm : System.Address;
      option : Interfaces.C.Strings.chars_ptr;
      default_value : int;
      ret_value : access int);  -- /usr/include/krb5/krb5.h:2466
   pragma Import (C, krb5_appdefault_boolean, "krb5_appdefault_boolean");

   subtype krb5_prompt_type is krb5_int32;  -- /usr/include/krb5/krb5.h:2479

   function krb5_get_prompt_types (context : krb5_context) return access krb5_prompt_type;  -- /usr/include/krb5/krb5.h:2481
   pragma Import (C, krb5_get_prompt_types, "krb5_get_prompt_types");

   procedure krb5_set_error_message
     (arg1 : krb5_context;
      arg2 : krb5_error_code;
      arg3 : Interfaces.C.Strings.chars_ptr  -- , ...
      );  -- /usr/include/krb5/krb5.h:2485
   pragma Import (C, krb5_set_error_message, "krb5_set_error_message");

   procedure krb5_vset_error_message
     (arg1 : krb5_context;
      arg2 : krb5_error_code;
      arg3 : Interfaces.C.Strings.chars_ptr;
      arg4 : stdio_h.va_list);  -- /usr/include/krb5/krb5.h:2491
   pragma Import (C, krb5_vset_error_message, "krb5_vset_error_message");

   procedure krb5_copy_error_message (arg1 : krb5_context; arg2 : krb5_context);  -- /usr/include/krb5/krb5.h:2497
   pragma Import (C, krb5_copy_error_message, "krb5_copy_error_message");

   function krb5_get_error_message (arg1 : krb5_context; arg2 : krb5_error_code) return Interfaces.C.Strings.chars_ptr;  -- /usr/include/krb5/krb5.h:2510
   pragma Import (C, krb5_get_error_message, "krb5_get_error_message");

   procedure krb5_free_error_message (arg1 : krb5_context; arg2 : Interfaces.C.Strings.chars_ptr);  -- /usr/include/krb5/krb5.h:2512
   pragma Import (C, krb5_free_error_message, "krb5_free_error_message");

   procedure krb5_clear_error_message (arg1 : krb5_context);  -- /usr/include/krb5/krb5.h:2514
   pragma Import (C, krb5_clear_error_message, "krb5_clear_error_message");

   function krb5_decode_authdata_container
     (context : krb5_context;
      c_type : krb5_authdatatype;
      container : System.Address;
      authdata : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2517
   pragma Import (C, krb5_decode_authdata_container, "krb5_decode_authdata_container");

   function krb5_encode_authdata_container
     (context : krb5_context;
      c_type : krb5_authdatatype;
      authdata : System.Address;
      container : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2523
   pragma Import (C, krb5_encode_authdata_container, "krb5_encode_authdata_container");

   function krb5_make_authdata_kdc_issued
     (context : krb5_context;
      key : System.Address;
      issuer : krb5_const_principal;
      authdata : System.Address;
      ad_kdcissued : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2532
   pragma Import (C, krb5_make_authdata_kdc_issued, "krb5_make_authdata_kdc_issued");

   function krb5_verify_authdata_kdc_issued
     (context : krb5_context;
      key : System.Address;
      ad_kdcissued : System.Address;
      issuer : System.Address;
      authdata : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2539
   pragma Import (C, krb5_verify_authdata_kdc_issued, "krb5_verify_authdata_kdc_issued");

   --  skipped empty struct krb5_pac_data

   type krb5_pac is new System.Address;  -- /usr/include/krb5/krb5.h:2549

   function krb5_pac_add_buffer
     (context : krb5_context;
      pac : krb5_pac;
      c_type : krb5_ui_4;
      data : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2552
   pragma Import (C, krb5_pac_add_buffer, "krb5_pac_add_buffer");

   procedure krb5_pac_free (context : krb5_context; pac : krb5_pac);  -- /usr/include/krb5/krb5.h:2556
   pragma Import (C, krb5_pac_free, "krb5_pac_free");

   function krb5_pac_get_buffer
     (context : krb5_context;
      pac : krb5_pac;
      c_type : krb5_ui_4;
      data : access krb5_data) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2559
   pragma Import (C, krb5_pac_get_buffer, "krb5_pac_get_buffer");

   function krb5_pac_get_types
     (context : krb5_context;
      pac : krb5_pac;
      len : access size_t;
      types : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2563
   pragma Import (C, krb5_pac_get_types, "krb5_pac_get_types");

   function krb5_pac_init (context : krb5_context; pac : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2567
   pragma Import (C, krb5_pac_init, "krb5_pac_init");

   function krb5_pac_parse
     (context : krb5_context;
      ptr : System.Address;
      len : size_t;
      pac : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2570
   pragma Import (C, krb5_pac_parse, "krb5_pac_parse");

   function krb5_pac_verify
     (context : krb5_context;
      pac : krb5_pac;
      authtime : krb5_timestamp;
      principal : krb5_const_principal;
      server : System.Address;
      privsvr : System.Address) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2574
   pragma Import (C, krb5_pac_verify, "krb5_pac_verify");

   function krb5_allow_weak_crypto (context : krb5_context; enable : krb5_boolean) return krb5_error_code;  -- /usr/include/krb5/krb5.h:2581
   pragma Import (C, krb5_allow_weak_crypto, "krb5_allow_weak_crypto");

   et_krb5_error_table : aliased et_com_err_h.error_table;  -- /usr/include/krb5/krb5.h:2858
   pragma Import (C, et_krb5_error_table, "et_krb5_error_table");

   procedure initialize_krb5_error_table;  -- /usr/include/krb5/krb5.h:2859
   pragma Import (CPP, initialize_krb5_error_table, "_Z27initialize_krb5_error_tablev");

   procedure initialize_krb5_error_table_r (list : System.Address);  -- /usr/include/krb5/krb5.h:2862
   pragma Import (CPP, initialize_krb5_error_table_r, "_Z29initialize_krb5_error_table_rPP7et_list");

   et_kdb5_error_table : aliased et_com_err_h.error_table;  -- /usr/include/krb5/krb5.h:2919
   pragma Import (C, et_kdb5_error_table, "et_kdb5_error_table");

   procedure initialize_kdb5_error_table;  -- /usr/include/krb5/krb5.h:2920
   pragma Import (CPP, initialize_kdb5_error_table, "_Z27initialize_kdb5_error_tablev");

   procedure initialize_kdb5_error_table_r (list : System.Address);  -- /usr/include/krb5/krb5.h:2923
   pragma Import (CPP, initialize_kdb5_error_table_r, "_Z29initialize_kdb5_error_table_rPP7et_list");

   et_kv5m_error_table : aliased et_com_err_h.error_table;  -- /usr/include/krb5/krb5.h:2998
   pragma Import (C, et_kv5m_error_table, "et_kv5m_error_table");

   procedure initialize_kv5m_error_table;  -- /usr/include/krb5/krb5.h:2999
   pragma Import (CPP, initialize_kv5m_error_table, "_Z27initialize_kv5m_error_tablev");

   procedure initialize_kv5m_error_table_r (list : System.Address);  -- /usr/include/krb5/krb5.h:3002
   pragma Import (CPP, initialize_kv5m_error_table_r, "_Z29initialize_kv5m_error_table_rPP7et_list");

   et_k524_error_table : aliased et_com_err_h.error_table;  -- /usr/include/krb5/krb5.h:3025
   pragma Import (C, et_k524_error_table, "et_k524_error_table");

   procedure initialize_k524_error_table;  -- /usr/include/krb5/krb5.h:3026
   pragma Import (CPP, initialize_k524_error_table, "_Z27initialize_k524_error_tablev");

   procedure initialize_k524_error_table_r (list : System.Address);  -- /usr/include/krb5/krb5.h:3029
   pragma Import (CPP, initialize_k524_error_table_r, "_Z29initialize_k524_error_table_rPP7et_list");

   et_asn1_error_table : aliased et_com_err_h.error_table;  -- /usr/include/krb5/krb5.h:3056
   pragma Import (C, et_asn1_error_table, "et_asn1_error_table");

   procedure initialize_asn1_error_table;  -- /usr/include/krb5/krb5.h:3057
   pragma Import (CPP, initialize_asn1_error_table, "_Z27initialize_asn1_error_tablev");

   procedure initialize_asn1_error_table_r (list : System.Address);  -- /usr/include/krb5/krb5.h:3060
   pragma Import (CPP, initialize_asn1_error_table_r, "_Z29initialize_asn1_error_table_rPP7et_list");

end krb5_krb5_h;
