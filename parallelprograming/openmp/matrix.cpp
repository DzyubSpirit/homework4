#include <vector>
#include <iostream>

using namespace std;

vector<vector<int>> makeVector(int n, int m);

class Matrix {
  private:
  vector<vector<int>> elems;
  Matrix(vector<vector<int>> elems) {
    this->elems = elems;
  }

  public:
  Matrix() {}

  Matrix& operator=(const Matrix& mat) {
    this->elems = mat.elems;
    return *this;
  }
  
  Matrix mult(Matrix vec) {
    if (elems.size() == 1 && elems[0].size() == 1) {
      int k = elems[0][0];
      vector<vector<int>> nElems;
      for (int i = 0; i < vec.elems.size(); i++) {
        vector<int> cur;
        for (int j = 0; j < vec.elems[i].size(); j++) {
          cur.push_back(vec.elems[i][j] * k);
        }
        nElems.push_back(cur);
      }
      return Matrix(nElems);
    }
    if (vec.elems.size() == 1 && vec.elems[0].size() == 1) {
      return vec.mult(*this);
    }
    vector<vector<int>> nElems = makeVector(elems.size(), vec.elems[0].size());
    for (int i = 0; i < elems.size(); i++) {
      for (int j = 0; j < vec.elems[0].size(); j++) {
        nElems[i][j] = 0;
        for (int k = 0; k < elems[0].size(); k++) {
          nElems[i][j] += elems[i][k] * vec.elems[k][j];
        }
      }
    }
    return Matrix(nElems);
  }

  Matrix trans() {
    vector<vector<int>> nElems;
    for (int i = 0; i < elems.size(); i++) {
      vector<int> cur;
      for (int j = 0; j < elems[0].size(); j++) {
        cur.push_back(elems[j][i]);
      }
      nElems.push_back(cur);
    }
    return Matrix(nElems);
  }

  Matrix max() {
    int max = elems[0][0];
    for (int i = 0; i < elems.size(); i++) {
      for (int j = 0; j < elems[0].size(); j++) {
        max = elems[i][j] > max ? elems[i][j] : max;
      }
    }
    vector<vector<int>> res = makeVector(1, 1);
    res[0][0] = max;
    return Matrix(res);
  }

  void print() {
    for (int i = 0; i < elems.size(); i++) {
      for (int j = 0; j < elems[0].size(); j++) {
        cout << elems[i][j] << '\t';
      }
      cout << endl;
    }
  }

  static Matrix F1(Matrix b, Matrix c, Matrix ma, Matrix me) {
    return b.mult(c).mult(ma.mult(me)); 
  }

  static Matrix F2(Matrix mk, Matrix mh, Matrix mf) {
    return mk.trans().mult(mh.mult(mf));
  }

  static Matrix F3(Matrix mp, Matrix mr, Matrix t) {
    cout << endl;
    mp.mult(mr).max().mult(t).print();
    cout << endl;
    return mp.mult(mr).max().mult(t);
  }

  static Matrix randomMatrix(int m, int n, int maxVal) {
    vector<vector<int>> elems(m);
    for (int i = 0; i < m; i++) {
      elems[i] = randomArray(n, maxVal);
    }
    return Matrix(elems);
  }

  static Matrix randomVVector(int size, int maxVal) {
    vector<vector<int>> res = makeVector(1, size);
    res[0] = randomArray(size, maxVal);
    return Matrix(res);
  }
 
  static Matrix randomHVector(int size, int maxVal) {
    vector<vector<int>> res = makeVector(size, 1);
    vector<int> elems = randomArray(size, maxVal);
    for (int i = 0; i < res.size(); i++) {
      res[i][0] = elems[i];
    }
    return Matrix(res);
  }

  static vector<int> randomArray(int size, int maxVal) {
    vector<int> elems(size);
    for (int i = 0; i < size; i++) {
      elems[i] = rand() % maxVal;
    }
    return elems;
  }
};

vector<vector<int>> makeVector(int n, int m) {
  vector<vector<int>> res(n);
  for (int i = 0; i < n; i++) {
    res[i] = vector<int>(m);
  }
  return res;
}
