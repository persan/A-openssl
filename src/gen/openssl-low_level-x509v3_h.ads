with Interfaces.C; use Interfaces.C;
with System;
limited with OpenSSL.Low_Level.conf_h;
with Interfaces.C.Strings;
limited with OpenSSL.Low_Level.bio_h;
with OpenSSL.Low_Level.asnl_h;
--  with OpenSSL.Low_Level.ossl_typ_h;
limited with OpenSSL.Low_Level.x509_h;
with OpenSSL.Low_Level.stack_h;
--  limited --  with Interfaces.C_Streams;
limited with OpenSSL.Low_Level.safestack_h;
with OpenSSL.Low_Level.asnlt_h;
with Interfaces.C_Streams;
limited with OpenSSL.Low_Level.x509_vfy_h;
package OpenSSL.Low_Level.x509v3_h is

   package defs is

      CTX_TEST : constant := 16#1#;  --  openssl/x509v3.h:130

      X509V3_EXT_DYNAMIC : constant := 16#1#;  --  openssl/x509v3.h:146
      X509V3_EXT_CTX_DEP : constant := 16#2#;  --  openssl/x509v3.h:147
      X509V3_EXT_MULTILINE : constant := 16#4#;  --  openssl/x509v3.h:148

      GEN_OTHERNAME : constant := 0;  --  openssl/x509v3.h:175
      GEN_EMAIL : constant := 1;  --  openssl/x509v3.h:176
      GEN_DNS  : constant := 2;  --  openssl/x509v3.h:177
      GEN_X400 : constant := 3;  --  openssl/x509v3.h:178
      GEN_DIRNAME : constant := 4;  --  openssl/x509v3.h:179
      GEN_EDIPARTY : constant := 5;  --  openssl/x509v3.h:180
      GEN_URI  : constant := 6;  --  openssl/x509v3.h:181
      GEN_IPADD : constant := 7;  --  openssl/x509v3.h:182
      GEN_RID  : constant := 8;  --  openssl/x509v3.h:183

      CRLDP_ALL_REASONS : constant := 16#807f#;  --  openssl/x509v3.h:234

      CRL_REASON_NONE : constant := -1;  --  openssl/x509v3.h:236
      CRL_REASON_UNSPECIFIED : constant := 0;  --  openssl/x509v3.h:237
      CRL_REASON_KEY_COMPROMISE : constant := 1;  --  openssl/x509v3.h:238
      CRL_REASON_CA_COMPROMISE : constant := 2;  --  openssl/x509v3.h:239
      CRL_REASON_AFFILIATION_CHANGED : constant := 3;  --  openssl/x509v3.h:240
      CRL_REASON_SUPERSEDED : constant := 4;  --  openssl/x509v3.h:241
      CRL_REASON_CESSATION_OF_OPERATION : constant := 5;  --  openssl/x509v3.h:242
      CRL_REASON_CERTIFICATE_HOLD : constant := 6;  --  openssl/x509v3.h:243
      CRL_REASON_REMOVE_FROM_CRL : constant := 8;  --  openssl/x509v3.h:244
      CRL_REASON_PRIVILEGE_WITHDRAWN : constant := 9;  --  openssl/x509v3.h:245
      CRL_REASON_AA_COMPROMISE : constant := 10;  --  openssl/x509v3.h:246

      IDP_PRESENT : constant := 16#1#;  --  openssl/x509v3.h:368

      IDP_INVALID : constant := 16#2#;  --  openssl/x509v3.h:370

      IDP_ONLYUSER : constant := 16#4#;  --  openssl/x509v3.h:372

      IDP_ONLYCA : constant := 16#8#;  --  openssl/x509v3.h:374

      IDP_ONLYATTR : constant := 16#10#;  --  openssl/x509v3.h:376

      IDP_INDIRECT : constant := 16#20#;  --  openssl/x509v3.h:378

      IDP_REASONS : constant := 16#40#;  --  openssl/x509v3.h:380
      --  arg-macro: procedure X509V3_conf_err (val)
      --    ERR_add_error_data(6, "section:", val.section, ",name:", val.name, ",value:", val.value);
      --  arg-macro: procedure X509V3_set_ctx_test (ctx)
      --    X509V3_set_ctx(ctx, NULL, NULL, NULL, NULL, CTX_TEST)
      --  arg-macro: procedure X509V3_set_ctx_nodb (ctx)
      --    (ctx).db := NULL;
      --  arg-macro: procedure EXT_BITSTRING (nid, table)
      --    { nid, 0, ASN1_ITEM_ref(ASN1_BIT_STRING), 0,0,0,0, 0,0, (X509V3_EXT_I2V)i2v_ASN1_BIT_STRING, (X509V3_EXT_V2I)v2i_ASN1_BIT_STRING, NULL, NULL, table}
      --  arg-macro: procedure EXT_IA5STRING (nid)
      --    { nid, 0, ASN1_ITEM_ref(ASN1_IA5STRING), 0,0,0,0, (X509V3_EXT_I2S)i2s_ASN1_IA5STRING, (X509V3_EXT_S2I)s2i_ASN1_IA5STRING, 0,0,0,0, NULL}
      --  unsupported macro: EXT_END { -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

      EXFLAG_BCONS : constant := 16#1#;  --  openssl/x509v3.h:409
      EXFLAG_KUSAGE : constant := 16#2#;  --  openssl/x509v3.h:410
      EXFLAG_XKUSAGE : constant := 16#4#;  --  openssl/x509v3.h:411
      EXFLAG_NSCERT : constant := 16#8#;  --  openssl/x509v3.h:412

      EXFLAG_CA : constant := 16#10#;  --  openssl/x509v3.h:414

      EXFLAG_SI : constant := 16#20#;  --  openssl/x509v3.h:416
      EXFLAG_SS : constant := 16#20#;  --  openssl/x509v3.h:417
      EXFLAG_V1 : constant := 16#40#;  --  openssl/x509v3.h:418
      EXFLAG_INVALID : constant := 16#80#;  --  openssl/x509v3.h:419
      EXFLAG_SET : constant := 16#100#;  --  openssl/x509v3.h:420
      EXFLAG_CRITICAL : constant := 16#200#;  --  openssl/x509v3.h:421
      EXFLAG_PROXY : constant := 16#400#;  --  openssl/x509v3.h:422

      EXFLAG_INVALID_POLICY : constant := 16#800#;  --  openssl/x509v3.h:424
      EXFLAG_FRESHEST : constant := 16#1000#;  --  openssl/x509v3.h:425

      KU_DIGITAL_SIGNATURE : constant := 16#0080#;  --  openssl/x509v3.h:427
      KU_NON_REPUDIATION : constant := 16#0040#;  --  openssl/x509v3.h:428
      KU_KEY_ENCIPHERMENT : constant := 16#0020#;  --  openssl/x509v3.h:429
      KU_DATA_ENCIPHERMENT : constant := 16#0010#;  --  openssl/x509v3.h:430
      KU_KEY_AGREEMENT : constant := 16#0008#;  --  openssl/x509v3.h:431
      KU_KEY_CERT_SIGN : constant := 16#0004#;  --  openssl/x509v3.h:432
      KU_CRL_SIGN : constant := 16#0002#;  --  openssl/x509v3.h:433
      KU_ENCIPHER_ONLY : constant := 16#0001#;  --  openssl/x509v3.h:434
      KU_DECIPHER_ONLY : constant := 16#8000#;  --  openssl/x509v3.h:435

      NS_SSL_CLIENT : constant := 16#80#;  --  openssl/x509v3.h:437
      NS_SSL_SERVER : constant := 16#40#;  --  openssl/x509v3.h:438
      NS_SMIME : constant := 16#20#;  --  openssl/x509v3.h:439
      NS_OBJSIGN : constant := 16#10#;  --  openssl/x509v3.h:440
      NS_SSL_CA : constant := 16#04#;  --  openssl/x509v3.h:441
      NS_SMIME_CA : constant := 16#02#;  --  openssl/x509v3.h:442
      NS_OBJSIGN_CA : constant := 16#01#;  --  openssl/x509v3.h:443
      --  unsupported macro: NS_ANY_CA (NS_SSL_CA|NS_SMIME_CA|NS_OBJSIGN_CA)

      XKU_SSL_SERVER : constant := 16#1#;  --  openssl/x509v3.h:446
      XKU_SSL_CLIENT : constant := 16#2#;  --  openssl/x509v3.h:447
      XKU_SMIME : constant := 16#4#;  --  openssl/x509v3.h:448
      XKU_CODE_SIGN : constant := 16#8#;  --  openssl/x509v3.h:449
      XKU_SGC  : constant := 16#10#;  --  openssl/x509v3.h:450
      XKU_OCSP_SIGN : constant := 16#20#;  --  openssl/x509v3.h:451
      XKU_TIMESTAMP : constant := 16#40#;  --  openssl/x509v3.h:452
      XKU_DVCS : constant := 16#80#;  --  openssl/x509v3.h:453

      X509_PURPOSE_DYNAMIC : constant := 16#1#;  --  openssl/x509v3.h:455
      X509_PURPOSE_DYNAMIC_NAME : constant := 16#2#;  --  openssl/x509v3.h:456

      X509_PURPOSE_SSL_CLIENT : constant := 1;  --  openssl/x509v3.h:469
      X509_PURPOSE_SSL_SERVER : constant := 2;  --  openssl/x509v3.h:470
      X509_PURPOSE_NS_SSL_SERVER : constant := 3;  --  openssl/x509v3.h:471
      X509_PURPOSE_SMIME_SIGN : constant := 4;  --  openssl/x509v3.h:472
      X509_PURPOSE_SMIME_ENCRYPT : constant := 5;  --  openssl/x509v3.h:473
      X509_PURPOSE_CRL_SIGN : constant := 6;  --  openssl/x509v3.h:474
      X509_PURPOSE_ANY : constant := 7;  --  openssl/x509v3.h:475
      X509_PURPOSE_OCSP_HELPER : constant := 8;  --  openssl/x509v3.h:476
      X509_PURPOSE_TIMESTAMP_SIGN : constant := 9;  --  openssl/x509v3.h:477

      X509_PURPOSE_MIN : constant := 1;  --  openssl/x509v3.h:479
      X509_PURPOSE_MAX : constant := 9;  --  openssl/x509v3.h:480
      --  unsupported macro: X509V3_EXT_UNKNOWN_MASK (0xfL << 16)

      X509V3_EXT_DEFAULT : constant := 0;  --  openssl/x509v3.h:486

      X509V3_EXT_ERROR_UNKNOWN : constant := (2 ** 16);  --  openssl/x509v3.h:488
      --  unsupported macro: X509V3_EXT_PARSE_UNKNOWN (2L << 16)
      --  unsupported macro: X509V3_EXT_DUMP_UNKNOWN (3L << 16)

      X509V3_ADD_OP_MASK : constant := 16#f#;  --  openssl/x509v3.h:496
      X509V3_ADD_DEFAULT : constant := 0;  --  openssl/x509v3.h:497
      X509V3_ADD_APPEND : constant := 1;  --  openssl/x509v3.h:498
      X509V3_ADD_REPLACE : constant := 2;  --  openssl/x509v3.h:499
      X509V3_ADD_REPLACE_EXISTING : constant := 3;  --  openssl/x509v3.h:500
      X509V3_ADD_KEEP_EXISTING : constant := 4;  --  openssl/x509v3.h:501
      X509V3_ADD_DELETE : constant := 5;  --  openssl/x509v3.h:502
      X509V3_ADD_SILENT : constant := 16#10#;  --  openssl/x509v3.h:503

      ASIdOrRange_id : constant := 0;  --  openssl/x509v3.h:716
      ASIdOrRange_range : constant := 1;  --  openssl/x509v3.h:717

      ASIdentifierChoice_inherit : constant := 0;  --  openssl/x509v3.h:730
      ASIdentifierChoice_asIdsOrRanges : constant := 1;  --  openssl/x509v3.h:731

      IPAddressOrRange_addressPrefix : constant := 0;  --  openssl/x509v3.h:755
      IPAddressOrRange_addressRange : constant := 1;  --  openssl/x509v3.h:756

      IPAddressChoice_inherit : constant := 0;  --  openssl/x509v3.h:769
      IPAddressChoice_addressesOrRanges : constant := 1;  --  openssl/x509v3.h:770

      V3_ASID_ASNUM : constant := 0;  --  openssl/x509v3.h:796
      V3_ASID_RDI : constant := 1;  --  openssl/x509v3.h:797

      IANA_AFI_IPV4 : constant := 1;  --  openssl/x509v3.h:805
      IANA_AFI_IPV6 : constant := 2;  --  openssl/x509v3.h:806

      X509V3_F_A2I_GENERAL_NAME : constant := 164;  --  openssl/x509v3.h:868
      X509V3_F_ASIDENTIFIERCHOICE_CANONIZE : constant := 161;  --  openssl/x509v3.h:869
      X509V3_F_ASIDENTIFIERCHOICE_IS_CANONICAL : constant := 162;  --  openssl/x509v3.h:870
      X509V3_F_COPY_EMAIL : constant := 122;  --  openssl/x509v3.h:871
      X509V3_F_COPY_ISSUER : constant := 123;  --  openssl/x509v3.h:872
      X509V3_F_DO_DIRNAME : constant := 144;  --  openssl/x509v3.h:873
      X509V3_F_DO_EXT_CONF : constant := 124;  --  openssl/x509v3.h:874
      X509V3_F_DO_EXT_I2D : constant := 135;  --  openssl/x509v3.h:875
      X509V3_F_DO_EXT_NCONF : constant := 151;  --  openssl/x509v3.h:876
      X509V3_F_DO_I2V_NAME_CONSTRAINTS : constant := 148;  --  openssl/x509v3.h:877
      X509V3_F_GNAMES_FROM_SECTNAME : constant := 156;  --  openssl/x509v3.h:878
      X509V3_F_HEX_TO_STRING : constant := 111;  --  openssl/x509v3.h:879
      X509V3_F_I2S_ASN1_ENUMERATED : constant := 121;  --  openssl/x509v3.h:880
      X509V3_F_I2S_ASN1_IA5STRING : constant := 149;  --  openssl/x509v3.h:881
      X509V3_F_I2S_ASN1_INTEGER : constant := 120;  --  openssl/x509v3.h:882
      X509V3_F_I2V_AUTHORITY_INFO_ACCESS : constant := 138;  --  openssl/x509v3.h:883
      X509V3_F_NOTICE_SECTION : constant := 132;  --  openssl/x509v3.h:884
      X509V3_F_NREF_NOS : constant := 133;  --  openssl/x509v3.h:885
      X509V3_F_POLICY_SECTION : constant := 131;  --  openssl/x509v3.h:886
      X509V3_F_PROCESS_PCI_VALUE : constant := 150;  --  openssl/x509v3.h:887
      X509V3_F_R2I_CERTPOL : constant := 130;  --  openssl/x509v3.h:888
      X509V3_F_R2I_PCI : constant := 155;  --  openssl/x509v3.h:889
      X509V3_F_S2I_ASN1_IA5STRING : constant := 100;  --  openssl/x509v3.h:890
      X509V3_F_S2I_ASN1_INTEGER : constant := 108;  --  openssl/x509v3.h:891
      X509V3_F_S2I_ASN1_OCTET_STRING : constant := 112;  --  openssl/x509v3.h:892
      X509V3_F_S2I_ASN1_SKEY_ID : constant := 114;  --  openssl/x509v3.h:893
      X509V3_F_S2I_SKEY_ID : constant := 115;  --  openssl/x509v3.h:894
      X509V3_F_SET_DIST_POINT_NAME : constant := 158;  --  openssl/x509v3.h:895
      X509V3_F_STRING_TO_HEX : constant := 113;  --  openssl/x509v3.h:896
      X509V3_F_SXNET_ADD_ID_ASC : constant := 125;  --  openssl/x509v3.h:897
      X509V3_F_SXNET_ADD_ID_INTEGER : constant := 126;  --  openssl/x509v3.h:898
      X509V3_F_SXNET_ADD_ID_ULONG : constant := 127;  --  openssl/x509v3.h:899
      X509V3_F_SXNET_GET_ID_ASC : constant := 128;  --  openssl/x509v3.h:900
      X509V3_F_SXNET_GET_ID_ULONG : constant := 129;  --  openssl/x509v3.h:901
      X509V3_F_V2I_ASIDENTIFIERS : constant := 163;  --  openssl/x509v3.h:902
      X509V3_F_V2I_ASN1_BIT_STRING : constant := 101;  --  openssl/x509v3.h:903
      X509V3_F_V2I_AUTHORITY_INFO_ACCESS : constant := 139;  --  openssl/x509v3.h:904
      X509V3_F_V2I_AUTHORITY_KEYID : constant := 119;  --  openssl/x509v3.h:905
      X509V3_F_V2I_BASIC_CONSTRAINTS : constant := 102;  --  openssl/x509v3.h:906
      X509V3_F_V2I_CRLD : constant := 134;  --  openssl/x509v3.h:907
      X509V3_F_V2I_EXTENDED_KEY_USAGE : constant := 103;  --  openssl/x509v3.h:908
      X509V3_F_V2I_GENERAL_NAMES : constant := 118;  --  openssl/x509v3.h:909
      X509V3_F_V2I_GENERAL_NAME_EX : constant := 117;  --  openssl/x509v3.h:910
      X509V3_F_V2I_IDP : constant := 157;  --  openssl/x509v3.h:911
      X509V3_F_V2I_IPADDRBLOCKS : constant := 159;  --  openssl/x509v3.h:912
      X509V3_F_V2I_ISSUER_ALT : constant := 153;  --  openssl/x509v3.h:913
      X509V3_F_V2I_NAME_CONSTRAINTS : constant := 147;  --  openssl/x509v3.h:914
      X509V3_F_V2I_POLICY_CONSTRAINTS : constant := 146;  --  openssl/x509v3.h:915
      X509V3_F_V2I_POLICY_MAPPINGS : constant := 145;  --  openssl/x509v3.h:916
      X509V3_F_V2I_SUBJECT_ALT : constant := 154;  --  openssl/x509v3.h:917
      X509V3_F_V3_ADDR_VALIDATE_PATH_INTERNAL : constant := 160;  --  openssl/x509v3.h:918
      X509V3_F_V3_GENERIC_EXTENSION : constant := 116;  --  openssl/x509v3.h:919
      X509V3_F_X509V3_ADD1_I2D : constant := 140;  --  openssl/x509v3.h:920
      X509V3_F_X509V3_ADD_VALUE : constant := 105;  --  openssl/x509v3.h:921
      X509V3_F_X509V3_EXT_ADD : constant := 104;  --  openssl/x509v3.h:922
      X509V3_F_X509V3_EXT_ADD_ALIAS : constant := 106;  --  openssl/x509v3.h:923
      X509V3_F_X509V3_EXT_CONF : constant := 107;  --  openssl/x509v3.h:924
      X509V3_F_X509V3_EXT_I2D : constant := 136;  --  openssl/x509v3.h:925
      X509V3_F_X509V3_EXT_NCONF : constant := 152;  --  openssl/x509v3.h:926
      X509V3_F_X509V3_GET_SECTION : constant := 142;  --  openssl/x509v3.h:927
      X509V3_F_X509V3_GET_STRING : constant := 143;  --  openssl/x509v3.h:928
      X509V3_F_X509V3_GET_VALUE_BOOL : constant := 110;  --  openssl/x509v3.h:929
      X509V3_F_X509V3_PARSE_LIST : constant := 109;  --  openssl/x509v3.h:930
      X509V3_F_X509_PURPOSE_ADD : constant := 137;  --  openssl/x509v3.h:931
      X509V3_F_X509_PURPOSE_SET : constant := 141;  --  openssl/x509v3.h:932

      X509V3_R_BAD_IP_ADDRESS : constant := 118;  --  openssl/x509v3.h:935
      X509V3_R_BAD_OBJECT : constant := 119;  --  openssl/x509v3.h:936
      X509V3_R_BN_DEC2BN_ERROR : constant := 100;  --  openssl/x509v3.h:937
      X509V3_R_BN_TO_ASN1_INTEGER_ERROR : constant := 101;  --  openssl/x509v3.h:938
      X509V3_R_DIRNAME_ERROR : constant := 149;  --  openssl/x509v3.h:939
      X509V3_R_DISTPOINT_ALREADY_SET : constant := 160;  --  openssl/x509v3.h:940
      X509V3_R_DUPLICATE_ZONE_ID : constant := 133;  --  openssl/x509v3.h:941
      X509V3_R_ERROR_CONVERTING_ZONE : constant := 131;  --  openssl/x509v3.h:942
      X509V3_R_ERROR_CREATING_EXTENSION : constant := 144;  --  openssl/x509v3.h:943
      X509V3_R_ERROR_IN_EXTENSION : constant := 128;  --  openssl/x509v3.h:944
      X509V3_R_EXPECTED_A_SECTION_NAME : constant := 137;  --  openssl/x509v3.h:945
      X509V3_R_EXTENSION_EXISTS : constant := 145;  --  openssl/x509v3.h:946
      X509V3_R_EXTENSION_NAME_ERROR : constant := 115;  --  openssl/x509v3.h:947
      X509V3_R_EXTENSION_NOT_FOUND : constant := 102;  --  openssl/x509v3.h:948
      X509V3_R_EXTENSION_SETTING_NOT_SUPPORTED : constant := 103;  --  openssl/x509v3.h:949
      X509V3_R_EXTENSION_VALUE_ERROR : constant := 116;  --  openssl/x509v3.h:950
      X509V3_R_ILLEGAL_EMPTY_EXTENSION : constant := 151;  --  openssl/x509v3.h:951
      X509V3_R_ILLEGAL_HEX_DIGIT : constant := 113;  --  openssl/x509v3.h:952
      X509V3_R_INCORRECT_POLICY_SYNTAX_TAG : constant := 152;  --  openssl/x509v3.h:953
      X509V3_R_INVALID_MULTIPLE_RDNS : constant := 161;  --  openssl/x509v3.h:954
      X509V3_R_INVALID_ASNUMBER : constant := 162;  --  openssl/x509v3.h:955
      X509V3_R_INVALID_ASRANGE : constant := 163;  --  openssl/x509v3.h:956
      X509V3_R_INVALID_BOOLEAN_STRING : constant := 104;  --  openssl/x509v3.h:957
      X509V3_R_INVALID_EXTENSION_STRING : constant := 105;  --  openssl/x509v3.h:958
      X509V3_R_INVALID_INHERITANCE : constant := 165;  --  openssl/x509v3.h:959
      X509V3_R_INVALID_IPADDRESS : constant := 166;  --  openssl/x509v3.h:960
      X509V3_R_INVALID_NAME : constant := 106;  --  openssl/x509v3.h:961
      X509V3_R_INVALID_NULL_ARGUMENT : constant := 107;  --  openssl/x509v3.h:962
      X509V3_R_INVALID_NULL_NAME : constant := 108;  --  openssl/x509v3.h:963
      X509V3_R_INVALID_NULL_VALUE : constant := 109;  --  openssl/x509v3.h:964
      X509V3_R_INVALID_NUMBER : constant := 140;  --  openssl/x509v3.h:965
      X509V3_R_INVALID_NUMBERS : constant := 141;  --  openssl/x509v3.h:966
      X509V3_R_INVALID_OBJECT_IDENTIFIER : constant := 110;  --  openssl/x509v3.h:967
      X509V3_R_INVALID_OPTION : constant := 138;  --  openssl/x509v3.h:968
      X509V3_R_INVALID_POLICY_IDENTIFIER : constant := 134;  --  openssl/x509v3.h:969
      X509V3_R_INVALID_PROXY_POLICY_SETTING : constant := 153;  --  openssl/x509v3.h:970
      X509V3_R_INVALID_PURPOSE : constant := 146;  --  openssl/x509v3.h:971
      X509V3_R_INVALID_SAFI : constant := 164;  --  openssl/x509v3.h:972
      X509V3_R_INVALID_SECTION : constant := 135;  --  openssl/x509v3.h:973
      X509V3_R_INVALID_SYNTAX : constant := 143;  --  openssl/x509v3.h:974
      X509V3_R_ISSUER_DECODE_ERROR : constant := 126;  --  openssl/x509v3.h:975
      X509V3_R_MISSING_VALUE : constant := 124;  --  openssl/x509v3.h:976
      X509V3_R_NEED_ORGANIZATION_AND_NUMBERS : constant := 142;  --  openssl/x509v3.h:977
      X509V3_R_NO_CONFIG_DATABASE : constant := 136;  --  openssl/x509v3.h:978
      X509V3_R_NO_ISSUER_CERTIFICATE : constant := 121;  --  openssl/x509v3.h:979
      X509V3_R_NO_ISSUER_DETAILS : constant := 127;  --  openssl/x509v3.h:980
      X509V3_R_NO_POLICY_IDENTIFIER : constant := 139;  --  openssl/x509v3.h:981
      X509V3_R_NO_PROXY_CERT_POLICY_LANGUAGE_DEFINED : constant := 154;  --  openssl/x509v3.h:982
      X509V3_R_NO_PUBLIC_KEY : constant := 114;  --  openssl/x509v3.h:983
      X509V3_R_NO_SUBJECT_DETAILS : constant := 125;  --  openssl/x509v3.h:984
      X509V3_R_ODD_NUMBER_OF_DIGITS : constant := 112;  --  openssl/x509v3.h:985
      X509V3_R_OPERATION_NOT_DEFINED : constant := 148;  --  openssl/x509v3.h:986
      X509V3_R_OTHERNAME_ERROR : constant := 147;  --  openssl/x509v3.h:987
      X509V3_R_POLICY_LANGUAGE_ALREADY_DEFINED : constant := 155;  --  openssl/x509v3.h:988
      X509V3_R_POLICY_PATH_LENGTH : constant := 156;  --  openssl/x509v3.h:989
      X509V3_R_POLICY_PATH_LENGTH_ALREADY_DEFINED : constant := 157;  --  openssl/x509v3.h:990
      X509V3_R_POLICY_SYNTAX_NOT_CURRENTLY_SUPPORTED : constant := 158;  --  openssl/x509v3.h:991
      X509V3_R_POLICY_WHEN_PROXY_LANGUAGE_REQUIRES_NO_POLICY : constant := 159;  --  openssl/x509v3.h:992
      X509V3_R_SECTION_NOT_FOUND : constant := 150;  --  openssl/x509v3.h:993
      X509V3_R_UNABLE_TO_GET_ISSUER_DETAILS : constant := 122;  --  openssl/x509v3.h:994
      X509V3_R_UNABLE_TO_GET_ISSUER_KEYID : constant := 123;  --  openssl/x509v3.h:995
      X509V3_R_UNKNOWN_BIT_STRING_ARGUMENT : constant := 111;  --  openssl/x509v3.h:996
      X509V3_R_UNKNOWN_EXTENSION : constant := 129;  --  openssl/x509v3.h:997
      X509V3_R_UNKNOWN_EXTENSION_NAME : constant := 130;  --  openssl/x509v3.h:998
      X509V3_R_UNKNOWN_OPTION : constant := 120;  --  openssl/x509v3.h:999
      X509V3_R_UNSUPPORTED_OPTION : constant := 117;  --  openssl/x509v3.h:1000
      X509V3_R_UNSUPPORTED_TYPE : constant := 167;  --  openssl/x509v3.h:1001
      X509V3_R_USER_TOO_LONG : constant := 132;  --  openssl/x509v3.h:1002
   end defs;
   type X509V3_EXT_NEW is access function return System.Address;  -- openssl/x509v3.h:75

   type X509V3_EXT_FREE is access procedure (arg1 : System.Address);  -- openssl/x509v3.h:76

   type X509V3_EXT_D2I is access function
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : long) return System.Address;  -- openssl/x509v3.h:77

   type X509V3_EXT_I2D is access function (arg1 : System.Address; arg2 : System.Address) return int;  -- openssl/x509v3.h:78

   type X509V3_EXT_I2V is access function
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE) return access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE;  -- openssl/x509v3.h:80

   type X509V3_EXT_V2I is access function
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE) return System.Address;  -- openssl/x509v3.h:82

   type X509V3_EXT_I2S is access function (arg1 : System.Address; arg2 : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:85

   type X509V3_EXT_S2I is access function
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/x509v3.h:86

   type X509V3_EXT_I2R is access function
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : access OpenSSL.Low_Level.bio_h.bio_st;
      arg4 : int) return int;  -- openssl/x509v3.h:88

   type X509V3_EXT_R2I is access function
     (arg1 : System.Address;
      arg2 : System.Address;
      arg3 : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/x509v3.h:90

   type v3_ext_method is record
      ext_nid   : aliased int;  -- openssl/x509v3.h:96
      ext_flags : aliased int;  -- openssl/x509v3.h:97
      it        : access constant OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:99
      ext_new   : access function return System.Address;  -- openssl/x509v3.h:101
      ext_free  : access procedure (arg1 : System.Address);  -- openssl/x509v3.h:102
      d2i       : access function
        (arg1 : System.Address;
         arg2      : System.Address;
         arg3      : long) return System.Address;  -- openssl/x509v3.h:103
      i2d       : access function (arg1 : System.Address; arg2 : System.Address) return int;  -- openssl/x509v3.h:104
      i2s       : access function (arg1 : access constant v3_ext_method; arg2 : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:107
      s2i       : access function
        (arg1 : access constant v3_ext_method;
         arg2      : System.Address;
         arg3      : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/x509v3.h:108
      i2v       : access function
        (arg1 : access constant v3_ext_method;
         arg2      : System.Address;
         arg3      : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE) return access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE;  -- openssl/x509v3.h:111
      v2i       : access function
        (arg1 : access constant v3_ext_method;
         arg2      : System.Address;
         arg3      : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE) return System.Address;  -- openssl/x509v3.h:112
      i2r       : access function
        (arg1 : access constant v3_ext_method;
         arg2      : System.Address;
         arg3      : access OpenSSL.Low_Level.bio_h.bio_st;
         arg4      : int) return int;  -- openssl/x509v3.h:115
      r2i       : access function
        (arg1 : access constant v3_ext_method;
         arg2      : System.Address;
         arg3      : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/x509v3.h:116
      usr_data  : System.Address;  -- openssl/x509v3.h:118
   end record;
   pragma Convention (C_Pass_By_Copy, v3_ext_method);  -- openssl/x509v3.h:95

   type X509V3_CONF_METHOD_st is record
      get_string   : access function
        (arg1 : System.Address;
         arg2         : Interfaces.C.Strings.chars_ptr;
         arg3         : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:122
      get_section  : access function (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE;  -- openssl/x509v3.h:123
      free_string  : access procedure (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr);  -- openssl/x509v3.h:124
      free_section : access procedure (arg1 : System.Address; arg2 : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE);  -- openssl/x509v3.h:125
   end record;
   pragma Convention (C_Pass_By_Copy, X509V3_CONF_METHOD_st);  -- openssl/x509v3.h:121

   subtype X509V3_CONF_METHOD is X509V3_CONF_METHOD_st;

   type v3_ext_ctx is record
      flags        : aliased int;  -- openssl/x509v3.h:131
      issuer_cert  : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509v3.h:132
      subject_cert : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/x509v3.h:133
      subject_req  : access OpenSSL.Low_Level.x509_h.X509_req_st;  -- openssl/x509v3.h:134
      crl          : access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/x509v3.h:135
      db_meth      : access X509V3_CONF_METHOD;  -- openssl/x509v3.h:136
      db           : System.Address;  -- openssl/x509v3.h:137
   end record;
   pragma Convention (C_Pass_By_Copy, v3_ext_ctx);  -- openssl/x509v3.h:129

   subtype X509V3_EXT_METHOD is v3_ext_method;

   type stack_st_X509V3_EXT_METHOD is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:143
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509V3_EXT_METHOD);  -- openssl/x509v3.h:143

   subtype ENUMERATED_NAMES is OpenSSL.Low_Level.asnl_h.BIT_STRING_BITNAME_st;

   type BASIC_CONSTRAINTS_st is record
      ca      : aliased int;  -- openssl/x509v3.h:153
      pathlen : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:154
   end record;
   pragma Convention (C_Pass_By_Copy, BASIC_CONSTRAINTS_st);  -- openssl/x509v3.h:152

   subtype BASIC_CONSTRAINTS is BASIC_CONSTRAINTS_st;

   type PKEY_USAGE_PERIOD_st is record
      notBefore : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:159
      notAfter  : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:160
   end record;
   pragma Convention (C_Pass_By_Copy, PKEY_USAGE_PERIOD_st);  -- openssl/x509v3.h:158

   subtype PKEY_USAGE_PERIOD is PKEY_USAGE_PERIOD_st;

   type otherName_st is record
      type_id : access OpenSSL.Low_Level.asnl_h.asn1_object_st;  -- openssl/x509v3.h:164
      value   : access OpenSSL.Low_Level.asnl_h.asn1_type_st;  -- openssl/x509v3.h:165
   end record;
   pragma Convention (C_Pass_By_Copy, otherName_st);  -- openssl/x509v3.h:163

   subtype OTHERNAME is otherName_st;

   type EDIPartyName_st is record
      nameAssigner : access OpenSSL.Low_Level.asnl_h.ASN1_STRING;  -- openssl/x509v3.h:169
      partyName    : access OpenSSL.Low_Level.asnl_h.ASN1_STRING;  -- openssl/x509v3.h:170
   end record;
   pragma Convention (C_Pass_By_Copy, EDIPartyName_st);  -- openssl/x509v3.h:168

   subtype EDIPARTYNAME is EDIPartyName_st;

   type anon_44 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ptr                       : Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:187
         when 1 =>
            the_otherName             : access OTHERNAME;  -- openssl/x509v3.h:188
         when 2 =>
            rfc822Name                : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:189
         when 3 =>
            dNSName                   : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:190
         when 4 =>
            x400Address               : access OpenSSL.Low_Level.asnl_h.asn1_type_st;  -- openssl/x509v3.h:191
         when 5 =>
            directoryName             : access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/x509v3.h:192
         when 6 =>
            the_ediPartyName          : access EDIPARTYNAME;  -- openssl/x509v3.h:193
         when 7 =>
            uniformResourceIdentifier : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:194
         when 8 =>
            iPAddress                 : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:195
         when 9 =>
            registeredID              : access OpenSSL.Low_Level.asnl_h.asn1_object_st;  -- openssl/x509v3.h:196
         when 10 =>
            ip                        : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:199
         when 11 =>
            dirn                      : access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/x509v3.h:200
         when 12 =>
            ia5                       : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:201
         when 13 =>
            rid                       : access OpenSSL.Low_Level.asnl_h.asn1_object_st;  -- openssl/x509v3.h:202
         when others =>
            other                     : access OpenSSL.Low_Level.asnl_h.asn1_type_st;  -- openssl/x509v3.h:203
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_44);
   pragma Unchecked_Union (anon_44);
   type GENERAL_NAME_st is record
      c_type : aliased int;  -- openssl/x509v3.h:185
      d      : anon_44;  -- openssl/x509v3.h:204
   end record;
   pragma Convention (C_Pass_By_Copy, GENERAL_NAME_st);  -- openssl/x509v3.h:173

   subtype GENERAL_NAME is GENERAL_NAME_st;

   type stack_st_GENERAL_NAME;
   subtype GENERAL_NAMES is stack_st_GENERAL_NAME;

   type ACCESS_DESCRIPTION_st is record
      method   : access OpenSSL.Low_Level.asnl_h.asn1_object_st;  -- openssl/x509v3.h:210
      location : access GENERAL_NAME;  -- openssl/x509v3.h:211
   end record;
   pragma Convention (C_Pass_By_Copy, ACCESS_DESCRIPTION_st);  -- openssl/x509v3.h:209

   subtype ACCESS_DESCRIPTION is ACCESS_DESCRIPTION_st;

   type stack_st_ACCESS_DESCRIPTION;
   subtype AUTHORITY_INFO_ACCESS is stack_st_ACCESS_DESCRIPTION;

   subtype EXTENDED_KEY_USAGE is OpenSSL.Low_Level.asnl_h.stack_st_ASN1_OBJECT;

   type stack_st_GENERAL_NAME is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:218
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_GENERAL_NAME);  -- openssl/x509v3.h:218

   type stack_st_ACCESS_DESCRIPTION is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:221
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_ACCESS_DESCRIPTION);  -- openssl/x509v3.h:221

   type anon_45 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            fullname     : access GENERAL_NAMES;  -- openssl/x509v3.h:227
         when others =>
            relativename : access OpenSSL.Low_Level.x509_h.stack_st_X509_NAME_ENTRY;  -- openssl/x509v3.h:228
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_45);
   pragma Unchecked_Union (anon_45);
   type DIST_POINT_NAME_st is record
      c_type : aliased int;  -- openssl/x509v3.h:225
      name   : anon_45;  -- openssl/x509v3.h:229
      dpname : access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/x509v3.h:231
   end record;
   pragma Convention (C_Pass_By_Copy, DIST_POINT_NAME_st);  -- openssl/x509v3.h:224

   subtype DIST_POINT_NAME is DIST_POINT_NAME_st;

   type DIST_POINT_st is record
      distpoint  : access DIST_POINT_NAME;  -- openssl/x509v3.h:249
      reasons    : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:250
      CRLissuer  : access GENERAL_NAMES;  -- openssl/x509v3.h:251
      dp_reasons : aliased int;  -- openssl/x509v3.h:252
   end record;
   pragma Convention (C_Pass_By_Copy, DIST_POINT_st);  -- openssl/x509v3.h:248

   type stack_st_DIST_POINT;
   subtype CRL_DIST_POINTS is stack_st_DIST_POINT;

   type stack_st_DIST_POINT is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:257
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_DIST_POINT);  -- openssl/x509v3.h:257

   type AUTHORITY_KEYID_st is record
      keyid  : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:261
      issuer : access GENERAL_NAMES;  -- openssl/x509v3.h:262
      serial : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:263
   end record;
   pragma Convention (C_Pass_By_Copy, AUTHORITY_KEYID_st);  -- openssl/x509v3.h:260

   type SXNET_ID_st is record
      zone : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:269
      user : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:270
   end record;
   pragma Convention (C_Pass_By_Copy, SXNET_ID_st);  -- openssl/x509v3.h:268

   subtype SXNETID is SXNET_ID_st;

   type stack_st_SXNETID is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:273
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_SXNETID);  -- openssl/x509v3.h:273

   type SXNET_st is record
      version : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:277
      ids     : access stack_st_SXNETID;  -- openssl/x509v3.h:278
   end record;
   pragma Convention (C_Pass_By_Copy, SXNET_st);  -- openssl/x509v3.h:276

   subtype SXNET is SXNET_st;

   type NOTICEREF_st is record
      organization : access OpenSSL.Low_Level.asnl_h.ASN1_STRING;  -- openssl/x509v3.h:282
      noticenos    : access OpenSSL.Low_Level.asnl_h.stack_st_ASN1_INTEGER;  -- openssl/x509v3.h:283
   end record;
   pragma Convention (C_Pass_By_Copy, NOTICEREF_st);  -- openssl/x509v3.h:281

   subtype NOTICEREF is NOTICEREF_st;

   type USERNOTICE_st is record
      the_noticeref : access NOTICEREF;  -- openssl/x509v3.h:287
      exptext       : access OpenSSL.Low_Level.asnl_h.ASN1_STRING;  -- openssl/x509v3.h:288
   end record;
   pragma Convention (C_Pass_By_Copy, USERNOTICE_st);  -- openssl/x509v3.h:286

   subtype USERNOTICE is USERNOTICE_st;

   type anon_46 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            cpsuri         : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:294
         when 1 =>
            the_usernotice : access USERNOTICE;  -- openssl/x509v3.h:295
         when others =>
            other          : access OpenSSL.Low_Level.asnl_h.asn1_type_st;  -- openssl/x509v3.h:296
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_46);
   pragma Unchecked_Union (anon_46);
   type POLICYQUALINFO_st is record
      pqualid : access OpenSSL.Low_Level.asnl_h.asn1_object_st;  -- openssl/x509v3.h:292
      d       : anon_46;  -- openssl/x509v3.h:297
   end record;
   pragma Convention (C_Pass_By_Copy, POLICYQUALINFO_st);  -- openssl/x509v3.h:291

   subtype POLICYQUALINFO is POLICYQUALINFO_st;

   type stack_st_POLICYQUALINFO is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:300
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_POLICYQUALINFO);  -- openssl/x509v3.h:300

   type POLICYINFO_st is record
      policyid   : access OpenSSL.Low_Level.asnl_h.asn1_object_st;  -- openssl/x509v3.h:304
      qualifiers : access stack_st_POLICYQUALINFO;  -- openssl/x509v3.h:305
   end record;
   pragma Convention (C_Pass_By_Copy, POLICYINFO_st);  -- openssl/x509v3.h:303

   subtype POLICYINFO is POLICYINFO_st;

   type stack_st_POLICYINFO;
   subtype CERTIFICATEPOLICIES is stack_st_POLICYINFO;

   type stack_st_POLICYINFO is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:310
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_POLICYINFO);  -- openssl/x509v3.h:310

   type POLICY_MAPPING_st is record
      issuerDomainPolicy  : access OpenSSL.Low_Level.asnl_h.asn1_object_st;  -- openssl/x509v3.h:314
      subjectDomainPolicy : access OpenSSL.Low_Level.asnl_h.asn1_object_st;  -- openssl/x509v3.h:315
   end record;
   pragma Convention (C_Pass_By_Copy, POLICY_MAPPING_st);  -- openssl/x509v3.h:313

   subtype POLICY_MAPPING is POLICY_MAPPING_st;

   type stack_st_POLICY_MAPPING is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:318
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_POLICY_MAPPING);  -- openssl/x509v3.h:318

   subtype POLICY_MAPPINGS is stack_st_POLICY_MAPPING;

   type GENERAL_SUBTREE_st is record
      base    : access GENERAL_NAME;  -- openssl/x509v3.h:323
      minimum : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:324
      maximum : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:325
   end record;
   pragma Convention (C_Pass_By_Copy, GENERAL_SUBTREE_st);  -- openssl/x509v3.h:322

   subtype GENERAL_SUBTREE is GENERAL_SUBTREE_st;

   type stack_st_GENERAL_SUBTREE is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:328
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_GENERAL_SUBTREE);  -- openssl/x509v3.h:328

   type NAME_CONSTRAINTS_st is record
      permittedSubtrees : access stack_st_GENERAL_SUBTREE;  -- openssl/x509v3.h:331
      excludedSubtrees  : access stack_st_GENERAL_SUBTREE;  -- openssl/x509v3.h:332
   end record;
   pragma Convention (C_Pass_By_Copy, NAME_CONSTRAINTS_st);  -- openssl/x509v3.h:330

   type POLICY_CONSTRAINTS_st is record
      requireExplicitPolicy : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:336
      inhibitPolicyMapping  : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:337
   end record;
   pragma Convention (C_Pass_By_Copy, POLICY_CONSTRAINTS_st);  -- openssl/x509v3.h:335

   subtype POLICY_CONSTRAINTS is POLICY_CONSTRAINTS_st;

   type PROXY_POLICY_st is record
      policyLanguage : access OpenSSL.Low_Level.asnl_h.asn1_object_st;  -- openssl/x509v3.h:343
      policy         : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:344
   end record;
   pragma Convention (C_Pass_By_Copy, PROXY_POLICY_st);  -- openssl/x509v3.h:341

   subtype PROXY_POLICY is PROXY_POLICY_st;

   type PROXY_CERT_INFO_EXTENSION_st is record
      pcPathLengthConstraint : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:349
      proxyPolicy            : access PROXY_POLICY;  -- openssl/x509v3.h:350
   end record;
   pragma Convention (C_Pass_By_Copy, PROXY_CERT_INFO_EXTENSION_st);  -- openssl/x509v3.h:347

   subtype PROXY_CERT_INFO_EXTENSION is PROXY_CERT_INFO_EXTENSION_st;

   PROXY_POLICY_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:353
   pragma Import (C, PROXY_POLICY_it, "PROXY_POLICY_it");

   function i2d_PROXY_POLICY (a : access PROXY_POLICY; c_out : System.Address) return int;  -- openssl/x509v3.h:353
   pragma Import (C, i2d_PROXY_POLICY, "i2d_PROXY_POLICY");

   function d2i_PROXY_POLICY
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PROXY_POLICY;  -- openssl/x509v3.h:353
   pragma Import (C, d2i_PROXY_POLICY, "d2i_PROXY_POLICY");

   procedure PROXY_POLICY_free (a : access PROXY_POLICY);  -- openssl/x509v3.h:353
   pragma Import (C, PROXY_POLICY_free, "PROXY_POLICY_free");

   function PROXY_POLICY_new return access PROXY_POLICY;  -- openssl/x509v3.h:353
   pragma Import (C, PROXY_POLICY_new, "PROXY_POLICY_new");

   PROXY_CERT_INFO_EXTENSION_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:354
   pragma Import (C, PROXY_CERT_INFO_EXTENSION_it, "PROXY_CERT_INFO_EXTENSION_it");

   function i2d_PROXY_CERT_INFO_EXTENSION (a : access PROXY_CERT_INFO_EXTENSION; c_out : System.Address) return int;  -- openssl/x509v3.h:354
   pragma Import (C, i2d_PROXY_CERT_INFO_EXTENSION, "i2d_PROXY_CERT_INFO_EXTENSION");

   function d2i_PROXY_CERT_INFO_EXTENSION
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PROXY_CERT_INFO_EXTENSION;  -- openssl/x509v3.h:354
   pragma Import (C, d2i_PROXY_CERT_INFO_EXTENSION, "d2i_PROXY_CERT_INFO_EXTENSION");

   procedure PROXY_CERT_INFO_EXTENSION_free (a : access PROXY_CERT_INFO_EXTENSION);  -- openssl/x509v3.h:354
   pragma Import (C, PROXY_CERT_INFO_EXTENSION_free, "PROXY_CERT_INFO_EXTENSION_free");

   function PROXY_CERT_INFO_EXTENSION_new return access PROXY_CERT_INFO_EXTENSION;  -- openssl/x509v3.h:354
   pragma Import (C, PROXY_CERT_INFO_EXTENSION_new, "PROXY_CERT_INFO_EXTENSION_new");

   type ISSUING_DIST_POINT_st is record
      distpoint       : access DIST_POINT_NAME;  -- openssl/x509v3.h:358
      onlyuser        : aliased int;  -- openssl/x509v3.h:359
      onlyCA          : aliased int;  -- openssl/x509v3.h:360
      onlysomereasons : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:361
      indirectCRL     : aliased int;  -- openssl/x509v3.h:362
      onlyattr        : aliased int;  -- openssl/x509v3.h:363
   end record;
   pragma Convention (C_Pass_By_Copy, ISSUING_DIST_POINT_st);  -- openssl/x509v3.h:356

   type x509_purpose_st is record
      purpose       : aliased int;  -- openssl/x509v3.h:459
      trust         : aliased int;  -- openssl/x509v3.h:460
      flags         : aliased int;  -- openssl/x509v3.h:461
      check_purpose : access function
        (arg1 : System.Address;
         arg2          : access constant OpenSSL.Low_Level.x509_h.x509_st;
         arg3          : int) return int;  -- openssl/x509v3.h:463
      name          : Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:464
      sname         : Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:465
      usr_data      : System.Address;  -- openssl/x509v3.h:466
   end record;
   pragma Convention (C_Pass_By_Copy, x509_purpose_st);  -- openssl/x509v3.h:458

   subtype X509_PURPOSE is x509_purpose_st;

   type stack_st_X509_PURPOSE is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:505
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_PURPOSE);  -- openssl/x509v3.h:505

   BASIC_CONSTRAINTS_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:507
   pragma Import (C, BASIC_CONSTRAINTS_it, "BASIC_CONSTRAINTS_it");

   function i2d_BASIC_CONSTRAINTS (a : access BASIC_CONSTRAINTS; c_out : System.Address) return int;  -- openssl/x509v3.h:507
   pragma Import (C, i2d_BASIC_CONSTRAINTS, "i2d_BASIC_CONSTRAINTS");

   function d2i_BASIC_CONSTRAINTS
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access BASIC_CONSTRAINTS;  -- openssl/x509v3.h:507
   pragma Import (C, d2i_BASIC_CONSTRAINTS, "d2i_BASIC_CONSTRAINTS");

   procedure BASIC_CONSTRAINTS_free (a : access BASIC_CONSTRAINTS);  -- openssl/x509v3.h:507
   pragma Import (C, BASIC_CONSTRAINTS_free, "BASIC_CONSTRAINTS_free");

   function BASIC_CONSTRAINTS_new return access BASIC_CONSTRAINTS;  -- openssl/x509v3.h:507
   pragma Import (C, BASIC_CONSTRAINTS_new, "BASIC_CONSTRAINTS_new");

   SXNET_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:509
   pragma Import (C, SXNET_it, "SXNET_it");

   function i2d_SXNET (a : access SXNET; c_out : System.Address) return int;  -- openssl/x509v3.h:509
   pragma Import (C, i2d_SXNET, "i2d_SXNET");

   function d2i_SXNET
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access SXNET;  -- openssl/x509v3.h:509
   pragma Import (C, d2i_SXNET, "d2i_SXNET");

   procedure SXNET_free (a : access SXNET);  -- openssl/x509v3.h:509
   pragma Import (C, SXNET_free, "SXNET_free");

   function SXNET_new return access SXNET;  -- openssl/x509v3.h:509
   pragma Import (C, SXNET_new, "SXNET_new");

   SXNETID_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:510
   pragma Import (C, SXNETID_it, "SXNETID_it");

   function i2d_SXNETID (a : access SXNETID; c_out : System.Address) return int;  -- openssl/x509v3.h:510
   pragma Import (C, i2d_SXNETID, "i2d_SXNETID");

   function d2i_SXNETID
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access SXNETID;  -- openssl/x509v3.h:510
   pragma Import (C, d2i_SXNETID, "d2i_SXNETID");

   procedure SXNETID_free (a : access SXNETID);  -- openssl/x509v3.h:510
   pragma Import (C, SXNETID_free, "SXNETID_free");

   function SXNETID_new return access SXNETID;  -- openssl/x509v3.h:510
   pragma Import (C, SXNETID_new, "SXNETID_new");

   function SXNET_add_id_asc
     (psx     : System.Address;
      zone    : Interfaces.C.Strings.chars_ptr;
      user    : Interfaces.C.Strings.chars_ptr;
      userlen : int) return int;  -- openssl/x509v3.h:512
   pragma Import (C, SXNET_add_id_asc, "SXNET_add_id_asc");

   function SXNET_add_id_ulong
     (psx     : System.Address;
      lzone   : unsigned_long;
      user    : Interfaces.C.Strings.chars_ptr;
      userlen : int) return int;  -- openssl/x509v3.h:513
   pragma Import (C, SXNET_add_id_ulong, "SXNET_add_id_ulong");

   function SXNET_add_id_INTEGER
     (psx     : System.Address;
      izone   : access OpenSSL.Low_Level.asnl_h.asn1_string_st;
      user    : Interfaces.C.Strings.chars_ptr;
      userlen : int) return int;  -- openssl/x509v3.h:514
   pragma Import (C, SXNET_add_id_INTEGER, "SXNET_add_id_INTEGER");

   function SXNET_get_id_asc (sx : access SXNET; zone : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:516
   pragma Import (C, SXNET_get_id_asc, "SXNET_get_id_asc");

   function SXNET_get_id_ulong (sx : access SXNET; lzone : unsigned_long) return access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:517
   pragma Import (C, SXNET_get_id_ulong, "SXNET_get_id_ulong");

   function SXNET_get_id_INTEGER (sx : access SXNET; zone : access OpenSSL.Low_Level.asnl_h.asn1_string_st) return access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:518
   pragma Import (C, SXNET_get_id_INTEGER, "SXNET_get_id_INTEGER");

   AUTHORITY_KEYID_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:520
   pragma Import (C, AUTHORITY_KEYID_it, "AUTHORITY_KEYID_it");

   function i2d_AUTHORITY_KEYID (a : access OpenSSL.Low_Level.x509v3_h.AUTHORITY_KEYID_st; c_out : System.Address) return int;  -- openssl/x509v3.h:520
   pragma Import (C, i2d_AUTHORITY_KEYID, "i2d_AUTHORITY_KEYID");

   function d2i_AUTHORITY_KEYID
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.x509v3_h.AUTHORITY_KEYID_st;  -- openssl/x509v3.h:520
   pragma Import (C, d2i_AUTHORITY_KEYID, "d2i_AUTHORITY_KEYID");

   procedure AUTHORITY_KEYID_free (a : access OpenSSL.Low_Level.x509v3_h.AUTHORITY_KEYID_st);  -- openssl/x509v3.h:520
   pragma Import (C, AUTHORITY_KEYID_free, "AUTHORITY_KEYID_free");

   function AUTHORITY_KEYID_new return access OpenSSL.Low_Level.x509v3_h.AUTHORITY_KEYID_st;  -- openssl/x509v3.h:520
   pragma Import (C, AUTHORITY_KEYID_new, "AUTHORITY_KEYID_new");

   PKEY_USAGE_PERIOD_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:522
   pragma Import (C, PKEY_USAGE_PERIOD_it, "PKEY_USAGE_PERIOD_it");

   function i2d_PKEY_USAGE_PERIOD (a : access PKEY_USAGE_PERIOD; c_out : System.Address) return int;  -- openssl/x509v3.h:522
   pragma Import (C, i2d_PKEY_USAGE_PERIOD, "i2d_PKEY_USAGE_PERIOD");

   function d2i_PKEY_USAGE_PERIOD
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access PKEY_USAGE_PERIOD;  -- openssl/x509v3.h:522
   pragma Import (C, d2i_PKEY_USAGE_PERIOD, "d2i_PKEY_USAGE_PERIOD");

   procedure PKEY_USAGE_PERIOD_free (a : access PKEY_USAGE_PERIOD);  -- openssl/x509v3.h:522
   pragma Import (C, PKEY_USAGE_PERIOD_free, "PKEY_USAGE_PERIOD_free");

   function PKEY_USAGE_PERIOD_new return access PKEY_USAGE_PERIOD;  -- openssl/x509v3.h:522
   pragma Import (C, PKEY_USAGE_PERIOD_new, "PKEY_USAGE_PERIOD_new");

   GENERAL_NAME_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:524
   pragma Import (C, GENERAL_NAME_it, "GENERAL_NAME_it");

   function i2d_GENERAL_NAME (a : access GENERAL_NAME; c_out : System.Address) return int;  -- openssl/x509v3.h:524
   pragma Import (C, i2d_GENERAL_NAME, "i2d_GENERAL_NAME");

   function d2i_GENERAL_NAME
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access GENERAL_NAME;  -- openssl/x509v3.h:524
   pragma Import (C, d2i_GENERAL_NAME, "d2i_GENERAL_NAME");

   procedure GENERAL_NAME_free (a : access GENERAL_NAME);  -- openssl/x509v3.h:524
   pragma Import (C, GENERAL_NAME_free, "GENERAL_NAME_free");

   function GENERAL_NAME_new return access GENERAL_NAME;  -- openssl/x509v3.h:524
   pragma Import (C, GENERAL_NAME_new, "GENERAL_NAME_new");

   function GENERAL_NAME_dup (a : access GENERAL_NAME) return access GENERAL_NAME;  -- openssl/x509v3.h:525
   pragma Import (C, GENERAL_NAME_dup, "GENERAL_NAME_dup");

   function GENERAL_NAME_cmp (a : access GENERAL_NAME; b : access GENERAL_NAME) return int;  -- openssl/x509v3.h:526
   pragma Import (C, GENERAL_NAME_cmp, "GENERAL_NAME_cmp");

   function v2i_ASN1_BIT_STRING
     (method : access X509V3_EXT_METHOD;
      ctx    : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      nval   : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE) return access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:530
   pragma Import (C, v2i_ASN1_BIT_STRING, "v2i_ASN1_BIT_STRING");

   function i2v_ASN1_BIT_STRING
     (method  : access X509V3_EXT_METHOD;
      bits    : access OpenSSL.Low_Level.asnl_h.asn1_string_st;
      extlist : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE) return access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE;  -- openssl/x509v3.h:532
   pragma Import (C, i2v_ASN1_BIT_STRING, "i2v_ASN1_BIT_STRING");

   function i2v_GENERAL_NAME
     (method : access X509V3_EXT_METHOD;
      gen    : access GENERAL_NAME;
      ret    : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE) return access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE;  -- openssl/x509v3.h:536
   pragma Import (C, i2v_GENERAL_NAME, "i2v_GENERAL_NAME");

   function GENERAL_NAME_print (c_out : access OpenSSL.Low_Level.bio_h.bio_st; gen : access GENERAL_NAME) return int;  -- openssl/x509v3.h:537
   pragma Import (C, GENERAL_NAME_print, "GENERAL_NAME_print");

   GENERAL_NAMES_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:539
   pragma Import (C, GENERAL_NAMES_it, "GENERAL_NAMES_it");

   function i2d_GENERAL_NAMES (a : access GENERAL_NAMES; c_out : System.Address) return int;  -- openssl/x509v3.h:539
   pragma Import (C, i2d_GENERAL_NAMES, "i2d_GENERAL_NAMES");

   function d2i_GENERAL_NAMES
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access GENERAL_NAMES;  -- openssl/x509v3.h:539
   pragma Import (C, d2i_GENERAL_NAMES, "d2i_GENERAL_NAMES");

   procedure GENERAL_NAMES_free (a : access GENERAL_NAMES);  -- openssl/x509v3.h:539
   pragma Import (C, GENERAL_NAMES_free, "GENERAL_NAMES_free");

   function GENERAL_NAMES_new return access GENERAL_NAMES;  -- openssl/x509v3.h:539
   pragma Import (C, GENERAL_NAMES_new, "GENERAL_NAMES_new");

   function i2v_GENERAL_NAMES
     (method  : access X509V3_EXT_METHOD;
      gen     : access GENERAL_NAMES;
      extlist : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE) return access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE;  -- openssl/x509v3.h:541
   pragma Import (C, i2v_GENERAL_NAMES, "i2v_GENERAL_NAMES");

   function v2i_GENERAL_NAMES
     (method : System.Address;
      ctx    : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      nval   : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE) return access GENERAL_NAMES;  -- openssl/x509v3.h:543
   pragma Import (C, v2i_GENERAL_NAMES, "v2i_GENERAL_NAMES");

   OTHERNAME_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:546
   pragma Import (C, OTHERNAME_it, "OTHERNAME_it");

   function i2d_OTHERNAME (a : access OTHERNAME; c_out : System.Address) return int;  -- openssl/x509v3.h:546
   pragma Import (C, i2d_OTHERNAME, "i2d_OTHERNAME");

   function d2i_OTHERNAME
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OTHERNAME;  -- openssl/x509v3.h:546
   pragma Import (C, d2i_OTHERNAME, "d2i_OTHERNAME");

   procedure OTHERNAME_free (a : access OTHERNAME);  -- openssl/x509v3.h:546
   pragma Import (C, OTHERNAME_free, "OTHERNAME_free");

   function OTHERNAME_new return access OTHERNAME;  -- openssl/x509v3.h:546
   pragma Import (C, OTHERNAME_new, "OTHERNAME_new");

   EDIPARTYNAME_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:547
   pragma Import (C, EDIPARTYNAME_it, "EDIPARTYNAME_it");

   function i2d_EDIPARTYNAME (a : access EDIPARTYNAME; c_out : System.Address) return int;  -- openssl/x509v3.h:547
   pragma Import (C, i2d_EDIPARTYNAME, "i2d_EDIPARTYNAME");

   function d2i_EDIPARTYNAME
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access EDIPARTYNAME;  -- openssl/x509v3.h:547
   pragma Import (C, d2i_EDIPARTYNAME, "d2i_EDIPARTYNAME");

   procedure EDIPARTYNAME_free (a : access EDIPARTYNAME);  -- openssl/x509v3.h:547
   pragma Import (C, EDIPARTYNAME_free, "EDIPARTYNAME_free");

   function EDIPARTYNAME_new return access EDIPARTYNAME;  -- openssl/x509v3.h:547
   pragma Import (C, EDIPARTYNAME_new, "EDIPARTYNAME_new");

   function OTHERNAME_cmp (a : access OTHERNAME; b : access OTHERNAME) return int;  -- openssl/x509v3.h:548
   pragma Import (C, OTHERNAME_cmp, "OTHERNAME_cmp");

   procedure GENERAL_NAME_set0_value
     (a      : access GENERAL_NAME;
      c_type : int;
      value  : System.Address);  -- openssl/x509v3.h:549
   pragma Import (C, GENERAL_NAME_set0_value, "GENERAL_NAME_set0_value");

   function GENERAL_NAME_get0_value (a : access GENERAL_NAME; ptype : access int) return System.Address;  -- openssl/x509v3.h:550
   pragma Import (C, GENERAL_NAME_get0_value, "GENERAL_NAME_get0_value");

   function GENERAL_NAME_set0_othername
     (gen   : access GENERAL_NAME;
      oid   : access OpenSSL.Low_Level.asnl_h.asn1_object_st;
      value : access OpenSSL.Low_Level.asnl_h.asn1_type_st) return int;  -- openssl/x509v3.h:551
   pragma Import (C, GENERAL_NAME_set0_othername, "GENERAL_NAME_set0_othername");

   function GENERAL_NAME_get0_otherName
     (gen    : access GENERAL_NAME;
      poid   : System.Address;
      pvalue : System.Address) return int;  -- openssl/x509v3.h:553
   pragma Import (C, GENERAL_NAME_get0_otherName, "GENERAL_NAME_get0_otherName");

   function i2s_ASN1_OCTET_STRING (method : access X509V3_EXT_METHOD; ia5 : access OpenSSL.Low_Level.asnl_h.asn1_string_st) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:556
   pragma Import (C, i2s_ASN1_OCTET_STRING, "i2s_ASN1_OCTET_STRING");

   function s2i_ASN1_OCTET_STRING
     (method : access X509V3_EXT_METHOD;
      ctx    : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      str    : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:557
   pragma Import (C, s2i_ASN1_OCTET_STRING, "s2i_ASN1_OCTET_STRING");

   EXTENDED_KEY_USAGE_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:559
   pragma Import (C, EXTENDED_KEY_USAGE_it, "EXTENDED_KEY_USAGE_it");

   function i2d_EXTENDED_KEY_USAGE (a : access EXTENDED_KEY_USAGE; c_out : System.Address) return int;  -- openssl/x509v3.h:559
   pragma Import (C, i2d_EXTENDED_KEY_USAGE, "i2d_EXTENDED_KEY_USAGE");

   function d2i_EXTENDED_KEY_USAGE
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access EXTENDED_KEY_USAGE;  -- openssl/x509v3.h:559
   pragma Import (C, d2i_EXTENDED_KEY_USAGE, "d2i_EXTENDED_KEY_USAGE");

   procedure EXTENDED_KEY_USAGE_free (a : access EXTENDED_KEY_USAGE);  -- openssl/x509v3.h:559
   pragma Import (C, EXTENDED_KEY_USAGE_free, "EXTENDED_KEY_USAGE_free");

   function EXTENDED_KEY_USAGE_new return access EXTENDED_KEY_USAGE;  -- openssl/x509v3.h:559
   pragma Import (C, EXTENDED_KEY_USAGE_new, "EXTENDED_KEY_USAGE_new");

   function i2a_ACCESS_DESCRIPTION (bp : access OpenSSL.Low_Level.bio_h.bio_st; a : access ACCESS_DESCRIPTION) return int;  -- openssl/x509v3.h:560
   pragma Import (C, i2a_ACCESS_DESCRIPTION, "i2a_ACCESS_DESCRIPTION");

   CERTIFICATEPOLICIES_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:562
   pragma Import (C, CERTIFICATEPOLICIES_it, "CERTIFICATEPOLICIES_it");

   function i2d_CERTIFICATEPOLICIES (a : access CERTIFICATEPOLICIES; c_out : System.Address) return int;  -- openssl/x509v3.h:562
   pragma Import (C, i2d_CERTIFICATEPOLICIES, "i2d_CERTIFICATEPOLICIES");

   function d2i_CERTIFICATEPOLICIES
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access CERTIFICATEPOLICIES;  -- openssl/x509v3.h:562
   pragma Import (C, d2i_CERTIFICATEPOLICIES, "d2i_CERTIFICATEPOLICIES");

   procedure CERTIFICATEPOLICIES_free (a : access CERTIFICATEPOLICIES);  -- openssl/x509v3.h:562
   pragma Import (C, CERTIFICATEPOLICIES_free, "CERTIFICATEPOLICIES_free");

   function CERTIFICATEPOLICIES_new return access CERTIFICATEPOLICIES;  -- openssl/x509v3.h:562
   pragma Import (C, CERTIFICATEPOLICIES_new, "CERTIFICATEPOLICIES_new");

   POLICYINFO_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:563
   pragma Import (C, POLICYINFO_it, "POLICYINFO_it");

   function i2d_POLICYINFO (a : access POLICYINFO; c_out : System.Address) return int;  -- openssl/x509v3.h:563
   pragma Import (C, i2d_POLICYINFO, "i2d_POLICYINFO");

   function d2i_POLICYINFO
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access POLICYINFO;  -- openssl/x509v3.h:563
   pragma Import (C, d2i_POLICYINFO, "d2i_POLICYINFO");

   procedure POLICYINFO_free (a : access POLICYINFO);  -- openssl/x509v3.h:563
   pragma Import (C, POLICYINFO_free, "POLICYINFO_free");

   function POLICYINFO_new return access POLICYINFO;  -- openssl/x509v3.h:563
   pragma Import (C, POLICYINFO_new, "POLICYINFO_new");

   POLICYQUALINFO_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:564
   pragma Import (C, POLICYQUALINFO_it, "POLICYQUALINFO_it");

   function i2d_POLICYQUALINFO (a : access POLICYQUALINFO; c_out : System.Address) return int;  -- openssl/x509v3.h:564
   pragma Import (C, i2d_POLICYQUALINFO, "i2d_POLICYQUALINFO");

   function d2i_POLICYQUALINFO
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access POLICYQUALINFO;  -- openssl/x509v3.h:564
   pragma Import (C, d2i_POLICYQUALINFO, "d2i_POLICYQUALINFO");

   procedure POLICYQUALINFO_free (a : access POLICYQUALINFO);  -- openssl/x509v3.h:564
   pragma Import (C, POLICYQUALINFO_free, "POLICYQUALINFO_free");

   function POLICYQUALINFO_new return access POLICYQUALINFO;  -- openssl/x509v3.h:564
   pragma Import (C, POLICYQUALINFO_new, "POLICYQUALINFO_new");

   USERNOTICE_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:565
   pragma Import (C, USERNOTICE_it, "USERNOTICE_it");

   function i2d_USERNOTICE (a : access USERNOTICE; c_out : System.Address) return int;  -- openssl/x509v3.h:565
   pragma Import (C, i2d_USERNOTICE, "i2d_USERNOTICE");

   function d2i_USERNOTICE
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access USERNOTICE;  -- openssl/x509v3.h:565
   pragma Import (C, d2i_USERNOTICE, "d2i_USERNOTICE");

   procedure USERNOTICE_free (a : access USERNOTICE);  -- openssl/x509v3.h:565
   pragma Import (C, USERNOTICE_free, "USERNOTICE_free");

   function USERNOTICE_new return access USERNOTICE;  -- openssl/x509v3.h:565
   pragma Import (C, USERNOTICE_new, "USERNOTICE_new");

   NOTICEREF_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:566
   pragma Import (C, NOTICEREF_it, "NOTICEREF_it");

   function i2d_NOTICEREF (a : access NOTICEREF; c_out : System.Address) return int;  -- openssl/x509v3.h:566
   pragma Import (C, i2d_NOTICEREF, "i2d_NOTICEREF");

   function d2i_NOTICEREF
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access NOTICEREF;  -- openssl/x509v3.h:566
   pragma Import (C, d2i_NOTICEREF, "d2i_NOTICEREF");

   procedure NOTICEREF_free (a : access NOTICEREF);  -- openssl/x509v3.h:566
   pragma Import (C, NOTICEREF_free, "NOTICEREF_free");

   function NOTICEREF_new return access NOTICEREF;  -- openssl/x509v3.h:566
   pragma Import (C, NOTICEREF_new, "NOTICEREF_new");

   CRL_DIST_POINTS_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:568
   pragma Import (C, CRL_DIST_POINTS_it, "CRL_DIST_POINTS_it");

   function i2d_CRL_DIST_POINTS (a : access CRL_DIST_POINTS; c_out : System.Address) return int;  -- openssl/x509v3.h:568
   pragma Import (C, i2d_CRL_DIST_POINTS, "i2d_CRL_DIST_POINTS");

   function d2i_CRL_DIST_POINTS
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access CRL_DIST_POINTS;  -- openssl/x509v3.h:568
   pragma Import (C, d2i_CRL_DIST_POINTS, "d2i_CRL_DIST_POINTS");

   procedure CRL_DIST_POINTS_free (a : access CRL_DIST_POINTS);  -- openssl/x509v3.h:568
   pragma Import (C, CRL_DIST_POINTS_free, "CRL_DIST_POINTS_free");

   function CRL_DIST_POINTS_new return access CRL_DIST_POINTS;  -- openssl/x509v3.h:568
   pragma Import (C, CRL_DIST_POINTS_new, "CRL_DIST_POINTS_new");

   DIST_POINT_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:569
   pragma Import (C, DIST_POINT_it, "DIST_POINT_it");

   function i2d_DIST_POINT (a : access OpenSSL.Low_Level.x509v3_h.DIST_POINT_st; c_out : System.Address) return int;  -- openssl/x509v3.h:569
   pragma Import (C, i2d_DIST_POINT, "i2d_DIST_POINT");

   function d2i_DIST_POINT
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.x509v3_h.DIST_POINT_st;  -- openssl/x509v3.h:569
   pragma Import (C, d2i_DIST_POINT, "d2i_DIST_POINT");

   procedure DIST_POINT_free (a : access OpenSSL.Low_Level.x509v3_h.DIST_POINT_st);  -- openssl/x509v3.h:569
   pragma Import (C, DIST_POINT_free, "DIST_POINT_free");

   function DIST_POINT_new return access OpenSSL.Low_Level.x509v3_h.DIST_POINT_st;  -- openssl/x509v3.h:569
   pragma Import (C, DIST_POINT_new, "DIST_POINT_new");

   DIST_POINT_NAME_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:570
   pragma Import (C, DIST_POINT_NAME_it, "DIST_POINT_NAME_it");

   function i2d_DIST_POINT_NAME (a : access DIST_POINT_NAME; c_out : System.Address) return int;  -- openssl/x509v3.h:570
   pragma Import (C, i2d_DIST_POINT_NAME, "i2d_DIST_POINT_NAME");

   function d2i_DIST_POINT_NAME
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access DIST_POINT_NAME;  -- openssl/x509v3.h:570
   pragma Import (C, d2i_DIST_POINT_NAME, "d2i_DIST_POINT_NAME");

   procedure DIST_POINT_NAME_free (a : access DIST_POINT_NAME);  -- openssl/x509v3.h:570
   pragma Import (C, DIST_POINT_NAME_free, "DIST_POINT_NAME_free");

   function DIST_POINT_NAME_new return access DIST_POINT_NAME;  -- openssl/x509v3.h:570
   pragma Import (C, DIST_POINT_NAME_new, "DIST_POINT_NAME_new");

   ISSUING_DIST_POINT_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:571
   pragma Import (C, ISSUING_DIST_POINT_it, "ISSUING_DIST_POINT_it");

   function i2d_ISSUING_DIST_POINT (a : access OpenSSL.Low_Level.x509v3_h.ISSUING_DIST_POINT_st; c_out : System.Address) return int;  -- openssl/x509v3.h:571
   pragma Import (C, i2d_ISSUING_DIST_POINT, "i2d_ISSUING_DIST_POINT");

   function d2i_ISSUING_DIST_POINT
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.x509v3_h.ISSUING_DIST_POINT_st;  -- openssl/x509v3.h:571
   pragma Import (C, d2i_ISSUING_DIST_POINT, "d2i_ISSUING_DIST_POINT");

   procedure ISSUING_DIST_POINT_free (a : access OpenSSL.Low_Level.x509v3_h.ISSUING_DIST_POINT_st);  -- openssl/x509v3.h:571
   pragma Import (C, ISSUING_DIST_POINT_free, "ISSUING_DIST_POINT_free");

   function ISSUING_DIST_POINT_new return access OpenSSL.Low_Level.x509v3_h.ISSUING_DIST_POINT_st;  -- openssl/x509v3.h:571
   pragma Import (C, ISSUING_DIST_POINT_new, "ISSUING_DIST_POINT_new");

   function DIST_POINT_set_dpname (dpn : access DIST_POINT_NAME; iname : access OpenSSL.Low_Level.x509_h.X509_name_st) return int;  -- openssl/x509v3.h:573
   pragma Import (C, DIST_POINT_set_dpname, "DIST_POINT_set_dpname");

   function NAME_CONSTRAINTS_check (x : access OpenSSL.Low_Level.x509_h.x509_st; nc : access OpenSSL.Low_Level.x509v3_h.NAME_CONSTRAINTS_st) return int;  -- openssl/x509v3.h:575
   pragma Import (C, NAME_CONSTRAINTS_check, "NAME_CONSTRAINTS_check");

   ACCESS_DESCRIPTION_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:577
   pragma Import (C, ACCESS_DESCRIPTION_it, "ACCESS_DESCRIPTION_it");

   function i2d_ACCESS_DESCRIPTION (a : access ACCESS_DESCRIPTION; c_out : System.Address) return int;  -- openssl/x509v3.h:577
   pragma Import (C, i2d_ACCESS_DESCRIPTION, "i2d_ACCESS_DESCRIPTION");

   function d2i_ACCESS_DESCRIPTION
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access ACCESS_DESCRIPTION;  -- openssl/x509v3.h:577
   pragma Import (C, d2i_ACCESS_DESCRIPTION, "d2i_ACCESS_DESCRIPTION");

   procedure ACCESS_DESCRIPTION_free (a : access ACCESS_DESCRIPTION);  -- openssl/x509v3.h:577
   pragma Import (C, ACCESS_DESCRIPTION_free, "ACCESS_DESCRIPTION_free");

   function ACCESS_DESCRIPTION_new return access ACCESS_DESCRIPTION;  -- openssl/x509v3.h:577
   pragma Import (C, ACCESS_DESCRIPTION_new, "ACCESS_DESCRIPTION_new");

   AUTHORITY_INFO_ACCESS_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:578
   pragma Import (C, AUTHORITY_INFO_ACCESS_it, "AUTHORITY_INFO_ACCESS_it");

   function i2d_AUTHORITY_INFO_ACCESS (a : access AUTHORITY_INFO_ACCESS; c_out : System.Address) return int;  -- openssl/x509v3.h:578
   pragma Import (C, i2d_AUTHORITY_INFO_ACCESS, "i2d_AUTHORITY_INFO_ACCESS");

   function d2i_AUTHORITY_INFO_ACCESS
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access AUTHORITY_INFO_ACCESS;  -- openssl/x509v3.h:578
   pragma Import (C, d2i_AUTHORITY_INFO_ACCESS, "d2i_AUTHORITY_INFO_ACCESS");

   procedure AUTHORITY_INFO_ACCESS_free (a : access AUTHORITY_INFO_ACCESS);  -- openssl/x509v3.h:578
   pragma Import (C, AUTHORITY_INFO_ACCESS_free, "AUTHORITY_INFO_ACCESS_free");

   function AUTHORITY_INFO_ACCESS_new return access AUTHORITY_INFO_ACCESS;  -- openssl/x509v3.h:578
   pragma Import (C, AUTHORITY_INFO_ACCESS_new, "AUTHORITY_INFO_ACCESS_new");

   POLICY_MAPPING_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:580
   pragma Import (C, POLICY_MAPPING_it, "POLICY_MAPPING_it");

   procedure POLICY_MAPPING_free (a : access POLICY_MAPPING);  -- openssl/x509v3.h:581
   pragma Import (C, POLICY_MAPPING_free, "POLICY_MAPPING_free");

   function POLICY_MAPPING_new return access POLICY_MAPPING;  -- openssl/x509v3.h:581
   pragma Import (C, POLICY_MAPPING_new, "POLICY_MAPPING_new");

   POLICY_MAPPINGS_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:582
   pragma Import (C, POLICY_MAPPINGS_it, "POLICY_MAPPINGS_it");

   GENERAL_SUBTREE_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:584
   pragma Import (C, GENERAL_SUBTREE_it, "GENERAL_SUBTREE_it");

   procedure GENERAL_SUBTREE_free (a : access GENERAL_SUBTREE);  -- openssl/x509v3.h:585
   pragma Import (C, GENERAL_SUBTREE_free, "GENERAL_SUBTREE_free");

   function GENERAL_SUBTREE_new return access GENERAL_SUBTREE;  -- openssl/x509v3.h:585
   pragma Import (C, GENERAL_SUBTREE_new, "GENERAL_SUBTREE_new");

   NAME_CONSTRAINTS_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:587
   pragma Import (C, NAME_CONSTRAINTS_it, "NAME_CONSTRAINTS_it");

   procedure NAME_CONSTRAINTS_free (a : access OpenSSL.Low_Level.x509v3_h.NAME_CONSTRAINTS_st);  -- openssl/x509v3.h:588
   pragma Import (C, NAME_CONSTRAINTS_free, "NAME_CONSTRAINTS_free");

   function NAME_CONSTRAINTS_new return access OpenSSL.Low_Level.x509v3_h.NAME_CONSTRAINTS_st;  -- openssl/x509v3.h:588
   pragma Import (C, NAME_CONSTRAINTS_new, "NAME_CONSTRAINTS_new");

   procedure POLICY_CONSTRAINTS_free (a : access POLICY_CONSTRAINTS);  -- openssl/x509v3.h:590
   pragma Import (C, POLICY_CONSTRAINTS_free, "POLICY_CONSTRAINTS_free");

   function POLICY_CONSTRAINTS_new return access POLICY_CONSTRAINTS;  -- openssl/x509v3.h:590
   pragma Import (C, POLICY_CONSTRAINTS_new, "POLICY_CONSTRAINTS_new");

   POLICY_CONSTRAINTS_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:591
   pragma Import (C, POLICY_CONSTRAINTS_it, "POLICY_CONSTRAINTS_it");

   function a2i_GENERAL_NAME
     (c_out    : access GENERAL_NAME;
      method   : System.Address;
      ctx      : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      gen_type : int;
      value    : Interfaces.C.Strings.chars_ptr;
      is_nc    : int) return access GENERAL_NAME;  -- openssl/x509v3.h:593
   pragma Import (C, a2i_GENERAL_NAME, "a2i_GENERAL_NAME");

   function v2i_GENERAL_NAME
     (method : System.Address;
      ctx    : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      cnf    : access OpenSSL.Low_Level.conf_h.CONF_VALUE) return access GENERAL_NAME;  -- openssl/x509v3.h:598
   pragma Import (C, v2i_GENERAL_NAME, "v2i_GENERAL_NAME");

   function v2i_GENERAL_NAME_ex
     (c_out  : access GENERAL_NAME;
      method : System.Address;
      ctx    : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      cnf    : access OpenSSL.Low_Level.conf_h.CONF_VALUE;
      is_nc  : int) return access GENERAL_NAME;  -- openssl/x509v3.h:600
   pragma Import (C, v2i_GENERAL_NAME_ex, "v2i_GENERAL_NAME_ex");

   procedure X509V3_conf_free (val : access OpenSSL.Low_Level.conf_h.CONF_VALUE);  -- openssl/x509v3.h:603
   pragma Import (C, X509V3_conf_free, "X509V3_conf_free");

   function X509V3_EXT_nconf_nid
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      ctx      : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      ext_nid  : int;
      value    : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.x509_h.X509_extension_st;  -- openssl/x509v3.h:605
   pragma Import (C, X509V3_EXT_nconf_nid, "X509V3_EXT_nconf_nid");

   function X509V3_EXT_nconf
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      ctx      : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      name     : Interfaces.C.Strings.chars_ptr;
      value    : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.x509_h.X509_extension_st;  -- openssl/x509v3.h:606
   pragma Import (C, X509V3_EXT_nconf, "X509V3_EXT_nconf");

   function X509V3_EXT_add_nconf_sk
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      ctx      : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      section  : Interfaces.C.Strings.chars_ptr;
      sk       : System.Address) return int;  -- openssl/x509v3.h:607
   pragma Import (C, X509V3_EXT_add_nconf_sk, "X509V3_EXT_add_nconf_sk");

   function X509V3_EXT_add_nconf
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      ctx      : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      section  : Interfaces.C.Strings.chars_ptr;
      cert     : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509v3.h:608
   pragma Import (C, X509V3_EXT_add_nconf, "X509V3_EXT_add_nconf");

   function X509V3_EXT_REQ_add_nconf
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      ctx      : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      section  : Interfaces.C.Strings.chars_ptr;
      req      : access OpenSSL.Low_Level.x509_h.X509_req_st) return int;  -- openssl/x509v3.h:609
   pragma Import (C, X509V3_EXT_REQ_add_nconf, "X509V3_EXT_REQ_add_nconf");

   function X509V3_EXT_CRL_add_nconf
     (the_conf : access OpenSSL.Low_Level.conf_h.conf_st;
      ctx      : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      section  : Interfaces.C.Strings.chars_ptr;
      crl      : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509v3.h:610
   pragma Import (C, X509V3_EXT_CRL_add_nconf, "X509V3_EXT_CRL_add_nconf");

   function X509V3_EXT_conf_nid
     (conf    : access OpenSSL.Low_Level.conf_h.lhash_st_CONF_VALUE;
      ctx     : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      ext_nid : int;
      value   : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.x509_h.X509_extension_st;  -- openssl/x509v3.h:612
   pragma Import (C, X509V3_EXT_conf_nid, "X509V3_EXT_conf_nid");

   function X509V3_EXT_conf
     (conf  : access OpenSSL.Low_Level.conf_h.lhash_st_CONF_VALUE;
      ctx   : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      name  : Interfaces.C.Strings.chars_ptr;
      value : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.x509_h.X509_extension_st;  -- openssl/x509v3.h:614
   pragma Import (C, X509V3_EXT_conf, "X509V3_EXT_conf");

   function X509V3_EXT_add_conf
     (conf    : access OpenSSL.Low_Level.conf_h.lhash_st_CONF_VALUE;
      ctx     : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      section : Interfaces.C.Strings.chars_ptr;
      cert    : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509v3.h:616
   pragma Import (C, X509V3_EXT_add_conf, "X509V3_EXT_add_conf");

   function X509V3_EXT_REQ_add_conf
     (conf    : access OpenSSL.Low_Level.conf_h.lhash_st_CONF_VALUE;
      ctx     : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      section : Interfaces.C.Strings.chars_ptr;
      req     : access OpenSSL.Low_Level.x509_h.X509_req_st) return int;  -- openssl/x509v3.h:618
   pragma Import (C, X509V3_EXT_REQ_add_conf, "X509V3_EXT_REQ_add_conf");

   function X509V3_EXT_CRL_add_conf
     (conf    : access OpenSSL.Low_Level.conf_h.lhash_st_CONF_VALUE;
      ctx     : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      section : Interfaces.C.Strings.chars_ptr;
      crl     : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/x509v3.h:620
   pragma Import (C, X509V3_EXT_CRL_add_conf, "X509V3_EXT_CRL_add_conf");

   function X509V3_add_value_bool_nf
     (name      : Interfaces.C.Strings.chars_ptr;
      asn1_bool : int;
      extlist   : System.Address) return int;  -- openssl/x509v3.h:623
   pragma Import (C, X509V3_add_value_bool_nf, "X509V3_add_value_bool_nf");

   function X509V3_get_value_bool (value : access OpenSSL.Low_Level.conf_h.CONF_VALUE; asn1_bool : access int) return int;  -- openssl/x509v3.h:625
   pragma Import (C, X509V3_get_value_bool, "X509V3_get_value_bool");

   function X509V3_get_value_int (value : access OpenSSL.Low_Level.conf_h.CONF_VALUE; aint : System.Address) return int;  -- openssl/x509v3.h:626
   pragma Import (C, X509V3_get_value_int, "X509V3_get_value_int");

   procedure X509V3_set_nconf (ctx : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx; the_conf : access OpenSSL.Low_Level.conf_h.conf_st);  -- openssl/x509v3.h:627
   pragma Import (C, X509V3_set_nconf, "X509V3_set_nconf");

   procedure X509V3_set_conf_lhash (ctx : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx; lhash : access OpenSSL.Low_Level.conf_h.lhash_st_CONF_VALUE);  -- openssl/x509v3.h:628
   pragma Import (C, X509V3_set_conf_lhash, "X509V3_set_conf_lhash");

   function X509V3_get_string
     (ctx     : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      name    : Interfaces.C.Strings.chars_ptr;
      section : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:631
   pragma Import (C, X509V3_get_string, "X509V3_get_string");

   function X509V3_get_section (ctx : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx; section : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE;  -- openssl/x509v3.h:632
   pragma Import (C, X509V3_get_section, "X509V3_get_section");

   procedure X509V3_string_free (ctx : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx; str : Interfaces.C.Strings.chars_ptr);  -- openssl/x509v3.h:633
   pragma Import (C, X509V3_string_free, "X509V3_string_free");

   procedure X509V3_section_free (ctx : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx; section : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE);  -- openssl/x509v3.h:634
   pragma Import (C, X509V3_section_free, "X509V3_section_free");

   procedure X509V3_set_ctx
     (ctx     : access OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;
      issuer  : access OpenSSL.Low_Level.x509_h.x509_st;
      subject : access OpenSSL.Low_Level.x509_h.x509_st;
      req     : access OpenSSL.Low_Level.x509_h.X509_req_st;
      crl     : access OpenSSL.Low_Level.x509_h.X509_crl_st;
      flags   : int);  -- openssl/x509v3.h:635
   pragma Import (C, X509V3_set_ctx, "X509V3_set_ctx");

   function X509V3_add_value
     (name    : Interfaces.C.Strings.chars_ptr;
      value   : Interfaces.C.Strings.chars_ptr;
      extlist : System.Address) return int;  -- openssl/x509v3.h:638
   pragma Import (C, X509V3_add_value, "X509V3_add_value");

   function X509V3_add_value_uchar
     (name    : Interfaces.C.Strings.chars_ptr;
      value   : access unsigned_char;
      extlist : System.Address) return int;  -- openssl/x509v3.h:640
   pragma Import (C, X509V3_add_value_uchar, "X509V3_add_value_uchar");

   function X509V3_add_value_bool
     (name      : Interfaces.C.Strings.chars_ptr;
      asn1_bool : int;
      extlist   : System.Address) return int;  -- openssl/x509v3.h:642
   pragma Import (C, X509V3_add_value_bool, "X509V3_add_value_bool");

   function X509V3_add_value_int
     (name    : Interfaces.C.Strings.chars_ptr;
      aint    : access OpenSSL.Low_Level.asnl_h.asn1_string_st;
      extlist : System.Address) return int;  -- openssl/x509v3.h:644
   pragma Import (C, X509V3_add_value_int, "X509V3_add_value_int");

   function i2s_ASN1_INTEGER (meth : access X509V3_EXT_METHOD; aint : access OpenSSL.Low_Level.asnl_h.asn1_string_st) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:646
   pragma Import (C, i2s_ASN1_INTEGER, "i2s_ASN1_INTEGER");

   function s2i_ASN1_INTEGER (meth : access X509V3_EXT_METHOD; value : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:647
   pragma Import (C, s2i_ASN1_INTEGER, "s2i_ASN1_INTEGER");

   function i2s_ASN1_ENUMERATED (meth : access X509V3_EXT_METHOD; aint : access OpenSSL.Low_Level.asnl_h.asn1_string_st) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:648
   pragma Import (C, i2s_ASN1_ENUMERATED, "i2s_ASN1_ENUMERATED");

   function i2s_ASN1_ENUMERATED_TABLE (meth : access X509V3_EXT_METHOD; aint : access OpenSSL.Low_Level.asnl_h.asn1_string_st) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:649
   pragma Import (C, i2s_ASN1_ENUMERATED_TABLE, "i2s_ASN1_ENUMERATED_TABLE");

   function X509V3_EXT_add (ext : access X509V3_EXT_METHOD) return int;  -- openssl/x509v3.h:650
   pragma Import (C, X509V3_EXT_add, "X509V3_EXT_add");

   function X509V3_EXT_add_list (extlist : access X509V3_EXT_METHOD) return int;  -- openssl/x509v3.h:651
   pragma Import (C, X509V3_EXT_add_list, "X509V3_EXT_add_list");

   function X509V3_EXT_add_alias (nid_to : int; nid_from : int) return int;  -- openssl/x509v3.h:652
   pragma Import (C, X509V3_EXT_add_alias, "X509V3_EXT_add_alias");

   procedure X509V3_EXT_cleanup;  -- openssl/x509v3.h:653
   pragma Import (C, X509V3_EXT_cleanup, "X509V3_EXT_cleanup");

   function X509V3_EXT_get (ext : access OpenSSL.Low_Level.x509_h.X509_extension_st) return System.Address;  -- openssl/x509v3.h:655
   pragma Import (C, X509V3_EXT_get, "X509V3_EXT_get");

   function X509V3_EXT_get_nid (nid : int) return System.Address;  -- openssl/x509v3.h:656
   pragma Import (C, X509V3_EXT_get_nid, "X509V3_EXT_get_nid");

   function X509V3_add_standard_extensions return int;  -- openssl/x509v3.h:657
   pragma Import (C, X509V3_add_standard_extensions, "X509V3_add_standard_extensions");

   function X509V3_parse_list (line : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE;  -- openssl/x509v3.h:658
   pragma Import (C, X509V3_parse_list, "X509V3_parse_list");

   function X509V3_EXT_d2i_2 (ext : access OpenSSL.Low_Level.x509_h.X509_extension_st) return System.Address;  -- openssl/x509v3.h:659
   pragma Import (C, X509V3_EXT_d2i_2, "X509V3_EXT_d2i");

   function X509V3_get_d2i
     (x    : access OpenSSL.Low_Level.x509_h.stack_st_X509_EXTENSION;
      nid  : int;
      crit : access int;
      idx  : access int) return System.Address;  -- openssl/x509v3.h:660
   pragma Import (C, X509V3_get_d2i, "X509V3_get_d2i");

   function X509V3_EXT_i2d_2
     (ext_nid   : int;
      crit      : int;
      ext_struc : System.Address) return access OpenSSL.Low_Level.x509_h.X509_extension_st;  -- openssl/x509v3.h:663
   pragma Import (C, X509V3_EXT_i2d_2, "X509V3_EXT_i2d");

   function X509V3_add1_i2d
     (x     : System.Address;
      nid   : int;
      value : System.Address;
      crit  : int;
      flags : unsigned_long) return int;  -- openssl/x509v3.h:664
   pragma Import (C, X509V3_add1_i2d, "X509V3_add1_i2d");

   function hex_to_string (buffer : access unsigned_char; len : long) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:666
   pragma Import (C, hex_to_string, "hex_to_string");

   function string_to_hex (str : Interfaces.C.Strings.chars_ptr; len : access long) return access unsigned_char;  -- openssl/x509v3.h:667
   pragma Import (C, string_to_hex, "string_to_hex");

   function name_cmp (name : Interfaces.C.Strings.chars_ptr; cmp : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/x509v3.h:668
   pragma Import (C, name_cmp, "name_cmp");

   procedure X509V3_EXT_val_prn
     (c_out  : access OpenSSL.Low_Level.bio_h.bio_st;
      val    : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE;
      indent : int;
      ml     : int);  -- openssl/x509v3.h:670
   pragma Import (C, X509V3_EXT_val_prn, "X509V3_EXT_val_prn");

   function X509V3_EXT_print
     (c_out  : access OpenSSL.Low_Level.bio_h.bio_st;
      ext    : access OpenSSL.Low_Level.x509_h.X509_extension_st;
      flag   : unsigned_long;
      indent : int) return int;  -- openssl/x509v3.h:672
   pragma Import (C, X509V3_EXT_print, "X509V3_EXT_print");

   function X509V3_EXT_print_fp
     (c_out  : access Interfaces.C_Streams.FILEs;
      ext    : access OpenSSL.Low_Level.x509_h.X509_extension_st;
      flag   : int;
      indent : int) return int;  -- openssl/x509v3.h:673
   pragma Import (C, X509V3_EXT_print_fp, "X509V3_EXT_print_fp");

   function X509V3_extensions_print
     (c_out  : access OpenSSL.Low_Level.bio_h.bio_st;
      title  : Interfaces.C.Strings.chars_ptr;
      exts   : access OpenSSL.Low_Level.x509_h.stack_st_X509_EXTENSION;
      flag   : unsigned_long;
      indent : int) return int;  -- openssl/x509v3.h:675
   pragma Import (C, X509V3_extensions_print, "X509V3_extensions_print");

   function X509_check_ca (x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509v3.h:677
   pragma Import (C, X509_check_ca, "X509_check_ca");

   function X509_check_purpose
     (x  : access OpenSSL.Low_Level.x509_h.x509_st;
      id : int;
      ca : int) return int;  -- openssl/x509v3.h:678
   pragma Import (C, X509_check_purpose, "X509_check_purpose");

   function X509_supported_extension (ex : access OpenSSL.Low_Level.x509_h.X509_extension_st) return int;  -- openssl/x509v3.h:679
   pragma Import (C, X509_supported_extension, "X509_supported_extension");

   function X509_PURPOSE_set (p : access int; purpose : int) return int;  -- openssl/x509v3.h:680
   pragma Import (C, X509_PURPOSE_set, "X509_PURPOSE_set");

   function X509_check_issued (issuer : access OpenSSL.Low_Level.x509_h.x509_st; subject : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/x509v3.h:681
   pragma Import (C, X509_check_issued, "X509_check_issued");

   function X509_check_akid (issuer : access OpenSSL.Low_Level.x509_h.x509_st; akid : access OpenSSL.Low_Level.x509v3_h.AUTHORITY_KEYID_st) return int;  -- openssl/x509v3.h:682
   pragma Import (C, X509_check_akid, "X509_check_akid");

   function X509_PURPOSE_get_count return int;  -- openssl/x509v3.h:683
   pragma Import (C, X509_PURPOSE_get_count, "X509_PURPOSE_get_count");

   function X509_PURPOSE_get0 (idx : int) return access X509_PURPOSE;  -- openssl/x509v3.h:684
   pragma Import (C, X509_PURPOSE_get0, "X509_PURPOSE_get0");

   function X509_PURPOSE_get_by_sname (sname : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/x509v3.h:685
   pragma Import (C, X509_PURPOSE_get_by_sname, "X509_PURPOSE_get_by_sname");

   function X509_PURPOSE_get_by_id (id : int) return int;  -- openssl/x509v3.h:686
   pragma Import (C, X509_PURPOSE_get_by_id, "X509_PURPOSE_get_by_id");

   function X509_PURPOSE_add
     (id    : int;
      trust : int;
      flags : int;
      ck    : access function
        (arg1 : System.Address;
         arg2 : access constant OpenSSL.Low_Level.x509_h.x509_st;
         arg3 : int) return int;
      name  : Interfaces.C.Strings.chars_ptr;
      sname : Interfaces.C.Strings.chars_ptr;
      arg   : System.Address) return int;  -- openssl/x509v3.h:687
   pragma Import (C, X509_PURPOSE_add, "X509_PURPOSE_add");

   function X509_PURPOSE_get0_name (xp : access X509_PURPOSE) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:690
   pragma Import (C, X509_PURPOSE_get0_name, "X509_PURPOSE_get0_name");

   function X509_PURPOSE_get0_sname (xp : access X509_PURPOSE) return Interfaces.C.Strings.chars_ptr;  -- openssl/x509v3.h:691
   pragma Import (C, X509_PURPOSE_get0_sname, "X509_PURPOSE_get0_sname");

   function X509_PURPOSE_get_trust (xp : access X509_PURPOSE) return int;  -- openssl/x509v3.h:692
   pragma Import (C, X509_PURPOSE_get_trust, "X509_PURPOSE_get_trust");

   procedure X509_PURPOSE_cleanup;  -- openssl/x509v3.h:693
   pragma Import (C, X509_PURPOSE_cleanup, "X509_PURPOSE_cleanup");

   function X509_PURPOSE_get_id (arg1 : access X509_PURPOSE) return int;  -- openssl/x509v3.h:694
   pragma Import (C, X509_PURPOSE_get_id, "X509_PURPOSE_get_id");

   function X509_get1_email (x : access OpenSSL.Low_Level.x509_h.x509_st) return access OpenSSL.Low_Level.safestack_h.stack_st_OPENSSL_STRING;  -- openssl/x509v3.h:696
   pragma Import (C, X509_get1_email, "X509_get1_email");

   function X509_REQ_get1_email (x : access OpenSSL.Low_Level.x509_h.X509_req_st) return access OpenSSL.Low_Level.safestack_h.stack_st_OPENSSL_STRING;  -- openssl/x509v3.h:697
   pragma Import (C, X509_REQ_get1_email, "X509_REQ_get1_email");

   procedure X509_email_free (sk : access OpenSSL.Low_Level.safestack_h.stack_st_OPENSSL_STRING);  -- openssl/x509v3.h:698
   pragma Import (C, X509_email_free, "X509_email_free");

   function X509_get1_ocsp (x : access OpenSSL.Low_Level.x509_h.x509_st) return access OpenSSL.Low_Level.safestack_h.stack_st_OPENSSL_STRING;  -- openssl/x509v3.h:699
   pragma Import (C, X509_get1_ocsp, "X509_get1_ocsp");

   function a2i_IPADDRESS (ipasc : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:701
   pragma Import (C, a2i_IPADDRESS, "a2i_IPADDRESS");

   function a2i_IPADDRESS_NC (ipasc : Interfaces.C.Strings.chars_ptr) return access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:702
   pragma Import (C, a2i_IPADDRESS_NC, "a2i_IPADDRESS_NC");

   function a2i_ipadd (ipout : access unsigned_char; ipasc : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/x509v3.h:703
   pragma Import (C, a2i_ipadd, "a2i_ipadd");

   function X509V3_NAME_from_section
     (nm     : access OpenSSL.Low_Level.x509_h.X509_name_st;
      dn_sk  : access OpenSSL.Low_Level.conf_h.stack_st_CONF_VALUE;
      chtype : unsigned_long) return int;  -- openssl/x509v3.h:704
   pragma Import (C, X509V3_NAME_from_section, "X509V3_NAME_from_section");

   procedure X509_POLICY_NODE_print
     (c_out  : access OpenSSL.Low_Level.bio_h.bio_st;
      node   : System.Address;
      indent : int);  -- openssl/x509v3.h:707
   pragma Import (C, X509_POLICY_NODE_print, "X509_POLICY_NODE_print");

   type stack_st_X509_POLICY_NODE is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:708
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_POLICY_NODE);  -- openssl/x509v3.h:708

   type ASRange_st is record
      min : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:713
      max : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:713
   end record;
   pragma Convention (C_Pass_By_Copy, ASRange_st);  -- openssl/x509v3.h:712

   subtype ASRange is ASRange_st;

   type anon_47 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            id      : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:722
         when others =>
            c_range : access ASRange;  -- openssl/x509v3.h:723
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_47);
   pragma Unchecked_Union (anon_47);
   type ASIdOrRange_st is record
      c_type : aliased int;  -- openssl/x509v3.h:720
      u      : anon_47;  -- openssl/x509v3.h:724
   end record;
   pragma Convention (C_Pass_By_Copy, ASIdOrRange_st);  -- openssl/x509v3.h:719

   subtype ASIdOrRange is ASIdOrRange_st;

   type stack_st_ASIdOrRange;
   subtype ASIdOrRanges is stack_st_ASIdOrRange;

   type stack_st_ASIdOrRange is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:728
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_ASIdOrRange);  -- openssl/x509v3.h:728

   type anon_48 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            inherit       : access Interfaces.C.int;  -- openssl/x509v3.h:736
         when others =>
            asIdsOrRanges : access ASIdOrRanges;  -- openssl/x509v3.h:737
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_48);
   pragma Unchecked_Union (anon_48);
   type ASIdentifierChoice_st is record
      c_type : aliased int;  -- openssl/x509v3.h:734
      u      : anon_48;  -- openssl/x509v3.h:738
   end record;
   pragma Convention (C_Pass_By_Copy, ASIdentifierChoice_st);  -- openssl/x509v3.h:733

   subtype ASIdentifierChoice is ASIdentifierChoice_st;

   type ASIdentifiers_st is record
      asnum : access ASIdentifierChoice;  -- openssl/x509v3.h:742
      rdi   : access ASIdentifierChoice;  -- openssl/x509v3.h:742
   end record;
   pragma Convention (C_Pass_By_Copy, ASIdentifiers_st);  -- openssl/x509v3.h:741

   subtype ASIdentifiers is ASIdentifiers_st;

   ASRange_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:745
   pragma Import (C, ASRange_it, "ASRange_it");

   function i2d_ASRange (a : access ASRange; c_out : System.Address) return int;  -- openssl/x509v3.h:745
   pragma Import (C, i2d_ASRange, "i2d_ASRange");

   function d2i_ASRange
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access ASRange;  -- openssl/x509v3.h:745
   pragma Import (C, d2i_ASRange, "d2i_ASRange");

   procedure ASRange_free (a : access ASRange);  -- openssl/x509v3.h:745
   pragma Import (C, ASRange_free, "ASRange_free");

   function ASRange_new return access ASRange;  -- openssl/x509v3.h:745
   pragma Import (C, ASRange_new, "ASRange_new");

   ASIdOrRange_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:746
   pragma Import (C, ASIdOrRange_it, "ASIdOrRange_it");

   function i2d_ASIdOrRange (a : access ASIdOrRange; c_out : System.Address) return int;  -- openssl/x509v3.h:746
   pragma Import (C, i2d_ASIdOrRange, "i2d_ASIdOrRange");

   function d2i_ASIdOrRange
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access ASIdOrRange;  -- openssl/x509v3.h:746
   pragma Import (C, d2i_ASIdOrRange, "d2i_ASIdOrRange");

   procedure ASIdOrRange_free (a : access ASIdOrRange);  -- openssl/x509v3.h:746
   pragma Import (C, ASIdOrRange_free, "ASIdOrRange_free");

   function ASIdOrRange_new return access ASIdOrRange;  -- openssl/x509v3.h:746
   pragma Import (C, ASIdOrRange_new, "ASIdOrRange_new");

   ASIdentifierChoice_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:747
   pragma Import (C, ASIdentifierChoice_it, "ASIdentifierChoice_it");

   function i2d_ASIdentifierChoice (a : access ASIdentifierChoice; c_out : System.Address) return int;  -- openssl/x509v3.h:747
   pragma Import (C, i2d_ASIdentifierChoice, "i2d_ASIdentifierChoice");

   function d2i_ASIdentifierChoice
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access ASIdentifierChoice;  -- openssl/x509v3.h:747
   pragma Import (C, d2i_ASIdentifierChoice, "d2i_ASIdentifierChoice");

   procedure ASIdentifierChoice_free (a : access ASIdentifierChoice);  -- openssl/x509v3.h:747
   pragma Import (C, ASIdentifierChoice_free, "ASIdentifierChoice_free");

   function ASIdentifierChoice_new return access ASIdentifierChoice;  -- openssl/x509v3.h:747
   pragma Import (C, ASIdentifierChoice_new, "ASIdentifierChoice_new");

   ASIdentifiers_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:748
   pragma Import (C, ASIdentifiers_it, "ASIdentifiers_it");

   function i2d_ASIdentifiers (a : access ASIdentifiers; c_out : System.Address) return int;  -- openssl/x509v3.h:748
   pragma Import (C, i2d_ASIdentifiers, "i2d_ASIdentifiers");

   function d2i_ASIdentifiers
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access ASIdentifiers;  -- openssl/x509v3.h:748
   pragma Import (C, d2i_ASIdentifiers, "d2i_ASIdentifiers");

   procedure ASIdentifiers_free (a : access ASIdentifiers);  -- openssl/x509v3.h:748
   pragma Import (C, ASIdentifiers_free, "ASIdentifiers_free");

   function ASIdentifiers_new return access ASIdentifiers;  -- openssl/x509v3.h:748
   pragma Import (C, ASIdentifiers_new, "ASIdentifiers_new");

   type IPAddressRange_st is record
      min : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:752
      max : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:752
   end record;
   pragma Convention (C_Pass_By_Copy, IPAddressRange_st);  -- openssl/x509v3.h:751

   subtype IPAddressRange is IPAddressRange_st;

   type anon_49 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            addressPrefix : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:761
         when others =>
            addressRange  : access IPAddressRange;  -- openssl/x509v3.h:762
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_49);
   pragma Unchecked_Union (anon_49);
   type IPAddressOrRange_st is record
      c_type : aliased int;  -- openssl/x509v3.h:759
      u      : anon_49;  -- openssl/x509v3.h:763
   end record;
   pragma Convention (C_Pass_By_Copy, IPAddressOrRange_st);  -- openssl/x509v3.h:758

   subtype IPAddressOrRange is IPAddressOrRange_st;

   type stack_st_IPAddressOrRange;
   subtype IPAddressOrRanges is stack_st_IPAddressOrRange;

   type stack_st_IPAddressOrRange is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:767
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_IPAddressOrRange);  -- openssl/x509v3.h:767

   type anon_50 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            inherit           : access Interfaces.C.int;  -- openssl/x509v3.h:775
         when others =>
            addressesOrRanges : access IPAddressOrRanges;  -- openssl/x509v3.h:776
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_50);
   pragma Unchecked_Union (anon_50);
   type IPAddressChoice_st is record
      c_type : aliased int;  -- openssl/x509v3.h:773
      u      : anon_50;  -- openssl/x509v3.h:777
   end record;
   pragma Convention (C_Pass_By_Copy, IPAddressChoice_st);  -- openssl/x509v3.h:772

   subtype IPAddressChoice is IPAddressChoice_st;

   type IPAddressFamily_st is record
      addressFamily       : access OpenSSL.Low_Level.asnl_h.asn1_string_st;  -- openssl/x509v3.h:781
      the_ipAddressChoice : access IPAddressChoice;  -- openssl/x509v3.h:782
   end record;
   pragma Convention (C_Pass_By_Copy, IPAddressFamily_st);  -- openssl/x509v3.h:780

   subtype IPAddressFamily is IPAddressFamily_st;

   type stack_st_IPAddressFamily;
   subtype IPAddrBlocks is stack_st_IPAddressFamily;

   type stack_st_IPAddressFamily is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/x509v3.h:786
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_IPAddressFamily);  -- openssl/x509v3.h:786

   IPAddressRange_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:788
   pragma Import (C, IPAddressRange_it, "IPAddressRange_it");

   function i2d_IPAddressRange (a : access IPAddressRange; c_out : System.Address) return int;  -- openssl/x509v3.h:788
   pragma Import (C, i2d_IPAddressRange, "i2d_IPAddressRange");

   function d2i_IPAddressRange
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access IPAddressRange;  -- openssl/x509v3.h:788
   pragma Import (C, d2i_IPAddressRange, "d2i_IPAddressRange");

   procedure IPAddressRange_free (a : access IPAddressRange);  -- openssl/x509v3.h:788
   pragma Import (C, IPAddressRange_free, "IPAddressRange_free");

   function IPAddressRange_new return access IPAddressRange;  -- openssl/x509v3.h:788
   pragma Import (C, IPAddressRange_new, "IPAddressRange_new");

   IPAddressOrRange_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:789
   pragma Import (C, IPAddressOrRange_it, "IPAddressOrRange_it");

   function i2d_IPAddressOrRange (a : access IPAddressOrRange; c_out : System.Address) return int;  -- openssl/x509v3.h:789
   pragma Import (C, i2d_IPAddressOrRange, "i2d_IPAddressOrRange");

   function d2i_IPAddressOrRange
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access IPAddressOrRange;  -- openssl/x509v3.h:789
   pragma Import (C, d2i_IPAddressOrRange, "d2i_IPAddressOrRange");

   procedure IPAddressOrRange_free (a : access IPAddressOrRange);  -- openssl/x509v3.h:789
   pragma Import (C, IPAddressOrRange_free, "IPAddressOrRange_free");

   function IPAddressOrRange_new return access IPAddressOrRange;  -- openssl/x509v3.h:789
   pragma Import (C, IPAddressOrRange_new, "IPAddressOrRange_new");

   IPAddressChoice_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:790
   pragma Import (C, IPAddressChoice_it, "IPAddressChoice_it");

   function i2d_IPAddressChoice (a : access IPAddressChoice; c_out : System.Address) return int;  -- openssl/x509v3.h:790
   pragma Import (C, i2d_IPAddressChoice, "i2d_IPAddressChoice");

   function d2i_IPAddressChoice
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access IPAddressChoice;  -- openssl/x509v3.h:790
   pragma Import (C, d2i_IPAddressChoice, "d2i_IPAddressChoice");

   procedure IPAddressChoice_free (a : access IPAddressChoice);  -- openssl/x509v3.h:790
   pragma Import (C, IPAddressChoice_free, "IPAddressChoice_free");

   function IPAddressChoice_new return access IPAddressChoice;  -- openssl/x509v3.h:790
   pragma Import (C, IPAddressChoice_new, "IPAddressChoice_new");

   IPAddressFamily_it : aliased OpenSSL.Low_Level.asnlt_h.ASN1_ITEM_st;  -- openssl/x509v3.h:791
   pragma Import (C, IPAddressFamily_it, "IPAddressFamily_it");

   function i2d_IPAddressFamily (a : access IPAddressFamily; c_out : System.Address) return int;  -- openssl/x509v3.h:791
   pragma Import (C, i2d_IPAddressFamily, "i2d_IPAddressFamily");

   function d2i_IPAddressFamily
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access IPAddressFamily;  -- openssl/x509v3.h:791
   pragma Import (C, d2i_IPAddressFamily, "d2i_IPAddressFamily");

   procedure IPAddressFamily_free (a : access IPAddressFamily);  -- openssl/x509v3.h:791
   pragma Import (C, IPAddressFamily_free, "IPAddressFamily_free");

   function IPAddressFamily_new return access IPAddressFamily;  -- openssl/x509v3.h:791
   pragma Import (C, IPAddressFamily_new, "IPAddressFamily_new");

   function v3_asid_add_inherit (asid : access ASIdentifiers; which : int) return int;  -- openssl/x509v3.h:813
   pragma Import (C, v3_asid_add_inherit, "v3_asid_add_inherit");

   function v3_asid_add_id_or_range
     (asid  : access ASIdentifiers;
      which : int;
      min   : access OpenSSL.Low_Level.asnl_h.asn1_string_st;
      max   : access OpenSSL.Low_Level.asnl_h.asn1_string_st) return int;  -- openssl/x509v3.h:814
   pragma Import (C, v3_asid_add_id_or_range, "v3_asid_add_id_or_range");

   function v3_addr_add_inherit
     (addr : access IPAddrBlocks;
      afi  : unsigned;
      safi : access unsigned) return int;  -- openssl/x509v3.h:816
   pragma Import (C, v3_addr_add_inherit, "v3_addr_add_inherit");

   function v3_addr_add_prefix
     (addr      : access IPAddrBlocks;
      afi       : unsigned;
      safi      : access unsigned;
      a         : access unsigned_char;
      prefixlen : int) return int;  -- openssl/x509v3.h:818
   pragma Import (C, v3_addr_add_prefix, "v3_addr_add_prefix");

   function v3_addr_add_range
     (addr : access IPAddrBlocks;
      afi  : unsigned;
      safi : access unsigned;
      min  : access unsigned_char;
      max  : access unsigned_char) return int;  -- openssl/x509v3.h:821
   pragma Import (C, v3_addr_add_range, "v3_addr_add_range");

   function v3_addr_get_afi (f : System.Address) return unsigned;  -- openssl/x509v3.h:824
   pragma Import (C, v3_addr_get_afi, "v3_addr_get_afi");

   function v3_addr_get_range
     (aor    : access IPAddressOrRange;
      afi    : unsigned;
      min    : access unsigned_char;
      max    : access unsigned_char;
      length : int) return int;  -- openssl/x509v3.h:825
   pragma Import (C, v3_addr_get_range, "v3_addr_get_range");

   function v3_asid_is_canonical (asid : access ASIdentifiers) return int;  -- openssl/x509v3.h:832
   pragma Import (C, v3_asid_is_canonical, "v3_asid_is_canonical");

   function v3_addr_is_canonical (addr : access IPAddrBlocks) return int;  -- openssl/x509v3.h:833
   pragma Import (C, v3_addr_is_canonical, "v3_addr_is_canonical");

   function v3_asid_canonize (asid : access ASIdentifiers) return int;  -- openssl/x509v3.h:834
   pragma Import (C, v3_asid_canonize, "v3_asid_canonize");

   function v3_addr_canonize (addr : access IPAddrBlocks) return int;  -- openssl/x509v3.h:835
   pragma Import (C, v3_addr_canonize, "v3_addr_canonize");

   function v3_asid_inherits (asid : access ASIdentifiers) return int;  -- openssl/x509v3.h:840
   pragma Import (C, v3_asid_inherits, "v3_asid_inherits");

   function v3_addr_inherits (addr : access IPAddrBlocks) return int;  -- openssl/x509v3.h:841
   pragma Import (C, v3_addr_inherits, "v3_addr_inherits");

   function v3_asid_subset (a : access ASIdentifiers; b : access ASIdentifiers) return int;  -- openssl/x509v3.h:842
   pragma Import (C, v3_asid_subset, "v3_asid_subset");

   function v3_addr_subset (a : access IPAddrBlocks; b : access IPAddrBlocks) return int;  -- openssl/x509v3.h:843
   pragma Import (C, v3_addr_subset, "v3_addr_subset");

   function v3_asid_validate_path (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st) return int;  -- openssl/x509v3.h:848
   pragma Import (C, v3_asid_validate_path, "v3_asid_validate_path");

   function v3_addr_validate_path (arg1 : access OpenSSL.Low_Level.x509_vfy_h.x509_store_st) return int;  -- openssl/x509v3.h:849
   pragma Import (C, v3_addr_validate_path, "v3_addr_validate_path");

   function v3_asid_validate_resource_set
     (chain             : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      ext               : access ASIdentifiers;
      allow_inheritance : int) return int;  -- openssl/x509v3.h:850
   pragma Import (C, v3_asid_validate_resource_set, "v3_asid_validate_resource_set");

   function v3_addr_validate_resource_set
     (chain             : access OpenSSL.Low_Level.x509_h.stack_st_X509;
      ext               : access IPAddrBlocks;
      allow_inheritance : int) return int;  -- openssl/x509v3.h:853
   pragma Import (C, v3_addr_validate_resource_set, "v3_addr_validate_resource_set");

   procedure ERR_load_X509V3_strings;  -- openssl/x509v3.h:863
   pragma Import (C, ERR_load_X509V3_strings, "ERR_load_X509V3_strings");

end OpenSSL.Low_Level.x509v3_h;
