generic
  type SIZE is range <>;
  type VECTOR is array(SIZE) of INTEGER; 
package vector is
  function mult(a, b: in VECTOR) return INTEGER;
  function sum(a, b: in VECTOR) return VECTOR;
end vector;

