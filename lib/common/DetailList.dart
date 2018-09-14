import 'package:flutter/material.dart';
import 'package:flutter_gy_gank/common/WebViewPage.dart';
import 'package:flutter_gy_gank/model/DailyResponse.dart';
import 'package:flutter_gy_gank/untils/PageRouteUtils.dart';
import 'package:flutter_gy_gank/untils/TimeUtils.dart';

/*主页 列表item*/
Widget buildDetailListRow(context,PostData postData){

  return new InkWell(
    onTap: (){
      /*todo 点击跳转*/
      routePagerNavigator(context, WebViewPage(postData.toJson()));
    },
    child: new Card(
      margin: new EdgeInsets.all(2.0),
      child: new Padding(
        padding:new EdgeInsets.all(2.0),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 4.0),
                  child: new Align(
                    alignment: Alignment.centerLeft,
                    child: new Icon(
                      Icons.access_time,
                      size: 12.0,
                      color: Colors.blue,),
                  ),
                ),
                new Text(
                  postData.publishedAt.toString(),
                  style: new TextStyle(fontSize: 12.0,color: Colors.grey),
                ),
                /*Expanded 会填充剩余的空间*/
                new Expanded(
                  child: new Align(
                    alignment: Alignment.centerRight,
                    child: new Text(getTimestampString(DateTime.parse(postData.publishedAt)),
                    style: new TextStyle(fontSize: 12.0,color: Colors.grey),),
                  ),),
              ],
            ),
            new Container(
              margin: new EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 4.0),
              child: new Align(
                alignment: Alignment.centerLeft,
                child: new Text(
                  postData.desc,
                  style: new TextStyle(fontSize: 16.0,color: Colors.black),),
              ),
            ),
            new Row(
              children: <Widget>[
                new Text(
                  "作者:",
                  style: new TextStyle(fontSize: 12.0,color: Colors.grey),
                ),
                new Text(postData.who.toString(),
                style:new TextStyle(fontSize: 12.0,color: Colors.blue)),
                new Expanded(
                    child: new Align(
                      alignment: Alignment.centerRight,
                      child: new Text(
                        postData.source.toString(),
                        style: new TextStyle(fontSize: 12.0,color: Colors.grey),
                      ),
                    ))
              ],
            )
          ],
        ),),
    ),
  );

}