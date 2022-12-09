import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Utils/color.dart';
import '../Widgets/theme.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  _openwhatsapp() async {
    var whatsapp = '+923027329819';
    var whatsappURl_android =
        'whatsapp://send?phone=' + whatsapp + '&text=hello';
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('whatsapp no installed')));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('whatsapp no installed')));
      }
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Image.asset('assets/logo/app-logo.png'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Center(
                child: Text(
                  'I You Trader trading app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kWhite, fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              InkWell(
                highlightColor: Colors.transparent,
                onTap: _openwhatsapp,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 25, 178, 238),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text('Contact us on WhatsApp',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kWhite,
                                  fontSize: 18.0)),
                        ),
                        Container(
                            height: 44,
                            margin: const EdgeInsets.only(right: 10),
                            child: const Image(
                              image: AssetImage(
                                  'assets/images/whatsappiconmam.png'),
                              fit: BoxFit.cover,
                            )),
                      ]),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _makePhoneCall('tel:03001761619');
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 25, 178, 238),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text('Call us on +92 300 1234567',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kWhite,
                                  fontSize: 18.0)),
                        ),
                        Container(
                            height: 40,
                            margin: const EdgeInsets.only(right: 10),
                            child: const Image(
                              image:
                                  AssetImage('assets/images/phoneiconmam.png'),
                              fit: BoxFit.cover,
                            )),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
