import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/accounts.dart';


class CheckController extends GetxController {
  var accountList = AccountList().obs;
  List<AccountList> accounts = [];
  var accountID = ''.obs;
  var loader = false.obs;
  List<AccountList> productsResponseFromJson(String str) =>
      List<AccountList>.from(
          json.decode(str).map((x) => AccountList.fromJson(x)));



  Future<List<AccountList>> accountListData() async {
    final response = await http.post(
        Uri.parse('http://122.15.16.51/crm/api/accountlist'),
        headers: {
          'x-api-key': '123456',
        },
        body: {
          'search': '',
        });

    if (response.statusCode == 200) {
      print(response.body);
     // return productsResponseFromJson(response.body);
      accounts.addAll(productsResponseFromJson(response.body));
    } else if (response.statusCode == 500) {
      Get.snackbar(
        "invalid", 'invalid data', snackPosition: SnackPosition.BOTTOM,);
    }
    else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to get Data');
    }
  }
}


