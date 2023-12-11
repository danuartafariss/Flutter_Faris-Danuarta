class Matematika {
  int hasil(Hitung k) {
    return k.x * k.y;
  }
}

class Hitung {
  int x;
  int y;

  Hitung(this.x, this.y);
}

class KPK extends Hitung {
  KPK(int x, int y) : super(x, y);

  int cariKPK() {
    return (x * y) ~/ cariFPB();
  }

  int cariFPB() {
    int a = x;
    int b = y;
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }
}

void main() {
  KPK kpkCalculator = KPK(4, 6);

  int kpk = kpkCalculator.cariKPK();

  print('KPK dari ${kpkCalculator.x} dan ${kpkCalculator.y}: $kpk');

  Matematika matematika = Matematika();

  Hitung hitung = Hitung(4, 6);

  int hasilPerkalian = matematika.hasil(hitung);

  print('Hasil perkalian dari ${hitung.x} dan ${hitung.y}: $hasilPerkalian');
}
