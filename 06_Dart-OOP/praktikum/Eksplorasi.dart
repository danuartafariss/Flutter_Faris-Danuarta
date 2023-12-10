import 'dart:io';

class Buku {
  int id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);
}

class TokoBuku {
  List<Buku> daftarBuku = [];

  void tambahBuku(
      int id, String judul, String penerbit, double harga, String kategori) {
    Buku bukuBaru = Buku(id, judul, penerbit, harga, kategori);
    daftarBuku.add(bukuBaru);
    print('Buku baru berhasil ditambahkan: $judul');
  }

  List<Buku> dapatkanSemuaBuku() {
    return daftarBuku;
  }

  void hapusBuku(int id) {
    Buku? buku = daftarBuku.firstWhere((buku) => buku.id == id,
        orElse: () => Buku(0, '', '', 0.0, ''));
    if (buku.id != 0) {
      daftarBuku.remove(buku);
      print('Buku dengan ID $id berhasil dihapus.');
    } else {
      print('Buku dengan ID $id tidak ditemukan.');
    }
  }
}

void main() {
  TokoBuku tokoBuku = TokoBuku();

  bool selesai = false;
  while (!selesai) {
    int idHapusBuku = 0;
    print('\nMenu:');
    print('1. Tambah Buku Baru');
    print('2. Dapatkan Semua Buku');
    print('3. Hapus Buku');
    print('4. Selesai');

    stdout.write('Pilih opsi (1-4): ');
    String? opsi = stdin.readLineSync();

    switch (opsi) {
      case '1':
        stdout.write('Masukkan id buku: ');
        int id = int.parse(stdin.readLineSync()!);
        stdout.write('Masukkan judul buku: ');
        String judul = stdin.readLineSync()!;
        stdout.write('Masukkan penerbit buku: ');
        String penerbit = stdin.readLineSync()!;
        stdout.write('Masukkan harga buku: ');
        double harga = double.parse(stdin.readLineSync()!);
        stdout.write('Masukkan kategori buku: ');
        String kategori = stdin.readLineSync()!;

        tokoBuku.tambahBuku(id, judul, penerbit, harga, kategori);
        break;

      case '2':
        List<Buku> semuaBuku = tokoBuku.dapatkanSemuaBuku();
        print('\nDaftar Semua Buku:');
        for (Buku buku in semuaBuku) {
          print(
              'ID: ${buku.id}, Judul: ${buku.judul}, Penerbit: ${buku.penerbit}, Harga: ${buku.harga}, Kategori: ${buku.kategori}');
        }
        break;

      case '3':
        stdout.write('Masukkan ID buku yang ingin dihapus: ');
        idHapusBuku = int.parse(stdin.readLineSync()!);
        tokoBuku.hapusBuku(idHapusBuku);

        break;
      case '4':
        selesai = true;
        break;
      default:
        print('Opsi tidak valid. Silakan pilih lagi.');
    }
  }
}
