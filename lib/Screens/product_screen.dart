import 'package:flutter/material.dart';

import '../Widgets/theme.dart';
import 'product_detail_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charger'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientbluecolor, gradientgreenColor])),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          GestureDetector(
            onTap: () {
              print('helo');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductDetailScreen()));
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              // width: MediaQuery.of(context).size.width / 2.2,
              height: MediaQuery.of(context).size.height * 3.6,
              child: GridView(
                padding: const EdgeInsets.all(4),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6.0,
                  crossAxisSpacing: 4.0,
                  childAspectRatio: 0.7,
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Text(
                    '  \$265.2',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Icon(Icons.favorite_outline),
              )
            ],
          )
        ],
      ),
    );
  }
}
