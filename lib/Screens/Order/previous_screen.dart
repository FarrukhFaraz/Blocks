import 'package:flutter/material.dart';

import '../../Utils/color.dart';
import '../../Widgets/theme.dart';

class PreviousOrderScreen extends StatefulWidget {
  const PreviousOrderScreen({Key? key}) : super(key: key);

  @override
  State<PreviousOrderScreen> createState() => _PreviousOrderScreenState();
}

class _PreviousOrderScreenState extends State<PreviousOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          completedorder(),
          completedorder(),
          completedorder(),
        ],
      )),
    );
  }

  Widget completedorder() {
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
                // OrderModel.items[index].price
                //     .toString(),
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
          // const Divider(
          //   thickness: 2,
          //   color: kWhite,
          // ),
          const SizedBox(
            height: 15,
          ),
          // Container(
          //   alignment: Alignment.bottomRight,
          //   width: MediaQuery.of(context).size.width,
          //   child: const Text(
          //       'Cancelled (' ')'
          //       // OrderModel.items[index].reason
          //       //     .toString() +
          //       ,
          //       style: TextStyle(
          //           color: kWhite,
          //           fontSize: 20.0,
          //           fontWeight: FontWeight.bold)),
          // ),
        ],
      ),
    );
  }
}
