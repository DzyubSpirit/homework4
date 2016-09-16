with ADA.TEXT_IO;
use ADA.TEXT_IO;
with data;

procedure lab_1 is
  type SIZE is range 1..2;
  package W is new DATA(SIZE);
  use W;
  task f1;
  task f2;
  task f3;

  task body f1 is
    a: VECTOR := vec_1;
    ma: MATRIX := mat_1;
    me: MATRIX := mat_1;
    b: VECTOR := vec_1;
  begin
    put("a:");
    new_line;
    output(a);
    put("ma:");
    new_line;
    output(ma);
    put("me:");
    new_line;
    output(me);
    put("b:");
    new_line;
    output(b);
    put("func1");
    new_line;
    output(func1(a, ma, me, b));
  end f1;

  task body f2 is
    mg: MATRIX := mat_1;
    mh: MATRIX := mat_1;
    mk: MATRIX := mat_1;
    ml: MATRIX := mat_1;
  begin
    put("mg:");
    new_line;
    output(mg);
    put("mh:");
    new_line;
    output(mh);
    put("mk:");
    new_line;
    output(mk);
    put("ml:");
    new_line;
    output(ml);
    put("func2:");
    new_line;
    output(func2(mg, mh, mk, ml));
  end f2;

  task body f3 is
    p: VECTOR := vec_1;
    r: VECTOR := vec_1;
    ms: MATRIX := mat_1;
    mt: MATRIX := mat_1;
  begin
    put("p:");
    new_line;
    output(p);
    put("r:");
    new_line;
    output(r);
    put("ms:");
    new_line;
    output(ms);
    put("mt:");
    new_line;
    output(mt);
    put("func3:");
    new_line;
    output(func3(p, r, ms, mt));
  end f3;
begin
  put("Main program");
end lab_1;
