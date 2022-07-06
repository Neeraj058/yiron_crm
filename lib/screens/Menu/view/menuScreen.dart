import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../createAccount/view/createAccount.dart';
import '../../login/LoginScreen.dart';



class MenuScreen extends StatefulWidget {
  const MenuScreen({Key key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  List name = ['Mobile Only','chatter','Reports','Dashboards','Check In','Check Out','Retail Lead',
  'Meeting Visits','Customer Feedback on Account','VD Transcations','CIA TGT','GLAMS'];

  List icon =[Icons.mobile_friendly,Icons.bar_chart,Icons,Icons.bar_chart,Icons,Icons.bar_chart,Icons,Icons.bar_chart,Icons,Icons.bar_chart,Icons,Icons.bar_chart,Icons,Icons.bar_chart,Icons,Icons.bar_chart,Icons,Icons.bar_chart,Icons,Icons.bar_chart,Icons,Icons.bar_chart,Icons,];

List check = [Icon(Icons.mobile_friendly),Icon(Icons.mobile_friendly),Icon(Icons.mobile_friendly),Icon(Icons.mobile_friendly),Icon(Icons.mobile_friendly),Icon(Icons.mobile_friendly),Icon(Icons.mobile_friendly),Icon(Icons.mobile_friendly),Icon(Icons.mobile_friendly),Icon(Icons.mobile_friendly),Icon(Icons.mobile_friendly),Icon(Icons.mobile_friendly),];
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed:  () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('userID',);
        Get.offAll(LoginPage());
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Logout?"),
      content: Text("Are you sure want to Logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: HexColor('#007bff'),
        leading: Column(
          children: [
            Icon(Icons.account_circle,size: 30,),
            SizedBox(height: 5,),
            Text("Menu",style: TextStyle(fontSize: 18),)
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
        Container(
          height: 190,
          child: ListView(
            children:  [
              // Card(
              //   child: ListTile(
              //     title: Text("Check In"),
              //     leading: Icon(Icons.add_box),
              //   ),
              // ),
              // Card(
              //   child: ListTile(
              //     title: Text("Check Out"),
              //     leading: Icon(Icons.add_box),
              //   ),
              // ),
              Card(
                child: ListTile(
                  onTap: () async {
                    showAlertDialog(context);

                  },
                  title: Text("Logout"),
                  leading: Icon(Icons.logout),
                ),
              ),
              Card(
                child: ListTile(
                  onTap: () async {
                 Get.to(CreateAccountScreen());
                  },
                  title: Text("Create Account"),
                  leading: Icon(Icons.man),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20,),
        // Expanded(
        //   child: ListView.builder(
        //       itemCount: name.length,
        //       itemBuilder: (BuildContext context,int index){
        //
        //     return ListTile(
        //       shape: RoundedRectangleBorder(
        //
        //         side: BorderSide(color: Colors.black12),
        //       ),
        //       onTap: (){
        //       },
        //       title: Text(name[index],style: TextStyle(fontWeight: FontWeight.w500,),),
        //       leading:check[index]
        //     );
        //   }),
        // )
      ],
    ),


    );
  }

}
