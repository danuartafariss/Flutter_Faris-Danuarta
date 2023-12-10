import 'dart:async';
import 'dart:io';

Future<int> faktorial(int n) async {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    await Future.delayed(Duration(seconds: 1));
    return n * await faktorial(n - 1);
  }
}

void main() async {
  print('Masukkan bilangan :');
  int bilangan = int.parse(stdin.readLineSync()!);

  print('Mulai perhitungan faktorial...');

  final hasilFaktorial = await faktorial(bilangan);

  print('Faktorial dari $bilangan adalah: $hasilFaktorial');
}
