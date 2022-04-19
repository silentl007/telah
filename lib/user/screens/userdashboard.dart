import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:telah/assets.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: Sizes.w25, right: Sizes.w25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: .9,
                  // enlargeCenterPage: true,
                  // pageSnapping: false,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    // setState(() {
                    //   _current = index;
                    // });
                  }),
              items: [slideItems(Colors.blue), slideItems(Colors.red)],
            ), customDivider(height: Sizes.h20),
            Container(
              width: double.infinity,
              height: Sizes.h90,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(.3)),
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Units',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: Sizes.w18),
                            ),
                            customDivider(height: Sizes.h10),
                            Text(
                              '25',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Sizes.w25,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                  Container(
                    height: Sizes.h50,
                    width: Sizes.h1,
                    color: Colors.grey.withOpacity(.3),
                  ),
                  Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Active Residents',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: Sizes.w18),
                            ),
                            customDivider(height: Sizes.h10),
                            Text(
                              '700',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Sizes.w25,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                  Container(
                    height: Sizes.h50,
                    width: Sizes.h1,
                    color: Colors.grey.withOpacity(.3),
                  ),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Debtors',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: Sizes.w18),
                            ),
                            customDivider(height: Sizes.h10),
                            Text(
                              '25',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Sizes.w25,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
            customDivider(height: Sizes.h20),
            Container(
              width: double.infinity,
              height: Sizes.h90,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.1),
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
              child: Padding(
                padding: EdgeInsets.only(left: Sizes.w30),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: Sizes.w25,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: Sizes.w30,
                        color: Colors.blue.withOpacity(.5),
                      ),
                    ),
                    customVerticalDivider(width: Sizes.w25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text('Account Setup',
                                style: TextStyle(
                                    color: Colors.blue.withOpacity(.5),
                                    fontSize: Sizes.w20,
                                    fontWeight: FontWeight.bold)),
                            customVerticalDivider(width: Sizes.w15),
                            Container(
                              width: Sizes.w50,
                              height: Sizes.h20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Sizes.w20))),
                              child: Center(
                                child: Text(
                                  '3 of 5',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: Sizes.w13),
                                ),
                              ),
                            )
                          ],
                        ),
                        customDivider(height: Sizes.h5),
                        Text('Finish setting up your account',
                            style: TextStyle(
                                color: Colors.grey, fontSize: Sizes.w15))
                      ],
                    )
                  ],
                ),
              ),
            ),
            customDivider(height: Sizes.h20),
            Row(
              children: [
                options(AssetsPath.wallet, 'Payments'),
                customVerticalDivider(width: Sizes.w15),
                options(AssetsPath.expenditure, 'Expenditure'),
                customVerticalDivider(width: Sizes.w15),
                options(AssetsPath.ledger, 'Ledger'),
              ],
            ),
            customDivider(height: Sizes.h40),
            Text(
              'Quick Options',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w20),
            )
          ],
        ),
      ),
    );
  }

  slideItems(Color color) {
    return Padding(
      padding:  EdgeInsets.only(right:Sizes.w20),
      child: Container(
        height: Sizes.h180,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color.withOpacity(.7),
            borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
        child: Padding(
          padding:
              EdgeInsets.only(top: Sizes.h30, left: Sizes.w20, right: Sizes.w20, bottom: Sizes.h20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Current Balance',
                        style: TextStyle(
                            fontSize: Sizes.w20,
                            color: Colors.white.withOpacity(.7)),
                      ),
                      Row(
                        children: [
                          Text('Today',
                              style: TextStyle(
                                  fontSize: Sizes.w18, color: Colors.white)),
                          customVerticalDivider(width: Sizes.w5),
                          ImageIcon(
                            const AssetImage(AssetsPath.env),
                            color: Colors.white,
                            size: Sizes.w15,
                          )
                        ],
                      )
                    ],
                  ),
                  customDivider(height: Sizes.h16),
                  Text('N 4,000,000',
                      style: TextStyle(
                          fontSize: Sizes.w25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ImageIcon(
                        const AssetImage(AssetsPath.env),
                        color: Colors.white,
                        size: Sizes.w15,
                      ),
                      customVerticalDivider(width: Sizes.w5),
                      Text('View analytics',
                          style: TextStyle(
                              fontSize: Sizes.w18, color: Colors.white)),
                    ],
                  ),
                  Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.white.withOpacity(.7),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  options(String iconPath, String item) {
    return Expanded(
        child: Column(
      children: [
        Container(
          height: Sizes.h100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(.3)),
              borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
          child: Center(
            child: Image.asset(
              iconPath,
              width: Sizes.w35,
            ),
          ),
        ),
        customDivider(height: Sizes.h5),
        Text(
          item,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.w20,
              color: Colors.grey),
        )
      ],
    ));
  }
}
