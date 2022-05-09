import 'package:flutter/material.dart';
import 'package:telah/assets.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/estates/add%20property/accountdetails.dart';
import 'package:telah/sizemodel.dart';

class PaymentMode extends StatefulWidget {
  const PaymentMode({Key? key}) : super(key: key);

  @override
  State<PaymentMode> createState() => _PaymentModeState();
}

class _PaymentModeState extends State<PaymentMode> {
  int radioDefault = 1;
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SafeArea(
      child: Scaffold(
        appBar: UserWidgets().appbar(context: context),
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
              mainAxisSize: MainAxisSize.max,
              children: [
                LinearProgressIndicator(
                  backgroundColor: Colors.grey.withOpacity(.5),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  value: .6,
                ),
                customDivider(height: Sizes.h50),
                Center(
                  child: Image.asset(
                    AssetsPath.paymentmode,
                    width: Sizes.w70,
                  ),
                ),
                customDivider(height: Sizes.h20),
                Text(
                  'Mode of payment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: Sizes.w25),
                ),
                customDivider(height: Sizes.h15),
                Text(
                  'How do you want your residents to pay their service charge',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.w18,
                    height: 1.2,
                  ),
                ),
                customDivider(height: Sizes.h15),
                Text(
                  'Please, kindly choose a payment frequency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.w18,
                    height: 1.2,
                  ),
                ),
                customDivider(height: Sizes.h30),
                bills(),
                customDivider(height: Sizes.h50),
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
        .push(MaterialPageRoute(builder: (context) => const AccountDetails()));
  }
  bills() {
    return Column(
      children: [
        Row(
          children: [
            Radio(
                value: 1,
                groupValue: radioDefault,
                onChanged: (val) {
                  setState(() {
                    radioDefault = 1;
                  });
                }),
            Text(
              'Weekly',
              style: TextStyle(fontSize: Sizes.w18),
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 2,
                groupValue: radioDefault,
                onChanged: (val) {
                  setState(() {
                    radioDefault = 2;
                  });
                }),
            Text(
              'Monthly',
              style: TextStyle(fontSize: Sizes.w18),
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 3,
                groupValue: radioDefault,
                onChanged: (val) {
                  setState(() {
                    radioDefault = 3;
                  });
                }),
            Text(
              'Quarterly',
              style: TextStyle(fontSize: Sizes.w18),
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 4,
                groupValue: radioDefault,
                onChanged: (val) {
                  setState(() {
                    radioDefault = 4;
                  });
                }),
            Text(
              'Bi-annually',
              style: TextStyle(fontSize: Sizes.w18),
            )
          ],
        ),
        Row(
          children: [
            Radio(
                value: 5,
                groupValue: radioDefault,
                onChanged: (val) {
                  setState(() {
                    radioDefault = 5;
                  });
                }),
            Text(
              'Annually',
              style: TextStyle(fontSize: Sizes.w18),
            )
          ],
        ),
      ],
    );
  }
}
