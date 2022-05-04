import 'package:flutter/material.dart';
import 'package:telah/agent/screens/addproperty/addproperty.dart';
import 'package:telah/assets.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class NoProperty extends StatefulWidget {
  const NoProperty({Key? key}) : super(key: key);

  @override
  State<NoProperty> createState() => _NoPropertyState();
}

class _NoPropertyState extends State<NoProperty> {
  List<ToDo> listTodo = [
    ToDo(AssetsPath.profileadd, 'Onboard a talent',
        'Generate a code for a new tenant today'),
    ToDo(AssetsPath.add1, 'Add a unit',
        'Generate a code for a new tenant today'),
    ToDo(AssetsPath.clock, 'Schedule a maintenance',
        'Generate a code for a new tenant today'),
    ToDo(AssetsPath.clipboard, 'Resolve an issue',
        'Generate a code for a new tenant today'),
    ToDo(AssetsPath.quitnotice, 'Give a quit notice',
        'Generate a code for a new tenant today'),
    ToDo(AssetsPath.profileremove, 'Terminate tenancy',
        'Generate a code for a new tenant today'),
  ];
  @override
  Widget build(BuildContext context) {
    Sizes().heightSizeCalc(context);
    Sizes().widthSizeCalc(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: Sizes.w25, right: Sizes.w25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What do you want to do today?',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w20),
            ),
            customDivider(height: Sizes.h20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: listTodo
                    .map((data) =>
                        todoWidget(data.icon!, data.title!, data.subtitle!))
                    .toList(),
              ),
            ),
            customDivider(height: Sizes.h20),
            Container(
              width: double.infinity,
              height: Sizes.h180,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(.3)),
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
              child: Padding(
                padding: EdgeInsets.only(left: Sizes.w15, right: Sizes.w15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetsPath.propertyunit,
                            width: Sizes.w40,
                            height: Sizes.h30,
                          ),
                          customVerticalDivider(),
                          Text('Property units',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.w20))
                        ],
                      ),
                      customDivider(height: Sizes.h35),
                      Row(
                        children: [
                          units(0, 'Total'),
                          customVerticalDivider(width: Sizes.w15),
                          units(0, 'occupied'),
                          customVerticalDivider(width: Sizes.w15),
                          units(0, 'Vacant')
                        ],
                      )
                    ]),
              ),
            ),
            customDivider(height: Sizes.h20),
            Container(
              width: double.infinity,
              height: Sizes.h150,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.1),
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
              child: Padding(
                padding: EdgeInsets.only(left: Sizes.w30, right: Sizes.w30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: Sizes.w25,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: Sizes.w30,
                            color: Colors.blue.withOpacity(.5),
                          ),
                        ),
                        customVerticalDivider(width: Sizes.w25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text('Account Setup',
                                    style: TextStyle(
                                        color: Colors.blue.withOpacity(.5),
                                        fontSize: Sizes.w20,
                                        fontWeight: FontWeight.bold)),
                                customVerticalDivider(width: Sizes.w15),
                                Container(
                                  width: Sizes.w50,
                                  height: Sizes.h20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Sizes.w20))),
                                  child: Center(
                                    child: Text(
                                      '3 of 5',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: Sizes.w13),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            customDivider(height: Sizes.h5),
                            Text('You are yet to add a property',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: Sizes.w15))
                          ],
                        )
                      ],
                    ),
                    customDivider(height: Sizes.h15),
                    SizedBox(
                      height: Sizes.h40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddProperty()));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Sizes.w15)))),
                        child: Text('Add a property unit',
                            style: TextStyle(
                                color: Colors.white, fontSize: Sizes.w18)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget units(int unit, String title) {
    return Expanded(
        child: Container(
      height: Sizes.h70,
      color: const Color(0xFFF1F3F4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(unit.toString(),
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w25)),
          customDivider(),
          Text(title, style: TextStyle(fontSize: Sizes.w15))
        ],
      ),
    ));
  }

  Widget todoWidget(String icon, String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.only(right: Sizes.w15),
      child: Container(
        width: Sizes.w230,
        height: Sizes.h130,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(.3)),
            borderRadius: BorderRadius.all(Radius.circular(Sizes.w20))),
        child: Padding(
          padding: EdgeInsets.only(left: Sizes.w15, right: Sizes.w15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: Sizes.w40,
                height: Sizes.h30,
              ),
              customDivider(height: Sizes.h5),
              Text(
                title,
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.w20),
              ),
              customDivider(height: Sizes.h5),
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey, fontSize: Sizes.w18),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ToDo {
  String? icon;
  String? title;
  String? subtitle;
  ToDo(this.icon, this.title, this.subtitle);
}
