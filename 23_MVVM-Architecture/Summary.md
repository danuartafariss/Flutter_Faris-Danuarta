1. MVVM adalah arsitekturyang memisahkan logic Model dari tampilan (View) ke dalam ViewModel. keuntungan dalam menggunakan mVVM adalah bisa digunakan berulang kali, mudah dirawat, dan meningkatkan produktivitas pengujian.

2. Model: Representasi dari data dan logika bisnis aplikasi. ViewModel: Bertindak sebagai perantara antara Model dan View, menangani logika presentasi dan state.

3. Struktur Direktori MVVM:
- model/: Direktori untuk menyimpan kelas Model.
- model_api/: Direktori untuk menyimpan kelas yang berhubungan dengan akses data dari API.
- view/: Direktori untuk menyimpan tampilan (widget Flutter).
- viewmodel/: Direktori untuk menyimpan kelas-kelas ViewModel.
