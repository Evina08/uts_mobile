import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dbhelper.dart';
import 'formBook.dart';
import 'book.dart';

class HomeBook extends StatefulWidget {
  @override
  HomeBookState createState() => HomeBookState();
}
class HomeBookState extends State<HomeBook> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Book> bookList;
  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
      updateListView();
    }
  }