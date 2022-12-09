import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/color.dart';
import '../Widgets/theme.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  String email = '';
  String phone = '';
  String type = '';

  getAllData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getString('username').toString();
    email = preferences.getString('useremail').toString();
    type = preferences.getString('type').toString();
    phone = preferences.getString('usernumber').toString();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [gradientbluecolor, gradientgreenColor])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [gradientbluecolor, gradientgreenColor]))),
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: kWhite),
          leading: InkWell(
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/images/backarrow.png',
              height: 25,
              width: 25,
              color: kWhite,
            ),
          ),
          elevation: 0,
          backgroundColor: kWhite,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo/app-logo.png',
                    height: 250,
                    width: 250,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ashir',
                          //   name,

                          style: TextStyle(fontSize: 20, color: kWhite),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 14),
                            child: Icon(
                              Icons.person,
                              color: kWhite,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Divider(
                      color: kWhite,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ashir@gmail.com',
                          //  email,
                          style: TextStyle(fontSize: 20, color: kWhite),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 14),
                          child: Icon(
                            Icons.email_outlined,
                            color: kWhite,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Divider(
                      color: kWhite,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '03121234567',
                          //  phone,
                          style: TextStyle(fontSize: 20, color: kWhite),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 14),
                          child: Icon(
                            Icons.wifi_calling_3,
                            color: kWhite,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Divider(
                      color: kWhite,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Text(
                            'this is address',
                            //   type,
                            style: TextStyle(fontSize: 20, color: kWhite),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 14),
                          child: Icon(
                            Icons.home,
                            color: kWhite,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Divider(
                      color: kWhite,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
