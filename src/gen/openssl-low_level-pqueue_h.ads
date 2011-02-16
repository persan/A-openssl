with Interfaces.C; use Interfaces.C;
with System;

package OpenSSL.Low_Level.pqueue_h is

   --  skipped empty struct u_pqueue

   type pqueue is new System.Address;  -- openssl/pqueue.h:67

   type u_pitem_priority_array is array (0 .. 7) of aliased unsigned_char;
   type u_pitem is record
      priority : aliased u_pitem_priority_array;  -- openssl/pqueue.h:71
      data : System.Address;  -- openssl/pqueue.h:72
      next : access u_pitem;  -- openssl/pqueue.h:73
   end record;
   pragma Convention (C_Pass_By_Copy, u_pitem);  -- openssl/pqueue.h:69

   subtype pitem is u_pitem;

   type piterator is access all u_pitem;  -- openssl/pqueue.h:76

   function pitem_new (prio64be : access unsigned_char; data : System.Address) return access pitem;  -- openssl/pqueue.h:78
   pragma Import (CPP, pitem_new, "_Z9pitem_newPhPv");

   procedure pitem_free (item : access pitem);  -- openssl/pqueue.h:79
   pragma Import (CPP, pitem_free, "_Z10pitem_freeP6_pitem");

   function pqueue_new return pqueue;  -- openssl/pqueue.h:81
   pragma Import (CPP, pqueue_new, "_Z10pqueue_newv");

   procedure pqueue_free (pq : pqueue);  -- openssl/pqueue.h:82
   pragma Import (CPP, pqueue_free, "_Z11pqueue_freeP7_pqueue");

   function pqueue_insert (pq : pqueue; item : access pitem) return access pitem;  -- openssl/pqueue.h:84
   pragma Import (CPP, pqueue_insert, "_Z13pqueue_insertP7_pqueueP6_pitem");

   function pqueue_peek (pq : pqueue) return access pitem;  -- openssl/pqueue.h:85
   pragma Import (CPP, pqueue_peek, "_Z11pqueue_peekP7_pqueue");

   function pqueue_pop (pq : pqueue) return access pitem;  -- openssl/pqueue.h:86
   pragma Import (CPP, pqueue_pop, "_Z10pqueue_popP7_pqueue");

   function pqueue_find (pq : pqueue; prio64be : access unsigned_char) return access pitem;  -- openssl/pqueue.h:87
   pragma Import (CPP, pqueue_find, "_Z11pqueue_findP7_pqueuePh");

   function pqueue_iterator (pq : pqueue) return access pitem;  -- openssl/pqueue.h:88
   pragma Import (CPP, pqueue_iterator, "_Z15pqueue_iteratorP7_pqueue");

   function pqueue_next (iter : System.Address) return access pitem;  -- openssl/pqueue.h:89
   pragma Import (CPP, pqueue_next, "_Z11pqueue_nextPP6_pitem");

   procedure pqueue_print (pq : pqueue);  -- openssl/pqueue.h:91
   pragma Import (CPP, pqueue_print, "_Z12pqueue_printP7_pqueue");

   function pqueue_size (pq : pqueue) return int;  -- openssl/pqueue.h:92
   pragma Import (CPP, pqueue_size, "_Z11pqueue_sizeP7_pqueue");

end OpenSSL.Low_Level.pqueue_h;
