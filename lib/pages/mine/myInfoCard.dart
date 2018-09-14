import 'package:flutter/material.dart';
import 'package:flutter_gy_gank/common/GlobalConfig.dart';

Widget myInfoCard(BuildContext context){

  return new Container(
    color: GlobalConfig.cardBackgroundColor,
    margin: const EdgeInsets.only(top: 10.0,bottom: 6.0),
    padding: const EdgeInsets.only(top: 12.0,bottom: 8.0),
    child: new Column(
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0),
          decoration: new BoxDecoration(
              color: Colors.black12,
              borderRadius: new BorderRadius.all(new Radius.circular(6.0))
          ),
          child: new FlatButton(
              onPressed: (){

              },
              child: new Container(
                child: new ListTile(
                  leading: new Container(
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(
                        "https://pic1.zhimg.com/v2-ec7ed574da66e1b495fcad2cc3d71cb9_xl.jpg",
                      ),
                      radius: 20.0,
                    ),
                  ),
                  title: new Container(
                    margin: const EdgeInsets.only(bottom: 2.0),
                    child: new Text(GlobalConfig.loginTitle),
                  ),
                  subtitle: new Container(
                    margin: const EdgeInsets.only(top: 2.0),
                    child: new Text(GlobalConfig.loginSubTitle),
                  ),
                ),
              )),
        ),
        new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: (MediaQuery.of(context).size.width-6)/4,
                child: new FlatButton(
                    onPressed: (){

                    },
                    child: new Container(
                      height: 50.0,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              "85",
                              style: new TextStyle(fontSize: 16.0,color: GlobalConfig.fontColor),
                            ),
                          ),
                          new Container(
                            child: new Text(
                              GlobalConfig.flutterVersion,
                              style: new TextStyle(fontSize: 12.0,color: GlobalConfig.fontColor),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                height: 14.0,
                width: 1.0,
                decoration: new BoxDecoration(
                  border: new BorderDirectional(
                    start: new BorderSide(color: Colors.black12,width: 1.0)
                  )
                ),
              ),
              new Container(
                width: (MediaQuery.of(context).size.width-6)/4,
                child: new FlatButton(
                    onPressed: (){

                    },
                    child: new Container(
                      height: 50.0,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              "17.0",
                              style: new TextStyle(fontSize: 16.0,color: GlobalConfig.fontColor),
                            ),
                          ),
                          new Container(
                            child: new Text(
                              GlobalConfig.wxVersion,
                              style: new TextStyle(fontSize: 12.0,color: GlobalConfig.fontColor),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                height: 14.0,
                width: 1.0,
                decoration: new BoxDecoration(
                  border: new BorderDirectional(
                    start: new BorderSide(color: Colors.black12,width: 1.0)
                  )
                ),
              ),
              new Container(
                width: (MediaQuery.of(context).size.width-6)/4,
                child: new FlatButton(
                    onPressed: (){

                    },
                    child: new Container(
                      height: 50.0,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              "218",
                              style: new TextStyle(fontSize: 16.0,color: GlobalConfig.fontColor),
                            ),
                          ),
                          new Container(
                            child: new Text(
                              GlobalConfig.androidVersion,
                              style: new TextStyle(
                                fontSize: 16.0,color: GlobalConfig.fontColor
                              ),
                            ),
                          ),
                          new Container(
                            height: 14.0,
                            width: 1.0,
                            decoration: new BoxDecoration(
                              border: new BorderDirectional(
                                start: new BorderSide(color: Colors.black12,width: 1.0)
                              )
                            ),
                          ),
                          new Container(
                            width: (MediaQuery.of(context).size.width-6)/4,
                            child: new FlatButton(
                                onPressed: (){

                                },
                                child: new Container(
                                  height: 50.0,
                                  child: new Column(
                                    children: <Widget>[
                                      new Container(
                                        child: new Text(
                                          "33",
                                          style: new TextStyle(fontSize: 16.0,color: GlobalConfig.fontColor),
                                        ),
                                      ),
                                      new Container(
                                        child: new Text(
                                          GlobalConfig.iosVersion, 
                                          style: new TextStyle(fontSize: 16.0,color: GlobalConfig.fontColor),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        )
      ],
    ),
  );

}