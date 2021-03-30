import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:uts_mobile/homeAnggota.dart';
import 'package:uts_mobile/homeBook.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Admin Perpustakaan'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 80,
              height: 80,
              child: RaisedButton(
                child: Text("Anggota"),
                color: Colors.deepOrange[400],
                textColor: Colors.white,
                onPressed: () async {
                  var anggota = await navigateToHomeAnggota(context, null);
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 80,
              height: 80,
              child: RaisedButton(
                child: Text("Buku"),
                color: Colors.deepOrange[400],
                textColor: Colors.white,
                onPressed: () async {
                  var anggota = await navigateToHomeBuku(context, null);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<HomeAnggota> navigateToHomeAnggota(
      BuildContext context, HomeAnggota anggota) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return HomeAnggota(anggota);
    }));
    return result;
  }

  Future<HomeBook> navigateToHomeBuku(
      BuildContext context, HomeBook book) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return HomeBook(book);
    }));
    return result;
  }
}
