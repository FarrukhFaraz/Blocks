import 'package:flutter/material.dart';

import '../Widgets/theme.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
        centerTitle: true,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [gradientbluecolor, gradientgreenColor]))),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            // width: MediaQuery.of(context).size.width / 2.2,
            height: MediaQuery.of(context).size.height * 3.2,
            child: GridView(
              padding: const EdgeInsets.all(4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 0.88,
                //padding: EdgeInsets.all(4),
              ),
              // scrollDirection: Axis.horizontal,
              children: [
                productDesign(),
                productDesign(),
                productDesign(),
                productDesign(),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget productDesign() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage('assets/images/charger.jpg'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width / 2.4,
              child: const Text(
                'Wireless Charger',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          const Text(
            '\$265.2',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
