import 'dart:io';

class Kalkulator {
  double tambah(double a, double b) => a + b;

  double kurang(double a, double b) => a - b;

  double kali(double a, double b) => a * b;

  double bagi(double a, double b) =>
      b != 0 ? a / b : throw ArgumentError('Denominator tidak boleh nol.');
}

void main() {
  Kalkulator kalkulator = Kalkulator();

  stdout.write('Masukkan angka pertama: ');
  double angka1 = double.parse(stdin.readLineSync()!);

  stdout.write('Masukkan angka kedua: ');
  double angka2 = double.parse(stdin.readLineSync()!);

  print('Penjumlahan: ${kalkulator.tambah(angka1, angka2)}');
  print('Pengurangan: ${kalkulator.kurang(angka1, angka2)}');
  print('Perkalian: ${kalkulator.kali(angka1, angka2)}');

  try {
    print('Pembagian: ${kalkulator.bagi(angka1, angka2)}');
  } catch (e) {
    print('Error: $e');
  }
}
