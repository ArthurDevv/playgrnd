import 'package:flutter/material.dart';

class FingerprintSensor extends StatelessWidget {
  final Color sensorColor, trimColor;
  final double diameter, trimWidth;

  const FingerprintSensor({
    this.sensorColor,
    this.trimColor,
    this.diameter = 43.0,
    this.trimWidth = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: trimColor ?? Colors.grey[400],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: diameter - trimWidth,
            height: diameter - trimWidth,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: sensorColor,
            ),
          ),
        ],
      ),
    );
  }
}
