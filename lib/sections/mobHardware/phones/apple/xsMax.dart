import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/backPanel.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/cameraBump.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/iPhoneTextMarks.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/screen.dart';

class IPhoneXSMax extends StatelessWidget {
  static const String phoneBrand = 'Apple';
  static const String phoneModel = 'iPhone';
  static const String phoneName = 'iPhone XS Max';

  static Map<String, Color> colors = {
    'Camera Bump': Colors.black,
    'Back Panel': Colors.white,
    'Apple Logo': Colors.black,
    'Texts & Markings': Colors.black,
  };

  final Screen front = Screen(
    hasNotch: true,
    phoneBrand: phoneBrand,
    phoneModel: phoneModel,
    phoneName: phoneName,
  );

  get getPhoneName => phoneName;
  get getPhoneFront => front;
  get getPhoneColors => colors;

  @override
  Widget build(BuildContext context) {
    Color cameraBumpColor = colors['Camera Bump'];
    Color backPanelColor = colors['Back Panel'];
    Color logoColor = colors['Apple Logo'];
    Color textMarksColor = colors['Texts & Markings'];

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
      child: BackPanel(
        width: 250.0,
        height: 500.0,
        cornerRadius: 30.0,
        backPanelColor: backPanelColor,
        bezelColor: backPanelColor,
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
}
