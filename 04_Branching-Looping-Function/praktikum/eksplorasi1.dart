import 'dart:io';

void main() {
  stdout.write('Masukkan sebuah bilangan: ');
  int a = int.parse(stdin.readLineSync()!);

  if (a <= 1) {
    print('$a bukan bilangan prima.');
    return;
  }

  bool flag = true;

  for (int i = 2; i <= a / 2; i++) {
    if (a % i == 0) {
      flag = false;
      break;
    }
  }

  if (flag) {
    print('$a adalah bilangan prima.');
  } else {
    print('$a bukan bilangan prima.');
  }
}
