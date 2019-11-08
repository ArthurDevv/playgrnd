import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:playgrnd/sections/mobHardware/widgets/colorPickerButton.dart';

class MobEditPage extends StatefulWidget {
  final Widget phone;
  final String phoneName;
  final Map<String, Color> colors;

  MobEditPage({@required this.phone, @required this.phoneName, this.colors});

  @override
  _MobEditPageState createState() =>
      _MobEditPageState(phone: phone, phoneName: phoneName, colors: colors);
}

class _MobEditPageState extends State<MobEditPage> {
  Widget phone;
  String phoneName;
  Map<String, Color> colors;

  _MobEditPageState({
    this.phone,
    this.phoneName,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(phoneName),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(EvaIcons.saveOutline),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        // height: 450.0,
        // width: 350.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Hero(
                  tag: phoneName,
                  child: phone,
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 16.0, 24.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 100.0,
                      child: ListView.builder(
                        itemCount: colors.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: ColorPickerButton(
                              colorName: colors.keys.elementAt(i),
                              color: colors.values.elementAt(i),
                              onPressed: () => selectColor(
                                colors.keys.elementAt(i),
                                colors.values.elementAt(i),
                                i,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectColor(String side, Color selectedColor, int i) {
    Color colorPicked;

    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
                  setState(() {
                    colors[colors.keys.elementAt(i)] = colorPicked;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
