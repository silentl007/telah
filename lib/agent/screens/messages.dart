import 'package:flutter/material.dart';
import 'package:telah/sizemodel.dart';

class Messages extends StatefulWidget {
 const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _Messagestate();
}

class _Messagestate extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Messages'),
        ),
      ),
    );
  }
}