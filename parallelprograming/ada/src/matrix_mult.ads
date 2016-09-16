with MATRIX;
generic
  type FST_HEIGHT is range <>;
  type SAME_SIDE is range <>;
  type SND_WIDTH is range <>;
package MATRIX_MULT is
  package F is new MATRIX(FST_HEIGHT, SAME_SIDE);
  package S is new MATRIX(SAME_SIDE, SND_WIDTH);
  package T is new MATRIX(FST_HEIGHT, SND_WIDTH);
  function mult(a: in F.MATRIX; b: in S.MATRIX) return T.Matrix;
end MATRIX_MULT;
