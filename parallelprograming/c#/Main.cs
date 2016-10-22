using System;
using System.Threading;

using MatrixCalculation;

public class ThreeTasks {
  public static readonly int N = 100;
  public static readonly int MAX_VALUE = 10;

  private static readonly object tasksLock = new object();

  public static void Main(string[] args) {
    Thread t1, t2, t3;
    t1 = new Thread(T1);
    t2 = new Thread(T2);    
    t3 = new Thread(T3);    
    t1.Priority = (ThreadPriority) 1;
    t1.Start();
    t2.Start();
    t2.Priority = (ThreadPriority) 2;
    t3.Start();
    t3.Priority = (ThreadPriority) 3;
    try {
      t1.Join();
      t2.Join();
      t3.Join();
    } catch (Exception e) {
      Console.WriteLine("Something with joins");
      Console.WriteLine(e.Message);
    }
  }

  public static void T1() {
    Matrix b, c, ma, me;
    b = Matrix.randomHVector(N, MAX_VALUE);
    c = Matrix.randomVVector(N, MAX_VALUE);
    ma = Matrix.randomMatrix(N, N, MAX_VALUE);
    me = Matrix.randomMatrix(N, N, MAX_VALUE);
    Matrix res = Matrix.F1(b, c, ma, me);

    lock (tasksLock) {
      Console.WriteLine("b:");
      b.print();
      Console.WriteLine("c:");
      c.print();
      Console.WriteLine("ma:");
      ma.print();
      Console.WriteLine("me:");
      me.print();
      Console.WriteLine("Result:");
      res.print();
    }
    
  }

  public static void T2() {
      Matrix mk, mh, mf;
      mk = Matrix.randomMatrix(N, N, MAX_VALUE);
      mh = Matrix.randomMatrix(N, N, MAX_VALUE);
      mf = Matrix.randomMatrix(N, N, MAX_VALUE);
      Matrix res = Matrix.F2(mk, mh, mf);

      lock (tasksLock) {
        Console.WriteLine("mk:");
        mk.print();
        Console.WriteLine("mh:");
        mh.print();
        Console.WriteLine("mf:");
        mf.print();
        Console.WriteLine("Result:");
        res.print();
      }
    }

    public static void T3() {
      Matrix mp, mr, t;
      mp = Matrix.randomMatrix(N, N, MAX_VALUE);
      mr = Matrix.randomMatrix(N, N, MAX_VALUE);
      t = Matrix.randomVVector(N, MAX_VALUE);
      Matrix res = Matrix.F3(mp, mr, t);

      lock (tasksLock) {
        Console.WriteLine("mp:");
        mp.print();
        Console.WriteLine("mr:");
        mr.print();
        Console.WriteLine("t:");
        t.print();
        Console.WriteLine("Result:");
        res.print();
      }
    }
}
