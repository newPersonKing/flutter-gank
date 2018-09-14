import 'package:flutter/material.dart';
import 'package:flutter_gy_gank/common/GlobalConfig.dart';

Widget settingCard(BuildContext context){

  return new Container(
    color: GlobalConfig.cardBackgroundColor,
    margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
    padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Container(
          width: MediaQuery.of(context).size.width/4,
          child: new FlatButton(
              onPressed: (){

              },
              child: new Container(
                child: new Column(
                   children: <Widget>[
                     new Container(
                       margin: const EdgeInsets.only(bottom: 6.0),
                       child: new CircleAvatar(
                         radius: 20.0,
                         child: new Icon(Icons.invert_colors,color: Colors.white,),
                         backgroundColor: new Color(0xFFB88800),
                       ),
                     ),
                     new Container(
                       child: new Text(
                         GlobalConfig.pushTitle,
                         style: new TextStyle(color: GlobalConfig.fontColor,fontSize: 14.0),
                       ),
                     )
                   ],                  
                ),
              )),
        ),
        new Container(
          width: MediaQuery.of(context).size.width/4,
          child: new FlatButton(
              onPressed: (){
                
              }, 
              child: new Container(
                child: new Column(
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(bottom: 6.0),
                      child: new CircleAvatar(
                        radius: 20.0,
                        child: new Icon(Icons.edit,color: Colors.white,),
                        backgroundColor: new Color(0xFF63616D),
                      ),
                    ),
                    new Container(
                      child: new Text(GlobalConfig.thinkTitle,style: new TextStyle(color: GlobalConfig.fontColor,fontSize: 14.0),),
                    )
                  ],
                ),
              )),
        ),
        new Container(
          width: MediaQuery.of(context).size.width/4,
          child: new FlatButton(
              onPressed: (){

              },
              child: new Container(
                child: new Column(
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(bottom: 6.0),
                      child: new CircleAvatar(
                        radius: 20.0,
                        child: new Icon(Icons.update,color: Colors.white,),
                        backgroundColor: new Color(0xFFB86A0D),
                      ),
                    ),
                    new Container(
                      child: new Text(GlobalConfig.updateTitle,style: new TextStyle(color: GlobalConfig.fontColor,fontSize: 14.0),),
                    )
                  ],
                ),
              )),
        ),
        new Container(
          width: MediaQuery.of(context).size.width/4,
          child: new FlatButton(
              onPressed: (){

              },
              child: new Container(
                child: new Column(
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(bottom: 6.0),
                      child: new CircleAvatar(
                        radius: 20.0,
                        child: new Icon(Icons.perm_data_setting,color: Colors.white,),
                        backgroundColor: new Color(0xFF636269),
                      ),
                    ),
                    new Container(
                      child: new Text(GlobalConfig.aboutTitle,style: new TextStyle(color: GlobalConfig.fontColor,fontSize: 14.0),),
                    )
                  ],
                ),
              )),
        )
      ],
    ),
  );
}