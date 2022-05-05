import 'package:flutter/material.dart';
import 'package:telah/common/decor.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  bool hideText = true;
  IconData visibility = Icons.visibility;
  bool hideText1 = true;
  IconData visibility1 = Icons.visibility;
  bool hideText2 = true;
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    final node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar:
            UserWidgets().appbar(context: context, title: 'Change password'),
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
                      validator: (value) {
                        if (value != null && value.trim().isEmpty) {
                          return 'please enter password';
                        }

                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.unfocus(),
                      obscureText: hideText,
                      obscuringCharacter: '●',
                      style: TextStyle(fontSize: Sizes.w13),
                      decoration: Decor().formDecor(
                          context: context,
                          labelText: 'Current password',
                          suffix: cpSuffix())),
                  customDivider(height: Sizes.h15),
                  TextFormField(
                      validator: (value) {
                        if (value != null && value.trim().isEmpty) {
                          return 'please enter new password';
                        }

                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.unfocus(),
                      obscureText: hideText2,
                      obscuringCharacter: '●',
                      style: TextStyle(fontSize: Sizes.w13),
                      decoration: Decor().formDecor(
                        context: context,
                        labelText: 'New password',
                      )),
                  customDivider(height: Sizes.h15),
                  TextFormField(
                      validator: (value) {
                        if (value != null && value.trim().isEmpty) {
                          return 'please confirm password';
                        }

                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => node.unfocus(),
                      obscureText: hideText1,
                      obscuringCharacter: '●',
                      style: TextStyle(fontSize: Sizes.w13),
                      decoration: Decor().formDecor(
                          context: context,
                          labelText: 'Confirm password',
                          suffix: copSuffix())),
                  customDivider(height: Sizes.h35),
                  UserWidgets().button(
                      context: context,
                      buttonText: 'Send changes',
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

  cpSuffix() {
    return IconButton(
        onPressed: () {
          if (hideText) {
            setState(() {
              hideText = false;
              visibility = Icons.visibility_off;
            });
          } else {
            setState(() {
              hideText = true;
              visibility = Icons.visibility;
            });
          }
        },
        icon: Icon(
          visibility,
          color: Colors.black54,
        ));
  }

  copSuffix() {
    return IconButton(
        onPressed: () {
          if (hideText1) {
            setState(() {
              hideText1 = false;
              visibility1 = Icons.visibility_off;
            });
          } else {
            setState(() {
              hideText1 = true;
              visibility1 = Icons.visibility;
            });
          }
        },
        icon: Icon(
          visibility1,
          color: Colors.black54,
        ));
  }

  proceed() {}
}
