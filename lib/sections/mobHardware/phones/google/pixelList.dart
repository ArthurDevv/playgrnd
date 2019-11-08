import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixel2.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixel2XL.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixel3XL.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixel4XL.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixelXL.dart';
import 'package:playgrnd/sections/mobHardware/utils/phoneModel.dart';

List<Phone> pixels = [
  Phone(
    phoneName: 'Pixel XL',
    phone: PixelXL(),
    colors: {
      'Gloss Panel': Colors.white,
      'Matte Panel': Colors.grey[300],
      'Fingerprint Sensor': Colors.white,
      'Google Logo': Colors.grey[400],
      'Antenna Bands': Colors.white,
    },
  ),
  Phone(
    phoneName: 'Pixel 2',
    phone: Pixel2(),
    colors: {
      'Gloss Panel': Colors.black,
      'Matte Panel': Colors.grey[900],
      'Fingerprint Sensor': Colors.grey[900],
      'Google Logo': Colors.black,
    },
  ),
  Phone(
    phoneName: 'Pixel 2 XL',
    phone: Pixel2XL(),
    colors: {
      'Gloss Panel': Colors.black,
      'Matte Panel': Colors.white,
      'Fingerprint Sensor': Colors.white,
      'Google Logo': Colors.black,
    },
  ),
  Phone(
    phoneName: 'Pixel 3 XL',
    phone: Pixel3XL(),
    colors: {
      'Gloss Panel': Colors.white,
      'Matte Panel': Colors.white,
      'Fingerprint Sensor': Colors.white,
      'Google Logo': Colors.black,
    },
  ),
  Phone(
    phoneName: 'Pixel 4 XL',
    phone: Pixel4XL(),
    colors: {
      'Camera Bump': Colors.black,
      'Back Panel': Colors.deepOrange[500],
      'Google Logo': Colors.deepOrange[500],
      'Bezel': Colors.black,
    },
  ),
];
