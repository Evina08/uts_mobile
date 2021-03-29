import 'package:flutter/material.dart';
import 'book.dart';

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
      jumlahBukuController.text = book.jumlahBuku;
    }
  }
}
