with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with OpenSSL.Low_Level.asn1_h;
with System;
with OpenSSL.Low_Level.bio_h;
with OpenSSL.Low_Level.stack_h;
with OpenSSL.Low_Level.asn1_h;
package OpenSSL.Low_Level.asn1t_h is
   package defs is

      --  arg-macro: function ASN1_ADB_ptr (iptr)
      --    return (const ASN1_ADB *)(iptr);
      --  unsupported macro: ASN1_ITEM_start(itname) OPENSSL_GLOBAL const ASN1_ITEM itname ##_it = {
      --  arg-macro: procedure ASN1_ITEM_end (itname)
      --    };
      --  unsupported macro: ASN1_ITEM_TEMPLATE(tname) static const ASN1_TEMPLATE tname ##_item_tt
      --  unsupported macro: ASN1_ITEM_TEMPLATE_END(tname) ; ASN1_ITEM_start(tname) ASN1_ITYPE_PRIMITIVE, -1, &tname ##_item_tt, 0, NULL, 0, #tname ASN1_ITEM_end(tname)
      --  unsupported macro: ASN1_SEQUENCE(tname) static const ASN1_TEMPLATE tname ##_seq_tt[]
      --  arg-macro: procedure ASN1_SEQUENCE_END (stname)
      --    ASN1_SEQUENCE_END_name(stname, stname)
      --  unsupported macro: ASN1_SEQUENCE_END_name(stname,tname) ; ASN1_ITEM_start(tname) ASN1_ITYPE_SEQUENCE, V_ASN1_SEQUENCE, tname ##_seq_tt, sizeof(tname ##_seq_tt) / sizeof(ASN1_TEMPLATE), NULL, sizeof(stname), #stname ASN1_ITEM_end(tname)
      --  arg-macro: procedure ASN1_NDEF_SEQUENCE (tname)
      --    ASN1_SEQUENCE(tname)
      --  arg-macro: procedure ASN1_NDEF_SEQUENCE_cb (tname, cb)
      --    ASN1_SEQUENCE_cb(tname, cb)
      --  unsupported macro: ASN1_SEQUENCE_cb(tname,cb) static const ASN1_AUX tname ##_aux = {NULL, 0, 0, 0, cb, 0}; ASN1_SEQUENCE(tname)
      --  unsupported macro: ASN1_BROKEN_SEQUENCE(tname) static const ASN1_AUX tname ##_aux = {NULL, ASN1_AFLG_BROKEN, 0, 0, 0, 0}; ASN1_SEQUENCE(tname)
      --  unsupported macro: ASN1_SEQUENCE_ref(tname,cb,lck) static const ASN1_AUX tname ##_aux = {NULL, ASN1_AFLG_REFCOUNT, offsetof(tname, references), lck, cb, 0}; ASN1_SEQUENCE(tname)
      --  unsupported macro: ASN1_SEQUENCE_enc(tname,enc,cb) static const ASN1_AUX tname ##_aux = {NULL, ASN1_AFLG_ENCODING, 0, 0, cb, offsetof(tname, enc)}; ASN1_SEQUENCE(tname)
      --  unsupported macro: ASN1_NDEF_SEQUENCE_END(tname) ; ASN1_ITEM_start(tname) ASN1_ITYPE_NDEF_SEQUENCE, V_ASN1_SEQUENCE, tname ##_seq_tt, sizeof(tname ##_seq_tt) / sizeof(ASN1_TEMPLATE), NULL, sizeof(tname), #tname ASN1_ITEM_end(tname)
      --  arg-macro: procedure ASN1_BROKEN_SEQUENCE_END (stname)
      --    ASN1_SEQUENCE_END_ref(stname, stname)
      --  arg-macro: procedure ASN1_SEQUENCE_END_enc (stname, tname)
      --    ASN1_SEQUENCE_END_ref(stname, tname)
      --  arg-macro: procedure ASN1_SEQUENCE_END_cb (stname, tname)
      --    ASN1_SEQUENCE_END_ref(stname, tname)
      --  unsupported macro: ASN1_SEQUENCE_END_ref(stname,tname) ; ASN1_ITEM_start(tname) ASN1_ITYPE_SEQUENCE, V_ASN1_SEQUENCE, tname ##_seq_tt, sizeof(tname ##_seq_tt) / sizeof(ASN1_TEMPLATE), &tname ##_aux, sizeof(stname), #stname ASN1_ITEM_end(tname)
      --  unsupported macro: ASN1_NDEF_SEQUENCE_END_cb(stname,tname) ; ASN1_ITEM_start(tname) ASN1_ITYPE_NDEF_SEQUENCE, V_ASN1_SEQUENCE, tname ##_seq_tt, sizeof(tname ##_seq_tt) / sizeof(ASN1_TEMPLATE), &tname ##_aux, sizeof(stname), #stname ASN1_ITEM_end(tname)
      --  unsupported macro: ASN1_CHOICE(tname) static const ASN1_TEMPLATE tname ##_ch_tt[]
      --  unsupported macro: ASN1_CHOICE_cb(tname,cb) static const ASN1_AUX tname ##_aux = {NULL, 0, 0, 0, cb, 0}; ASN1_CHOICE(tname)
      --  arg-macro: procedure ASN1_CHOICE_END (stname)
      --    ASN1_CHOICE_END_name(stname, stname)
      --  arg-macro: procedure ASN1_CHOICE_END_name (stname, tname)
      --    ASN1_CHOICE_END_selector(stname, tname, type)
      --  unsupported macro: ASN1_CHOICE_END_selector(stname,tname,selname) ; ASN1_ITEM_start(tname) ASN1_ITYPE_CHOICE, offsetof(stname,selname) , tname ##_ch_tt, sizeof(tname ##_ch_tt) / sizeof(ASN1_TEMPLATE), NULL, sizeof(stname), #stname ASN1_ITEM_end(tname)
      --  unsupported macro: ASN1_CHOICE_END_cb(stname,tname,selname) ; ASN1_ITEM_start(tname) ASN1_ITYPE_CHOICE, offsetof(stname,selname) , tname ##_ch_tt, sizeof(tname ##_ch_tt) / sizeof(ASN1_TEMPLATE), &tname ##_aux, sizeof(stname), #stname ASN1_ITEM_end(tname)
      --  unsupported macro: ASN1_EX_TEMPLATE_TYPE(flags,tag,name,type) { (flags), (tag), 0, #name, ASN1_ITEM_ref(type) }
      --  unsupported macro: ASN1_EX_TYPE(flags,tag,stname,field,type) { (flags), (tag), offsetof(stname, field), #field, ASN1_ITEM_ref(type) }
      --  arg-macro: procedure ASN1_EX_COMBINE (flags, tag, typ{ (flags)orASN1_TFLG_COMBINE, (tag), 0, NULL, ASN1_ITEM_ref(type) }
      --    { (flags)orASN1_TFLG_COMBINE, (tag), 0, NULL, ASN1_ITEM_ref(type) }
      --  arg-macro: procedure ASN1_IMP_EX (stname, field, ASN1_EX_TYPE(ASN1_TFLG_IMPLICIT or ex, tag, stname, field, type)
      --    ASN1_EX_TYPE(ASN1_TFLG_IMPLICIT or ex, tag, stname, field, type)
      --  arg-macro: procedure ASN1_EXP_EX (stname, field, ASN1_EX_TYPE(ASN1_TFLG_EXPLICIT or ex, tag, stname, field, type)
      --    ASN1_EX_TYPE(ASN1_TFLG_EXPLICIT or ex, tag, stname, field, type)
      --  unsupported macro: ASN1_ADB_OBJECT(tblname) { ASN1_TFLG_ADB_OID, -1, 0, #tblname, (const ASN1_ITEM *)&(tblname ##_adb) }
      --  unsupported macro: ASN1_ADB_INTEGER(tblname) { ASN1_TFLG_ADB_INT, -1, 0, #tblname, (const ASN1_ITEM *)&(tblname ##_adb) }
      --  arg-macro: procedure ASN1_SIMPLE (stname, field, ASN1_EX_TYPE(0,0, stname, field, type)
      --    ASN1_EX_TYPE(0,0, stname, field, type)
      --  arg-macro: procedure ASN1_OPT (stname, field, ASN1_EX_TYPE(ASN1_TFLG_OPTIONAL, 0, stname, field, type)
      --    ASN1_EX_TYPE(ASN1_TFLG_OPTIONAL, 0, stname, field, type)
      --  arg-macro: procedure ASN1_IMP (stname, field, ASN1_IMP_EX(stname, field, type, tag, 0)
      --    ASN1_IMP_EX(stname, field, type, tag, 0)
      --  arg-macro: procedure ASN1_IMP_OPT (stname, field, ASN1_IMP_EX(stname, field, type, tag, ASN1_TFLG_OPTIONAL)
      --    ASN1_IMP_EX(stname, field, type, tag, ASN1_TFLG_OPTIONAL)
      --  arg-macro: procedure ASN1_EXP (stname, field, ASN1_EXP_EX(stname, field, type, tag, 0)
      --    ASN1_EXP_EX(stname, field, type, tag, 0)
      --  arg-macro: procedure ASN1_EXP_OPT (stname, field, ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_OPTIONAL)
      --    ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_OPTIONAL)
      --  arg-macro: procedure ASN1_SEQUENCE_OF (stname, field, ASN1_EX_TYPE(ASN1_TFLG_SEQUENCE_OF, 0, stname, field, type)
      --    ASN1_EX_TYPE(ASN1_TFLG_SEQUENCE_OF, 0, stname, field, type)
      --  arg-macro: procedure ASN1_SEQUENCE_OF_OPT (stname, field, ASN1_EX_TYPE(ASN1_TFLG_SEQUENCE_OForASN1_TFLG_OPTIONAL, 0, stname, field, type)
      --    ASN1_EX_TYPE(ASN1_TFLG_SEQUENCE_OForASN1_TFLG_OPTIONAL, 0, stname, field, type)
      --  arg-macro: procedure ASN1_SET_OF (stname, field, ASN1_EX_TYPE(ASN1_TFLG_SET_OF, 0, stname, field, type)
      --    ASN1_EX_TYPE(ASN1_TFLG_SET_OF, 0, stname, field, type)
      --  arg-macro: procedure ASN1_SET_OF_OPT (stname, field, ASN1_EX_TYPE(ASN1_TFLG_SET_OForASN1_TFLG_OPTIONAL, 0, stname, field, type)
      --    ASN1_EX_TYPE(ASN1_TFLG_SET_OForASN1_TFLG_OPTIONAL, 0, stname, field, type)
      --  arg-macro: procedure ASN1_IMP_SET_OF (stname, field, ASN1_IMP_EX(stname, field, type, tag, ASN1_TFLG_SET_OF)
      --    ASN1_IMP_EX(stname, field, type, tag, ASN1_TFLG_SET_OF)
      --  arg-macro: procedure ASN1_EXP_SET_OF (stname, field, ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_SET_OF)
      --    ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_SET_OF)
      --  arg-macro: procedure ASN1_IMP_SET_OF_OPT (stname, field, ASN1_IMP_EX(stname, field, type, tag, ASN1_TFLG_SET_OForASN1_TFLG_OPTIONAL)
      --    ASN1_IMP_EX(stname, field, type, tag, ASN1_TFLG_SET_OForASN1_TFLG_OPTIONAL)
      --  arg-macro: procedure ASN1_EXP_SET_OF_OPT (stname, field, ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_SET_OForASN1_TFLG_OPTIONAL)
      --    ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_SET_OForASN1_TFLG_OPTIONAL)
      --  arg-macro: procedure ASN1_IMP_SEQUENCE_OF (stname, field, ASN1_IMP_EX(stname, field, type, tag, ASN1_TFLG_SEQUENCE_OF)
      --    ASN1_IMP_EX(stname, field, type, tag, ASN1_TFLG_SEQUENCE_OF)
      --  arg-macro: procedure ASN1_IMP_SEQUENCE_OF_OPT (stname, field, ASN1_IMP_EX(stname, field, type, tag, ASN1_TFLG_SEQUENCE_OForASN1_TFLG_OPTIONAL)
      --    ASN1_IMP_EX(stname, field, type, tag, ASN1_TFLG_SEQUENCE_OForASN1_TFLG_OPTIONAL)
      --  arg-macro: procedure ASN1_EXP_SEQUENCE_OF (stname, field, ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_SEQUENCE_OF)
      --    ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_SEQUENCE_OF)
      --  arg-macro: procedure ASN1_EXP_SEQUENCE_OF_OPT (stname, field, ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_SEQUENCE_OForASN1_TFLG_OPTIONAL)
      --    ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_SEQUENCE_OForASN1_TFLG_OPTIONAL)
      --  arg-macro: procedure ASN1_NDEF_EXP (stname, field, ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_NDEF)
      --    ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_NDEF)
      --  arg-macro: procedure ASN1_NDEF_EXP_OPT (stname, field, ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_OPTIONALorASN1_TFLG_NDEF)
      --    ASN1_EXP_EX(stname, field, type, tag, ASN1_TFLG_OPTIONALorASN1_TFLG_NDEF)
      --  unsupported macro: ASN1_ADB(name) static const ASN1_ADB_TABLE name ##_adbtbl[]
      --  unsupported macro: ASN1_ADB_END(name,flags,field,app_table,def,none) ; static const ASN1_ADB name ##_adb = { flags, offsetof(name, field), app_table, name ##_adbtbl, sizeof(name ##_adbtbl) / sizeof(ASN1_ADB_TABLE), def, none }
      --  arg-macro: procedure ADB_ENTRY (val, template)
      --    {val, template}
      --  unsupported macro: ASN1_ADB_TEMPLATE(name) static const ASN1_TEMPLATE name ##_tt
      --  arg-macro: function ASN1_TEMPLATE_item (t)
      --    return t.item_ptr;
      --  arg-macro: function ASN1_TEMPLATE_adb (t)
      --    return t.item_ptr;

      ASN1_TFLG_OPTIONAL : constant := (16#1#);  --  openssl/asn1t.h:482
      --  unsupported macro: ASN1_TFLG_SET_OF (0x1 << 1)
      --  unsupported macro: ASN1_TFLG_SEQUENCE_OF (0x2 << 1)
      --  unsupported macro: ASN1_TFLG_SET_ORDER (0x3 << 1)
      --  unsupported macro: ASN1_TFLG_SK_MASK (0x3 << 1)
      --  unsupported macro: ASN1_TFLG_IMPTAG (0x1 << 3)
      --  unsupported macro: ASN1_TFLG_EXPTAG (0x2 << 3)
      --  unsupported macro: ASN1_TFLG_TAG_MASK (0x3 << 3)
      --  unsupported macro: ASN1_TFLG_IMPLICIT ASN1_TFLG_IMPTAG|ASN1_TFLG_CONTEXT
      --  unsupported macro: ASN1_TFLG_EXPLICIT ASN1_TFLG_EXPTAG|ASN1_TFLG_CONTEXT
      --  unsupported macro: ASN1_TFLG_UNIVERSAL (0x0<<6)
      --  unsupported macro: ASN1_TFLG_APPLICATION (0x1<<6)
      --  unsupported macro: ASN1_TFLG_CONTEXT (0x2<<6)
      --  unsupported macro: ASN1_TFLG_PRIVATE (0x3<<6)
      --  unsupported macro: ASN1_TFLG_TAG_CLASS (0x3<<6)
      --  unsupported macro: ASN1_TFLG_ADB_MASK (0x3<<8)
      --  unsupported macro: ASN1_TFLG_ADB_OID (0x1<<8)
      --  unsupported macro: ASN1_TFLG_ADB_INT (0x1<<9)
      --  unsupported macro: ASN1_TFLG_COMBINE (0x1<<10)
      --  unsupported macro: ASN1_TFLG_NDEF (0x1<<11)

      ASN1_ITYPE_PRIMITIVE : constant := 16#0#;  --  openssl/asn1t.h:624

      ASN1_ITYPE_SEQUENCE : constant := 16#1#;  --  openssl/asn1t.h:626

      ASN1_ITYPE_CHOICE : constant := 16#2#;  --  openssl/asn1t.h:628

      ASN1_ITYPE_COMPAT : constant := 16#3#;  --  openssl/asn1t.h:630

      ASN1_ITYPE_EXTERN : constant := 16#4#;  --  openssl/asn1t.h:632

      ASN1_ITYPE_MSTRING : constant := 16#5#;  --  openssl/asn1t.h:634

      ASN1_ITYPE_NDEF_SEQUENCE : constant := 16#6#;  --  openssl/asn1t.h:636

      ASN1_AFLG_REFCOUNT : constant := 1;  --  openssl/asn1t.h:751

      ASN1_AFLG_ENCODING : constant := 2;  --  openssl/asn1t.h:753

      ASN1_AFLG_BROKEN : constant := 4;  --  openssl/asn1t.h:755

      ASN1_OP_NEW_PRE : constant := 0;  --  openssl/asn1t.h:759
      ASN1_OP_NEW_POST : constant := 1;  --  openssl/asn1t.h:760
      ASN1_OP_FREE_PRE : constant := 2;  --  openssl/asn1t.h:761
      ASN1_OP_FREE_POST : constant := 3;  --  openssl/asn1t.h:762
      ASN1_OP_D2I_PRE : constant := 4;  --  openssl/asn1t.h:763
      ASN1_OP_D2I_POST : constant := 5;  --  openssl/asn1t.h:764
      ASN1_OP_I2D_PRE : constant := 6;  --  openssl/asn1t.h:765
      ASN1_OP_I2D_POST : constant := 7;  --  openssl/asn1t.h:766
      ASN1_OP_PRINT_PRE : constant := 8;  --  openssl/asn1t.h:767
      ASN1_OP_PRINT_POST : constant := 9;  --  openssl/asn1t.h:768
      ASN1_OP_STREAM_PRE : constant := 10;  --  openssl/asn1t.h:769
      ASN1_OP_STREAM_POST : constant := 11;  --  openssl/asn1t.h:770
      ASN1_OP_DETACHED_PRE : constant := 12;  --  openssl/asn1t.h:771
      ASN1_OP_DETACHED_POST : constant := 13;  --  openssl/asn1t.h:772
      --  arg-macro: procedure IMPLEMENT_ASN1_TYPE (stname)
      --    IMPLEMENT_ASN1_TYPE_ex(stname, stname, 0)
      --  unsupported macro: IMPLEMENT_ASN1_TYPE_ex(itname,vname,ex) ASN1_ITEM_start(itname) ASN1_ITYPE_PRIMITIVE, V_ ##vname, NULL, 0, NULL, ex, #itname ASN1_ITEM_end(itname)
      --  unsupported macro: IMPLEMENT_ASN1_MSTRING(itname,mask) ASN1_ITEM_start(itname) ASN1_ITYPE_MSTRING, mask, NULL, 0, NULL, sizeof(ASN1_STRING), #itname ASN1_ITEM_end(itname)
      --  arg-macro: procedure IMPLEMENT_COMPAT_ASN1 (sname)
      --    IMPLEMENT_COMPAT_ASN1_type(sname, V_ASN1_SEQUENCE)
      --  unsupported macro: IMPLEMENT_COMPAT_ASN1_type(sname,tag) static const ASN1_COMPAT_FUNCS sname ##_ff = { (ASN1_new_func *)sname ##_new, (ASN1_free_func *)sname ##_free, (ASN1_d2i_func *)d2i_ ##sname, (ASN1_i2d_func *)i2d_ ##sname, }; ASN1_ITEM_start(sname) ASN1_ITYPE_COMPAT, tag, NULL, 0, &sname ##_ff, 0, #sname ASN1_ITEM_end(sname)
      --  unsupported macro: IMPLEMENT_EXTERN_ASN1(sname,tag,fptrs) ASN1_ITEM_start(sname) ASN1_ITYPE_EXTERN, tag, NULL, 0, &fptrs, 0, #sname ASN1_ITEM_end(sname)
      --  arg-macro: procedure IMPLEMENT_ASN1_FUNCTIONS (stname)
      --    IMPLEMENT_ASN1_FUNCTIONS_fname(stname, stname, stname)
      --  arg-macro: procedure IMPLEMENT_ASN1_FUNCTIONS_name (stname, itname)IMPLEMENT_ASN1_FUNCTIONS_fname(stname, itname, itname)
      --    IMPLEMENT_ASN1_FUNCTIONS_fname(stname, itname, itname)
      --  arg-macro: procedure IMPLEMENT_ASN1_FUNCTIONS_ENCODE_name (stname, itname)IMPLEMENT_ASN1_FUNCTIONS_ENCODE_fname(stname, itname, itname)
      --    IMPLEMENT_ASN1_FUNCTIONS_ENCODE_fname(stname, itname, itname)
      --  arg-macro: procedure IMPLEMENT_STATIC_ASN1_ALLOC_FUNCTIONS (stname)
      --    IMPLEMENT_ASN1_ALLOC_FUNCTIONS_pfname(static, stname, stname, stname)
      --  arg-macro: procedure IMPLEMENT_ASN1_ALLOC_FUNCTIONS (stname)
      --    IMPLEMENT_ASN1_ALLOC_FUNCTIONS_fname(stname, stname, stname)
      --  unsupported macro: IMPLEMENT_ASN1_ALLOC_FUNCTIONS_pfname(pre,stname,itname,fname) pre stname *fname ##_new(void) { return (stname *)ASN1_item_new(ASN1_ITEM_rptr(itname)); } pre void fname ##_free(stname *a) { ASN1_item_free((ASN1_VALUE *)a, ASN1_ITEM_rptr(itname)); }
      --  unsupported macro: IMPLEMENT_ASN1_ALLOC_FUNCTIONS_fname(stname,itname,fname) stname *fname ##_new(void) { return (stname *)ASN1_item_new(ASN1_ITEM_rptr(itname)); } void fname ##_free(stname *a) { ASN1_item_free((ASN1_VALUE *)a, ASN1_ITEM_rptr(itname)); }
      --  arg-macro: procedure IMPLEMENT_ASN1_FUNCTIONS_fname (stname, itname,IMPLEMENT_ASN1_ENCODE_FUNCTIONS_fname(stname, itname, fname) IMPLEMENT_ASN1_ALLOC_FUNCTIONS_fname(stname, itname, fname)
      --    IMPLEMENT_ASN1_ENCODE_FUNCTIONS_fname(stname, itname, fname) IMPLEMENT_ASN1_ALLOC_FUNCTIONS_fname(stname, itname, fname)
      --  unsupported macro: IMPLEMENT_ASN1_ENCODE_FUNCTIONS_fname(stname,itname,fname) stname *d2i_ ##fname(stname **a, const unsigned char **in, long len) { return (stname *)ASN1_item_d2i((ASN1_VALUE **)a, in, len, ASN1_ITEM_rptr(itname)); } int i2d_ ##fname(stname *a, unsigned char **out) { return ASN1_item_i2d((ASN1_VALUE *)a, out, ASN1_ITEM_rptr(itname)); }
      --  unsupported macro: IMPLEMENT_ASN1_NDEF_FUNCTION(stname) int i2d_ ##stname ##_NDEF(stname *a, unsigned char **out) { return ASN1_item_ndef_i2d((ASN1_VALUE *)a, out, ASN1_ITEM_rptr(stname)); }
      --  unsupported macro: IMPLEMENT_ASN1_ENCODE_FUNCTIONS_const_fname(stname,itname,fname) stname *d2i_ ##fname(stname **a, const unsigned char **in, long len) { return (stname *)ASN1_item_d2i((ASN1_VALUE **)a, in, len, ASN1_ITEM_rptr(itname)); } int i2d_ ##fname(const stname *a, unsigned char **out) { return ASN1_item_i2d((ASN1_VALUE *)a, out, ASN1_ITEM_rptr(itname)); }
      --  unsupported macro: IMPLEMENT_ASN1_DUP_FUNCTION(stname) stname * stname ##_dup(stname *x) { return ASN1_item_dup(ASN1_ITEM_rptr(stname), x); }
      --  arg-macro: procedure IMPLEMENT_ASN1_PRINT_FUNCTION (stname)
      --    IMPLEMENT_ASN1_PRINT_FUNCTION_fname(stname, stname, stname)
      --  unsupported macro: IMPLEMENT_ASN1_PRINT_FUNCTION_fname(stname,itname,fname) int fname ##_print_ctx(BIO *out, stname *x, int indent, const ASN1_PCTX *pctx) { return ASN1_item_print(out, (ASN1_VALUE *)x, indent, ASN1_ITEM_rptr(itname), pctx); }
      --  arg-macro: procedure IMPLEMENT_ASN1_FUNCTIONS_const (name)
      --    IMPLEMENT_ASN1_FUNCTIONS_const_fname(name, name, name)
      --  arg-macro: procedure IMPLEMENT_ASN1_FUNCTIONS_const_fname (stname, itname,IMPLEMENT_ASN1_ENCODE_FUNCTIONS_const_fname(stname, itname, fname) IMPLEMENT_ASN1_ALLOC_FUNCTIONS_fname(stname, itname, fname)
      --    IMPLEMENT_ASN1_ENCODE_FUNCTIONS_const_fname(stname, itname, fname) IMPLEMENT_ASN1_ALLOC_FUNCTIONS_fname(stname, itname, fname)
   end defs;
   type ASN1_TEMPLATE_st is record
      flags      : aliased unsigned_long;  -- openssl/asn1t.h:447
      tag        : aliased long;  -- openssl/asn1t.h:448
      offset     : aliased unsigned_long;  -- openssl/asn1t.h:449
      field_name : Interfaces.C.Strings.chars_ptr;  -- openssl/asn1t.h:451
      item       : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM_EXP;  -- openssl/asn1t.h:453
   end record;
   pragma Convention (C_Pass_By_Copy, ASN1_TEMPLATE_st);  -- openssl/asn1t.h:446

   type ASN1_ADB_TABLE_st;
   subtype ASN1_ADB_TABLE is ASN1_ADB_TABLE_st;

   type ASN1_ADB_st;
   subtype ASN1_ADB is ASN1_ADB_st;

   type ASN1_ADB_st is record
      flags      : aliased unsigned_long;  -- openssl/asn1t.h:465
      offset     : aliased unsigned_long;  -- openssl/asn1t.h:466
      app_items  : System.Address;  -- openssl/asn1t.h:467
      tbl        : System.Address;  -- openssl/asn1t.h:468
      tblcount   : aliased long;  -- openssl/asn1t.h:469
      default_tt : access constant OpenSSL.Low_Level.asn1_h.ASN1_TEMPLATE;  -- openssl/asn1t.h:470
      null_tt    : access constant OpenSSL.Low_Level.asn1_h.ASN1_TEMPLATE;  -- openssl/asn1t.h:471
   end record;
   pragma Convention (C_Pass_By_Copy, ASN1_ADB_st);  -- openssl/asn1t.h:464

   --  skipped empty struct stack_st_ASN1_ADB_TABLE

   type ASN1_ADB_TABLE_st is record
      value : aliased long;  -- openssl/asn1t.h:475
      tt    : aliased OpenSSL.Low_Level.asn1_h.ASN1_TEMPLATE;  -- openssl/asn1t.h:476
   end record;
   pragma Convention (C_Pass_By_Copy, ASN1_ADB_TABLE_st);  -- openssl/asn1t.h:474

   type ASN1_ITEM_st is record
      itype     : aliased char;  -- openssl/asn1t.h:569
      utype     : aliased long;  -- openssl/asn1t.h:570
      templates : access constant OpenSSL.Low_Level.asn1_h.ASN1_TEMPLATE;  -- openssl/asn1t.h:571
      tcount    : aliased long;  -- openssl/asn1t.h:572
      funcs     : System.Address;  -- openssl/asn1t.h:573
      size      : aliased long;  -- openssl/asn1t.h:574
      sname     : Interfaces.C.Strings.chars_ptr;  -- openssl/asn1t.h:576
   end record;
   pragma Convention (C_Pass_By_Copy, ASN1_ITEM_st);  -- openssl/asn1t.h:568

   type ASN1_TLC_st is record
      valid  : aliased char;  -- openssl/asn1t.h:644
      ret    : aliased int;  -- openssl/asn1t.h:645
      plen   : aliased long;  -- openssl/asn1t.h:646
      ptag   : aliased int;  -- openssl/asn1t.h:647
      pclass : aliased int;  -- openssl/asn1t.h:648
      hdrlen : aliased int;  -- openssl/asn1t.h:649
   end record;
   pragma Convention (C_Pass_By_Copy, ASN1_TLC_st);  -- openssl/asn1t.h:643

   --  skipped function type ASN1_new_func

   --  skipped function type ASN1_free_func

   --  skipped function type ASN1_d2i_func

   --  skipped function type ASN1_i2d_func

   --  skipped function type ASN1_ex_d2i

   --  skipped function type ASN1_ex_i2d

   --  skipped function type ASN1_ex_new_func

   --  skipped function type ASN1_ex_free_func

   --  skipped function type ASN1_ex_print_func

   --  skipped function type ASN1_primitive_i2c

   --  skipped function type ASN1_primitive_c2i

   --  skipped function type ASN1_primitive_print

   type ASN1_COMPAT_FUNCS_st is record
      asn1_new  : access function return System.Address;  -- openssl/asn1t.h:675
      asn1_free : access procedure (arg1 : System.Address);  -- openssl/asn1t.h:676
      asn1_d2i  : access function
        (arg1 : System.Address;
         arg2      : System.Address;
         arg3      : long) return System.Address;  -- openssl/asn1t.h:677
      asn1_i2d  : access function (arg1 : System.Address; arg2 : System.Address) return int;  -- openssl/asn1t.h:678
   end record;
   pragma Convention (C_Pass_By_Copy, ASN1_COMPAT_FUNCS_st);  -- openssl/asn1t.h:674

   subtype ASN1_COMPAT_FUNCS is ASN1_COMPAT_FUNCS_st;

   type ASN1_EXTERN_FUNCS_st is record
      app_data      : System.Address;  -- openssl/asn1t.h:682
      asn1_ex_new   : access function (arg1 : System.Address; arg2 : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:683
      asn1_ex_free  : access procedure (arg1 : System.Address; arg2 : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM);  -- openssl/asn1t.h:684
      asn1_ex_clear : access procedure (arg1 : System.Address; arg2 : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM);  -- openssl/asn1t.h:685
      asn1_ex_d2i   : access function
        (arg1 : System.Address;
         arg2          : System.Address;
         arg3          : long;
         arg4          : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM;
         arg5          : int;
         arg6          : int;
         arg7          : char;
         arg8          : access OpenSSL.Low_Level.asn1_h.ASN1_TLC) return int;  -- openssl/asn1t.h:686
      asn1_ex_i2d   : access function
        (arg1 : System.Address;
         arg2          : System.Address;
         arg3          : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM;
         arg4          : int;
         arg5          : int) return int;  -- openssl/asn1t.h:687
      asn1_ex_print : access function
        (arg1 : access OpenSSL.Low_Level.bio_h.bio_st;
         arg2          : System.Address;
         arg3          : int;
         arg4          : Interfaces.C.Strings.chars_ptr;
         arg5          : System.Address) return int;  -- openssl/asn1t.h:688
   end record;
   pragma Convention (C_Pass_By_Copy, ASN1_EXTERN_FUNCS_st);  -- openssl/asn1t.h:681

   subtype ASN1_EXTERN_FUNCS is ASN1_EXTERN_FUNCS_st;

   type ASN1_PRIMITIVE_FUNCS_st is record
      app_data   : System.Address;  -- openssl/asn1t.h:692
      flags      : aliased unsigned_long;  -- openssl/asn1t.h:693
      prim_new   : access function (arg1 : System.Address; arg2 : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:694
      prim_free  : access procedure (arg1 : System.Address; arg2 : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM);  -- openssl/asn1t.h:695
      prim_clear : access procedure (arg1 : System.Address; arg2 : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM);  -- openssl/asn1t.h:696
      prim_c2i   : access function
        (arg1 : System.Address;
         arg2       : access unsigned_char;
         arg3       : int;
         arg4       : int;
         arg5       : Interfaces.C.Strings.chars_ptr;
         arg6       : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:697
      prim_i2c   : access function
        (arg1 : System.Address;
         arg2       : access unsigned_char;
         arg3       : access int;
         arg4       : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:698
      prim_print : access function
        (arg1 : access OpenSSL.Low_Level.bio_h.bio_st;
         arg2       : System.Address;
         arg3       : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM;
         arg4       : int;
         arg5       : System.Address) return int;  -- openssl/asn1t.h:699
   end record;
   pragma Convention (C_Pass_By_Copy, ASN1_PRIMITIVE_FUNCS_st);  -- openssl/asn1t.h:691

   subtype ASN1_PRIMITIVE_FUNCS is ASN1_PRIMITIVE_FUNCS_st;

   --  skipped function type ASN1_aux_cb

   type ASN1_AUX_st is record
      app_data   : System.Address;  -- openssl/asn1t.h:723
      flags      : aliased int;  -- openssl/asn1t.h:724
      ref_offset : aliased int;  -- openssl/asn1t.h:725
      ref_lock   : aliased int;  -- openssl/asn1t.h:726
      asn1_cb    : access function
        (arg1 : int;
         arg2       : System.Address;
         arg3       : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM;
         arg4       : System.Address) return int;  -- openssl/asn1t.h:727
      enc_offset : aliased int;  -- openssl/asn1t.h:728
   end record;
   pragma Convention (C_Pass_By_Copy, ASN1_AUX_st);  -- openssl/asn1t.h:722

   subtype ASN1_AUX is ASN1_AUX_st;

   type ASN1_PRINT_ARG_st is record
      c_out  : access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/asn1t.h:733
      indent : aliased int;  -- openssl/asn1t.h:734
      pctx   : System.Address;  -- openssl/asn1t.h:735
   end record;
   pragma Convention (C_Pass_By_Copy, ASN1_PRINT_ARG_st);  -- openssl/asn1t.h:732

   subtype ASN1_PRINT_ARG is ASN1_PRINT_ARG_st;

   type ASN1_STREAM_ARG_st is record
      c_out    : access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/asn1t.h:741
      ndef_bio : access OpenSSL.Low_Level.bio_h.bio_st;  -- openssl/asn1t.h:743
      boundary : System.Address;  -- openssl/asn1t.h:745
   end record;
   pragma Convention (C_Pass_By_Copy, ASN1_STREAM_ARG_st);  -- openssl/asn1t.h:739

   subtype ASN1_STREAM_ARG is ASN1_STREAM_ARG_st;

   ASN1_BOOLEAN_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/asn1t.h:913
   pragma Import (C, ASN1_BOOLEAN_it, "ASN1_BOOLEAN_it");

   ASN1_TBOOLEAN_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/asn1t.h:914
   pragma Import (C, ASN1_TBOOLEAN_it, "ASN1_TBOOLEAN_it");

   ASN1_FBOOLEAN_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/asn1t.h:915
   pragma Import (C, ASN1_FBOOLEAN_it, "ASN1_FBOOLEAN_it");

   ASN1_SEQUENCE_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/asn1t.h:916
   pragma Import (C, ASN1_SEQUENCE_it, "ASN1_SEQUENCE_it");

   CBIGNUM_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/asn1t.h:917
   pragma Import (C, CBIGNUM_it, "CBIGNUM_it");

   BIGNUM_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/asn1t.h:918
   pragma Import (C, BIGNUM_it, "BIGNUM_it");

   LONG_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/asn1t.h:919
   pragma Import (C, LONG_it, "LONG_it");

   ZLONG_it : aliased OpenSSL.Low_Level.asn1_h.ASN1_ITEM;  -- openssl/asn1t.h:920
   pragma Import (C, ZLONG_it, "ZLONG_it");

   type stack_st_ASN1_VALUE is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/asn1t.h:922
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_ASN1_VALUE);  -- openssl/asn1t.h:922

   function ASN1_item_ex_new (pval : System.Address; it : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:926
   pragma Import (C, ASN1_item_ex_new, "ASN1_item_ex_new");

   procedure ASN1_item_ex_free (pval : System.Address; it : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM);  -- openssl/asn1t.h:927
   pragma Import (C, ASN1_item_ex_free, "ASN1_item_ex_free");

   function ASN1_template_new (pval : System.Address; tt : access constant OpenSSL.Low_Level.asn1_h.ASN1_TEMPLATE) return int;  -- openssl/asn1t.h:928
   pragma Import (C, ASN1_template_new, "ASN1_template_new");

   function ASN1_primitive_new (pval : System.Address; it : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:929
   pragma Import (C, ASN1_primitive_new, "ASN1_primitive_new");

   procedure ASN1_template_free (pval : System.Address; tt : access constant OpenSSL.Low_Level.asn1_h.ASN1_TEMPLATE);  -- openssl/asn1t.h:931
   pragma Import (C, ASN1_template_free, "ASN1_template_free");

   function ASN1_template_d2i
     (pval : System.Address;
      c_in : System.Address;
      len  : long;
      tt   : access constant OpenSSL.Low_Level.asn1_h.ASN1_TEMPLATE) return int;  -- openssl/asn1t.h:932
   pragma Import (C, ASN1_template_d2i, "ASN1_template_d2i");

   function ASN1_item_ex_d2i
     (pval   : System.Address;
      c_in   : System.Address;
      len    : long;
      it     : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM;
      tag    : int;
      aclass : int;
      opt    : char;
      ctx    : access OpenSSL.Low_Level.asn1_h.ASN1_TLC) return int;  -- openssl/asn1t.h:933
   pragma Import (C, ASN1_item_ex_d2i, "ASN1_item_ex_d2i");

   function ASN1_item_ex_i2d
     (pval   : System.Address;
      c_out  : System.Address;
      it     : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM;
      tag    : int;
      aclass : int) return int;  -- openssl/asn1t.h:936
   pragma Import (C, ASN1_item_ex_i2d, "ASN1_item_ex_i2d");

   function ASN1_template_i2d
     (pval  : System.Address;
      c_out : System.Address;
      tt    : access constant OpenSSL.Low_Level.asn1_h.ASN1_TEMPLATE) return int;  -- openssl/asn1t.h:937
   pragma Import (C, ASN1_template_i2d, "ASN1_template_i2d");

   procedure ASN1_primitive_free (pval : System.Address; it : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM);  -- openssl/asn1t.h:938
   pragma Import (C, ASN1_primitive_free, "ASN1_primitive_free");

   function asn1_ex_i2c
     (pval   : System.Address;
      cont   : access unsigned_char;
      putype : access int;
      it     : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:940
   pragma Import (C, asn1_ex_i2c, "asn1_ex_i2c");

   function asn1_ex_c2i
     (pval      : System.Address;
      cont      : access unsigned_char;
      len       : int;
      utype     : int;
      free_cont : Interfaces.C.Strings.chars_ptr;
      it        : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:941
   pragma Import (C, asn1_ex_c2i, "asn1_ex_c2i");

   function asn1_get_choice_selector (pval : System.Address; it : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:943
   pragma Import (C, asn1_get_choice_selector, "asn1_get_choice_selector");

   function asn1_set_choice_selector
     (pval  : System.Address;
      value : int;
      it    : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:944
   pragma Import (C, asn1_set_choice_selector, "asn1_set_choice_selector");

   function asn1_get_field_ptr (pval : System.Address; tt : access constant OpenSSL.Low_Level.asn1_h.ASN1_TEMPLATE) return System.Address;  -- openssl/asn1t.h:946
   pragma Import (C, asn1_get_field_ptr, "asn1_get_field_ptr");

   function asn1_do_adb
     (pval    : System.Address;
      tt      : access constant OpenSSL.Low_Level.asn1_h.ASN1_TEMPLATE;
      nullerr : int) return access constant OpenSSL.Low_Level.asn1_h.ASN1_TEMPLATE;  -- openssl/asn1t.h:948
   pragma Import (C, asn1_do_adb, "asn1_do_adb");

   function asn1_do_lock
     (pval : System.Address;
      op   : int;
      it   : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:950
   pragma Import (C, asn1_do_lock, "asn1_do_lock");

   procedure asn1_enc_init (pval : System.Address; it : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM);  -- openssl/asn1t.h:952
   pragma Import (C, asn1_enc_init, "asn1_enc_init");

   procedure asn1_enc_free (pval : System.Address; it : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM);  -- openssl/asn1t.h:953
   pragma Import (C, asn1_enc_free, "asn1_enc_free");

   function asn1_enc_restore
     (len   : access int;
      c_out : System.Address;
      pval  : System.Address;
      it    : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:954
   pragma Import (C, asn1_enc_restore, "asn1_enc_restore");

   function asn1_enc_save
     (pval  : System.Address;
      c_in  : access unsigned_char;
      inlen : int;
      it    : access constant OpenSSL.Low_Level.asn1_h.ASN1_ITEM) return int;  -- openssl/asn1t.h:955
   pragma Import (C, asn1_enc_save, "asn1_enc_save");

end OpenSSL.Low_Level.asn1t_h;
