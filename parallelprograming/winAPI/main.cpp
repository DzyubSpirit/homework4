#include <iostream>
#include "matrix.cpp"
#include "windows.h"

#define N 2
#define MAX_VALUE 10

using namespace std;

DWORD WINAPI f1(LPVOID);
DWORD WINAPI f2(LPVOID);
DWORD WINAPI f3(LPVOID);

int main() {
	DWORD dwThreadIdArray[3];
	HANDLE threads[3];
	threads[0] = CreateThread(NULL, 0, f1, NULL, 0, &dwThreadIdArray[0]);
	threads[1] = CreateThread(NULL, 0, f2, NULL, 0, &dwThreadIdArray[1]);
	threads[2] = CreateThread(NULL, 0, f3, NULL, 0, &dwThreadIdArray[2]);
	
	WaitForMultipleObjects(3, threads, TRUE, INFINITE);
	for (int i = 0; i < 3; i++) {
		CloseHandle(threads[i]);
	}
	return 0;
}

DWORD WINAPI f1(LPVOID lpParam) {
	Matrix **param = (Matrix**) lpParam;
	Matrix b = Matrix::randomHVector(N, MAX_VALUE);
  Matrix c = Matrix::randomVVector(N, MAX_VALUE);
  Matrix ma = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix me = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix res = Matrix::F1(b, c, ma, me);
  cout << "f1:" << endl;
  b.print();
  c.print();
  ma.print();
  me.print();
  res.print();
  return 0;
}

DWORD WINAPI f2(LPVOID lpParam) {
	Matrix mk = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix mh = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix mf = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix res = Matrix::F2(mk, mh, mf);
  cout << "f2:" << endl;
  mk.print();
  mh.print();
  mf.print();
  res.print();
	return 0;
}

DWORD WINAPI f3(LPVOID lpParam) {
  Matrix mp = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix mr = Matrix::randomMatrix(N, N, MAX_VALUE);
  Matrix t = Matrix::randomVVector(N, MAX_VALUE);
  Matrix res = Matrix::F3(mp, mr, t);
  cout << "f3:" << endl;
  mp.print();
  mr.print();
  t.print();
  res.print();
	return 0;
}