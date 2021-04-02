class Anggota {
  //pembuatan atribut pada table anggota
  int _idAnggota;
  String _namaAnggota;
  String _jenisAnggota;
  String _alamatAnggota;
  int _nik;
  int _umur;
  //konstruktor default
  Anggota(this._namaAnggota, this._jenisAnggota, this._alamatAnggota, this._nik,
      this._umur);
  // konstruktor konversi dari Map ke Item
  Anggota.fromMap(Map<String, dynamic> map) {
    this._idAnggota = map['idAnggota'];
    this._namaAnggota = map['namaAnggota'];
    this._jenisAnggota = map['jenisAnggota'];
    this._alamatAnggota = map['alamatAnggota'];
    this._nik = map['nik'];
    this._umur = map['umur'];
  }
  // pembuatan setter getter
  int get idAnggota => _idAnggota;
  String get namaAnggota => this._namaAnggota;
  set namaAnggota(String value) => this._namaAnggota = value;
  String get jenisAnggota => this._jenisAnggota;
  set jenisAnggota(String value) => this._jenisAnggota = value;
  String get alamatAnggota => this._alamatAnggota;
  set alamatAnggota(String value) => this._alamatAnggota = value;
  get nik => this._nik;
  set nik(value) => this._nik = value;
  get umur => this._umur;
  set umur(value) => this._umur = value;
  //memasukkan getter setter ke dalam Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idAnggota'] = this._idAnggota;
    map['namaAnggota'] = namaAnggota;
    map['jenisAnggota'] = jenisAnggota;
    map['alamatAnggota'] = alamatAnggota;
    map['nik'] = nik;
    map['umur'] = umur;
    return map;
  }
}
