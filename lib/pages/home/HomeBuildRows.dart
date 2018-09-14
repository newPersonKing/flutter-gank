
import 'package:flutter/material.dart';
import 'package:flutter_gy_gank/model/DailyResponse.dart';
import 'package:flutter_gy_gank/widget/HomeBanner.dart';
/*postData 传递过来的每一行的module*/
Widget HomeBuildRows(context, postData){
  List<PostData> _topDatas = new List<PostData>();
  _topDatas.add(new PostData(
      "",
      "",
      "",
      null,
      "",
      "",
      "",
      "https://ws1.sinaimg.cn/large/0065oQSqly1fubd0blrbuj30ia0qp0yi.jpg",
      null,
      ""));
  _topDatas.add(new PostData(
      "",
      "",
      "",
      null,
      "",
      "",
      "",
      "https://ww1.sinaimg.cn/large/0065oQSqgy1fu39hosiwoj30j60qyq96.jpg",
      null,
      ""));
  _topDatas.add(new PostData(
      "",
      "",
      "",
      null,
      "",
      "",
      "",
      "https://ww1.sinaimg.cn/large/0065oQSqly1ftzsj15hgvj30sg15hkbw.jpg",
      null,
      ""));
  _topDatas.add(new PostData(
      "",
      "",
      "",
      null,
      "",
      "",
      "",
      "https://ww1.sinaimg.cn/large/0065oQSqly1ftu6gl83ewj30k80tites.jpg",
      null,
      ""));
  _topDatas.insert(0, postData);

  return new HomeBanner(200.0,_topDatas);
}