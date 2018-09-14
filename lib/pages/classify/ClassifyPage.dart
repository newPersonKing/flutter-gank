import 'package:flutter/material.dart';
import 'package:flutter_gy_gank/pages/classify/ClassifyTabPage.dart';

class ClassifyPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ClassifyPageState();
  }
}

class _ClassifyPageState extends State<ClassifyPage> with SingleTickerProviderStateMixin{

  TabController _controller;
  ClassifyTabPage  classifyTabPage;
  List<ClassifyTabPage> classifyTab;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    classifyTabPage = new ClassifyTabPage();
    classifyTab=classifyTabPage.initClassify();
    _controller =new TabController(length: classifyTab.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return new Scaffold(
      appBar: new AppBar(
        title: new TabBar(
            controller: _controller,
            indicatorColor: Theme.of(context).primaryColor,
            isScrollable: true,
            tabs: classifyTab.map((ClassifyTabPage page){
              return new Tab(text: page.text);
            }).toList()),
      ),
      body: new TabBarView(
          controller: _controller,
          children: classifyTab.map((ClassifyTabPage page){
            return page.detailPage;
          }).toList()),
    );
  }
}