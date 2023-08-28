void main() {
  print("Faktor dari 10 adalah :");
  Faktorial(10);
  print(" ");

  print("Faktor dari 40 adalah :");
  Faktorial(40);
  print(" ");

  print("Faktor dari 50 adalah :");
  Faktorial(50);
  print(" ");
}

void Faktorial(int n) {
  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      print(i);
    }
  }
}
