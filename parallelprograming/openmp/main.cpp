#include <iostream>
#include "matrix.cpp"
#include <omp.h>
#include <vector>
#include <utility>

#define N 300
#define MAX_VALUE 10

using namespace std;

typedef pair<const char*, Matrix> NamedMatrix;

vector<NamedMatrix> f1();
vector<NamedMatrix> f2();
vector<NamedMatrix> f3();

int main() {
  vector<NamedMatrix> (*f[])() = { &f1, &f2, &f3 };
  vector<NamedMatrix> results[3];
#pragma omp parallel num_threads (3)
  {
  #pragma omp for
    for (int i = 0; i < 3; i++)
      results[i] = f[i]();
  }
  for (int i = 0; i < 3; i++) {
    cout << "Func " << i << endl;
    for (int j = 0; j < results[i].size(); j++) {
      cout << results[i][j].first << endl;
      results[i][j].second.print();
    }
  }

  return 0;
}

vector<NamedMatrix> f1() {
  Matrix b = Matrix::randomHVector(N, MAX_VALUE);
  Matrix c = Matrix::randomVVector(N, MAX_VALUE);
  Matrix ma = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix me = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix res = Matrix::F1(b, c, ma, me);
  vector<NamedMatrix> matrixes(5);
  matrixes[0] = make_pair("b", b);
  matrixes[1] = make_pair("c", c);
  matrixes[2] = make_pair("ma", ma);
  matrixes[3] = make_pair("me", me);
  matrixes[4] = make_pair("res", res);
  return matrixes;
}

vector<NamedMatrix> f2() {
  Matrix mk = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix mh = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix mf = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix res = Matrix::F2(mk, mh, mf);
  vector<NamedMatrix> matrixes(4);
  matrixes[0] = make_pair("mk", mk);
  matrixes[1] = make_pair("mh", mh);
  matrixes[2] = make_pair("mf", mf);
  matrixes[3] = make_pair("res", res);
  return matrixes;
}

vector<NamedMatrix> f3() {
  Matrix mp = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix mr = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix t = Matrix::randomVVector(N, MAX_VALUE);
  Matrix res = Matrix::F3(mp, mr, t);
  vector<NamedMatrix> matrixes(4);
  matrixes[0] = make_pair("mp", mp);
  matrixes[1] = make_pair("mr", mr);
  matrixes[2] = make_pair("t", t);
  matrixes[3] = make_pair("res", res);
  return matrixes;
}
