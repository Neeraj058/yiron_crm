import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:yiron_crm/screens/createAccount/view/address.dart';

import '../controller/createAccountcontroller.dart';



class LastCallScreen extends StatefulWidget {
  const LastCallScreen({Key key}) : super(key: key);

  @override
  State<LastCallScreen> createState() => _LastCallScreenState();
}

class _LastCallScreenState extends State<LastCallScreen> {
  String valueChoose;
  String lastCallAttempt;
  String callOutCome;
  List listItem = ["one", "Two", "Three", "Four", "Five"];
  final newDateController = TextEditingController();
  CreateAccountController createAccountController =
  Get.put(CreateAccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: HexColor('#007bff'),
        leading: Column(
          children: [
            InkWell(
                onTap: (){
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Last Call Details',
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
                    child: Text(
                      'Last Sales Call Date',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: createAccountController.lastSaledCallDate.value,
                readOnly: true,
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2025),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      createAccountController.lastSaledCallDate.value.text =
                          DateFormat('yyyy-MM-dd')
                              .format(selectedDate);
                    }
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:         'Last Sales Call Date',
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
                      'Sales Call(Next Acction Date)',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: createAccountController.salesCall.value,
                readOnly: true,
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2025),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      createAccountController.salesCall.value.text =
                          DateFormat('yyyy-MM-dd')
                              .format(selectedDate);
                    }
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:         'Last Sales Call Date',
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
                      'Last Call Attempt Status',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),
            SizedBox(
              height: 10,
            ),
            Obx(()=>
            createAccountController.data.value.data != null?
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(3)
              ),
              height: 55,
              width: 375,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: DropdownButton<String>(
                  underline: SizedBox(),
                  hint: Text('select'),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 20.0,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black54,
                  ),
                  value: lastCallAttempt,
                  onChanged: (newValue) {
                    setState(() {
                      lastCallAttempt = newValue;
                    });
                  },
                  items: createAccountController.data.value.data.getcallAttemptStatus.map<DropdownMenuItem<String>>((valueItem) {
                    return DropdownMenuItem(
                      onTap: (){
                        createAccountController.lastCallAttemptStatusID.value = valueItem.id;
                      },
                      value: valueItem.optionValue,
                      child: Text(valueItem.optionValue),
                    );
                  }).toList(),
                ),
              ),
            ):SizedBox()),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Last Sale Call Description',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),
            Container(
              padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:      'Last Sale Call Description',
                ),
              ),
            ),

            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Call OutCome',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(3)
              ),
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
                  value: callOutCome,
                  onChanged: (newValue) {
                    setState(() {
                      callOutCome = newValue;
                    });
                  },
                  items: createAccountController.data.value.data.getcallAttemptStatus.map<DropdownMenuItem<String>>((valueItem) {
                    return DropdownMenuItem(
                      onTap: (){
                        createAccountController.callOutComeID.value = valueItem.id;
                      },
                      value: valueItem.optionValue,
                      child: Text(valueItem.optionValue),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Last Call Details',
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
                    child: Text(
                      'Last CHeck In Time',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),
            Container(
              padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: TextFormField(
                controller: createAccountController.lastCheckDetails.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:       'Last CHeck In Time',
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        child: Center(
                          child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),      InkWell(
                      onTap: (){
                        Get.to( AddressScreen());

                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        child: Center(
                          child: Text("Save",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), SizedBox(
              height: 100,
            ),


          ],
        ),
      ),
    );
  }
}
