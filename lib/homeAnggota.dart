import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dbhelper.dart';
import 'formAnggota.dart';
import 'anggota.dart';

class HomeAnggota extends StatefulWidget {
  HomeAnggota(HomeAnggota anggota);

  @override
  HomeAnggotaState createState() => HomeAnggotaState();
}

class HomeAnggotaState extends State<HomeAnggota> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Anggota> anggotaList;
  @override
  Widget build(BuildContext context) {
    updateListView();

    if (anggotaList == null) {
      anggotaList = List<Anggota>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('DAFTAR ANGGOTA'),
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
              child: Text("Tambah Anggota"),
              onPressed: () async {
                var anggota = await navigateToEntryForm(context, null);
                if (anggota != null) {
                  //TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelper.insert2(anggota);
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

  Future<Anggota> navigateToEntryForm(
      BuildContext context, Anggota anggota) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return AnggotaForm(anggota);
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
              child: Icon(Icons.people),
            ),
            title: Text(
              this.anggotaList[index].namaAnggota,
              style: textStyle,
            ),
            subtitle: Text("Member : " + this.anggotaList[index].jenisAnggota),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                dbHelper.delete2(this.anggotaList[index].idAnggota);
                updateListView();
              },
            ),
            onTap: () async {
              var anggota =
                  await navigateToEntryForm(context, this.anggotaList[index]);
              //TODO 4 Panggil Fungsi untuk Edit data
              if (anggota != null) {
                int result = await dbHelper.update2(anggota);
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
      Future<List<Anggota>> anggotaListFuture = dbHelper.getAnggotaList();
      anggotaListFuture.then((anggotaList) {
        setState(() {
          this.anggotaList = anggotaList;
          this.count = anggotaList.length;
        });
      });
    });
  }
}
