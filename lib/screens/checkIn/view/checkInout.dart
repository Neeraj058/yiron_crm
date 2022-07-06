import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yiron_crm/screens/checkIn/controller/checkinoutController.dart';
import 'package:yiron_crm/screens/checkIn/model/accounts.dart';
import 'package:http/http.dart' as http;
import '../../home/controller/homeController.dart';
class CheckInScreen extends StatefulWidget {
  const CheckInScreen({Key key}) : super(key: key);

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
CheckController checkController = Get.put(CheckController());
  HomeController homeController = Get.put(HomeController());
  TextEditingController checkInController = TextEditingController();
  TextEditingController checkInNameController = TextEditingController();
  TextEditingController checkOutNameController = TextEditingController();
  TextEditingController checkOutController = TextEditingController();
  TextEditingController checkOutOutcomesController = TextEditingController();
  String accountID = '';
  Position _currentPosition;
  String _currentAddress ='';
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  Future checkIn({userID}) async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if(isLocationEnabled==true){

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');

        checkController.loader.value = true;
        final response = await http.post(
            Uri.parse('http://122.15.16.51/crm/api/checkin'),
            headers: {
              'x-api-key': '123456',
            },
            body: {
              'lat': _currentPosition.latitude.toString(),
              'lng': _currentPosition.longitude.toString(),
              'login_user_id': userID,
              'user_name': checkInNameController.text,
              'account_id': accountID,
            });

        if (response.statusCode == 200) {
          checkController.loader.value = false;
          Get.defaultDialog(
              title: 'sucess', content: Text('You are Checked In'));
          homeController.checkIn.value = false;
          homeController.label.value = 'CheckOut';
          homeController.selectedPage.value = 0;
          checkInController = checkOutController;
          print(response.body);
        } else if (response.statusCode == 500) {
          checkController.loader.value = true;
          Get.snackbar(
            "invalid", 'invalid data', snackPosition: SnackPosition.BOTTOM,);
        }
      }
    } on SocketException catch (_) {
      print('not connected');
      Get.defaultDialog(title: "No Internet",content: Text("Please connect to internet"),);
      homeController.checkIn.value = false;
    }

    } else{
      Get.defaultDialog(title: "GPS Off",content: Text("Please turn on GPS"),);
    }
  }


  Future checkOut({userID}) async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if(isLocationEnabled==true){
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        checkController.loader.value = true;
        final response = await http.post(
            Uri.parse('http://122.15.16.51/crm/api/checkout'),
            headers: {
              'x-api-key': '123456',
            },
            body: {
              'lat': _currentPosition.latitude.toString(),
              'lng':_currentPosition.longitude.toString(),
              'login_user_id':userID,
              'meeting_outcome': checkOutOutcomesController.text,
              'account_id': accountID,
            });

        if (response.statusCode == 200) {
          Get.defaultDialog(title: 'sucess',content: Text('You are Checked Out'));
          homeController.checkIn.value= true;
          homeController.label.value ='CheckIn';
          checkController.loader.value = false;
          homeController.selectedPage.value = 0;
          print(response.body);
        } else if(response.statusCode==500){
          Get.snackbar("invalid", 'invalid data', snackPosition: SnackPosition.BOTTOM,);
          checkController.loader.value = false;
        }
      }
    } on SocketException catch (_) {
      print('not connected');
      Get.defaultDialog(title: "No Internet",content: Text("Please connect to internet"),);
    }

    } else{
      Get.defaultDialog(title: "GPS Off",content: Text("Please turn on GPS"),);
    }


  }
  _getCurrentLocation() async {
    LocationPermission permission; permission = await Geolocator.requestPermission();
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, )
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude
      );

      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
