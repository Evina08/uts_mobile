import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:uts_mobile/homeAnggota.dart';

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
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: RaisedButton(
            child: Text("Anggota"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () async {
              var anggota = await navigateToHomeAnggota(context, null);
            },
          ),
        ),
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
}
