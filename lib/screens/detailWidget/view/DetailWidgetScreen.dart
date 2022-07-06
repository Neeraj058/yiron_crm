import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yiron_crm/screens/detailWidget/controller/detailController.dart';

class DetailWidgetScreen extends StatefulWidget {
  String meetingID;
 DetailWidgetScreen({Key key, this.meetingID}) : super(key: key);
  @override
  State<DetailWidgetScreen> createState() => _DetailWidgetScreenState();
}

class _DetailWidgetScreenState extends State<DetailWidgetScreen> {
  final key = GlobalKey();
  DetailWidgetConntroller detailWidgetConntroller = Get.put(DetailWidgetConntroller());
  var id = '';
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id =    prefs.getString('userID', );
    });
  }
  @override
  void initState() {
    super.initState();
    getData();
    Future.delayed(const Duration(seconds: 1), ()
    {
      detailWidgetConntroller.getDetail(meetingID: widget.meetingID,userID: id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#007bff'),
        title: Text('Details'),
        leading: Padding(
          padding: EdgeInsets.only(top: 19, left: 3),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Text(
              'Cancel',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 18, right: 10),
            child: Text(
              'Save',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
              child: Obx(()=>
              detailWidgetConntroller.detailData.value.data!=null?
                  Form(
                      key: key,
                      child: Column(children: [
                        SizedBox(
                          height: 20,
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  'GeoLocation Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].geoLocationName,
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
                                  'Account',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].accountName,
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
                                  'Lead Type',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].leadType,
                              enabled: false
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
                                  'Date',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].date,
                              enabled: false,
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
                                  'City',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].city,
                              enabled: false,
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
                                  'Check In Time',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].checkInTime,
                              enabled: false,
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
                                  'Address',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            maxLines: 4,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].address,
                              enabled: false,
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
                                  'Check Out Time',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].checkOutTime,
                              enabled: false
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
                                  'Month',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].month,
                              enabled: false,
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
                                  'Year',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].year,
                              enabled: false,
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
                                  'Meeting OutCome',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].meetingOutcome,
                              enabled: false,
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
                                  'Telephonic',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].telephonic,
                              enabled: false,
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
                                  'Created By',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].createdBy,
                              enabled: false,
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
                                  'Owner Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].owner,
                              enabled: false,
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
                                  'Account Type',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].accountType,
                              enabled: false,
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
                                  'Status',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].accountStatus,
                              enabled: false,
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
                                  'Day',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].day,
                              enabled: false,
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
                                  'User Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].userName,
                              enabled: false,
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
                                  'Total Duration of Meeting Visit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Subject',
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
                                  'Last Modified By',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400, fontSize: 17),
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: detailWidgetConntroller.detailData.value.data[0].lastModifiedBy,
                              enabled: false,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ])):Center(child: Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: CircularProgressIndicator()))

              )




          )),
    );
  }
}
