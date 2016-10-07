public class Main {
  public static final int N = 1000;
  public static final int MAX_VALUE = 10;

  public static void main(String... args) {
    Thread t1, t2, t3;
    t1 = new Thread(() -> {
      Matrix b, c, ma, me;
      b = Matrix.randomHVector(N, MAX_VALUE);
      c = Matrix.randomVVector(N, MAX_VALUE);
      ma = Matrix.randomMatrix(N, N, MAX_VALUE);
      me = Matrix.randomMatrix(N, N, MAX_VALUE);
      Matrix res = Matrix.F1(b, c, ma, me);

      synchronized (System.out) {
        System.out.println("b:");
        b.print();
        System.out.println("c:");
        c.print();
        System.out.println("ma:");
        ma.print();
        System.out.println("me:");
        me.print();
        System.out.println("Result:");
        res.print();
      }
    });
    t2 = new Thread(() -> {
      Matrix mk, mh, mf;
      mk = Matrix.randomMatrix(N, N, MAX_VALUE);
      mh = Matrix.randomMatrix(N, N, MAX_VALUE);
      mf = Matrix.randomMatrix(N, N, MAX_VALUE);
      Matrix res = Matrix.F2(mk, mh, mf);

      synchronized (System.out) {
        System.out.println("mk:");
        mk.print();
        System.out.println("mh:");
        mh.print();
        System.out.println("mf:");
        mf.print();
        System.out.println("Result:");
        res.print();
      }
    });
    t3 = new Thread(() -> {
      Matrix mp, mr, t;
      mp = Matrix.randomMatrix(N, N, MAX_VALUE);
      mr = Matrix.randomMatrix(N, N, MAX_VALUE);
      t = Matrix.randomVVector(N, MAX_VALUE);
      Matrix res = Matrix.F3(mp, mr, t);

      synchronized (System.out) {
        System.out.println("mp:");
        mp.print();
        System.out.println("mr:");
        mr.print();
        System.out.println("t:");
        t.print();
        System.out.println("Result:");
        res.print();
      }
    });    
    t1.setPriority(1);
    t1.start();
    t2.start();
    t2.setPriority(2);
    t3.start();
    t3.setPriority(3);
    try {
      t1.join();
      t2.join();
      t3.join();
    } catch (Exception e) {
      System.out.println("Something with joins");
      e.printStackTrace();
    }
  }
}
