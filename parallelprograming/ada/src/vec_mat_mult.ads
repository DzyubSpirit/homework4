with VECTOR, MATRIX, MATRIX_MULT;
generic
  type VEC_SIZE is range <>;
  type MAT_WIDTH is range <>;
package VEC_MAT_MULT is
  type ONE_RANGE is range 1..1;
  package MM is new MATRIX_MULT(ONE_RANGE, VEC_SIZE, MAT_WIDTH);
  function mult(vec: in MM.F.W.VECTOR; mat: in MM.S.MATRIX) return MM.T.W.VECTOR;
end VEC_MAT_MULT;
