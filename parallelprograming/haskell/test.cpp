#include "stdio.h"

#define N 500

int** array() {
  int** res = new int*[N];
  for (int i = 0; i < N; i++) {
    res[i] = new int[N];
  }
  return res;
}

void del(int** arr) {
  for (int i = 0; i < N; i++) {
    delete[] arr[i];
  }
  delete[] arr;
}

int main() {
  int** arr = array();
  int** arr2 = array();
  int** res = array();
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      arr[i][j] = arr2[i][j] = j * N + i + 1;
    }
  }
  printf("ok1");
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      res[i][j] = 0;
      for (int k = 0; k < N; k++) {
        res[i][j] += arr[i][k] * arr[k][j];
      }
    }
  }
  del(arr);
  del(arr2);
  del(res);
}
