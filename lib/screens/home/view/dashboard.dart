
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:yiron_crm/screens/Menu/view/menuScreen.dart';
import 'package:yiron_crm/screens/checkIn/view/checkInout.dart';
import 'package:yiron_crm/screens/home/controller/homeController.dart';
import 'package:yiron_crm/screens/meeting/view/logCall.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoard createState() => _DashBoard();
}

class _DashBoard extends State<DashBoard> {
  HomeController homeController = Get.put(HomeController());
  DateTime pre_backpress = DateTime.now();
  final _pageOptions = [
    LogCallScreen(),
   // PlanMeetScreen(),
   // TabDashScreen(),
    CheckInScreen(),
    MenuScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop:()async{
          final timegap = DateTime.now().difference(pre_backpress);
          final cantExit = timegap >= Duration(seconds: 2);
          pre_backpress = DateTime.now();
          if(cantExit){
            //show snackbar
            final snack = SnackBar(content: Text('Press Back button again to Exit'),duration: Duration(seconds: 2),);
            ScaffoldMessenger.of(context).showSnackBar(snack);
            return false; // false will do nothing when back press
          }else{
            return true;   // true will exit the app
          }
        } ,
        child: Obx(()=>
            Scaffold(
                backgroundColor: Colors.white,
                body: _pageOptions[homeController.selectedPage.value],
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(icon:Icon(Icons.wc_outlined, size: 30),label: "Meetings"),
                    // BottomNavigationBarItem(icon: Icon(Icons.report, size: 30),label: "Reports"),
                    //  BottomNavigationBarItem(icon: Icon(Icons.home, size: 30),label: "Dashboard"),
                    BottomNavigationBarItem(icon: Icon(Icons.phone_android, size: 30),label: homeController.label.value ),
                    BottomNavigationBarItem(icon: Icon(Icons.menu, size: 30),label: "Menu"),
                  ],
                  selectedItemColor: HexColor('#007bff'),
                  elevation: 5.0,
                  unselectedItemColor: Colors.black87,
                  currentIndex: homeController.selectedPage.value,
                  backgroundColor: Colors.white,
                  onTap: (index){
                    setState(() {
                      homeController.selectedPage.value = index;
                    });
                  },
                )
            )

        ),
      );

  }
}