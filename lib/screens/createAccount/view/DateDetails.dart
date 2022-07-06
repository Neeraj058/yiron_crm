import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:yiron_crm/screens/createAccount/view/b2b.dart';
import 'package:yiron_crm/screens/createAccount/view/lastcall.dart';

import '../controller/createAccountcontroller.dart';


class DateDetailsScreen extends StatefulWidget {
  const DateDetailsScreen({Key key}) : super(key: key);

  @override
  State<DateDetailsScreen> createState() => _DateDetailsScreen();
}

class _DateDetailsScreen extends State<DateDetailsScreen> {
  CreateAccountController createAccountController =
  Get.put(CreateAccountController());
  final newDateController = TextEditingController();
  final timeController = TextEditingController();
  TimeOfDay _time = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay selectedTime = TimeOfDay.now();
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
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                'Date Details',
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

        const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'New Date',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 17),
                ))),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextFormField(
            controller: createAccountController.newDate.value,
            readOnly: true,
            onTap: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2015),
                lastDate: DateTime(2025),
              ).then((selectedDate) {
                if (selectedDate != null) {
                  createAccountController.newDate.value.text=
                      DateFormat('yyyy-MM-dd')
                          .format(selectedDate);
                }
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'New Date',
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
                  'Dead Lead Date',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 17),
                ))),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextFormField(
            controller: createAccountController.deadLeadDate.value,
            readOnly: true,
            onTap: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2015),
                lastDate: DateTime(2025),
              ).then((selectedDate) {
                if (selectedDate != null) {
                  createAccountController.deadLeadDate.value.text =
                      DateFormat('yyyy-MM-dd').format(selectedDate);
                }
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText:     'Dead Lead Date',
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
                  'Converted Date',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 17),
                ))),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextFormField(
            controller: createAccountController.convertedDate.value,
            readOnly: true,
            onTap: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2015),
                lastDate: DateTime(2025),
              ).then((selectedDate) {
                if (selectedDate != null) {
                  createAccountController.convertedDate.value.text =
                      DateFormat('yyyy-MM-dd')
                          .format(selectedDate);
                }
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText:  'Converted Date',
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
                  'In Progress Date',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 17),
                ))),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextFormField(
            controller: createAccountController.inProgressDate.value,
            readOnly: true,
            onTap: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2015),
                lastDate: DateTime(2025),
              ).then((selectedDate) {
                if (selectedDate != null) {
                  createAccountController.inProgressDate.value.text =
                      DateFormat('yyyy-MM-dd')
                          .format(selectedDate);
                }
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText:       'In Progress Date',
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
                  'Existing Date',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 17),
                ))),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextFormField(
            controller: createAccountController.existingDate.value,
            readOnly: true,
            onTap: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2015),
                lastDate: DateTime(2025),
              ).then((selectedDate) {
                if (selectedDate != null) {
                  createAccountController.existingDate.value.text =
                      DateFormat('yyyy-MM-dd')
                          .format(selectedDate);
                }
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Existing Date',
            ),
          ),
        ),

        SizedBox(
          height: 40,
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
                    Get.to(LastCallScreen());
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

      ],),


    );
  }
}
