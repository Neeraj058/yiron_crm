
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../model/accountOptionModel.dart';
import '../model/leadType.dart';

class CreateAccountController extends GetxController{
  var isloading =false.obs;
  var data = CreateAccountModel().obs;
  var leadTypeData = LeadTypeModel().obs;
  var valueChoose= ''.obs;
  var accountType= ''.obs;
  var Bifurcation= ''.obs;
  var status= ''.obs;
  var tender= ''.obs;
  var nationality= ''.obs;
  var accountSource= ''.obs;
  var manPowerCut= ''.obs;


//////create Account controller///////
  var accountName = TextEditingController().obs;
  var potentialAmount = TextEditingController().obs;
  var businessPercentage = TextEditingController().obs;
  var meetingCount = TextEditingController().obs;
  var parentAccount = TextEditingController().obs;
  var phone = TextEditingController().obs;
  var email = TextEditingController().obs;
  var contractRenewal = TextEditingController().obs;
  var city = TextEditingController().obs;
  var website = TextEditingController().obs;
  var corporateType = TextEditingController().obs;
  var description = TextEditingController().obs;
  var keyPerson = TextEditingController().obs;
  var reasonOfDead = TextEditingController().obs;
  var keyPersonDesignation = TextEditingController().obs;
  var preferredDestinations = TextEditingController().obs;


///////B2B Account Info/////////
  var handledBy = TextEditingController().obs;


  ////Date Details////////////
  var newDate = TextEditingController().obs;
  var deadLeadDate = TextEditingController().obs;
  var convertedDate = TextEditingController().obs;
  var inProgressDate = TextEditingController().obs;
  var existingDate = TextEditingController().obs;

  ////Last Call Details///////////
  var lastSaledCallDate = TextEditingController().obs;
  var salesCall = TextEditingController().obs;
  var lastSaleCallDescription = TextEditingController().obs;
  var callOutCome = TextEditingController().obs;
  var lastCheckDetails = TextEditingController().obs;



  ///////////Address Information//////////////////////////
  var billingStreet = TextEditingController().obs;
  var shippingStreet = TextEditingController().obs;
  var billingCity = TextEditingController().obs;
  var billingSateProvince = TextEditingController().obs;
  var shippingCity = TextEditingController().obs;
  var shippingStateProvince = TextEditingController().obs;
  var billingStateProvince = TextEditingController().obs;
  var billingZipPoastalCode = TextEditingController().obs;
  var billingCountry = TextEditingController().obs;
  var shippingZipPostalCode = TextEditingController().obs;
  var shippingCountry = TextEditingController().obs;

  ///////////DropDownID//////////////////////
  var accountTypeID= ''.obs;
  var LeadTypeID = ''.obs;
  var statusID = ''.obs;
  var isTenderClientID = ''.obs;
  var nationalityID = ''.obs;
  var accountSourceID = ''.obs;
  var compantManpowerCountID = ''.obs;
  var b2bCategoryID = ''.obs;
  var handledByID = ''.obs;
  var lastCallAttemptStatusID = ''.obs;
  var callOutComeID = ''.obs;




  Future<CreateAccountModel> options({userID}) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final response = await http.get(
            Uri.parse('http://192.168.17.22/crm/api/get_account_info_option'),
            headers: {
              'x-api-key': '123456',
            },);
        if (response.statusCode == 200){
          isloading.value= false;
          data.value = CreateAccountModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode == 500) {
          isloading.value= false;
    createSnackBar('invalid Data');
        }
      }
    } on SocketException catch (_) {
      createSnackBar('Please connect to internet');
      isloading.value= false;
    }
  }


  Future<LeadTypeModel> leadType() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final response = await http.post(
          Uri.parse('http://192.168.17.22/crm/api/get_lead_type'),
          headers: {
            'x-api-key': '123456',
          },
        body: {
        'account_type': accountTypeID.value,
        });
        print(response.body);
        if (response.statusCode == 200){
          isloading.value= false;
          leadTypeData.value = LeadTypeModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode == 500) {
          isloading.value= false;
          createSnackBar('invalid Data');
        }
      }
    } on SocketException catch (_) {
      createSnackBar('Please connect to internet');
      isloading.value= false;
    }
  }




  Future<LeadTypeModel> createAccount() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        final response = await http.post(
            Uri.parse('http://192.168.17.22/crm/api/create_account'),
            headers: {
              'x-api-key': '123456',
            },
            body: {
        "user_id":"",
       " account_name":"Md Shamim Ansari",
        "account_type":  "",
        "lead_type":"OTM=",
        "is_tender_client": "",
        "lead_bifurcation": "",
        "status":"",
        "branch_id": "",
        "branch_name":"",
        "potential_amount":"",
        "business_percentage":"",
        "parent_account_name": "",
        "meeting_count":"",
        "corporate_type": "",
        "key_person_name_phone": "",
        "key_person_designation":"Developer Required Field",
        "parent_account":"",
        "is_tender_client": "",
        "nationality": "",
        "phone": "",
        "email_id":"",
        "contract_renewal_date":"05/12/2022",
        "city":"",
        "website":"",
        "description": "",
        "group_data": "",
        "reason_for_dead": "",
        "account_source": "",
        "company_manpower_count": "",
        "b2b_category": "",
        "travel_agency_owner": "",
        "handled_by": "",
        "preferred_airline": "",
        "new_date": "",
        "dead_lead_date":"",
        "converted_date":"05/25/2022",
        "in_process_date":"05/20/2022",
        "existing_date":"05/22/2022",
        "meeting_date": "",
        "meeting_time": "",
        "meeting_planned_description": "",
        "last_sales_call_date":"05/26/2022",
        "call_attempt_status":"MTQ1",
        "call_outcome":"MTUw",
        "sales_call_next_action_date":"05/26/2022",
        "last_sales_call_description":"Not Required",
        "last_check_in_date":"05/26/2022",
        "last_check_in_address":"Not Required",
        "billing_street":"Billing Street Not Required",
        "billing_city":"Billing City Not Required",
        "billing_zip_postal_code":"Billing Zip/Postal Code Not Required",
        "billing_state_province":"Billing State/Province Not Required",
       "billing_country":"Billing Country Not Required",
        "shipping_street":"pping Street Not Required",
        "shipping_city":"Shipping City Not Required",
        "shipping_zip_postal_code":"Shipping Zip/Postal Code Not Required",
        "shipping_state_province":"Shipping State/Province Not Required",
        "shipping_country":"Shipping Country Not Required"
            });
        print(response.body);
        if (response.statusCode == 200){
          isloading.value= false;
          leadTypeData.value = LeadTypeModel.fromJson(jsonDecode(response.body));
        } else if (response.statusCode == 500) {
          isloading.value= false;
          createSnackBar('invalid Data');
        }
      }
    } on SocketException catch (_) {
      createSnackBar('Please connect to internet');
      isloading.value= false;
    }
  }



  void createSnackBar(String message) {
    final snackBar = new SnackBar(content: new Text(message),
        backgroundColor: Colors.red);
    BuildContext scaffoldContext;
    Scaffold.of(scaffoldContext).showSnackBar(snackBar);
  }


}
