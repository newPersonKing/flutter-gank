import 'package:flutter/material.dart';
import 'package:flutter_gy_gank/pages/ApplicationPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter 干货集中营',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new ApplicationPage(),
    );
  }
}
