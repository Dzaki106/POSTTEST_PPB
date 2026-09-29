class Product {
  final String nama;
  final String ukuran;
  final String merek;
  final String harga;
  final String gambar;

  const Product({
    required this.nama,
    required this.ukuran,
    required this.merek,
    required this.harga,
    required this.gambar,
  });
}

const List<Product> daftarProduk = [
  Product(
    nama: 'RX-78-2 Gundam',
    ukuran: '1/144 (HG)',
    merek: 'Bandai',
    harga: 'Rp185.000',
    gambar: 'assets/gundam.png',
  ),
  Product(
    nama: 'Strike Freedom',
    ukuran: '1/100 (MG)',
    merek: 'Bandai',
    harga: 'Rp850.000',
    gambar: 'assets/gundam.png',
  ),
  Product(
    nama: 'Zaku II Char',
    ukuran: '1/144 (HG)',
    merek: 'Bandai',
    harga: 'Rp210.000',
    gambar: 'assets/gundam.png',
  ),
  Product(
    nama: 'Tiger I Ausf. E',
    ukuran: '1/35',
    merek: 'Tamiya',
    harga: 'Rp520.000',
    gambar: 'assets/gundam.png',
  ),
  Product(
    nama: 'F-14A Tomcat',
    ukuran: '1/48',
    merek: 'Hasegawa',
    harga: 'Rp650.000',
    gambar: 'assets/gundam.png',
  ),
  Product(
    nama: 'Yamato',
    ukuran: '1/700',
    merek: 'Aoshima',
    harga: 'Rp430.000',
    gambar: 'assets/gundam.png',
  ),
];