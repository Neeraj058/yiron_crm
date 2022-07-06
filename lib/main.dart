import 'dart:async';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yiron_crm/screens/home/view/dashboard.dart';
import 'package:yiron_crm/screens/login/LoginScreen.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Splash());
  }
}





class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var id = '';

 getData() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   setState(() {
      id =  prefs.getString('userID',);
   });
 }


  @override
  void initState() {
    super.initState();
    getData();
    Timer(Duration(seconds: 3), () {
      print(id);
      Navigator.pushReplacement(
          context, MaterialPageRoute(
          builder: (context) => id!=null&&id.isNotEmpty ? DashBoard() : DashBoard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.home,
          size: 70,
          color: Colors.green,
        ),
      ),
    );
  }
}


