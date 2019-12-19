import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/data/brandTabs.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/iPhoneList.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixelList.dart';
import 'package:playgrnd/sections/mobHardware/phones/samsung/samsungList.dart';
import 'package:playgrnd/sections/mobHardware/widgets/phoneStack.dart';
import 'package:playgrnd/utils/constants.dart';
import 'package:playgrnd/widgets/searchBar.dart';
import 'package:playgrnd/widgets/vertTabs.dart';

class MobHardware extends StatefulWidget {
  @override
  _MobHardwareState createState() => _MobHardwareState();
}

class _MobHardwareState extends State<MobHardware> {
  double appleCurrentPage = iPhoneList.length - 1.0;
  double googleCurrentPage = pixelList.length - 1.0;
  double samsungCurrentPage = samsungList.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController appleController =
        PageController(initialPage: appleCurrentPage.toInt());

    PageController googleController =
        PageController(initialPage: googleCurrentPage.toInt());

    PageController samsungController =
        PageController(initialPage: samsungCurrentPage.toInt());

    appleController.addListener(
        () => setState(() => appleCurrentPage = appleController.page));

    googleController.addListener(
        () => setState(() => googleCurrentPage = googleController.page));

    samsungController.addListener(() =>
      setState(() =>
        samsungCurrentPage = samsungController.page;
      );
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('MobHardware'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SearchBar(
            hint: 'Look for a phone',
          ),
          Expanded(
            child: Container(
              // color: Colors.teal,
              child: VerticalTabs(
                contentScrollAxis: Axis.vertical,
                indicatorColor: kThemeBrightness(context) == Brightness.light
                    ? Colors.black
                    : Colors.white,
                tabs: brandTabs,
                contents: <Widget>[
                  PhoneStack(
                    controller: googleController,
                    currentPage: googleCurrentPage,
                    phoneList: pixelList,
                  ),
                  PhoneStack(
                    controller: appleController,
                    currentPage: appleCurrentPage,
                    phoneList: iPhoneList,
                  ),
                  PhoneStack(
                    controller: samsungController,
                    currentPage: samsungCurrentPage,
                    phoneList: samsungList,
                  ),
                  Container(child: Text('Huawei'), padding: EdgeInsets.all(20)),
                  Container(
                      child: Text('OnePlus'), padding: EdgeInsets.all(20)),
                  Container(child: Text('Xiaomi'), padding: EdgeInsets.all(20)),
                  Container(child: Text('htc'), padding: EdgeInsets.all(20)),
                  Container(child: Text('LG'), padding: EdgeInsets.all(20)),
                  Container(
                      child: Text('Motorola'), padding: EdgeInsets.all(20)),
                  Container(child: Text('Nokia'), padding: EdgeInsets.all(20)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
