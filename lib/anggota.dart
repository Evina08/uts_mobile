class Anggota {
  //pembuatan atribut pada table anggota
  int _idAnggota;
  String _namaAnggota;
  String _jenisAnggota;
  String _alamatAnggota;
  int _nik;
  //konstruktor default
  Anggota(this._idAnggota, this._namaAnggota, this._jenisAnggota,
      this._alamatAnggota, this._nik);
  // konstruktor konversi dari Map ke Item
  Anggota.fromMap(Map<String, dynamic> map) {
    this._idAnggota = map['idAnggota'];
    this._namaAnggota = map['namaAnggota'];
    this._jenisAnggota = map['jenisAnggota'];
    this._alamatAnggota = map['alamatAnggota'];
    this._nik = map['nik'];
  }
}
