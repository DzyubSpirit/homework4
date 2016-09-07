                                    -- Chapter 27 - Program 4
with Ada.Text_IO;
use Ada.Text_IO;

procedure Retail1 is

   Number_Of_Dogs : INTEGER := 0;

   task Retail_Hot_Dogs is
      entry Stock_With_A_Hot_Dog;
      entry Deliver_A_Hot_Dog;
   end Retail_Hot_Dogs;

   task body Retail_Hot_Dogs is
   begin
      accept Stock_With_A_Hot_Dog do
         Put_Line("Put the first hot dog on the shelf");
         Number_Of_Dogs := Number_Of_Dogs + 1;
      end Stock_With_A_Hot_Dog;

      for Index in 1..7 loop
         Put("In loop => ");
         select
            accept Stock_With_A_Hot_Dog do
               Put_Line("Add a hot dog to the shelf");
               Number_Of_Dogs := Number_Of_Dogs + 1;
            end Stock_With_A_Hot_Dog;
         or
            accept Deliver_A_Hot_Dog do
               Put_Line("Remove a hot dog from the shelf");
               Number_Of_Dogs := Number_Of_Dogs - 1;
            end Deliver_A_Hot_Dog;
         end select;
      end loop;
   end Retail_Hot_Dogs;

begin
   for Index in 1..4 loop
      Retail_Hot_Dogs.Stock_With_A_Hot_Dog;
      Retail_Hot_Dogs.Deliver_A_Hot_Dog;
   end loop;
end Retail1;




-- Result of execution

-- Put the first hot dog on the shelf
-- In loop => Remove a hot dog from the shelf
-- In loop => Add a hot dog to the shelf
-- In loop => Remove a hot dog from the shelf
-- In loop => Add a hot dog to the shelf
-- In loop => Remove a hot dog from the shelf
-- In loop => Add a hot dog to the shelf
-- In loop => Remove a hot dog from the shelf

