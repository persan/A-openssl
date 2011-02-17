with Interfaces.C; use Interfaces.C;
--  limited --  with OpenSSL.Low_Level.ossl_typ_h;
with OpenSSL.Low_Level.stack_h;
with OpenSSL.Low_Level.asn1_h;
with System;
with OpenSSL.Low_Level.asn1t_h;
package OpenSSL.Low_Level.krb5_asn_h is

   type krb5_encdata_st is record
      etype : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:84
      kvno : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:85
      cipher : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:86
   end record;
   pragma Convention (C_Pass_By_Copy, krb5_encdata_st);  -- openssl/krb5_asn.h:82

   subtype KRB5_ENCDATA is krb5_encdata_st;

   type stack_st_KRB5_ENCDATA is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/krb5_asn.h:89
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_KRB5_ENCDATA);  -- openssl/krb5_asn.h:89

   type krb5_princname_st is record
      nametype : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:98
      namestring : access OpenSSL.Low_Level.asn1_h.stack_st_ASN1_GENERALSTRING;  -- openssl/krb5_asn.h:99
   end record;
   pragma Convention (C_Pass_By_Copy, krb5_princname_st);  -- openssl/krb5_asn.h:96

   subtype KRB5_PRINCNAME is krb5_princname_st;

   type stack_st_KRB5_PRINCNAME is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/krb5_asn.h:102
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_KRB5_PRINCNAME);  -- openssl/krb5_asn.h:102

   type krb5_tktbody_st is record
      tktvno : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:114
      realm : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:115
      sname : access KRB5_PRINCNAME;  -- openssl/krb5_asn.h:116
      encdata : access KRB5_ENCDATA;  -- openssl/krb5_asn.h:117
   end record;
   pragma Convention (C_Pass_By_Copy, krb5_tktbody_st);  -- openssl/krb5_asn.h:112

   subtype KRB5_TKTBODY is krb5_tktbody_st;

   type stack_st_KRB5_TKTBODY;
   subtype KRB5_TICKET is stack_st_KRB5_TKTBODY;

   type stack_st_KRB5_TKTBODY is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/krb5_asn.h:121
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_KRB5_TKTBODY);  -- openssl/krb5_asn.h:121

   type krb5_ap_req_st is record
      pvno : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:137
      msgtype : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:138
      apoptions : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:139
      ticket : access KRB5_TICKET;  -- openssl/krb5_asn.h:140
      authenticator : access KRB5_ENCDATA;  -- openssl/krb5_asn.h:141
   end record;
   pragma Convention (C_Pass_By_Copy, krb5_ap_req_st);  -- openssl/krb5_asn.h:135

   subtype KRB5_APREQBODY is krb5_ap_req_st;

   type stack_st_KRB5_APREQBODY;
   subtype KRB5_APREQ is stack_st_KRB5_APREQBODY;

   type stack_st_KRB5_APREQBODY is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/krb5_asn.h:145
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_KRB5_APREQBODY);  -- openssl/krb5_asn.h:145

   type krb5_checksum_st is record
      ctype : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:158
      checksum : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:159
   end record;
   pragma Convention (C_Pass_By_Copy, krb5_checksum_st);  -- openssl/krb5_asn.h:156

   subtype KRB5_CHECKSUM is krb5_checksum_st;

   type stack_st_KRB5_CHECKSUM is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/krb5_asn.h:162
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_KRB5_CHECKSUM);  -- openssl/krb5_asn.h:162

   type krb5_encryptionkey_st is record
      ktype : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:172
      keyvalue : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:173
   end record;
   pragma Convention (C_Pass_By_Copy, krb5_encryptionkey_st);  -- openssl/krb5_asn.h:170

   subtype KRB5_ENCKEY is krb5_encryptionkey_st;

   type stack_st_KRB5_ENCKEY is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/krb5_asn.h:176
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_KRB5_ENCKEY);  -- openssl/krb5_asn.h:176

   type krb5_authorization_st is record
      adtype : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:186
      addata : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:187
   end record;
   pragma Convention (C_Pass_By_Copy, krb5_authorization_st);  -- openssl/krb5_asn.h:184

   subtype KRB5_AUTHDATA is krb5_authorization_st;

   type stack_st_KRB5_AUTHDATA is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/krb5_asn.h:190
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_KRB5_AUTHDATA);  -- openssl/krb5_asn.h:190

   type krb5_authenticator_st is record
      avno : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:208
      crealm : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:209
      cname : access KRB5_PRINCNAME;  -- openssl/krb5_asn.h:210
      cksum : access KRB5_CHECKSUM;  -- openssl/krb5_asn.h:211
      cusec : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:212
      ctime : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:213
      subkey : access KRB5_ENCKEY;  -- openssl/krb5_asn.h:214
      seqnum : access OpenSSL.Low_Level.asn1_h.asn1_string_st;  -- openssl/krb5_asn.h:215
      authorization : access KRB5_AUTHDATA;  -- openssl/krb5_asn.h:216
   end record;
   pragma Convention (C_Pass_By_Copy, krb5_authenticator_st);  -- openssl/krb5_asn.h:206

   subtype KRB5_AUTHENTBODY is krb5_authenticator_st;

   type stack_st_KRB5_AUTHENTBODY;
   subtype KRB5_AUTHENT is stack_st_KRB5_AUTHENTBODY;

   type stack_st_KRB5_AUTHENTBODY is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/krb5_asn.h:220
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_KRB5_AUTHENTBODY);  -- openssl/krb5_asn.h:220

   KRB5_ENCDATA_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/krb5_asn.h:233
   pragma Import (C, KRB5_ENCDATA_it, "KRB5_ENCDATA_it");

   function i2d_KRB5_ENCDATA (a : access KRB5_ENCDATA; c_out : System.Address) return int;  -- openssl/krb5_asn.h:233
   pragma Import (C, i2d_KRB5_ENCDATA, "i2d_KRB5_ENCDATA");

   function d2i_KRB5_ENCDATA
     (a : System.Address;
      c_in : System.Address;
      len : long) return access KRB5_ENCDATA;  -- openssl/krb5_asn.h:233
   pragma Import (C, d2i_KRB5_ENCDATA, "d2i_KRB5_ENCDATA");

   procedure KRB5_ENCDATA_free (a : access KRB5_ENCDATA);  -- openssl/krb5_asn.h:233
   pragma Import (C, KRB5_ENCDATA_free, "KRB5_ENCDATA_free");

   function KRB5_ENCDATA_new return access KRB5_ENCDATA;  -- openssl/krb5_asn.h:233
   pragma Import (C, KRB5_ENCDATA_new, "KRB5_ENCDATA_new");

   KRB5_PRINCNAME_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/krb5_asn.h:234
   pragma Import (C, KRB5_PRINCNAME_it, "KRB5_PRINCNAME_it");

   function i2d_KRB5_PRINCNAME (a : access KRB5_PRINCNAME; c_out : System.Address) return int;  -- openssl/krb5_asn.h:234
   pragma Import (C, i2d_KRB5_PRINCNAME, "i2d_KRB5_PRINCNAME");

   function d2i_KRB5_PRINCNAME
     (a : System.Address;
      c_in : System.Address;
      len : long) return access KRB5_PRINCNAME;  -- openssl/krb5_asn.h:234
   pragma Import (C, d2i_KRB5_PRINCNAME, "d2i_KRB5_PRINCNAME");

   procedure KRB5_PRINCNAME_free (a : access KRB5_PRINCNAME);  -- openssl/krb5_asn.h:234
   pragma Import (C, KRB5_PRINCNAME_free, "KRB5_PRINCNAME_free");

   function KRB5_PRINCNAME_new return access KRB5_PRINCNAME;  -- openssl/krb5_asn.h:234
   pragma Import (C, KRB5_PRINCNAME_new, "KRB5_PRINCNAME_new");

   KRB5_TKTBODY_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/krb5_asn.h:235
   pragma Import (C, KRB5_TKTBODY_it, "KRB5_TKTBODY_it");

   function i2d_KRB5_TKTBODY (a : access KRB5_TKTBODY; c_out : System.Address) return int;  -- openssl/krb5_asn.h:235
   pragma Import (C, i2d_KRB5_TKTBODY, "i2d_KRB5_TKTBODY");

   function d2i_KRB5_TKTBODY
     (a : System.Address;
      c_in : System.Address;
      len : long) return access KRB5_TKTBODY;  -- openssl/krb5_asn.h:235
   pragma Import (C, d2i_KRB5_TKTBODY, "d2i_KRB5_TKTBODY");

   procedure KRB5_TKTBODY_free (a : access KRB5_TKTBODY);  -- openssl/krb5_asn.h:235
   pragma Import (C, KRB5_TKTBODY_free, "KRB5_TKTBODY_free");

   function KRB5_TKTBODY_new return access KRB5_TKTBODY;  -- openssl/krb5_asn.h:235
   pragma Import (C, KRB5_TKTBODY_new, "KRB5_TKTBODY_new");

   KRB5_APREQBODY_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/krb5_asn.h:236
   pragma Import (C, KRB5_APREQBODY_it, "KRB5_APREQBODY_it");

   function i2d_KRB5_APREQBODY (a : access KRB5_APREQBODY; c_out : System.Address) return int;  -- openssl/krb5_asn.h:236
   pragma Import (C, i2d_KRB5_APREQBODY, "i2d_KRB5_APREQBODY");

   function d2i_KRB5_APREQBODY
     (a : System.Address;
      c_in : System.Address;
      len : long) return access KRB5_APREQBODY;  -- openssl/krb5_asn.h:236
   pragma Import (C, d2i_KRB5_APREQBODY, "d2i_KRB5_APREQBODY");

   procedure KRB5_APREQBODY_free (a : access KRB5_APREQBODY);  -- openssl/krb5_asn.h:236
   pragma Import (C, KRB5_APREQBODY_free, "KRB5_APREQBODY_free");

   function KRB5_APREQBODY_new return access KRB5_APREQBODY;  -- openssl/krb5_asn.h:236
   pragma Import (C, KRB5_APREQBODY_new, "KRB5_APREQBODY_new");

   KRB5_TICKET_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/krb5_asn.h:237
   pragma Import (C, KRB5_TICKET_it, "KRB5_TICKET_it");

   function i2d_KRB5_TICKET (a : access KRB5_TICKET; c_out : System.Address) return int;  -- openssl/krb5_asn.h:237
   pragma Import (C, i2d_KRB5_TICKET, "i2d_KRB5_TICKET");

   function d2i_KRB5_TICKET
     (a : System.Address;
      c_in : System.Address;
      len : long) return access KRB5_TICKET;  -- openssl/krb5_asn.h:237
   pragma Import (C, d2i_KRB5_TICKET, "d2i_KRB5_TICKET");

   procedure KRB5_TICKET_free (a : access KRB5_TICKET);  -- openssl/krb5_asn.h:237
   pragma Import (C, KRB5_TICKET_free, "KRB5_TICKET_free");

   function KRB5_TICKET_new return access KRB5_TICKET;  -- openssl/krb5_asn.h:237
   pragma Import (C, KRB5_TICKET_new, "KRB5_TICKET_new");

   KRB5_APREQ_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/krb5_asn.h:238
   pragma Import (C, KRB5_APREQ_it, "KRB5_APREQ_it");

   function i2d_KRB5_APREQ (a : access KRB5_APREQ; c_out : System.Address) return int;  -- openssl/krb5_asn.h:238
   pragma Import (C, i2d_KRB5_APREQ, "i2d_KRB5_APREQ");

   function d2i_KRB5_APREQ
     (a : System.Address;
      c_in : System.Address;
      len : long) return access KRB5_APREQ;  -- openssl/krb5_asn.h:238
   pragma Import (C, d2i_KRB5_APREQ, "d2i_KRB5_APREQ");

   procedure KRB5_APREQ_free (a : access KRB5_APREQ);  -- openssl/krb5_asn.h:238
   pragma Import (C, KRB5_APREQ_free, "KRB5_APREQ_free");

   function KRB5_APREQ_new return access KRB5_APREQ;  -- openssl/krb5_asn.h:238
   pragma Import (C, KRB5_APREQ_new, "KRB5_APREQ_new");

   KRB5_CHECKSUM_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/krb5_asn.h:240
   pragma Import (C, KRB5_CHECKSUM_it, "KRB5_CHECKSUM_it");

   function i2d_KRB5_CHECKSUM (a : access KRB5_CHECKSUM; c_out : System.Address) return int;  -- openssl/krb5_asn.h:240
   pragma Import (C, i2d_KRB5_CHECKSUM, "i2d_KRB5_CHECKSUM");

   function d2i_KRB5_CHECKSUM
     (a : System.Address;
      c_in : System.Address;
      len : long) return access KRB5_CHECKSUM;  -- openssl/krb5_asn.h:240
   pragma Import (C, d2i_KRB5_CHECKSUM, "d2i_KRB5_CHECKSUM");

   procedure KRB5_CHECKSUM_free (a : access KRB5_CHECKSUM);  -- openssl/krb5_asn.h:240
   pragma Import (C, KRB5_CHECKSUM_free, "KRB5_CHECKSUM_free");

   function KRB5_CHECKSUM_new return access KRB5_CHECKSUM;  -- openssl/krb5_asn.h:240
   pragma Import (C, KRB5_CHECKSUM_new, "KRB5_CHECKSUM_new");

   KRB5_ENCKEY_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/krb5_asn.h:241
   pragma Import (C, KRB5_ENCKEY_it, "KRB5_ENCKEY_it");

   function i2d_KRB5_ENCKEY (a : access KRB5_ENCKEY; c_out : System.Address) return int;  -- openssl/krb5_asn.h:241
   pragma Import (C, i2d_KRB5_ENCKEY, "i2d_KRB5_ENCKEY");

   function d2i_KRB5_ENCKEY
     (a : System.Address;
      c_in : System.Address;
      len : long) return access KRB5_ENCKEY;  -- openssl/krb5_asn.h:241
   pragma Import (C, d2i_KRB5_ENCKEY, "d2i_KRB5_ENCKEY");

   procedure KRB5_ENCKEY_free (a : access KRB5_ENCKEY);  -- openssl/krb5_asn.h:241
   pragma Import (C, KRB5_ENCKEY_free, "KRB5_ENCKEY_free");

   function KRB5_ENCKEY_new return access KRB5_ENCKEY;  -- openssl/krb5_asn.h:241
   pragma Import (C, KRB5_ENCKEY_new, "KRB5_ENCKEY_new");

   KRB5_AUTHDATA_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/krb5_asn.h:242
   pragma Import (C, KRB5_AUTHDATA_it, "KRB5_AUTHDATA_it");

   function i2d_KRB5_AUTHDATA (a : access KRB5_AUTHDATA; c_out : System.Address) return int;  -- openssl/krb5_asn.h:242
   pragma Import (C, i2d_KRB5_AUTHDATA, "i2d_KRB5_AUTHDATA");

   function d2i_KRB5_AUTHDATA
     (a : System.Address;
      c_in : System.Address;
      len : long) return access KRB5_AUTHDATA;  -- openssl/krb5_asn.h:242
   pragma Import (C, d2i_KRB5_AUTHDATA, "d2i_KRB5_AUTHDATA");

   procedure KRB5_AUTHDATA_free (a : access KRB5_AUTHDATA);  -- openssl/krb5_asn.h:242
   pragma Import (C, KRB5_AUTHDATA_free, "KRB5_AUTHDATA_free");

   function KRB5_AUTHDATA_new return access KRB5_AUTHDATA;  -- openssl/krb5_asn.h:242
   pragma Import (C, KRB5_AUTHDATA_new, "KRB5_AUTHDATA_new");

   KRB5_AUTHENTBODY_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/krb5_asn.h:243
   pragma Import (C, KRB5_AUTHENTBODY_it, "KRB5_AUTHENTBODY_it");

   function i2d_KRB5_AUTHENTBODY (a : access KRB5_AUTHENTBODY; c_out : System.Address) return int;  -- openssl/krb5_asn.h:243
   pragma Import (C, i2d_KRB5_AUTHENTBODY, "i2d_KRB5_AUTHENTBODY");

   function d2i_KRB5_AUTHENTBODY
     (a : System.Address;
      c_in : System.Address;
      len : long) return access KRB5_AUTHENTBODY;  -- openssl/krb5_asn.h:243
   pragma Import (C, d2i_KRB5_AUTHENTBODY, "d2i_KRB5_AUTHENTBODY");

   procedure KRB5_AUTHENTBODY_free (a : access KRB5_AUTHENTBODY);  -- openssl/krb5_asn.h:243
   pragma Import (C, KRB5_AUTHENTBODY_free, "KRB5_AUTHENTBODY_free");

   function KRB5_AUTHENTBODY_new return access KRB5_AUTHENTBODY;  -- openssl/krb5_asn.h:243
   pragma Import (C, KRB5_AUTHENTBODY_new, "KRB5_AUTHENTBODY_new");

   KRB5_AUTHENT_it : aliased OpenSSL.Low_Level.asn1t_h.ASN1_ITEM_st;  -- openssl/krb5_asn.h:244
   pragma Import (C, KRB5_AUTHENT_it, "KRB5_AUTHENT_it");

   function i2d_KRB5_AUTHENT (a : access KRB5_AUTHENT; c_out : System.Address) return int;  -- openssl/krb5_asn.h:244
   pragma Import (C, i2d_KRB5_AUTHENT, "i2d_KRB5_AUTHENT");

   function d2i_KRB5_AUTHENT
     (a : System.Address;
      c_in : System.Address;
      len : long) return access KRB5_AUTHENT;  -- openssl/krb5_asn.h:244
   pragma Import (C, d2i_KRB5_AUTHENT, "d2i_KRB5_AUTHENT");

   procedure KRB5_AUTHENT_free (a : access KRB5_AUTHENT);  -- openssl/krb5_asn.h:244
   pragma Import (C, KRB5_AUTHENT_free, "KRB5_AUTHENT_free");

   function KRB5_AUTHENT_new return access KRB5_AUTHENT;  -- openssl/krb5_asn.h:244
   pragma Import (C, KRB5_AUTHENT_new, "KRB5_AUTHENT_new");

end OpenSSL.Low_Level.krb5_asn_h;
