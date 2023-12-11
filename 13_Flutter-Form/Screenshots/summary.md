1. Form berfungsi sebagai menerima isian data oleh pengguna dan isian data lebih dari satu, form menggunakan statefulwidget state form dapat disimpan menggunakan GlobalKey<FormState>.

2. Input
    ada beberapa tipe input pada flutter form, yaitu TextField, Radio, CheckBox, dan DropdownButton.
    TextField : menerima isian data(Text) dari pengguna dan isian data lebih dari satu 
    Radio : memberi opsi pada pengguna yang hanya boleh memilih 1 opsi, data diambil menggunakan property dengan tipe data yang sesuai dengan value pada radio
    CheckBox : sama seperti radio tetapi pengguna bisa memilih lebih dari 1 opsi, data diambil menggunakan property bertipe bool
    DropdownButton : memberi opsi yang hanya ditampilkan jika ditekan dan pengguna hanya dapat memilih 1.

3. Button bersifat seperti tombol yaitu di tekan, pada button terdapat elevatedbutton, yaitu tombol yang timbul dengan aksi jika ditekan makan akan menjalankan onPressed. Icon Button tombol yang hanya menampilkan icon yang ditekan akan menjalankan onPressed
