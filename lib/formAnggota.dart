import 'package:flutter/material.dart';
import 'anggota.dart';

class AnggotaForm extends StatefulWidget {
  final Anggota anggota;
  AnggotaForm(this.anggota);
  @override
  AnggotaFormState createState() => AnggotaFormState(this.anggota);
}

//class controller
class AnggotaFormState extends State<AnggotaForm> {
  Anggota anggota;
  AnggotaFormState(this.anggota);
  TextEditingController namaAnggotaController = TextEditingController();
  TextEditingController jenisAnggotaController = TextEditingController();
  TextEditingController alamatAnggotaController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //kondisi
    if (anggota != null) {
      namaAnggotaController.text = anggota.namaAnggota;
      jenisAnggotaController.text = anggota.jenisAnggota;
      alamatAnggotaController.text = anggota.alamatAnggota;
      nikController.text = anggota.nik.toString();
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          title: anggota == null ? Text('Tambah') : Text('Edit'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: namaAnggotaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Anggota',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // harga
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: jenisAnggotaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Jenis Anggota',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              //stok
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: alamatAnggotaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Alamat Anggota',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: nikController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'NIK ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          // if (anggota == null) {
                          // tambah data
                          // anggota = Anggota(
                          //     namaAnggotaController.text,
                          //    jenisAnggotaController.text,
                          //     alamatAnggotaController.text,
                          //     int.parse(nikController.text));
                          // } else {
                          // ubah data
                          anggota.namaAnggota = namaAnggotaController.text;
                          anggota.jenisAnggota = jenisAnggotaController.text;
                          anggota.alamatAnggota = alamatAnggotaController.text;
                          anggota.nik = int.parse(nikController.text);
                          //}
                          // kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, anggota);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
