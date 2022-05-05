import 'package:flutter/material.dart';
import 'package:telah/common/decor.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class UpdateBank extends StatelessWidget {
  const UpdateBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    final node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: UserWidgets()
            .appbar(context: context, title: 'Update bank account'),
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
                children: [
                  TextFormField(
                      style: TextStyle(fontSize: Sizes.w13),
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.nextFocus(),
                      decoration: Decor().formDecor(
                        context: context,
                        labelText: 'Bank',
                      )),
                  customDivider(height: Sizes.h15),
                  TextFormField(
                      style: TextStyle(fontSize: Sizes.w13),
                      textCapitalization: TextCapitalization.words,
                      onEditingComplete: () => node.nextFocus(),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: Decor().formDecor(
                        context: context,
                        labelText: 'Account number',
                      )),
                  customDivider(height: Sizes.h35),
                  UserWidgets().button(
                      context: context,
                      buttonText: 'Save Changes',
                      function: proceed,
                      buttonHeight: Sizes.h50,
                      buttonColor: Colors.blue),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  proceed() {}
}
