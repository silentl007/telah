import 'package:flutter/material.dart';
import 'package:telah/agent/screens/messages.dart';
import 'package:telah/agent/screens/noproperty.dart';
import 'package:telah/agent/screens/notifications.dart';
import 'package:telah/agent/screens/agentdash.dart';
import 'package:telah/assets.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class AgentDashboard extends StatefulWidget {
  const AgentDashboard({Key? key}) : super(key: key);

  @override
  State<AgentDashboard> createState() => _AgentDashboardState();
}

class _AgentDashboardState extends State<AgentDashboard> {
  bool? haveProperty = true;
  int _currentIndex = 0;
  List<BottomNav> bottomNav = [
    BottomNav(iconPath: AssetsPath.dashboard, name: 'Dashboard'),
    BottomNav(iconPath: AssetsPath.property, name: 'Notifications'),
    BottomNav(iconPath: AssetsPath.users, name: 'Messages'),
    BottomNav(iconPath: AssetsPath.more, name: 'More'),
  ];
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    List screens = [
      const AgentDash(),
      const Notifications(),
      const Messages(),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Sizes.h100,
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
                  image:
                      const DecorationImage(image: AssetImage(AssetsPath.john)),
                ),
              ),
              customVerticalDivider(width: Sizes.w10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hi, John',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.w20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Room 2, Sage Estate...',
                    style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(bottom: Sizes.h10, right: Sizes.w10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if(haveProperty!){
                          haveProperty = false;
                        } else {
                          haveProperty = true;
                        }
                      });
                    },
                    child: ImageIcon(
                      const AssetImage(AssetsPath.copy),
                      color: Colors.black,
                      size: Sizes.w25,
                    ),
                  ),
                  customVerticalDivider(width: Sizes.w15),
                  Image.asset(
                    AssetsPath.trans,
                    width: Sizes.w25,
                  )
                ],
              ),
            )
          ],
          elevation: 0,
        ),
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
              if (index == 3) {
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
            child: _currentIndex == 0 && haveProperty == false
                ? const NoProperty()
                : screens[_currentIndex]),
      ),
    );
  }
}

class BottomNav {
  String? iconPath;
  String? name;
  BottomNav({required this.iconPath, required this.name});
}
