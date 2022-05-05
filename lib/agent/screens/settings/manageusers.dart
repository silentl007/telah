import 'package:flutter/material.dart';
import 'package:telah/agent/screens/settings/inviteusers.dart';
import 'package:telah/assets.dart';
import 'package:telah/common/decor.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';
import 'package:telah/user/screens/user.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({Key? key}) : super(key: key);

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  List<Users> userList = [
    Users(name: 'John Doe', title: 'Landlord', imagePath: AssetsPath.john),
    Users(name: 'John Doe', title: 'Chairman', imagePath: AssetsPath.john),
    Users(
        name: 'John Doe',
        title: 'Financial secretary',
        imagePath: AssetsPath.john),
    Users(name: 'John Doe', title: 'Secretary', imagePath: AssetsPath.john),
    Users(name: 'John Doe', title: 'Security', imagePath: AssetsPath.john),
    Users(
        name: 'John Doe',
        title: 'Facility manager',
        imagePath: AssetsPath.john),
    Users(name: 'John Doe', title: 'Agent', imagePath: AssetsPath.john),
  ];
  String filter = 'All';
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: UserWidgets().appbar(context: context, title: 'Manage users'),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InviteUsers()));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h20,
                left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  style: TextStyle(fontSize: Sizes.w13),
                  keyboardType: TextInputType.name,
                  decoration: Decor().formDecor(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(15),
                        child: ImageIcon(
                          AssetImage(AssetsPath.search),
                        ),
                      ),
                      context: context,
                      labelText: 'Search billing groups'),
                ),
                customDivider(height: Sizes.h25),
                PopupMenuButton(
                    child: Container(
                      width: Sizes.w70,
                      height: Sizes.h25,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              BorderRadius.all(Radius.circular(Sizes.w5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            filter,
                            style: TextStyle(fontSize: Sizes.w12),
                          ),
                          customVerticalDivider(width: Sizes.w5),
                          Image.asset(
                            AssetsPath.arrowdown,
                            width: Sizes.w15,
                          )
                        ],
                      ),
                    ),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              onTap: () {
                                setState(() {
                                  filter = 'All';
                                });
                              },
                              child: const Text('All')),
                          PopupMenuItem(
                              onTap: () {
                                setState(() {
                                  filter = 'Few';
                                });
                              },
                              child: const Text('Few'))
                        ]),
                // GestureDetector(
                //   onTap: (){

                //   },
                //   child: Container(
                //    width: Sizes.w60,
                //    height: Sizes.h25,
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.grey),
                //       borderRadius: BorderRadius.all(Radius.circular(Sizes.w5))
                //     ),
                //     child: Center(child: Text(filter, style: TextStyle(fontSize: Sizes.w12),)),
                //   ),
                // ),
                customDivider(height: Sizes.h25),
                Column(
                  children: userList
                      .map((e) => Padding(
                            padding: EdgeInsets.only(bottom: Sizes.h15),
                            child: Row(
                              children: [
                                Container(
                                  height: Sizes.h50,
                                  width: Sizes.h60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Sizes.w15)),
                                      image: DecorationImage(
                                          image: AssetImage(e.imagePath!))),
                                ),
                                customVerticalDivider(width: Sizes.w10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.name!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Sizes.w15),
                                    ),
                                    Text(
                                      e.title!,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: Sizes.w12),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))
                      .toList(),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}

class Users {
  String? name;
  String? title;
  String? imagePath;
  Users({this.name, this.title, this.imagePath});
}
