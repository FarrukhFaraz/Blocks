import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iyoutrader/summary.dart';

import '../Screens/Order/order_history_screen.dart';
import '../Screens/PaymentDetail/payment_screen.dart';
import '../Screens/favourite_screen.dart';
import '../Screens/profile_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Drawer(
          child: ListView(
        children: [
          Image.asset('assets/logo/app-logo.png'),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          ListTile(
            title: Text(
              'Orders',
            ),
            leading: Icon(CupertinoIcons.bag),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderHistoryScreen()));
            },
          ),
          ListTile(
            title: Text(
              'Favourite',
            ),
            leading: Icon(CupertinoIcons.heart),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavouriteScreen()));
            },
          ),
          ListTile(
            title: Text('Pending payments'),
            leading: Icon(Icons.payment),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()));
            },
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.login),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SummarizeScreen()));
            },
          ),
        ],
      )),
    );
  }
}
