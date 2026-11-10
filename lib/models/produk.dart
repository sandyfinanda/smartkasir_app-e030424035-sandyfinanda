// Blueprint / Struktur Data (Model) entitas produk kasir ritel SmartKasir
class Produk {
  // --- DEKLARASI VARIABEL ATRIBUT MODEL ---

  // ID produk (nullable karena di-generate otomatis oleh SQLite via AUTOINCREMENT)
  final int? id;
  // Kode unik produk / SKU / Barcode kasir
  final String kodeProduk;
  // Nama barang dagangan
  final String nama;
  // Kelompok produk: Makanan / Minuman / Snack
  final String kategori;
  // Harga beli modal / HPP
  final double hargaBeli;
  // Harga jual kasir kepada konsumen
  final double hargaJual;
  // Sisa kuantitas fisik barang di toko
  final int stok;
  // URL foto atau path lokal gambar produk
  final String gambarUrl;
  // Persentase promo diskon kasir (default 0)
  final int diskonPersen;

  // Konstruktor konstan dengan parameter wajib (required) dan opsional (default)
  const Produk({
    this.id,
    required this.kodeProduk,
    required this.nama,
    required this.kategori,
    required this.hargaBeli,
    required this.hargaJual,
    required this.stok,
    required this.gambarUrl,
    this.diskonPersen = 0,
  });

  // --- SERIALISASI (DART OBJECT -> SQLITE ROW MAP) ---
  // Mengonversi objek Produk menjadi Map<String, dynamic> untuk disimpan ke tabel SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id, // Primary key
      'kode_produk': kodeProduk, // Kode SKU produk
      'nama_produk': nama, // Nama barang
      'kategori': kategori, // Kategori produk
      'harga_beli': hargaBeli, // HPP / modal usaha
      'harga_jual': hargaJual, // Harga jual ritel
      'stok': stok, // Jumlah stok fisik
      'gambar_path': gambarUrl, // Path berkas atau URL gambar
      'diskon_persen': diskonPersen, // Diskon promo
      'created_at': DateTime.now().toIso8601String(), // Stempel waktu ISO 8601
    };
  }

  // --- DESERIALISASI (SQLITE ROW MAP -> DART OBJECT) ---
  // Membaca baris hasil kueri SELECT dan mengubahnya kembali menjadi objek Produk
  factory Produk.fromMap(Map<String, dynamic> map) {
    return Produk(
      id: map['id'] as int?,
      kodeProduk: map['kode_produk'] as String,
      nama: map['nama_produk'] as String,
      kategori: map['kategori'] as String,
      hargaBeli: (map['harga_beli'] as num).toDouble(), // Konversi aman num -> double
      hargaJual: (map['harga_jual'] as num).toDouble(), // Konversi aman num -> double
      stok: map['stok'] as int,
      gambarUrl: map['gambar_path'] as String? ?? '', // String kosong jika null
      diskonPersen: map['diskon_persen'] as int? ?? 0, // 0 jika null
    );
  }
}

// --- DATA SEEDING AWAL PRODUK BAWAAN SMARTKASIR ---
// 6 produk awal untuk mengisi database SQLite saat pertama kali dibuat
final List<Produk> produkAwalSQLite = [
  const Produk(
    kodeProduk: 'PRD-001',
    nama: 'Kopi Susu Gula Aren 250ml',
    kategori: 'Minuman',
    hargaBeli: 10000,
    hargaJual: 18000,
    stok: 24,
    gambarUrl: 'https://images.unsplash.com/photo-1541167760496-1628856ab772?w=500',
  ),
  const Produk(
    kodeProduk: 'PRD-002',
    nama: 'Roti Bakar Cokelat Keju',
    kategori: 'Makanan',
    hargaBeli: 8000,
    hargaJual: 15000,
    stok: 5,
    gambarUrl: 'https://images.unsplash.com/photo-1584776296944-ab6fb57b0bdd?w=500',
  ),
  const Produk(
    kodeProduk: 'PRD-003',
    nama: 'Matcha Latte Ice',
    kategori: 'Minuman',
    hargaBeli: 12000,
    hargaJual: 22000,
    stok: 0,
    gambarUrl: 'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=500',
  ),
  const Produk(
    kodeProduk: 'PRD-004',
    nama: 'Nasi Goreng Banjar Spesial',
    kategori: 'Makanan',
    hargaBeli: 15000,
    hargaJual: 25000,
    stok: 12,
    gambarUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500',
    diskonPersen: 10,
  ),
  const Produk(
    kodeProduk: 'PRD-005',
    nama: 'Keripik Singkong Pedas Manis',
    kategori: 'Snack',
    hargaBeli: 6000,
    hargaJual: 12000,
    stok: 30,
    gambarUrl: 'https://images.unsplash.com/photo-1566478989037-eec170784d0b?w=500',
  ),
  const Produk(
    kodeProduk: 'PRD-006',
    nama: 'Pisang Goreng Pasir Crispy',
    kategori: 'Snack',
    hargaBeli: 7000,
    hargaJual: 14000,
    stok: 8,
    gambarUrl: 'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=500',
  ),
];