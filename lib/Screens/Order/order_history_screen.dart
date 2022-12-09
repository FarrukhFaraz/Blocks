import 'package:flutter/material.dart';

import '../../Utils/color.dart';
import '../../Widgets/theme.dart';
import 'cancel_order_screen.dart';
import 'pending_screen.dart';
import 'previous_screen.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
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
          bottom: TabBar(
            indicatorColor: kWhite,
            indicatorWeight: 3.0,
            labelColor: kWhite,
            unselectedLabelColor: Colors.grey.shade300,
            tabs: const [
              Tab(
                child: Text(
                  'Pending',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Tab(
                child: Text(
                  'Completed',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Tab(
                child: Text(
                  'Cancelled',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PendingScreen(),
            PreviousOrderScreen(),
            CancelOrderScreen()
          ],
        ),
      ),
    );
  }
}
