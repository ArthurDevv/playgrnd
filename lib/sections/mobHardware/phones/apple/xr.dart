import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/iPhoneTextMarks.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/screen.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/iPhoneList.dart';

class IPhoneXR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int phoneListIndex = 2;

    Color backPanelColor = iPhones[phoneListIndex].colors['Back Panel'];
    Color logoColor = iPhones[phoneListIndex].colors['Apple Logo'];
    Color textMarksColor = iPhones[phoneListIndex].colors['iPhone Text'];

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Camera(
                    diameter: 40.0,
                    lenseDiameter: 10.0,
                    trimWidth: 4.0,
                    trimColor: Colors.grey[500],
                    hasElevation: true,
                    backPanelColor: backPanelColor,
                  ),
                  SizedBox(height: 8.0),
                  Microphone(),
                  SizedBox(height: 8.0),
                  Flash(diameter: 15.0),
                ],
              ),
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
              child: IPhoneTextMarks(
                color: textMarksColor,
                ceMarkings: false,
                designedByText: false,
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
      bezelHorizontal: 20.0,
      bezelVertical: 20.0,
      phoneBrand: 'Apple',
      phoneModel: 'iPhone',
      phoneName: 'iPhone XR',
    );
  }
}
