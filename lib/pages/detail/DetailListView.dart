import 'package:flutter/material.dart';
import 'package:flutter_gy_gank/common/Constant.dart';

Widget buildListViewBuilder(context, List results, ScrollController _controller){

  print("cccccccccccccc==length"+results.length.toString());
  switch(results.length){
    case 1:
      return new Center(
        child: new Card(
          elevation: 16.0,
          child: new Text("暂无数据"),
        ),
      );
    default:
      return new ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(2.0),
          controller: _controller,
          itemCount: results==null ? 0 :results.length,
          itemBuilder: (context,i){
            print("cccccccccccccc==itemBuilder");
           return  buildRow(context, results[i], false);
          });
  }
}