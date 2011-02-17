with Interfaces.C; use Interfaces.C;
with OpenSSL.Low_Level.stack_h;
with System;
with Interfaces.C.Strings;
limited with OpenSSL.Low_Level.asn1t_h;
with OpenSSL.Low_Level.bio_h;
with OpenSSL.Low_Level.safestack_h;
with Interfaces.C_Streams;
limited with OpenSSL.Low_Level.x509_h;
package OpenSSL.Low_Level.asn1_h is

   package defs is

      V_ASN1_UNIVERSAL        : constant := 16#00#;  --  openssl/asn1.h:86
      V_ASN1_APPLICATION      : constant := 16#40#;  --  openssl/asn1.h:87
      V_ASN1_CONTEXT_SPECIFIC : constant := 16#80#;  --  openssl/asn1.h:88
      V_ASN1_PRIVATE          : constant := 16#c0#;  --  openssl/asn1.h:89

      V_ASN1_CONSTRUCTED      : constant := 16#20#;  --  openssl/asn1.h:91
      V_ASN1_PRIMITIVE_TAG    : constant := 16#1f#;  --  openssl/asn1.h:92
      V_ASN1_PRIMATIVE_TAG    : constant := 16#1f#;  --  openssl/asn1.h:93

      V_ASN1_APP_CHOOSE       : constant := -2;  --  openssl/asn1.h:95
      V_ASN1_OTHER            : constant := -3;  --  openssl/asn1.h:96
      V_ASN1_ANY              : constant := -4;  --  openssl/asn1.h:97

      V_ASN1_NEG              : constant := 16#100#;  --  openssl/asn1.h:99

      V_ASN1_UNDEF            : constant := -1;  --  openssl/asn1.h:101
      V_ASN1_EOC              : constant := 0;  --  openssl/asn1.h:102
      V_ASN1_BOOLEAN          : constant := 1;  --  openssl/asn1.h:103
      V_ASN1_INTEGER          : constant := 2;  --  openssl/asn1.h:104
      --  unsupported macro: V_ASN1_NEG_INTEGER (2 | V_ASN1_NEG)

      V_ASN1_BIT_STRING       : constant := 3;  --  openssl/asn1.h:106
      V_ASN1_OCTET_STRING     : constant := 4;  --  openssl/asn1.h:107
      V_ASN1_NULL             : constant := 5;  --  openssl/asn1.h:108
      V_ASN1_OBJECT           : constant := 6;  --  openssl/asn1.h:109
      V_ASN1_OBJECT_DESCRIPTOR : constant := 7;  --  openssl/asn1.h:110
      V_ASN1_EXTERNAL         : constant := 8;  --  openssl/asn1.h:111
      V_ASN1_REAL             : constant := 9;  --  openssl/asn1.h:112
      V_ASN1_ENUMERATED       : constant := 10;  --  openssl/asn1.h:113
      --  unsupported macro: V_ASN1_NEG_ENUMERATED (10 | V_ASN1_NEG)

      V_ASN1_UTF8STRING       : constant := 12;  --  openssl/asn1.h:115
      V_ASN1_SEQUENCE         : constant := 16;  --  openssl/asn1.h:116
      V_ASN1_SET              : constant := 17;  --  openssl/asn1.h:117
      V_ASN1_NUMERICSTRING    : constant := 18;  --  openssl/asn1.h:118
      V_ASN1_PRINTABLESTRING  : constant := 19;  --  openssl/asn1.h:119
      V_ASN1_T61STRING        : constant := 20;  --  openssl/asn1.h:120
      V_ASN1_TELETEXSTRING    : constant := 20;  --  openssl/asn1.h:121
      V_ASN1_VIDEOTEXSTRING   : constant := 21;  --  openssl/asn1.h:122
      V_ASN1_IA5STRING        : constant := 22;  --  openssl/asn1.h:123
      V_ASN1_UTCTIME          : constant := 23;  --  openssl/asn1.h:124
      V_ASN1_GENERALIZEDTIME  : constant := 24;  --  openssl/asn1.h:125
      V_ASN1_GRAPHICSTRING    : constant := 25;  --  openssl/asn1.h:126
      V_ASN1_ISO64STRING      : constant := 26;  --  openssl/asn1.h:127
      V_ASN1_VISIBLESTRING    : constant := 26;  --  openssl/asn1.h:128
      V_ASN1_GENERALSTRING    : constant := 27;  --  openssl/asn1.h:129
      V_ASN1_UNIVERSALSTRING  : constant := 28;  --  openssl/asn1.h:130
      V_ASN1_BMPSTRING        : constant := 30;  --  openssl/asn1.h:131

      B_ASN1_NUMERICSTRING    : constant := 16#0001#;  --  openssl/asn1.h:134
      B_ASN1_PRINTABLESTRING  : constant := 16#0002#;  --  openssl/asn1.h:135
      B_ASN1_T61STRING        : constant := 16#0004#;  --  openssl/asn1.h:136
      B_ASN1_TELETEXSTRING    : constant := 16#0004#;  --  openssl/asn1.h:137
      B_ASN1_VIDEOTEXSTRING   : constant := 16#0008#;  --  openssl/asn1.h:138
      B_ASN1_IA5STRING        : constant := 16#0010#;  --  openssl/asn1.h:139
      B_ASN1_GRAPHICSTRING    : constant := 16#0020#;  --  openssl/asn1.h:140
      B_ASN1_ISO64STRING      : constant := 16#0040#;  --  openssl/asn1.h:141
      B_ASN1_VISIBLESTRING    : constant := 16#0040#;  --  openssl/asn1.h:142
      B_ASN1_GENERALSTRING    : constant := 16#0080#;  --  openssl/asn1.h:143
      B_ASN1_UNIVERSALSTRING  : constant := 16#0100#;  --  openssl/asn1.h:144
      B_ASN1_OCTET_STRING     : constant := 16#0200#;  --  openssl/asn1.h:145
      B_ASN1_BIT_STRING       : constant := 16#0400#;  --  openssl/asn1.h:146
      B_ASN1_BMPSTRING        : constant := 16#0800#;  --  openssl/asn1.h:147
      B_ASN1_UNKNOWN          : constant := 16#1000#;  --  openssl/asn1.h:148
      B_ASN1_UTF8STRING       : constant := 16#2000#;  --  openssl/asn1.h:149
      B_ASN1_UTCTIME          : constant := 16#4000#;  --  openssl/asn1.h:150
      B_ASN1_GENERALIZEDTIME  : constant := 16#8000#;  --  openssl/asn1.h:151
      B_ASN1_SEQUENCE         : constant := 16#10000#;  --  openssl/asn1.h:152

      MBSTRING_FLAG           : constant := 16#1000#;  --  openssl/asn1.h:155
      --  unsupported macro: MBSTRING_UTF8 (MBSTRING_FLAG)
      --  unsupported macro: MBSTRING_ASC (MBSTRING_FLAG|1)
      --  unsupported macro: MBSTRING_BMP (MBSTRING_FLAG|2)
      --  unsupported macro: MBSTRING_UNIV (MBSTRING_FLAG|4)

      SMIME_OLDMIME           : constant := 16#400#;  --  openssl/asn1.h:161
      SMIME_CRLFEOL           : constant := 16#800#;  --  openssl/asn1.h:162
      SMIME_STREAM            : constant := 16#1000#;  --  openssl/asn1.h:163

      ASN1_OBJECT_FLAG_DYNAMIC : constant := 16#01#;  --  openssl/asn1.h:207
      ASN1_OBJECT_FLAG_CRITICAL : constant := 16#02#;  --  openssl/asn1.h:208
      ASN1_OBJECT_FLAG_DYNAMIC_STRINGS : constant := 16#04#;  --  openssl/asn1.h:209
      ASN1_OBJECT_FLAG_DYNAMIC_DATA : constant := 16#08#;  --  openssl/asn1.h:210

      ASN1_STRING_FLAG_BITS_LEFT : constant := 16#08#;  --  openssl/asn1.h:220

      ASN1_STRING_FLAG_NDEF   : constant := 16#010#;  --  openssl/asn1.h:225

      ASN1_STRING_FLAG_CONT   : constant := 16#020#;  --  openssl/asn1.h:232

      ASN1_STRING_FLAG_MSTRING : constant := 16#040#;  --  openssl/asn1.h:236

      ASN1_LONG_UNDEF         : constant := 16#7fffffff#;  --  openssl/asn1.h:263

      STABLE_FLAGS_MALLOC     : constant := 16#01#;  --  openssl/asn1.h:265
      STABLE_NO_MASK          : constant := 16#02#;  --  openssl/asn1.h:266
      --  unsupported macro: DIRSTRING_TYPE (B_ASN1_PRINTABLESTRING|B_ASN1_T61STRING|B_ASN1_BMPSTRING|B_ASN1_UTF8STRING)
      --  unsupported macro: PKCS9STRING_TYPE (DIRSTRING_TYPE|B_ASN1_IA5STRING)

      ub_name                 : constant := 32768;  --  openssl/asn1.h:283
      ub_common_name          : constant := 64;  --  openssl/asn1.h:284
      ub_locality_name        : constant := 128;  --  openssl/asn1.h:285
      ub_state_name           : constant := 128;  --  openssl/asn1.h:286
      ub_organization_name    : constant := 64;  --  openssl/asn1.h:287
      ub_organization_unit_name : constant := 64;  --  openssl/asn1.h:288
      ub_title                : constant := 64;  --  openssl/asn1.h:289
      ub_email_address        : constant := 128;  --  openssl/asn1.h:290
      --  arg-macro: procedure DECLARE_ASN1_FUNCTIONS (type)
      --    DECLARE_ASN1_FUNCTIONS_name(type, type)
      --  arg-macro: procedure DECLARE_ASN1_ALLOC_FUNCTIONS (type)
      --    DECLARE_ASN1_ALLOC_FUNCTIONS_name(type, type)
      --  arg-macro: procedure DECLARE_ASN1_FUNCTIONS_name (type, name)
      --    DECLARE_ASN1_ALLOC_FUNCTIONS_name(type, name) DECLARE_ASN1_ENCODE_FUNCTIONS(type, name, name)
      --  arg-macro: procedure DECLARE_ASN1_FUNCTIONS_fname (type, itname, nDECLARE_ASN1_ALLOC_FUNCTIONS_name(type, name) DECLARE_ASN1_ENCODE_FUNCTIONS(type, itname, name)
      --    DECLARE_ASN1_ALLOC_FUNCTIONS_name(type, name) DECLARE_ASN1_ENCODE_FUNCTIONS(type, itname, name)
      --  unsupported macro: DECLARE_ASN1_ENCODE_FUNCTIONS(type,itname,name) type *d2i_ ##name(type **a, const unsigned char **in, long len); int i2d_ ##name(type *a, unsigned char **out); DECLARE_ASN1_ITEM(itname)
      --  unsupported macro: DECLARE_ASN1_ENCODE_FUNCTIONS_const(type,name) type *d2i_ ##name(type **a, const unsigned char **in, long len); int i2d_ ##name(const type *a, unsigned char **out); DECLARE_ASN1_ITEM(name)
      --  unsupported macro: DECLARE_ASN1_NDEF_FUNCTION(name) int i2d_ ##name ##_NDEF(name *a, unsigned char **out);
      --  arg-macro: procedure DECLARE_ASN1_FUNCTIONS_const (name)
      --    DECLARE_ASN1_ALLOC_FUNCTIONS(name) DECLARE_ASN1_ENCODE_FUNCTIONS_const(name, name)
      --  unsupported macro: DECLARE_ASN1_ALLOC_FUNCTIONS_name(type,name) type *name ##_new(void); void name ##_free(type *a);
      --  arg-macro: procedure DECLARE_ASN1_PRINT_FUNCTION (stname)
      --    DECLARE_ASN1_PRINT_FUNCTION_fname(stname, stname)
      --  unsupported macro: DECLARE_ASN1_PRINT_FUNCTION_fname(stname,fname) int fname ##_print_ctx(BIO *out, stname *x, int indent, const ASN1_PCTX *pctx);
      --  arg-macro: procedure D2I_OF (type)
      --    type *(*)(type **,const unsigned char **,long)
      --  arg-macro: procedure I2D_OF (type)
      --    int (*)(type *,unsigned char **)
      --  arg-macro: procedure I2D_OF_const (type)
      --    int (*)(const type *,unsigned char **)
      --  arg-macro: function CHECKED_D2I_OF (type, d2i)
      --    return (d2i_of_void*) (1 ? d2i : ((D2I_OF(type))0));
      --  arg-macro: function CHECKED_I2D_OF (type, i2d)
      --    return (i2d_of_void*) (1 ? i2d : ((I2D_OF(type))0));
      --  arg-macro: function CHECKED_NEW_OF (type, xnew)
      --    return (void *(*)(void)) (1 ? xnew : ((type *(*)(void))0));
      --  arg-macro: function CHECKED_PTR_OF (type, p)
      --    return (void*) (1 ? p : (type*)0);
      --  arg-macro: function CHECKED_PPTR_OF (type, p)
      --    return (void**) (1 ? p : (type**)0);
      --  unsupported macro: TYPEDEF_D2I_OF(type) typedef type *d2i_of_ ##type(type **,const unsigned char **,long)
      --  unsupported macro: TYPEDEF_I2D_OF(type) typedef int i2d_of_ ##type(type *,unsigned char **)
      --  arg-macro: procedure TYPEDEF_D2I2D_OF (type)
      --    TYPEDEF_D2I_OF(type); TYPEDEF_I2D_OF(type)
      --  arg-macro: function ASN1_ITEM_ptr (iptr)
      --    return iptr;
      --  unsupported macro: ASN1_ITEM_ref(iptr) (&(iptr ##_it))
      --  unsupported macro: ASN1_ITEM_rptr(ref) (&(ref ##_it))
      --  unsupported macro: DECLARE_ASN1_ITEM(name) OPENSSL_EXTERN const ASN1_ITEM name ##_it;

      ASN1_STRFLGS_ESC_2253   : constant := 1;  --  openssl/asn1.h:445
      ASN1_STRFLGS_ESC_CTRL   : constant := 2;  --  openssl/asn1.h:446
      ASN1_STRFLGS_ESC_MSB    : constant := 4;  --  openssl/asn1.h:447

      ASN1_STRFLGS_ESC_QUOTE  : constant := 8;  --  openssl/asn1.h:455

      CHARTYPE_PRINTABLESTRING : constant := 16#10#;  --  openssl/asn1.h:461

      CHARTYPE_FIRST_ESC_2253 : constant := 16#20#;  --  openssl/asn1.h:463

      CHARTYPE_LAST_ESC_2253  : constant := 16#40#;  --  openssl/asn1.h:465

      ASN1_STRFLGS_UTF8_CONVERT : constant := 16#10#;  --  openssl/asn1.h:475

      ASN1_STRFLGS_IGNORE_TYPE : constant := 16#20#;  --  openssl/asn1.h:482

      ASN1_STRFLGS_SHOW_TYPE  : constant := 16#40#;  --  openssl/asn1.h:485

      ASN1_STRFLGS_DUMP_ALL   : constant := 16#80#;  --  openssl/asn1.h:495
      ASN1_STRFLGS_DUMP_UNKNOWN : constant := 16#100#;  --  openssl/asn1.h:496

      ASN1_STRFLGS_DUMP_DER   : constant := 16#200#;  --  openssl/asn1.h:503
      --  unsupported macro: ASN1_STRFLGS_RFC2253 (ASN1_STRFLGS_ESC_2253 | ASN1_STRFLGS_ESC_CTRL | ASN1_STRFLGS_ESC_MSB | ASN1_STRFLGS_UTF8_CONVERT | ASN1_STRFLGS_DUMP_UNKNOWN | ASN1_STRFLGS_DUMP_DER)
      --  arg-macro: function M_ASN1_STRING_length (x)
      --    return (x).length;
      --  arg-macro: function M_ASN1_STRING_length_set (x, n)
      --    return (x).length := (n);
      --  arg-macro: function M_ASN1_STRING_type (x)
      --    return (x).type;
      --  arg-macro: function M_ASN1_STRING_data (x)
      --    return (x).data;
      --  arg-macro: function M_ASN1_BIT_STRING_new ()
      --    return ASN1_BIT_STRING *) ASN1_STRING_type_new(V_ASN1_BIT_STRING;
      --  arg-macro: procedure M_ASN1_BIT_STRING_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: function M_ASN1_BIT_STRING_dup (a)
      --    return ASN1_BIT_STRING *) ASN1_STRING_dup((const ASN1_STRING *)a;
      --  arg-macro: procedure M_ASN1_BIT_STRING_cmp (a, b)
      --    ASN1_STRING_cmp( (const ASN1_STRING *)a,(const ASN1_STRING *)b)
      --  arg-macro: procedure M_ASN1_BIT_STRING_set (a, b, c)
      --    ASN1_STRING_set((ASN1_STRING *)a,b,c)
      --  arg-macro: function M_ASN1_INTEGER_new ()
      --    return ASN1_INTEGER *) ASN1_STRING_type_new(V_ASN1_INTEGER;
      --  arg-macro: procedure M_ASN1_INTEGER_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: function M_ASN1_INTEGER_dup (a)
      --    return ASN1_INTEGER *) ASN1_STRING_dup((const ASN1_STRING *)a;
      --  arg-macro: procedure M_ASN1_INTEGER_cmp (a, b)
      --    ASN1_STRING_cmp( (const ASN1_STRING *)a,(const ASN1_STRING *)b)
      --  arg-macro: function M_ASN1_ENUMERATED_new ()
      --    return ASN1_ENUMERATED *) ASN1_STRING_type_new(V_ASN1_ENUMERATED;
      --  arg-macro: procedure M_ASN1_ENUMERATED_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: function M_ASN1_ENUMERATED_dup (a)
      --    return ASN1_ENUMERATED *) ASN1_STRING_dup((const ASN1_STRING *)a;
      --  arg-macro: procedure M_ASN1_ENUMERATED_cmp (a, b)
      --    ASN1_STRING_cmp( (const ASN1_STRING *)a,(const ASN1_STRING *)b)
      --  arg-macro: function M_ASN1_OCTET_STRING_new ()
      --    return ASN1_OCTET_STRING *) ASN1_STRING_type_new(V_ASN1_OCTET_STRING;
      --  arg-macro: procedure M_ASN1_OCTET_STRING_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: function M_ASN1_OCTET_STRING_dup (a)
      --    return ASN1_OCTET_STRING *) ASN1_STRING_dup((const ASN1_STRING *)a;
      --  arg-macro: procedure M_ASN1_OCTET_STRING_cmp (a, b)
      --    ASN1_STRING_cmp( (const ASN1_STRING *)a,(const ASN1_STRING *)b)
      --  arg-macro: procedure M_ASN1_OCTET_STRING_set (a, b, c)
      --    ASN1_STRING_set((ASN1_STRING *)a,b,c)
      --  arg-macro: procedure M_ASN1_OCTET_STRING_print (a, b)
      --    ASN1_STRING_print(a,(ASN1_STRING *)b)
      --  arg-macro: procedure M_i2d_ASN1_OCTET_STRING (a, pp)
      --    i2d_ASN1_bytes((ASN1_STRING *)a,pp,V_ASN1_OCTET_STRING, V_ASN1_UNIVERSAL)
      --  unsupported macro: B_ASN1_TIME B_ASN1_UTCTIME | B_ASN1_GENERALIZEDTIME
      --  unsupported macro: B_ASN1_PRINTABLE B_ASN1_NUMERICSTRING| B_ASN1_PRINTABLESTRING| B_ASN1_T61STRING| B_ASN1_IA5STRING| B_ASN1_BIT_STRING| B_ASN1_UNIVERSALSTRING| B_ASN1_BMPSTRING| B_ASN1_UTF8STRING| B_ASN1_SEQUENCE| B_ASN1_UNKNOWN
      --  unsupported macro: B_ASN1_DIRECTORYSTRING B_ASN1_PRINTABLESTRING| B_ASN1_TELETEXSTRING| B_ASN1_BMPSTRING| B_ASN1_UNIVERSALSTRING| B_ASN1_UTF8STRING
      --  unsupported macro: B_ASN1_DISPLAYTEXT B_ASN1_IA5STRING| B_ASN1_VISIBLESTRING| B_ASN1_BMPSTRING| B_ASN1_UTF8STRING
      --  arg-macro: procedure M_ASN1_PRINTABLE_new ()
      --    ASN1_STRING_type_new(V_ASN1_T61STRING)
      --  arg-macro: procedure M_ASN1_PRINTABLE_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: procedure M_i2d_ASN1_PRINTABLE (a, pp)
      --    i2d_ASN1_bytes((ASN1_STRING *)a, pp,a.type,V_ASN1_UNIVERSAL)
      --  arg-macro: procedure M_d2i_ASN1_PRINTABLE (a, pp, l)
      --    d2i_ASN1_type_bytes((ASN1_STRING **)a,pp,l, B_ASN1_PRINTABLE)
      --  arg-macro: procedure M_DIRECTORYSTRING_new ()
      --    ASN1_STRING_type_new(V_ASN1_PRINTABLESTRING)
      --  arg-macro: procedure M_DIRECTORYSTRING_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: procedure M_i2d_DIRECTORYSTRING (a, pp)
      --    i2d_ASN1_bytes((ASN1_STRING *)a, pp,a.type,V_ASN1_UNIVERSAL)
      --  arg-macro: procedure M_d2i_DIRECTORYSTRING (a, pp, l)
      --    d2i_ASN1_type_bytes((ASN1_STRING **)a,pp,l, B_ASN1_DIRECTORYSTRING)
      --  arg-macro: procedure M_DISPLAYTEXT_new ()
      --    ASN1_STRING_type_new(V_ASN1_VISIBLESTRING)
      --  arg-macro: procedure M_DISPLAYTEXT_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: procedure M_i2d_DISPLAYTEXT (a, pp)
      --    i2d_ASN1_bytes((ASN1_STRING *)a, pp,a.type,V_ASN1_UNIVERSAL)
      --  arg-macro: procedure M_d2i_DISPLAYTEXT (a, pp, l)
      --    d2i_ASN1_type_bytes((ASN1_STRING **)a,pp,l, B_ASN1_DISPLAYTEXT)
      --  arg-macro: function M_ASN1_PRINTABLESTRING_new ()
      --    return ASN1_PRINTABLESTRING *) ASN1_STRING_type_new(V_ASN1_PRINTABLESTRING;
      --  arg-macro: procedure M_ASN1_PRINTABLESTRING_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: procedure M_i2d_ASN1_PRINTABLESTRING (a, pp)
      --    i2d_ASN1_bytes((ASN1_STRING *)a,pp,V_ASN1_PRINTABLESTRING, V_ASN1_UNIVERSAL)
      --  arg-macro: function M_d2i_ASN1_PRINTABLESTRING (a, pp, l)
      --    return ASN1_PRINTABLESTRING *)d2i_ASN1_type_bytes ((ASN1_STRING **)a,pp,l,B_ASN1_PRINTABLESTRING;
      --  arg-macro: function M_ASN1_T61STRING_new ()
      --    return ASN1_T61STRING *) ASN1_STRING_type_new(V_ASN1_T61STRING;
      --  arg-macro: procedure M_ASN1_T61STRING_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: procedure M_i2d_ASN1_T61STRING (a, pp)
      --    i2d_ASN1_bytes((ASN1_STRING *)a,pp,V_ASN1_T61STRING, V_ASN1_UNIVERSAL)
      --  arg-macro: function M_d2i_ASN1_T61STRING (a, pp, l)
      --    return ASN1_T61STRING *)d2i_ASN1_type_bytes ((ASN1_STRING **)a,pp,l,B_ASN1_T61STRING;
      --  arg-macro: function M_ASN1_IA5STRING_new ()
      --    return ASN1_IA5STRING *) ASN1_STRING_type_new(V_ASN1_IA5STRING;
      --  arg-macro: procedure M_ASN1_IA5STRING_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: function M_ASN1_IA5STRING_dup (a)
      --    return ASN1_IA5STRING *)ASN1_STRING_dup((const ASN1_STRING *)a;
      --  arg-macro: procedure M_i2d_ASN1_IA5STRING (a, pp)
      --    i2d_ASN1_bytes((ASN1_STRING *)a,pp,V_ASN1_IA5STRING, V_ASN1_UNIVERSAL)
      --  arg-macro: function M_d2i_ASN1_IA5STRING (a, pp, l)
      --    return ASN1_IA5STRING *)d2i_ASN1_type_bytes((ASN1_STRING **)a,pp,l, B_ASN1_IA5STRING;
      --  arg-macro: function M_ASN1_UTCTIME_new ()
      --    return ASN1_UTCTIME *) ASN1_STRING_type_new(V_ASN1_UTCTIME;
      --  arg-macro: procedure M_ASN1_UTCTIME_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: function M_ASN1_UTCTIME_dup (a)
      --    return ASN1_UTCTIME *) ASN1_STRING_dup((const ASN1_STRING *)a;
      --  arg-macro: function M_ASN1_GENERALIZEDTIME_new ()
      --    return ASN1_GENERALIZEDTIME *) ASN1_STRING_type_new(V_ASN1_GENERALIZEDTIME;
      --  arg-macro: procedure M_ASN1_GENERALIZEDTIME_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: function M_ASN1_GENERALIZEDTIME_dup (a)
      --    return ASN1_GENERALIZEDTIME *)ASN1_STRING_dup( (const ASN1_STRING *)a;
      --  arg-macro: function M_ASN1_TIME_new ()
      --    return ASN1_TIME *) ASN1_STRING_type_new(V_ASN1_UTCTIME;
      --  arg-macro: procedure M_ASN1_TIME_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: function M_ASN1_TIME_dup (a)
      --    return ASN1_TIME *) ASN1_STRING_dup((const ASN1_STRING *)a;
      --  arg-macro: function M_ASN1_GENERALSTRING_new ()
      --    return ASN1_GENERALSTRING *) ASN1_STRING_type_new(V_ASN1_GENERALSTRING;
      --  arg-macro: procedure M_ASN1_GENERALSTRING_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: procedure M_i2d_ASN1_GENERALSTRING (a, pp)
      --    i2d_ASN1_bytes((ASN1_STRING *)a,pp,V_ASN1_GENERALSTRING, V_ASN1_UNIVERSAL)
      --  arg-macro: function M_d2i_ASN1_GENERALSTRING (a, pp, l)
      --    return ASN1_GENERALSTRING *)d2i_ASN1_type_bytes ((ASN1_STRING **)a,pp,l,B_ASN1_GENERALSTRING;
      --  arg-macro: function M_ASN1_UNIVERSALSTRING_new ()
      --    return ASN1_UNIVERSALSTRING *) ASN1_STRING_type_new(V_ASN1_UNIVERSALSTRING;
      --  arg-macro: procedure M_ASN1_UNIVERSALSTRING_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: procedure M_i2d_ASN1_UNIVERSALSTRING (a, pp)
      --    i2d_ASN1_bytes((ASN1_STRING *)a,pp,V_ASN1_UNIVERSALSTRING, V_ASN1_UNIVERSAL)
      --  arg-macro: function M_d2i_ASN1_UNIVERSALSTRING (a, pp, l)
      --    return ASN1_UNIVERSALSTRING *)d2i_ASN1_type_bytes ((ASN1_STRING **)a,pp,l,B_ASN1_UNIVERSALSTRING;
      --  arg-macro: function M_ASN1_BMPSTRING_new ()
      --    return ASN1_BMPSTRING *) ASN1_STRING_type_new(V_ASN1_BMPSTRING;
      --  arg-macro: procedure M_ASN1_BMPSTRING_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: procedure M_i2d_ASN1_BMPSTRING (a, pp)
      --    i2d_ASN1_bytes((ASN1_STRING *)a,pp,V_ASN1_BMPSTRING, V_ASN1_UNIVERSAL)
      --  arg-macro: function M_d2i_ASN1_BMPSTRING (a, pp, l)
      --    return ASN1_BMPSTRING *)d2i_ASN1_type_bytes ((ASN1_STRING **)a,pp,l,B_ASN1_BMPSTRING;
      --  arg-macro: function M_ASN1_VISIBLESTRING_new ()
      --    return ASN1_VISIBLESTRING *) ASN1_STRING_type_new(V_ASN1_VISIBLESTRING;
      --  arg-macro: procedure M_ASN1_VISIBLESTRING_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: procedure M_i2d_ASN1_VISIBLESTRING (a, pp)
      --    i2d_ASN1_bytes((ASN1_STRING *)a,pp,V_ASN1_VISIBLESTRING, V_ASN1_UNIVERSAL)
      --  arg-macro: function M_d2i_ASN1_VISIBLESTRING (a, pp, l)
      --    return ASN1_VISIBLESTRING *)d2i_ASN1_type_bytes ((ASN1_STRING **)a,pp,l,B_ASN1_VISIBLESTRING;
      --  arg-macro: function M_ASN1_UTF8STRING_new ()
      --    return ASN1_UTF8STRING *) ASN1_STRING_type_new(V_ASN1_UTF8STRING;
      --  arg-macro: procedure M_ASN1_UTF8STRING_free (a)
      --    ASN1_STRING_free((ASN1_STRING *)a)
      --  arg-macro: procedure M_i2d_ASN1_UTF8STRING (a, pp)
      --    i2d_ASN1_bytes((ASN1_STRING *)a,pp,V_ASN1_UTF8STRING, V_ASN1_UNIVERSAL)
      --  arg-macro: function M_d2i_ASN1_UTF8STRING (a, pp, l)
      --    return ASN1_UTF8STRING *)d2i_ASN1_type_bytes ((ASN1_STRING **)a,pp,l,B_ASN1_UTF8STRING;

      IS_SEQUENCE             : constant := 0;  --  openssl/asn1.h:772
      IS_SET                  : constant := 1;  --  openssl/asn1.h:773
      --  arg-macro: function ASN1_dup_of (type, i2d, d2i,((type*)ASN1_dup(CHECKED_I2D_OF(type, i2d), CHECKED_D2I_OF(type, d2i), CHECKED_PTR_OF(type, x))
      --    return (type*)ASN1_dup(CHECKED_I2D_OF(type, i2d), CHECKED_D2I_OF(type, d2i), CHECKED_PTR_OF(type, x));
      --  arg-macro: function ASN1_dup_of_const (type, i2d, d2i,((type*)ASN1_dup(CHECKED_I2D_OF(const type, i2d), CHECKED_D2I_OF(type, d2i), CHECKED_PTR_OF(const type, x))
      --    return (type*)ASN1_dup(CHECKED_I2D_OF(const type, i2d), CHECKED_D2I_OF(type, d2i), CHECKED_PTR_OF(const type, x));
      --  arg-macro: function M_ASN1_new_of (type)
      --    return type *)ASN1_item_new(ASN1_ITEM_rptr(type);
      --  arg-macro: procedure M_ASN1_free_of (x, type)
      --    ASN1_item_free(CHECKED_PTR_OF(type, x), ASN1_ITEM_rptr(type))
      --  arg-macro: function ASN1_d2i_fp_of (type, xnew, d2i((type*)ASN1_d2i_fp(CHECKED_NEW_OF(type, xnew), CHECKED_D2I_OF(type, d2i), in, CHECKED_PPTR_OF(type, x))
      --    return (type*)ASN1_d2i_fp(CHECKED_NEW_OF(type, xnew), CHECKED_D2I_OF(type, d2i), in, CHECKED_PPTR_OF(type, x));
      --  arg-macro: function ASN1_i2d_fp_of (type, i2d, out,(ASN1_i2d_fp(CHECKED_I2D_OF(type, i2d), out, CHECKED_PTR_OF(type, x))
      --    return ASN1_i2d_fp(CHECKED_I2D_OF(type, i2d), out, CHECKED_PTR_OF(type, x));
      --  arg-macro: function ASN1_i2d_fp_of_const (type, i2d, out,(ASN1_i2d_fp(CHECKED_I2D_OF(const type, i2d), out, CHECKED_PTR_OF(const type, x))
      --    return ASN1_i2d_fp(CHECKED_I2D_OF(const type, i2d), out, CHECKED_PTR_OF(const type, x));
      --  arg-macro: function ASN1_d2i_bio_of (type, xnew, d2i((type*)ASN1_d2i_bio( CHECKED_NEW_OF(type, xnew), CHECKED_D2I_OF(type, d2i), in, CHECKED_PPTR_OF(type, x))
      --    return (type*)ASN1_d2i_bio( CHECKED_NEW_OF(type, xnew), CHECKED_D2I_OF(type, d2i), in, CHECKED_PPTR_OF(type, x));
      --  arg-macro: function ASN1_i2d_bio_of (type, i2d, out,(ASN1_i2d_bio(CHECKED_I2D_OF(type, i2d), out, CHECKED_PTR_OF(type, x))
      --    return ASN1_i2d_bio(CHECKED_I2D_OF(type, i2d), out, CHECKED_PTR_OF(type, x));
      --  arg-macro: function ASN1_i2d_bio_of_const (type, i2d, out,(ASN1_i2d_bio(CHECKED_I2D_OF(const type, i2d), out, CHECKED_PTR_OF(const type, x))
      --    return ASN1_i2d_bio(CHECKED_I2D_OF(const type, i2d), out, CHECKED_PTR_OF(const type, x));
      --  arg-macro: function ASN1_pack_string_of (type, obj, i2d,(ASN1_pack_string(CHECKED_PTR_OF(type, obj), CHECKED_I2D_OF(type, i2d), oct)
      --    return ASN1_pack_string(CHECKED_PTR_OF(type, obj), CHECKED_I2D_OF(type, i2d), oct);

      ASN1_PCTX_FLAGS_SHOW_ABSENT : constant := 16#001#;  --  openssl/asn1.h:1101

      ASN1_PCTX_FLAGS_SHOW_SEQUENCE : constant := 16#002#;  --  openssl/asn1.h:1103

      ASN1_PCTX_FLAGS_SHOW_SSOF : constant := 16#004#;  --  openssl/asn1.h:1105

      ASN1_PCTX_FLAGS_SHOW_TYPE : constant := 16#008#;  --  openssl/asn1.h:1107

      ASN1_PCTX_FLAGS_NO_ANY_TYPE : constant := 16#010#;  --  openssl/asn1.h:1109

      ASN1_PCTX_FLAGS_NO_MSTRING_TYPE : constant := 16#020#;  --  openssl/asn1.h:1111

      ASN1_PCTX_FLAGS_NO_FIELD_NAME : constant := 16#040#;  --  openssl/asn1.h:1113

      ASN1_PCTX_FLAGS_SHOW_FIELD_STRUCT_NAME : constant := 16#080#;  --  openssl/asn1.h:1115

      ASN1_PCTX_FLAGS_NO_STRUCT_NAME : constant := 16#100#;  --  openssl/asn1.h:1117

      ASN1_F_A2D_ASN1_OBJECT  : constant := 100;  --  openssl/asn1.h:1160
      ASN1_F_A2I_ASN1_ENUMERATED : constant := 101;  --  openssl/asn1.h:1161
      ASN1_F_A2I_ASN1_INTEGER : constant := 102;  --  openssl/asn1.h:1162
      ASN1_F_A2I_ASN1_STRING  : constant := 103;  --  openssl/asn1.h:1163
      ASN1_F_APPEND_EXP       : constant := 176;  --  openssl/asn1.h:1164
      ASN1_F_ASN1_BIT_STRING_SET_BIT : constant := 183;  --  openssl/asn1.h:1165
      ASN1_F_ASN1_CB          : constant := 177;  --  openssl/asn1.h:1166
      ASN1_F_ASN1_CHECK_TLEN  : constant := 104;  --  openssl/asn1.h:1167
      ASN1_F_ASN1_COLLATE_PRIMITIVE : constant := 105;  --  openssl/asn1.h:1168
      ASN1_F_ASN1_COLLECT     : constant := 106;  --  openssl/asn1.h:1169
      ASN1_F_ASN1_D2I_EX_PRIMITIVE : constant := 108;  --  openssl/asn1.h:1170
      ASN1_F_ASN1_D2I_FP      : constant := 109;  --  openssl/asn1.h:1171
      ASN1_F_ASN1_D2I_READ_BIO : constant := 107;  --  openssl/asn1.h:1172
      ASN1_F_ASN1_DIGEST      : constant := 184;  --  openssl/asn1.h:1173
      ASN1_F_ASN1_DO_ADB      : constant := 110;  --  openssl/asn1.h:1174
      ASN1_F_ASN1_DUP         : constant := 111;  --  openssl/asn1.h:1175
      ASN1_F_ASN1_ENUMERATED_SET : constant := 112;  --  openssl/asn1.h:1176
      ASN1_F_ASN1_ENUMERATED_TO_BN : constant := 113;  --  openssl/asn1.h:1177
      ASN1_F_ASN1_EX_C2I      : constant := 204;  --  openssl/asn1.h:1178
      ASN1_F_ASN1_FIND_END    : constant := 190;  --  openssl/asn1.h:1179
      ASN1_F_ASN1_GENERALIZEDTIME_ADJ : constant := 216;  --  openssl/asn1.h:1180
      ASN1_F_ASN1_GENERALIZEDTIME_SET : constant := 185;  --  openssl/asn1.h:1181
      ASN1_F_ASN1_GENERATE_V3 : constant := 178;  --  openssl/asn1.h:1182
      ASN1_F_ASN1_GET_OBJECT  : constant := 114;  --  openssl/asn1.h:1183
      ASN1_F_ASN1_HEADER_NEW  : constant := 115;  --  openssl/asn1.h:1184
      ASN1_F_ASN1_I2D_BIO     : constant := 116;  --  openssl/asn1.h:1185
      ASN1_F_ASN1_I2D_FP      : constant := 117;  --  openssl/asn1.h:1186
      ASN1_F_ASN1_INTEGER_SET : constant := 118;  --  openssl/asn1.h:1187
      ASN1_F_ASN1_INTEGER_TO_BN : constant := 119;  --  openssl/asn1.h:1188
      ASN1_F_ASN1_ITEM_D2I_FP : constant := 206;  --  openssl/asn1.h:1189
      ASN1_F_ASN1_ITEM_DUP    : constant := 191;  --  openssl/asn1.h:1190
      ASN1_F_ASN1_ITEM_EX_COMBINE_NEW : constant := 121;  --  openssl/asn1.h:1191
      ASN1_F_ASN1_ITEM_EX_D2I : constant := 120;  --  openssl/asn1.h:1192
      ASN1_F_ASN1_ITEM_I2D_BIO : constant := 192;  --  openssl/asn1.h:1193
      ASN1_F_ASN1_ITEM_I2D_FP : constant := 193;  --  openssl/asn1.h:1194
      ASN1_F_ASN1_ITEM_PACK   : constant := 198;  --  openssl/asn1.h:1195
      ASN1_F_ASN1_ITEM_SIGN   : constant := 195;  --  openssl/asn1.h:1196
      ASN1_F_ASN1_ITEM_UNPACK : constant := 199;  --  openssl/asn1.h:1197
      ASN1_F_ASN1_ITEM_VERIFY : constant := 197;  --  openssl/asn1.h:1198
      ASN1_F_ASN1_MBSTRING_NCOPY : constant := 122;  --  openssl/asn1.h:1199
      ASN1_F_ASN1_OBJECT_NEW  : constant := 123;  --  openssl/asn1.h:1200
      ASN1_F_ASN1_OUTPUT_DATA : constant := 214;  --  openssl/asn1.h:1201
      ASN1_F_ASN1_PACK_STRING : constant := 124;  --  openssl/asn1.h:1202
      ASN1_F_ASN1_PCTX_NEW    : constant := 205;  --  openssl/asn1.h:1203
      ASN1_F_ASN1_PKCS5_PBE_SET : constant := 125;  --  openssl/asn1.h:1204
      ASN1_F_ASN1_SEQ_PACK    : constant := 126;  --  openssl/asn1.h:1205
      ASN1_F_ASN1_SEQ_UNPACK  : constant := 127;  --  openssl/asn1.h:1206
      ASN1_F_ASN1_SIGN        : constant := 128;  --  openssl/asn1.h:1207
      ASN1_F_ASN1_STR2TYPE    : constant := 179;  --  openssl/asn1.h:1208
      ASN1_F_ASN1_STRING_SET  : constant := 186;  --  openssl/asn1.h:1209
      ASN1_F_ASN1_STRING_TABLE_ADD : constant := 129;  --  openssl/asn1.h:1210
      ASN1_F_ASN1_STRING_TYPE_NEW : constant := 130;  --  openssl/asn1.h:1211
      ASN1_F_ASN1_TEMPLATE_EX_D2I : constant := 132;  --  openssl/asn1.h:1212
      ASN1_F_ASN1_TEMPLATE_NEW : constant := 133;  --  openssl/asn1.h:1213
      ASN1_F_ASN1_TEMPLATE_NOEXP_D2I : constant := 131;  --  openssl/asn1.h:1214
      ASN1_F_ASN1_TIME_ADJ    : constant := 217;  --  openssl/asn1.h:1215
      ASN1_F_ASN1_TIME_SET    : constant := 175;  --  openssl/asn1.h:1216
      ASN1_F_ASN1_TYPE_GET_INT_OCTETSTRING : constant := 134;  --  openssl/asn1.h:1217
      ASN1_F_ASN1_TYPE_GET_OCTETSTRING : constant := 135;  --  openssl/asn1.h:1218
      ASN1_F_ASN1_UNPACK_STRING : constant := 136;  --  openssl/asn1.h:1219
      ASN1_F_ASN1_UTCTIME_ADJ : constant := 218;  --  openssl/asn1.h:1220
      ASN1_F_ASN1_UTCTIME_SET : constant := 187;  --  openssl/asn1.h:1221
      ASN1_F_ASN1_VERIFY      : constant := 137;  --  openssl/asn1.h:1222
      ASN1_F_B64_READ_ASN1    : constant := 209;  --  openssl/asn1.h:1223
      ASN1_F_B64_WRITE_ASN1   : constant := 210;  --  openssl/asn1.h:1224
      ASN1_F_BIO_NEW_NDEF     : constant := 208;  --  openssl/asn1.h:1225
      ASN1_F_BITSTR_CB        : constant := 180;  --  openssl/asn1.h:1226
      ASN1_F_BN_TO_ASN1_ENUMERATED : constant := 138;  --  openssl/asn1.h:1227
      ASN1_F_BN_TO_ASN1_INTEGER : constant := 139;  --  openssl/asn1.h:1228
      ASN1_F_C2I_ASN1_BIT_STRING : constant := 189;  --  openssl/asn1.h:1229
      ASN1_F_C2I_ASN1_INTEGER : constant := 194;  --  openssl/asn1.h:1230
      ASN1_F_C2I_ASN1_OBJECT  : constant := 196;  --  openssl/asn1.h:1231
      ASN1_F_COLLECT_DATA     : constant := 140;  --  openssl/asn1.h:1232
      ASN1_F_D2I_ASN1_BIT_STRING : constant := 141;  --  openssl/asn1.h:1233
      ASN1_F_D2I_ASN1_BOOLEAN : constant := 142;  --  openssl/asn1.h:1234
      ASN1_F_D2I_ASN1_BYTES   : constant := 143;  --  openssl/asn1.h:1235
      ASN1_F_D2I_ASN1_GENERALIZEDTIME : constant := 144;  --  openssl/asn1.h:1236
      ASN1_F_D2I_ASN1_HEADER  : constant := 145;  --  openssl/asn1.h:1237
      ASN1_F_D2I_ASN1_INTEGER : constant := 146;  --  openssl/asn1.h:1238
      ASN1_F_D2I_ASN1_OBJECT  : constant := 147;  --  openssl/asn1.h:1239
      ASN1_F_D2I_ASN1_SET     : constant := 148;  --  openssl/asn1.h:1240
      ASN1_F_D2I_ASN1_TYPE_BYTES : constant := 149;  --  openssl/asn1.h:1241
      ASN1_F_D2I_ASN1_UINTEGER : constant := 150;  --  openssl/asn1.h:1242
      ASN1_F_D2I_ASN1_UTCTIME : constant := 151;  --  openssl/asn1.h:1243
      ASN1_F_D2I_AUTOPRIVATEKEY : constant := 207;  --  openssl/asn1.h:1244
      ASN1_F_D2I_NETSCAPE_RSA : constant := 152;  --  openssl/asn1.h:1245
      ASN1_F_D2I_NETSCAPE_RSA_2 : constant := 153;  --  openssl/asn1.h:1246
      ASN1_F_D2I_PRIVATEKEY   : constant := 154;  --  openssl/asn1.h:1247
      ASN1_F_D2I_PUBLICKEY    : constant := 155;  --  openssl/asn1.h:1248
      ASN1_F_D2I_RSA_NET      : constant := 200;  --  openssl/asn1.h:1249
      ASN1_F_D2I_RSA_NET_2    : constant := 201;  --  openssl/asn1.h:1250
      ASN1_F_D2I_X509         : constant := 156;  --  openssl/asn1.h:1251
      ASN1_F_D2I_X509_CINF    : constant := 157;  --  openssl/asn1.h:1252
      ASN1_F_D2I_X509_PKEY    : constant := 159;  --  openssl/asn1.h:1253
      ASN1_F_I2D_ASN1_BIO_STREAM : constant := 211;  --  openssl/asn1.h:1254
      ASN1_F_I2D_ASN1_SET     : constant := 188;  --  openssl/asn1.h:1255
      ASN1_F_I2D_ASN1_TIME    : constant := 160;  --  openssl/asn1.h:1256
      ASN1_F_I2D_DSA_PUBKEY   : constant := 161;  --  openssl/asn1.h:1257
      ASN1_F_I2D_EC_PUBKEY    : constant := 181;  --  openssl/asn1.h:1258
      ASN1_F_I2D_PRIVATEKEY   : constant := 163;  --  openssl/asn1.h:1259
      ASN1_F_I2D_PUBLICKEY    : constant := 164;  --  openssl/asn1.h:1260
      ASN1_F_I2D_RSA_NET      : constant := 162;  --  openssl/asn1.h:1261
      ASN1_F_I2D_RSA_PUBKEY   : constant := 165;  --  openssl/asn1.h:1262
      ASN1_F_LONG_C2I         : constant := 166;  --  openssl/asn1.h:1263
      ASN1_F_OID_MODULE_INIT  : constant := 174;  --  openssl/asn1.h:1264
      ASN1_F_PARSE_TAGGING    : constant := 182;  --  openssl/asn1.h:1265
      ASN1_F_PKCS5_PBE2_SET_IV : constant := 167;  --  openssl/asn1.h:1266
      ASN1_F_PKCS5_PBE_SET    : constant := 202;  --  openssl/asn1.h:1267
      ASN1_F_PKCS5_PBE_SET0_ALGOR : constant := 215;  --  openssl/asn1.h:1268
      ASN1_F_SMIME_READ_ASN1  : constant := 212;  --  openssl/asn1.h:1269
      ASN1_F_SMIME_TEXT       : constant := 213;  --  openssl/asn1.h:1270
      ASN1_F_X509_CINF_NEW    : constant := 168;  --  openssl/asn1.h:1271
      ASN1_F_X509_CRL_ADD0_REVOKED : constant := 169;  --  openssl/asn1.h:1272
      ASN1_F_X509_INFO_NEW    : constant := 170;  --  openssl/asn1.h:1273
      ASN1_F_X509_NAME_ENCODE : constant := 203;  --  openssl/asn1.h:1274
      ASN1_F_X509_NAME_EX_D2I : constant := 158;  --  openssl/asn1.h:1275
      ASN1_F_X509_NAME_EX_NEW : constant := 171;  --  openssl/asn1.h:1276
      ASN1_F_X509_NEW         : constant := 172;  --  openssl/asn1.h:1277
      ASN1_F_X509_PKEY_NEW    : constant := 173;  --  openssl/asn1.h:1278

      ASN1_R_ADDING_OBJECT    : constant := 171;  --  openssl/asn1.h:1281
      ASN1_R_ASN1_PARSE_ERROR : constant := 203;  --  openssl/asn1.h:1282
      ASN1_R_ASN1_SIG_PARSE_ERROR : constant := 204;  --  openssl/asn1.h:1283
      ASN1_R_AUX_ERROR        : constant := 100;  --  openssl/asn1.h:1284
      ASN1_R_BAD_CLASS        : constant := 101;  --  openssl/asn1.h:1285
      ASN1_R_BAD_OBJECT_HEADER : constant := 102;  --  openssl/asn1.h:1286
      ASN1_R_BAD_PASSWORD_READ : constant := 103;  --  openssl/asn1.h:1287
      ASN1_R_BAD_TAG          : constant := 104;  --  openssl/asn1.h:1288
      ASN1_R_BMPSTRING_IS_WRONG_LENGTH : constant := 214;  --  openssl/asn1.h:1289
      ASN1_R_BN_LIB           : constant := 105;  --  openssl/asn1.h:1290
      ASN1_R_BOOLEAN_IS_WRONG_LENGTH : constant := 106;  --  openssl/asn1.h:1291
      ASN1_R_BUFFER_TOO_SMALL : constant := 107;  --  openssl/asn1.h:1292
      ASN1_R_CIPHER_HAS_NO_OBJECT_IDENTIFIER : constant := 108;  --  openssl/asn1.h:1293
      ASN1_R_DATA_IS_WRONG    : constant := 109;  --  openssl/asn1.h:1294
      ASN1_R_DECODE_ERROR     : constant := 110;  --  openssl/asn1.h:1295
      ASN1_R_DECODING_ERROR   : constant := 111;  --  openssl/asn1.h:1296
      ASN1_R_DEPTH_EXCEEDED   : constant := 174;  --  openssl/asn1.h:1297
      ASN1_R_DIGEST_AND_KEY_TYPE_NOT_SUPPORTED : constant := 198;  --  openssl/asn1.h:1298
      ASN1_R_ENCODE_ERROR     : constant := 112;  --  openssl/asn1.h:1299
      ASN1_R_ERROR_GETTING_TIME : constant := 173;  --  openssl/asn1.h:1300
      ASN1_R_ERROR_LOADING_SECTION : constant := 172;  --  openssl/asn1.h:1301
      ASN1_R_ERROR_PARSING_SET_ELEMENT : constant := 113;  --  openssl/asn1.h:1302
      ASN1_R_ERROR_SETTING_CIPHER_PARAMS : constant := 114;  --  openssl/asn1.h:1303
      ASN1_R_EXPECTING_AN_INTEGER : constant := 115;  --  openssl/asn1.h:1304
      ASN1_R_EXPECTING_AN_OBJECT : constant := 116;  --  openssl/asn1.h:1305
      ASN1_R_EXPECTING_A_BOOLEAN : constant := 117;  --  openssl/asn1.h:1306
      ASN1_R_EXPECTING_A_TIME : constant := 118;  --  openssl/asn1.h:1307
      ASN1_R_EXPLICIT_LENGTH_MISMATCH : constant := 119;  --  openssl/asn1.h:1308
      ASN1_R_EXPLICIT_TAG_NOT_CONSTRUCTED : constant := 120;  --  openssl/asn1.h:1309
      ASN1_R_FIELD_MISSING    : constant := 121;  --  openssl/asn1.h:1310
      ASN1_R_FIRST_NUM_TOO_LARGE : constant := 122;  --  openssl/asn1.h:1311
      ASN1_R_HEADER_TOO_LONG  : constant := 123;  --  openssl/asn1.h:1312
      ASN1_R_ILLEGAL_BITSTRING_FORMAT : constant := 175;  --  openssl/asn1.h:1313
      ASN1_R_ILLEGAL_BOOLEAN  : constant := 176;  --  openssl/asn1.h:1314
      ASN1_R_ILLEGAL_CHARACTERS : constant := 124;  --  openssl/asn1.h:1315
      ASN1_R_ILLEGAL_FORMAT   : constant := 177;  --  openssl/asn1.h:1316
      ASN1_R_ILLEGAL_HEX      : constant := 178;  --  openssl/asn1.h:1317
      ASN1_R_ILLEGAL_IMPLICIT_TAG : constant := 179;  --  openssl/asn1.h:1318
      ASN1_R_ILLEGAL_INTEGER  : constant := 180;  --  openssl/asn1.h:1319
      ASN1_R_ILLEGAL_NESTED_TAGGING : constant := 181;  --  openssl/asn1.h:1320
      ASN1_R_ILLEGAL_NULL     : constant := 125;  --  openssl/asn1.h:1321
      ASN1_R_ILLEGAL_NULL_VALUE : constant := 182;  --  openssl/asn1.h:1322
      ASN1_R_ILLEGAL_OBJECT   : constant := 183;  --  openssl/asn1.h:1323
      ASN1_R_ILLEGAL_OPTIONAL_ANY : constant := 126;  --  openssl/asn1.h:1324
      ASN1_R_ILLEGAL_OPTIONS_ON_ITEM_TEMPLATE : constant := 170;  --  openssl/asn1.h:1325
      ASN1_R_ILLEGAL_TAGGED_ANY : constant := 127;  --  openssl/asn1.h:1326
      ASN1_R_ILLEGAL_TIME_VALUE : constant := 184;  --  openssl/asn1.h:1327
      ASN1_R_INTEGER_NOT_ASCII_FORMAT : constant := 185;  --  openssl/asn1.h:1328
      ASN1_R_INTEGER_TOO_LARGE_FOR_LONG : constant := 128;  --  openssl/asn1.h:1329
      ASN1_R_INVALID_BMPSTRING_LENGTH : constant := 129;  --  openssl/asn1.h:1330
      ASN1_R_INVALID_DIGIT    : constant := 130;  --  openssl/asn1.h:1331
      ASN1_R_INVALID_MIME_TYPE : constant := 205;  --  openssl/asn1.h:1332
      ASN1_R_INVALID_MODIFIER : constant := 186;  --  openssl/asn1.h:1333
      ASN1_R_INVALID_NUMBER   : constant := 187;  --  openssl/asn1.h:1334
      ASN1_R_INVALID_OBJECT_ENCODING : constant := 216;  --  openssl/asn1.h:1335
      ASN1_R_INVALID_SEPARATOR : constant := 131;  --  openssl/asn1.h:1336
      ASN1_R_INVALID_TIME_FORMAT : constant := 132;  --  openssl/asn1.h:1337
      ASN1_R_INVALID_UNIVERSALSTRING_LENGTH : constant := 133;  --  openssl/asn1.h:1338
      ASN1_R_INVALID_UTF8STRING : constant := 134;  --  openssl/asn1.h:1339
      ASN1_R_IV_TOO_LARGE     : constant := 135;  --  openssl/asn1.h:1340
      ASN1_R_LENGTH_ERROR     : constant := 136;  --  openssl/asn1.h:1341
      ASN1_R_LIST_ERROR       : constant := 188;  --  openssl/asn1.h:1342
      ASN1_R_MIME_NO_CONTENT_TYPE : constant := 206;  --  openssl/asn1.h:1343
      ASN1_R_MIME_PARSE_ERROR : constant := 207;  --  openssl/asn1.h:1344
      ASN1_R_MIME_SIG_PARSE_ERROR : constant := 208;  --  openssl/asn1.h:1345
      ASN1_R_MISSING_EOC      : constant := 137;  --  openssl/asn1.h:1346
      ASN1_R_MISSING_SECOND_NUMBER : constant := 138;  --  openssl/asn1.h:1347
      ASN1_R_MISSING_VALUE    : constant := 189;  --  openssl/asn1.h:1348
      ASN1_R_MSTRING_NOT_UNIVERSAL : constant := 139;  --  openssl/asn1.h:1349
      ASN1_R_MSTRING_WRONG_TAG : constant := 140;  --  openssl/asn1.h:1350
      ASN1_R_NESTED_ASN1_STRING : constant := 197;  --  openssl/asn1.h:1351
      ASN1_R_NON_HEX_CHARACTERS : constant := 141;  --  openssl/asn1.h:1352
      ASN1_R_NOT_ASCII_FORMAT : constant := 190;  --  openssl/asn1.h:1353
      ASN1_R_NOT_ENOUGH_DATA  : constant := 142;  --  openssl/asn1.h:1354
      ASN1_R_NO_CONTENT_TYPE  : constant := 209;  --  openssl/asn1.h:1355
      ASN1_R_NO_DEFAULT_DIGEST : constant := 201;  --  openssl/asn1.h:1356
      ASN1_R_NO_MATCHING_CHOICE_TYPE : constant := 143;  --  openssl/asn1.h:1357
      ASN1_R_NO_MULTIPART_BODY_FAILURE : constant := 210;  --  openssl/asn1.h:1358
      ASN1_R_NO_MULTIPART_BOUNDARY : constant := 211;  --  openssl/asn1.h:1359
      ASN1_R_NO_SIG_CONTENT_TYPE : constant := 212;  --  openssl/asn1.h:1360
      ASN1_R_NULL_IS_WRONG_LENGTH : constant := 144;  --  openssl/asn1.h:1361
      ASN1_R_OBJECT_NOT_ASCII_FORMAT : constant := 191;  --  openssl/asn1.h:1362
      ASN1_R_ODD_NUMBER_OF_CHARS : constant := 145;  --  openssl/asn1.h:1363
      ASN1_R_PRIVATE_KEY_HEADER_MISSING : constant := 146;  --  openssl/asn1.h:1364
      ASN1_R_SECOND_NUMBER_TOO_LARGE : constant := 147;  --  openssl/asn1.h:1365
      ASN1_R_SEQUENCE_LENGTH_MISMATCH : constant := 148;  --  openssl/asn1.h:1366
      ASN1_R_SEQUENCE_NOT_CONSTRUCTED : constant := 149;  --  openssl/asn1.h:1367
      ASN1_R_SEQUENCE_OR_SET_NEEDS_CONFIG : constant := 192;  --  openssl/asn1.h:1368
      ASN1_R_SHORT_LINE       : constant := 150;  --  openssl/asn1.h:1369
      ASN1_R_SIG_INVALID_MIME_TYPE : constant := 213;  --  openssl/asn1.h:1370
      ASN1_R_STREAMING_NOT_SUPPORTED : constant := 202;  --  openssl/asn1.h:1371
      ASN1_R_STRING_TOO_LONG  : constant := 151;  --  openssl/asn1.h:1372
      ASN1_R_STRING_TOO_SHORT : constant := 152;  --  openssl/asn1.h:1373
      ASN1_R_TAG_VALUE_TOO_HIGH : constant := 153;  --  openssl/asn1.h:1374
      ASN1_R_THE_ASN1_OBJECT_IDENTIFIER_IS_NOT_KNOWN_FOR_THIS_MD : constant := 154;  --  openssl/asn1.h:1375
      ASN1_R_TIME_NOT_ASCII_FORMAT : constant := 193;  --  openssl/asn1.h:1376
      ASN1_R_TOO_LONG         : constant := 155;  --  openssl/asn1.h:1377
      ASN1_R_TYPE_NOT_CONSTRUCTED : constant := 156;  --  openssl/asn1.h:1378
      ASN1_R_UNABLE_TO_DECODE_RSA_KEY : constant := 157;  --  openssl/asn1.h:1379
      ASN1_R_UNABLE_TO_DECODE_RSA_PRIVATE_KEY : constant := 158;  --  openssl/asn1.h:1380
      ASN1_R_UNEXPECTED_EOC   : constant := 159;  --  openssl/asn1.h:1381
      ASN1_R_UNIVERSALSTRING_IS_WRONG_LENGTH : constant := 215;  --  openssl/asn1.h:1382
      ASN1_R_UNKNOWN_FORMAT   : constant := 160;  --  openssl/asn1.h:1383
      ASN1_R_UNKNOWN_MESSAGE_DIGEST_ALGORITHM : constant := 161;  --  openssl/asn1.h:1384
      ASN1_R_UNKNOWN_OBJECT_TYPE : constant := 162;  --  openssl/asn1.h:1385
      ASN1_R_UNKNOWN_PUBLIC_KEY_TYPE : constant := 163;  --  openssl/asn1.h:1386
      ASN1_R_UNKNOWN_SIGNATURE_ALGORITHM : constant := 199;  --  openssl/asn1.h:1387
      ASN1_R_UNKNOWN_TAG      : constant := 194;  --  openssl/asn1.h:1388
      ASN1_R_UNKOWN_FORMAT    : constant := 195;  --  openssl/asn1.h:1389
      ASN1_R_UNSUPPORTED_ANY_DEFINED_BY_TYPE : constant := 164;  --  openssl/asn1.h:1390
      ASN1_R_UNSUPPORTED_CIPHER : constant := 165;  --  openssl/asn1.h:1391
      ASN1_R_UNSUPPORTED_ENCRYPTION_ALGORITHM : constant := 166;  --  openssl/asn1.h:1392
      ASN1_R_UNSUPPORTED_PUBLIC_KEY_TYPE : constant := 167;  --  openssl/asn1.h:1393
      ASN1_R_UNSUPPORTED_TYPE : constant := 196;  --  openssl/asn1.h:1394
      ASN1_R_WRONG_PUBLIC_KEY_TYPE : constant := 200;  --  openssl/asn1.h:1395
      ASN1_R_WRONG_TAG        : constant := 168;  --  openssl/asn1.h:1396
      ASN1_R_WRONG_TYPE       : constant := 169;  --  openssl/asn1.h:1397
   end defs;
   type stack_st_X509_ALGOR is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/asn1.h:166
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_X509_ALGOR);  -- openssl/asn1.h:166

   type asn1_ctx_st is record
      p      : access unsigned_char;  -- openssl/asn1.h:177
      eos    : aliased int;  -- openssl/asn1.h:178
      error  : aliased int;  -- openssl/asn1.h:179
      inf    : aliased int;  -- openssl/asn1.h:180
      tag    : aliased int;  -- openssl/asn1.h:181
      xclass : aliased int;  -- openssl/asn1.h:182
      slen   : aliased long;  -- openssl/asn1.h:183
      max    : access unsigned_char;  -- openssl/asn1.h:184
      q      : access unsigned_char;  -- openssl/asn1.h:185
      pp     : System.Address;  -- openssl/asn1.h:186
      line   : aliased int;  -- openssl/asn1.h:187
   end record;
   pragma Convention (C_Pass_By_Copy, asn1_ctx_st);  -- openssl/asn1.h:175

   subtype ASN1_CTX is asn1_ctx_st;

   type asn1_const_ctx_st is record
      p      : access unsigned_char;  -- openssl/asn1.h:192
      eos    : aliased int;  -- openssl/asn1.h:193
      error  : aliased int;  -- openssl/asn1.h:194
      inf    : aliased int;  -- openssl/asn1.h:195
      tag    : aliased int;  -- openssl/asn1.h:196
      xclass : aliased int;  -- openssl/asn1.h:197
      slen   : aliased long;  -- openssl/asn1.h:198
      max    : access unsigned_char;  -- openssl/asn1.h:199
      q      : access unsigned_char;  -- openssl/asn1.h:200
      pp     : System.Address;  -- openssl/asn1.h:201
      line   : aliased int;  -- openssl/asn1.h:202
   end record;
   pragma Convention (C_Pass_By_Copy, asn1_const_ctx_st);  -- openssl/asn1.h:190

   subtype ASN1_const_CTX is asn1_const_ctx_st;

   type asn1_object_st is record
      sn     : Interfaces.C.Strings.chars_ptr;  -- openssl/asn1.h:213
      ln     : Interfaces.C.Strings.chars_ptr;  -- openssl/asn1.h:213
      nid    : aliased int;  -- openssl/asn1.h:214
      length : aliased int;  -- openssl/asn1.h:215
      data   : access unsigned_char;  -- openssl/asn1.h:216
      flags  : aliased int;  -- openssl/asn1.h:217
   end record;
   pragma Convention (C_Pass_By_Copy, asn1_object_st);  -- openssl/asn1.h:211

   subtype ASN1_OBJECT is asn1_object_st;

   type asn1_string_st is record
      length : aliased int;  -- openssl/asn1.h:240
      c_type : aliased int;  -- openssl/asn1.h:241
      data   : access unsigned_char;  -- openssl/asn1.h:242
      flags  : aliased long;  -- openssl/asn1.h:247
   end record;
   pragma Convention (C_Pass_By_Copy, asn1_string_st);  -- openssl/asn1.h:238

   subtype ASN1_STRING is asn1_string_st;

   type ASN1_ENCODING_st is record
      enc      : access unsigned_char;  -- openssl/asn1.h:257
      len      : aliased long;  -- openssl/asn1.h:258
      modified : aliased int;  -- openssl/asn1.h:259
   end record;
   pragma Convention (C_Pass_By_Copy, ASN1_ENCODING_st);  -- openssl/asn1.h:255

   subtype ASN1_ENCODING is ASN1_ENCODING_st;

   type asn1_string_table_st is record
      nid     : aliased int;  -- openssl/asn1.h:272
      minsize : aliased long;  -- openssl/asn1.h:273
      maxsize : aliased long;  -- openssl/asn1.h:274
      mask    : aliased unsigned_long;  -- openssl/asn1.h:275
      flags   : aliased unsigned_long;  -- openssl/asn1.h:276
   end record;
   pragma Convention (C_Pass_By_Copy, asn1_string_table_st);  -- openssl/asn1.h:271

   subtype ASN1_STRING_TABLE is asn1_string_table_st;

   type stack_st_ASN1_STRING_TABLE is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/asn1.h:279
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_ASN1_STRING_TABLE);  -- openssl/asn1.h:279

   subtype ASN1_TEMPLATE is OpenSSL.Low_Level.asn1t_h.ASN1_TEMPLATE_st;

   subtype ASN1_ITEM is OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;

   subtype ASN1_TLC is OpenSSL.Low_Level.asn1t_h.ASN1_TLC_st;

   --  skipped empty struct ASN1_VALUE_st

   --  skipped empty struct ASN1_VALUE

   --  skipped function type i2d_of_void

   --  skipped function type d2i_of_void

   subtype ASN1_ITEM_EXP is ASN1_ITEM;  -- openssl/asn1.h:403

   type stack_st_ASN1_INTEGER is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/asn1.h:517
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_ASN1_INTEGER);  -- openssl/asn1.h:517

   type stack_st_ASN1_GENERALSTRING is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/asn1.h:520
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_ASN1_GENERALSTRING);  -- openssl/asn1.h:520

   type anon_27 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            ptr             : Interfaces.C.Strings.chars_ptr;  -- openssl/asn1.h:526
         when 1 =>
            boolean         : aliased Interfaces.C.int;  -- openssl/asn1.h:527
         when 2 =>
            the_asn1_string : access ASN1_STRING;  -- openssl/asn1.h:528
         when 3 =>
            object          : access ASN1_OBJECT;  -- openssl/asn1.h:529
         when 4 =>
            integer         : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:530
         when 5 =>
            enumerated      : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:531
         when 6 =>
            bit_string      : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:532
         when 7 =>
            octet_string    : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:533
         when 8 =>
            printablestring : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:534
         when 9 =>
            t61string       : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:535
         when 10 =>
            ia5string       : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:536
         when 11 =>
            generalstring   : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:537
         when 12 =>
            bmpstring       : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:538
         when 13 =>
            universalstring : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:539
         when 14 =>
            utctime         : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:540
         when 15 =>
            generalizedtime : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:541
         when 16 =>
            visiblestring   : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:542
         when 17 =>
            utf8string      : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:543
         when 18 =>
            set             : access ASN1_STRING;  -- openssl/asn1.h:546
         when 19 =>
            sequence        : access ASN1_STRING;  -- openssl/asn1.h:547
         when others =>
            the_asn1_value  : System.Address;  -- openssl/asn1.h:548
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_27);
   pragma Unchecked_Union (anon_27);
   type asn1_type_st is record
      c_type : aliased int;  -- openssl/asn1.h:524
      value  : anon_27;  -- openssl/asn1.h:549
   end record;
   pragma Convention (C_Pass_By_Copy, asn1_type_st);  -- openssl/asn1.h:522

   subtype ASN1_TYPE is asn1_type_st;

   type stack_st_ASN1_TYPE is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/asn1.h:552
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_ASN1_TYPE);  -- openssl/asn1.h:552

   subtype ASN1_SEQUENCE_ANY is stack_st_ASN1_TYPE;

   ASN1_SEQUENCE_ANY_it : aliased ASN1_ITEM;  -- openssl/asn1.h:557
   pragma Import (C, ASN1_SEQUENCE_ANY_it, "ASN1_SEQUENCE_ANY_it");

   function i2d_ASN1_SEQUENCE_ANY (a : System.Address; c_out : System.Address) return int;  -- openssl/asn1.h:557
   pragma Import (C, i2d_ASN1_SEQUENCE_ANY, "i2d_ASN1_SEQUENCE_ANY");

   function d2i_ASN1_SEQUENCE_ANY
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access ASN1_SEQUENCE_ANY;  -- openssl/asn1.h:557
   pragma Import (C, d2i_ASN1_SEQUENCE_ANY, "d2i_ASN1_SEQUENCE_ANY");

   ASN1_SET_ANY_it : aliased ASN1_ITEM;  -- openssl/asn1.h:558
   pragma Import (C, ASN1_SET_ANY_it, "ASN1_SET_ANY_it");

   function i2d_ASN1_SET_ANY (a : System.Address; c_out : System.Address) return int;  -- openssl/asn1.h:558
   pragma Import (C, i2d_ASN1_SET_ANY, "i2d_ASN1_SET_ANY");

   function d2i_ASN1_SET_ANY
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access ASN1_SEQUENCE_ANY;  -- openssl/asn1.h:558
   pragma Import (C, d2i_ASN1_SET_ANY, "d2i_ASN1_SET_ANY");

   type NETSCAPE_X509_st is record
      header : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:562
      cert   : access OpenSSL.Low_Level.x509_h.x509_st;  -- openssl/asn1.h:563
   end record;
   pragma Convention (C_Pass_By_Copy, NETSCAPE_X509_st);  -- openssl/asn1.h:560

   subtype NETSCAPE_X509 is NETSCAPE_X509_st;

   type BIT_STRING_BITNAME_st is record
      bitnum : aliased int;  -- openssl/asn1.h:568
      lname  : Interfaces.C.Strings.chars_ptr;  -- openssl/asn1.h:569
      sname  : Interfaces.C.Strings.chars_ptr;  -- openssl/asn1.h:570
   end record;
   pragma Convention (C_Pass_By_Copy, BIT_STRING_BITNAME_st);  -- openssl/asn1.h:567

   subtype BIT_STRING_BITNAME is BIT_STRING_BITNAME_st;

   ASN1_ANY_it : aliased ASN1_ITEM;  -- openssl/asn1.h:775
   pragma Import (C, ASN1_ANY_it, "ASN1_ANY_it");

   function i2d_ASN1_TYPE (a : access ASN1_TYPE; c_out : System.Address) return int;  -- openssl/asn1.h:775
   pragma Import (C, i2d_ASN1_TYPE, "i2d_ASN1_TYPE");

   function d2i_ASN1_TYPE
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access ASN1_TYPE;  -- openssl/asn1.h:775
   pragma Import (C, d2i_ASN1_TYPE, "d2i_ASN1_TYPE");

   procedure ASN1_TYPE_free (a : access ASN1_TYPE);  -- openssl/asn1.h:775
   pragma Import (C, ASN1_TYPE_free, "ASN1_TYPE_free");

   function ASN1_TYPE_new return access ASN1_TYPE;  -- openssl/asn1.h:775
   pragma Import (C, ASN1_TYPE_new, "ASN1_TYPE_new");

   function ASN1_TYPE_get (a : access ASN1_TYPE) return int;  -- openssl/asn1.h:777
   pragma Import (C, ASN1_TYPE_get, "ASN1_TYPE_get");

   procedure ASN1_TYPE_set
     (a      : access ASN1_TYPE;
      c_type : int;
      value  : System.Address);  -- openssl/asn1.h:778
   pragma Import (C, ASN1_TYPE_set, "ASN1_TYPE_set");

   function ASN1_TYPE_set1
     (a      : access ASN1_TYPE;
      c_type : int;
      value  : System.Address) return int;  -- openssl/asn1.h:779
   pragma Import (C, ASN1_TYPE_set1, "ASN1_TYPE_set1");

   function ASN1_TYPE_cmp (a : access ASN1_TYPE; b : access ASN1_TYPE) return int;  -- openssl/asn1.h:780
   pragma Import (C, ASN1_TYPE_cmp, "ASN1_TYPE_cmp");

   function ASN1_OBJECT_new return access ASN1_OBJECT;  -- openssl/asn1.h:782
   pragma Import (C, ASN1_OBJECT_new, "ASN1_OBJECT_new");

   procedure ASN1_OBJECT_free (a : access ASN1_OBJECT);  -- openssl/asn1.h:783
   pragma Import (C, ASN1_OBJECT_free, "ASN1_OBJECT_free");

   function i2d_ASN1_OBJECT (a : access ASN1_OBJECT; pp : System.Address) return int;  -- openssl/asn1.h:784
   pragma Import (C, i2d_ASN1_OBJECT, "i2d_ASN1_OBJECT");

   function c2i_ASN1_OBJECT
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access ASN1_OBJECT;  -- openssl/asn1.h:785
   pragma Import (C, c2i_ASN1_OBJECT, "c2i_ASN1_OBJECT");

   function d2i_ASN1_OBJECT
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access ASN1_OBJECT;  -- openssl/asn1.h:787
   pragma Import (C, d2i_ASN1_OBJECT, "d2i_ASN1_OBJECT");

   ASN1_OBJECT_it : aliased ASN1_ITEM;  -- openssl/asn1.h:790
   pragma Import (C, ASN1_OBJECT_it, "ASN1_OBJECT_it");

   type stack_st_ASN1_OBJECT is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/asn1.h:792
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_ASN1_OBJECT);  -- openssl/asn1.h:792

   function ASN1_STRING_new return access ASN1_STRING;  -- openssl/asn1.h:795
   pragma Import (C, ASN1_STRING_new, "ASN1_STRING_new");

   procedure ASN1_STRING_free (a : access ASN1_STRING);  -- openssl/asn1.h:796
   pragma Import (C, ASN1_STRING_free, "ASN1_STRING_free");

   function ASN1_STRING_copy (dst : access ASN1_STRING; str : System.Address) return int;  -- openssl/asn1.h:797
   pragma Import (C, ASN1_STRING_copy, "ASN1_STRING_copy");

   function ASN1_STRING_dup (a : System.Address) return access ASN1_STRING;  -- openssl/asn1.h:798
   pragma Import (C, ASN1_STRING_dup, "ASN1_STRING_dup");

   function ASN1_STRING_type_new (c_type : int) return access ASN1_STRING;  -- openssl/asn1.h:799
   pragma Import (C, ASN1_STRING_type_new, "ASN1_STRING_type_new");

   function ASN1_STRING_cmp (a : System.Address; b : System.Address) return int;  -- openssl/asn1.h:800
   pragma Import (C, ASN1_STRING_cmp, "ASN1_STRING_cmp");

   function ASN1_STRING_set
     (str  : access ASN1_STRING;
      data : System.Address;
      len  : int) return int;  -- openssl/asn1.h:803
   pragma Import (C, ASN1_STRING_set, "ASN1_STRING_set");

   procedure ASN1_STRING_set0
     (str  : access ASN1_STRING;
      data : System.Address;
      len  : int);  -- openssl/asn1.h:804
   pragma Import (C, ASN1_STRING_set0, "ASN1_STRING_set0");

   function ASN1_STRING_length (x : System.Address) return int;  -- openssl/asn1.h:805
   pragma Import (C, ASN1_STRING_length, "ASN1_STRING_length");

   procedure ASN1_STRING_length_set (x : access ASN1_STRING; n : int);  -- openssl/asn1.h:806
   pragma Import (C, ASN1_STRING_length_set, "ASN1_STRING_length_set");

   function ASN1_STRING_type (x : access ASN1_STRING) return int;  -- openssl/asn1.h:807
   pragma Import (C, ASN1_STRING_type, "ASN1_STRING_type");

   function ASN1_STRING_data (x : access ASN1_STRING) return access unsigned_char;  -- openssl/asn1.h:808
   pragma Import (C, ASN1_STRING_data, "ASN1_STRING_data");

   ASN1_BIT_STRING_it : aliased ASN1_ITEM;  -- openssl/asn1.h:810
   pragma Import (C, ASN1_BIT_STRING_it, "ASN1_BIT_STRING_it");

   function i2d_ASN1_BIT_STRING (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:810
   pragma Import (C, i2d_ASN1_BIT_STRING, "i2d_ASN1_BIT_STRING");

   function d2i_ASN1_BIT_STRING
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:810
   pragma Import (C, d2i_ASN1_BIT_STRING, "d2i_ASN1_BIT_STRING");

   procedure ASN1_BIT_STRING_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:810
   pragma Import (C, ASN1_BIT_STRING_free, "ASN1_BIT_STRING_free");

   function ASN1_BIT_STRING_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:810
   pragma Import (C, ASN1_BIT_STRING_new, "ASN1_BIT_STRING_new");

   function i2c_ASN1_BIT_STRING (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; pp : System.Address) return int;  -- openssl/asn1.h:811
   pragma Import (C, i2c_ASN1_BIT_STRING, "i2c_ASN1_BIT_STRING");

   function c2i_ASN1_BIT_STRING
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:812
   pragma Import (C, c2i_ASN1_BIT_STRING, "c2i_ASN1_BIT_STRING");

   function ASN1_BIT_STRING_set
     (a      : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      d      : access unsigned_char;
      length : int) return int;  -- openssl/asn1.h:814
   pragma Import (C, ASN1_BIT_STRING_set, "ASN1_BIT_STRING_set");

   function ASN1_BIT_STRING_set_bit
     (a     : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      n     : int;
      value : int) return int;  -- openssl/asn1.h:816
   pragma Import (C, ASN1_BIT_STRING_set_bit, "ASN1_BIT_STRING_set_bit");

   function ASN1_BIT_STRING_get_bit (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; n : int) return int;  -- openssl/asn1.h:817
   pragma Import (C, ASN1_BIT_STRING_get_bit, "ASN1_BIT_STRING_get_bit");

   function ASN1_BIT_STRING_check
     (a         : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      flags     : access unsigned_char;
      flags_len : int) return int;  -- openssl/asn1.h:818
   pragma Import (C, ASN1_BIT_STRING_check, "ASN1_BIT_STRING_check");

   function ASN1_BIT_STRING_name_print
     (c_out  : access OpenSSL.Low_Level.bio_h.bio_st;
      bs     : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      tbl    : access BIT_STRING_BITNAME;
      indent : int) return int;  -- openssl/asn1.h:822
   pragma Import (C, ASN1_BIT_STRING_name_print, "ASN1_BIT_STRING_name_print");

   function ASN1_BIT_STRING_num_asc (name : Interfaces.C.Strings.chars_ptr; tbl : access BIT_STRING_BITNAME) return int;  -- openssl/asn1.h:825
   pragma Import (C, ASN1_BIT_STRING_num_asc, "ASN1_BIT_STRING_num_asc");

   function ASN1_BIT_STRING_set_asc
     (bs    : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      name  : Interfaces.C.Strings.chars_ptr;
      value : int;
      tbl   : access BIT_STRING_BITNAME) return int;  -- openssl/asn1.h:826
   pragma Import (C, ASN1_BIT_STRING_set_asc, "ASN1_BIT_STRING_set_asc");

   function i2d_ASN1_BOOLEAN (a : int; pp : System.Address) return int;  -- openssl/asn1.h:829
   pragma Import (C, i2d_ASN1_BOOLEAN, "i2d_ASN1_BOOLEAN");

   function d2i_ASN1_BOOLEAN
     (a      : access int;
      pp     : System.Address;
      length : long) return int;  -- openssl/asn1.h:830
   pragma Import (C, d2i_ASN1_BOOLEAN, "d2i_ASN1_BOOLEAN");

   ASN1_INTEGER_it : aliased ASN1_ITEM;  -- openssl/asn1.h:832
   pragma Import (C, ASN1_INTEGER_it, "ASN1_INTEGER_it");

   function i2d_ASN1_INTEGER (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:832
   pragma Import (C, i2d_ASN1_INTEGER, "i2d_ASN1_INTEGER");

   function d2i_ASN1_INTEGER
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:832
   pragma Import (C, d2i_ASN1_INTEGER, "d2i_ASN1_INTEGER");

   procedure ASN1_INTEGER_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:832
   pragma Import (C, ASN1_INTEGER_free, "ASN1_INTEGER_free");

   function ASN1_INTEGER_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:832
   pragma Import (C, ASN1_INTEGER_new, "ASN1_INTEGER_new");

   function i2c_ASN1_INTEGER (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; pp : System.Address) return int;  -- openssl/asn1.h:833
   pragma Import (C, i2c_ASN1_INTEGER, "i2c_ASN1_INTEGER");

   function c2i_ASN1_INTEGER
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:834
   pragma Import (C, c2i_ASN1_INTEGER, "c2i_ASN1_INTEGER");

   function d2i_ASN1_UINTEGER
     (a      : System.Address;
      pp     : System.Address;
      length : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:836
   pragma Import (C, d2i_ASN1_UINTEGER, "d2i_ASN1_UINTEGER");

   function ASN1_INTEGER_dup (x : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:838
   pragma Import (C, ASN1_INTEGER_dup, "ASN1_INTEGER_dup");

   function ASN1_INTEGER_cmp (x : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st; y : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/asn1.h:839
   pragma Import (C, ASN1_INTEGER_cmp, "ASN1_INTEGER_cmp");

   ASN1_ENUMERATED_it : aliased ASN1_ITEM;  -- openssl/asn1.h:841
   pragma Import (C, ASN1_ENUMERATED_it, "ASN1_ENUMERATED_it");

   function i2d_ASN1_ENUMERATED (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:841
   pragma Import (C, i2d_ASN1_ENUMERATED, "i2d_ASN1_ENUMERATED");

   function d2i_ASN1_ENUMERATED
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:841
   pragma Import (C, d2i_ASN1_ENUMERATED, "d2i_ASN1_ENUMERATED");

   procedure ASN1_ENUMERATED_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:841
   pragma Import (C, ASN1_ENUMERATED_free, "ASN1_ENUMERATED_free");

   function ASN1_ENUMERATED_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:841
   pragma Import (C, ASN1_ENUMERATED_new, "ASN1_ENUMERATED_new");

   function ASN1_UTCTIME_check (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/asn1.h:843
   pragma Import (C, ASN1_UTCTIME_check, "ASN1_UTCTIME_check");

   function ASN1_UTCTIME_set (s : access OpenSSL.Low_Level.asn1_h.asn1_string_st; t : time_h.time_t) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:844
   pragma Import (C, ASN1_UTCTIME_set, "ASN1_UTCTIME_set");

   function ASN1_UTCTIME_adj
     (s          : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      t          : time_h.time_t;
      offset_day : int;
      offset_sec : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:845
   pragma Import (C, ASN1_UTCTIME_adj, "ASN1_UTCTIME_adj");

   function ASN1_UTCTIME_set_string (s : access OpenSSL.Low_Level.asn1_h.asn1_string_st; str : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/asn1.h:847
   pragma Import (C, ASN1_UTCTIME_set_string, "ASN1_UTCTIME_set_string");

   function ASN1_UTCTIME_cmp_time_t (s : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st; t : time_h.time_t) return int;  -- openssl/asn1.h:848
   pragma Import (C, ASN1_UTCTIME_cmp_time_t, "ASN1_UTCTIME_cmp_time_t");

   function ASN1_GENERALIZEDTIME_check (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/asn1.h:853
   pragma Import (C, ASN1_GENERALIZEDTIME_check, "ASN1_GENERALIZEDTIME_check");

   function ASN1_GENERALIZEDTIME_set (s : access OpenSSL.Low_Level.asn1_h.asn1_string_st; t : time_h.time_t) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:854
   pragma Import (C, ASN1_GENERALIZEDTIME_set, "ASN1_GENERALIZEDTIME_set");

   function ASN1_GENERALIZEDTIME_adj
     (s          : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      t          : time_h.time_t;
      offset_day : int;
      offset_sec : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:855
   pragma Import (C, ASN1_GENERALIZEDTIME_adj, "ASN1_GENERALIZEDTIME_adj");

   function ASN1_GENERALIZEDTIME_set_string (s : access OpenSSL.Low_Level.asn1_h.asn1_string_st; str : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/asn1.h:857
   pragma Import (C, ASN1_GENERALIZEDTIME_set_string, "ASN1_GENERALIZEDTIME_set_string");

   ASN1_OCTET_STRING_it : aliased ASN1_ITEM;  -- openssl/asn1.h:859
   pragma Import (C, ASN1_OCTET_STRING_it, "ASN1_OCTET_STRING_it");

   function i2d_ASN1_OCTET_STRING (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:859
   pragma Import (C, i2d_ASN1_OCTET_STRING, "i2d_ASN1_OCTET_STRING");

   function d2i_ASN1_OCTET_STRING
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:859
   pragma Import (C, d2i_ASN1_OCTET_STRING, "d2i_ASN1_OCTET_STRING");

   procedure ASN1_OCTET_STRING_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:859
   pragma Import (C, ASN1_OCTET_STRING_free, "ASN1_OCTET_STRING_free");

   function ASN1_OCTET_STRING_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:859
   pragma Import (C, ASN1_OCTET_STRING_new, "ASN1_OCTET_STRING_new");

   function ASN1_OCTET_STRING_dup (a : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:860
   pragma Import (C, ASN1_OCTET_STRING_dup, "ASN1_OCTET_STRING_dup");

   function ASN1_OCTET_STRING_cmp (a : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st; b : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/asn1.h:861
   pragma Import (C, ASN1_OCTET_STRING_cmp, "ASN1_OCTET_STRING_cmp");

   function ASN1_OCTET_STRING_set
     (str  : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      data : access unsigned_char;
      len  : int) return int;  -- openssl/asn1.h:862
   pragma Import (C, ASN1_OCTET_STRING_set, "ASN1_OCTET_STRING_set");

   ASN1_VISIBLESTRING_it : aliased ASN1_ITEM;  -- openssl/asn1.h:864
   pragma Import (C, ASN1_VISIBLESTRING_it, "ASN1_VISIBLESTRING_it");

   function i2d_ASN1_VISIBLESTRING (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:864
   pragma Import (C, i2d_ASN1_VISIBLESTRING, "i2d_ASN1_VISIBLESTRING");

   function d2i_ASN1_VISIBLESTRING
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:864
   pragma Import (C, d2i_ASN1_VISIBLESTRING, "d2i_ASN1_VISIBLESTRING");

   procedure ASN1_VISIBLESTRING_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:864
   pragma Import (C, ASN1_VISIBLESTRING_free, "ASN1_VISIBLESTRING_free");

   function ASN1_VISIBLESTRING_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:864
   pragma Import (C, ASN1_VISIBLESTRING_new, "ASN1_VISIBLESTRING_new");

   ASN1_UNIVERSALSTRING_it : aliased ASN1_ITEM;  -- openssl/asn1.h:865
   pragma Import (C, ASN1_UNIVERSALSTRING_it, "ASN1_UNIVERSALSTRING_it");

   function i2d_ASN1_UNIVERSALSTRING (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:865
   pragma Import (C, i2d_ASN1_UNIVERSALSTRING, "i2d_ASN1_UNIVERSALSTRING");

   function d2i_ASN1_UNIVERSALSTRING
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:865
   pragma Import (C, d2i_ASN1_UNIVERSALSTRING, "d2i_ASN1_UNIVERSALSTRING");

   procedure ASN1_UNIVERSALSTRING_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:865
   pragma Import (C, ASN1_UNIVERSALSTRING_free, "ASN1_UNIVERSALSTRING_free");

   function ASN1_UNIVERSALSTRING_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:865
   pragma Import (C, ASN1_UNIVERSALSTRING_new, "ASN1_UNIVERSALSTRING_new");

   ASN1_UTF8STRING_it : aliased ASN1_ITEM;  -- openssl/asn1.h:866
   pragma Import (C, ASN1_UTF8STRING_it, "ASN1_UTF8STRING_it");

   function i2d_ASN1_UTF8STRING (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:866
   pragma Import (C, i2d_ASN1_UTF8STRING, "i2d_ASN1_UTF8STRING");

   function d2i_ASN1_UTF8STRING
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:866
   pragma Import (C, d2i_ASN1_UTF8STRING, "d2i_ASN1_UTF8STRING");

   procedure ASN1_UTF8STRING_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:866
   pragma Import (C, ASN1_UTF8STRING_free, "ASN1_UTF8STRING_free");

   function ASN1_UTF8STRING_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:866
   pragma Import (C, ASN1_UTF8STRING_new, "ASN1_UTF8STRING_new");

   ASN1_NULL_it : aliased ASN1_ITEM;  -- openssl/asn1.h:867
   pragma Import (C, ASN1_NULL_it, "ASN1_NULL_it");

   function i2d_ASN1_NULL (a : access Interfaces.C.int; c_out : System.Address) return int;  -- openssl/asn1.h:867
   pragma Import (C, i2d_ASN1_NULL, "i2d_ASN1_NULL");

   function d2i_ASN1_NULL
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access Interfaces.C.int;  -- openssl/asn1.h:867
   pragma Import (C, d2i_ASN1_NULL, "d2i_ASN1_NULL");

   procedure ASN1_NULL_free (a : access Interfaces.C.int);  -- openssl/asn1.h:867
   pragma Import (C, ASN1_NULL_free, "ASN1_NULL_free");

   function ASN1_NULL_new return access Interfaces.C.int;  -- openssl/asn1.h:867
   pragma Import (C, ASN1_NULL_new, "ASN1_NULL_new");

   ASN1_BMPSTRING_it : aliased ASN1_ITEM;  -- openssl/asn1.h:868
   pragma Import (C, ASN1_BMPSTRING_it, "ASN1_BMPSTRING_it");

   function i2d_ASN1_BMPSTRING (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:868
   pragma Import (C, i2d_ASN1_BMPSTRING, "i2d_ASN1_BMPSTRING");

   function d2i_ASN1_BMPSTRING
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:868
   pragma Import (C, d2i_ASN1_BMPSTRING, "d2i_ASN1_BMPSTRING");

   procedure ASN1_BMPSTRING_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:868
   pragma Import (C, ASN1_BMPSTRING_free, "ASN1_BMPSTRING_free");

   function ASN1_BMPSTRING_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:868
   pragma Import (C, ASN1_BMPSTRING_new, "ASN1_BMPSTRING_new");

   function UTF8_getc
     (str : access unsigned_char;
      len : int;
      val : access unsigned_long) return int;  -- openssl/asn1.h:870
   pragma Import (C, UTF8_getc, "UTF8_getc");

   function UTF8_putc
     (str   : access unsigned_char;
      len   : int;
      value : unsigned_long) return int;  -- openssl/asn1.h:871
   pragma Import (C, UTF8_putc, "UTF8_putc");

   ASN1_PRINTABLE_it : aliased ASN1_ITEM;  -- openssl/asn1.h:873
   pragma Import (C, ASN1_PRINTABLE_it, "ASN1_PRINTABLE_it");

   function i2d_ASN1_PRINTABLE (a : access ASN1_STRING; c_out : System.Address) return int;  -- openssl/asn1.h:873
   pragma Import (C, i2d_ASN1_PRINTABLE, "i2d_ASN1_PRINTABLE");

   function d2i_ASN1_PRINTABLE
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access ASN1_STRING;  -- openssl/asn1.h:873
   pragma Import (C, d2i_ASN1_PRINTABLE, "d2i_ASN1_PRINTABLE");

   procedure ASN1_PRINTABLE_free (a : access ASN1_STRING);  -- openssl/asn1.h:873
   pragma Import (C, ASN1_PRINTABLE_free, "ASN1_PRINTABLE_free");

   function ASN1_PRINTABLE_new return access ASN1_STRING;  -- openssl/asn1.h:873
   pragma Import (C, ASN1_PRINTABLE_new, "ASN1_PRINTABLE_new");

   DIRECTORYSTRING_it : aliased ASN1_ITEM;  -- openssl/asn1.h:875
   pragma Import (C, DIRECTORYSTRING_it, "DIRECTORYSTRING_it");

   function i2d_DIRECTORYSTRING (a : access ASN1_STRING; c_out : System.Address) return int;  -- openssl/asn1.h:875
   pragma Import (C, i2d_DIRECTORYSTRING, "i2d_DIRECTORYSTRING");

   function d2i_DIRECTORYSTRING
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access ASN1_STRING;  -- openssl/asn1.h:875
   pragma Import (C, d2i_DIRECTORYSTRING, "d2i_DIRECTORYSTRING");

   procedure DIRECTORYSTRING_free (a : access ASN1_STRING);  -- openssl/asn1.h:875
   pragma Import (C, DIRECTORYSTRING_free, "DIRECTORYSTRING_free");

   function DIRECTORYSTRING_new return access ASN1_STRING;  -- openssl/asn1.h:875
   pragma Import (C, DIRECTORYSTRING_new, "DIRECTORYSTRING_new");

   DISPLAYTEXT_it : aliased ASN1_ITEM;  -- openssl/asn1.h:876
   pragma Import (C, DISPLAYTEXT_it, "DISPLAYTEXT_it");

   function i2d_DISPLAYTEXT (a : access ASN1_STRING; c_out : System.Address) return int;  -- openssl/asn1.h:876
   pragma Import (C, i2d_DISPLAYTEXT, "i2d_DISPLAYTEXT");

   function d2i_DISPLAYTEXT
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access ASN1_STRING;  -- openssl/asn1.h:876
   pragma Import (C, d2i_DISPLAYTEXT, "d2i_DISPLAYTEXT");

   procedure DISPLAYTEXT_free (a : access ASN1_STRING);  -- openssl/asn1.h:876
   pragma Import (C, DISPLAYTEXT_free, "DISPLAYTEXT_free");

   function DISPLAYTEXT_new return access ASN1_STRING;  -- openssl/asn1.h:876
   pragma Import (C, DISPLAYTEXT_new, "DISPLAYTEXT_new");

   ASN1_PRINTABLESTRING_it : aliased ASN1_ITEM;  -- openssl/asn1.h:877
   pragma Import (C, ASN1_PRINTABLESTRING_it, "ASN1_PRINTABLESTRING_it");

   function i2d_ASN1_PRINTABLESTRING (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:877
   pragma Import (C, i2d_ASN1_PRINTABLESTRING, "i2d_ASN1_PRINTABLESTRING");

   function d2i_ASN1_PRINTABLESTRING
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:877
   pragma Import (C, d2i_ASN1_PRINTABLESTRING, "d2i_ASN1_PRINTABLESTRING");

   procedure ASN1_PRINTABLESTRING_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:877
   pragma Import (C, ASN1_PRINTABLESTRING_free, "ASN1_PRINTABLESTRING_free");

   function ASN1_PRINTABLESTRING_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:877
   pragma Import (C, ASN1_PRINTABLESTRING_new, "ASN1_PRINTABLESTRING_new");

   ASN1_T61STRING_it : aliased ASN1_ITEM;  -- openssl/asn1.h:878
   pragma Import (C, ASN1_T61STRING_it, "ASN1_T61STRING_it");

   function i2d_ASN1_T61STRING (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:878
   pragma Import (C, i2d_ASN1_T61STRING, "i2d_ASN1_T61STRING");

   function d2i_ASN1_T61STRING
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:878
   pragma Import (C, d2i_ASN1_T61STRING, "d2i_ASN1_T61STRING");

   procedure ASN1_T61STRING_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:878
   pragma Import (C, ASN1_T61STRING_free, "ASN1_T61STRING_free");

   function ASN1_T61STRING_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:878
   pragma Import (C, ASN1_T61STRING_new, "ASN1_T61STRING_new");

   ASN1_IA5STRING_it : aliased ASN1_ITEM;  -- openssl/asn1.h:879
   pragma Import (C, ASN1_IA5STRING_it, "ASN1_IA5STRING_it");

   function i2d_ASN1_IA5STRING (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:879
   pragma Import (C, i2d_ASN1_IA5STRING, "i2d_ASN1_IA5STRING");

   function d2i_ASN1_IA5STRING
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:879
   pragma Import (C, d2i_ASN1_IA5STRING, "d2i_ASN1_IA5STRING");

   procedure ASN1_IA5STRING_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:879
   pragma Import (C, ASN1_IA5STRING_free, "ASN1_IA5STRING_free");

   function ASN1_IA5STRING_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:879
   pragma Import (C, ASN1_IA5STRING_new, "ASN1_IA5STRING_new");

   ASN1_GENERALSTRING_it : aliased ASN1_ITEM;  -- openssl/asn1.h:880
   pragma Import (C, ASN1_GENERALSTRING_it, "ASN1_GENERALSTRING_it");

   function i2d_ASN1_GENERALSTRING (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:880
   pragma Import (C, i2d_ASN1_GENERALSTRING, "i2d_ASN1_GENERALSTRING");

   function d2i_ASN1_GENERALSTRING
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:880
   pragma Import (C, d2i_ASN1_GENERALSTRING, "d2i_ASN1_GENERALSTRING");

   procedure ASN1_GENERALSTRING_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:880
   pragma Import (C, ASN1_GENERALSTRING_free, "ASN1_GENERALSTRING_free");

   function ASN1_GENERALSTRING_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:880
   pragma Import (C, ASN1_GENERALSTRING_new, "ASN1_GENERALSTRING_new");

   ASN1_UTCTIME_it : aliased ASN1_ITEM;  -- openssl/asn1.h:881
   pragma Import (C, ASN1_UTCTIME_it, "ASN1_UTCTIME_it");

   function i2d_ASN1_UTCTIME (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:881
   pragma Import (C, i2d_ASN1_UTCTIME, "i2d_ASN1_UTCTIME");

   function d2i_ASN1_UTCTIME
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:881
   pragma Import (C, d2i_ASN1_UTCTIME, "d2i_ASN1_UTCTIME");

   procedure ASN1_UTCTIME_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:881
   pragma Import (C, ASN1_UTCTIME_free, "ASN1_UTCTIME_free");

   function ASN1_UTCTIME_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:881
   pragma Import (C, ASN1_UTCTIME_new, "ASN1_UTCTIME_new");

   ASN1_GENERALIZEDTIME_it : aliased ASN1_ITEM;  -- openssl/asn1.h:882
   pragma Import (C, ASN1_GENERALIZEDTIME_it, "ASN1_GENERALIZEDTIME_it");

   function i2d_ASN1_GENERALIZEDTIME (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:882
   pragma Import (C, i2d_ASN1_GENERALIZEDTIME, "i2d_ASN1_GENERALIZEDTIME");

   function d2i_ASN1_GENERALIZEDTIME
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:882
   pragma Import (C, d2i_ASN1_GENERALIZEDTIME, "d2i_ASN1_GENERALIZEDTIME");

   procedure ASN1_GENERALIZEDTIME_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:882
   pragma Import (C, ASN1_GENERALIZEDTIME_free, "ASN1_GENERALIZEDTIME_free");

   function ASN1_GENERALIZEDTIME_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:882
   pragma Import (C, ASN1_GENERALIZEDTIME_new, "ASN1_GENERALIZEDTIME_new");

   ASN1_TIME_it : aliased ASN1_ITEM;  -- openssl/asn1.h:883
   pragma Import (C, ASN1_TIME_it, "ASN1_TIME_it");

   function i2d_ASN1_TIME (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return int;  -- openssl/asn1.h:883
   pragma Import (C, i2d_ASN1_TIME, "i2d_ASN1_TIME");

   function d2i_ASN1_TIME
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:883
   pragma Import (C, d2i_ASN1_TIME, "d2i_ASN1_TIME");

   procedure ASN1_TIME_free (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st);  -- openssl/asn1.h:883
   pragma Import (C, ASN1_TIME_free, "ASN1_TIME_free");

   function ASN1_TIME_new return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:883
   pragma Import (C, ASN1_TIME_new, "ASN1_TIME_new");

   ASN1_OCTET_STRING_NDEF_it : aliased ASN1_ITEM;  -- openssl/asn1.h:885
   pragma Import (C, ASN1_OCTET_STRING_NDEF_it, "ASN1_OCTET_STRING_NDEF_it");

   function ASN1_TIME_set (s : access OpenSSL.Low_Level.asn1_h.asn1_string_st; t : time_h.time_t) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:887
   pragma Import (C, ASN1_TIME_set, "ASN1_TIME_set");

   function ASN1_TIME_adj
     (s          : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      t          : time_h.time_t;
      offset_day : int;
      offset_sec : long) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:888
   pragma Import (C, ASN1_TIME_adj, "ASN1_TIME_adj");

   function ASN1_TIME_check (t : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/asn1.h:890
   pragma Import (C, ASN1_TIME_check, "ASN1_TIME_check");

   function ASN1_TIME_to_generalizedtime (t : access OpenSSL.Low_Level.asn1_h.asn1_string_st; c_out : System.Address) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:891
   pragma Import (C, ASN1_TIME_to_generalizedtime, "ASN1_TIME_to_generalizedtime");

   function ASN1_TIME_set_string (s : access OpenSSL.Low_Level.asn1_h.asn1_string_st; str : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/asn1.h:892
   pragma Import (C, ASN1_TIME_set_string, "ASN1_TIME_set_string");

   function i2d_ASN1_SET
     (a        : access OpenSSL.Low_Level.safestack_h.stack_st_OPENSSL_BLOCK;
      pp       : System.Address;
      i2d      : access function (arg1 : System.Address; arg2 : System.Address) return int;
      ex_tag   : int;
      ex_class : int;
      is_set   : int) return int;  -- openssl/asn1.h:894
   pragma Import (C, i2d_ASN1_SET, "i2d_ASN1_SET");

   function d2i_ASN1_SET
     (a         : System.Address;
      pp        : System.Address;
      length    : long;
      d2i       : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : long) return System.Address;
      free_func : access procedure (arg1 : OpenSSL.Low_Level.safestack_h.OPENSSL_BLOCK);
      ex_tag    : int;
      ex_class  : int) return access OpenSSL.Low_Level.safestack_h.stack_st_OPENSSL_BLOCK;  -- openssl/asn1.h:897
   pragma Import (C, d2i_ASN1_SET, "d2i_ASN1_SET");

   function i2a_ASN1_INTEGER (bp : access OpenSSL.Low_Level.bio_h.bio_st; a : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/asn1.h:904
   pragma Import (C, i2a_ASN1_INTEGER, "i2a_ASN1_INTEGER");

   function a2i_ASN1_INTEGER
     (bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      bs   : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      buf  : Interfaces.C.Strings.chars_ptr;
      size : int) return int;  -- openssl/asn1.h:905
   pragma Import (C, a2i_ASN1_INTEGER, "a2i_ASN1_INTEGER");

   function i2a_ASN1_ENUMERATED (bp : access OpenSSL.Low_Level.bio_h.bio_st; a : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/asn1.h:906
   pragma Import (C, i2a_ASN1_ENUMERATED, "i2a_ASN1_ENUMERATED");

   function a2i_ASN1_ENUMERATED
     (bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      bs   : access OpenSSL.Low_Level.asn1_h.asn1_string_st;
      buf  : Interfaces.C.Strings.chars_ptr;
      size : int) return int;  -- openssl/asn1.h:907
   pragma Import (C, a2i_ASN1_ENUMERATED, "a2i_ASN1_ENUMERATED");

   function i2a_ASN1_OBJECT (bp : access OpenSSL.Low_Level.bio_h.bio_st; a : access ASN1_OBJECT) return int;  -- openssl/asn1.h:908
   pragma Import (C, i2a_ASN1_OBJECT, "i2a_ASN1_OBJECT");

   function a2i_ASN1_STRING
     (bp   : access OpenSSL.Low_Level.bio_h.bio_st;
      bs   : access ASN1_STRING;
      buf  : Interfaces.C.Strings.chars_ptr;
      size : int) return int;  -- openssl/asn1.h:909
   pragma Import (C, a2i_ASN1_STRING, "a2i_ASN1_STRING");

   function i2a_ASN1_STRING
     (bp     : access OpenSSL.Low_Level.bio_h.bio_st;
      a      : access ASN1_STRING;
      c_type : int) return int;  -- openssl/asn1.h:910
   pragma Import (C, i2a_ASN1_STRING, "i2a_ASN1_STRING");

   function i2t_ASN1_OBJECT
     (buf     : Interfaces.C.Strings.chars_ptr;
      buf_len : int;
      a       : access ASN1_OBJECT) return int;  -- openssl/asn1.h:912
   pragma Import (C, i2t_ASN1_OBJECT, "i2t_ASN1_OBJECT");

   function a2d_ASN1_OBJECT
     (c_out : access unsigned_char;
      olen  : int;
      buf   : Interfaces.C.Strings.chars_ptr;
      num   : int) return int;  -- openssl/asn1.h:914
   pragma Import (C, a2d_ASN1_OBJECT, "a2d_ASN1_OBJECT");

   function ASN1_OBJECT_create
     (nid  : int;
      data : access unsigned_char;
      len  : int;
      sn   : Interfaces.C.Strings.chars_ptr;
      ln   : Interfaces.C.Strings.chars_ptr) return access ASN1_OBJECT;  -- openssl/asn1.h:915
   pragma Import (C, ASN1_OBJECT_create, "ASN1_OBJECT_create");

   function ASN1_INTEGER_set (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; v : long) return int;  -- openssl/asn1.h:918
   pragma Import (C, ASN1_INTEGER_set, "ASN1_INTEGER_set");

   function ASN1_INTEGER_get (a : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return long;  -- openssl/asn1.h:919
   pragma Import (C, ASN1_INTEGER_get, "ASN1_INTEGER_get");

   function BN_to_ASN1_INTEGER (bn : access constant OpenSSL.Low_Level.bn_h.bignum_st; ai : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:920
   pragma Import (C, BN_to_ASN1_INTEGER, "BN_to_ASN1_INTEGER");

   function ASN1_INTEGER_to_BN (ai : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st; bn : access OpenSSL.Low_Level.bn_h.bignum_st) return access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/asn1.h:921
   pragma Import (C, ASN1_INTEGER_to_BN, "ASN1_INTEGER_to_BN");

   function ASN1_ENUMERATED_set (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st; v : long) return int;  -- openssl/asn1.h:923
   pragma Import (C, ASN1_ENUMERATED_set, "ASN1_ENUMERATED_set");

   function ASN1_ENUMERATED_get (a : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return long;  -- openssl/asn1.h:924
   pragma Import (C, ASN1_ENUMERATED_get, "ASN1_ENUMERATED_get");

   function BN_to_ASN1_ENUMERATED (bn : access OpenSSL.Low_Level.bn_h.bignum_st; ai : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/asn1.h:925
   pragma Import (C, BN_to_ASN1_ENUMERATED, "BN_to_ASN1_ENUMERATED");

   function ASN1_ENUMERATED_to_BN (ai : access OpenSSL.Low_Level.asn1_h.asn1_string_st; bn : access OpenSSL.Low_Level.bn_h.bignum_st) return access OpenSSL.Low_Level.bn_h.bignum_st;  -- openssl/asn1.h:926
   pragma Import (C, ASN1_ENUMERATED_to_BN, "ASN1_ENUMERATED_to_BN");

   function ASN1_PRINTABLE_type (s : access unsigned_char; max : int) return int;  -- openssl/asn1.h:930
   pragma Import (C, ASN1_PRINTABLE_type, "ASN1_PRINTABLE_type");

   function i2d_ASN1_bytes
     (a      : access ASN1_STRING;
      pp     : System.Address;
      tag    : int;
      xclass : int) return int;  -- openssl/asn1.h:932
   pragma Import (C, i2d_ASN1_bytes, "i2d_ASN1_bytes");

   function d2i_ASN1_bytes
     (a      : System.Address;
      pp     : System.Address;
      length : long;
      Ptag   : int;
      Pclass : int) return access ASN1_STRING;  -- openssl/asn1.h:933
   pragma Import (C, d2i_ASN1_bytes, "d2i_ASN1_bytes");

   function ASN1_tag2bit (tag : int) return unsigned_long;  -- openssl/asn1.h:935
   pragma Import (C, ASN1_tag2bit, "ASN1_tag2bit");

   function d2i_ASN1_type_bytes
     (a      : System.Address;
      pp     : System.Address;
      length : long;
      c_type : int) return access ASN1_STRING;  -- openssl/asn1.h:937
   pragma Import (C, d2i_ASN1_type_bytes, "d2i_ASN1_type_bytes");

   function asn1_Finish (c : access ASN1_CTX) return int;  -- openssl/asn1.h:941
   pragma Import (C, asn1_Finish, "asn1_Finish");

   function asn1_const_Finish (c : access ASN1_const_CTX) return int;  -- openssl/asn1.h:942
   pragma Import (C, asn1_const_Finish, "asn1_const_Finish");

   function ASN1_get_object
     (pp      : System.Address;
      plength : access long;
      ptag    : access int;
      pclass  : access int;
      omax    : long) return int;  -- openssl/asn1.h:945
   pragma Import (C, ASN1_get_object, "ASN1_get_object");

   function ASN1_check_infinite_end (p : System.Address; len : long) return int;  -- openssl/asn1.h:947
   pragma Import (C, ASN1_check_infinite_end, "ASN1_check_infinite_end");

   function ASN1_const_check_infinite_end (p : System.Address; len : long) return int;  -- openssl/asn1.h:948
   pragma Import (C, ASN1_const_check_infinite_end, "ASN1_const_check_infinite_end");

   procedure ASN1_put_object
     (pp          : System.Address;
      constructed : int;
      length      : int;
      tag         : int;
      xclass      : int);  -- openssl/asn1.h:949
   pragma Import (C, ASN1_put_object, "ASN1_put_object");

   function ASN1_put_eoc (pp : System.Address) return int;  -- openssl/asn1.h:951
   pragma Import (C, ASN1_put_eoc, "ASN1_put_eoc");

   function ASN1_object_size
     (constructed : int;
      length      : int;
      tag         : int) return int;  -- openssl/asn1.h:952
   pragma Import (C, ASN1_object_size, "ASN1_object_size");

   function ASN1_dup
     (i2d : access function (arg1 : System.Address; arg2 : System.Address) return int;
      d2i : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : long) return System.Address;
      x   : System.Address) return System.Address;  -- openssl/asn1.h:955
   pragma Import (C, ASN1_dup, "ASN1_dup");

   function ASN1_item_dup (it : System.Address; x : System.Address) return System.Address;  -- openssl/asn1.h:967
   pragma Import (C, ASN1_item_dup, "ASN1_item_dup");

   function ASN1_d2i_fp
     (xnew : access function return System.Address;
      d2i  : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : long) return System.Address;
      c_in : access Interfaces.C_Streams.FILEs;
      x    : System.Address) return System.Address;  -- openssl/asn1.h:976
   pragma Import (C, ASN1_d2i_fp, "ASN1_d2i_fp");

   function ASN1_item_d2i_fp
     (it   : System.Address;
      c_in : access Interfaces.C_Streams.FILEs;
      x    : System.Address) return System.Address;  -- openssl/asn1.h:984
   pragma Import (C, ASN1_item_d2i_fp, "ASN1_item_d2i_fp");

   function ASN1_i2d_fp
     (i2d   : access function (arg1 : System.Address; arg2 : System.Address) return int;
      c_out : access Interfaces.C_Streams.FILEs;
      x     : System.Address) return int;  -- openssl/asn1.h:985
   pragma Import (C, ASN1_i2d_fp, "ASN1_i2d_fp");

   function ASN1_item_i2d_fp
     (it    : System.Address;
      c_out : access Interfaces.C_Streams.FILEs;
      x     : System.Address) return int;  -- openssl/asn1.h:997
   pragma Import (C, ASN1_item_i2d_fp, "ASN1_item_i2d_fp");

   function ASN1_STRING_print_ex_fp
     (fp    : access Interfaces.C_Streams.FILEs;
      str   : access ASN1_STRING;
      flags : unsigned_long) return int;  -- openssl/asn1.h:998
   pragma Import (C, ASN1_STRING_print_ex_fp, "ASN1_STRING_print_ex_fp");

   function ASN1_STRING_to_UTF8 (c_out : System.Address; c_in : access ASN1_STRING) return int;  -- openssl/asn1.h:1001
   pragma Import (C, ASN1_STRING_to_UTF8, "ASN1_STRING_to_UTF8");

   function ASN1_d2i_bio
     (xnew : access function return System.Address;
      d2i  : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : long) return System.Address;
      c_in : access OpenSSL.Low_Level.bio_h.bio_st;
      x    : System.Address) return System.Address;  -- openssl/asn1.h:1004
   pragma Import (C, ASN1_d2i_bio, "ASN1_d2i_bio");

   function ASN1_item_d2i_bio
     (it   : System.Address;
      c_in : access OpenSSL.Low_Level.bio_h.bio_st;
      x    : System.Address) return System.Address;  -- openssl/asn1.h:1012
   pragma Import (C, ASN1_item_d2i_bio, "ASN1_item_d2i_bio");

   function ASN1_i2d_bio
     (i2d   : access function (arg1 : System.Address; arg2 : System.Address) return int;
      c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      x     : access unsigned_char) return int;  -- openssl/asn1.h:1013
   pragma Import (C, ASN1_i2d_bio, "ASN1_i2d_bio");

   function ASN1_item_i2d_bio
     (it    : System.Address;
      c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      x     : System.Address) return int;  -- openssl/asn1.h:1025
   pragma Import (C, ASN1_item_i2d_bio, "ASN1_item_i2d_bio");

   function ASN1_UTCTIME_print (fp : access OpenSSL.Low_Level.bio_h.bio_st; a : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/asn1.h:1026
   pragma Import (C, ASN1_UTCTIME_print, "ASN1_UTCTIME_print");

   function ASN1_GENERALIZEDTIME_print (fp : access OpenSSL.Low_Level.bio_h.bio_st; a : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/asn1.h:1027
   pragma Import (C, ASN1_GENERALIZEDTIME_print, "ASN1_GENERALIZEDTIME_print");

   function ASN1_TIME_print (fp : access OpenSSL.Low_Level.bio_h.bio_st; a : access constant OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/asn1.h:1028
   pragma Import (C, ASN1_TIME_print, "ASN1_TIME_print");

   function ASN1_STRING_print (bp : access OpenSSL.Low_Level.bio_h.bio_st; v : System.Address) return int;  -- openssl/asn1.h:1029
   pragma Import (C, ASN1_STRING_print, "ASN1_STRING_print");

   function ASN1_STRING_print_ex
     (c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      str   : access ASN1_STRING;
      flags : unsigned_long) return int;  -- openssl/asn1.h:1030
   pragma Import (C, ASN1_STRING_print_ex, "ASN1_STRING_print_ex");

   function ASN1_bn_print
     (bp     : access OpenSSL.Low_Level.bio_h.bio_st;
      number : Interfaces.C.Strings.chars_ptr;
      num    : access constant OpenSSL.Low_Level.bn_h.bignum_st;
      buf    : access unsigned_char;
      off    : int) return int;  -- openssl/asn1.h:1031
   pragma Import (C, ASN1_bn_print, "ASN1_bn_print");

   function ASN1_parse
     (bp     : access OpenSSL.Low_Level.bio_h.bio_st;
      pp     : access unsigned_char;
      len    : long;
      indent : int) return int;  -- openssl/asn1.h:1033
   pragma Import (C, ASN1_parse, "ASN1_parse");

   function ASN1_parse_dump
     (bp     : access OpenSSL.Low_Level.bio_h.bio_st;
      pp     : access unsigned_char;
      len    : long;
      indent : int;
      dump   : int) return int;  -- openssl/asn1.h:1034
   pragma Import (C, ASN1_parse_dump, "ASN1_parse_dump");

   function ASN1_tag2str (tag : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/asn1.h:1036
   pragma Import (C, ASN1_tag2str, "ASN1_tag2str");

   NETSCAPE_X509_it : aliased ASN1_ITEM;  -- openssl/asn1.h:1040
   pragma Import (C, NETSCAPE_X509_it, "NETSCAPE_X509_it");

   function i2d_NETSCAPE_X509 (a : access NETSCAPE_X509; c_out : System.Address) return int;  -- openssl/asn1.h:1040
   pragma Import (C, i2d_NETSCAPE_X509, "i2d_NETSCAPE_X509");

   function d2i_NETSCAPE_X509
     (a    : System.Address;
      c_in : System.Address;
      len  : long) return access NETSCAPE_X509;  -- openssl/asn1.h:1040
   pragma Import (C, d2i_NETSCAPE_X509, "d2i_NETSCAPE_X509");

   procedure NETSCAPE_X509_free (a : access NETSCAPE_X509);  -- openssl/asn1.h:1040
   pragma Import (C, NETSCAPE_X509_free, "NETSCAPE_X509_free");

   function NETSCAPE_X509_new return access NETSCAPE_X509;  -- openssl/asn1.h:1040
   pragma Import (C, NETSCAPE_X509_new, "NETSCAPE_X509_new");

   function ASN1_UNIVERSALSTRING_to_string (s : access OpenSSL.Low_Level.asn1_h.asn1_string_st) return int;  -- openssl/asn1.h:1042
   pragma Import (C, ASN1_UNIVERSALSTRING_to_string, "ASN1_UNIVERSALSTRING_to_string");

   function ASN1_TYPE_set_octetstring
     (a    : access ASN1_TYPE;
      data : access unsigned_char;
      len  : int) return int;  -- openssl/asn1.h:1044
   pragma Import (C, ASN1_TYPE_set_octetstring, "ASN1_TYPE_set_octetstring");

   function ASN1_TYPE_get_octetstring
     (a       : access ASN1_TYPE;
      data    : access unsigned_char;
      max_len : int) return int;  -- openssl/asn1.h:1046
   pragma Import (C, ASN1_TYPE_get_octetstring, "ASN1_TYPE_get_octetstring");

   function ASN1_TYPE_set_int_octetstring
     (a    : access ASN1_TYPE;
      num  : long;
      data : access unsigned_char;
      len  : int) return int;  -- openssl/asn1.h:1048
   pragma Import (C, ASN1_TYPE_set_int_octetstring, "ASN1_TYPE_set_int_octetstring");

   function ASN1_TYPE_get_int_octetstring
     (a       : access ASN1_TYPE;
      num     : access long;
      data    : access unsigned_char;
      max_len : int) return int;  -- openssl/asn1.h:1050
   pragma Import (C, ASN1_TYPE_get_int_octetstring, "ASN1_TYPE_get_int_octetstring");

   function ASN1_seq_unpack
     (buf       : access unsigned_char;
      len       : int;
      d2i       : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : long) return System.Address;
      free_func : access procedure (arg1 : OpenSSL.Low_Level.safestack_h.OPENSSL_BLOCK)) return access OpenSSL.Low_Level.safestack_h.stack_st_OPENSSL_BLOCK;  -- openssl/asn1.h:1053
   pragma Import (C, ASN1_seq_unpack, "ASN1_seq_unpack");

   function ASN1_seq_pack
     (safes : access OpenSSL.Low_Level.safestack_h.stack_st_OPENSSL_BLOCK;
      i2d   : access function (arg1 : System.Address; arg2 : System.Address) return int;
      buf   : System.Address;
      len   : access int) return access unsigned_char;  -- openssl/asn1.h:1055
   pragma Import (C, ASN1_seq_pack, "ASN1_seq_pack");

   function ASN1_unpack_string (oct : access ASN1_STRING; d2i : access function
                                  (arg1 : System.Address;
                                   arg2 : System.Address;
                                   arg3 : long) return System.Address) return System.Address;  -- openssl/asn1.h:1057
   pragma Import (C, ASN1_unpack_string, "ASN1_unpack_string");

   function ASN1_item_unpack (oct : access ASN1_STRING; it : System.Address) return System.Address;  -- openssl/asn1.h:1058
   pragma Import (C, ASN1_item_unpack, "ASN1_item_unpack");

   function ASN1_pack_string
     (obj : System.Address;
      i2d : access function (arg1 : System.Address; arg2 : System.Address) return int;
      oct : System.Address) return access ASN1_STRING;  -- openssl/asn1.h:1059
   pragma Import (C, ASN1_pack_string, "ASN1_pack_string");

   function ASN1_item_pack
     (obj : System.Address;
      it  : System.Address;
      oct : System.Address) return access ASN1_STRING;  -- openssl/asn1.h:1067
   pragma Import (C, ASN1_item_pack, "ASN1_item_pack");

   procedure ASN1_STRING_set_default_mask (mask : unsigned_long);  -- openssl/asn1.h:1069
   pragma Import (C, ASN1_STRING_set_default_mask, "ASN1_STRING_set_default_mask");

   function ASN1_STRING_set_default_mask_asc (p : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/asn1.h:1070
   pragma Import (C, ASN1_STRING_set_default_mask_asc, "ASN1_STRING_set_default_mask_asc");

   function ASN1_STRING_get_default_mask return unsigned_long;  -- openssl/asn1.h:1071
   pragma Import (C, ASN1_STRING_get_default_mask, "ASN1_STRING_get_default_mask");

   function ASN1_mbstring_copy
     (c_out  : System.Address;
      c_in   : access unsigned_char;
      len    : int;
      inform : int;
      mask   : unsigned_long) return int;  -- openssl/asn1.h:1072
   pragma Import (C, ASN1_mbstring_copy, "ASN1_mbstring_copy");

   function ASN1_mbstring_ncopy
     (c_out   : System.Address;
      c_in    : access unsigned_char;
      len     : int;
      inform  : int;
      mask    : unsigned_long;
      minsize : long;
      maxsize : long) return int;  -- openssl/asn1.h:1074
   pragma Import (C, ASN1_mbstring_ncopy, "ASN1_mbstring_ncopy");

   function ASN1_STRING_set_by_NID
     (c_out  : System.Address;
      c_in   : access unsigned_char;
      inlen  : int;
      inform : int;
      nid    : int) return access ASN1_STRING;  -- openssl/asn1.h:1078
   pragma Import (C, ASN1_STRING_set_by_NID, "ASN1_STRING_set_by_NID");

   function ASN1_STRING_TABLE_get (nid : int) return access ASN1_STRING_TABLE;  -- openssl/asn1.h:1080
   pragma Import (C, ASN1_STRING_TABLE_get, "ASN1_STRING_TABLE_get");

   function ASN1_STRING_TABLE_add
     (arg1 : int;
      arg2 : long;
      arg3 : long;
      arg4 : unsigned_long;
      arg5 : unsigned_long) return int;  -- openssl/asn1.h:1081
   pragma Import (C, ASN1_STRING_TABLE_add, "ASN1_STRING_TABLE_add");

   procedure ASN1_STRING_TABLE_cleanup;  -- openssl/asn1.h:1082
   pragma Import (C, ASN1_STRING_TABLE_cleanup, "ASN1_STRING_TABLE_cleanup");

   function ASN1_item_new (it : System.Address) return System.Address;  -- openssl/asn1.h:1087
   pragma Import (C, ASN1_item_new, "ASN1_item_new");

   procedure ASN1_item_free (val : System.Address; it : System.Address);  -- openssl/asn1.h:1088
   pragma Import (C, ASN1_item_free, "ASN1_item_free");

   function ASN1_item_d2i
     (val  : System.Address;
      c_in : System.Address;
      len  : long;
      it   : System.Address) return System.Address;  -- openssl/asn1.h:1089
   pragma Import (C, ASN1_item_d2i, "ASN1_item_d2i");

   function ASN1_item_i2d
     (val   : System.Address;
      c_out : System.Address;
      it    : System.Address) return int;  -- openssl/asn1.h:1090
   pragma Import (C, ASN1_item_i2d, "ASN1_item_i2d");

   function ASN1_item_ndef_i2d
     (val   : System.Address;
      c_out : System.Address;
      it    : System.Address) return int;  -- openssl/asn1.h:1091
   pragma Import (C, ASN1_item_ndef_i2d, "ASN1_item_ndef_i2d");

   procedure ASN1_add_oid_module;  -- openssl/asn1.h:1093
   pragma Import (C, ASN1_add_oid_module, "ASN1_add_oid_module");

   function ASN1_generate_nconf (str : Interfaces.C.Strings.chars_ptr; nconf : access OpenSSL.Low_Level.conf_h.conf_st) return access ASN1_TYPE;  -- openssl/asn1.h:1095
   pragma Import (C, ASN1_generate_nconf, "ASN1_generate_nconf");

   function ASN1_generate_v3 (str : Interfaces.C.Strings.chars_ptr; cnf : access OpenSSL.Low_Level.x509_h.x509_stV3_CTX) return access ASN1_TYPE;  -- openssl/asn1.h:1096
   pragma Import (C, ASN1_generate_v3, "ASN1_generate_v3");

   function ASN1_item_print
     (c_out  : access OpenSSL.Low_Level.bio_h.bio_st;
      ifld   : System.Address;
      indent : int;
      it     : System.Address;
      pctx   : System.Address) return int;  -- openssl/asn1.h:1119
   pragma Import (C, ASN1_item_print, "ASN1_item_print");

   function ASN1_PCTX_new return System.Address;  -- openssl/asn1.h:1121
   pragma Import (C, ASN1_PCTX_new, "ASN1_PCTX_new");

   procedure ASN1_PCTX_free (p : System.Address);  -- openssl/asn1.h:1122
   pragma Import (C, ASN1_PCTX_free, "ASN1_PCTX_free");

   function ASN1_PCTX_get_flags (p : System.Address) return unsigned_long;  -- openssl/asn1.h:1123
   pragma Import (C, ASN1_PCTX_get_flags, "ASN1_PCTX_get_flags");

   procedure ASN1_PCTX_set_flags (p : System.Address; flags : unsigned_long);  -- openssl/asn1.h:1124
   pragma Import (C, ASN1_PCTX_set_flags, "ASN1_PCTX_set_flags");

   function ASN1_PCTX_get_nm_flags (p : System.Address) return unsigned_long;  -- openssl/asn1.h:1125
   pragma Import (C, ASN1_PCTX_get_nm_flags, "ASN1_PCTX_get_nm_flags");

   procedure ASN1_PCTX_set_nm_flags (p : System.Address; flags : unsigned_long);  -- openssl/asn1.h:1126
   pragma Import (C, ASN1_PCTX_set_nm_flags, "ASN1_PCTX_set_nm_flags");

   function ASN1_PCTX_get_cert_flags (p : System.Address) return unsigned_long;  -- openssl/asn1.h:1127
   pragma Import (C, ASN1_PCTX_get_cert_flags, "ASN1_PCTX_get_cert_flags");

   procedure ASN1_PCTX_set_cert_flags (p : System.Address; flags : unsigned_long);  -- openssl/asn1.h:1128
   pragma Import (C, ASN1_PCTX_set_cert_flags, "ASN1_PCTX_set_cert_flags");

   function ASN1_PCTX_get_oid_flags (p : System.Address) return unsigned_long;  -- openssl/asn1.h:1129
   pragma Import (C, ASN1_PCTX_get_oid_flags, "ASN1_PCTX_get_oid_flags");

   procedure ASN1_PCTX_set_oid_flags (p : System.Address; flags : unsigned_long);  -- openssl/asn1.h:1130
   pragma Import (C, ASN1_PCTX_set_oid_flags, "ASN1_PCTX_set_oid_flags");

   function ASN1_PCTX_get_str_flags (p : System.Address) return unsigned_long;  -- openssl/asn1.h:1131
   pragma Import (C, ASN1_PCTX_get_str_flags, "ASN1_PCTX_get_str_flags");

   procedure ASN1_PCTX_set_str_flags (p : System.Address; flags : unsigned_long);  -- openssl/asn1.h:1132
   pragma Import (C, ASN1_PCTX_set_str_flags, "ASN1_PCTX_set_str_flags");

   function BIO_f_asn1 return access OpenSSL.Low_Level.bio_h.bio_st_METHOD;  -- openssl/asn1.h:1134
   pragma Import (C, BIO_f_asn1, "BIO_f_asn1");

   function BIO_new_NDEF
     (c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      val   : System.Address;
      it    : System.Address) return access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/asn1.h:1136
   pragma Import (C, BIO_new_NDEF, "BIO_new_NDEF");

   function i2d_ASN1_bio_stream
     (c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      val   : System.Address;
      c_in  : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : int;
      it    : System.Address) return int;  -- openssl/asn1.h:1138
   pragma Import (C, i2d_ASN1_bio_stream, "i2d_ASN1_bio_stream");

   function PEM_write_bio_ASN1_stream
     (c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      val   : System.Address;
      c_in  : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : int;
      hdr   : Interfaces.C.Strings.chars_ptr;
      it    : System.Address) return int;  -- openssl/asn1.h:1140
   pragma Import (C, PEM_write_bio_ASN1_stream, "PEM_write_bio_ASN1_stream");

   function SMIME_write_ASN1
     (the_bio   : access OpenSSL.Low_Level.bio_h.bio_st;
      val       : System.Address;
      data      : access OpenSSL.Low_Level.bio_h.bio_st;
      flags     : int;
      ctype_nid : int;
      econt_nid : int;
      mdalgs    : access stack_st_X509_ALGOR;
      it        : System.Address) return int;  -- openssl/asn1.h:1143
   pragma Import (C, SMIME_write_ASN1, "SMIME_write_ASN1");

   function SMIME_read_ASN1
     (the_bio : access OpenSSL.Low_Level.bio_h.bio_st;
      bcont   : System.Address;
      it      : System.Address) return System.Address;  -- openssl/asn1.h:1147
   pragma Import (C, SMIME_read_ASN1, "SMIME_read_ASN1");

   function SMIME_crlf_copy
     (c_in  : access OpenSSL.Low_Level.bio_h.bio_st;
      c_out : access OpenSSL.Low_Level.bio_h.bio_st;
      flags : int) return int;  -- openssl/asn1.h:1148
   pragma Import (C, SMIME_crlf_copy, "SMIME_crlf_copy");

   function SMIME_text (c_in : access OpenSSL.Low_Level.bio_h.bio_st; c_out : access OpenSSL.Low_Level.bio_h.bio_st) return int;  -- openssl/asn1.h:1149
   pragma Import (C, SMIME_text, "SMIME_text");

   procedure ERR_load_ASN1_strings;  -- openssl/asn1.h:1155
   pragma Import (C, ERR_load_ASN1_strings, "ERR_load_ASN1_strings");

end OpenSSL.Low_Level.asn1_h;
