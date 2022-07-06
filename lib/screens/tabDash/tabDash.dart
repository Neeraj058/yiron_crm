import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TabDashScreen extends StatefulWidget {
  const TabDashScreen({Key key}) : super(key: key);

  @override
  State<TabDashScreen> createState() => _TabDashScreenState();
}

class _TabDashScreenState extends State<TabDashScreen> {
  List name = [
    'Mobile Only',
    'chatter',
    'Reports',
    'Dashboards',
    'Check In',
    'Check Out',
    'Retail Lead',
    'Meeting Visits',
    'Customer Feedback on Account',
    'VD Transcations',
    'CIA TGT',
    'GLAMS'
  ];

  List icon = [
    Icons.mobile_friendly,
    Icons.bar_chart,
    Icons,
    Icons.bar_chart,
    Icons,
    Icons.bar_chart,
    Icons,
    Icons.bar_chart,
    Icons,
    Icons.bar_chart,
    Icons,
    Icons.bar_chart,
    Icons,
    Icons.bar_chart,
    Icons,
    Icons.bar_chart,
    Icons,
    Icons.bar_chart,
    Icons,
    Icons.bar_chart,
    Icons,
    Icons.bar_chart,
    Icons,
  ];

  List check = [
    Icon(Icons.mobile_friendly),
    Icon(Icons.mobile_friendly),
    Icon(Icons.mobile_friendly),
    Icon(Icons.mobile_friendly),
    Icon(Icons.mobile_friendly),
    Icon(Icons.mobile_friendly),
    Icon(Icons.mobile_friendly),
    Icon(Icons.mobile_friendly),
    Icon(Icons.mobile_friendly),
    Icon(Icons.mobile_friendly),
    Icon(Icons.mobile_friendly),
    Icon(Icons.mobile_friendly),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Material(
          elevation: 10,
          child: Container(

            color: HexColor('#007bff'),
            child: Column(
              children: [
                AppBar(
                  backgroundColor: HexColor('#007bff'),
                  bottomOpacity: 0.0,
                  elevation: 0.0,
                  leading: Column(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  actions: [
                    Icon(
                      Icons.search,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.notifications_active,
                      size: 30,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dashboards',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                      Text(
                        'New',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Lists',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: HexColor('#007bff'),),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  onTap: (){},
                  shape: RoundedRectangleBorder(

                    side: BorderSide(color: Colors.black12),
                  ),
                  title: Text("All Lists"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  ' Recent Dashboards',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: HexColor('#007bff'),),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
               children: [
            ListTile(
              onTap: (){},
            title: Text("CIA - BM Dashboard"),
          ),
                 ListTile(
                   onTap: (){},
                   shape: RoundedRectangleBorder(

                     side: BorderSide(color: Colors.black12),
                   ),
                   title: Text("CIA - Dashboard"),
                 ),
               ],)

          )
        ],
      ),
    );
  }
}
