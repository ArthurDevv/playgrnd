import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/iPhoneList.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixelList.dart';
import 'package:playgrnd/sections/mobHardware/phones/samsung/samsungList.dart';
import 'package:playgrnd/sections/mobHardware/widgets/phoneStack.dart';

List<Tab> brandTabs = [
  Tab(icon: Icon(BrandIcons.google)),
  Tab(icon: Icon(BrandIcons.apple)),
  Tab(icon: Icon(BrandIcons.samsung1)),
  Tab(icon: Icon(BrandIcons.huawei)),
  Tab(icon: Icon(BrandIcons.oneplus)),
  Tab(icon: Icon(BrandIcons.xiaomi)),
  Tab(icon: Icon(BrandIcons.htc)),
  Tab(icon: Icon(BrandIcons.lg)),
  Tab(icon: Icon(BrandIcons.motorola)),
  Tab(icon: Icon(BrandIcons.nokia, size: 30.0)),
];

double appleCurrentPage = iPhoneList.length - 1.0;
double googleCurrentPage = pixelList.length - 1.0;
double samsungCurrentPage = samsungList.length - 1.0;

class BrandStacks extends StatefulWidget {
  final _BrandStacksState _brandStacksState = _BrandStacksState();

  List<Widget> brandStacks() {
    return _brandStacksState.brandStacks();
  }

  @override
  _BrandStacksState createState() => _BrandStacksState();
}

class _BrandStacksState extends State<BrandStacks> {
  final PageController googleController =
      PageController(initialPage: googleCurrentPage.toInt());

  final PageController appleController =
      PageController(initialPage: appleCurrentPage.toInt());

  final PageController samsungController =
      PageController(initialPage: samsungCurrentPage.toInt());

  @override
  Widget build(BuildContext context) {
    googleController.addListener(() {
      setState(() {
        googleCurrentPage = googleController.page;
      });
    });

    appleController.addListener(() {
      setState(() {
        appleCurrentPage = appleController.page;
      });
    });

    samsungController.addListener(() {
      setState(() {
        samsungCurrentPage = samsungController.page;
      });
    });

    return Container();
  }

  List<Widget> brandStacks() {
    return [
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
      Container(child: Text('OnePlus'), padding: EdgeInsets.all(20)),
      Container(child: Text('Xiaomi'), padding: EdgeInsets.all(20)),
      Container(child: Text('htc'), padding: EdgeInsets.all(20)),
      Container(child: Text('LG'), padding: EdgeInsets.all(20)),
      Container(child: Text('Motorola'), padding: EdgeInsets.all(20)),
      Container(child: Text('Nokia'), padding: EdgeInsets.all(20)),
    ];
  }
}
