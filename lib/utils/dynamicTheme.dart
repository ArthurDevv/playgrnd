import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef ThemedWidgetBuilder = Widget Function(
    BuildContext context, ThemeData data);

typedef ThemeDataWithColorBrightnessBuilder = ThemeData Function(
    Color primaryColor, Color accentColor, Brightness brightness);

class DynamicTheme extends StatefulWidget {
  const DynamicTheme(
      {Key key,
      this.data,
      this.themedWidgetBuilder,
      this.defaultPrimaryColor,
      this.defaultAccentColor,
      this.defaultBrightness})
      : super(key: key);

  final ThemedWidgetBuilder themedWidgetBuilder;
  final ThemeDataWithColorBrightnessBuilder data;
  final Color defaultPrimaryColor;
  final Color defaultAccentColor;
  final Brightness defaultBrightness;

  @override
  DynamicThemeState createState() => DynamicThemeState();

  static DynamicThemeState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<DynamicThemeState>());
  }
}

class DynamicThemeState extends State<DynamicTheme>
    with WidgetsBindingObserver {
  ThemeData _data;
  Color _primaryColor;
  Color _accentColor;
  Brightness _brightness;

  static const String _primaryColorKey = 'my_primary_key';
  static const String _accentColorKey = 'my_accent_key';
  static const String _brightnessKey = 'my_brightness_key';

  ThemeData get data => _data;
  Color get primaryColor => _primaryColor;
  Color get accentColor => _accentColor;
  Brightness get brightness => _brightness;

  // SharedPref sharedPref = SharedPref();

  @override
  void initState() {
    super.initState();
    _primaryColor = widget.defaultPrimaryColor;
    _accentColor = widget.defaultAccentColor;
    _brightness = widget.defaultBrightness;
    _data = widget.data(_primaryColor, _accentColor, _brightness);

    loadBrightness().then((bool dark) {
      _brightness = dark ? Brightness.dark : Brightness.light;
      _data = widget.data(_primaryColor, _accentColor, _brightness);
      if (mounted) {
        setState(() {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: dark ? Colors.black : Colors.white,
            systemNavigationBarIconBrightness:
                dark ? Brightness.light : Brightness.dark,
          ));
        });
      }
    });
    // loadPrimaryColor().then((Color color) {
    //   _primaryColor = color;
    //   _data = widget.data(_primaryColor, _accentColor, _brightness);
    // });
    // loadAccentColor().then((Color color) {
    //   _accentColor = color;
    //   _data = widget.data(_primaryColor, _accentColor, _brightness);
    // });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor:
              brightness == Brightness.dark ? Colors.black : Colors.white,
          systemNavigationBarIconBrightness: brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _data = widget.data(_primaryColor, _accentColor, _brightness);
  }

  @override
  void didUpdateWidget(DynamicTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    _data = widget.data(_primaryColor, _accentColor, _brightness);
  }

  Future<void> setPrimaryColor(Color color) async {
    setState(() {
      _primaryColor = color;
      _data = widget.data(_primaryColor, _accentColor, _brightness);
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_primaryColorKey, jsonEncode('$color'));
  }

  Future<void> setAccentColor(Color color) async {
    setState(() {
      _accentColor = color;
      _data = widget.data(_primaryColor, _accentColor, _brightness);
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_accentColorKey, jsonEncode('$color'));
  }

  Future<void> setBrightness(Brightness brightness) async {
    setState(() {
      _brightness = brightness;
      _data = widget.data(_primaryColor, _accentColor, _brightness);
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(
        _brightnessKey, brightness == Brightness.light ? false : true);
  }

  void setThemeData(ThemeData data) {
    setState(() {
      _data = data;
    });
  }

  Future<bool> loadBrightness() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_brightnessKey) ??
        widget.defaultBrightness == Brightness.dark;
  }

  // Future<Color> loadPrimaryColor() async {
  //   return ThemeColors.fromJson(await sharedPref.read('primary')) ??
  //       Colors.amber;
  // }

  // Future<Color> loadAccentColor() async {
  //   return ThemeColors.fromJson(await sharedPref.read('accent')) ??
  //       Colors.amber;
  // }

  @override
  Widget build(BuildContext context) {
    return widget.themedWidgetBuilder(context, _data);
  }
}

class ThemeColors {
  Color primary;
  Color accent;

  ThemeColors({this.primary, this.accent});

  ThemeColors.fromJson(Map json)
      : primary = json['primary'],
        accent = json['accent'];
}

// class SharedPref {
//   read(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return jsonDecode(prefs.getString(key));
//   }
// }
