
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../model/widgetModel.dart';

class DetailWidgetConntroller extends GetxController{
var detailData = WidgetDetailModel().obs;
var isloading =false.obs;


  Future<WidgetDetailModel> getDetail({userID,meetingID}) async {
    print(meetingID);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final response = await http.post(
            Uri.parse('http://122.15.16.51/crm/api/meeting_details'),
            headers: {
              'x-api-key': '123456',
            },
            body: {
              'user_id': userID,
              'meeting_log_id': meetingID,
            });
print(response.body);
        if (response.statusCode == 200){
          isloading.value= false;
          detailData.value = WidgetDetailModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode == 500) {
          isloading.value= false;
          Get.snackbar(
            "invalid", 'invalid data', snackPosition: SnackPosition.BOTTOM,);
        }
      }
    } on SocketException catch (_) {
      Get.defaultDialog(title: "No Internet",content: Text("Please connect to internet"));
      isloading.value= false;
    }
  }




}