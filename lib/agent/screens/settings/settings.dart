import 'package:flutter/material.dart';
import 'package:telah/agent/screens/settings/account/account.dart';
import 'package:telah/agent/screens/settings/accountsetting.dart';
import 'package:telah/agent/screens/settings/billinggroup.dart';
import 'package:telah/agent/screens/settings/changepass.dart';
import 'package:telah/agent/screens/settings/manageusers.dart';
import 'package:telah/assets.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Options> securityOptions = [
      Options(title: 'Profile', imagePath: AssetsPath.profile),
      Options(title: 'Account Settings', imagePath: AssetsPath.accsettings),
      Options(title: 'Billing Groups', imagePath: AssetsPath.billgroup),
      Options(title: 'Manage Users', imagePath: AssetsPath.manageuser),
      Options(title: 'Change Password', imagePath: AssetsPath.changepass),
    ];
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: UserWidgets().appbar(context: context, title: 'Settings'),
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h20,
                // left: Sizes.w20,
                // right: Sizes.w20,
                bottom: Sizes.w10),
            child: Column(
              children: [
                Column(
                  children: securityOptions
                      .map((data) => Padding(
                            padding: EdgeInsets.only(bottom: Sizes.h15),
                            child: ListTile(
                              onTap: () {
                                navigate(data.title!, context);
                              },
                              leading: Image.asset(data.imagePath!),
                              title: Text(data.title!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Sizes.w15,
                                      color: Colors.black)),
                              trailing: Image.asset(
                                AssetsPath.arrowright,
                                width: Sizes.w30,
                              ),
                            ),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  navigate(String direction, BuildContext context) {
    if (direction == 'Profile') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Account()));
    } else if (direction == 'Account Settings') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AccountSettings()));
    } else if (direction == 'Billing Groups') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Billinggroup()));
    } else if (direction == 'Manage Users') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ManageUsers()));
    } else {
       Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ChangePass()));
    }
  }
}

class Options {
  String? title;
  String? imagePath;
  Options({this.title, this.imagePath});
}
