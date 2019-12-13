import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/backPanel.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/cameraBump.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/screen.dart';

class IPhone11ProMax extends StatelessWidget {
  static const String phoneBrand = 'Apple';
  static const String phoneModel = 'iPhone';
  static const String phoneName = 'iPhone 11 Pro Max';

  static Map<String, Color> colors = {
    'Camera Bump': Colors.grey[900],
    'Back Panel': Colors.grey[900],
    'Apple Logo': Colors.black,
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

    CameraBump cameraBump = CameraBump(
      width: 100.0,
      height: 100.0,
      cameraBumpColor: cameraBumpColor,
      backPanelColor: backPanelColor,
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
          right: 3.0,
          top: 22.5,
          child: Camera(),
        ),
        Positioned(
          right: 12.0,
          top: 4.0,
          child: Flash(diameter: 15.0),
        ),
        Positioned(
          right: 17.0,
          bottom: 9.0,
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
                        ? Colors.black12
                        : Colors.black26
                  ],
                  begin: FractionalOffset(0.5, 0.0),
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
}
