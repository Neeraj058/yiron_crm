import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:yiron_crm/screens/createAccount/view/lastcall.dart';

import '../controller/createAccountcontroller.dart';



class AddressScreen extends StatefulWidget {
  const AddressScreen({Key key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  CreateAccountController createAccountController = Get.put(CreateAccountController());



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
                )
            )

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
                    'Address Information',
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
                      'Billing Street',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),
            Container(
              padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: TextFormField(
                controller: createAccountController.billingStreet.value,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:       'Billing Street',
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
                      'Shipping Street',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),
            Container(
              padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: TextFormField(
                controller: createAccountController.shippingStreet.value,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:       'Shipping Street',
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
                      'Billing City',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),
            Container(
              padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: TextFormField(
                 controller: createAccountController.billingCity.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:            'Billing City',
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
                      'Billing State/Province',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),


            Container(
              padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: TextFormField(
                controller: createAccountController.billingSateProvince.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:                'Billing State/Province',
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
                      'Shipping City',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),

            Container(
              padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: TextFormField(
               controller: createAccountController.shippingCity.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:               'Shipping City',
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
                      'Shipping State/Province',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),
            Container(
              padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: TextFormField(
                controller: createAccountController.shippingStateProvince.value,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:                'Shipping State/Province',
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
                      'Billing Zip/Postal Code',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),

            Container(
              padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: TextFormField(
                controller: createAccountController.billingZipPoastalCode.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:                 'Billing Zip/Postal Code',
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
                      'Billing Country',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),

            Container(
              padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: TextFormField(
                controller: createAccountController.billingCountry.value,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:          'Billing Country',
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
                      'Shipping Zip/Postal Code',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),
            Container(
              padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: TextFormField(
controller: createAccountController.shippingZipPostalCode.value,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:             'Shipping Zip/Postal Code',
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
                      'Shipping Country',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17),
                    ))),


            Container(
              padding: EdgeInsets.fromLTRB(17, 17, 17, 17),
              child: TextFormField(
                controller: createAccountController.shippingCountry.value,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:               'Shipping Country',
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
                    ),  InkWell(
                      onTap: (){
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
