
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String internet = '';
  Future<bool> internetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  online(){
    setState(() {
      internet = 'online';
    });
  }
  offline(){
    setState(() {
      internet = 'no internet';
    });
  }


  @override
  void initState() {
    super.initState();
internetConnectivity().then((value) => {
  if(value==true){
    online()
  } else{
    offline(),
  }
});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
            onTap: (){
            },
            child: Text(internet)),



      ),
    );
  }
}


