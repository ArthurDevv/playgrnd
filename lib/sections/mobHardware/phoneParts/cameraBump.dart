import 'package:flutter/material.dart';

class CameraBump extends StatelessWidget {
  final double width, height, cornerRadius, cameraBumpPartsPadding;
  final Color cameraBumpColor, backPanelColor;
  final List<Widget> cameraBumpParts;
  final bool isMatte;

  const CameraBump({
    @required this.width,
    @required this.height,
    @required this.cameraBumpColor,
    @required this.backPanelColor,
    @required this.cameraBumpParts,
    this.cameraBumpPartsPadding = 20.0,
    this.cornerRadius = 20.0,
    this.isMatte = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cornerRadius),
          color: cameraBumpColor,
          boxShadow: [
            BoxShadow(
              color: backPanelColor.computeLuminance() > 0.335
                  ? Colors.black12
                  : Colors.black38,
              spreadRadius: 1.0,
              blurRadius: 3.0,
            )
          ]),
      child: FittedBox(
        child: Stack(
          children: <Widget>[
            Container(
              width: width - cameraBumpPartsPadding,
              height: height - cameraBumpPartsPadding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(cornerRadius - 4.0),
                gradient: isMatte
                    //Matte Effect
                    ? LinearGradient(
                        colors: [
                          Colors.transparent,
                          backPanelColor.computeLuminance() > 0.335
                              ? Colors.black12
                              : Colors.black26
                        ],
                        begin: FractionalOffset(0.5, 0.0),
                        end: FractionalOffset(0.0, 0.5),
                      )
                    //Gloss Effect
                    : LinearGradient(
                        colors: [
                          Colors.transparent,
                          cameraBumpColor.computeLuminance() > 0.335
                              ? Colors.black.withOpacity(0.05)
                              : Colors.black.withOpacity(0.15),
                        ],
                        stops: [0.2, 0.2],
                        begin: FractionalOffset(0.5, 0.3),
                        end: FractionalOffset(0.0, 0.5),
                      ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: cameraBumpParts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
