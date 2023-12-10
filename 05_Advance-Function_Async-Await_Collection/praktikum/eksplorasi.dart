void main() {
  List<String> dataAwal = [
    'kucing',
    'udang',
    'sapi',
    'udang',
    'ayam',
    'kucing',
    'ayam',
    'kucing',
  ];

  Set<String> dataSet = Set<String>.from(dataAwal);

  List<String> dataUnik = dataSet.toList();

  print('Data Awal: $dataAwal');
  print('Data Unik: $dataUnik');

  for (String elemen in dataSet) {
    int frekuensi = dataAwal.where((nilai) => nilai == elemen).length;
    print('$elemen: $frekuensi kali');
  }
}
