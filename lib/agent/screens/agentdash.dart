import 'package:flutter/material.dart';
import 'package:telah/assets.dart';
import 'package:telah/customwidgets.dart';
import 'package:telah/sizemodel.dart';

class AgentDash extends StatefulWidget {
  const AgentDash({Key? key}) : super(key: key);

  @override
  State<AgentDash> createState() => _AgentDashState();
}

class _AgentDashState extends State<AgentDash> {
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
                          units(220, 'Total'),
                          customVerticalDivider(width: Sizes.w15),
                          units(200, 'occupied'),
                          customVerticalDivider(width: Sizes.w15),
                          units(20, 'Vacant')
                        ],
                      )
                    ]),
              ),
            ),
            customDivider(height: Sizes.h20),
            Card(
              // elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Sizes.w20)),
              clipBehavior: Clip.antiAlias,
              child: ExpansionTile(
                tilePadding: EdgeInsets.only(
                    left: Sizes.w10, right: Sizes.w10, top: Sizes.h10),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetsPath.arrowdown,
                      width: Sizes.w20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: Sizes.h5),
                      child: Container(
                          width: Sizes.w80,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF1F3F4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(Sizes.w10))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: Sizes.h5, bottom: Sizes.h5),
                            child: Center(
                                child: Text(
                              '42 units',
                              style: TextStyle(
                                  fontSize: Sizes.w15, color: Colors.black),
                            )),
                          )),
                    )
                  ],
                ),
                title: Row(
                  children: [
                    Image.asset(
                      AssetsPath.wallet2,
                      width: Sizes.w40,
                    ),
                    customVerticalDivider(width: Sizes.w15),
                    Text('Unpaid bills',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.w20,
                            color: Colors.black)),
                  ],
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: Sizes.h8, bottom: Sizes.h15),
                  child: Text('N8,000,000',
                      style: TextStyle(color: Colors.red, fontSize: Sizes.w20)),
                ),
                children: [
                  expandCh(),
                  expandCh(),
                  expandCh(),
                ],
              ),
            ),
            customDivider(height: Sizes.h20),
            Card(
              // elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Sizes.w20)),
              clipBehavior: Clip.antiAlias,
              child: ExpansionTile(
                tilePadding: EdgeInsets.only(
                    left: Sizes.w10, right: Sizes.w10, top: Sizes.h10),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetsPath.arrowdown,
                      width: Sizes.w20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: Sizes.h5),
                      child: Container(
                          width: Sizes.w80,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF1F3F4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(Sizes.w10))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: Sizes.h5, bottom: Sizes.h5),
                            child: Center(
                                child: Text(
                              '42 units',
                              style: TextStyle(
                                  fontSize: Sizes.w15, color: Colors.black),
                            )),
                          )),
                    )
                  ],
                ),
                title: Row(
                  children: [
                    Image.asset(
                      AssetsPath.expire,
                      width: Sizes.w40,
                    ),
                    customVerticalDivider(width: Sizes.w15),
                    Text('Expiring Soon',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.w20,
                            color: Colors.black)),
                  ],
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: Sizes.h8, bottom: Sizes.h15),
                  child: Text('N4,200,000',
                      style:
                          TextStyle(color: Colors.orange, fontSize: Sizes.w20)),
                ),
                children: [
                  expandCh(expire: true),
                  expandCh(expire: true),
                  expandCh(expire: true),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget expandCh({bool? expire}) {
    return Padding(
      padding: EdgeInsets.only(left: Sizes.w10, right: Sizes.w10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: Sizes.w50,
                height: Sizes.h50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.w10),
                  image: const DecorationImage(
                      image: AssetImage(AssetsPath.john2)),
                ),
              ),
              customVerticalDivider(width: Sizes.w10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.w20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Block 2, Room 5',
                    style: TextStyle(color: Colors.grey, fontSize: Sizes.w15),
                  ),
                ],
              ),
            ],
          ),
          expire == true
              ? Text(
                  '20 days',
                  style: TextStyle(
                      fontSize: Sizes.w15, fontWeight: FontWeight.bold),
                )
              : Text(
                  'N2,000',
                  style: TextStyle(
                      fontSize: Sizes.w15, fontWeight: FontWeight.bold),
                )
        ],
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
