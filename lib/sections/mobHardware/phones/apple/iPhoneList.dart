import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/11.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/11ProMax.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/8Plus.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/xr.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/xsMax.dart';
import 'package:playgrnd/sections/mobHardware/utils/phoneModel.dart';

List<Phone> iPhones = [
  Phone(
    phoneName: 'iPhone 8',
    phoneBack: IPhoneXR(),
    phoneFront: IPhoneXR().front(),
    colors: {
      'Back Panel': Colors.yellow,
      'Apple Logo': Colors.black,
      'Texts & Markings': Colors.black,
    },
  ),
  Phone(
    phoneName: 'iPhone 8 Plus',
    phoneBack: IPhone8Plus(),
    phoneFront: IPhone8Plus().front(),
    colors: {
      'Camera Bump': Colors.black,
      'Back Panel': Colors.pink[100],
      'Apple Logo': Colors.black,
      'iPhone Text': Colors.black,
    },
  ),
  Phone(
    phoneName: 'iPhone XR',
    phoneBack: IPhoneXR(),
    phoneFront: IPhoneXR().front(),
    colors: {
      'Back Panel': Colors.yellow,
      'Apple Logo': Colors.black,
      'iPhone Text': Colors.black,
    },
  ),
  Phone(
    phoneName: 'iPhone XS Max',
    phoneBack: IPhoneXSMax(),
    phoneFront: IPhoneXSMax().front(),
    colors: {
      'Camera Bump': Colors.black,
      'Back Panel': Colors.white,
      'Apple Logo': Colors.black,
      'Texts & Markings': Colors.black,
    },
  ),
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
      'Camera Bump': Colors.grey[900],
      'Back Panel': Colors.grey[900],
      'Apple Logo': Colors.black,
    },
  ),
];
