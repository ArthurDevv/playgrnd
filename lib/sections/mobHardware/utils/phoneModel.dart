import 'package:flutter/material.dart';

class Phone {
  String phoneName;
  Widget phoneBack, phoneFront;
  Map<String, Color> colors;

  Phone({
    this.phoneName,
    this.phoneBack,
    this.phoneFront,
    this.colors,
  });
}
