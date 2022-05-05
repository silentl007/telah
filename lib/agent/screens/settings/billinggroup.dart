import 'package:flutter/material.dart';
import 'package:telah/assets.dart';
import 'package:telah/common/decor.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class Billinggroup extends StatefulWidget {
  const Billinggroup({Key? key}) : super(key: key);

  @override
  State<Billinggroup> createState() => _BillinggroupState();
}

class _BillinggroupState extends State<Billinggroup> {
  List group = ['Bungalow', 'Duplex', 'Shorlet', 'Apartments'];
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);

    return SafeArea(
      child: Scaffold(
        appBar: UserWidgets().appbar(context: context, title: 'Billing groups'),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(fontSize: Sizes.w13),
                    keyboardType: TextInputType.name,
                    decoration: Decor().formDecor(
                        prefixIcon:const Padding(
                          padding:  EdgeInsets.all(15),
                          child:  ImageIcon(
                            AssetImage(AssetsPath.search),
                          ),
                        ),
                        context: context,
                        labelText: 'Search billing groups'),
                  ),
                  customDivider(height: Sizes.h45),
                  Column(
                    children: group
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.only(bottom: Sizes.h15),
                            child: TextFormField(
                              readOnly: true,
                              initialValue: e,
                              style: TextStyle(fontSize: Sizes.w13),
                              keyboardType: TextInputType.name,
                              decoration: Decor().formDecor(
                                  context: context,
                                  suffix: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          group.remove(e);
                                        });
                                      },
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        color: Colors.red.withOpacity(.4),
                                        child: Center(
                                          child: ImageIcon(
                                            const AssetImage(
                                                'assets/icons/cancel.png'),
                                            color: Colors.red,
                                            size: Sizes.w15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
