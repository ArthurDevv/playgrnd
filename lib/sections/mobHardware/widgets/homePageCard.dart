import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/pages/mobHardwareHomePage.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixelList.dart';
import 'package:playgrnd/sections/mobHardware/widgets/phonesPreview.dart';
import 'package:playgrnd/widgets/floatingCard.dart';

FloatingCard mobHardwareHomePageCard(BuildContext context) {
  return FloatingCard(
    title: 'MobHardware',
    subtitle: 'Customize and view the specs of your favorite smartphone',
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: PhonesPreview(
        currentPage: pixels.length.toDouble(),
        phoneList: pixels,
      ),
    ),
    onPressed: () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => MobHardware())),
  );
}
