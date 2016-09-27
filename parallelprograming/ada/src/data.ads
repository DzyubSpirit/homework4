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

  function func1(b, c: in VECTOR; ma, me: in MATRIX) return MATRIX;
  function func2(mk, mh, mf: MATRIX) return MATRIX;
  function func3(mp, mr: in MATRIX; t: in VECTOR) return VECTOR;

  procedure output(a: VECTOR);
  procedure output(a: MATRIX);

  function mat_1 return MATRIX;
  function vec_1 return VECTOR;
private
  type VECTOR is ARRAY(SIZE) of INTEGER;
  type MATRIX is ARRAY(SIZE) of VECTOR;
end Data;
