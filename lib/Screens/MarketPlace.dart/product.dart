import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import '../../Utils/color.dart';

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
          backgroundColor: kWhite,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: kBlack,
            ),
          ),
          title: Text(
            'Product Name',
            style: TextStyle(color: kBlack),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Carousel(
                  images: [
                    carasoul('Product Image'),
                    carasoul('Product Image'),
                    carasoul('Product Image'),
                  ],
                  dotSize: 6.0,
                  dotSpacing: 18.0,
                  dotColor: kSkyBlue,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.transparent,
                  borderRadius: false,
                  noRadiusForIndicator: true,
                  overlayShadow: true,
                  dotPosition: DotPosition.bottomCenter,
                  overlayShadowColors: kWhite,
                  overlayShadowSize: 0.7,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product name',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kSkyBlue),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: const Text(
                            'Lorem ipsum dolor sit amet constrector adilpiscing elite, sed driam nonummy nibh euismod tincidunt ut laoreet dolor mangue eliqoum erat volutpat...',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kSkyBlue),
                      child: Icon(
                        Icons.bookmark_outline,
                        color: kWhite,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Specifications',
                  style: TextStyle(
                      color: kRed, fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              specification('- Lorom ipsum dolor sit'),
              specification('- Lorom ipsum dolor sit'),
              specification('- Lorom ipsum dolor sit'),
              specification('- Lorom ipsum dolor sit'),
              specification('- Lorom ipsum dolor sit'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kGrey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 20, top: 8, bottom: 8),
                      child: RichText(
                        text: TextSpan(
                            text: 'HKD 100/',
                            style: TextStyle(
                                fontSize: 20,
                                color: kBlack,
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                  text: 'pc',
                                  style: TextStyle(fontSize: 10, color: kBlack))
                            ]),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2.8,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: kSkyBlue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'BUY NOW',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kWhite),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    productdetail('Product Image', 'Prodcuct Name',
                        'HKD 20.00/', 'pc', const Icon(Icons.bookmark_outline)),
                    productdetail('Product Image', 'Prodcuct Name',
                        'HKD 20.00/', 'pc', const Icon(Icons.bookmark_outline)),
                    productdetail('Product Image', 'Prodcuct Name',
                        'HKD 20.00/', 'pc', const Icon(Icons.bookmark_outline)),
                    productdetail('Product Image', 'Prodcuct Name',
                        'HKD 20.00/', 'pc', const Icon(Icons.bookmark_outline)),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
          //   ],
          // ),
        ));
  }

  Widget specification(String name) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        name,
        style: const TextStyle(
            fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey),
      ),
    );
  }

  Widget carasoul(String title) {
    return Container(
        decoration: BoxDecoration(
            color: kSkyBlue,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            boxShadow: [BoxShadow(color: kGrey, blurRadius: 4.0)]),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ));
  }

  Widget productdetail(
      String image, String name, String price, String pc, Icon icon) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          boxShadow: [BoxShadow(color: kGrey, blurRadius: 4.0)]),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width / 2.2,
            child: Container(
                decoration: BoxDecoration(
                    color: kSkyBlue,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    boxShadow: [BoxShadow(color: kGrey, blurRadius: 4.0)]),
                alignment: Alignment.center,
                child: Text(image)),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: kSkyBlue, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.bookmark_outline,
                        color: kBlack,
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // Container(
                  //   child: Text(
                  //     price,
                  //     maxLines: 3,
                  //     overflow: TextOverflow.ellipsis,
                  //     style: TextStyle(fontSize: 10, color: kGrey),
                  //   ),
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.002,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: price,
                              style: TextStyle(fontSize: 18, color: kSkyBlue),
                              children: [
                                TextSpan(
                                    text: pc,
                                    style: TextStyle(
                                        fontSize: 10, color: kSkyBlue))
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
