                             -- Chapter 3 - Programming Exercise 1

procedure Ch03_1 is

   subtype RESTRICTED_RANGE is INTEGER range 12.. 77;

   Restricted_Variable : RESTRICTED_RANGE;

begin
   Restricted_Variable := 5;
   Restricted_Variable := 125;
   Restricted_Variable := 15 * (15 - 5);
end Ch03_1;




-- Result of Execution

--  (You will get an error for the executable statements, fix
--   each one and observe the error at the next step.
