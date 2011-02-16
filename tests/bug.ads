with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with OpenSSL.Low_Level.crypto_h;

package bug is
   type DSO_FUNC_TYPE is access procedure;  -- openssl/dso.h:106

   type DSO;

   type DSO_NAME_CONVERTER_FUNC is access function (arg1 : access DSO; arg2 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:116

   type DSO_MERGER_FUNC is access function
     (arg1 : access DSO;
      arg2 : Interfaces.C.Strings.chars_ptr;
      arg3 : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr;  -- openssl/dso.h:132

   type DSO_METHOD is record
      dso_bind_var       : access function (arg1 : access DSO; arg2 : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/dso.h:144
      dso_bind_func      : access function (arg1 : access DSO;
                                            arg2               : Interfaces.C.Strings.chars_ptr) return access procedure;  -- openssl/dso.h:151

   end record;


   type dso is record
      flags           : aliased int;  -- openssl/dso.h:193
   end record;
end bug;
