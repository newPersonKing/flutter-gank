import 'package:flutter/material.dart';
import 'package:flutter_gy_gank/common/GlobalConfig.dart';
import 'package:flutter_gy_gank/pages/classify/ClassifyPage.dart';
import 'package:flutter_gy_gank/pages/home/HomePage.dart';
import 'package:flutter_gy_gank/pages/index/IndexDrawPage.dart';
import 'package:flutter_gy_gank/pages/mine/MinePage.dart';

class ApplicationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new __ApplicationPageState();
  }
}


/*SingleTickerProviderStateMixin TickerProvider 的子类 用于初始化 AnimationController 的时候使用*/
class __ApplicationPageState extends State<ApplicationPage> with SingleTickerProviderStateMixin{

  int page=0;
  String title=GlobalConfig.homeTab;
  PageController pageController;

//定义底部导航项目

  final List<BottomNavigationBarItem> _bottomTabs=<BottomNavigationBarItem>[
    new BottomNavigationBarItem(
        icon : Icon(Icons.home) ,
        title: Text(GlobalConfig.homeTab)),
    new BottomNavigationBarItem(
        icon: Icon(Icons.tune),
        title: Text(GlobalConfig.classyTab)),
    new BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text(GlobalConfig.mineTab))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text(this.title),
        ),
        drawer: new Drawer(
          child: new IndexDrawPage(
            email: GlobalConfig.email,
            name: GlobalConfig.authorNice,
            profileimg: "images/profile_2.jpg",
            background: "images/bg_2.jpg",
          ),
        ),
        body: new PageView(
          /*NeverScrollableScrollPhysics 禁用滚动属性*/
          physics: new NeverScrollableScrollPhysics(),
          children: <Widget>[HomePage(),ClassifyPage(),MinePage()],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: _bottomTabs,
          currentIndex: page,
          fixedColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
           onTap: onTap,),
      ),
    );
  }

  void onTap(int index){
    pageController.animateToPage(index, duration: new Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page){
    setState(() {
      this.page = page;
      switch (page) {
        case 0:
          title = GlobalConfig.homeTab;
          break;
        case 1:
          title = GlobalConfig.classyTab;
          break;
        case 2:
          title = GlobalConfig.mineTab;
          break;
      }
    });
  }
}
