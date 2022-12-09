//import 'dart:html';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iyoutrader/Models/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/theme.dart';
import 'category_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigate() {
    Timer(const Duration(seconds: 3), () {
      id != null?
      //     ? MultiRepositoryProvider(providers: [
      //       RepositoryProvider(create: (context)=>CallCategoryApi())
      // ],
      // child:const HomeScreen())
      Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()))
          :
      MultiRepositoryProvider(providers: [
          RepositoryProvider(create: (context)=>CallCategoryApi())
      ],
      child:const Categories());

      // Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) => const Categories()));
    });
  }

  String? id;
  getid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    id = preferences.getString('id');
    print('id====' + id.toString());
    navigate();
  }

  @override
  void initState() {
    super.initState();
    getid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      //,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [gradientbluecolor, gradientgreenColor],
        )),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.25,
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2.3,
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Image.asset('assets/logo/app-logo.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
