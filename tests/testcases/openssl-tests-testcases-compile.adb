with GNAT.Source_Info;
with AUnit.Assertions;
package body OpenSSL.Tests.Testcases.Compile is
   use AUnit;
   use AUnit.Assertions;

   --  Fixture elements


   ----------
   -- Name --
   ----------

   function Name (T : Test_Case)
                  return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return Format (GNAT.Source_Info.File & ":Compile_It");
   end Name;


   -------------------------
   --  SampleTest
   -------------------------
   procedure SampleTest (Test : in out AUnit.Test_Cases.Test_Case'Class);
   procedure SampleTest (Test : in out AUnit.Test_Cases.Test_Case'Class) is
      T : Test_Case renames Test_Case (Test);
      pragma Unreferenced (T);
   begin
      Assert (False, "TODO Implement Test");
   end SampleTest;

   --------------------
   -- Register_Tests --
   --------------------

   procedure Register_Tests (T : in out Test_Case) is
      use Test_Cases.Registration;

   begin
      Register_Routine  (T, SampleTest'Access, "SampleTest");
   end Register_Tests;

end OpenSSL.Tests.Testcases.Compile;