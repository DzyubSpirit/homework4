-- 4206 = 4*900 + 20*30 + 6
-- a = 5, b = 21, c = 7
with ADA.TEXT_IO;
use ADA.TEXT_IO;
with ADA.NUMERICS.DISCRETE_RANDOM;

package body Data is
  function "+"(a, b: in VECTOR) return VECTOR is
    res: VECTOR;
  begin
    for i in SIZE'FIRST..SIZE'LAST loop
      res(i) := a(i) + b(i);
    end loop;
    return res;
  end "+";

  function "+"(a, b: in MATRIX) return MATRIX is
    res: MATRIX;
  begin
    for i in SIZE'FIRST..SIZE'LAST loop
      for j in SIZE'FIRST..SIZE'LAST loop
        res(i)(j) := a(i)(j) + b(i)(j);
      end loop;
    end loop;
    return res;
  end "+";

  function "*"(a: in VECTOR; b: in MATRIX) return VECTOR is
    res: VECTOR;
  begin
    for i in SIZE'FIRST..SIZE'LAST loop
      res(i) := 0;
      for j in SIZE'FIRST..SIZE'LAST loop
        res(i) := res(i) + a(j) * b(j)(i);
      end loop;
    end loop;
    return res;
  end "*";

  function "*"(a, b: in MATRIX) return MATRIX is
    res: MATRIX;
  begin
    for i in SIZE'FIRST..SIZE'LAST loop
      for j in SIZE'FIRST..SIZE'LAST loop
        res(i)(j) := 0;
        for k in SIZE'FIRST..SIZE'LAST loop
          res(i)(j) := res(i)(j) + a(i)(k) * b(k)(j);
        end loop;
      end loop;
    end loop;
    return res;
  end "*";

  function sort(a: VECTOR) return VECTOR is
    res: VECTOR;
  begin
    for i in SIZE'FIRST..SIZE'LAST loop
      res(i) := a(i);
    end loop;
    for i in SIZE'FIRST..SIZE'LAST-1 loop
      for j in SIZE'FIRST..SIZE'LAST-1-i-SIZE'FIRST loop
        if res(j) > res(j + 1) then
          res(j) := res(j + 1) + res(j);
          res(j + 1) := res(j) - res(j + 1);
          res(j) := res(j) - res(j + 1);
        end if;
      end loop;
    end loop;
    return res;
  end sort;

  function func1(a: in VECTOR; ma, me: in MATRIX; b: in VECTOR) return VECTOR is
    res: VECTOR;
  begin
    res := sort(a) * (ma * me) + sort(b);
    return res;
  end func1;

  function func2(mg, mh, mk, ml: in MATRIX) return MATRIX is
    res: MATRIX;
  begin
    res := mg + mh * mk + ml;
    return res;
  end func2;

  function func3(p, r: in VECTOR; ms, mt: in MATRIX) return VECTOR is
    res: VECTOR;
  begin
    res := (p + r) * (ms * mt);
    return res;
  end func3;

  procedure output(a: VECTOR) is
    package INT_IO is new ADA.TEXT_IO.INTEGER_IO(INTEGER);
    use INT_IO;
    package SIZE_IO is new ADA.TEXT_IO.INTEGER_IO(SIZE);
    use SIZE_IO;
  begin
    for i in SIZE'FIRST..SIZE'LAST loop
      put(a(i), 5);
    end loop;
    new_line;
  end output;

  procedure output(a: MATRIX) is
  begin
    for i in SIZE'FIRST..SIZE'LAST loop
      output(a(i));
    end loop;
  end output;

  function mat_1 return MATRIX is
    subtype R1_10 is INTEGER range 1..9;
    package R is new ADA.NUMERICS.DISCRETE_RANDOM(R1_10);
    use R;
    res: MATRIX;
    g: GENERATOR;
  begin
    reset(g);
    for i in SIZE'FIRST..SIZE'LAST loop
      for j in SIZE'FIRST..SIZE'LAST loop
        res(i)(j) := random(g);
      end loop;
    end loop;
    return res;
  end mat_1;

  function vec_1 return VECTOR is
    subtype R1_10 is INTEGER range 1..9;
    package INT_IO is new ADA.TEXT_IO.INTEGER_IO(INTEGER);
    use INT_IO;
    package R is new ADA.NUMERICS.DISCRETE_RANDOM(R1_10);
    use R;
    res: VECTOR;
    g: GENERATOR;
  begin
    reset(g);
    for i in SIZE'FIRST..SIZE'LAST loop
      res(i) := random(g);
    end loop;
    return res;
  end vec_1;
end Data;
