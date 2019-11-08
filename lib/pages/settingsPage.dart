import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playgrnd/utils/dynamicTheme.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with WidgetsBindingObserver {
  static const String _primaryColorKey = 'my_primary_key';
  static const String _accentColorKey = 'my_accent_key';
  static const String _brightnessKey = 'my_brightness_key';

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor:
              Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.grey[900],
          systemNavigationBarIconBrightness:
              Theme.of(context).brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    Color _primaryColor = DynamicTheme.of(context).primaryColor;
    Color _accentColor = DynamicTheme.of(context).accentColor;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Primary Color'),
              subtitle: Text('Select a primary color'),
              trailing: CircleColor(
                circleSize: 50.0,
                color: _primaryColor,
              ),
              onTap: () => changePrimaryColor(_primaryColor),
            ),
            ListTile(
              title: Text('Accent Color'),
              subtitle: Text('Select an accent color'),
              trailing: CircleColor(
                circleSize: 50.0,
                color: _accentColor,
              ),
              onTap: () => changeAccentColor(_accentColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: RawMaterialButton(
                      fillColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 100.0,
                        minHeight: 100.0,
                        minWidth: 200.0,
                      ),
                      child: Text(
                        'Light Theme',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        changeBrightness(Brightness.light);
                      }),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: RawMaterialButton(
                    fillColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 100.0,
                      minHeight: 100.0,
                      minWidth: 200.0,
                    ),
                    child: Text(
                      'Dark Theme',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      changeBrightness(Brightness.dark);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void changePrimaryColor(Color _primaryColor) {
    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: Text('Pick a color'),
        children: <Widget>[
          MaterialColorPicker(
            onColorChange: (Color color) {
              _primaryColor = color;
            },
            selectedColor: _primaryColor,
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
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString(_primaryColorKey, '$_primaryColor');
                  setState(() {
                    DynamicTheme.of(context).setPrimaryColor(_primaryColor);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void changeAccentColor(Color _accentColor) {
    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: Text('Pick a color'),
        children: <Widget>[
          MaterialColorPicker(
            onColorChange: (Color color) {
              _accentColor = color;
            },
            selectedColor: _accentColor,
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
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString(_accentColorKey, '$_accentColor');
                  setState(() {
                    DynamicTheme.of(context).setAccentColor(_accentColor);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  void changeBrightness(brightness) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(
        _brightnessKey, brightness == Brightness.light ? false : true);

    setState(() {
      DynamicTheme.of(context).setBrightness(brightness);
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor:
            brightness == Brightness.light ? Colors.white : Colors.grey[900],
        systemNavigationBarIconBrightness:
            brightness == Brightness.light ? Brightness.dark : Brightness.light,
      ));
    });
  }
}
