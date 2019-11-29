import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/fingerprintSensor.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/screen.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixelList.dart';

class Pixel2XL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int phoneListIndex = 2;

    Color glossPanelColor = pixels[phoneListIndex].colors['Gloss Panel'];
    Color mattePanelColor = pixels[phoneListIndex].colors['Matte Panel'];
    Color fingerprintSensorColor =
        pixels[phoneListIndex].colors['Fingerprint Sensor'];
    Color logoColor = pixels[phoneListIndex].colors['Google Logo'];

    return FittedBox(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 240.0,
        height: 480.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23.0),
            border: Border.all(
              color: glossPanelColor,
            ),
            color: glossPanelColor,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 240.0,
                height: 380.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                    bottomLeft: Radius.circular(23.0),
                    bottomRight: Radius.circular(23.0),
                  ),
                  color: mattePanelColor,
                ),
                child: Container(
                  width: 240.0,
                  height: 380.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(23.0),
                      bottomRight: Radius.circular(23.0),
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
                        trimColor: Colors.grey[300],
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
              child: Camera(),
            ),
            Positioned(
              top: 40.0,
              left: 65.0,
              child: Column(
                children: <Widget>[
                  Flash(diameter: 15.0),
                  SizedBox(height: 4.0),
                  Row(
                    children: <Widget>[
                      Microphone(),
                      SizedBox(width: 2.0),
                      Microphone(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Screen front() {
    return Screen(
      bezelVertical: 50.0,
      screenAlignment: Alignment.center,
      notchAlignment: Alignment(0.0, -1.0),
      notchHeight: 35.0,
      notchWidth: 100.0,
      cornerRadius: 23.0,
      phoneBrand: 'Google',
      phoneModel: 'Pixel',
      phoneName: 'Pixel 2 XL',
    );
  }
}
