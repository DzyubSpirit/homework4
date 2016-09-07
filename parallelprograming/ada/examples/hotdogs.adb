                                   -- Chapter 27 - Program 2
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure HotDogs is

   task Gourmet is
      entry Make_A_Hot_Dog(Serial_Number : INTEGER);
   end Gourmet;

   procedure Get_Dog(Serial_Number : INTEGER) renames
                                          Gourmet.Make_A_Hot_Dog;

   task body Gourmet is
   begin
      Put_Line("I am ready to make a hot dog for you");

      accept Make_A_Hot_Dog(Serial_Number : INTEGER) do
         Put_Line("This will be the first hot dog");
         Put("Put hot dog in bun ");
         Put_Line("and add mustard");
         delay 0.8;
      end Make_A_Hot_Dog;

      for Index in 1..4 loop
         accept Make_A_Hot_Dog(Serial_Number : INTEGER) do
            Put("This will be hot dog number");
            Put(Serial_Number, 3);
            New_Line;
            Put("Put hot dog in bun ");
            Put_Line("and add mustard");
            delay 0.8;
         end Make_A_Hot_Dog;
      end loop;

      accept Make_A_Hot_Dog(Serial_Number : INTEGER) do
         Put_Line("This will be the last hot dog");
         Put("Put hot dog in bun ");
         Put_Line("and add mustard");
         delay 0.8;
      end Make_A_Hot_Dog;

      Put_Line("I am out of hot dogs");
   end Gourmet;

begin
   for Index in 1..6 loop
      Get_Dog(Index);
      Put_Line("Eat the resulting hot dog");
      New_Line;
   end loop;
   Put_Line("I am not hungry any longer");
end HotDogs;


-- Result of execution

-- I am ready to make a hot dog for you
-- This will be the first hot dog
-- Put hot dog in bun and add mustard
-- Eat the resulting hot dog
--
-- This will be hot dog number  2
-- Put hot dog in bun and add mustard
-- Eat the resulting hot dog
--
-- This will be hot dog number  3
-- Put hot dog in bun and add mustard
-- Eat the resulting hot dog
--
-- This will be hot dog number  4
-- Put hot dog in bun and add mustard
-- I am out of hot dogs
-- Eat the resulting hot dog
--
-- This will be hot dog number  5
-- Put hot dog in bun and add mustard
-- Eat the resulting hot dog
--
-- This will be the last hot dog
-- Put hot dog in bun and add mustard
-- Eat the resulting hot dog
--
-- I am not hungry any longer

