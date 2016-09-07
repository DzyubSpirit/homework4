                          -- Chapter 4 - Programming exercise 1
                                       -- Chapter 4 - Program 1
with Ada.Text_IO;
use Ada.Text_IO;

procedure Ch04_1 is

   package Enum_IO is new Ada.Text_IO.Enumeration_IO(BOOLEAN);
   use Enum_IO;

   One   : INTEGER := 1;
   Two   : INTEGER := 2;
   Three : INTEGER := 3;

   Is_It : BOOLEAN := TRUE;      -- initialized
   Which : BOOLEAN;              -- uninitialized

begin

   Which := TRUE;
   Put("Which now has the value of ");
   Put(Which);
   New_Line;
   Which := FALSE;
   Put("Which now has the value of ");
   Put(Which);
   New_Line;

   Is_It := (One + 1) = Two;
   Put("Is_It now has the value of ");
   Put(Is_It);
   New_Line;
   Is_It := One /= Two;
   Put("Is_It now has the value of ");
   Put(Is_It);
   New_Line;
   Is_It := One + Two >= Three;
   Put("Is_It now has the value of ");
   Put(Is_It);
   New_Line;

end Ch04_1;




-- Result of execution

-- Which now has the value of TRUE
-- Which now has the value of FALSE
-- Is_It now has the value of TRUE
-- Is_It now has the value of TRUE
-- Is_It now has the value of TRUE

