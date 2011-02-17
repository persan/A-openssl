with Interfaces.C; use Interfaces.C;
with OpenSSL.Low_Level.evp_h;
with Interfaces.C.Strings;
with System;
limited with OpenSSL.Low_Level.bio_h;
limited with OpenSSL.Low_Level.x509_h;
limited with OpenSSL.Low_Level.pkcs7_h;
with Interfaces.C_Streams;
limited with OpenSSL.Low_Level.dsa_h;
package OpenSSL.Low_Level.pem_h is

   package defs is

      PEM_BUFSIZE : constant := 1024;  --  openssl/pem.h:77

      PEM_OBJ_UNDEF : constant := 0;  --  openssl/pem.h:79
      PEM_OBJ_X509 : constant := 1;  --  openssl/pem.h:80
      PEM_OBJ_X509_REQ : constant := 2;  --  openssl/pem.h:81
      PEM_OBJ_CRL : constant := 3;  --  openssl/pem.h:82
      PEM_OBJ_SSL_SESSION : constant := 4;  --  openssl/pem.h:83
      PEM_OBJ_PRIV_KEY : constant := 10;  --  openssl/pem.h:84
      PEM_OBJ_PRIV_RSA : constant := 11;  --  openssl/pem.h:85
      PEM_OBJ_PRIV_DSA : constant := 12;  --  openssl/pem.h:86
      PEM_OBJ_PRIV_DH : constant := 13;  --  openssl/pem.h:87
      PEM_OBJ_PUB_RSA : constant := 14;  --  openssl/pem.h:88
      PEM_OBJ_PUB_DSA : constant := 15;  --  openssl/pem.h:89
      PEM_OBJ_PUB_DH : constant := 16;  --  openssl/pem.h:90
      PEM_OBJ_DHPARAMS : constant := 17;  --  openssl/pem.h:91
      PEM_OBJ_DSAPARAMS : constant := 18;  --  openssl/pem.h:92
      PEM_OBJ_PRIV_RSA_PUBLIC : constant := 19;  --  openssl/pem.h:93
      PEM_OBJ_PRIV_ECDSA : constant := 20;  --  openssl/pem.h:94
      PEM_OBJ_PUB_ECDSA : constant := 21;  --  openssl/pem.h:95
      PEM_OBJ_ECPARAMETERS : constant := 22;  --  openssl/pem.h:96

      PEM_ERROR   : constant := 30;  --  openssl/pem.h:98
      PEM_DEK_DES_CBC : constant := 40;  --  openssl/pem.h:99
      PEM_DEK_IDEA_CBC : constant := 45;  --  openssl/pem.h:100
      PEM_DEK_DES_EDE : constant := 50;  --  openssl/pem.h:101
      PEM_DEK_DES_ECB : constant := 60;  --  openssl/pem.h:102
      PEM_DEK_RSA : constant := 70;  --  openssl/pem.h:103
      PEM_DEK_RSA_MD2 : constant := 80;  --  openssl/pem.h:104
      PEM_DEK_RSA_MD5 : constant := 90;  --  openssl/pem.h:105
      --  unsupported macro: PEM_MD_MD2 NID_md2
      --  unsupported macro: PEM_MD_MD5 NID_md5
      --  unsupported macro: PEM_MD_SHA NID_sha
      --  unsupported macro: PEM_MD_MD2_RSA NID_md2WithRSAEncryption
      --  unsupported macro: PEM_MD_MD5_RSA NID_md5WithRSAEncryption
      --  unsupported macro: PEM_MD_SHA_RSA NID_sha1WithRSAEncryption

      PEM_STRING_X509_OLD : aliased constant String := "X509 CERTIFICATE" & ASCII.NUL;  --  openssl/pem.h:114
      PEM_STRING_X509 : aliased constant String := "CERTIFICATE" & ASCII.NUL;  --  openssl/pem.h:115
      PEM_STRING_X509_PAIR : aliased constant String := "CERTIFICATE PAIR" & ASCII.NUL;  --  openssl/pem.h:116
      PEM_STRING_X509_TRUSTED : aliased constant String := "TRUSTED CERTIFICATE" & ASCII.NUL;  --  openssl/pem.h:117
      PEM_STRING_X509_REQ_OLD : aliased constant String := "NEW CERTIFICATE REQUEST" & ASCII.NUL;  --  openssl/pem.h:118
      PEM_STRING_X509_REQ : aliased constant String := "CERTIFICATE REQUEST" & ASCII.NUL;  --  openssl/pem.h:119
      PEM_STRING_X509_CRL : aliased constant String := "X509 CRL" & ASCII.NUL;  --  openssl/pem.h:120
      PEM_STRING_EVP_PKEY : aliased constant String := "ANY PRIVATE KEY" & ASCII.NUL;  --  openssl/pem.h:121
      PEM_STRING_PUBLIC : aliased constant String := "PUBLIC KEY" & ASCII.NUL;  --  openssl/pem.h:122
      PEM_STRING_RSA : aliased constant String := "RSA PRIVATE KEY" & ASCII.NUL;  --  openssl/pem.h:123
      PEM_STRING_RSA_PUBLIC : aliased constant String := "RSA PUBLIC KEY" & ASCII.NUL;  --  openssl/pem.h:124
      PEM_STRING_DSA : aliased constant String := "DSA PRIVATE KEY" & ASCII.NUL;  --  openssl/pem.h:125
      PEM_STRING_DSA_PUBLIC : aliased constant String := "DSA PUBLIC KEY" & ASCII.NUL;  --  openssl/pem.h:126
      PEM_STRING_PKCS7 : aliased constant String := "PKCS7" & ASCII.NUL;  --  openssl/pem.h:127
      PEM_STRING_PKCS7_SIGNED : aliased constant String := "PKCS #7 SIGNED DATA" & ASCII.NUL;  --  openssl/pem.h:128
      PEM_STRING_PKCS8 : aliased constant String := "ENCRYPTED PRIVATE KEY" & ASCII.NUL;  --  openssl/pem.h:129
      PEM_STRING_PKCS8INF : aliased constant String := "PRIVATE KEY" & ASCII.NUL;  --  openssl/pem.h:130
      PEM_STRING_DHPARAMS : aliased constant String := "DH PARAMETERS" & ASCII.NUL;  --  openssl/pem.h:131
      PEM_STRING_SSL_SESSION : aliased constant String := "SSL SESSION PARAMETERS" & ASCII.NUL;  --  openssl/pem.h:132
      PEM_STRING_DSAPARAMS : aliased constant String := "DSA PARAMETERS" & ASCII.NUL;  --  openssl/pem.h:133
      PEM_STRING_ECDSA_PUBLIC : aliased constant String := "ECDSA PUBLIC KEY" & ASCII.NUL;  --  openssl/pem.h:134
      PEM_STRING_ECPARAMETERS : aliased constant String := "EC PARAMETERS" & ASCII.NUL;  --  openssl/pem.h:135
      PEM_STRING_ECPRIVATEKEY : aliased constant String := "EC PRIVATE KEY" & ASCII.NUL;  --  openssl/pem.h:136
      PEM_STRING_PARAMETERS : aliased constant String := "PARAMETERS" & ASCII.NUL;  --  openssl/pem.h:137
      PEM_STRING_CMS : aliased constant String := "CMS" & ASCII.NUL;  --  openssl/pem.h:138

      PEM_TYPE_ENCRYPTED : constant := 10;  --  openssl/pem.h:150
      PEM_TYPE_MIC_ONLY : constant := 20;  --  openssl/pem.h:151
      PEM_TYPE_MIC_CLEAR : constant := 30;  --  openssl/pem.h:152
      PEM_TYPE_CLEAR : constant := 40;  --  openssl/pem.h:153
      --  unsupported macro: IMPLEMENT_PEM_read_fp(name,type,str,asn1) type *PEM_read_ ##name(FILE *fp, type **x, pem_password_cb *cb, void *u){ return PEM_ASN1_read((d2i_of_void *)d2i_ ##asn1, str,fp,(void **)x,cb,u); }
      --  unsupported macro: IMPLEMENT_PEM_write_fp(name,type,str,asn1) int PEM_write_ ##name(FILE *fp, type *x) { return PEM_ASN1_write((i2d_of_void *)i2d_ ##asn1,str,fp,x,NULL,NULL,0,NULL,NULL); }
      --  unsupported macro: IMPLEMENT_PEM_write_fp_const(name,type,str,asn1) int PEM_write_ ##name(FILE *fp, const type *x) { return PEM_ASN1_write((i2d_of_void *)i2d_ ##asn1,str,fp,(void *)x,NULL,NULL,0,NULL,NULL); }
      --  unsupported macro: IMPLEMENT_PEM_write_cb_fp(name,type,str,asn1) int PEM_write_ ##name(FILE *fp, type *x, const EVP_CIPHER *enc, unsigned char *kstr, int klen, pem_password_cb *cb, void *u) { return PEM_ASN1_write((i2d_of_void *)i2d_ ##asn1,str,fp,x,enc,kstr,klen,cb,u); }
      --  unsupported macro: IMPLEMENT_PEM_write_cb_fp_const(name,type,str,asn1) int PEM_write_ ##name(FILE *fp, type *x, const EVP_CIPHER *enc, unsigned char *kstr, int klen, pem_password_cb *cb, void *u) { return PEM_ASN1_write((i2d_of_void *)i2d_ ##asn1,str,fp,x,enc,kstr,klen,cb,u); }
      --  unsupported macro: IMPLEMENT_PEM_read_bio(name,type,str,asn1) type *PEM_read_bio_ ##name(BIO *bp, type **x, pem_password_cb *cb, void *u){ return PEM_ASN1_read_bio((d2i_of_void *)d2i_ ##asn1, str,bp,(void **)x,cb,u); }
      --  unsupported macro: IMPLEMENT_PEM_write_bio(name,type,str,asn1) int PEM_write_bio_ ##name(BIO *bp, type *x) { return PEM_ASN1_write_bio((i2d_of_void *)i2d_ ##asn1,str,bp,x,NULL,NULL,0,NULL,NULL); }
      --  unsupported macro: IMPLEMENT_PEM_write_bio_const(name,type,str,asn1) int PEM_write_bio_ ##name(BIO *bp, const type *x) { return PEM_ASN1_write_bio((i2d_of_void *)i2d_ ##asn1,str,bp,(void *)x,NULL,NULL,0,NULL,NULL); }
      --  unsupported macro: IMPLEMENT_PEM_write_cb_bio(name,type,str,asn1) int PEM_write_bio_ ##name(BIO *bp, type *x, const EVP_CIPHER *enc, unsigned char *kstr, int klen, pem_password_cb *cb, void *u) { return PEM_ASN1_write_bio((i2d_of_void *)i2d_ ##asn1,str,bp,x,enc,kstr,klen,cb,u); }
      --  unsupported macro: IMPLEMENT_PEM_write_cb_bio_const(name,type,str,asn1) int PEM_write_bio_ ##name(BIO *bp, type *x, const EVP_CIPHER *enc, unsigned char *kstr, int klen, pem_password_cb *cb, void *u) { return PEM_ASN1_write_bio((i2d_of_void *)i2d_ ##asn1,str,bp,(void *)x,enc,kstr,klen,cb,u); }
      --  arg-macro: procedure IMPLEMENT_PEM_write (name, type, strIMPLEMENT_PEM_write_bio(name, type, str, asn1) IMPLEMENT_PEM_write_fp(name, type, str, asn1)
      --    IMPLEMENT_PEM_write_bio(name, type, str, asn1) IMPLEMENT_PEM_write_fp(name, type, str, asn1)
      --  arg-macro: procedure IMPLEMENT_PEM_write_const (name, type, strIMPLEMENT_PEM_write_bio_const(name, type, str, asn1) IMPLEMENT_PEM_write_fp_const(name, type, str, asn1)
      --    IMPLEMENT_PEM_write_bio_const(name, type, str, asn1) IMPLEMENT_PEM_write_fp_const(name, type, str, asn1)
      --  arg-macro: procedure IMPLEMENT_PEM_write_cb (name, type, strIMPLEMENT_PEM_write_cb_bio(name, type, str, asn1) IMPLEMENT_PEM_write_cb_fp(name, type, str, asn1)
      --    IMPLEMENT_PEM_write_cb_bio(name, type, str, asn1) IMPLEMENT_PEM_write_cb_fp(name, type, str, asn1)
      --  arg-macro: procedure IMPLEMENT_PEM_write_cb_const (name, type, strIMPLEMENT_PEM_write_cb_bio_const(name, type, str, asn1) IMPLEMENT_PEM_write_cb_fp_const(name, type, str, asn1)
      --    IMPLEMENT_PEM_write_cb_bio_const(name, type, str, asn1) IMPLEMENT_PEM_write_cb_fp_const(name, type, str, asn1)
      --  arg-macro: procedure IMPLEMENT_PEM_read (name, type, strIMPLEMENT_PEM_read_bio(name, type, str, asn1) IMPLEMENT_PEM_read_fp(name, type, str, asn1)
      --    IMPLEMENT_PEM_read_bio(name, type, str, asn1) IMPLEMENT_PEM_read_fp(name, type, str, asn1)
      --  arg-macro: procedure IMPLEMENT_PEM_rw (name, type, strIMPLEMENT_PEM_read(name, type, str, asn1) IMPLEMENT_PEM_write(name, type, str, asn1)
      --    IMPLEMENT_PEM_read(name, type, str, asn1) IMPLEMENT_PEM_write(name, type, str, asn1)
      --  arg-macro: procedure IMPLEMENT_PEM_rw_const (name, type, strIMPLEMENT_PEM_read(name, type, str, asn1) IMPLEMENT_PEM_write_const(name, type, str, asn1)
      --    IMPLEMENT_PEM_read(name, type, str, asn1) IMPLEMENT_PEM_write_const(name, type, str, asn1)
      --  arg-macro: procedure IMPLEMENT_PEM_rw_cb (name, type, strIMPLEMENT_PEM_read(name, type, str, asn1) IMPLEMENT_PEM_write_cb(name, type, str, asn1)
      --    IMPLEMENT_PEM_read(name, type, str, asn1) IMPLEMENT_PEM_write_cb(name, type, str, asn1)
      --  unsupported macro: DECLARE_PEM_read_fp(name,type) type *PEM_read_ ##name(FILE *fp, type **x, pem_password_cb *cb, void *u);
      --  unsupported macro: DECLARE_PEM_write_fp(name,type) int PEM_write_ ##name(FILE *fp, type *x);
      --  unsupported macro: DECLARE_PEM_write_fp_const(name,type) int PEM_write_ ##name(FILE *fp, const type *x);
      --  unsupported macro: DECLARE_PEM_write_cb_fp(name,type) int PEM_write_ ##name(FILE *fp, type *x, const EVP_CIPHER *enc, unsigned char *kstr, int klen, pem_password_cb *cb, void *u);
      --  unsupported macro: DECLARE_PEM_read_bio(name,type) type *PEM_read_bio_ ##name(BIO *bp, type **x, pem_password_cb *cb, void *u);
      --  unsupported macro: DECLARE_PEM_write_bio(name,type) int PEM_write_bio_ ##name(BIO *bp, type *x);
      --  unsupported macro: DECLARE_PEM_write_bio_const(name,type) int PEM_write_bio_ ##name(BIO *bp, const type *x);
      --  unsupported macro: DECLARE_PEM_write_cb_bio(name,type) int PEM_write_bio_ ##name(BIO *bp, type *x, const EVP_CIPHER *enc, unsigned char *kstr, int klen, pem_password_cb *cb, void *u);
      --  arg-macro: procedure DECLARE_PEM_write (name, type)
      --    DECLARE_PEM_write_bio(name, type) DECLARE_PEM_write_fp(name, type)
      --  arg-macro: procedure DECLARE_PEM_write_const (name, type)
      --    DECLARE_PEM_write_bio_const(name, type) DECLARE_PEM_write_fp_const(name, type)
      --  arg-macro: procedure DECLARE_PEM_write_cb (name, type)
      --    DECLARE_PEM_write_cb_bio(name, type) DECLARE_PEM_write_cb_fp(name, type)
      --  arg-macro: procedure DECLARE_PEM_read (name, type)
      --    DECLARE_PEM_read_bio(name, type) DECLARE_PEM_read_fp(name, type)
      --  arg-macro: procedure DECLARE_PEM_rw (name, type)
      --    DECLARE_PEM_read(name, type) DECLARE_PEM_write(name, type)
      --  arg-macro: procedure DECLARE_PEM_rw_const (name, type)
      --    DECLARE_PEM_read(name, type) DECLARE_PEM_write_const(name, type)
      --  arg-macro: procedure DECLARE_PEM_rw_cb (name, type)
      --    DECLARE_PEM_read(name, type) DECLARE_PEM_write_cb(name, type)

      PEM_F_B2I_DSS : constant := 127;  --  openssl/pem.h:562
      PEM_F_B2I_PVK_BIO : constant := 128;  --  openssl/pem.h:563
      PEM_F_B2I_RSA : constant := 129;  --  openssl/pem.h:564
      PEM_F_CHECK_BITLEN_DSA : constant := 130;  --  openssl/pem.h:565
      PEM_F_CHECK_BITLEN_RSA : constant := 131;  --  openssl/pem.h:566
      PEM_F_D2I_PKCS8PRIVATEKEY_BIO : constant := 120;  --  openssl/pem.h:567
      PEM_F_D2I_PKCS8PRIVATEKEY_FP : constant := 121;  --  openssl/pem.h:568
      PEM_F_DO_B2I : constant := 132;  --  openssl/pem.h:569
      PEM_F_DO_B2I_BIO : constant := 133;  --  openssl/pem.h:570
      PEM_F_DO_BLOB_HEADER : constant := 134;  --  openssl/pem.h:571
      PEM_F_DO_PK8PKEY : constant := 126;  --  openssl/pem.h:572
      PEM_F_DO_PK8PKEY_FP : constant := 125;  --  openssl/pem.h:573
      PEM_F_DO_PVK_BODY : constant := 135;  --  openssl/pem.h:574
      PEM_F_DO_PVK_HEADER : constant := 136;  --  openssl/pem.h:575
      PEM_F_I2B_PVK : constant := 137;  --  openssl/pem.h:576
      PEM_F_I2B_PVK_BIO : constant := 138;  --  openssl/pem.h:577
      PEM_F_LOAD_IV : constant := 101;  --  openssl/pem.h:578
      PEM_F_PEM_ASN1_READ : constant := 102;  --  openssl/pem.h:579
      PEM_F_PEM_ASN1_READ_BIO : constant := 103;  --  openssl/pem.h:580
      PEM_F_PEM_ASN1_WRITE : constant := 104;  --  openssl/pem.h:581
      PEM_F_PEM_ASN1_WRITE_BIO : constant := 105;  --  openssl/pem.h:582
      PEM_F_PEM_DEF_CALLBACK : constant := 100;  --  openssl/pem.h:583
      PEM_F_PEM_DO_HEADER : constant := 106;  --  openssl/pem.h:584
      PEM_F_PEM_F_PEM_WRITE_PKCS8PRIVATEKEY : constant := 118;  --  openssl/pem.h:585
      PEM_F_PEM_GET_EVP_CIPHER_INFO : constant := 107;  --  openssl/pem.h:586
      PEM_F_PEM_PK8PKEY : constant := 119;  --  openssl/pem.h:587
      PEM_F_PEM_READ : constant := 108;  --  openssl/pem.h:588
      PEM_F_PEM_READ_BIO : constant := 109;  --  openssl/pem.h:589
      PEM_F_PEM_READ_BIO_PARAMETERS : constant := 140;  --  openssl/pem.h:590
      PEM_F_PEM_READ_BIO_PRIVATEKEY : constant := 123;  --  openssl/pem.h:591
      PEM_F_PEM_READ_PRIVATEKEY : constant := 124;  --  openssl/pem.h:592
      PEM_F_PEM_SEALFINAL : constant := 110;  --  openssl/pem.h:593
      PEM_F_PEM_SEALINIT : constant := 111;  --  openssl/pem.h:594
      PEM_F_PEM_SIGNFINAL : constant := 112;  --  openssl/pem.h:595
      PEM_F_PEM_WRITE : constant := 113;  --  openssl/pem.h:596
      PEM_F_PEM_WRITE_BIO : constant := 114;  --  openssl/pem.h:597
      PEM_F_PEM_WRITE_PRIVATEKEY : constant := 139;  --  openssl/pem.h:598
      PEM_F_PEM_X509_INFO_READ : constant := 115;  --  openssl/pem.h:599
      PEM_F_PEM_X509_INFO_READ_BIO : constant := 116;  --  openssl/pem.h:600
      PEM_F_PEM_X509_INFO_WRITE_BIO : constant := 117;  --  openssl/pem.h:601

      PEM_R_BAD_BASE64_DECODE : constant := 100;  --  openssl/pem.h:604
      PEM_R_BAD_DECRYPT : constant := 101;  --  openssl/pem.h:605
      PEM_R_BAD_END_LINE : constant := 102;  --  openssl/pem.h:606
      PEM_R_BAD_IV_CHARS : constant := 103;  --  openssl/pem.h:607
      PEM_R_BAD_MAGIC_NUMBER : constant := 116;  --  openssl/pem.h:608
      PEM_R_BAD_PASSWORD_READ : constant := 104;  --  openssl/pem.h:609
      PEM_R_BAD_VERSION_NUMBER : constant := 117;  --  openssl/pem.h:610
      PEM_R_BIO_WRITE_FAILURE : constant := 118;  --  openssl/pem.h:611
      PEM_R_CIPHER_IS_NULL : constant := 127;  --  openssl/pem.h:612
      PEM_R_ERROR_CONVERTING_PRIVATE_KEY : constant := 115;  --  openssl/pem.h:613
      PEM_R_EXPECTING_PRIVATE_KEY_BLOB : constant := 119;  --  openssl/pem.h:614
      PEM_R_EXPECTING_PUBLIC_KEY_BLOB : constant := 120;  --  openssl/pem.h:615
      PEM_R_INCONSISTENT_HEADER : constant := 121;  --  openssl/pem.h:616
      PEM_R_KEYBLOB_HEADER_PARSE_ERROR : constant := 122;  --  openssl/pem.h:617
      PEM_R_KEYBLOB_TOO_SHORT : constant := 123;  --  openssl/pem.h:618
      PEM_R_NOT_DEK_INFO : constant := 105;  --  openssl/pem.h:619
      PEM_R_NOT_ENCRYPTED : constant := 106;  --  openssl/pem.h:620
      PEM_R_NOT_PROC_TYPE : constant := 107;  --  openssl/pem.h:621
      PEM_R_NO_START_LINE : constant := 108;  --  openssl/pem.h:622
      PEM_R_PROBLEMS_GETTING_PASSWORD : constant := 109;  --  openssl/pem.h:623
      PEM_R_PUBLIC_KEY_NO_RSA : constant := 110;  --  openssl/pem.h:624
      PEM_R_PVK_DATA_TOO_SHORT : constant := 124;  --  openssl/pem.h:625
      PEM_R_PVK_TOO_SHORT : constant := 125;  --  openssl/pem.h:626
      PEM_R_READ_KEY : constant := 111;  --  openssl/pem.h:627
      PEM_R_SHORT_HEADER : constant := 112;  --  openssl/pem.h:628
      PEM_R_UNSUPPORTED_CIPHER : constant := 113;  --  openssl/pem.h:629
      PEM_R_UNSUPPORTED_ENCRYPTION : constant := 114;  --  openssl/pem.h:630
      PEM_R_UNSUPPORTED_KEY_COMPONENTS : constant := 126;  --  openssl/pem.h:631
   end defs;
   type PEM_Encode_Seal_st is record
      encode : aliased OpenSSL.Low_Level.evp_h.EVP_ENCODE_CTX;  -- openssl/pem.h:144
      md     : aliased OpenSSL.Low_Level.evp_h.env_md_ctx_st;  -- openssl/pem.h:145
      cipher : aliased OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;  -- openssl/pem.h:146
   end record;
   pragma Convention (C_Pass_By_Copy, PEM_Encode_Seal_st);  -- openssl/pem.h:142

   subtype PEM_ENCODE_SEAL_CTX is PEM_Encode_Seal_st;

   type pem_recip_st is record
      name    : Interfaces.C.Strings.chars_ptr;  -- openssl/pem.h:157
      dn      : access OpenSSL.Low_Level.x509_h.X509_name_st;  -- openssl/pem.h:158
      cipher  : aliased int;  -- openssl/pem.h:160
      key_enc : aliased int;  -- openssl/pem.h:161
   end record;
   pragma Convention (C_Pass_By_Copy, pem_recip_st);  -- openssl/pem.h:155

   subtype PEM_USER is pem_recip_st;

   type pem_ctx_st;
   type anon_33 is record
      version : aliased int;  -- openssl/pem.h:170
      mode    : aliased int;  -- openssl/pem.h:171
   end record;
   pragma Convention (C_Pass_By_Copy, anon_33);
   type anon_34 is record
      cipher : aliased int;  -- openssl/pem.h:177
   end record;
   pragma Convention (C_Pass_By_Copy, anon_34);
   type pem_ctx_st is record
      c_type        : aliased int;  -- openssl/pem.h:167
      proc_type     : aliased anon_33;  -- openssl/pem.h:172
      domain        : Interfaces.C.Strings.chars_ptr;  -- openssl/pem.h:174
      DEK_info      : aliased anon_34;  -- openssl/pem.h:180
      originator    : access PEM_USER;  -- openssl/pem.h:182
      num_recipient : aliased int;  -- openssl/pem.h:184
      recipient     : System.Address;  -- openssl/pem.h:185
      md            : access OpenSSL.Low_Level.evp_h.env_md_st;  -- openssl/pem.h:189
      md_enc        : aliased int;  -- openssl/pem.h:191
      md_len        : aliased int;  -- openssl/pem.h:192
      md_data       : Interfaces.C.Strings.chars_ptr;  -- openssl/pem.h:193
      dec           : access OpenSSL.Low_Level.evp_h.evp_cipher_st;  -- openssl/pem.h:195
      key_len       : aliased int;  -- openssl/pem.h:196
      key           : access unsigned_char;  -- openssl/pem.h:197
      data_enc      : aliased int;  -- openssl/pem.h:202
      data_len      : aliased int;  -- openssl/pem.h:203
      data          : access unsigned_char;  -- openssl/pem.h:204
   end record;
   pragma Convention (C_Pass_By_Copy, pem_ctx_st);  -- openssl/pem.h:165

   subtype PEM_CTX is pem_ctx_st;

   --  skipped function type pem_password_cb

   function PEM_get_EVP_CIPHER_INFO (header : Interfaces.C.Strings.chars_ptr; cipher : access OpenSSL.Low_Level.evp_h.EVP_CIPHER_INFO) return int;  -- openssl/pem.h:406
   pragma Import (C, PEM_get_EVP_CIPHER_INFO, "PEM_get_EVP_CIPHER_INFO");

   function PEM_do_header
     (cipher   : access OpenSSL.Low_Level.evp_h.EVP_CIPHER_INFO;
      data     : access unsigned_char;
      len      : access long;
      callback : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u        : System.Address) return int;  -- openssl/pem.h:407
   pragma Import (C, PEM_do_header, "PEM_do_header");

   function PEM_read_bio
     (bp     : access OpenSSL.Low_Level.bio_h.bio_st;
      name   : System.Address;
      header : System.Address;
      data   : System.Address;
      len    : access long) return int;  -- openssl/pem.h:411
   pragma Import (C, PEM_read_bio, "PEM_read_bio");

   function PEM_write_bio
     (bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      name : Interfaces.C.Strings.chars_ptr;
      hdr  : Interfaces.C.Strings.chars_ptr;
      data : access unsigned_char;
      len  : long) return int;  -- openssl/pem.h:413
   pragma Import (C, PEM_write_bio, "PEM_write_bio");

   function PEM_bytes_read_bio
     (pdata : System.Address;
      plen  : access long;
      pnm   : System.Address;
      name  : Interfaces.C.Strings.chars_ptr;
      bp    : access OpenSSL.Low_Level.bio_h.bio_st;
      cb    : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u     : System.Address) return int;  -- openssl/pem.h:415
   pragma Import (C, PEM_bytes_read_bio, "PEM_bytes_read_bio");

   function PEM_ASN1_read_bio
     (d2i  : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : long) return System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      x    : System.Address;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return System.Address;  -- openssl/pem.h:417
   pragma Import (C, PEM_ASN1_read_bio, "PEM_ASN1_read_bio");

   function PEM_ASN1_write_bio
     (i2d  : access function (arg1 : System.Address; arg2 : System.Address) return int;
      name : Interfaces.C.Strings.chars_ptr;
      bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      x    : System.Address;
      enc  : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      kstr : access unsigned_char;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:419
   pragma Import (C, PEM_ASN1_write_bio, "PEM_ASN1_write_bio");

   function PEM_X509_INFO_read_bio
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      sk : access OpenSSL.Low_Level.x509_h.stack_st_X509_INFO;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.stack_st_X509_INFO;  -- openssl/pem.h:423
   pragma Import (C, PEM_X509_INFO_read_bio, "PEM_X509_INFO_read_bio");

   function PEM_X509_INFO_write_bio
     (bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      xi   : access OpenSSL.Low_Level.x509_h.X509_INFO;
      enc  : access OpenSSL.Low_Level.evp_h.evp_cipher_st;
      kstr : access unsigned_char;
      klen : int;
      cd   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:424
   pragma Import (C, PEM_X509_INFO_write_bio, "PEM_X509_INFO_write_bio");

   function PEM_read
     (fp     : access Interfaces.C_Streams.FILEs;
      name   : System.Address;
      header : System.Address;
      data   : System.Address;
      len    : access long) return int;  -- openssl/pem.h:428
   pragma Import (C, PEM_read, "PEM_read");

   function PEM_write
     (fp   : access Interfaces.C_Streams.FILEs;
      name : Interfaces.C.Strings.chars_ptr;
      hdr  : Interfaces.C.Strings.chars_ptr;
      data : access unsigned_char;
      len  : long) return int;  -- openssl/pem.h:430
   pragma Import (C, PEM_write, "PEM_write");

   function PEM_ASN1_read
     (d2i  : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : long) return System.Address;
      name : Interfaces.C.Strings.chars_ptr;
      fp   : access Interfaces.C_Streams.FILEs;
      x    : System.Address;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return System.Address;  -- openssl/pem.h:431
   pragma Import (C, PEM_ASN1_read, "PEM_ASN1_read");

   function PEM_ASN1_write
     (i2d      : access function (arg1 : System.Address; arg2 : System.Address) return int;
      name     : Interfaces.C.Strings.chars_ptr;
      fp       : access Interfaces.C_Streams.FILEs;
      x        : System.Address;
      enc      : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      kstr     : access unsigned_char;
      klen     : int;
      callback : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u        : System.Address) return int;  -- openssl/pem.h:433
   pragma Import (C, PEM_ASN1_write, "PEM_ASN1_write");

   function PEM_X509_INFO_read
     (fp : access Interfaces.C_Streams.FILEs;
      sk : access OpenSSL.Low_Level.x509_h.stack_st_X509_INFO;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.stack_st_X509_INFO;  -- openssl/pem.h:436
   pragma Import (C, PEM_X509_INFO_read, "PEM_X509_INFO_read");

   function PEM_SealInit
     (ctx     : access PEM_ENCODE_SEAL_CTX;
      c_type  : access OpenSSL.Low_Level.evp_h.evp_cipher_st;
      md_type : access OpenSSL.Low_Level.evp_h.env_md_st;
      ek      : System.Address;
      ekl     : access int;
      iv      : access unsigned_char;
      pubk    : System.Address;
      npubk   : int) return int;  -- openssl/pem.h:439
   pragma Import (C, PEM_SealInit, "PEM_SealInit");

   procedure PEM_SealUpdate
     (ctx   : access PEM_ENCODE_SEAL_CTX;
      c_out : access unsigned_char;
      outl  : access int;
      c_in  : access unsigned_char;
      inl   : int);  -- openssl/pem.h:442
   pragma Import (C, PEM_SealUpdate, "PEM_SealUpdate");

   function PEM_SealFinal
     (ctx   : access PEM_ENCODE_SEAL_CTX;
      sig   : access unsigned_char;
      sigl  : access int;
      c_out : access unsigned_char;
      outl  : access int;
      priv  : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/pem.h:444
   pragma Import (C, PEM_SealFinal, "PEM_SealFinal");

   procedure PEM_SignInit (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st; c_type : access OpenSSL.Low_Level.evp_h.env_md_st);  -- openssl/pem.h:447
   pragma Import (C, PEM_SignInit, "PEM_SignInit");

   procedure PEM_SignUpdate
     (ctx : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
      d   : access unsigned_char;
      cnt : unsigned);  -- openssl/pem.h:448
   pragma Import (C, PEM_SignUpdate, "PEM_SignUpdate");

   function PEM_SignFinal
     (ctx    : access OpenSSL.Low_Level.evp_h.env_md_ctx_st;
      sigret : access unsigned_char;
      siglen : access unsigned;
      pkey   : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/pem.h:449
   pragma Import (C, PEM_SignFinal, "PEM_SignFinal");

   function PEM_def_callback
     (buf : Interfaces.C.Strings.chars_ptr;
      num : int;
      w   : int;
      key : System.Address) return int;  -- openssl/pem.h:452
   pragma Import (C, PEM_def_callback, "PEM_def_callback");

   procedure PEM_proc_type (buf : Interfaces.C.Strings.chars_ptr; c_type : int);  -- openssl/pem.h:453
   pragma Import (C, PEM_proc_type, "PEM_proc_type");

   procedure PEM_dek_info
     (buf    : Interfaces.C.Strings.chars_ptr;
      c_type : Interfaces.C.Strings.chars_ptr;
      len    : int;
      str    : Interfaces.C.Strings.chars_ptr);  -- openssl/pem.h:454
   pragma Import (C, PEM_dek_info, "PEM_dek_info");

   function PEM_write_X509 (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/pem.h:459
   pragma Import (C, PEM_write_X509, "PEM_write_X509");

   function PEM_write_bio_X509 (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/pem.h:459
   pragma Import (C, PEM_write_bio_X509, "PEM_write_bio_X509");

   function PEM_read_X509
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/pem.h:459
   pragma Import (C, PEM_read_X509, "PEM_read_X509");

   function PEM_read_bio_X509
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/pem.h:459
   pragma Import (C, PEM_read_bio_X509, "PEM_read_bio_X509");

   function PEM_write_X509_AUX (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/pem.h:461
   pragma Import (C, PEM_write_X509_AUX, "PEM_write_X509_AUX");

   function PEM_write_bio_X509_AUX (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.x509_h.x509_st) return int;  -- openssl/pem.h:461
   pragma Import (C, PEM_write_bio_X509_AUX, "PEM_write_bio_X509_AUX");

   function PEM_read_X509_AUX
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/pem.h:461
   pragma Import (C, PEM_read_X509_AUX, "PEM_read_X509_AUX");

   function PEM_read_bio_X509_AUX
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/pem.h:461
   pragma Import (C, PEM_read_bio_X509_AUX, "PEM_read_bio_X509_AUX");

   function PEM_write_X509_CERT_PAIR (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.x509_h.X509_CERT_PAIR) return int;  -- openssl/pem.h:463
   pragma Import (C, PEM_write_X509_CERT_PAIR, "PEM_write_X509_CERT_PAIR");

   function PEM_write_bio_X509_CERT_PAIR (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.x509_h.X509_CERT_PAIR) return int;  -- openssl/pem.h:463
   pragma Import (C, PEM_write_bio_X509_CERT_PAIR, "PEM_write_bio_X509_CERT_PAIR");

   function PEM_read_X509_CERT_PAIR
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.X509_CERT_PAIR;  -- openssl/pem.h:463
   pragma Import (C, PEM_read_X509_CERT_PAIR, "PEM_read_X509_CERT_PAIR");

   function PEM_read_bio_X509_CERT_PAIR
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.X509_CERT_PAIR;  -- openssl/pem.h:463
   pragma Import (C, PEM_read_bio_X509_CERT_PAIR, "PEM_read_bio_X509_CERT_PAIR");

   function PEM_write_X509_REQ (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.x509_h.X509_REQ) return int;  -- openssl/pem.h:465
   pragma Import (C, PEM_write_X509_REQ, "PEM_write_X509_REQ");

   function PEM_write_bio_X509_REQ (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.x509_h.X509_REQ) return int;  -- openssl/pem.h:465
   pragma Import (C, PEM_write_bio_X509_REQ, "PEM_write_bio_X509_REQ");

   function PEM_read_X509_REQ
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.X509_REQ;  -- openssl/pem.h:465
   pragma Import (C, PEM_read_X509_REQ, "PEM_read_X509_REQ");

   function PEM_read_bio_X509_REQ
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.X509_REQ;  -- openssl/pem.h:465
   pragma Import (C, PEM_read_bio_X509_REQ, "PEM_read_bio_X509_REQ");

   function PEM_write_X509_REQ_NEW (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.x509_h.X509_REQ) return int;  -- openssl/pem.h:466
   pragma Import (C, PEM_write_X509_REQ_NEW, "PEM_write_X509_REQ_NEW");

   function PEM_write_bio_X509_REQ_NEW (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.x509_h.X509_REQ) return int;  -- openssl/pem.h:466
   pragma Import (C, PEM_write_bio_X509_REQ_NEW, "PEM_write_bio_X509_REQ_NEW");

   function PEM_write_X509_CRL (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/pem.h:468
   pragma Import (C, PEM_write_X509_CRL, "PEM_write_X509_CRL");

   function PEM_write_bio_X509_CRL (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.x509_h.X509_crl_st) return int;  -- openssl/pem.h:468
   pragma Import (C, PEM_write_bio_X509_CRL, "PEM_write_bio_X509_CRL");

   function PEM_read_X509_CRL
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/pem.h:468
   pragma Import (C, PEM_read_X509_CRL, "PEM_read_X509_CRL");

   function PEM_read_bio_X509_CRL
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.X509_crl_st;  -- openssl/pem.h:468
   pragma Import (C, PEM_read_bio_X509_CRL, "PEM_read_bio_X509_CRL");

   function PEM_write_PKCS7 (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.pkcs7_h.PKCS7) return int;  -- openssl/pem.h:470
   pragma Import (C, PEM_write_PKCS7, "PEM_write_PKCS7");

   function PEM_write_bio_PKCS7 (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.pkcs7_h.PKCS7) return int;  -- openssl/pem.h:470
   pragma Import (C, PEM_write_bio_PKCS7, "PEM_write_bio_PKCS7");

   function PEM_read_PKCS7
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.pkcs7_h.PKCS7;  -- openssl/pem.h:470
   pragma Import (C, PEM_read_PKCS7, "PEM_read_PKCS7");

   function PEM_read_bio_PKCS7
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.pkcs7_h.PKCS7;  -- openssl/pem.h:470
   pragma Import (C, PEM_read_bio_PKCS7, "PEM_read_bio_PKCS7");

   function PEM_write_NETSCAPE_CERT_SEQUENCE (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.x509_h.NETSCAPE_CERT_SEQUENCE) return int;  -- openssl/pem.h:472
   pragma Import (C, PEM_write_NETSCAPE_CERT_SEQUENCE, "PEM_write_NETSCAPE_CERT_SEQUENCE");

   function PEM_write_bio_NETSCAPE_CERT_SEQUENCE (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.x509_h.NETSCAPE_CERT_SEQUENCE) return int;  -- openssl/pem.h:472
   pragma Import (C, PEM_write_bio_NETSCAPE_CERT_SEQUENCE, "PEM_write_bio_NETSCAPE_CERT_SEQUENCE");

   function PEM_read_NETSCAPE_CERT_SEQUENCE
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.NETSCAPE_CERT_SEQUENCE;  -- openssl/pem.h:472
   pragma Import (C, PEM_read_NETSCAPE_CERT_SEQUENCE, "PEM_read_NETSCAPE_CERT_SEQUENCE");

   function PEM_read_bio_NETSCAPE_CERT_SEQUENCE
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.NETSCAPE_CERT_SEQUENCE;  -- openssl/pem.h:472
   pragma Import (C, PEM_read_bio_NETSCAPE_CERT_SEQUENCE, "PEM_read_bio_NETSCAPE_CERT_SEQUENCE");

   function PEM_write_PKCS8 (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.x509_h.X509_SIG) return int;  -- openssl/pem.h:474
   pragma Import (C, PEM_write_PKCS8, "PEM_write_PKCS8");

   function PEM_write_bio_PKCS8 (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.x509_h.X509_SIG) return int;  -- openssl/pem.h:474
   pragma Import (C, PEM_write_bio_PKCS8, "PEM_write_bio_PKCS8");

   function PEM_read_PKCS8
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.X509_SIG;  -- openssl/pem.h:474
   pragma Import (C, PEM_read_PKCS8, "PEM_read_PKCS8");

   function PEM_read_bio_PKCS8
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.X509_SIG;  -- openssl/pem.h:474
   pragma Import (C, PEM_read_bio_PKCS8, "PEM_read_bio_PKCS8");

   function PEM_write_PKCS8_PRIV_KEY_INFO (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st) return int;  -- openssl/pem.h:476
   pragma Import (C, PEM_write_PKCS8_PRIV_KEY_INFO, "PEM_write_PKCS8_PRIV_KEY_INFO");

   function PEM_write_bio_PKCS8_PRIV_KEY_INFO (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st) return int;  -- openssl/pem.h:476
   pragma Import (C, PEM_write_bio_PKCS8_PRIV_KEY_INFO, "PEM_write_bio_PKCS8_PRIV_KEY_INFO");

   function PEM_read_PKCS8_PRIV_KEY_INFO
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;  -- openssl/pem.h:476
   pragma Import (C, PEM_read_PKCS8_PRIV_KEY_INFO, "PEM_read_PKCS8_PRIV_KEY_INFO");

   function PEM_read_bio_PKCS8_PRIV_KEY_INFO
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;  -- openssl/pem.h:476
   pragma Import (C, PEM_read_bio_PKCS8_PRIV_KEY_INFO, "PEM_read_bio_PKCS8_PRIV_KEY_INFO");

   function PEM_write_RSAPrivateKey
     (fp   : access Interfaces.C_Streams.FILEs;
      x    : access OpenSSL.Low_Level.rsa_h.rsa_st;
      enc  : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      kstr : access unsigned_char;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:480
   pragma Import (C, PEM_write_RSAPrivateKey, "PEM_write_RSAPrivateKey");

   function PEM_write_bio_RSAPrivateKey
     (bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      x    : access OpenSSL.Low_Level.rsa_h.rsa_st;
      enc  : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      kstr : access unsigned_char;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:480
   pragma Import (C, PEM_write_bio_RSAPrivateKey, "PEM_write_bio_RSAPrivateKey");

   function PEM_read_RSAPrivateKey
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/pem.h:480
   pragma Import (C, PEM_read_RSAPrivateKey, "PEM_read_RSAPrivateKey");

   function PEM_read_bio_RSAPrivateKey
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/pem.h:480
   pragma Import (C, PEM_read_bio_RSAPrivateKey, "PEM_read_bio_RSAPrivateKey");

   function PEM_write_RSAPublicKey (fp : access Interfaces.C_Streams.FILEs; x : access constant OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/pem.h:482
   pragma Import (C, PEM_write_RSAPublicKey, "PEM_write_RSAPublicKey");

   function PEM_write_bio_RSAPublicKey (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access constant OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/pem.h:482
   pragma Import (C, PEM_write_bio_RSAPublicKey, "PEM_write_bio_RSAPublicKey");

   function PEM_read_RSAPublicKey
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/pem.h:482
   pragma Import (C, PEM_read_RSAPublicKey, "PEM_read_RSAPublicKey");

   function PEM_read_bio_RSAPublicKey
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/pem.h:482
   pragma Import (C, PEM_read_bio_RSAPublicKey, "PEM_read_bio_RSAPublicKey");

   function PEM_write_RSA_PUBKEY (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/pem.h:483
   pragma Import (C, PEM_write_RSA_PUBKEY, "PEM_write_RSA_PUBKEY");

   function PEM_write_bio_RSA_PUBKEY (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.rsa_h.rsa_st) return int;  -- openssl/pem.h:483
   pragma Import (C, PEM_write_bio_RSA_PUBKEY, "PEM_write_bio_RSA_PUBKEY");

   function PEM_read_RSA_PUBKEY
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/pem.h:483
   pragma Import (C, PEM_read_RSA_PUBKEY, "PEM_read_RSA_PUBKEY");

   function PEM_read_bio_RSA_PUBKEY
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.rsa_h.rsa_st;  -- openssl/pem.h:483
   pragma Import (C, PEM_read_bio_RSA_PUBKEY, "PEM_read_bio_RSA_PUBKEY");

   function PEM_write_DSAPrivateKey
     (fp   : access Interfaces.C_Streams.FILEs;
      x    : access OpenSSL.Low_Level.dsa_h.dsa_st;
      enc  : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      kstr : access unsigned_char;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:489
   pragma Import (C, PEM_write_DSAPrivateKey, "PEM_write_DSAPrivateKey");

   function PEM_write_bio_DSAPrivateKey
     (bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      x    : access OpenSSL.Low_Level.dsa_h.dsa_st;
      enc  : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      kstr : access unsigned_char;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:489
   pragma Import (C, PEM_write_bio_DSAPrivateKey, "PEM_write_bio_DSAPrivateKey");

   function PEM_read_DSAPrivateKey
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/pem.h:489
   pragma Import (C, PEM_read_DSAPrivateKey, "PEM_read_DSAPrivateKey");

   function PEM_read_bio_DSAPrivateKey
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/pem.h:489
   pragma Import (C, PEM_read_bio_DSAPrivateKey, "PEM_read_bio_DSAPrivateKey");

   function PEM_write_DSA_PUBKEY (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/pem.h:491
   pragma Import (C, PEM_write_DSA_PUBKEY, "PEM_write_DSA_PUBKEY");

   function PEM_write_bio_DSA_PUBKEY (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/pem.h:491
   pragma Import (C, PEM_write_bio_DSA_PUBKEY, "PEM_write_bio_DSA_PUBKEY");

   function PEM_read_DSA_PUBKEY
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/pem.h:491
   pragma Import (C, PEM_read_DSA_PUBKEY, "PEM_read_DSA_PUBKEY");

   function PEM_read_bio_DSA_PUBKEY
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/pem.h:491
   pragma Import (C, PEM_read_bio_DSA_PUBKEY, "PEM_read_bio_DSA_PUBKEY");

   function PEM_write_DSAparams (fp : access Interfaces.C_Streams.FILEs; x : access constant OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/pem.h:493
   pragma Import (C, PEM_write_DSAparams, "PEM_write_DSAparams");

   function PEM_write_bio_DSAparams (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access constant OpenSSL.Low_Level.dsa_h.dsa_st) return int;  -- openssl/pem.h:493
   pragma Import (C, PEM_write_bio_DSAparams, "PEM_write_bio_DSAparams");

   function PEM_read_DSAparams
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/pem.h:493
   pragma Import (C, PEM_read_DSAparams, "PEM_read_DSAparams");

   function PEM_read_bio_DSAparams
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.dsa_h.dsa_st;  -- openssl/pem.h:493
   pragma Import (C, PEM_read_bio_DSAparams, "PEM_read_bio_DSAparams");

   function PEM_write_DHparams (fp : access Interfaces.C_Streams.FILEs; x : access constant OpenSSL.Low_Level.dh_h.dh_st) return int;  -- openssl/pem.h:500
   pragma Import (C, PEM_write_DHparams, "PEM_write_DHparams");

   function PEM_write_bio_DHparams (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access constant OpenSSL.Low_Level.dh_h.dh_st) return int;  -- openssl/pem.h:500
   pragma Import (C, PEM_write_bio_DHparams, "PEM_write_bio_DHparams");

   function PEM_read_DHparams
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.dh_h.dh_st;  -- openssl/pem.h:500
   pragma Import (C, PEM_read_DHparams, "PEM_read_DHparams");

   function PEM_read_bio_DHparams
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.dh_h.dh_st;  -- openssl/pem.h:500
   pragma Import (C, PEM_read_bio_DHparams, "PEM_read_bio_DHparams");

   function PEM_write_PrivateKey
     (fp   : access Interfaces.C_Streams.FILEs;
      x    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      enc  : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      kstr : access unsigned_char;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:504
   pragma Import (C, PEM_write_PrivateKey, "PEM_write_PrivateKey");

   function PEM_write_bio_PrivateKey
     (bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      x    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      enc  : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      kstr : access unsigned_char;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:504
   pragma Import (C, PEM_write_bio_PrivateKey, "PEM_write_bio_PrivateKey");

   function PEM_read_PrivateKey
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pem.h:504
   pragma Import (C, PEM_read_PrivateKey, "PEM_read_PrivateKey");

   function PEM_read_bio_PrivateKey
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pem.h:504
   pragma Import (C, PEM_read_bio_PrivateKey, "PEM_read_bio_PrivateKey");

   function PEM_write_PUBKEY (fp : access Interfaces.C_Streams.FILEs; x : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/pem.h:506
   pragma Import (C, PEM_write_PUBKEY, "PEM_write_PUBKEY");

   function PEM_write_bio_PUBKEY (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/pem.h:506
   pragma Import (C, PEM_write_bio_PUBKEY, "PEM_write_bio_PUBKEY");

   function PEM_read_PUBKEY
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pem.h:506
   pragma Import (C, PEM_read_PUBKEY, "PEM_read_PUBKEY");

   function PEM_read_bio_PUBKEY
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pem.h:506
   pragma Import (C, PEM_read_bio_PUBKEY, "PEM_read_bio_PUBKEY");

   function PEM_write_bio_PKCS8PrivateKey_nid
     (bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      x    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      nid  : int;
      kstr : Interfaces.C.Strings.chars_ptr;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:508
   pragma Import (C, PEM_write_bio_PKCS8PrivateKey_nid, "PEM_write_bio_PKCS8PrivateKey_nid");

   function PEM_write_bio_PKCS8PrivateKey
     (arg1 : access OpenSSL.Low_Level.bio_h.bio_st;
      arg2 : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      arg3 : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      arg4 : Interfaces.C.Strings.chars_ptr;
      arg5 : int;
      arg6 : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      arg7 : System.Address) return int;  -- openssl/pem.h:511
   pragma Import (C, PEM_write_bio_PKCS8PrivateKey, "PEM_write_bio_PKCS8PrivateKey");

   function i2d_PKCS8PrivateKey_bio
     (bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      x    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      enc  : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      kstr : Interfaces.C.Strings.chars_ptr;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:513
   pragma Import (C, i2d_PKCS8PrivateKey_bio, "i2d_PKCS8PrivateKey_bio");

   function i2d_PKCS8PrivateKey_nid_bio
     (bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      x    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      nid  : int;
      kstr : Interfaces.C.Strings.chars_ptr;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:516
   pragma Import (C, i2d_PKCS8PrivateKey_nid_bio, "i2d_PKCS8PrivateKey_nid_bio");

   function d2i_PKCS8PrivateKey_bio
     (bp : access OpenSSL.Low_Level.bio_h.bio_st;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pem.h:519
   pragma Import (C, d2i_PKCS8PrivateKey_bio, "d2i_PKCS8PrivateKey_bio");

   function i2d_PKCS8PrivateKey_fp
     (fp   : access Interfaces.C_Streams.FILEs;
      x    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      enc  : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      kstr : Interfaces.C.Strings.chars_ptr;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:521
   pragma Import (C, i2d_PKCS8PrivateKey_fp, "i2d_PKCS8PrivateKey_fp");

   function i2d_PKCS8PrivateKey_nid_fp
     (fp   : access Interfaces.C_Streams.FILEs;
      x    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      nid  : int;
      kstr : Interfaces.C.Strings.chars_ptr;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:524
   pragma Import (C, i2d_PKCS8PrivateKey_nid_fp, "i2d_PKCS8PrivateKey_nid_fp");

   function PEM_write_PKCS8PrivateKey_nid
     (fp   : access Interfaces.C_Streams.FILEs;
      x    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      nid  : int;
      kstr : Interfaces.C.Strings.chars_ptr;
      klen : int;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:527
   pragma Import (C, PEM_write_PKCS8PrivateKey_nid, "PEM_write_PKCS8PrivateKey_nid");

   function d2i_PKCS8PrivateKey_fp
     (fp : access Interfaces.C_Streams.FILEs;
      x  : System.Address;
      cb : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u  : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pem.h:531
   pragma Import (C, d2i_PKCS8PrivateKey_fp, "d2i_PKCS8PrivateKey_fp");

   function PEM_write_PKCS8PrivateKey
     (fp   : access Interfaces.C_Streams.FILEs;
      x    : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      enc  : access constant OpenSSL.Low_Level.evp_h.evp_cipher_st;
      kstr : Interfaces.C.Strings.chars_ptr;
      klen : int;
      cd   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return int;  -- openssl/pem.h:533
   pragma Import (C, PEM_write_PKCS8PrivateKey, "PEM_write_PKCS8PrivateKey");

   function PEM_read_bio_Parameters (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pem.h:536
   pragma Import (C, PEM_read_bio_Parameters, "PEM_read_bio_Parameters");

   function PEM_write_bio_Parameters (bp : access OpenSSL.Low_Level.bio_h.bio_st; x : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/pem.h:537
   pragma Import (C, PEM_write_bio_Parameters, "PEM_write_bio_Parameters");

   function b2i_PrivateKey (c_in : System.Address; length : long) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pem.h:540
   pragma Import (C, b2i_PrivateKey, "b2i_PrivateKey");

   function b2i_PublicKey (c_in : System.Address; length : long) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pem.h:541
   pragma Import (C, b2i_PublicKey, "b2i_PublicKey");

   function b2i_PrivateKey_bio (c_in : access OpenSSL.Low_Level.bio_h.bio_st) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pem.h:542
   pragma Import (C, b2i_PrivateKey_bio, "b2i_PrivateKey_bio");

   function b2i_PublicKey_bio (c_in : access OpenSSL.Low_Level.bio_h.bio_st) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pem.h:543
   pragma Import (C, b2i_PublicKey_bio, "b2i_PublicKey_bio");

   function i2b_PrivateKey_bio (c_out : access OpenSSL.Low_Level.bio_h.bio_st; pk : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/pem.h:544
   pragma Import (C, i2b_PrivateKey_bio, "i2b_PrivateKey_bio");

   function i2b_PublicKey_bio (c_out : access OpenSSL.Low_Level.bio_h.bio_st; pk : access OpenSSL.Low_Level.evp_h.evp_pkey_st) return int;  -- openssl/pem.h:545
   pragma Import (C, i2b_PublicKey_bio, "i2b_PublicKey_bio");

   function b2i_PVK_bio
     (c_in : access OpenSSL.Low_Level.bio_h.bio_st;
      cb   : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u    : System.Address) return access OpenSSL.Low_Level.evp_h.evp_pkey_st;  -- openssl/pem.h:547
   pragma Import (C, b2i_PVK_bio, "b2i_PVK_bio");

   function i2b_PVK_bio
     (c_out    : access OpenSSL.Low_Level.bio_h.bio_st;
      pk       : access OpenSSL.Low_Level.evp_h.evp_pkey_st;
      enclevel : int;
      cb       : access function
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : int;
         arg4 : System.Address) return int;
      u        : System.Address) return int;  -- openssl/pem.h:548
   pragma Import (C, i2b_PVK_bio, "i2b_PVK_bio");

   procedure ERR_load_PEM_strings;  -- openssl/pem.h:557
   pragma Import (C, ERR_load_PEM_strings, "ERR_load_PEM_strings");

end OpenSSL.Low_Level.pem_h;
