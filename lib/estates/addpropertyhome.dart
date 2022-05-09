import 'package:flutter/material.dart';
import 'package:telah/assets.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/estates/add%20property/propertyunit.dart';
import 'package:telah/sizemodel.dart';

class PropertyAddHome extends StatefulWidget {
  const PropertyAddHome({Key? key}) : super(key: key);

  @override
  State<PropertyAddHome> createState() => _PropertyAddHomeState();
}

class _PropertyAddHomeState extends State<PropertyAddHome> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: UserWidgets().appbar(context: context, title: 'Account set up'),
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
                Text(
                  'Let’s help you set-up your account!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                ),
                customDivider(height: Sizes.h15),
                Text(
                  'Please answer the questions on the next screens',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.w18,
                    height: 1.2,
                  ),
                ),
                Center(
                  child: Image.asset(
                    AssetsPath.houseproperty,
                    height: Sizes.h450,
                    // width: Sizes.w70,
                  ),
                ),
                customDivider(height: Sizes.h35),
                UserWidgets().button(
                    context: context,
                    function: proceed,
                    buttonHeight: Sizes.h50,
                    buttonColor: Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }

  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PropertyUnit()));
  }
}
