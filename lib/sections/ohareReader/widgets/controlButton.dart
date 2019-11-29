import 'package:flutter/material.dart';
import 'package:playgrnd/utils/constants.dart';

class ControlButton extends StatelessWidget {
  final double width, height, borderWidth, iconSize;
  final Color color, borderColor, iconColor;
  final IconData icon;
  final Function onTap, onTapDown;

  const ControlButton({
    this.width = 30.0,
    this.height = 30.0,
    this.borderWidth = 0.0,
    this.iconSize = 24.0,
    this.color = Colors.transparent,
    this.borderColor,
    this.iconColor,
    this.icon = Icons.highlight,
    this.onTap,
    this.onTapDown,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? kAccentColor(context),
          border: Border.all(
            color: borderColor ?? kAccentColor(context),
            width: borderWidth,
          ),
          boxShadow: color != Colors.transparent
              ? [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1.0,
                    blurRadius: 3.0,
                    offset: Offset(1.5, 0.5),
                  ),
                ]
              : null,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor ??
              setIconColor(context, color, kThemeBrightness(context)),
        ),
      ),
      onTap: onTap,
      onTapDown: onTapDown,
    );
  }

  Color setIconColor(BuildContext context, Color color, Brightness brightness) {
    Color setColor;
    if (color == Colors.transparent) {
      setColor = brightness == Brightness.dark
          ? setColor = Colors.white
          : setColor = Colors.black;
    } else {
      setColor = kAccentColor(context).computeLuminance() > 0.335
          ? Colors.black
          : Colors.white;
    }
    return setColor;
  }
}
