import 'package:flutter/material.dart';
import 'package:telah/assets.dart';
import 'package:telah/common/decor.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    final node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: UserWidgets().appbar(
          context: context,
          title: 'Account settings',
        ),
        backgroundColor: Colors.white,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h20,
                left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: Sizes.h70,
                        width: Sizes.h70,
                        color: Colors.transparent,
                        child: Stack(children: [
                          Container(
                            height: Sizes.h65,
                            width: Sizes.h65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Sizes.w15)),
                                image: const DecorationImage(
                                    image: AssetImage(AssetsPath.john))),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Material(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(Sizes.w5)),
                              ),
                              elevation: 5,
                              child: Container(
                                height: Sizes.h20,
                                width: Sizes.h20,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(Sizes.w5))),
                                child: Center(
                                    child: Image.asset(
                                  AssetsPath.camera,
                                  width: Sizes.w15,
                                )),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    customDivider(height: Sizes.h40),
                    TextFormField(
                        style: TextStyle(fontSize: Sizes.w13),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        decoration: Decor().formDecor(
                          context: context,
                          labelText: 'Estate name',
                        )),
                    customDivider(height: Sizes.h15),
                    TextFormField(
                        style: TextStyle(fontSize: Sizes.w13),
                        textCapitalization: TextCapitalization.words,
                        onEditingComplete: () => node.nextFocus(),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: Decor().formDecor(
                          context: context,
                          labelText: 'Manager',
                        )),
                    customDivider(height: Sizes.h15),
                    TextFormField(
                        style: TextStyle(fontSize: Sizes.w13),
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: Decor().formDecor(
                            context: context,
                            prefixText: '+234 ',
                            labelText: 'Phone number',
                            suffix: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                AssetsPath.naija,
                                width: 10,
                                height: 10,
                              ),
                            ))),
                    customDivider(height: Sizes.h15),
                    TextFormField(
                        style: TextStyle(fontSize: Sizes.w13),
                        textCapitalization: TextCapitalization.words,
                        onEditingComplete: () => node.nextFocus(),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: Decor().formDecor(
                          context: context,
                          labelText: 'Email',
                        )),
                    customDivider(height: Sizes.h25),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              BorderRadius.all(Radius.circular(Sizes.w15))),
                      child: Padding(
                        padding: EdgeInsets.only(top: Sizes.h15, bottom: Sizes.h15, left: Sizes.w15, right: Sizes.w15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bank details',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.w18),
                            ),
                            customDivider(height: Sizes.h15),
                            TextFormField(
                                style: TextStyle(fontSize: Sizes.w13),
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
                          ],
                        ),
                      ),
                    ),
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
      ),
    );
  }

  proceed() {}
}
