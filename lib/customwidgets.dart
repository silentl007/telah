import 'package:flutter/material.dart';
import 'package:telah/sizemodel.dart';

class UserWidgets {
  appbar(
      {required BuildContext context,
      String? title,
      bool hasAction = false,
      List<Widget>? action}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      title: Text(
        title ?? '',
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      actions: hasAction ? action : [],
    );
  }

  button(
      {required BuildContext context,
      required Function function,
      double? buttonHeight,
      double? buttonTextSize,
      Color? buttonColor,
      String? buttonText}) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SizedBox(
      height: buttonHeight ?? Sizes.h40,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.w15)))),
          onPressed: () {
            function();
          },
          child: Text(buttonText ?? 'Proceed',
              style: TextStyle(fontSize: buttonTextSize ?? Sizes.w13))),
    );
  }
}

class Decorations {}

customDivider({double? height, Color? color}) {
  return Divider(
    height: height ?? 2,
    color: color ?? Colors.transparent,
  );
}

customVerticalDivider({double? width, Color? color}) {
  return VerticalDivider(
    width: width ?? 2,
    color: color ?? Colors.transparent,
  );
}
