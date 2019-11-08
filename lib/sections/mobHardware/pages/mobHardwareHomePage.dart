import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/iPhoneList.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixelList.dart';
import 'package:playgrnd/sections/mobHardware/widgets/phoneStack.dart';
import 'package:playgrnd/widgets/searchBar.dart';
import 'package:playgrnd/widgets/vertTabs.dart';

class MobHardware extends StatefulWidget {
  @override
  _MobHardwareState createState() => _MobHardwareState();
}

class _MobHardwareState extends State<MobHardware> {
  TabController myTabController;
  double appleCurrentPage = iPhones.length - 1.0;
  double googleCurrentPage = pixels.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController appleController =
        PageController(initialPage: appleCurrentPage.toInt());
    PageController googleController =
        PageController(initialPage: googleCurrentPage.toInt());

    appleController.addListener(() {
      setState(() {
        appleCurrentPage = appleController.page;
      });
    });

    googleController.addListener(() {
      setState(() {
        googleCurrentPage = googleController.page;
      });
    });

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('MobHardware'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SearchBar(),
          Expanded(
            child: Container(
              // color: Colors.teal,
              child: VerticalTabs(
                contentScrollAxis: Axis.vertical,
                indicatorColor: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
                tabs: <Tab>[
                  Tab(icon: Icon(BrandIcons.apple)),
                  Tab(icon: Icon(EvaIcons.google)),
                  Tab(icon: Icon(BrandIcons.huawei)),
                ],
                contents: <Widget>[
                  PhoneStack(
                    controller: appleController,
                    currentPage: appleCurrentPage,
                    phoneList: iPhones,
                  ),
                  PhoneStack(
                    controller: googleController,
                    currentPage: googleCurrentPage,
                    phoneList: pixels,
                  ),
                  Container(child: Text('NodeJS'), padding: EdgeInsets.all(20)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
