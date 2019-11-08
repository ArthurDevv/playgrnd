import 'package:flutter/material.dart';
import 'package:playgrnd/utils/themeData.dart';

import 'pages/homePage.dart';

void main() => runApp(Playgrnd());

class Playgrnd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyThemeData(myHome: HomePage());
  }
}
