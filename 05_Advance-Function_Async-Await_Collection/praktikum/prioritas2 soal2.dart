void main() {
  List<double> listNilai = [10, 8, 7, 6, 12, 15];
  double hasil = 0;
  for (double nilai in listNilai) {
    hasil += nilai;
  }
  double hasilPembagian = hasil / listNilai.length;
  int hasilPembulatan = hasilPembagian.ceil();
  print(hasilPembagian);
  print('hasilnya adalah : $hasilPembulatan');
}
