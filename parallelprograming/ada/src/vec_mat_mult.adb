package body VEC_MAT_MULT is
  function mult(vec: in MM.F.W.VECTOR; mat: in MM.S.MATRIX) return MM.T.W.VECTOR is
    m1: MM.F.MATRIX;
    mres: MM.T.MATRIX;
    res: MM.T.W.VECTOR;
  begin
    m1(1) := vec;
    mres := MM.mult(m1, mat);
    res := mres(1);
    return res;
  end mult;
end VEC_MAT_MULT;
