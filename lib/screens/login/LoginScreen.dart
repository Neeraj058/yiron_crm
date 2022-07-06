import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../home/view/dashboard.dart';
import 'loginController.dart';




class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  LoginController loginController = LoginController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#007bff'),
          title: Text('Yiron CRM'),
        ),
        body:
        Obx(()=>
            ModalProgressHUD(
              inAsyncCall: loginController.isloading.value,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 120,
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: HexColor('#007bff'),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30),
                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (v){
                              if (v == null || v.isEmpty) {
                                return 'Please Enter Username';
                              }
                              return null;
                            },
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            validator: (v){
                              if (v == null || v.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            //forgot password screen
                          },
                          textColor: HexColor('#007bff'),
                          child: Text('Forgot Password'),
                        ),
                        Container(
                            height: 50,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: HexColor('#007bff'),
                              child: Text('Login'),
                              onPressed: () async {
                                if(_formKey.currentState.validate()){
                                  loginController.isloading.value = true;
                                  loginController.loginData(email: nameController.text,password: passwordController.text,context: context);
                                }
                              },
                            )),
                        Container(
                            child: Row(
                              children: <Widget>[
                                Text('Does not have account?'),
                                FlatButton(
                                  textColor: HexColor('#007bff'),
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Get.to(DashBoard);
                                  },
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ))
                      ],
                    ),
                  )),
            ))
        );

  }
}
