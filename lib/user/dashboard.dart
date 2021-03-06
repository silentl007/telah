import 'package:flutter/material.dart';
import 'package:telah/assets.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';
import 'package:telah/user/screens/userdashboard.dart';
import 'package:telah/user/screens/properties.dart';
import 'package:telah/user/screens/user.dart';
import 'package:telah/user/screens/wallet.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  List<BottomNav> bottomNav = [
    BottomNav(iconPath: AssetsPath.dashboard, name: 'Dashboard'),
    BottomNav(iconPath: AssetsPath.property, name: 'Properties'),
    BottomNav(iconPath: AssetsPath.users, name: 'User'),
    BottomNav(iconPath: AssetsPath.wallet, name: 'Wallet'),
    BottomNav(iconPath: AssetsPath.more, name: 'More'),
  ];
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    List screens = [
      const UserDashboard(),
      const Properties(),
      const User(),
      const Wallet()
    ];
    return SafeArea(
      child: Scaffold(
        appBar: _currentIndex == 0
            ? AppBar(
                toolbarHeight: 100,
                automaticallyImplyLeading: false,
                // leading: Padding(
                //   padding: EdgeInsets.only(left: Sizes.w10),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Colors.red
                //     ),
                //     child: Image.asset(
                //       AssetsPath.house,
                //       width: Sizes.w20,
                //       height: Sizes.h30,
                //     ),
                //   ),
                // ),
                backgroundColor: Colors.white,
                title: Row(
                  children: [
                    Container(
                      width: Sizes.w50,
                      height: Sizes.h50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.w10),
                        image:const DecorationImage(
                            image: AssetImage(AssetsPath.house)),
                      ),
                    ),
                    customVerticalDivider(width: Sizes.w10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sage Estate',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Sizes.w20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Gwarimpa, Abuja',
                          style: TextStyle(
                              color: Colors.grey, fontSize: Sizes.w15),
                        ),
                      ],
                    ),
                  ],
                ),
                actions: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: Sizes.h10, right: Sizes.w10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          const AssetImage(AssetsPath.env),
                          color: Colors.black,
                          size: Sizes.w25,
                        ),
                        customVerticalDivider(width: Sizes.w15),
                        Image.asset(
                          AssetsPath.bell,
                          width: Sizes.w25,
                        )
                      ],
                    ),
                  )
                ],
                elevation: 0,
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
            iconSize: Sizes.w20,
            showUnselectedLabels: true,
            selectedItemColor: Colors.blue,
            selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal, color: Colors.grey),
            currentIndex: _currentIndex,
            onTap: (index) {
              if (index == 4) {
              } else {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            type: BottomNavigationBarType.fixed,
            items: bottomNav
                .map((data) => BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(data.iconPath!)),
                    label: data.name))
                .toList()),
        body: WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: screens[_currentIndex]),
      ),
    );
  }
}

class BottomNav {
  String? iconPath;
  String? name;
  BottomNav({required this.iconPath, required this.name});
}
