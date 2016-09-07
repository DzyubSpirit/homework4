                                   -- Chapter 27 - Program 3
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure ManyDogs is

   task Gourmet is
      entry Make_A_Hot_Dog(Serial_Number : INTEGER;
                           With_Mustard  : BOOLEAN);
   end Gourmet;

   task body Gourmet is
   begin
      Put_Line("I am ready to make a hot dog for you");
      for Index in 1..5 loop
         accept Make_A_Hot_Dog(Serial_Number : INTEGER;
                               With_Mustard  : BOOLEAN) do
            Put("Put hot dog number");
            Put(Serial_Number, 2);
            Put(" in bun ");
            if With_Mustard then
               Put_Line("and add mustard");
            else
               Put_Line("and hold the mustard");
            end if;
            delay 0.8;
         end Make_A_Hot_Dog;
      end loop;
      Put_Line("I am out of hot dogs");
   end Gourmet;

   task Bill;
   task John;

   task body Bill is
   begin
      for Index in 1..3 loop
         Gourmet.Make_A_Hot_Dog(Index, FALSE);
         Put_Line("Bill is eating the hot dog without mustard");
         New_Line;
      end loop;
      Put_Line("Bill is not hungry any longer");
   end Bill;

   task body John is
   begin
      for Index in 1..2 loop
         Gourmet.Make_A_Hot_Dog(Index, TRUE);
         Put_Line("John is eating the hot dog with mustard");
         New_Line;
      end loop;
      Put_Line("John is not hungry any longer");
   end John;

begin
   null;
end ManyDogs;


-- Result of execution

-- I am ready to make a hot dog for you
-- Put hot dog number 1 in bun and add mustard
-- Put hot dog number 1 in bun and hold the mustard
-- John is eating the hot dog with mustard
--
-- Put hot dog number 2 in bun and add mustard
-- Bill is eating the hot dog without mustard
--
-- Put hot dog number 2 in bun and hold the mustard
-- John is eating the hot dog with mustard
--
-- John is not hungry any longer
-- Bill is eating the hot dog without mustard
--
-- Put hot dog number 3 in bun and hold the mustard
-- I am out of hot dogs
-- Bill is eating the hot dog without mustard
--
-- Bill is not hungry any longer

