import 'dart:async';

import 'package:http/http.dart' as http;

class HttpExt{

  static void get(String url, Function callback, Function errorCallback) async{

    try {
      http.Response response= await http.get(url);
      if(callback!=null){
        callback(response.body);
      }
    }catch(exception){
      errorCallback(exception);
    }
  }

  /*todo post 方法 为什么要用{}*/
  static Future post(String url, Function callback,
      {Map<String, String> params, Function errorCallback}) async {

    try{
      http.Response response= await http.post(url,body: params);
      if(callback!=null){
        callback(response.body);
      }
    }catch(exception){
      errorCallback(exception);
    }
  }
}