import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../Utils/color.dart';
import '../../Widgets/theme.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({Key? key}) : super(key: key);

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  int _groupValue = -1;
  String? reason;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          pendingorder(),
          pendingorder(),
          pendingorder(),
          pendingorder(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ],
      )),
    );
  }

  Widget pendingorder() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 8),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [gradientbluecolor, gradientgreenColor],
          ),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      width: MediaQuery.of(context).size.width / 1.05,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/logo/app-logo.png',
                height: 50,
                width: 100,
              ),
              Text(
                'Rs 3000',
                style: TextStyle(
                    color: kWhite, fontSize: 20.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(
            thickness: 2,
            color: kWhite,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Id #  230',
                // OrderModel.items[index].id
                //     .toString(),
                style: TextStyle(
                    color: kWhite, fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                '01/01/2022',
                style: TextStyle(
                    color: kWhite, fontSize: 20.0, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(
            thickness: 2,
            color: kWhite,
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () => showCancelpopUp(context),
            child: Container(
              alignment: Alignment.bottomRight,
              width: MediaQuery.of(context).size.width,
              child: Text(
                  'Cancel'
                  // OrderModel.items[index].reason
                  //     .toString() +
                  ,
                  style: TextStyle(
                      color: kWhite,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Future showCancelpopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              color: kWhite,
              //   height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [gradientbluecolor, gradientgreenColor]),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 65.0),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Image.asset(
                          'assets/logo/app-logo.png',
                          height: 350,
                          width: 400,
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  SizedBox(
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Text(
                      'Give the reason to cancel the order',
                      style: TextStyle(
                          fontSize: 22,
                          //         fontStyle: FontStyle.italic,
                          color: kBlack,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Row(children: [
                      Radio(
                          value: 1,
                          groupValue: _groupValue,
                          onChanged: (val) {
                            setState(() {
                              _groupValue = val as int;
                              reason = 'The driver is too late';
                            });
                          }),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          'The driver is too late',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: kBlack,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Row(children: [
                      Radio(
                          value: 2,
                          groupValue: _groupValue,
                          onChanged: (val) {
                            setState(() {
                              _groupValue = val as int;
                              reason = 'Rates are very high';
                            });
                          }),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          'Rates are very high',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: kBlack,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Row(children: [
                      Radio(
                          value: 3,
                          groupValue: _groupValue,
                          onChanged: (val) {
                            setState(() {
                              _groupValue = val as int;
                              reason = "Don't Like  Service";
                            });
                          }),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          "Don't Like  Service",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: kBlack,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Row(children: [
                      Radio(
                          value: 4,
                          groupValue: _groupValue,
                          onChanged: (val) {
                            setState(() {
                              _groupValue = val as int;
                              reason = "Other's";
                            });
                          }),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          "Other's",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: kBlack,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      // _groupValue == -1
                      //     ? Toast.show(
                      //         'Please select any reason to cancel the order',
                      //         context,
                      //         duration: Toast.LENGTH_LONG,
                      //         gravity: Toast.BOTTOM)
                      //     : _showCancelOrderpopup(context);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [gradientbluecolor, gradientgreenColor]),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'Cancel order',
                        style: TextStyle(
                            color: kWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
