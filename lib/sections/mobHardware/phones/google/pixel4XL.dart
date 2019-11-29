import 'package:flutter/material.dart';
import 'package:playgrnd/customIcons/brand_icons_icons.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/camera.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/cameraBump.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/flash.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/microphone.dart';
import 'package:playgrnd/sections/mobHardware/phoneParts/screen.dart';
import 'package:playgrnd/sections/mobHardware/phones/google/pixelList.dart';

class Pixel4XL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int phoneListIndex = 4;

    Color backPanelColor = pixels[phoneListIndex].colors['Back Panel'];
    Color cameraBumpColor = pixels[phoneListIndex].colors['Camera Bump'];
    Color logoColor = pixels[phoneListIndex].colors['Google Logo'];
    Color bezelColor = pixels[phoneListIndex].colors['Bezel'];

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
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 240.0,
        height: 480.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            // color: backPanelColor,
            border: Border.all(
              color: bezelColor,
              width: 4.0,
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

  Screen front() {
    return Screen(
      bezelVertical: 40.0,
      screenAlignment: Alignment(0.0, 0.6),
      phoneBrand: 'Google',
      phoneModel: 'Pixel',
      phoneName: 'Pixel 4 XL',
    );
  }
}
