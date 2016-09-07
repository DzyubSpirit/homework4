                                   -- Chapter 27 - Program 1
with Ada.Text_IO;
use Ada.Text_IO;

procedure HotDog is

   task Gourmet is
      entry Make_A_Hot_Dog;
   end Gourmet;

   task body Gourmet is
   begin
      Put_Line("I am ready to make a hot dog for you");
      for Index in 1..4 loop
         accept Make_A_Hot_Dog do
            delay 0.8;
            Put("Put hot dog in bun ");
            Put_Line("and add mustard");
         end Make_A_Hot_Dog;
      end loop;
      Put_Line("I am out of hot dogs");
   end Gourmet;

begin
   for Index in 1..4 loop
      Gourmet.Make_A_Hot_Dog;
      delay 0.1;
      Put_Line("Eat the resulting hot dog");
      New_Line;
   end loop;
   Put_Line("I am not hungry any longer");
end HotDog;


-- Result of execution

-- I am ready to make a hot dog for you
-- Put hot dog in bun and add mustard
-- Eat the resulting hot dog
--
-- Put hot dog in bun and add mustard
-- Eat the resulting hot dog
--
-- Put hot dog in bun and add mustard
-- Eat the resulting hot dog
--
-- Put hot dog in bun and add mustard
-- I am out of hot dogs
-- Eat the resulting hot dog
--
-- I am not hungry any longer

