                                       -- Chapter 3 - Program 5
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure IntAttrs is

   type BUG_RANGE is range -13..34;

   Rat : INTEGER;
   Dog : NATURAL;
   Cat : POSITIVE;
   Bug : BUG_RANGE;

begin

   Rat := 12;
   Dog := 23;
   Cat := 31;
   Bug := -11;

   Put("The type INTEGER uses ");
   Put(INTEGER'SIZE);
   Put(" bits of memory,");
   New_Line;
   Put(" and has a range from ");
   Put(INTEGER'FIRST);
   Put(" to ");
   Put(INTEGER'LAST);
   New_Line;
   Put(" Rat has a present value of ");
   Put(Rat);
   New_Line(2);

   Put("The type NATURAL uses ");
   Put(NATURAL'SIZE);
   Put(" bits of memory,");
   New_Line;
   Put(" and has a range from ");
   Rat := NATURAL'FIRST;
   Put(Rat);
   Put(" to ");
   Rat := NATURAL'LAST;
   Put(Rat);
   New_Line;
   Put(" Dog has a present value of ");
   Put(Dog);
   New_Line(2);

   Put("The type POSITIVE uses ");
   Put(POSITIVE'SIZE);
   Put(" bits of memory,");
   New_Line;
   Put(" and has a range from ");
   Put(POSITIVE'FIRST);
   Put(" to ");
   Put(POSITIVE'LAST);
   New_Line;
   Put(" Cat has a present value of ");
   Put(Cat);
   New_Line(2);

   Put("The type BUG_RANGE uses ");
   Put(INTEGER(BUG_RANGE'SIZE));
   Put(" bits of memory,");
   New_Line;
   Put(" and has a range from ");
   Put(INTEGER(BUG_RANGE'FIRST));
   Put(" to ");
   Put(INTEGER(BUG_RANGE'LAST));
   New_Line;
   Put(" Bug has a present value of ");
   Put(INTEGER(Bug));
   New_Line(2);

end IntAttrs;




-- Result of execution

-- The type INTEGER uses          32 bits of memory,
--  and has a range from -2147483648 to  2147483647
--  Rat has a present value of          12

-- The type NATURAL uses          31 bits of memory,
--  and has a range from           0 to  2147483647
--  Dog has a present value of          23

-- The type POSITIVE uses          31 bits of memory,
--  and has a range from           1 to  2147483647
--  Cat has a present value of          31

-- The type BUG_RANGE uses           7 bits of memory,
--  and has a range from         -13 to          34
--  Bug has a present value of         -11

