void main() async {
  List<int> listAngka = [10, 8, 7, 6, 12, 15];
  int pengali = 2;

  List<int> hasil = await hasilPengkalian(listAngka, pengali);
  print(hasil);
}

Future<List<int>> hasilPengkalian(List<int> nilai, int pengali) async {
  List<int> hasil = [];

  await Future.forEach(nilai, (int angka) async {
    await Future.delayed(Duration(seconds: 1));
    hasil.add(angka * pengali);
  });

  return hasil;
}
