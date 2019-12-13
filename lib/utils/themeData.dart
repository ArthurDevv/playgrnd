import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playgrnd/utils/dynamicTheme.dart';

class MyThemeData extends StatelessWidget {
  final Widget myHome;
  MyThemeData({@required this.myHome});

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultPrimaryColor: Colors.black,
        defaultAccentColor: Colors.blue,
        defaultBrightness: Brightness.dark,
        data: (primaryColor, accentColor, brightness) => ThemeData(
              primaryColor: primaryColor,
              accentColor: accentColor,
              brightness: brightness,
              scaffoldBackgroundColor:
                  brightness == Brightness.light ? Colors.white : Colors.black,
              appBarTheme: AppBarTheme(
                textTheme: TextTheme(
                  title: Theme.of(context).textTheme.title.copyWith(
                        fontFamily: 'Righteous',
                        fontSize: 26.0,
                        color: brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                ),
                color: brightness == Brightness.light
                    ? Colors.white
                    : Colors.black,
                brightness: brightness == Brightness.light
                    ? Brightness.light
                    : Brightness.dark,
                iconTheme: IconThemeData(
                  color: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                elevation: 0.0,
              ),
              buttonTheme: ButtonThemeData(
                buttonColor: accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              textTheme: TextTheme(
                body2: Theme.of(context).textTheme.body1.copyWith(
                      color: accentColor.computeLuminance() > 0.335
                          ? Colors.black
                          : Colors.white,
                    ),
              ),
            ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            title: 'playgrnd.',
            theme: theme,
            home: myHome,
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
          );
        });
  }
}
