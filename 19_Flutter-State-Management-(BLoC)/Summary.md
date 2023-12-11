1. Flutter memiliki sifat declarative yang artinya flutter membangun UI nya pada screen untuk mencerminkan keadaan state saat ini. terdapat 2 macam state yaitu Ephemeral State dan App State. Ephemeral State digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses widget lainnya. App State digunakan bagian lain app butuh akses ke data state widget

2. Pendekatan State Management terdapat 3 bagian yaitu
    setState : Lebih cocok penggunaan nya pada Ephemeral state
    Provider : penggunaan untuk state management yang kompleks seperti app state
    BloC : mengunakan pola stream/observable untuk memisahkan UI dengan bisnis logicnya

3. BloC memisahkan UI dengan bisnis logicnya, Bloc menerima event sebagai input lalu dianalisa dan di kelola dalam BLoc dan menghasilkan state sebagai output. 