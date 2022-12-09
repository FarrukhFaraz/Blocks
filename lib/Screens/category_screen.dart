import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:iyoutrader/Bloc/category/category_bloc.dart';
import 'dart:async';
import '../Models/category.dart';
import '../Models/product.dart';
import '../Utils/color.dart';
import '../Utils/url.dart';
import '../Widgets/drawer.dart';
import '../Widgets/theme.dart';
import 'product_screen.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // getProduct() async {
  //   http.Response response = await http.get(Uri.parse(producturl + '8'));
  //   print(response.body.toString());
  //   Map jsonData = jsonDecode(response.body);
  //   if (jsonData['Message'] == 'Products found successfully') {
  //     for (int i = 0; i < jsonData['Products'].length; i++) {
  //       Map<String, dynamic> obj = jsonData['Products'][i];
  //       Products pos = Products();
  //       pos = Products.fromJson(obj);
  //       _product.add(pos);
  //     }
  //     setState(() {
  //       productloading = false;
  //     });
  //   } else {
  //     setState(() {
  //       productloading = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryBloc(RepositoryProvider.of<CallCategoryApi>(context))
            ..add(LoadApiEvent()),
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [gradientbluecolor, gradientgreenColor],
          )),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'All Categories',
                  style: TextStyle(
                      color: kWhite, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              drawer: const DrawerScreen(),
              body: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CategoryErrorState) {
                    return
                      // ListView.builder(
                      //   itemCount: state.data.length,
                      //   itemBuilder: (context,index){
                      //     return Text(state.message);
                      //   });

                      Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is CategoryLoadedState) {
                    return categoryDesign(state.data);
                  }
                  return Container();
                },
              ))),
    );
  }

  Widget categoryDesign(List<Datum> datum) {
    return GridView.builder(
        itemCount: datum.length,
        // catModel.length, categoryModel!.data.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 4, crossAxisCount: 2, crossAxisSpacing: 0),
        itemBuilder: (context, index) {
          // print('categorybloc===' + );
          print('mmmmmmmmmmmm');
          print('categoryModel' + datum.length.toString());
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                border: Border.all(color: kWhite)),
            child: Container(
              padding: EdgeInsets.all(4),
              child: Text(datum[index].title)
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(20),
              //   child:
              //   Image(
              //     image: NetworkImage(datum[index].image),
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
          );
        });
  }
}
