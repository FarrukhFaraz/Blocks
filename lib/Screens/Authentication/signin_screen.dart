import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:toast/toast.dart';

import '../../Utils/color.dart';
import '../../Utils/url.dart';
import '../../Widgets/theme.dart';
import '../category_screen.dart';

String? username2;
String? useremail2;
String? usernumber2;
String? type2;
int? id2;

TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool islogin = false;

  getLogin() async {
    setState(() {
      islogin = true;
    });
    // ignore: omit_local_variable_types
    Map mapBody = {
      'email': emailcontroller.text,
      'password': passwordcontroller.text,
    };
    // ignore: omit_local_variable_types
    http.Response response =
        await http.post(Uri.parse(loginurl), body: mapBody);
    print('login===' + response.body.toString());
    Map jsonData = jsonDecode(response.body);
    if (jsonData['Message'] == 'Data found Successfully') {
      Map obj = jsonData['login'];
      id2 = obj['id'];
      username2 = obj['name'];
      print('usermanrw' + username2.toString());
      useremail2 = obj['email'];
      usernumber2 = obj['number'];
      type2 = obj['type'];
      // ignore: omit_local_variable_types
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('id', id2.toString());
      await sharedPreferences.setString('username', username2.toString());
      await sharedPreferences.setString('useremail', useremail2.toString());
      await sharedPreferences.setString('usernumber', usernumber2.toString());
      await sharedPreferences.setString('type', type2.toString());
      setState(() {
        islogin = false;
      });
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Categories()));
    } else {
      setState(() {
        islogin = false;
      });
      Toast.show('Incorrect email or password',
          gravity: Toast.bottom, duration: Toast.lengthLong);
    }
  }

  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          // begin: Alignment.topCenter,
          // end: Alignment.bottomCenter,
          colors: [gradientbluecolor, gradientgreenColor],
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Image.asset('assets/logo/app-logo.png'),
                ),
              ),
              Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: kWhite, fontWeight: FontWeight.w600, fontSize: 30),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: kWhite60,
                    ))),
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Icon(
                          Icons.alternate_email_sharp,
                          color: kWhite,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: TextFormField(
                            controller: emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Email',
                                labelText: 'Email',
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                    color: kWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                                hintStyle:
                                    TextStyle(color: kWhite, fontSize: 20)),
                            style: TextStyle(color: kWhite, fontSize: 18),
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: kWhite60,
                    ))),
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Icon(
                          Icons.vpn_key_outlined,
                          color: kWhite,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          width: MediaQuery.of(context).size.width / 1.36,
                          child: TextFormField(
                            controller: passwordcontroller,
                            obscureText: _passwordVisible ? false : true,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                labelText: 'Password',
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kWhite,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                labelStyle:
                                    TextStyle(color: kWhite, fontSize: 18),
                                hintStyle:
                                    TextStyle(color: kWhite, fontSize: 18)),
                            style: TextStyle(color: kWhite, fontSize: 18),
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 80),
                child: InkWell(
                  onTap: () {
                    // getLogin();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Categories()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black38),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.068,
                        margin: const EdgeInsets.only(left: 4, right: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 25, 178, 238)),
                        alignment: Alignment.center,
                        child: islogin == true
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: kWhite,
                                ),
                              )
                            : Image.asset(
                                'assets/right-arrow.png',
                                color: kWhite,
                              )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
