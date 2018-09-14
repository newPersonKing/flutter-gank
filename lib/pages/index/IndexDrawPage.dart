import 'package:flutter/material.dart';

///侧滑栏
// ignore: must_be_immutable
class IndexDrawPage extends StatelessWidget{

  String email, name, profileimg, background;

  IndexDrawPage({this.email,this.name,this.profileimg,this.background});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
       children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: new Text(name), 
              accountEmail: new Text(email),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage(background),
              ),
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage(background),
            fit: BoxFit.cover)
          ),),

         new ListTile(
           title: new Text("Home"),
           trailing: new Icon(Icons.home),
           onTap: (){
             print("home");
           },
         ),
         new ListTile(
           title: new Text("Notification"),
           trailing: new Icon(Icons.notifications),
           onTap: (){
             print("Notification");
           },
         ),
         new ListTile(
           title: new Text("Exit"),
           trailing: new Icon(Icons.exit_to_app),
         )
       ],
    );
  }
}
