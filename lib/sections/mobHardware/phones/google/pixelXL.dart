import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/fingerprintSensor.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/screen.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixelList.dart';

class PixelXL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color glossPanelColor = pixels[0].colors['Gloss Panel'];
    Color mattePanelColor = pixels[0].colors['Matte Panel'];
    Color fingerprintSensorColor = pixels[0].colors['Fingerprint Sensor'];
    Color logoColor = pixels[0].colors['Google Logo'];
    Color antennaBandsColor = pixels[0].colors['Antenna Bands'];

    return FittedBox(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 240.0,
        height: 470.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
              color: mattePanelColor,
            ),
            color: mattePanelColor,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: 40.0),
                Container(
                  color: antennaBandsColor,
                  height: 6.0,
                  width: double.infinity,
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  EvaIcons.google,
                  color: logoColor,
                  size: 30.0,
                ),
                SizedBox(height: 50.0),
                Container(
                  color: antennaBandsColor,
                  height: 6.0,
                  width: double.infinity,
                ),
                SizedBox(height: 20.0),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.all(4.0),
                width: 240.0,
                height: 160.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  color: glossPanelColor,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: FingerprintSensor(
                      sensorColor: fingerprintSensorColor,
                      trimColor: Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 20.0,
              child: Row(
                children: <Widget>[
                  Flash(diameter: 15.0),
                  SizedBox(width: 10.0),
                  Camera(
                    diameter: 17.0,
                    trimWidth: 3.0,
                    lenseDiameter: 7.0,
                  ),
                  SizedBox(width: 10.0),
                  Microphone(diameter: 6),
                  SizedBox(width: 3.0),
                  Microphone(diameter: 6),
                  SizedBox(width: 3.0),
                  Microphone(diameter: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Screen front() {
    return Screen(
      bezelVertical: 120.0,
      innerCornerRadius: 0.0,
      screenAlignment: Alignment.center,
      notchAlignment: Alignment(0.0, -1.0),
      notchHeight: 35.0,
      notchWidth: 100.0,
      cornerRadius: 33.0,
      screenBezelColor: Colors.white,
    );
  }
}
