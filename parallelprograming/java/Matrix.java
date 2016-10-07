import java.util.Random;

public class Matrix {
  private int[][] elems;
  private Matrix(int[][] elems) {
    this.elems = elems;
  }

  public Matrix mult(Matrix vec) {
    if (elems.length == 1 && elems[0].length == 1) {
      int k = elems[0][0];
      int[][] nElems = new int[vec.elems.length][vec.elems[0].length];
      for (int i = 0; i < nElems.length; i++) {
        for (int j = 0; j < nElems[0].length; j++) {
          nElems[i][j] *= k;
        }
      }
      return new Matrix(nElems);
    }
    if (vec.elems.length == 1 && vec.elems[0].length == 1) {
      return vec.mult(this);
    }
    if (elems[0].length != vec.elems.length) {
      throw new IllegalArgumentException("First matrix width must be the same as second matrix height");
    }
    int[][] nElems = new int[elems.length][vec.elems[0].length];
    for (int i = 0; i < elems.length; i++) {
      for (int j = 0; j < vec.elems[0].length; j++) {
        nElems[i][j] = 0;
        for (int k = 0; k < elems[0].length; k++) {
          nElems[i][j] += elems[i][k] * vec.elems[k][j];
        }
      }
    }
    return new Matrix(nElems);
  }

  public Matrix trans() {
    int[][] nElems = new int[elems[0].length][elems.length];
    for (int i = 0; i < nElems.length; i++) {
      for (int j = 0; j < nElems[0].length; j++) {
        nElems[i][j] = elems[j][i];
      }
    }
    return new Matrix(nElems);
  }

  public Matrix max() {
    int max = elems[0][0];
    for (int i = 0; i < elems.length; i++) {
      for (int j = 0; j < elems[0].length; j++) {
        max = elems[i][j] > max ? elems[i][j] : max;
      }
    }
    int[][] res = new int[1][1];
    res[0][0] = max;
    return new Matrix(res);
  }

  public void print() {
    for (int i = 0; i < elems.length; i++) {
      for (int j = 0; j < elems[0].length; j++) {
        System.out.print(elems[i][j]);
        System.out.print("\t");
      }
      System.out.println();
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
    int[][] elems = new int[m][n];
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
    int[][] res = new int[size][1];
    int[] elems = randomArray(size, maxVal);
    for (int i = 0; i < res.length; i++) {
      res[i][0] = elems[i];
    }
    return new Matrix(res);
  }

  private static int[] randomArray(int size, int maxVal) {
    Random rand = new Random();
    int[] elems = new int[size];
    for (int i = 0; i < size; i++) {
      elems[i] = rand.nextInt(maxVal);
    }
    return elems;
  }

}
