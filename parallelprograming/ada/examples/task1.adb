                                    -- Chapter 26 - Program 2
with Ada.Text_IO, Ada.Integer_Text_IO; 
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Task1 is

   task First_Task;
   task body First_Task is
   begin
      for Index in 1..4 loop
         Put("This is in First_Task, pass number ");
         Put(Index, 3);
         New_Line;
      end loop;
   end First_Task;

   task Second_Task;
   task body Second_Task is
   begin
      for Index in 1..7 loop
         Put("This is in Second_Task, pass number");
         Put(Index, 3);
         New_Line;
      end loop;
   end Second_Task;

   task Third_Task;
   task body Third_Task is
   begin
      for Index in 1..5 loop
         Put("This is in Third_Task, pass number ");
         Put(Index, 3);
         New_Line;
      end loop;
   end Third_Task;

begin
   Put_Line("This is in the main program.");
end Task1;




-- Result of Execution

-- This is in Third_Task, pass number   1
-- This is in Third_Task, pass number   2
-- This is in Third_Task, pass number   3
-- This is in Third_Task, pass number   4
-- This is in Third_Task, pass number   5
-- This is in Second_Task, pass number  1
-- This is in Second_Task, pass number  2
-- This is in Second_Task, pass number  3
-- This is in Second_Task, pass number  4
-- This is in Second_Task, pass number  5
-- This is in Second_Task, pass number  6
-- This is in Second_Task, pass number  7
-- This is in First Task, pass number   1
-- This is in First Task, pass number   2
-- This is in First Task, pass number   3
-- This is in First Task, pass number   4
-- This is in the main program.

