                                     -- Chapter 26 - Program 1
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

with Ada.Calendar; use Ada.Calendar;

procedure Timer is

   package Fix_IO is new Ada.Text_IO.Fixed_IO(DAY_DURATION);
   use Fix_IO;

   Year,Month,Day : INTEGER;
   Start,Seconds  : DAY_DURATION;
   Time_And_Date  : TIME;

begin

   Put_Line("Begin 3.14 second delay");
   delay 3.14;
   Put_Line("End of 3.14 second delay");

   Time_And_Date := Clock;
   Split(Time_And_Date, Year, Month, Day, Start);  -- get start time

   for Index in 1..9 loop
      Put("The date and time are now");
      Time_And_Date := Clock;
      Split(Time_And_Date, Year, Month, Day, Seconds);
      Put(Month, 3);
      delay 0.2;
      Put(Day, 3);
      delay 0.1;
      Put(Year, 5);
      delay 0.1;
      Put(Seconds - Start, 8, 3, 0);
      New_Line;
      delay 0.6;
   end loop;

   Put_Line("Begin non-accumulative timing loop here.");

   Time_And_Date := Clock;
   Split(Time_And_Date, Year, Month, Day, Start);  -- get start time
   for Index in 1..9 loop
      Time_And_Date := Clock;
      Split(Time_And_Date, Year, Month, Day, Seconds);
      Put("The elapsed time is");
      Put(Seconds - Start, 8, 3, 0);
      New_Line;
      delay DAY_DURATION(Index) - (Seconds - Start);
   end loop;

   Time_And_Date := Clock;
   for Index in 1..12 loop
      Time_And_Date := Time_And_Date + 0.4;
      delay until Time_And_Date;
      Put("Tick ");
   end loop;
   New_Line;

end Timer;




-- Result of Execution

-- Begin 3.14 second delay
-- End of 3.14 second delay
-- The date and time are now  3 22 1997        0.000
-- The date and time are now  3 22 1997        1.090
-- The date and time are now  3 22 1997        2.140
-- The date and time are now  3 22 1997        3.180
-- The date and time are now  3 22 1997        4.230
-- The date and time are now  3 22 1997        5.270
-- The date and time are now  3 22 1997        6.320
-- The date and time are now  3 22 1997        7.360
-- The date and time are now  3 22 1997        8.400
-- Begin non-accumulative timing loop here
-- The elapsed time is       0.000
-- The elapsed time is       1.100
-- The elapsed time is       2.030
-- The elapsed time is       3.020
-- The elapsed time is       4.040
-- The elapsed time is       5.030
-- The elapsed time is       6.020
-- The elapsed time is       7.010
-- The elapsed time is       8.000
-- Tick Tick Tick Tick Tick Tick Tick Tick Tick Tick Tick Tick 
