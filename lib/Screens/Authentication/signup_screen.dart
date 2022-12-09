import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../../Utils/color.dart';
import '../../Utils/url.dart';
import '../../Widgets/theme.dart';
import '../category_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  String? username;
  String? useremail;
  String? usernumber;
  String? type;
  int? id;

  getSignup() async {
    // ignore: omit_local_variable_types
    Map mapBody = {
      'name': _namecontroller.text,
      'email': _emailcontroller.text,
      'password': _passwordcontroller.text,
      'type': 'buyer',
      'number': _phonecontroller.text,
    };
    http.Response response =
        await http.post(Uri.parse(signupurl), body: mapBody);
    print('login===' + response.body.toString());
    Map jsonData = jsonDecode(response.body);

    if (jsonData['Message'] == 'Registered successfully.') {
      Map obj = jsonData['Self Registeration:'];
      // id = obj['id'];
      // username = obj['name'];
      // useremail = obj['email'];
      // usernumber = obj['number'];
      // type = obj['type'];
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('id', id.toString());
      await sharedPreferences.setString('username', username.toString());
      await sharedPreferences.setString('useremail', useremail.toString());
      await sharedPreferences.setString('usernumber', usernumber.toString());
      await sharedPreferences.setString('type', type.toString());

      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Categories()));
    } else if (jsonData['Message'] == 'Validation Error!') {
      Toast.show('The email has already been taken',
          duration: Toast.lengthLong, gravity: Toast.bottom);
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
                  'Create account',
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
                    //         height: 60,
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
                          Icons.person,
                          color: kWhite,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: TextFormField(
                            controller: _namecontroller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Username',
                                labelText: 'Username',
                                border: InputBorder.none,
                                labelStyle:
                                    TextStyle(color: kWhite, fontSize: 20),
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
                    //         height: 60,
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
                            controller: _emailcontroller,
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
                    //         height: 60,
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
                          Icons.wifi_calling_3_sharp,
                          color: kWhite,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: TextFormField(
                            controller: _phonecontroller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Phone Number',
                                labelText: 'Phone Number',
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
                    //  height: 60,
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
                            controller: _passwordcontroller,
                            obscureText: _passwordVisible ? false : true,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                labelText: 'Password',
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kWhite,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
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
                    )
                    //  Row(
                    //   crossAxisAlignment: CrossAxisAlignment.end,
                    //   children: [
                    //     // Container(
                    //     //   // height: 30,
                    //     //   // width: 30,
                    //     //   child: Icon(
                    //     //     Icons.alternate_email,
                    //     //     color: kWhite,
                    //     //   ),
                    //     // ),
                    //     Container(
                    //       alignment: Alignment.bottomLeft,
                    //       width: MediaQuery.of(context).size.width / 1.5,
                    //       child: TextFormField(
                    //         decoration: InputDecoration(
                    //             hintText: 'Email',
                    //             labelText: 'Email',
                    //             border: InputBorder.none,
                    //             labelStyle: TextStyle(
                    //                 color: kWhite, fontSize: 18),
                    //             hintStyle: TextStyle(
                    //                 color: kWhite, fontSize: 18)),
                    //       ),
                    //     )
                    //   ],
                    // ),

                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 80),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Categories()));
                  },
                  // getSignup,
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
                        child: Image.asset(
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
