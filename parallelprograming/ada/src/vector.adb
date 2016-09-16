package body vector is
  function mult(a, b: in VECTOR) return INTEGER is
    res: INTEGER := 0;
  begin
    for i in SIZE'FIRST..SIZE'LAST loop
      res := res + a(i) * b(i);
    end loop;
    return res;
  end mult;

  function sum(a, b: in VECTOR) return VECTOR is
    res: VECTOR;
  begin
    for i in SIZE'FIRST..SIZE'LAST loop
      res(i) := a(i) + b(i);
    end loop;
    return res;
  end sum;
end vector;
