import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/fingerprintSensor.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixelList.dart';

class Pixel3XL extends StatefulWidget {
  @override
  _Pixel3XLState createState() => _Pixel3XLState();
}

class _Pixel3XLState extends State<Pixel3XL> {
  @override
  Widget build(BuildContext context) {
    Color glossPanelColor = pixels[3].colors['Gloss Panel'];
    Color mattePanelColor = pixels[3].colors['Matte Panel'];
    Color fingerprintSensorColor = pixels[3].colors['Fingerprint Sensor'];
    Color logoColor = pixels[3].colors['Google Logo'];

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
                        EvaIcons.google,
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
