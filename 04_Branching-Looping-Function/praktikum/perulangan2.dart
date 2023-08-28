void main() {
  int a = 8;
  for (int i = 0; i < a; i++) {
    print(' ' * i + '*' * (2 * (a - i) - 1));
  }

  for (int i = a - 2; i >= 0; i--) {
    print(' ' * i + '*' * (2 * (a - i) - 1));
  }
}
