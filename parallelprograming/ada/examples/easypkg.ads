                                    -- Chapter 31 - Program 1
generic
   type MY_INT_TYPE is (<>);
   type MY_REAL_TYPE is digits <>;
package EasyPkg is
   procedure Trade_Values (X, Y : in out MY_INT_TYPE);
   function Average_Values (X, Y : MY_REAL_TYPE)
                                       return MY_REAL_TYPE;
end EasyPkg;

-- Result of execution

-- (There is no output from this program)

