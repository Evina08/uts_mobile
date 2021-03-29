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
      this._penulisBuku, this._jumlahBuku);
  // konstruktor konversi dari Map ke Item
  Book.fromMap(Map<String, dynamic> map) {
    this._idBuku = map['idBuku'];
    this._kategoriBuku = map['nkategoriBuku'];
    this._namaBuku = map['namaBuku'];
    this._penerbitBuku = map['penerbitBuku'];
    this._penulisBuku = map['penulisBuku'];
    this._jumlahBuku = map['jumlahBuku'];
  }
  // pembuatan setter getter
  int get idBuku => _idBuku;
  String get kategoriBuku => this._kategoriBuku;
  set kategoriBuku(String value) => this._namaBuku = value;
  String get namaBuku => this._namaBuku;
  set namaBuku(String value) => this._namaBuku = value;
  String get penerbitBuku => this._penerbitBuku;
  set penerbitBuku(String value) => this._penerbitBuku = value;
  String get penulisBuku => this._penulisBuku;
  set penulisBuku(String value) => this._penulisBuku = value;
  get jumlahBuku => this._jumlahBuku;
  set jumlahBuku(value) => this._jumlahBuku = value;
  //memasukkan getter setter ke dalam Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idBuku'] = this._idBuku;
    map['kategoriBuku'] = kategoriBuku;
    map['namaBuku'] = namaBuku;
    map['penerbitBuku'] = penerbitBuku;
    map['penulisBuku'] = penulisBuku;
    map['jumlahBuku'] = jumlahBuku;
    return map;
  }
}
