import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/backPanel.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/cameraBump.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/screen.dart';

class Pixel4XL extends StatelessWidget {
  static const String phoneBrand = 'Google';
  static const String phoneModel = 'Pixel';
  static const String phoneName = 'Pixel 4 XL';

  static Map<String, Color> colors = {
    'Camera Bump': Colors.black,
    'Back Panel': Colors.deepOrange[500],
    'Google Logo': Colors.deepOrange[500],
    'Bezels': Colors.black,
  };

  final Screen front = Screen(
    bezelVertical: 40.0,
    screenAlignment: Alignment(0.0, 0.6),
    phoneBrand: phoneBrand,
    phoneModel: phoneModel,
    phoneName: phoneName,
  );

  get getPhoneName => phoneName;
  get getPhoneFront => front;
  get getPhoneColors => colors;

  set setPhoneColor(Color color) {
    print(colors[colors.keys.elementAt(1)]);
  }

  @override
  Widget build(BuildContext context) {
    Color cameraBumpColor = colors['Camera Bump'];
    Color backPanelColor = colors['Back Panel'];
    Color logoColor = colors['Google Logo'];
    Color bezelColor = colors['Bezels'];

    Camera camera = Camera(
      diameter: 28.0,
      trimWidth: 3.0,
      trimColor: Colors.grey[900],
    );

    CameraBump cameraBump = CameraBump(
      width: 80.0,
      height: 80.0,
      cameraBumpColor: cameraBumpColor,
      backPanelColor: backPanelColor,
      cameraBumpPartsPadding: 2.0,
      cameraBumpParts: [
        Positioned(
          left: 5.0,
          top: 22.5,
          child: camera,
        ),
        Positioned(
          right: 5.0,
          top: 22.5,
          child: camera,
        ),
        Positioned(
          left: 32.5,
          bottom: 7.0,
          child: Flash(diameter: 15.0),
        ),
        Positioned(
          right: 17.0,
          bottom: 11.0,
          child: Microphone(),
        ),
        Positioned(
          left: 37.0,
          top: 10.0,
          child: Microphone(),
        ),
      ],
    );

    return FittedBox(
      child: BackPanel(
        cornerRadius: 30.0,
        bezelWidth: 4.0,
        backPanelColor: backPanelColor,
        bezelColor: bezelColor,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    backPanelColor.computeLuminance() > 0.335
                        ? Colors.black12
                        : Colors.black26
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(),
                  ),
                  Icon(
                    BrandIcons.google,
                    color: logoColor,
                    size: 30.0,
                  ),
                  SizedBox(height: 70.0),
                ],
              ),
            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: cameraBump,
            ),
          ],
        ),
      ),
    );
  }
}
