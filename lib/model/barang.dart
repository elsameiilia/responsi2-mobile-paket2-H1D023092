class Barang {
  String? id;
  String? nama;
  var harga;
  var jumlah;
  String? tanggal_masuk;
  String? tanggal_kadaluarsa;
  Barang({
    this.id,
    this.nama,
    this.harga,
    this.jumlah,
    this.tanggal_masuk,
    this.tanggal_kadaluarsa,
  });
  factory Barang.fromJson(Map<String, dynamic> obj) {
    return Barang(
      id: obj['id'],
      nama: obj['nama'],
      harga: obj['harga'],
      jumlah: obj['jumlah'],
      tanggal_masuk: obj['tanggal_masuk'],
      tanggal_kadaluarsa: obj['tanggal_kadaluarsa'],
    ); 
  }
}