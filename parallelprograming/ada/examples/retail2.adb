                                            -- Chapter 27 - Program 5
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Retail2 is

   Number_Of_Dogs : INTEGER := 0;

                          -- The main program adds and deletes
                          -- hot dogs to/from the shelf.

   task Five_Dogs;        -- This task adds five hot dogs to stock

   task Remove_Five_Dogs; -- This task deletes five from stock

   task Retail_Hot_Dogs is
      entry Stock_With_A_Hot_Dog;  -- This adds a hot dog to stock
      entry Deliver_A_Hot_Dog;     -- This deletes one from stock
   end Retail_Hot_Dogs;

   task body Retail_Hot_Dogs is
   begin
      for Index in 1..18 loop
         Put("In loop => ");
         select
            when Number_Of_Dogs < 8 =>
            accept Stock_With_A_Hot_Dog do
               Number_Of_Dogs := Number_Of_Dogs + 1;
               Put("Add a hot dog to the shelf, number =");
               Put(Number_Of_Dogs, 3);
               New_Line;
            end Stock_With_A_Hot_Dog;
         or
            when Number_Of_Dogs > 0 =>
            accept Deliver_A_Hot_Dog do
               Put_Line("Remove a hot dog from the shelf");
               Number_Of_Dogs := Number_Of_Dogs - 1;
            end Deliver_A_Hot_Dog;
         end select;
      end loop;
   end Retail_Hot_Dogs;

   task body Five_Dogs is
   begin
      for Index in 1..5 loop
         delay 0.1;
         Retail_Hot_Dogs.Stock_With_A_Hot_Dog;
      end loop;
   end Five_Dogs;

   task body Remove_Five_Dogs is
   begin
      for Index in 1..5 loop
         delay 0.6;
         Retail_Hot_Dogs.Deliver_A_Hot_Dog;
      end loop;
   end Remove_Five_Dogs;

begin
   for Index in 1..4 loop
      delay 0.9;
      Retail_Hot_Dogs.Stock_With_A_Hot_Dog;
      Retail_Hot_Dogs.Deliver_A_Hot_Dog;
   end loop;
end Retail2;




-- Result of execution (With no changes)

-- Add a hot dog to the shelf, number =  1
-- Add a hot dog to the shelf, number =  2
-- Add a hot dog to the shelf, number =  3
-- Add a hot dog to the shelf, number =  4
-- Add a hot dog to the shelf, number =  5
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  5
-- Remove a hot dog from the shelf
-- Remove a hot dog from the shelf
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  3
-- Remove a hot dog from the shelf
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  2
-- Remove a hot dog from the shelf
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  1
-- Remove a hot dog from the shelf





-- Result of execution (With line 29 changed so limit is 3)

-- Add a hot dog to the shelf, number =  1
-- Add a hot dog to the shelf, number =  2
-- Add a hot dog to the shelf, number =  3
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  3
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  3
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  3
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  3
-- Remove a hot dog from the shelf
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  2
-- Remove a hot dog from the shelf
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  1
-- Remove a hot dog from the shelf





-- Result of execution (With delays swapped in lines 49 and 57)

-- Add a hot dog to the shelf, number =  1
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  1
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  1
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  1
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  1
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  1
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  1
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  1
-- Remove a hot dog from the shelf
-- Add a hot dog to the shelf, number =  1
-- Remove a hot dog from the shelf

