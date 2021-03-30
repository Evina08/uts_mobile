import 'package:flutter/material.dart';
import 'book.dart';
import 'dbhelper.dart';

class FormBook extends StatefulWidget {
  final Book book;
  FormBook(this.book);
  @override
  FormBookState createState() => FormBookState(this.book);
}

//memberi controller untuk menerima data
class FormBookState extends State<FormBook> {
  Book book;
  FormBookState(this.book);
  TextEditingController kategoriBukuController = TextEditingController();
  TextEditingController namaBukuController = TextEditingController();
  TextEditingController penerbitBukuController = TextEditingController();
  TextEditingController penulisBukuController = TextEditingController();
  TextEditingController jumlahBukuController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //kondisi untuk memeriksa apakah data ditambahkan atau dirubah
    if (book != null) {
      kategoriBukuController.text = book.kategoriBuku;
      namaBukuController.text = book.namaBuku;
      penerbitBukuController.text = book.penerbitBuku;
      penulisBukuController.text = book.penulisBuku;
      jumlahBukuController.text = book.jumlahBuku.toString();
    }
    //membuat widget
    return Scaffold(
        appBar: AppBar(
          title: book == null ? Text('Tambah') : Text('Edit'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              // kolom form kategori buku
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: kategoriBukuController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Kategori Buku',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              // kolom form nama buku
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: namaBukuController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Buku',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              //kolom form Penerbit buku
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: penerbitBukuController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Penerbit Buku',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              //kolom form penulis buku
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: penulisBukuController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Penulis Buku',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),
              //kolom form jumlah buku
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: jumlahBukuController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Jumlah Buku',
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
                          if (book == null) {
                            // tambah data
                            book = Book(
                                kategoriBukuController.text,
                                namaBukuController.text,
                                penerbitBukuController.text,
                                penulisBukuController.text,
                                int.parse(jumlahBukuController.text));
                          } else {
                            // ubah data
                            book.kategoriBuku = kategoriBukuController.text;
                            book.namaBuku = namaBukuController.text;
                            book.penerbitBuku = penerbitBukuController.text;
                            book.penulisBuku = penulisBukuController.text;
                            book.jumlahBuku =
                                int.parse(jumlahBukuController.text);
                          }
                          // kembali ke layar sebelumnya dengan membawa objek
                          Navigator.pop(context, book);
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
