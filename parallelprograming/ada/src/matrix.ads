with VECTOR;
generic
  type SIZE is range <>;
package matrix is
  function mult(a, b: in );
  procedure Main;
end matrix;
