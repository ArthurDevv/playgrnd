import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/11.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/11ProMax.dart';
import 'package:playgrnd/sections/mobHardware/utils/phoneModel.dart';

List<Phone> iPhones = [
  Phone(
    phoneName: 'iPhone 11',
    phoneBack: IPhone11(),
    phoneFront: IPhone11().front(),
    colors: {
      'Camera Bump': Colors.white,
      'Back Panel': Colors.white,
      'Apple Logo': Colors.black,
    },
  ),
  Phone(
    phoneName: 'iPhone 11 Pro Max',
    phoneBack: IPhone11ProMax(),
    phoneFront: IPhone11ProMax().front(),
    colors: {
      'Camera Bump': Colors.white,
      'Back Panel': Colors.white,
      'Apple Logo': Colors.black,
    },
  ),
];
