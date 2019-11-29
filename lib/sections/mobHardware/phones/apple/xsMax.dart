import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/cameraBump.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/iPhoneTextMarks.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/screen.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/iPhoneList.dart';

class IPhoneXSMax extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int phoneListIndex = 3;

    Color cameraBumpColor = iPhones[phoneListIndex].colors['Camera Bump'];
    Color backPanelColor = iPhones[phoneListIndex].colors['Back Panel'];
    Color logoColor = iPhones[phoneListIndex].colors['Apple Logo'];
    Color textMarksColor = iPhones[phoneListIndex].colors['Texts & Markings'];

    Camera camera = Camera(
      diameter: 20.0,
      lenseDiameter: 6.0,
      trimWidth: 3.0,
      trimColor: Colors.grey[900],
    );

    CameraBump cameraBump = CameraBump(
      width: 35.0,
      height: 80.0,
      borderWidth: 1.5,
      cameraBumpColor: cameraBumpColor,
      backPanelColor: backPanelColor,
      borderColor: Colors.grey[500],
      cameraBumpPartsPadding: 0.0,
      cameraBumpParts: [
        Positioned(
          left: 7.0,
          top: 7.0,
          child: camera,
        ),
        Positioned(
          left: 7.0,
          bottom: 7.0,
          child: camera,
        ),
        Positioned(
          left: 10.0,
          top: 33.0,
          child: Flash(diameter: 15.0),
        ),
        Positioned(
          right: 4.0,
          bottom: 27.0,
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
              top: 15.0,
              left: 15.0,
              child: cameraBump,
            ),
            Align(
              alignment: Alignment(0.0, -0.5),
              child: Icon(
                BrandIcons.apple,
                color: logoColor,
                size: 60.0,
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.6),
              child: IPhoneTextMarks(color: textMarksColor),
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
      phoneName: 'iPhone XS Max',
    );
  }
}
