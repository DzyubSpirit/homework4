using System;

namespace MatrixCalculation {

public class Matrix {
  private int[][] elems;
  private Matrix(int[][] elems) {
    this.elems = elems;
  }

  public Matrix mult(Matrix vec) {
    int[][] nElems;
    if (elems.Length == 1 && elems[0].Length == 1) {
      int k = elems[0][0];
      nElems = create2Array(vec.elems.Length, vec.elems[0].Length);
      for (int i = 0; i < nElems.Length; i++) {
        for (int j = 0; j < nElems[0].Length; j++) {
          nElems[i][j] *= k;
        }
      }
      return new Matrix(nElems);
    }
    if (vec.elems.Length == 1 && vec.elems[0].Length == 1) {
      return vec.mult(this);
    }
    if (elems[0].Length != vec.elems.Length) {
      throw new ArgumentException("First matrix width must be the same as second matrix height");
    }
    nElems = create2Array(elems.Length, vec.elems[0].Length);
    for (int i = 0; i < elems.Length; i++) {
      for (int j = 0; j < vec.elems[0].Length; j++) {
        nElems[i][j] = 0;
        for (int k = 0; k < elems[0].Length; k++) {
          nElems[i][j] += elems[i][k] * vec.elems[k][j];
        }
      }
    }
    return new Matrix(nElems);
  }

  public Matrix trans() {
    int[][] nElems = create2Array(elems[0].Length, elems.Length);
    for (int i = 0; i < nElems.Length; i++) {
      for (int j = 0; j < nElems[0].Length; j++) {
        nElems[i][j] = elems[j][i];
      }
    }
    return new Matrix(nElems);
  }

  public Matrix max() {
    int max = elems[0][0];
    for (int i = 0; i < elems.Length; i++) {
      for (int j = 0; j < elems[0].Length; j++) {
        max = elems[i][j] > max ? elems[i][j] : max;
      }
    }
    int[][] res = create2Array(1, 1);
    res[0][0] = max;
    return new Matrix(res);
  }

  public void print() {
    for (int i = 0; i < elems.Length; i++) {
      for (int j = 0; j < elems[0].Length; j++) {
        Console.Write(elems[i][j]);
        Console.Write("\t");
      }
      Console.WriteLine();
    }
  }

  public static Matrix F1(Matrix b, Matrix c, Matrix ma, Matrix me) {
    return b.mult(c).mult(ma.mult(me)); 
  }

  public static Matrix F2(Matrix mk, Matrix mh, Matrix mf) {
    return mk.trans().mult(mh.mult(mf));
  }

  public static Matrix F3(Matrix mp, Matrix mr, Matrix t) {
    return mp.mult(mr).max().mult(t);
  }

  public static Matrix randomMatrix(int m, int n, int maxVal) {
    int[][] elems = create2Array(m, n);
    for (int i = 0; i < m; i++) {
      elems[i] = randomArray(n, maxVal);
    }
    return new Matrix(elems);
  }

  public static Matrix randomVVector(int size, int maxVal) {
    int[][] res = new int[1][];
    res[0] = randomArray(size, maxVal);
    return new Matrix(res);
  }

  public static Matrix randomHVector(int size, int maxVal) {
    int[][] res = create2Array(size, 1);
    int[] elems = randomArray(size, maxVal);
    for (int i = 0; i < res.Length; i++) {
      res[i][0] = elems[i];
    }
    return new Matrix(res);
  }

  private static int[] randomArray(int size, int maxVal) {
    Random rand = new Random();
    int[] elems = new int[size];
    for (int i = 0; i < size; i++) {
      elems[i] = rand.Next(maxVal);
    }
    return elems;
  }

  public static int[][] create2Array(int n, int m) {
    int[][] res = new int[n][];
    for (int i = 0; i < n; i++) {
      res[i] = new int[m];
    }
    return res;
  }
}

}
