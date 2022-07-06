import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../detailWidget/view/DetailWidgetScreen.dart';
import '../controller/meetingController.dart';

class LogCallScreen extends StatefulWidget {
  LogCallScreen({Key key}) : super(key: key);

  @override
  State<LogCallScreen> createState() => _LogCallScreenState();
}

class _LogCallScreenState extends State<LogCallScreen> {
  MeetingController meetingController = MeetingController();
  var id = '';
  var net = '';


  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id =    prefs.getString('userID', );
    });
  }


  @override
  void initState() {
    super.initState();
    meetingController.isloading.value = true;
    getData();
    Future.delayed(const Duration(seconds: 1), () {
      meetingController.meetingData(userID: id);
      meetingController.checkFlag(userID: id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#007bff'),
        leading: Icon(
          Icons.account_circle,
          size: 30,
        ),
        actions: [
          // Icon(
          //   Icons.search,
          //   size: 30,
          // ),
          // SizedBox(
          //   width: 10,
          // ),
          // Icon(
          //   Icons.notifications_active,
          //   size: 30,
          // ),
        ],
      ),
      body:
      Obx(()=>  ModalProgressHUD(
        inAsyncCall: meetingController.isloading.value,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 21, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Meetings',
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
            Obx(() =>
            meetingController.meeting.value!=null&&meetingController.meeting.value.data!=null?
            Expanded(
              child: ListView.builder(
                  itemCount: meetingController.meeting.value.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Get.to(DetailWidgetScreen(meetingID: meetingController.meeting.value.data[index].meetingLogId));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Container(
                          height: 260,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 8.0,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                      EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        'GeoLocation Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding:
                                      EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        meetingController.meeting.value
                                            .data[index].geoLocationName,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                      EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        'Account',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding:
                                      EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        meetingController
                                            .meeting.value.data[index].accountName,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                      EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        'Owner First Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding:
                                      EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        meetingController.meeting.value
                                            .data[index].firstName,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                      EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        'Address',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding:
                                        EdgeInsets.only(top: 10, left: 10),
                                        child: Text(
                                          meetingController.meeting.value
                                              .data[index].address,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                      EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        'Check In Time',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding:
                                      EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        meetingController.meeting.value
                                            .data[index].checkInTime,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      padding:
                                      EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        meetingController.meeting.value
                                            .data[index].date,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                      EdgeInsets.only(top: 10, left: 10),
                                      child: Text(
                                        'Outcomes',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding:
                                        EdgeInsets.only(top: 10, left: 10),
                                        child: Text(
                                          meetingController.meeting.value
                                              .data[index].meetingOutcome,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ):
            Container(
                padding: EdgeInsets.only(top: 200),
                child: Text("No Meetings Found"))


            ),
          ],
        ),
      ),),

    );

  }

}
