import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

void changeColor(
    BuildContext context, Map colors, String side, Color selectedColor, int i) {
  Color colorPicked;

  showDialog<Widget>(
    context: context,
    builder: (BuildContext context) => SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Text('Pick a color'),
      children: <Widget>[
        MaterialColorPicker(
          onColorChange: (Color color) {
            colorPicked = color;
          },
          selectedColor: selectedColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text('Select'),
              onPressed: () {
                colors[colors.keys.elementAt(i)] = colorPicked;
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    ),
  );
}
