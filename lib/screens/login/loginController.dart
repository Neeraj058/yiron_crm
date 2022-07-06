
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../home/view/dashboard.dart';
import 'loginmodel.dart';

class LoginController extends GetxController{
  var userData = LoginModel().obs;
var isloading =false.obs;

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: Text("Username or Password not Found"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  Future<LoginModel> loginData({email,password,context}) async {
    final response = await http.post(Uri.parse('http://122.15.16.51/crm/api/login'),
      headers: {
        'x-api-key': '123456',
      },
      body: {
        'email': email,
        'password': password,
      });
    print(response.body);
    if (response.statusCode == 200) {
      isloading.value = false;
      userData.value = LoginModel.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userID', userData.value.data.userId);
      Get.offAll(DashBoard());
    } else if(response.statusCode==500){
      isloading.value = false;
      showAlertDialog(context);
    }
    else
    {
      throw Exception('Failed to get Data');
    }
  }
}

