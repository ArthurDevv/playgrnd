import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/backPanel.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/fingerprintSensor.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/screen.dart';

class Pixel3XL extends StatelessWidget {
  static const String phoneBrand = 'Google';
  static const String phoneModel = 'Pixel';
  static const String phoneName = 'Pixel 3 XL';

  static Map<String, Color> colors = {
    'Gloss Panel': Colors.white,
    'Matte Panel': Colors.white,
    'Fingerprint Sensor': Colors.white,
    'Google Logo': Colors.black,
  };

  final Screen front = Screen(
    hasNotch: true,
    bezelVertical: 40.0,
    screenAlignment: Alignment(0.0, -0.6),
    notchAlignment: Alignment(0.0, -1.0),
    notchHeight: 35.0,
    notchWidth: 100.0,
    cornerRadius: 23.0,
    phoneBrand: phoneBrand,
    phoneModel: phoneModel,
    phoneName: phoneName,
  );

  get getPhoneName => phoneName;
  get getPhoneFront => front;
  get getPhoneColors => colors;

  @override
  Widget build(BuildContext context) {
    Color glossPanelColor = colors['Gloss Panel'];
    Color mattePanelColor = colors['Matte Panel'];
    Color fingerprintSensorColor = colors['Fingerprint Sensor'];
    Color logoColor = colors['Google Logo'];

    return FittedBox(
      child: BackPanel(
        backPanelColor: glossPanelColor,
        bezelColor: glossPanelColor,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 240.0,
                height: 380.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23.0),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.05),
                    width: 1.0,
                  ),
                  color: mattePanelColor,
                ),
                child: Container(
                  width: 240.0,
                  height: 380.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.0),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.05),
                      width: 1.0,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        mattePanelColor.computeLuminance() > 0.335
                            ? Colors.black12
                            : Colors.black26
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      FingerprintSensor(
                        sensorColor: fingerprintSensorColor,
                        diameter: 37.0,
                        trimColor: mattePanelColor,
                      ),
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
              ),
            ),
            Positioned(
              top: 30.0,
              left: 20.0,
              child: Row(
                children: <Widget>[
                  Camera(),
                  SizedBox(width: 8.0),
                  Microphone(),
                  SizedBox(width: 8.0),
                  Flash(
                    diameter: 15.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
