import 'dart:io';

class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  void tambahCourse(Course course) {
    daftarCourse.add(course);
    print('$nama menambahkan course: ${course.judul}');
  }

  void hapusCourse(Course course) {
    daftarCourse.remove(course);
    print('$nama menghapus course: ${course.judul}');
  }

  void lihatDaftarCourse() {
    if (daftarCourse.isEmpty) {
      print('$nama belum menambahkan course.');
    } else {
      print('$nama memiliki course berikut:');
      for (Course course in daftarCourse) {
        print('- ${course.judul}: ${course.deskripsi}');
      }
    }
  }
}

void main() {
  Course course1 = Course('Matematika', 'Pelajaran tentang matematika');
  Course course2 = Course('Bahasa Inggris', 'Pelajaran tentang bahasa Inggris');
  Student student1 = Student('Faris Danuarta', 'Kelas C');
  student1.lihatDaftarCourse();

  bool selesai = false;

  while (!selesai) {
    print('\nMenu:');
    print('1. Tambah Course');
    print('2. Hapus Course');
    print('3. Lihat Daftar Course');
    print('4. Selesai');

    stdout.write('Pilih opsi (1-4): ');
    String? opsi = stdin.readLineSync();

    switch (opsi) {
      case '1':
        print('\n');
        print('1. Tambah Course Matematika');
        print('2. Tambah Course Bahasa Inggris');
        int pilihTambahCourse = int.parse(stdin.readLineSync()!);
        if (pilihTambahCourse == 1) {
          student1.tambahCourse(course1);
        } else if (pilihTambahCourse == 2) {
          student1.tambahCourse(course2);
        } else {
          print('input error');
        }
        break;
      case '2':
        print('\n');
        print('1. Hapus Course Matematika');
        print('2. Hapus Course Bahasa Inggris');
        int pilihHapusCourse = int.parse(stdin.readLineSync()!);
        if (pilihHapusCourse == 1) {
          student1.hapusCourse(course1);
        } else if (pilihHapusCourse == 2) {
          student1.hapusCourse(course2);
        } else {
          print('input error');
        }
        break;
      case '3':
        student1.lihatDaftarCourse();
        break;
      case '4':
        selesai = true;
        break;
      default:
        print('Opsi tidak valid. Silakan pilih lagi.');
    }
  }
}
