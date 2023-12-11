1. State yang hanya dimiliki oleh StatefulWidget merupakan data yang dapat dibaca pada saat pembuatan widget dan dapat berubah saat widget sedang aktif untuk mengubah state kita bisa menggunakan method setState.

2. State management terdapat dua state yaitu local state dan global state. local state  merubah kondisi lokal artinya data yang berubah tidak bisa di akses oleh kelas lain. sedangkan global state merubah seluruh data. untuk mengimplementasikannya kita menggunakan method set state yang dimana setState berfungsi untuk merefresh widget untuk menggunakan data yang terbaru.

3. Provider diperlukan untuk melakukan state management oleh karena itu kita perlu menginstal package provider