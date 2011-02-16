with Interfaces.C; use Interfaces.C;
with System;

package OpenSSL.Low_Level.stack_h is

   --  arg-macro: function M_sk_num (sk)
   --    return (sk) ? (sk).num:-1;
   --  arg-macro: function M_sk_value (sk, n)
   --    return (sk) ? (sk).data(n) : NULL;
   type stack_st is record
      num : aliased int;  -- openssl/stack.h:68
      data : System.Address;  -- openssl/stack.h:69
      sorted : aliased int;  -- openssl/stack.h:70
      num_alloc : aliased int;  -- openssl/stack.h:72
      comp : access function (arg1 : System.Address; arg2 : System.Address) return int;  -- openssl/stack.h:73
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st);  -- openssl/stack.h:66

   subtype u_STACK is stack_st;

   function sk_num (arg1 : System.Address) return int;  -- openssl/stack.h:79
   pragma Import (C, sk_num, "sk_num");

   function sk_value (arg1 : System.Address; arg2 : int) return System.Address;  -- openssl/stack.h:80
   pragma Import (C, sk_value, "sk_value");

   function sk_set
     (arg1 : access u_STACK;
      arg2 : int;
      arg3 : System.Address) return System.Address;  -- openssl/stack.h:82
   pragma Import (C, sk_set, "sk_set");

   function sk_new (cmp : access function (arg1 : System.Address; arg2 : System.Address) return int) return access u_STACK;  -- openssl/stack.h:84
   pragma Import (C, sk_new, "sk_new");

   function sk_new_null return access u_STACK;  -- openssl/stack.h:85
   pragma Import (C, sk_new_null, "sk_new_null");

   procedure sk_free (arg1 : access u_STACK);  -- openssl/stack.h:86
   pragma Import (C, sk_free, "sk_free");

   procedure sk_pop_free (st : access u_STACK; func : access procedure (arg1 : System.Address));  -- openssl/stack.h:87
   pragma Import (C, sk_pop_free, "sk_pop_free");

   function sk_insert
     (sk : access u_STACK;
      data : System.Address;
      where : int) return int;  -- openssl/stack.h:88
   pragma Import (C, sk_insert, "sk_insert");

   function sk_delete (st : access u_STACK; loc : int) return System.Address;  -- openssl/stack.h:89
   pragma Import (C, sk_delete, "sk_delete");

   function sk_delete_ptr (st : access u_STACK; p : System.Address) return System.Address;  -- openssl/stack.h:90
   pragma Import (C, sk_delete_ptr, "sk_delete_ptr");

   function sk_find (st : access u_STACK; data : System.Address) return int;  -- openssl/stack.h:91
   pragma Import (C, sk_find, "sk_find");

   function sk_find_ex (st : access u_STACK; data : System.Address) return int;  -- openssl/stack.h:92
   pragma Import (C, sk_find_ex, "sk_find_ex");

   function sk_push (st : access u_STACK; data : System.Address) return int;  -- openssl/stack.h:93
   pragma Import (C, sk_push, "sk_push");

   function sk_unshift (st : access u_STACK; data : System.Address) return int;  -- openssl/stack.h:94
   pragma Import (C, sk_unshift, "sk_unshift");

   function sk_shift (st : access u_STACK) return System.Address;  -- openssl/stack.h:95
   pragma Import (C, sk_shift, "sk_shift");

   function sk_pop (st : access u_STACK) return System.Address;  -- openssl/stack.h:96
   pragma Import (C, sk_pop, "sk_pop");

   procedure sk_zero (st : access u_STACK);  -- openssl/stack.h:97
   pragma Import (C, sk_zero, "sk_zero");

   function sk_set_cmp_func (sk : access u_STACK; c : access function (arg1 : System.Address; arg2 : System.Address) return int) return access function (arg1 : System.Address; arg2 : System.Address) return int;  -- openssl/stack.h:98
   pragma Import (C, sk_set_cmp_func, "sk_set_cmp_func");

   function sk_dup (st : access u_STACK) return access u_STACK;  -- openssl/stack.h:100
   pragma Import (C, sk_dup, "sk_dup");

   procedure sk_sort (st : access u_STACK);  -- openssl/stack.h:101
   pragma Import (C, sk_sort, "sk_sort");

   function sk_is_sorted (st : System.Address) return int;  -- openssl/stack.h:102
   pragma Import (C, sk_is_sorted, "sk_is_sorted");

end OpenSSL.Low_Level.stack_h;
