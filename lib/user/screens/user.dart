import 'package:flutter/material.dart';
import 'package:telah/sizemodel.dart';

class User extends StatefulWidget {
 const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('User'),
        ),
      ),
    );
  }
}