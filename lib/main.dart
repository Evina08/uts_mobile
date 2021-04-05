//kode utama Aplikasi tampilan awal
import 'package:flutter/material.dart';
import 'package:uts_mobile/homeAnggota.dart';
import 'package:uts_mobile/homeBook.dart';
//package letak folder Anda

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Item',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Admin Perpustakaan"),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: new Icon(
                      Icons.book,
                    ),
                    text: "Buku",
                  ),
                  Tab(
                    icon: new Icon(
                      Icons.people,
                    ),
                    text: "Anggota",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                HomeBook(HomeBook),
                HomeAnggota(HomeAnggota),
              ],
            )),
      ),
    );
  }
}
