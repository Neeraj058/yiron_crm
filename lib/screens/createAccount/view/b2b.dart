
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:yiron_crm/screens/createAccount/view/DateDetails.dart';

import '../controller/createAccountcontroller.dart';
import 'address.dart';


class B2BScreen extends StatefulWidget {
  const B2BScreen({Key key}) : super(key: key);

  @override
  State<B2BScreen> createState() => _B2BScreenState();
}

class _B2BScreenState extends State<B2BScreen> {
  CreateAccountController createAccountController = Get.put(CreateAccountController());
  String valueChoose;
  List listItem = ["one", "Two", "Three", "Four", "Five"];
  String b2bcategory;
  String handled;
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
      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  'B2B Account Info',
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
                    'B2B Category',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 17),
                  ))),

          SizedBox(
            height: 20,
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
                value: b2bcategory,
                onChanged: (newValue) {
                  setState(() {
                    b2bcategory = newValue;
                  });
                },
                items: createAccountController.data.value.data.getHandledByList.map<DropdownMenuItem<String>>((valueItem) {
                  return DropdownMenuItem(
                    onTap: (){
                      createAccountController.b2bCategoryID.value = valueItem.id;
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
                    'Handled By',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 17),
                  ))),Obx(()=>
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
                value: handled,
                onChanged: (newValue) {
                  setState(() {
                    handled = newValue;
                  });
                },
                items: createAccountController.data.value.data.getHandledByList.map<DropdownMenuItem<String>>((valueItem) {
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
          ):SizedBox()
          ),

          SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Handled By',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 17),
                  ))),
          Container(
            padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
            child: TextFormField(
              controller: createAccountController.handledBy.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText:                    'Handled By',
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
                Get.to(DateDetailsScreen());
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
    );
  }
}
