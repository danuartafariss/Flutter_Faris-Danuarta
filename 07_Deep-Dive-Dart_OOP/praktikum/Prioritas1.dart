class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  BangunRuang(this.lebar, this.panjang, this.tinggi);

  volume() {}
}

class Kubus extends BangunRuang {
  double sisi;

  Kubus(this.sisi) : super(0.0, 0.0, 0.0);

  @override
  volume() {
    double volumeKubus = 6 * sisi * sisi;
    return volumeKubus;
  }
}

class Balok extends BangunRuang {
  Balok(super.lebar, super.panjang, super.tinggi);
  volume() {
    double volumeBalok = panjang * lebar * tinggi;
    return volumeBalok;
  }
}

void main() {
  Kubus kubus1 = Kubus(5);
  print(kubus1.volume());

  Balok balok1 = Balok(2, 8, 4);
  print(balok1.volume());
}
