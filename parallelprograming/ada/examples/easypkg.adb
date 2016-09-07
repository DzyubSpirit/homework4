package body EasyPkg is
   procedure Trade_Values (X, Y : in out MY_INT_TYPE) is
   Temp : MY_INT_TYPE;
   begin
      Temp := X;
      X := Y;
      Y := Temp;
   end Trade_Values;

   function Average_Values (X, Y : MY_REAL_TYPE)
                                       return MY_REAL_TYPE is
   begin
      return (X + Y) / 2.0;
   end Average_Values;

end EasyPkg;
