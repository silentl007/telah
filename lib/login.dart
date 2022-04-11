import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';
import 'package:telah/welcomeuser.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hideText = true;
  IconData visibility = Icons.visibility;
  bool check = false;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    final node = FocusScope.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Padding(
            padding: EdgeInsets.only(
                top: Sizes.h70,
                left: Sizes.w20,
                right: Sizes.w20,
                bottom: Sizes.w10),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(children: [
                  Center(
                    child: Image.asset(
                      'assets/images/welcome_logo.png',
                      width: Sizes.w70,
                    ),
                  ),
                  customDivider(height: Sizes.h40),
                  Center(
                      child: Text(
                    'Log In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: Sizes.w20),
                  )),
                  customDivider(height: Sizes.h15),
                  Text(
                    'Enter your email and password',
                    style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                  ),
                  customDivider(height: Sizes.h30),
                  SizedBox(
                    height: Sizes.h45,
                    child: TextFormField(
                        validator: (value) {
                          if (value != null && value.trim().length < 3) {
                            return 'This field requires a minimum of 3 characters';
                          } else if (!value!.contains('@')) {
                            return 'Enter valid email address';
                          } else if (value.trim().isEmpty) {
                            return 'please enter email';
                          }

                          return null;
                        },
                        style: TextStyle(fontSize: Sizes.w13),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(fontSize: Sizes.w13),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(Sizes.w10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(Sizes.w10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(Sizes.w10))),
                        )),
                  ),
                  customDivider(height: Sizes.h25),
                  SizedBox(
                    height: Sizes.h45,
                    child: TextFormField(
                        validator: (value) {
                          if (value != null && value.trim().isEmpty) {
                            return 'please enter password';
                          }

                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () => node.unfocus(),
                        obscureText: hideText,
                        obscuringCharacter: '●',
                        style: TextStyle(fontSize: Sizes.w13),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
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
                              )),
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: Sizes.w13),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(Sizes.w10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(Sizes.w10))),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(Sizes.w10))),
                        )),
                  ),
                  customDivider(height: Sizes.h15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: check,
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -4),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(Sizes.w5)),
                              onChanged: (value) {
                                setState(() {
                                  check = value!;
                                });
                              }),
                          customVerticalDivider(width: Sizes.w5),
                          Text('Stay logged in',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: Sizes.w15))
                        ],
                      ),
                      Text('Forgot password?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Sizes.w15,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  customDivider(height: Sizes.h250),
                  UserWidgets().button(
                      context: context,
                      function: proceed,
                      buttonText: 'Log In',
                      buttonHeight: Sizes.h50,
                      buttonTextSize: Sizes.w18),
                  customDivider(height: Sizes.h20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: TextStyle(
                              color: Colors.grey, fontSize: Sizes.w15)),
                      customVerticalDivider(),
                      Text("Sign up",
                          style: TextStyle(
                              color: Colors.blue, fontSize: Sizes.w15))
                    ],
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  proceed() {
    final keyForm = _formkey.currentState;
    if (keyForm!.validate()) {
      // to save
      keyForm.save();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const WelcomeUser()));
    }
  }
}
