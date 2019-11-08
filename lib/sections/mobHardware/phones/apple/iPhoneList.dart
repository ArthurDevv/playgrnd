import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/11.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/11ProMax.dart';
import 'package:playgrnd/sections/mobHardware/utils/phoneModel.dart';

List<Phone> iPhones = [
  Phone(
    phoneName: 'iPhone 11',
    phone: IPhone11(),
    colors: {
      'Camera Bump': Colors.white,
      'Back Panel': Colors.white,
      'Apple Logo': Colors.black,
    },
  ),
  Phone(
    phoneName: 'iPhone 11 Pro Max',
    phone: IPhone11ProMax(),
    colors: {
      'Camera Bump': Colors.white,
      'Back Panel': Colors.white,
      'Apple Logo': Colors.black,
    },
  ),
];
