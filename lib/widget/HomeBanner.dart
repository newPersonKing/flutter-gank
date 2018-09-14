import 'package:flutter/material.dart';
import 'package:flutter_gy_gank/common/WebViewPage.dart';
import 'package:flutter_gy_gank/untils/PageRouteUtils.dart';
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';


import 'package:flutter_gy_gank/model/DailyResponse.dart';

class HomeBanner extends StatefulWidget{

  final _homeBannerHeight;

  final List<PostData> topList;

  HomeBanner( this._homeBannerHeight, this.topList) ;

  @override
  State<StatefulWidget> createState() {
    return new _HomeBannerState();
  }

}

class _HomeBannerState extends State<HomeBanner>{
  static int fakeLength=1000;
  int _curPageIndex=0;
  int _curIndicatorsIndex=0;
  /*todo ~/ 这个符号啥意思 */
  PageController _pageController=new PageController(initialPage: fakeLength ~/ 2);

  List<Widget> _indicators=[];
  List<PostData> _fakeList=[];

  Duration _bannerDuration=new Duration(seconds: 3);

  Duration _bannerAnimationDuration=new Duration(milliseconds: 500);

  Timer _timer;

  bool reverse=false;

  bool _isEndScroll=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _curPageIndex=fakeLength ~/ 2;

  }

  //通过时间timer做轮询，达到自动播放的效果
  initTimer() {
    _timer=new Timer.periodic(_bannerDuration, (timer){
      if(_isEndScroll){
        _pageController.animateToPage(_curPageIndex+1,
            duration: _bannerAnimationDuration, curve: Curves.linear);
      }
    });
  }

  //用于做banner循环
  _initFakeList(){
    for(int i=0;i<fakeLength;i++){
      _fakeList.addAll(widget.topList);
    }
  }

  _initIndicators(){
    _indicators.clear();
    for(int i=0;i<widget.topList.length;i++){
      _indicators.add(new SizedBox(
        width: 5.0,
        height: 5.0,
        child: new Container(
          color: i==_curIndicatorsIndex?Colors.white:Colors.grey,
        ),
      ));
    }
  }

  _changePage(int index){
    _curPageIndex=index;
    //获取指示器索引
    _curIndicatorsIndex=index%widget.topList.length;
    setState(() {

    });
  }
  //创建指示器
  Widget _buildIndicators(){
    _initIndicators();
    return new Align(
      alignment: Alignment.bottomCenter,
      child: new Container(
        color: Colors.black45,
        height: 20.0,
        child: new Center(
          child: new SizedBox(
            width: widget.topList.length*16.0,
            height: 5.0,
            child: new Row(
              children: _indicators,
              /*spaceEvenly 应该是均分*/
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPagerView(){
    _initFakeList();
    //检查手指和自动播放的是否冲突，如果滚动停止开启自动播放，反之停止自动播放
    return new NotificationListener(
        onNotification: (ScrollNotification scrollNotification){
          if(scrollNotification is ScrollEndNotification||
              scrollNotification is UserScrollNotification){
            _isEndScroll=true;
          }else{
            _isEndScroll=false;
          }
        },
        child: new PageView.builder(
            controller:_pageController ,
            itemBuilder: (BuildContext context,int index){
               return _buildItem(context, index);
            },
            itemCount: _fakeList.length,
            onPageChanged: (index){
              _changePage(index);
            }));
  }

  Widget _buildItem(context,index){
    PostData postData=_fakeList[index];
    return new GestureDetector(
      child: new GestureDetector(
        onTap: (){
          /*TODO 点击跳转*/
          routePagerNavigator(context, new WebViewPage(postData.toJson()));
        },
        onTapDown: (down){
          _isEndScroll=false;
        },
        onTapUp: (up){
          _isEndScroll = true;
        },
        child: new FadeInImage.memoryNetwork(
          placeholder:kTransparentImage,
          image: postData.url,
          height: widget._homeBannerHeight,
          fit: BoxFit.fitWidth,),
      ),
    );
  }

  Widget _buildBanner(){
    return new Container(
      height: widget._homeBannerHeight,
      child: new Stack(
        children: <Widget>[
          _buildPagerView(),
          _buildIndicators()
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return _buildBanner();
  }
}