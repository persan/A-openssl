with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with OpenSSL.Low_Level.bio_h;
with Interfaces.C_Streams;

package OpenSSL.Low_Level.lhash_h is
   package defs is

   --  unsupported macro: DECLARE_LHASH_HASH_FN(name,o_type) unsigned long name ##_LHASH_HASH(const void *);
   --  unsupported macro: IMPLEMENT_LHASH_HASH_FN(name,o_type) unsigned long name ##_LHASH_HASH(const void *arg) { const o_type *a = arg; return name ##_hash(a); }
   --  unsupported macro: LHASH_HASH_FN(name) name ##_LHASH_HASH
   --  unsupported macro: DECLARE_LHASH_COMP_FN(name,o_type) int name ##_LHASH_COMP(const void *, const void *);
   --  unsupported macro: IMPLEMENT_LHASH_COMP_FN(name,o_type) int name ##_LHASH_COMP(const void *arg1, const void *arg2) { const o_type *a = arg1; const o_type *b = arg2; return name ##_cmp(a,b); }
   --  unsupported macro: LHASH_COMP_FN(name) name ##_LHASH_COMP
   --  unsupported macro: DECLARE_LHASH_DOALL_FN(name,o_type) void name ##_LHASH_DOALL(void *);
   --  unsupported macro: IMPLEMENT_LHASH_DOALL_FN(name,o_type) void name ##_LHASH_DOALL(void *arg) { o_type *a = arg; name ##_doall(a); }
   --  unsupported macro: LHASH_DOALL_FN(name) name ##_LHASH_DOALL
   --  unsupported macro: DECLARE_LHASH_DOALL_ARG_FN(name,o_type,a_type) void name ##_LHASH_DOALL_ARG(void *, void *);
   --  unsupported macro: IMPLEMENT_LHASH_DOALL_ARG_FN(name,o_type,a_type) void name ##_LHASH_DOALL_ARG(void *arg1, void *arg2) { o_type *a = arg1; a_type *b = arg2; name ##_doall_arg(a, b); }
   --  unsupported macro: LHASH_DOALL_ARG_FN(name) name ##_LHASH_DOALL_ARG

      LH_LOAD_MULT : constant := 256;  --  openssl/lhash.h:169
   --  arg-macro: function lh_error (lh)
   --    return (lh).error;
   --  unsupported macro: LHASH_OF(type) struct lhash_st_ ##type
   --  arg-macro: procedure DECLARE_LHASH_OF (type)
   --    LHASH_OF(type) { int dummy; }
   --  arg-macro: function CHECKED_LHASH_OF (type, lh)
   --    return (_LHASH *)CHECKED_PTR_OF(LHASH_OF(type),lh);
   --  arg-macro: function LHM_lh_new (type, name)
   --    return (LHASH_OF(type) *)lh_new(LHASH_HASH_FN(name), LHASH_COMP_FN(name));
   --  arg-macro: procedure LHM_lh_error (type, lh)
   --    lh_error(CHECKED_LHASH_OF(type,lh))
   --  arg-macro: function LHM_lh_insert (type, lh, inst)((type *)lh_insert(CHECKED_LHASH_OF(type, lh), CHECKED_PTR_OF(type, inst))
   --    return (type *)lh_insert(CHECKED_LHASH_OF(type, lh), CHECKED_PTR_OF(type, inst));
   --  arg-macro: function LHM_lh_retrieve (type, lh, inst)((type *)lh_retrieve(CHECKED_LHASH_OF(type, lh), CHECKED_PTR_OF(type, inst))
   --    return (type *)lh_retrieve(CHECKED_LHASH_OF(type, lh), CHECKED_PTR_OF(type, inst));
   --  arg-macro: function LHM_lh_delete (type, lh, inst)((type *)lh_delete(CHECKED_LHASH_OF(type, lh), CHECKED_PTR_OF(type, inst))
   --    return (type *)lh_delete(CHECKED_LHASH_OF(type, lh), CHECKED_PTR_OF(type, inst));
   --  arg-macro: procedure LHM_lh_doall (type, lh, fn)
   --    lh_doall(CHECKED_LHASH_OF(type, lh), fn)
   --  arg-macro: procedure LHM_lh_doall_arg (type, lh, fn, alh_doall_arg(CHECKED_LHASH_OF(type, lh), fn, CHECKED_PTR_OF(arg_type, arg))
   --    lh_doall_arg(CHECKED_LHASH_OF(type, lh), fn, CHECKED_PTR_OF(arg_type, arg))
   --  arg-macro: procedure LHM_lh_num_items (type, lh)
   --    lh_num_items(CHECKED_LHASH_OF(type, lh))
   --  arg-macro: function LHM_lh_down_load (type, lh)
   --    return CHECKED_LHASH_OF(type, lh).down_load;
   --  arg-macro: procedure LHM_lh_node_stats_bio (type, lh, out)
   --    lh_node_stats_bio(CHECKED_LHASH_OF(type, lh), out)
   --  arg-macro: procedure LHM_lh_node_usage_stats_bio (type, lh, out)
   --    lh_node_usage_stats_bio(CHECKED_LHASH_OF(type, lh), out)
   --  arg-macro: procedure LHM_lh_stats_bio (type, lh, out)
   --    lh_stats_bio(CHECKED_LHASH_OF(type, lh), out)
   --  arg-macro: procedure LHM_lh_free (type, lh)
   --    lh_free(CHECKED_LHASH_OF(type, lh))
   end defs;
   type lhash_node_st is record
      data : System.Address;  -- openssl/lhash.h:81
      next : access lhash_node_st;  -- openssl/lhash.h:82
      hash : aliased unsigned_long;  -- openssl/lhash.h:84
   end record;
   pragma Convention (C_Pass_By_Copy, lhash_node_st);  -- openssl/lhash.h:79

   subtype LHASH_NODE is lhash_node_st;

   type LHASH_COMP_FN_TYPE is access function (arg1 : System.Address; arg2 : System.Address) return int;  -- openssl/lhash.h:88

   type LHASH_HASH_FN_TYPE is access function (arg1 : System.Address) return unsigned_long;  -- openssl/lhash.h:89

   type LHASH_DOALL_FN_TYPE is access procedure (arg1 : System.Address);  -- openssl/lhash.h:90

   type LHASH_DOALL_ARG_FN_TYPE is access procedure (arg1 : System.Address; arg2 : System.Address);  -- openssl/lhash.h:91

   type lhash_st is record
      b : System.Address;  -- openssl/lhash.h:140
      comp : access function (arg1 : System.Address; arg2 : System.Address) return int;  -- openssl/lhash.h:141
      hash : access function (arg1 : System.Address) return unsigned_long;  -- openssl/lhash.h:142
      num_nodes : aliased unsigned;  -- openssl/lhash.h:143
      num_alloc_nodes : aliased unsigned;  -- openssl/lhash.h:144
      p : aliased unsigned;  -- openssl/lhash.h:145
      pmax : aliased unsigned;  -- openssl/lhash.h:146
      up_load : aliased unsigned_long;  -- openssl/lhash.h:147
      down_load : aliased unsigned_long;  -- openssl/lhash.h:148
      num_items : aliased unsigned_long;  -- openssl/lhash.h:149
      num_expands : aliased unsigned_long;  -- openssl/lhash.h:151
      num_expand_reallocs : aliased unsigned_long;  -- openssl/lhash.h:152
      num_contracts : aliased unsigned_long;  -- openssl/lhash.h:153
      num_contract_reallocs : aliased unsigned_long;  -- openssl/lhash.h:154
      num_hash_calls : aliased unsigned_long;  -- openssl/lhash.h:155
      num_comp_calls : aliased unsigned_long;  -- openssl/lhash.h:156
      num_insert : aliased unsigned_long;  -- openssl/lhash.h:157
      num_replace : aliased unsigned_long;  -- openssl/lhash.h:158
      num_delete : aliased unsigned_long;  -- openssl/lhash.h:159
      num_no_delete : aliased unsigned_long;  -- openssl/lhash.h:160
      num_retrieve : aliased unsigned_long;  -- openssl/lhash.h:161
      num_retrieve_miss : aliased unsigned_long;  -- openssl/lhash.h:162
      num_hash_comps : aliased unsigned_long;  -- openssl/lhash.h:163
      error : aliased int;  -- openssl/lhash.h:165
   end record;
   pragma Convention (C_Pass_By_Copy, lhash_st);  -- openssl/lhash.h:138

   subtype u_LHASH is lhash_st;

   function lh_new (h : access function (arg1 : System.Address) return unsigned_long; c : access function (arg1 : System.Address; arg2 : System.Address) return int) return access u_LHASH;  -- openssl/lhash.h:175
   pragma Import (C, lh_new, "lh_new");

   procedure lh_free (lh : access u_LHASH);  -- openssl/lhash.h:176
   pragma Import (C, lh_free, "lh_free");

   function lh_insert (lh : access u_LHASH; data : System.Address) return System.Address;  -- openssl/lhash.h:177
   pragma Import (C, lh_insert, "lh_insert");

   function lh_delete (lh : access u_LHASH; data : System.Address) return System.Address;  -- openssl/lhash.h:178
   pragma Import (C, lh_delete, "lh_delete");

   function lh_retrieve (lh : access u_LHASH; data : System.Address) return System.Address;  -- openssl/lhash.h:179
   pragma Import (C, lh_retrieve, "lh_retrieve");

   procedure lh_doall (lh : access u_LHASH; func : access procedure (arg1 : System.Address));  -- openssl/lhash.h:180
   pragma Import (C, lh_doall, "lh_doall");

   procedure lh_doall_arg
     (lh : access u_LHASH;
      func : access procedure (arg1 : System.Address; arg2 : System.Address);
      arg : System.Address);  -- openssl/lhash.h:181
   pragma Import (C, lh_doall_arg, "lh_doall_arg");

   function lh_strhash (c : Interfaces.C.Strings.chars_ptr) return unsigned_long;  -- openssl/lhash.h:182
   pragma Import (C, lh_strhash, "lh_strhash");

   function lh_num_items (lh : System.Address) return unsigned_long;  -- openssl/lhash.h:183
   pragma Import (C, lh_num_items, "lh_num_items");

   procedure lh_stats (lh : System.Address; c_out : access Interfaces.C_Streams.FILEs);  -- openssl/lhash.h:186
   pragma Import (C, lh_stats, "lh_stats");

   procedure lh_node_stats (lh : System.Address; c_out : access Interfaces.C_Streams.FILEs);  -- openssl/lhash.h:187
   pragma Import (C, lh_node_stats, "lh_node_stats");

   procedure lh_node_usage_stats (lh : System.Address; c_out : access Interfaces.C_Streams.FILEs);  -- openssl/lhash.h:188
   pragma Import (C, lh_node_usage_stats, "lh_node_usage_stats");

   procedure lh_stats_bio (lh : System.Address; c_out : access OpenSSL.Low_Level.bio_h.bio_st);  -- openssl/lhash.h:192
   pragma Import (C, lh_stats_bio, "lh_stats_bio");

   procedure lh_node_stats_bio (lh : System.Address; c_out : access OpenSSL.Low_Level.bio_h.bio_st);  -- openssl/lhash.h:193
   pragma Import (C, lh_node_stats_bio, "lh_node_stats_bio");

   procedure lh_node_usage_stats_bio (lh : System.Address; c_out : access OpenSSL.Low_Level.bio_h.bio_st);  -- openssl/lhash.h:194
   pragma Import (C, lh_node_usage_stats_bio, "lh_node_usage_stats_bio");

   type lhash_st_OPENSSL_STRING is record
      dummy : aliased int;  -- openssl/lhash.h:233
   end record;
   pragma Convention (C_Pass_By_Copy, lhash_st_OPENSSL_STRING);  -- openssl/lhash.h:233

   type lhash_st_OPENSSL_CSTRING is record
      dummy : aliased int;  -- openssl/lhash.h:234
   end record;
   pragma Convention (C_Pass_By_Copy, lhash_st_OPENSSL_CSTRING);  -- openssl/lhash.h:234

end OpenSSL.Low_Level.lhash_h;
