                                       -- Chapter 21 - Program 2

-- This package uses a data structure composed of three INTEGER
-- variables.  It allow the user to add two structures, component
-- by component, or subtract component by component.  Provision is
-- also made to build a structure from three numbers, or decompose
-- a structure into its components.

package Three is

type DATA_STRUCTURE is private;

function "+"(Data1, Data2 : DATA_STRUCTURE) return DATA_STRUCTURE;
function "-"(Data1, Data2 : DATA_STRUCTURE) return DATA_STRUCTURE;
function Build_Structure(Val1, Val2, Val3 : INTEGER) return
                                                   DATA_STRUCTURE;
procedure Decompose(Data1 : DATA_STRUCTURE;
                    Val1, Val2, Val3 : out INTEGER);

private
   type DATA_STRUCTURE is
      record
         Value1 : INTEGER;
         Value2 : INTEGER;
         Value3 : INTEGER;
      end record;
end Three;



package body Three is

function "+"(Data1, Data2 : DATA_STRUCTURE) return DATA_STRUCTURE is
Temp : DATA_STRUCTURE;
begin
   Temp.Value1 := Data1.Value1 + Data2.Value1;
   Temp.Value2 := Data1.Value2 + Data2.Value2;
   Temp.Value3 := Data1.Value3 + Data2.Value3;
   return Temp;
end "+";


function "-"(Data1, Data2 : DATA_STRUCTURE) return DATA_STRUCTURE is
Temp : DATA_STRUCTURE;
begin
   Temp.Value1 := Data1.Value1 - Data2.Value1;
   Temp.Value2 := Data1.Value2 - Data2.Value2;
   Temp.Value3 := Data1.Value3 - Data2.Value3;
   return Temp;
end "-";


function Build_Structure(Val1, Val2, Val3 : INTEGER) return
                                                   DATA_STRUCTURE is
Temp : DATA_STRUCTURE;
begin
   Temp.Value1 := Val1;
   Temp.Value2 := Val2;
   Temp.Value3 := Val3;
   return Temp;
end Build_Structure;


procedure Decompose(Data1 : DATA_STRUCTURE;
                    Val1, Val2, Val3 : out INTEGER) is
begin
   Val1 := Data1.Value1;
   Val2 := Data1.Value2;
   Val3 := Data1.Value3;
end Decompose;

end Three;




-- This program exercises the package Three as an illustration.

with Ada.Text_IO;   use Ada.Text_IO;
with Three;         use Three;

procedure Privat1 is

   My_Data, Extra_Data : DATA_STRUCTURE;
   Temp                : DATA_STRUCTURE;

begin

   My_Data := Build_Structure(3, 7, 13);
   Extra_Data := Build_Structure(-4, 77, 0);
   My_Data := My_Data + Extra_Data;

   if My_Data /= Extra_Data then
      Put_Line("The two structures are not equal.");
   end if;

   My_Data := Extra_Data;

   if My_Data = Extra_Data then
      Put_Line("The two structures are equal now.");
   end if;

--       The following line is illegal with the private type.
-- My_Data.Value1 := My_Data.Value1 + 13;

   Temp := Build_Structure(13, 0, 0);
   My_Data := My_Data + Temp;

end Privat1;




-- Result of execution

-- The two structures are not equal.
-- The two structures are equal now.

