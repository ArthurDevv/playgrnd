import 'package:flutter/material.dart';

class ColorState extends InheritedWidget {
  ColorState({Key key, this.colors, this.changeColor, this.child})
      : super(key: key, child: child);

  final Widget child;
  final Map<String, Color> colors;
  final Function changeColor;

  static ColorState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ColorState) as ColorState);
  }

  @override
  bool updateShouldNotify(ColorState oldWidget) {
    return colors != oldWidget.colors;
  }
}
