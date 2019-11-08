import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  final double diameter, trimWidth, lenseDiameter;
  final Color trimColor;

  const Camera({
    this.diameter = 35.0,
    this.trimWidth = 5.0,
    this.lenseDiameter = 10.0,
    this.trimColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      child: FittedBox(
        child: Container(
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
                  color: Colors.black,
                ),
              ),
              Container(
                width: lenseDiameter,
                height: lenseDiameter,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[700],
                ),
              ),
              Container(
                width: 3.0,
                height: 3.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
