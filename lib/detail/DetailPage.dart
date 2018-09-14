import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gy_gank/api/Api.dart';
import 'package:flutter_gy_gank/api/http.dart';
import 'package:flutter_gy_gank/common/Constant.dart';
import 'package:flutter_gy_gank/model/DailyResponse.dart';
import 'dart:convert';

import 'package:flutter_gy_gank/pages/detail/DetailListView.dart';
class DetailPage extends StatefulWidget{

  String feedType;
  bool showTitle=false;

  DetailPage({Key key, this.feedType, this.showTitle}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage>{

  var listData;
  var curPage = 1;
  var listTotalSize = 0;
  var requestError = false;
  /*控制刷新的controller*/
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsList(false);
  }

  @override
  Widget build(BuildContext context) {

    if(widget.showTitle){
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.feedType),
        ) ,
        body: DetailBuild(context),
      );
    }else{
      return new Scaffold(
        body: DetailBuild(context),
      ) ;
    }

  }

  Widget DetailBuild(BuildContext contex){
    return requestError
        ? buildExceptionIndicator("网络请求出错了！")
        :listData==null
        ?new Center(
      child: new CupertinoActivityIndicator()):
        new RefreshIndicator(
            child: buildListViewBuilder(contex,listData,_controller),
            onRefresh: _pullToRefresh);
  }

  getNewsList(bool isLoadMore){
    var url = Api.FEED_URL;
    url += widget.feedType + '/10/' + this.curPage.toString();

    HttpExt.get(url, (data){

      requestError=false;
      if(data!=null){
        CategoryResponse categoryResponse =CategoryResponse.fromJson(jsonDecode(data));

        if(!categoryResponse.error){
          var _listData=categoryResponse.results;
          if(_listData.length>0){
            setState(() {
              if(!isLoadMore){
                listData=_listData;
              }else{
                /*flutter 的刷新问题 所有的数据都得放到心得list中不然不会刷新*/
                List list=new List();
                list.addAll(listData);
                list.addAll(_listData);
                listData=list;
              }
            });
          }
        }
      }

    }, (exception){
      requestError = true;
    });
  }

  Future<Null> _pullToRefresh() async{
   curPage=1;
   getNewsList(false);
   return null;
  }

  //加载更多
  _DetailPageState(){
    _controller.addListener((){
      var maxScroll=_controller.position.maxScrollExtent;
      var pixels=_controller.position.pixels;
      if(maxScroll==pixels){
        curPage++;
        getNewsList(true);
      }
    });
  }
}


