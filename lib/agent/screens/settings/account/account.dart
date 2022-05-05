import 'package:flutter/material.dart';
import 'package:telah/agent/screens/settings/account/editaccount.dart';
import 'package:telah/agent/screens/settings/account/updateaddress.dart';
import 'package:telah/agent/screens/settings/account/updatebank.dart';
import 'package:telah/assets.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: UserWidgets().appbar(
            context: context,
            title: 'Account',
            action: actionAppbar(context),
            hasAction: true),
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h20,
                left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: Sizes.h60,
                    width: Sizes.h60,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(Sizes.w10)),
                        color: Colors.blue.withOpacity(.3)),
                    child: Center(
                      child: Text(
                        'JD',
                        style:
                            TextStyle(color: Colors.blue, fontSize: Sizes.w25),
                      ),
                    ),
                  ),
                ),
                customDivider(height: Sizes.h60),
                Row(
                  children: [
                    ImageIcon(
                      const AssetImage(AssetsPath.property),
                      size: Sizes.w20,
                      color: Colors.grey,
                    ),
                    customVerticalDivider(width: Sizes.w10),
                    Text('Estate name',
                        style:
                            TextStyle(color: Colors.grey, fontSize: Sizes.w13))
                  ],
                ),
                customDivider(height: Sizes.h10),
                Text('Sage Estates',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.w15)),
                customDivider(height: Sizes.h15),
                Row(
                  children: [
                    ImageIcon(
                      const AssetImage(AssetsPath.manageby),
                      size: Sizes.w20,
                      color: Colors.grey,
                    ),
                    customVerticalDivider(width: Sizes.w10),
                    Text('Managed by',
                        style:
                            TextStyle(color: Colors.grey, fontSize: Sizes.w13))
                  ],
                ),
                customDivider(height: Sizes.h10),
                Text('John Doe',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.w15)),
                customDivider(height: Sizes.h15),
                Row(
                  children: [
                    ImageIcon(
                      const AssetImage(AssetsPath.email),
                      size: Sizes.w20,
                      color: Colors.grey,
                    ),
                    customVerticalDivider(width: Sizes.w10),
                    Text('Contact Email',
                        style:
                            TextStyle(color: Colors.grey, fontSize: Sizes.w13))
                  ],
                ),
                customDivider(height: Sizes.h10),
                Text('johndoe@gmail.com',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.w15)),
                customDivider(height: Sizes.h15),
                Row(
                  children: [
                    ImageIcon(
                      const AssetImage(AssetsPath.phone),
                      size: Sizes.w20,
                      color: Colors.grey,
                    ),
                    customVerticalDivider(width: Sizes.w10),
                    Text('Phone',
                        style:
                            TextStyle(color: Colors.grey, fontSize: Sizes.w13))
                  ],
                ),
                customDivider(height: Sizes.h10),
                Text('+2348038474317',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.w15)),
                customDivider(height: Sizes.h15),
                Row(
                  children: [
                    ImageIcon(
                      const AssetImage(AssetsPath.location),
                      size: Sizes.w20,
                      color: Colors.grey,
                    ),
                    customVerticalDivider(width: Sizes.w10),
                    Text('Location',
                        style:
                            TextStyle(color: Colors.grey, fontSize: Sizes.w13))
                  ],
                ),
                customDivider(height: Sizes.h10),
                Text('Abuja',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.w15)),
                customDivider(height: Sizes.h50),
                Container(
                  height: Sizes.h130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.15),
                      borderRadius:
                          BorderRadius.all(Radius.circular(Sizes.w15))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Account Details',
                          style: TextStyle(
                              color: Colors.grey, fontSize: Sizes.w15)),
                      customDivider(height: Sizes.h5),
                      Text('United Bank for Africa',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.w15)),
                      customDivider(height: Sizes.h5),
                      Text('2084393977',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Sizes.w15)),
                      customDivider(height: Sizes.h5),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> actionAppbar(BuildContext context) {
    return [
      PopupMenuButton(
        onSelected: (result) {
          if (result == 0) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EditAccount()));
          } else if (result == 1) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const UpdateBank()));
          } else if (result == 2) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const UpdateAdress()));
          }
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Sizes.w15))),
        icon: const Icon(Icons.view_list, color: Colors.black),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 0,
            child: Row(
              children: [
                ImageIcon(
                  const AssetImage(
                    AssetsPath.edit,
                  ),
                  color: Colors.grey,
                  size: Sizes.w15,
                ),
                customVerticalDivider(width: Sizes.w10),
                Text(
                  "Edit",
                  style: TextStyle(color: Colors.grey, fontSize: Sizes.w18),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 1,
            child: Row(
              children: [
                ImageIcon(
                  const AssetImage(
                    AssetsPath.changebank,
                  ),
                  color: Colors.grey,
                  size: Sizes.w15,
                ),
                customVerticalDivider(width: Sizes.w10),
                Text(
                  "Change bank account",
                  style: TextStyle(color: Colors.grey, fontSize: Sizes.w18),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Row(
              children: [
                ImageIcon(
                  const AssetImage(
                    AssetsPath.location,
                  ),
                  color: Colors.grey,
                  size: Sizes.w15,
                ),
                customVerticalDivider(width: Sizes.w10),
                Text(
                  "Edit address",
                  style: TextStyle(color: Colors.grey, fontSize: Sizes.w18),
                ),
              ],
            ),
          ),
        ],
      )
    ];
  }
}
