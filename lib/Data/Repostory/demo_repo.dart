// ignore_for_file: empty_catches

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:practiceapp/Data/Controller/employee_controller.dart';
import 'package:practiceapp/Data/Models/demo_class.dart';

class DemoRepo{



  static Future<int> getallEmploye() async{
try{

  var request = await http.Request('GET', Uri.parse('https://reqres.in/api/unknown'));


http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
 

  EmployeeController.demoClass=  DemoClass.fromRawJson(await response.stream.bytesToString());


 
 
}
return response.statusCode;

}

  catch (e) {
    if(e is SocketException){
      return 501;

       
    }
    else if(e is TimeoutException){
      return 401;
      
    }
      else if(e is NetworkImageLoadException ){
        return 201;
    
    }
  
  }

  return 0;

  }
}