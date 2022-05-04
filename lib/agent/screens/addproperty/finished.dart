import 'package:flutter/material.dart';
import 'package:telah/agent/agentdashboard.dart';
import 'package:telah/agent/screens/addproperty/addproperty.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class Finished extends StatefulWidget {
  const Finished({Key? key}) : super(key: key);

  @override
  State<Finished> createState() => _FinishedState();
}

class _FinishedState extends State<Finished> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          leading: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AgentDashboard())),
                    (Route<dynamic> route) => false);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.blue,
              )),
          title: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const AgentDashboard())),
                  (Route<dynamic> route) => false);
            },
            child: Text('Back to dashboard',
                style: TextStyle(color: Colors.blue, fontSize: Sizes.w15)),
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: Padding(
              padding: EdgeInsets.only(
                  top: Sizes.h250,
                  left: Sizes.w20,
                  right: Sizes.w20,
                  bottom: Sizes.w10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/circletick.png',
                    width: Sizes.w100,
                  ),
                  customDivider(height: Sizes.h20),
                  Text(
                    'Done! Property unit has \n been added successfully!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                  ),
                  customDivider(height: Sizes.h220),
                  UserWidgets().button(
                      context: context,
                      buttonText: 'Add a new property unit',
                      function: proceed,
                      buttonHeight: Sizes.h50,
                      buttonColor: null),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  proceed() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: ((context) => const AddProperty())),
        (Route<dynamic> route) => false);
  }
}