@override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: HexColor('#007bff'),
        leading:
            Icon(Icons.account_circle,size: 30,),
        actions: [
          // Icon(Icons.search,size: 30,),
          // SizedBox(width: 10,),
          // Icon(Icons.notifications_active,size: 30,),
        ],

      ),
        body:
        Padding(
            padding: EdgeInsets.all(10),
            child:
                Obx(()=>
                homeController.checkIn.value==true?
                ModalProgressHUD(
                  inAsyncCall: checkController.loader.value,
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 120,),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Container(
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 33),
                                      child: Text("NAME",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),))),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: TextFormField(
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                                  ], // Only numbers can be entered

                                  validator: (v){
                                    if (v.isNotEmpty) {
                                      return null;
                                    }
                                    return 'Please Enter Name';
                                  },
                                 controller: checkInNameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Name',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Container(

                                  child: Text("Check In At",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
                            ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: TypeAheadField<User>(
                          hideSuggestionsOnKeyboardHide: false,
                          textFieldConfiguration: TextFieldConfiguration(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                            ],
                            controller: checkInController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(),
                              hintText: 'Search Account',
                            ),
                          ),
                          suggestionsCallback: UserApi.getUserSuggestions,
                          itemBuilder: (context, User suggestion) {
                            final user = suggestion;
                            return ListTile(
                              title: Text(user.name),
                            );
                          },
                          noItemsFoundBuilder: (context) => Container(
                            height: 100,
                            child: Center(
                              child: Text(
                                'No Account Found.',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                          onSuggestionSelected: (User suggestion) {
                            final user = suggestion;
                            checkInController.text = suggestion.name;
                            accountID = suggestion.value;
                            print(accountID);
                          },
                        ),
                      ),
                    ),

                            // Expanded(
                            //   child: Container(
                            //     padding: EdgeInsets.all(20),
                            //     child: TextFormField(
                            //       validator: (v){
                            //         if (v == null || v.isEmpty) {
                            //           return 'Please Enter checkIN';
                            //         }
                            //         return null;
                            //       },
                            //       controller: checkInController,
                            //       decoration: InputDecoration(
                            //         border: OutlineInputBorder(),
                            //         labelText: 'Check In At',
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(height: 50,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60),
                          child: Container(
                              height: 50,
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: RaisedButton(
                                textColor: Colors.white,
                                color: HexColor('#007bff'),
                                child: Text('Check In'),
                                onPressed: () async {
                                  if(_formKey.currentState.validate()){
                                    _getCurrentLocation();
                                    if(accountID.isNotEmpty&&checkInNameController.value.text.isNotEmpty) {
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                  var id=    prefs.getString('userID',);
                                      checkIn(userID: id);
                                    } else{
                                      Get.defaultDialog(title: 'error',content: Text("Please Select an Account"));
                                    }


                                  }



                                },
                              )),
                        ),
                      ],
                    ),
                  ),
                ):
                ////checkOut//////
                ModalProgressHUD(
                  inAsyncCall: checkController.loader.value,
                  child: Form(
                    key: _formKey2,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 120,),

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 34),
                              child: Container(

                                  child: Text("Check Out At",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: TypeAheadField<User>(
                                  hideSuggestionsOnKeyboardHide: false,
                                  textFieldConfiguration: TextFieldConfiguration(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                                    ],
                                    controller: checkInController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Search Account',
                                    ),
                                  ),
                                  suggestionsCallback: UserApi.getUserSuggestions,
                                  itemBuilder: (context, User suggestion) {
                                    final user = suggestion;

                                    return ListTile(
                                      title: Text(user.name),
                                    );
                                  },
                                  noItemsFoundBuilder: (context) => Container(
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        'No Account Found.',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                    ),
                                  ),
                                  onSuggestionSelected: (User suggestion) {
                                    final user = suggestion;
                                    checkInController.text = suggestion.name;
                                    accountID = suggestion.value;
                                    print(accountID);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 44),
                              child: Container(

                                  child: Text("Outcomes",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: TextFormField(
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                                    ],
                                  validator: (v){
                                    if (v == null || v.isEmpty) {
                                      return 'Please Enter Outcomes';
                                    }
                                    return null;
                                  },
                                  controller: checkOutOutcomesController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Outcomes',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60),
                          child: Container(
                              height: 50,
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: RaisedButton(
                                textColor: Colors.white,
                                color: Colors.blue,
                                child: Text('Check Out'),
                                onPressed: () async {
                                  if(_formKey2.currentState.validate()){

                                    _getCurrentLocation();
                                    if(accountID.isNotEmpty){
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      var id=    prefs.getString('userID',);
                                      checkOut(userID: id);
                                    }else{
                                      Get.defaultDialog(title: 'error',content: Text("Please Select an Account"));
                                    }

                                  }

                                },
                              )),
                        ),

                      ],
                    ),
                  ),
                ))),

                );



  }


}
class User {
  final String name;
  final String value;

  const User({
     this.name,
    this.value
  });

  static User fromJson(Map<String, dynamic> json) => User(
    name: json['label'],
    value: json['value']
  );
}

class UserApi {
  static Future<List<User>> getUserSuggestions(String query) async {

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        final url = Uri.parse('http://122.15.16.51/crm/api/accountlist');
        final response = await http.post(url,    headers: {
          'x-api-key': '123456',
        },
            body: {
              'search': query,
            });
        print(response.body);
        if (response.statusCode == 200) {
          final List users = json.decode(response.body);
          return users.map((json) => User.fromJson(json)).where((user) {
            final nameLower = user.name.toUpperCase().toLowerCase();
            final queryLower = query;

            return nameLower.contains(queryLower.toUpperCase().toLowerCase());
          }).toList();
        }


      }
    } on SocketException catch (_) {
      print('not connected');
      Get.defaultDialog(title: "No Internet",content: Text("Please connect to internet"),);
    }

  }
}