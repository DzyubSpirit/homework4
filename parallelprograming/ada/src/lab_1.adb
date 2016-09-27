with ADA.TEXT_IO;
use ADA.TEXT_IO;
with System;
use System;
with data;

procedure lab_1 is
  type SIZE is range 1..300;
  package W is new DATA(SIZE);
  use W;
  task f1 is
    pragma CPU(1);
    pragma Priority(8);
  end f1;
  task f2 is
    pragma CPU(0);
    pragma Priority(4);
  end f2;
  task f3 is
    pragma CPU(1);
    pragma Priority(System.Default_Priority + 1);
  end f3;

  task body f1 is
    b: VECTOR := vec_1;
    ma: MATRIX := mat_1;
    me: MATRIX := mat_1;
    c: VECTOR := vec_1;
  begin
    put("b:");
    new_line;
    output(b);
    put("ma:");
    new_line;
    output(ma);
    put("me:");
    new_line;
    output(me);
    put("c:");
    new_line;
    output(c);
    put("func1");
    new_line;
    output(func1(b, c, ma, me));
  end f1;

  task body f2 is
    mk: MATRIX := mat_1;
    mh: MATRIX := mat_1;
    mf: MATRIX := mat_1;
  begin
    put("mk:");
    new_line;
    output(mk);
    put("mh:");
    new_line;
    output(mh);
    put("mf:");
    new_line;
    output(mf);
    put("func2:");
    new_line;
    output(func2(mk, mh, mf));
  end f2;

  task body f3 is
    mp: MATRIX := mat_1;
    mr: MATRIX := mat_1;
    t: VECTOR := vec_1;
  begin
    put("mp:");
    new_line;
    output(mp);
    put("mr:");
    new_line;
    output(mr);
    put("t:");
    new_line;
    output(t);
    put("func3:");
    new_line;
    output(func3(mp, mr, t));
  end f3;
begin
  put("Main program");
end lab_1;
