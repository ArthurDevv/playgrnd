import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/pages/mobHardwareHomePage.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixelList.dart';
import 'package:playgrnd/sections/mobHardware/widgets/cardScrollWidget.dart';
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
      child: CardScrollWidget(
        currentPage: pixelList.length.toDouble(),
        phoneList: pixelList,
        padding: 0.0,
        verticalInset: 5.0,
        inset: 5,
      ),
    ),
    onPressed: () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => MobHardware())),
  );
}
