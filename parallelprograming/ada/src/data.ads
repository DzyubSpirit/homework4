generic
  type SIZE is range <>;
package Data is
  type VECTOR is private;
  type MATRIX is private;

  function "*"(a, b: in MATRIX) return MATRIX;
  function "*"(a: in VECTOR; b: in MATRIX) return VECTOR;
  function "+"(a, b: in VECTOR) return VECTOR;
  function "+"(a, b: in MATRIX) return MATRIX;
  function sort(a: VECTOR) return VECTOR;

  function func1(a: in VECTOR; ma, me: in MATRIX; b: in VECTOR) return VECTOR;
  function func2(mg, mh, mk, ml: in MATRIX) return MATRIX;
  function func3(p, r: in VECTOR; ms, mt: in MATRIX) return VECTOR;

  procedure output(a: VECTOR);
  procedure output(a: MATRIX);

  function mat_1 return MATRIX;
  function vec_1 return VECTOR;
private
  type VECTOR is ARRAY(SIZE) of INTEGER;
  type MATRIX is ARRAY(SIZE) of VECTOR;
end Data;
