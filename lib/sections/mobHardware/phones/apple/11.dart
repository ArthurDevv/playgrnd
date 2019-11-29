import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/cameraBump.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/screen.dart';

import 'iPhoneList.dart';

class IPhone11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int phoneListIndex = 4;

    Color cameraBumpColor = iPhones[phoneListIndex].colors['Camera Bump'];
    Color backPanelColor = iPhones[phoneListIndex].colors['Back Panel'];
    Color logoColor = iPhones[phoneListIndex].colors['Apple Logo'];

    CameraBump cameraBump = CameraBump(
      width: 100.0,
      height: 100.0,
      cameraBumpColor: cameraBumpColor,
      backPanelColor: backPanelColor,
      isMatte: true,
      cameraBumpParts: [
        Positioned(
          left: 3.0,
          top: 3.0,
          child: Camera(),
        ),
        Positioned(
          left: 3.0,
          bottom: 3.0,
          child: Camera(),
        ),
        Positioned(
          right: 10.0,
          top: 32.0,
          child: Flash(),
        ),
        Positioned(
          right: 17.0,
          top: 20.0,
          child: Microphone(),
        ),
      ],
    );

    return FittedBox(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 250.0,
        height: 500.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
              color: backPanelColor,
            ),
            color: backPanelColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(5, 5),
                spreadRadius: 2.0,
                blurRadius: 10.0,
              )
            ]),
        child: Stack(
          children: <Widget>[
            Container(
              width: 250.0,
              height: 500.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    backPanelColor.computeLuminance() > 0.335
                        ? Colors.black.withOpacity(0.019)
                        : Colors.black.withOpacity(0.025),
                  ],
                  stops: [0.2, 0.2],
                  begin: FractionalOffset(0.7, 0.3),
                  end: FractionalOffset(0.0, 0.5),
                ),
              ),
            ),
            Positioned(
              top: 5.0,
              left: 5.0,
              child: cameraBump,
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(
                BrandIcons.apple,
                color: logoColor,
                size: 60.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Screen front() {
    return Screen(
      hasNotch: true,
      phoneBrand: 'Apple',
      phoneModel: 'iPhone',
      phoneName: 'iPhone 11',
    );
  }
}
