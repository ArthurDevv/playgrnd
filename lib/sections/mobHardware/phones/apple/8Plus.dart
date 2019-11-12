import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/cameraBump.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/iPhoneHomeButton.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/iPhoneTextMarks.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/screen.dart';
import 'package:playgrnd/sections/mobHardware/phones/apple/iPhoneList.dart';

// Color frontBezels;
// Color homeButton;

class IPhone8Plus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int phoneListIndex = 11;

    Color cameraBumpColor = iPhones[phoneListIndex].colors['Camera Bump'];
    Color backPanelColor = iPhones[phoneListIndex].colors['Back Panel'];
    Color logoColor = iPhones[phoneListIndex].colors['Apple Logo'];
    Color textMarksColor = iPhones[phoneListIndex].colors['iPhone Text'];
    // Color frontBezelsColor = iPhones[phoneListIndex].colors['Front Bezels'];
    // Color homeButtonColor = iPhones[phoneListIndex].colors['Home Button'];

    // frontBezels = frontBezelsColor;
    // homeButton = homeButtonColor;

    Camera camera = Camera(
      diameter: 20.0,
      lenseDiameter: 8.0,
      trimWidth: 3.0,
      trimColor: Colors.grey[900],
    );

    CameraBump cameraBump = CameraBump(
      height: 30.0,
      width: 60.0,
      cameraBumpPartsPadding: 0.0,
      borderWidth: 1.5,
      backPanelColor: backPanelColor,
      cameraBumpColor: cameraBumpColor,
      borderColor: Colors.grey[500],
      cameraBumpParts: <Widget>[
        Positioned(
          left: 3.0,
          top: 5.0,
          child: camera,
        ),
        Positioned(
          right: 3.0,
          top: 5.0,
          child: camera,
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
              top: 10.0,
              left: 10.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  cameraBump,
                  SizedBox(width: 6.0),
                  Microphone(),
                  SizedBox(width: 6.0),
                  Flash(diameter: 13.0),
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
      bezelHorizontal: 15.0,
      bezelVertical: 120.0,
      innerCornerRadius: 0.0,
      screenBezelColor: Colors.white,
      screenItems: <Widget>[
        Align(
          alignment: Alignment(0.0, 0.96),
          child: IPhoneHomeButton(
            buttonColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
