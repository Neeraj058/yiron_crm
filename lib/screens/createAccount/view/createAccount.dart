import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yiron_crm/screens/createAccount/controller/createAccountcontroller.dart';
import 'package:yiron_crm/screens/createAccount/view/b2b.dart';
import 'package:http/http.dart' as http;
import '../model/leadType.dart';
import 'DateDetails.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  CreateAccountController createAccountController =
      Get.put(CreateAccountController());
  final _formKey = GlobalKey<FormState>();
  var id = '';
  String optionValues;
  String valueChoose;
  String leadType;
  String accountType;
  String Bifurcation;
  String status;
  String tender;
  String nationality;
  String accountSource;
  String manPowerCut;
  List listItem = ["one", "Two", "Three", "Four", "Five"];

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString(
        'userID',
      );
    });
  }






  @override
  void initState() {
    super.initState();
    getData();
    Future.delayed(const Duration(seconds: 1), () {
      createAccountController.options(userID: id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#007bff'),
        leading: Column(
          children: [
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Icon(Icons.arrow_back),
                ))
          ],
        ),
        actions: [
          // Icon(Icons.search,size: 30,),
          // SizedBox(width: 10,),
          // Icon(Icons.notifications_active,size: 30,),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: HexColor('#007bff'),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Account Name',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                        ],
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.accountName.value,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Please Enter Username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Account Name',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Account Type',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                        ],
                      ))),
              SizedBox(
                height: 20,
              ),
              Obx(() => createAccountController.data.value.data != null
                  ? Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(3)),
                      height: 55,
                      width: 375,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text('Select'),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20.0,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                          ),
                          value: accountType,
                          onChanged: (newValue) {

                            createAccountController.leadType();

                            setState(() {

                              accountType = newValue;

                            });
                          },
                          items: createAccountController
                              .data.value.data.getAccountTypeList
                              .map<DropdownMenuItem<String>>((valueItem) {
                            return DropdownMenuItem(
                              onTap: () {
                                createAccountController.accountTypeID.value = valueItem.id;
                                print(valueItem.id);
                              },
                              value: valueItem.optionValue,
                              child: Text(valueItem.optionValue),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : Text("")),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Lead Type',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 20,
              ),
              Obx(() => createAccountController.leadTypeData.value.data != null
                  ? Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(3)),
                      height: 55,
                      width: 375,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text('Select'),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20.0,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                          ),
                          value: leadType,
                          onChanged: (newValue) {
                            setState(() {
                              leadType = newValue;
                            });
                          },
                          items: createAccountController.leadTypeData.value.data
                              .map<DropdownMenuItem<String>>((valueItem) {
                            return DropdownMenuItem(
                              onTap: (){
                                createAccountController.handledByID.value = valueItem.id;
                              },

                              value: valueItem.optionValue,
                              child: Text(valueItem.optionValue),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : SizedBox()),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Lead Bifurcation',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 20,
              ),
              Obx(() => createAccountController.data.value.data != null
                  ? Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(3)),
                      height: 55,
                      width: 375,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text('Select'),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20.0,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                          ),
                          value: Bifurcation,
                          onChanged: (newValue) {
                            setState(() {
                              Bifurcation = newValue;
                            });
                          },
                          items: createAccountController
                              .data.value.data.getBifurcationList
                              .map<DropdownMenuItem<String>>((valueItem) {
                            return DropdownMenuItem(
                              onTap: (){
                                createAccountController.statusID.value = valueItem.id;
                              },
                              value: valueItem.optionValue,
                              child: Text(
                                valueItem.optionValue,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : SizedBox()),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Status',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 20,
              ),
              Obx(() => createAccountController.data.value.data != null
                  ? Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(3)),
                      height: 55,
                      width: 375,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text('Select'),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20.0,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                          ),
                          value: status,
                          onChanged: (newValue) {
                            setState(() {
                              status = newValue;
                            });
                          },
                          items: createAccountController
                              .data.value.data.getStatusList
                              .map<DropdownMenuItem<String>>((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem.optionValue,
                              child: Text(valueItem.optionValue),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : SizedBox()),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Potential Amount()',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.potentialAmount.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Potential Amount',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Business Percentage',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.businessPercentage.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Business Percentage',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Meeting Count',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.meetingCount.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Meeting Count',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Parent Account',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.parentAccount.value,
                  enabled: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Parent Account',
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Is Tender Client',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 20,
              ),
              Obx(() => createAccountController.data.value.data != null
                  ? Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(3)),
                      height: 55,
                      width: 375,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text('Select'),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20.0,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                          ),
                          value: tender,
                          onChanged: (newValue) {
                            setState(() {
                              tender = newValue;
                            });
                          },
                          items: createAccountController
                              .data.value.data.getTenderClientList
                              .map<DropdownMenuItem<String>>((valueItem) {
                            return DropdownMenuItem(
                              onTap: (){
                                createAccountController.isTenderClientID.value = valueItem.id;
                              },
                              value: valueItem.optionValue,
                              child: Text(valueItem.optionValue),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : SizedBox()),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Nationality',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                        ],
                      ))),
              SizedBox(
                height: 20,
              ),
              Obx(() => createAccountController.data.value.data != null
                  ? Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(3)),
                      height: 55,
                      width: 375,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          hint: Text('Select'),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20.0,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                          ),
                          value: nationality,
                          onChanged: (newValue) {
                            setState(() {
                              nationality = newValue;
                            });
                          },
                          items: createAccountController
                              .data.value.data.getcountriesList
                              .map<DropdownMenuItem<String>>((valueItem) {
                            return DropdownMenuItem(
                              onTap: (){
                                createAccountController.nationalityID.value = valueItem.id;
                              },
                              value: valueItem.name,
                              child: Text(valueItem.name),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : SizedBox()),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Phone',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                        ],
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.phone.value,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Please Enter Username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                        ],
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.email.value,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Please Enter Username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Contract Renewal Date',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'City',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                        ],
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.city.value,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Please Enter Username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City',
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Meeting Count',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.meetingCount.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Meeting Count',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Website',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.website.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Website',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Corporate Type',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.corporateType.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Corporate Type',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.description.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Key Person Name & Phone',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                        ],
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.keyPerson.value,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Please Enter Username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Key Person Name & Phone',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Reason for Dead',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller: createAccountController.reasonOfDead.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Reason for Dead',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Key Person Designation',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller:
                      createAccountController.keyPersonDesignation.value,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Please Enter Username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Key Person Designation',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Account Source',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 20,
              ),
              Obx(() => createAccountController.data.value.data != null
                  ? Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(3)),
                      height: 55,
                      width: 375,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: DropdownButton(
                          underline: SizedBox(),
                          hint: Text('Select'),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20.0,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                          ),
                          value: accountSource,
                          onChanged: (newValue) {
                            setState(() {
                              accountSource = newValue;
                            });
                          },
                          items: createAccountController
                              .data.value.data.getaccountSourceList
                              .map<DropdownMenuItem<String>>((valueItem) {
                            return DropdownMenuItem(
                              onTap: (){
                                createAccountController.accountSourceID.value = valueItem.id;
                              },
                              value: valueItem.optionValue,
                              child: Text(valueItem.optionValue),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : SizedBox()),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        'Preferred Destinations',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
                child: TextFormField(
                  controller:
                      createAccountController.preferredDestinations.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Preferred Destinations',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            'Company Manpower Count',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 17),
                          ),
                        ],
                      ))),
              SizedBox(
                height: 20,
              ),
              Obx(() => createAccountController.data.value.data != null
                  ? Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(3)),
                      height: 55,
                      width: 375,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          hint: Text('Select'),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 20.0,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black54,
                          ),
                          value: manPowerCut,
                          onChanged: (newValue) {
                            setState(() {
                              manPowerCut = newValue;
                            });
                          },
                          items: createAccountController
                              .data.value.data.getcompanyManpowerList
                              .map<DropdownMenuItem<String>>((valueItem) {
                            return DropdownMenuItem(
                              onTap: (){
                                createAccountController.compantManpowerCountID.value = valueItem.id;
                              },
                              value: valueItem.optionValue,
                              child: Text(valueItem.optionValue),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  : SizedBox()),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(B2BScreen());
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          child: Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
