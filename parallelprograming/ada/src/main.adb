with VECTOR, MATRIX, MATRIX_MULT, VEC_MAT_MULT;

procedure main is
  type A_WIDTH is range 1..2;
  type MA_HEIGHT is range 1..5;
  type ME_WIDTH is range 1..3;
  type ME_HEIGHT is range 1..4;
  package MM is new MATRIX_MULT(MA_HEIGHT, ME_HEIGHT, ME_WIDTH);
  package VM is new VEC_MAT_MULT(A_WIDTH, ME_WIDTH);
  MA: MM.F.MATRIX;
  ME: MM.S.MATRIX;
  A: VM.MM.F.W.VECTOR;
  res1: VM.MM.S.MATRIX;
  res: VM.MM.T.W.VECTOR;
begin
  res1 := MM.mult(MA, ME);
  res := VM.mult(A, res1);
end main;
