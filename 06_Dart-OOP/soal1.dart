class Hewan {
  String _nama;
  double _berat;

  Hewan(this._nama, this._berat);

  double getBerat() {
    return _berat;
  }

  String getNama() {
    return _nama;
  }
}

class Mobil {
  List<Hewan> _muatan = [];
  double _kapasitas;

  Mobil(this._kapasitas);

  double getKapasitas() {
    return _kapasitas;
  }

  void tambahMuatan(Hewan hewan) {
    if (totalMuatan() + hewan.getBerat() <= _kapasitas) {
      _muatan.add(hewan);
      print('Hewan ${hewan.getNama()} ditambahkan ke dalam muatan mobil.');
    } else {
      print(
          'Kapasitas mobil tidak mencukupi untuk menambahkan hewan ${hewan.getNama()}.');
    }
  }

  double totalMuatan() {
    double totalBerat = 0;
    for (var hewan in _muatan) {
      totalBerat += hewan.getBerat();
    }
    return totalBerat;
  }
}

void main() {
  Hewan hewan1 = Hewan('Kucing', 5.5);
  print("berat ${hewan1.getNama()}= ${hewan1.getBerat()} kg");
  Hewan hewan2 = Hewan('Kerbau', 500.5);
  print("berat ${hewan2.getBerat()} = ${hewan2.getBerat()} kg");
  Hewan hewan3 = Hewan('Sapi', 500);
  print("berat ${hewan3.getBerat()} = ${hewan3.getBerat()} kg");

  Mobil mobil = Mobil(600);
  mobil.tambahMuatan(hewan1);
  mobil.tambahMuatan(hewan2);
  mobil.tambahMuatan(hewan3);

  double totalBeratMuatan = mobil.totalMuatan();
  print('Total muatan mobil: $totalBeratMuatan kg');
}
