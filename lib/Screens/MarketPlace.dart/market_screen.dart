import 'package:flutter/material.dart';

import '../../Utils/color.dart';
import '../../Widgets/bootom_navigation_bar.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return ContentWithBottomNavigationBar(
      appbarTitle: 'Market Place',
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            // margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: kWhite,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                boxShadow: [BoxShadow(color: kGrey, blurRadius: 4.0)]),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                      decoration: BoxDecoration(color: kSkyBlue,
                          // borderRadius: const BorderRadius.only(
                          //     topLeft: Radius.circular(12),
                          //     topRight: Radius.circular(12)),

                          boxShadow: [
                            BoxShadow(color: kGrey, blurRadius: 4.0)
                          ]),
                      alignment: Alignment.center,
                      child: const Text(
                        'Product Image',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
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
                              'Product',
                              style: TextStyle(
                                  color: kSkyBlue, fontWeight: FontWeight.bold),
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
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.8,
                                      child: Text(
                                        'Lorem ipsum dolor sit amet constrector adilpiscing elite, sed driam nonummy nibh euismod tincidunt ut laoreet dolor mangue eliqoum erat volutpat...',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: kGrey, fontSize: 14),
                                      )),
                                  RichText(
                                    text: TextSpan(
                                        text: 'HKD 10.00/',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: kSkyBlue,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: 'pc.',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: kSkyBlue))
                                        ]),
                                  ),
                                ],
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
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: const [
                ProductTabListTile(
                  name: 'Product Name',
                  description:
                      'Lorem ipsum dolor sit amet constrector adilpiscing elite, sed driam nonummy nibh euismod tincidunt ut laoreet dolor mangue eliqoum erat volutpat...',
                ),
                ProductTabListTile(
                  name: 'Product Name',
                  description:
                      'Lorem ipsum dolor sit amet constrector adilpiscing elite, sed driam nonummy nibh euismod tincidunt ut laoreet dolor mangue eliqoum erat volutpat...',
                ),
                ProductTabListTile(
                  name: 'Product Name',
                  description:
                      'Lorem ipsum dolor sit amet constrector adilpiscing elite, sed driam nonummy nibh euismod tincidunt ut laoreet dolor mangue eliqoum erat volutpat...',
                ),
                ProductTabListTile(
                  name: 'Product Name',
                  description:
                      'Lorem ipsum dolor sit amet constrector adilpiscing elite, sed driam nonummy nibh euismod tincidunt ut laoreet dolor mangue eliqoum erat volutpat...',
                ),
                ProductTabListTile(
                  name: 'Product Name',
                  description:
                      'Lorem ipsum dolor sit amet constrector adilpiscing elite, sed driam nonummy nibh euismod tincidunt ut laoreet dolor mangue eliqoum erat volutpat...',
                ),
                ProductTabListTile(
                  name: 'Product Name',
                  description:
                      'Lorem ipsum dolor sit amet constrector adilpiscing elite, sed driam nonummy nibh euismod tincidunt ut laoreet dolor mangue eliqoum erat volutpat...',
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class ProductTabListTile extends StatelessWidget {
  final String name;
  final String description;
  const ProductTabListTile(
      {required this.description, required this.name, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 4, 14, 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: kGrey,
              blurRadius: 4.0,
            )
          ]),
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width / 2.8,
            child: Container(
                decoration: BoxDecoration(
                  color: kSkyBlue,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                ),
                alignment: Alignment.center,
                child: const Text('Product\n Image')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:
                      TextStyle(color: kSkyBlue, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10, color: kGrey),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'HKD 10.00/',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: kSkyBlue,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                      text: 'pc.',
                                      style: TextStyle(
                                          fontSize: 12, color: kSkyBlue))
                                ]),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.bookmark_outline,
                        color: kGrey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
