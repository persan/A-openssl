with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
limited with OpenSSL.Low_Level.asn1_h;
limited with OpenSSL.Low_Level.bio_h;

package OpenSSL.Low_Level.objects_h is

   package defs is

      OBJ_NAME_TYPE_UNDEF       : constant := 16#00#;  --  openssl/objects.h:962
      OBJ_NAME_TYPE_MD_METH     : constant := 16#01#;  --  openssl/objects.h:963
      OBJ_NAME_TYPE_CIPHER_METH : constant := 16#02#;  --  openssl/objects.h:964
      OBJ_NAME_TYPE_PKEY_METH   : constant := 16#03#;  --  openssl/objects.h:965
      OBJ_NAME_TYPE_COMP_METH   : constant := 16#04#;  --  openssl/objects.h:966
      OBJ_NAME_TYPE_NUM         : constant := 16#05#;  --  openssl/objects.h:967

      OBJ_NAME_ALIAS            : constant := 16#8000#;  --  openssl/objects.h:969

      OBJ_BSEARCH_VALUE_ON_NOMATCH : constant := 16#01#;  --  openssl/objects.h:971
      OBJ_BSEARCH_FIRST_VALUE_ON_MATCH : constant := 16#02#;  --  openssl/objects.h:972
      --  arg-macro: procedure OBJ_create_and_add_object (a, b, c)
      --    OBJ_create(a,b,c)
      --  arg-macro: procedure DECLARE_OBJ_BSEARCH_CMP_FN (type1, type2, c_DECLARE_OBJ_BSEARCH_CMP_FN(static, type1, type2, cmp)
      --    _DECLARE_OBJ_BSEARCH_CMP_FN(static, type1, type2, cmp)
      --  unsupported macro: DECLARE_OBJ_BSEARCH_GLOBAL_CMP_FN(type1,type2,nm) type2 * OBJ_bsearch_ ##nm(type1 *key, type2 const *base, int num)
      --  unsupported macro: IMPLEMENT_OBJ_BSEARCH_CMP_FN(type1,type2,nm) static int nm ##_cmp_BSEARCH_CMP_FN(const void *a_, const void *b_) { type1 const *a = a_; type2 const *b = b_; return nm ##_cmp(a,b); } static type2 *OBJ_bsearch_ ##nm(type1 *key, type2 const *base, int num) { return (type2 *)OBJ_bsearch_(key, base, num, sizeof(type2), nm ##_cmp_BSEARCH_CMP_FN); } extern void dummy_prototype(void)
      --  unsupported macro: IMPLEMENT_OBJ_BSEARCH_GLOBAL_CMP_FN(type1,type2,nm) static int nm ##_cmp_BSEARCH_CMP_FN(const void *a_, const void *b_) { type1 const *a = a_; type2 const *b = b_; return nm ##_cmp(a,b); } type2 *OBJ_bsearch_ ##nm(type1 *key, type2 const *base, int num) { return (type2 *)OBJ_bsearch_(key, base, num, sizeof(type2), nm ##_cmp_BSEARCH_CMP_FN); } extern void dummy_prototype(void)
      --  unsupported macro: OBJ_bsearch(type1,key,type2,base,num,cmp) ((type2 *)OBJ_bsearch_(CHECKED_PTR_OF(type1,key),CHECKED_PTR_OF(type2,base), num,sizeof(type2), ((void)CHECKED_PTR_OF(type1,cmp ##_type_1), (void)CHECKED_PTR_OF(type2,cmp ##_type_2), cmp ##_BSEARCH_CMP_FN)))
      --  unsupported macro: OBJ_bsearch_ex(type1,key,type2,base,num,cmp,flags) ((type2 *)OBJ_bsearch_ex_(CHECKED_PTR_OF(type1,key),CHECKED_PTR_OF(type2,base), num,sizeof(type2), ((void)CHECKED_PTR_OF(type1,cmp ##_type_1), (void)type_2=CHECKED_PTR_OF(type2,cmp ##_type_2), cmp ##_BSEARCH_CMP_FN)),flags)

      OBJ_F_OBJ_ADD_OBJECT      : constant := 105;  --  openssl/objects.h:1123
      OBJ_F_OBJ_CREATE          : constant := 100;  --  openssl/objects.h:1124
      OBJ_F_OBJ_DUP             : constant := 101;  --  openssl/objects.h:1125
      OBJ_F_OBJ_NAME_NEW_INDEX  : constant := 106;  --  openssl/objects.h:1126
      OBJ_F_OBJ_NID2LN          : constant := 102;  --  openssl/objects.h:1127
      OBJ_F_OBJ_NID2OBJ         : constant := 103;  --  openssl/objects.h:1128
      OBJ_F_OBJ_NID2SN          : constant := 104;  --  openssl/objects.h:1129

      OBJ_R_MALLOC_FAILURE      : constant := 100;  --  openssl/objects.h:1132
      OBJ_R_UNKNOWN_NID         : constant := 101;  --  openssl/objects.h:1133
   end defs;
   type obj_name_st is record
      c_type : aliased int;  -- openssl/objects.h:981
      alias  : aliased int;  -- openssl/objects.h:982
      name   : Interfaces.C.Strings.chars_ptr;  -- openssl/objects.h:983
      data   : Interfaces.C.Strings.chars_ptr;  -- openssl/objects.h:984
   end record;
   pragma Convention (C_Pass_By_Copy, obj_name_st);  -- openssl/objects.h:979

   subtype OBJ_NAME is obj_name_st;

   function OBJ_NAME_init return int;  -- openssl/objects.h:990
   pragma Import (C, OBJ_NAME_init, "OBJ_NAME_init");

   function OBJ_NAME_new_index
     (hash_func : access function (arg1 : Interfaces.C.Strings.chars_ptr) return unsigned_long;
      cmp_func  : access function (arg1 : Interfaces.C.Strings.chars_ptr; arg2 : Interfaces.C.Strings.chars_ptr) return int;
      free_func : access procedure
        (arg1 : Interfaces.C.Strings.chars_ptr;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr)) return int;  -- openssl/objects.h:991
   pragma Import (C, OBJ_NAME_new_index, "OBJ_NAME_new_index");

   function OBJ_NAME_get (name : Interfaces.C.Strings.chars_ptr; c_type : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/objects.h:994
   pragma Import (C, OBJ_NAME_get, "OBJ_NAME_get");

   function OBJ_NAME_add
     (name   : Interfaces.C.Strings.chars_ptr;
      c_type : int;
      data   : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/objects.h:995
   pragma Import (C, OBJ_NAME_add, "OBJ_NAME_add");

   function OBJ_NAME_remove (name : Interfaces.C.Strings.chars_ptr; c_type : int) return int;  -- openssl/objects.h:996
   pragma Import (C, OBJ_NAME_remove, "OBJ_NAME_remove");

   procedure OBJ_NAME_cleanup (c_type : int);  -- openssl/objects.h:997
   pragma Import (C, OBJ_NAME_cleanup, "OBJ_NAME_cleanup");

   procedure OBJ_NAME_do_all
     (c_type : int;
      fn     : access procedure (arg1 : System.Address; arg2 : System.Address);
      arg    : System.Address);  -- openssl/objects.h:998
   pragma Import (C, OBJ_NAME_do_all, "OBJ_NAME_do_all");

   procedure OBJ_NAME_do_all_sorted
     (c_type : int;
      fn     : access procedure (arg1 : System.Address; arg2 : System.Address);
      arg    : System.Address);  -- openssl/objects.h:1000
   pragma Import (C, OBJ_NAME_do_all_sorted, "OBJ_NAME_do_all_sorted");

   function OBJ_dup (o : access constant OpenSSL.Low_Level.asn1_h.ASN1_OBJECT) return access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/objects.h:1003
   pragma Import (C, OBJ_dup, "OBJ_dup");

   function OBJ_nid2obj (n : int) return access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/objects.h:1004
   pragma Import (C, OBJ_nid2obj, "OBJ_nid2obj");

   function OBJ_nid2ln (n : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/objects.h:1005
   pragma Import (C, OBJ_nid2ln, "OBJ_nid2ln");

   function OBJ_nid2sn (n : int) return Interfaces.C.Strings.chars_ptr;  -- openssl/objects.h:1006
   pragma Import (C, OBJ_nid2sn, "OBJ_nid2sn");

   function OBJ_obj2nid (o : access constant OpenSSL.Low_Level.asn1_h.ASN1_OBJECT) return int;  -- openssl/objects.h:1007
   pragma Import (C, OBJ_obj2nid, "OBJ_obj2nid");

   function OBJ_txt2obj (s : Interfaces.C.Strings.chars_ptr; no_name : int) return access OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;  -- openssl/objects.h:1008
   pragma Import (C, OBJ_txt2obj, "OBJ_txt2obj");

   function OBJ_obj2txt
     (buf     : Interfaces.C.Strings.chars_ptr;
      buf_len : int;
      a       : access constant OpenSSL.Low_Level.asn1_h.ASN1_OBJECT;
      no_name : int) return int;  -- openssl/objects.h:1009
   pragma Import (C, OBJ_obj2txt, "OBJ_obj2txt");

   function OBJ_txt2nid (s : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/objects.h:1010
   pragma Import (C, OBJ_txt2nid, "OBJ_txt2nid");

   function OBJ_ln2nid (s : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/objects.h:1011
   pragma Import (C, OBJ_ln2nid, "OBJ_ln2nid");

   function OBJ_sn2nid (s : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/objects.h:1012
   pragma Import (C, OBJ_sn2nid, "OBJ_sn2nid");

   function OBJ_cmp (a : access constant OpenSSL.Low_Level.asn1_h.ASN1_OBJECT; b : access constant OpenSSL.Low_Level.asn1_h.ASN1_OBJECT) return int;  -- openssl/objects.h:1013
   pragma Import (C, OBJ_cmp, "OBJ_cmp");

   function OBJ_bsearch_u
     (key  : System.Address;
      base : System.Address;
      num  : int;
      size : int;
      cmp  : access function (arg1 : System.Address; arg2 : System.Address) return int) return System.Address;  -- openssl/objects.h:1014
   pragma Import (C, OBJ_bsearch_u, "OBJ_bsearch_");

   function OBJ_bsearch_ex_u
     (key   : System.Address;
      base  : System.Address;
      num   : int;
      size  : int;
      cmp   : access function (arg1 : System.Address; arg2 : System.Address) return int;
      flags : int) return System.Address;  -- openssl/objects.h:1016
   pragma Import (C, OBJ_bsearch_ex_u, "OBJ_bsearch_ex_");

   function OBJ_new_nid (num : int) return int;  -- openssl/objects.h:1100
   pragma Import (C, OBJ_new_nid, "OBJ_new_nid");

   function OBJ_add_object (obj : access constant OpenSSL.Low_Level.asn1_h.ASN1_OBJECT) return int;  -- openssl/objects.h:1101
   pragma Import (C, OBJ_add_object, "OBJ_add_object");

   function OBJ_create
     (oid : Interfaces.C.Strings.chars_ptr;
      sn  : Interfaces.C.Strings.chars_ptr;
      ln  : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/objects.h:1102
   pragma Import (C, OBJ_create, "OBJ_create");

   procedure OBJ_cleanup;  -- openssl/objects.h:1103
   pragma Import (C, OBJ_cleanup, "OBJ_cleanup");

   function OBJ_create_objects (c_in : access OpenSSL.Low_Level.bio_h.bio_st) return int;  -- openssl/objects.h:1104
   pragma Import (C, OBJ_create_objects, "OBJ_create_objects");

   function OBJ_find_sigid_algs
     (signid    : int;
      pdig_nid  : access int;
      ppkey_nid : access int) return int;  -- openssl/objects.h:1106
   pragma Import (C, OBJ_find_sigid_algs, "OBJ_find_sigid_algs");

   function OBJ_find_sigid_by_algs
     (psignid  : access int;
      dig_nid  : int;
      pkey_nid : int) return int;  -- openssl/objects.h:1107
   pragma Import (C, OBJ_find_sigid_by_algs, "OBJ_find_sigid_by_algs");

   function OBJ_add_sigid
     (signid  : int;
      dig_id  : int;
      pkey_id : int) return int;  -- openssl/objects.h:1108
   pragma Import (C, OBJ_add_sigid, "OBJ_add_sigid");

   procedure OBJ_sigid_free;  -- openssl/objects.h:1109
   pragma Import (C, OBJ_sigid_free, "OBJ_sigid_free");

   obj_cleanup_defer : aliased int;  -- openssl/objects.h:1111
   pragma Import (C, obj_cleanup_defer, "obj_cleanup_defer");

   procedure check_defer (nid : int);  -- openssl/objects.h:1112
   pragma Import (C, check_defer, "check_defer");

   procedure ERR_load_OBJ_strings;  -- openssl/objects.h:1118
   pragma Import (C, ERR_load_OBJ_strings, "ERR_load_OBJ_strings");

end OpenSSL.Low_Level.objects_h;
