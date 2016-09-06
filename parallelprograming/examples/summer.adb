                                       -- Chapter 19 - Program 1
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Summer is

   type MY_ARRAY is array (POSITIVE range <>) of INTEGER;

   Dummy1 : constant MY_ARRAY := (27, 14, 13, 33);
   Dummy2 : constant MY_ARRAY := (112 => 27, 113 => 14,
                                  114 => 13, 115 => 33);

   My_List : MY_ARRAY(1..12);
   Stuff   : MY_ARRAY(4..11) := (12, 13, 7, 11, 125, others => 17);
   Total   : INTEGER;

      function Sum_Up(In_Array : MY_ARRAY) return INTEGER is
      Sum : INTEGER := 0;
      begin
         for Index in In_Array'FIRST..In_Array'LAST loop
            Sum := Sum + In_Array(Index);
         end loop;
         Put("The sum of the numbers is");
         Put(Sum, 4);
         New_Line;
         return Sum;
      end Sum_Up;

begin
   My_List := (0, 1, 2, 3, 4, 3, 2, 1, 2, 3, 4, 7);
   Stuff := (4 => 12, 8 => 11, 5 => 13, 7 => 1, others => 9);

   Total := Sum_Up(My_List);
   Total := Sum_Up(Stuff);
end Summer;




-- Result of Execution

-- The sum of the numbers is  32
-- The sum of the numbers is  73

