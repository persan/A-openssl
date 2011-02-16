with Interfaces.C.Extensions;
package OpenSSL.Low_Level is

   package bits_time_h is
      type timeval is new Interfaces.C.Extensions.void;
   end bits_time_h;

   package bits_pthreadtypes_h is
      type pthread_once_t is new Interfaces.C.Extensions.void;
   end bits_pthreadtypes_h;

   package stdio_h is
      type va_list is new Integer;
   end stdio_h;

   package time_h is
      type time_t is new Integer;
   end time_h;

   type Limit is new Interfaces.C.int;

end OpenSSL.Low_Level;
