import 'package:flutter/material.dart';
import 'package:flutter_gy_gank/common/WebViewPage.dart';
import 'package:flutter_gy_gank/model/DailyResponse.dart';
import 'package:flutter_gy_gank/untils/PageRouteUtils.dart';

Widget BuildWelfareRows(context,PostData postData){

  final ThemeData themeData= Theme.of(context);
  final TextStyle titleStyle=
  themeData.textTheme.headline.copyWith(color: Colors.white);
  /*水波纹效果*/
  return new InkWell(
    onTap: (){
      /*todo 点击事件*/
      routePagerNavigator(context, new WebViewPage(postData.toJson()));
    },
    child: new Card(
      margin: const EdgeInsets.all(2.0),
      child: new Padding(
        padding: new EdgeInsets.all(2.0),
        child: new SizedBox(
          height: 300.0,
          child: new Stack(
            children: <Widget>[
              new Positioned.fill(
                  child: new FadeInImage.assetNetwork(
                    placeholder:  'images/empty_data.png',
                    image: postData.url,
                    fit: BoxFit.cover,
                    repeat: ImageRepeat.repeat,)),
              new Positioned(
                  bottom: 6.0,
                  left: 6.0,
                  right: 6.0,
                  child: new FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.bottomLeft,
                    child: new Text(
                      postData.desc,
                      style: titleStyle,
                    ),
                  ))
            ],
          ),
        ),),
    ),
  );
}