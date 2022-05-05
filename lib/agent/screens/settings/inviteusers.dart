import 'package:flutter/material.dart';
import 'package:telah/common/decor.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class InviteUsers extends StatelessWidget {
  const InviteUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    final node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: UserWidgets().appbar(context: context, title: 'invite user'),
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
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.nextFocus(),
                      decoration: Decor().formDecor(
                        context: context,
                        labelText: 'First name',
                      )),
                  customDivider(height: Sizes.h15),
                  TextFormField(
                      style: TextStyle(fontSize: Sizes.w13),
                      onEditingComplete: () => node.nextFocus(),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: Decor().formDecor(
                        context: context,
                        labelText: 'Last name',
                      )),
                  customDivider(height: Sizes.h15),
                  TextFormField(
                      style: TextStyle(fontSize: Sizes.w13),
                      onEditingComplete: () => node.nextFocus(),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: Decor().formDecor(
                        context: context,
                        labelText: 'Email',
                      )),
                  customDivider(height: Sizes.h35),
                  UserWidgets().button(
                      context: context,
                      buttonText: 'Send invite',
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
