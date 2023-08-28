import 'dart:io';

void main() {
  print("Masukkan nilai");
  int a = int.parse(stdin.readLineSync()!);

  if (a > 70) {
    print("Nilai A");
  } else if (a > 40) {
    print("Nilai B");
  } else if (a > 0) {
    print("Nilai C");
  } else {
    print("error");
  }

  for (int i = 0; i < 11; i++) {
    print(i);
  }
}
