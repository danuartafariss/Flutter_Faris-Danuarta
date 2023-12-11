1. Penyimpanan lokal diperlukan agar efesiensi dalam penggunaan data internet, dapat diimplementasikan dengan menggunakan Shared Preferences dan Local Database. 

2. Shared Prefrences menyimpan data yang sederhana dengan format key-value. contohnya, menyimpan data login dan history. Local Database menyimpan dan meminta data yang besar pada local device secara privat.

3. Terdapat Method dispose() yg merupakan turunan dari statefullwidget, untuk menghindari kebocoran memori. Menggunakan void dispose() {(nama properti).dispose(); }. Digunakan untuk data yang berjalan. 