package body MATRIX_MULT is
  function mult(a: in F.MATRIX; b: in S.MATRIX) return T.Matrix is
    res: T.MATRIX;
  begin
    for i in FST_HEIGHT'FIRST..FST_HEIGHT'LAST loop
      for j in SND_WIDTH'FIRST..SND_WIDTH'LAST loop
        res(i)(j) := 0;
        for k in SAME_SIDE'FIRST..SAME_SIDE'LAST loop
          res(i)(j) := res(i)(j) + a(i)(k) * b(k)(j);   
        end loop;
      end loop;
    end loop;
    return res;
  end mult;
end MATRIX_MULT;
