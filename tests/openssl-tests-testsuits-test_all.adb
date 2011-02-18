--
--
--
--
-- ---------------------------------------------



--  Import tests and sub-suites to run
with OpenSSL.Tests.Testcases.Compile;

package body OpenSSL.Tests.TestSuits.Test_All is
   use AUnit.Test_Suites;


   --  Statically allocate test suite:
   Result : aliased Test_Suite;


   --  Statically allocate test cases:
   Test_1 : aliased OpenSSL.Tests.Testcases.Compile.Test_Case;

   -----------
   -- Suite --
   -----------

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin
      Add_Test (Result'Access, Test_1'Access);
      return Result'Access;
   end Suite;

end OpenSSL.Tests.TestSuits.Test_All;

