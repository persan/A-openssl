with Interfaces.C; use Interfaces.C;
with OpenSSL.Low_Level.asn1_h;
--  with bn_h;
with OpenSSL.Low_Level.buffer_h;
with OpenSSL.Low_Level.evp_h;
with OpenSSL.Low_Level.dh_h;
with OpenSSL.Low_Level.dsa_h;
with OpenSSL.Low_Level.rsa_h;
with OpenSSL.Low_Level.rand_h;
with OpenSSL.Low_Level.x509_h;
with OpenSSL.Low_Level.x509_vfy_h;
with OpenSSL.Low_Level.x509v3_h;
with OpenSSL.Low_Level.conf_h;
with OpenSSL.Low_Level.ssl_h;
with OpenSSL.Low_Level.crypto_h;
with OpenSSL.Low_Level.ocsp_h;

package OpenSSL.Low_Level.ossl_typ_h is

   subtype ASN1_INTEGER is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_ENUMERATED is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_BIT_STRING is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_OCTET_STRING is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_PRINTABLESTRING is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_T61STRING is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_IA5STRING is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_GENERALSTRING is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_UNIVERSALSTRING is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_BMPSTRING is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_UTCTIME is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_TIME is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_GENERALIZEDTIME is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_VISIBLESTRING is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_UTF8STRING is OpenSSL.Low_Level.asn1_h.asn1_string_st;

   subtype ASN1_BOOLEAN is int;  -- openssl/ossl_typ.h:94

   subtype ASN1_NULL is int;  -- openssl/ossl_typ.h:95

   --  skipped empty struct asn1_pctx_st

   --  skipped empty struct ASN1_PCTX

   subtype BIGNUM is bn_h.bignum_st;

   --  skipped empty struct bignum_ctx

   --  skipped empty struct BN_CTX

   --  skipped empty struct bn_blinding_st

   --  skipped empty struct BN_BLINDING

   subtype BN_MONT_CTX is bn_h.bn_mont_ctx_st;

   subtype BN_RECP_CTX is bn_h.bn_recp_ctx_st;

   subtype BN_GENCB is bn_h.bn_gencb_st;

   subtype BUF_MEM is OpenSSL.Low_Level.buffer_h.buf_mem_st;

   subtype EVP_CIPHER is OpenSSL.Low_Level.evp_h.evp_cipher_st;

   subtype EVP_CIPHER_CTX is OpenSSL.Low_Level.evp_h.evp_cipher_ctx_st;

   subtype EVP_MD is OpenSSL.Low_Level.evp_h.env_md_st;

   subtype EVP_MD_CTX is OpenSSL.Low_Level.evp_h.env_md_ctx_st;

   subtype EVP_PKEY is OpenSSL.Low_Level.evp_h.evp_pkey_st;

   --  skipped empty struct evp_pkey_asn1_method_st

   --  skipped empty struct EVP_PKEY_ASN1_METHOD

   --  skipped empty struct evp_pkey_method_st

   --  skipped empty struct EVP_PKEY_METHOD

   --  skipped empty struct evp_pkey_ctx_st

   --  skipped empty struct EVP_PKEY_CTX

   subtype DH is OpenSSL.Low_Level.dh_h.dh_st;

   subtype DSA is OpenSSL.Low_Level.dsa_h.dsa_st;

   subtype RSA is OpenSSL.Low_Level.rsa_h.rsa_st;

   subtype RSA_METHOD is OpenSSL.Low_Level.rsa_h.rsa_meth_st;

   subtype RAND_METHOD is OpenSSL.Low_Level.rand_h.rand_meth_st;

   --  skipped empty struct ecdh_method

   --  skipped empty struct ecdsa_method

   subtype X509 is OpenSSL.Low_Level.x509_h.x509_st;

   subtype X509_ALGOR is OpenSSL.Low_Level.x509_h.X509_algor_st;

   subtype X509_CRL is OpenSSL.Low_Level.x509_h.X509_crl_st;

   --  skipped empty struct x509_crl_method_st

   --  skipped empty struct X509_CRL_METHOD

   subtype X509_REVOKED is OpenSSL.Low_Level.x509_h.x509_revoked_st;

   subtype X509_NAME is OpenSSL.Low_Level.x509_h.X509_name_st;

   subtype X509_PUBKEY is OpenSSL.Low_Level.x509_h.X509_pubkey_st;

   subtype X509_STORE is OpenSSL.Low_Level.x509_vfy_h.x509_store_st;

   subtype X509_STORE_CTX is OpenSSL.Low_Level.x509_vfy_h.x509_store_ctx_st;

   subtype PKCS8_PRIV_KEY_INFO is OpenSSL.Low_Level.x509_h.pkcs8_priv_key_info_st;

   subtype X509V3_CTX is OpenSSL.Low_Level.x509v3_h.v3_ext_ctx;

   subtype CONF is OpenSSL.Low_Level.conf_h.conf_st;

   --  skipped empty struct store_st

   --  skipped empty struct STORE

   --  skipped empty struct store_method_st

   --  skipped empty struct STORE_METHOD

   --  skipped empty struct ui_st

   --  skipped empty struct UI

   --  skipped empty struct ui_method_st

   --  skipped empty struct UI_METHOD

   --  skipped empty struct st_ERR_FNS

   --  skipped empty struct ERR_FNS

   --  skipped empty struct engine_st

   --  skipped empty struct ENGINE

   subtype SSL is OpenSSL.Low_Level.ssl_h.ssl_st;

   subtype SSL_CTX is OpenSSL.Low_Level.ssl_h.ssl_ctx_st;

   --  skipped empty struct X509_POLICY_NODE_st

   --  skipped empty struct X509_POLICY_NODE

   --  skipped empty struct X509_POLICY_LEVEL_st

   --  skipped empty struct X509_POLICY_LEVEL

   --  skipped empty struct X509_POLICY_TREE_st

   --  skipped empty struct X509_POLICY_TREE

   --  skipped empty struct X509_POLICY_CACHE_st

   --  skipped empty struct X509_POLICY_CACHE

   subtype AUTHORITY_KEYID is OpenSSL.Low_Level.x509v3_h.AUTHORITY_KEYID_st;

   subtype DIST_POINT is OpenSSL.Low_Level.x509v3_h.DIST_POINT_st;

   subtype ISSUING_DIST_POINT is OpenSSL.Low_Level.x509v3_h.ISSUING_DIST_POINT_st;

   subtype NAME_CONSTRAINTS is OpenSSL.Low_Level.x509v3_h.NAME_CONSTRAINTS_st;

   subtype CRYPTO_EX_DATA is OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;

   --  skipped function type CRYPTO_EX_new

   --  skipped function type CRYPTO_EX_free

   --  skipped function type CRYPTO_EX_dup

   --  skipped empty struct ocsp_req_ctx_st

   --  skipped empty struct OCSP_REQ_CTX

   subtype OCSP_RESPONSE is OpenSSL.Low_Level.ocsp_h.ocsp_response_st;

   subtype OCSP_RESPID is OpenSSL.Low_Level.ocsp_h.ocsp_responder_id_st;

end OpenSSL.Low_Level.ossl_typ_h;
