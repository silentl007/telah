import 'package:flutter/material.dart';
import 'package:telah/assets.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/login.dart';
import 'package:telah/sizemodel.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        
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
            
              children: [
                Center(
                  child: Image.asset(
                    AssetsPath.success,
                    height: Sizes.h450,
                    // width: Sizes.w70,
                  ),
                ),
                Text(
                  'Your estate has been set-up successfully!',
                    textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                ),
                customDivider(height: Sizes.h15),
                Text(
                  'Proceed to add a property unit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.w18,
                    height: 1.2,
                  ),
                ),
                customDivider(height: Sizes.h120),
                UserWidgets().button(
                    context: context,
                    buttonText: 'Add a property unit',
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
        .push(MaterialPageRoute(builder: (context) => const Login()));
  }
}
