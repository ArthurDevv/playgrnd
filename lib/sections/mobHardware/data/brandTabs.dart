import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/iPhoneList.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixelList.dart';
import 'package:playgrnd/sections/mobHardware/widgets/phoneStack.dart';

List<Tab> brandTabs = [
  Tab(icon: Icon(BrandIcons.google)),
  Tab(icon: Icon(BrandIcons.apple)),
  Tab(icon: Icon(BrandIcons.samsung)),
  Tab(icon: Icon(BrandIcons.huawei)),
  Tab(icon: Icon(BrandIcons.oneplus)),
  Tab(icon: Icon(BrandIcons.xiaomi)),
  Tab(icon: Icon(BrandIcons.htc)),
  Tab(icon: Icon(BrandIcons.lg)),
  Tab(icon: Icon(BrandIcons.motorola)),
  Tab(icon: Icon(BrandIcons.nokia, size: 30.0)),
];

double appleCurrentPage = iPhones.length - 1.0;
double googleCurrentPage = pixels.length - 1.0;

class BrandStacks extends StatefulWidget {
  final _BrandStacksState _brandStacksState = _BrandStacksState();

  List<Widget> brandStacks() {
    return _brandStacksState.brandStacks();
  }

  @override
  _BrandStacksState createState() => _BrandStacksState();
}

class _BrandStacksState extends State<BrandStacks> {
  final PageController appleController =
      PageController(initialPage: appleCurrentPage.toInt());

  final PageController googleController =
      PageController(initialPage: googleCurrentPage.toInt());

  @override
  Widget build(BuildContext context) {
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

    return Container();
  }

  List<Widget> brandStacks() {
    return [
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
      Container(child: Text('Samsung'), padding: EdgeInsets.all(20)),
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
