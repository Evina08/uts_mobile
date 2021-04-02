import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dbhelper.dart';
import 'formBook.dart';
import 'book.dart';

class HomeBook extends StatefulWidget {
  HomeBook(HomeBook);

  @override
  HomeBookState createState() => HomeBookState();
}

class HomeBookState extends State<HomeBook> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Book> bookList;
  @override
  Widget build(BuildContext context) {
    updateListView();

    if (bookList == null) {
      bookList = List<Book>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('DAFTAR BUKU'),
      ),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text("Tambah Buku"),
              color: Colors.deepOrange[400],
                textColor: Colors.white,
              onPressed: () async {
                var book = await navigateToEntryForm(context, null);
                if (book != null) {
                  //TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelper.insertBook(book);
                  if (result > 0) {
                    updateListView();
                  }
                }
              },
            ),
          ),
        ),
      ]),
    );
  }

  Future<Book> navigateToEntryForm(BuildContext context, Book book) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return FormBook(book);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.ad_units),
            ),
            title: Text(
              this.bookList[index].namaBuku,
              style: textStyle,
            ),
            subtitle: Text("Jumlah: " +
                this.bookList[index].jumlahBuku.toString() +
                "  Penulis: " +
                this.bookList[index].penulisBuku),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                dbHelper.deleteBook(this.bookList[index].idBuku);
                updateListView();
              },
            ),
            onTap: () async {
              var book =
                  await navigateToEntryForm(context, this.bookList[index]);
              //TODO 4 Panggil Fungsi untuk Edit data
              if (book != null) {
                int result = await dbHelper.updateBook(book);
                if (result > 0) {
                  updateListView();
                }
              }
            },
          ),
        );
      },
    );
  }

  //update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Book>> bookListFuture = dbHelper.getBookList();
      bookListFuture.then((bookList) {
        setState(() {
          this.bookList = bookList;
          this.count = bookList.length;
        });
      });
    });
  }
}
