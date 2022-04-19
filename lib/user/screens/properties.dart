import 'package:flutter/material.dart';
import 'package:telah/sizemodel.dart';

class Properties extends StatefulWidget {
  const Properties({Key? key}) : super(key: key);

  @override
  State<Properties> createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Properties'),
        ),
      ),
    );
  }
}
