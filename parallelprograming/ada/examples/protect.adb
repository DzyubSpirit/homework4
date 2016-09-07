                                   -- Chapter 27 - Program 6

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Protect is
   
protected Animals is
   procedure Add_Some(Dogs_In : INTEGER; Cats_IN : INTEGER);
   procedure Subtract_Some(Dogs_In : INTEGER; Cats_In : INTEGER);
   procedure Get_Count(Dogs_Out : out INTEGER; 
                                           Cats_Out : out INTEGER);
private
   Dogs : INTEGER := 5;
   Cats : INTEGER := 3;
end Animals;

protected body Animals is
 
   procedure Add_Some(Dogs_In : INTEGER; Cats_In : INTEGER) is
   begin
      Dogs := Dogs + Dogs_In;
      Cats := Cats + Cats_In;
   end Add_Some;

   procedure Subtract_Some(Dogs_In : INTEGER; Cats_In : INTEGER) is
   begin
      Dogs := Dogs - Dogs_In;
      Cats := Cats - Cats_In;
   end Subtract_Some;

   procedure Get_Count(Dogs_Out : out INTEGER; 
                                           Cats_Out : out INTEGER) is
   begin
      Dogs_Out := Dogs;
      Cats_Out := Cats;
   end Get_Count;

end Animals;


   task Farm_Animals;
   task City_Animals;
   task Catch_Animals;

   task body Farm_Animals is
   begin
      for Index in 1..5 loop
         delay(0.3);
         Animals.Subtract_Some(3, 2);
      end loop;
   end Farm_Animals;

   task body City_Animals is
   begin
      for Index in 1..4 loop
         delay(0.5);
         Animals.Subtract_Some(1, 2);
      end loop;
   end City_Animals;

   task body Catch_Animals is
   begin
      for Index in 1..7 loop
         delay(0.6);
         Animals.Add_Some(7, 4);
      end loop;
   end Catch_Animals;

Number_Of_Dogs : INTEGER;
Number_Of_Cats : INTEGER;

begin
   for Index in 1..12 loop
      Animals.Get_Count(Number_Of_Dogs, Number_Of_Cats);
      Put("Dog count = ");
      Put(Number_Of_Dogs, 4);
      Put(" Cat count = ");
      Put(Number_Of_Cats, 4);
      New_Line;
      delay 0.5;
   end loop;
end Protect;


-- Result of execution

-- Dog count =    5 Cat count =    3
-- Dog count =    1 Cat count =   -1
-- Dog count =    1 Cat count =   -3
-- Dog count =    4 Cat count =   -3
-- Dog count =    7 Cat count =   -3
-- Dog count =   14 Cat count =    1
-- Dog count =   21 Cat count =    5
-- Dog count =   21 Cat count =    5
-- Dog count =   28 Cat count =    9
-- Dog count =   35 Cat count =   13
-- Dog count =   35 Cat count =   13
-- Dog count =   35 Cat count =   13

