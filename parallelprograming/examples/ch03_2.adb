                           -- Chapter 3 - Programming Exercise 2

procedure Ch03_2 is

   Index, Count : INTEGER;
   type NEW_INT is range 0..1200;
   New_Index, New_Count : NEW_INT;

begin
   Index := 100;
   New_Index := 100;
   Index := New_Index;
   Count := Index + New_Index;
   New_Count := Index + New_Index;
end Ch03_2;




-- Result of execution

--  (This has compilation errors in lines 12, 13, and 14.)

