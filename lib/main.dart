import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iyoutrader/Models/category.dart';
import 'package:iyoutrader/Models/new_category.dart';

import 'Models/new_cat_model.dart';
import 'Screens/new_cat_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IYouTrade',
      debugShowCheckedModeBanner: false,
      home: MultiRepositoryProvider(providers: [
        RepositoryProvider(create: (context) => CallCategoryApi()),
        RepositoryProvider(create: (context) => classApi()),
        RepositoryProvider(create: (context) => getCatApi())
      ], child: NewCatScreen()),
    );
  }
}
