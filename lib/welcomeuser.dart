import 'package:flutter/material.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/linkaccount.dart';
import 'package:telah/login.dart';
import 'package:telah/sizemodel.dart';

class WelcomeUser extends StatefulWidget {
  const WelcomeUser({Key? key}) : super(key: key);

  @override
  State<WelcomeUser> createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
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
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        body: WillPopScope(
          onWillPop: () async => false,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: Padding(
              padding: EdgeInsets.only(
                  top: Sizes.h10,
                  left: Sizes.w20,
                  right: Sizes.w20,
                  bottom: Sizes.w10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //placeholder user profile picture
                        Image.asset(
                          'assets/images/house.png',
                          width: Sizes.w60,
                        ),
                        customDivider(height: Sizes.h20),
                        Text(
                          'Welcome, John Doe!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                        ),
                        customDivider(height: Sizes.h15),
                        Text(
                          'Agent, Sage Estates',
                          style: TextStyle(
                              color: Colors.grey, fontSize: Sizes.w18),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        UserWidgets().button(
                            context: context,
                            function: proceed,
                            buttonHeight: Sizes.h50),
                        customDivider(height: Sizes.h20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: Text(
                            'Not John Doe?',
                            style: TextStyle(
                                color: Colors.blue, fontSize: Sizes.w15),
                          ),
                        ),
                        customDivider(height: Sizes.h20),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  proceed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LinkAccount()));
  }
}
