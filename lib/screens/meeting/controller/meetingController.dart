import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:yiron_crm/screens/meeting/model/flag.dart';
import '../../home/controller/homeController.dart';
import '../../login/loginController.dart';
import '../../login/loginmodel.dart';
import '../model/Meeting.dart';

class MeetingController extends GetxController {
  var meeting = MeetingModel().obs;
  var isloading = false.obs;
  var userData = LoginModel().obs;
  var check = FlagCheck().obs;
  HomeController homeController = Get.put(HomeController());

  Future<MeetingModel> meetingData({userID}) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final response = await http.post(
            Uri.parse('http://122.15.16.51/crm/api/meeting_visit'),
            headers: {
              'x-api-key': '123456',
            },
            body: {
              'user_id': userID,
            });

        if (response.statusCode == 200) {
          isloading.value = false;
          meeting.value = MeetingModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode == 500) {
          isloading.value = false;
          Get.snackbar(
            "invalid",
            'invalid data',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } on SocketException catch (_) {
      Get.defaultDialog(
          title: "No Internet", content: Text("Please connect to internet"));
      isloading.value = false;
    }
  }

  Future<MeetingModel> checkFlag({userID}) async {
    print("IDDD  " + userID);
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        final response = await http.post(
            Uri.parse('http://122.15.16.51/crm/api/check_checkin_flag'),
            headers: {
              'x-api-key': '123456',
            },
            body: {
              'user_id': userID,
            });

        if (response.statusCode == 200) {
          isloading.value = false;
          print(response.body);
          check.value = FlagCheck.fromJson(jsonDecode(response.body));
          print(check.value.checkinFlag.checkinFlag);
          if (check.value.checkinFlag.checkinFlag != null &&
              check.value.checkinFlag.checkinFlag == '1') {
            homeController.checkIn.value = false;
            homeController.label.value = 'CheckOut';
          } else {
            homeController.checkIn.value = true;
            homeController.label.value = 'CheckIn';
          }
        } else if (response.statusCode == 500) {
          isloading.value = false;
          Get.snackbar(
            "invalid",
            'invalid data',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    } on SocketException catch (_) {
      print('not connected');
      Get.defaultDialog(
          title: "No Internet", content: Text("Please connect to internet"));
      isloading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    meetingData();
  }
}
