import 'package:flutter/material.dart';
import '../Utils/color.dart';
import '../Widgets/theme.dart';

import 'Authentication/signin_screen.dart';
import 'Authentication/signup_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [gradientbluecolor, gradientgreenColor],
          )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15),
                      child: Text(
                        'I You Trade',
                        style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 36),
                      )),
                ),
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Image.asset('assets/logo/app-logo.png'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SigninScreen()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: kBlack38),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.068,
                        margin: const EdgeInsets.only(left: 4, right: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 25, 178, 238)),
                        alignment: Alignment.center,
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 20,
                              color: kWhite,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: kBlack38),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.068,
                        margin: const EdgeInsets.only(left: 4, right: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 25, 178, 238)),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'Create account for purchaser',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: kWhite,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactUsScreen()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: kBlack38),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.068,
                        margin: const EdgeInsets.only(left: 4, right: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 25, 178, 238)),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(6),
                        child: Text(
                          'Create account for seller',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: kWhite),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
