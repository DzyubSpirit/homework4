with Ada.Text_IO, EasyPkg;
use Ada.Text_IO;

procedure GenPkg is

type MY_NEW_TYPE is new INTEGER range -12..123;
type MY_NEW_FLOAT is new FLOAT digits 6;

package Funny_Stuff is new EasyPkg(MY_NEW_TYPE, MY_NEW_FLOAT);
use Funny_Stuff;
package Usual_Stuff is new EasyPkg(INTEGER, FLOAT);
use Usual_Stuff;

Int1 : INTEGER := 12;
Int2 : INTEGER := 35;
My_Int1 : MY_NEW_TYPE := 1;
My_Int2 : MY_NEW_TYPE := 14;

Real1 : FLOAT;
My_Real1 : MY_NEW_FLOAT;

begin
   Trade_Values(Int1, Int2);       -- Uses Usual_Stuff.Trade_Values
   Trade_Values(My_Int1, My_Int2); -- Uses Funny_Stuff.Trade_Values
   Usual_Stuff.Trade_Values(Int1, Int2);
   Funny_Stuff.Trade_Values(My_Int1, My_Int2);
-- Usual_Stuff.Trade_Values(My_Int1, My_Int2);   -- Illegal
-- Trade_Values(My_Int1, Int2);                  -- Illegal

   Real1 := Average_Values(2.71828, 3.141592);
   Real1 := Average_Values(Real1, 2.0 * 3.141592);
   My_Real1 := Average_Values(12.3, 27.345);
   My_Real1 := Average_Values(My_Real1, 2.0 * 3.141592);
   My_Real1 := Funny_Stuff.Average_Values(12.3, 27.345);
end GenPkg;


