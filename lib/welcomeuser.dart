import 'package:flutter/material.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h10,
                left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(children: [],),
                  ), 
                    Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(children: [
                      UserWidgets().button(context: context, function: proceed),
                      Text('Not John Doe?', style: TextStyle(color: Colors.blue, fontSize: Sizes.w15),)
                    ],),
                  ), 
                  
                ],),
          ),
        ),
      ),
    );
  }
  proceed(){

  }
}
