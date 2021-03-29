class Book {
  //pembuatan atribut pada table book
  int _idBuku;
  String _kategoriBuku;
  String _namaBuku;
  String _penerbitBuku;
  String _penulisBuku;
  int _jumlahBuku;
  //konstruktor default
  Book(this._idBuku, this._kategoriBuku, this._namaBuku, this._penerbitBuku,
      this._penulisBuku);
  // konstruktor konversi dari Map ke Item
  Book.fromMap(Map<String, dynamic> map) {
    this._idBuku = map['idBuku'];
    this._kategoriBuku = map['nkategoriBuku'];
    this._namaBuku = map['namaBuku'];
    this._penerbitBuku = map['penerbitBuku'];
    this._penulisBuku = map['penulisBuku'];
    this._jumlahBuku = map['jumlahBuku'];
  }
}
