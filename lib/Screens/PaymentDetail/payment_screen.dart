import 'package:flutter/material.dart';

import '../../Utils/color.dart';
import '../../Widgets/theme.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: InkWell(
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 25,
              color: kWhite,
            )),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [gradientbluecolor, gradientgreenColor],
          )),
        ),
        backgroundColor: primarycolor,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kWhite,
                boxShadow: [BoxShadow(color: kGrey, blurRadius: 2.0)]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rs.5000',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                    const Text('Waiting payment')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rs.10000',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                    const Text('Payed')
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Important Transaction',
                  style: TextStyle(fontSize: 18),
                ),
                Text('SEE ALL')
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          transection(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          transection(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          transection(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          transection(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          transection(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          transection(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ],
      )),
    );
  }

  Widget transection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              colors: [gradientbluecolor, gradientgreenColor]),

          // color: kWhite,
          boxShadow: [BoxShadow(color: kGrey, blurRadius: 2.0)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ashir',
                    style: TextStyle(fontSize: 18, color: kWhite),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.006,
                  ),
                  Text(
                    'App Developer',
                    style: TextStyle(color: kWhite),
                  )
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Rs.10000',
                style: TextStyle(fontSize: 18, color: kWhite),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.006,
              ),
              Text(
                'You pay on 9 May,2021',
                style: TextStyle(fontSize: 10, color: kWhite),
              )
            ],
          ),
        ],
      ),
    );
  }
}
