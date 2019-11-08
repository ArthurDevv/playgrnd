import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/fingerprintSensor.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixelList.dart';

class Pixel2 extends StatefulWidget {
  @override
  _Pixel2State createState() => _Pixel2State();
}

class _Pixel2State extends State<Pixel2> {
  @override
  Widget build(BuildContext context) {
    Color glossPanelColor = pixels[1].colors['Gloss Panel'];
    Color mattePanelColor = pixels[1].colors['Matte Panel'];
    Color fingerprintSensorColor = pixels[1].colors['Fingerprint Sensor'];
    Color logoColor = pixels[1].colors['Google Logo'];

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
                        diameter: 37.0,
                        sensorColor: fingerprintSensorColor,
                        trimColor: Colors.grey[800],
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
              top: 15.0,
              left: 65.0,
              child: Camera(trimColor: Colors.grey[800]),
            ),
            Positioned(
              top: 25.0,
              left: 35.0,
              child: Column(
                children: <Widget>[
                  Flash(diameter: 15.0),
                  SizedBox(height: 10.0),
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
}
