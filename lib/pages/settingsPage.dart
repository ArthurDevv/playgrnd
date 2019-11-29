import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:playgrnd/services/changeTheme.dart';
import 'package:playgrnd/utils/constants.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    ListTile selectColorTile({
      String title,
      String subtitle,
      Color color,
      Function onPressed,
    }) {
      return ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: CircleColor(
          circleSize: 50.0,
          color: color,
        ),
        onTap: onPressed,
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            selectColorTile(
                title: 'Primary Color',
                subtitle: 'Select a primary color',
                color: kPrimaryColor(context),
                onPressed: () {
                  setState(() {
                    changePrimaryColor(context, kPrimaryColor(context));
                  });
                }),
            SizedBox(height: 20.0),
            selectColorTile(
                title: 'Accent Color',
                subtitle: 'Select a accent color',
                color: kAccentColor(context),
                onPressed: () {
                  setState(() {
                    changeAccentColor(context, kAccentColor(context));
                  });
                }),
            SizedBox(height: 20.0),
            ListTile(
              title: Text(
                'Theme',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Select a theme'),
            ),
            ListTile(
              title: Text('Light'),
              trailing: kThemeBrightness(context) == Brightness.light
                  ? Icon(
                      LineAwesomeIcons.check_circle,
                      color: kAccentColor(context),
                    )
                  : SizedBox(),
              onTap: () {
                setState(() {
                  changeBrightness(context, Brightness.light);
                });
              },
            ),
            Divider(indent: 16.0),
            ListTile(
              title: Text('Black'),
              trailing: kThemeBrightness(context) == Brightness.dark
                  ? Icon(
                      LineAwesomeIcons.check_circle,
                      color: kAccentColor(context),
                    )
                  : SizedBox(),
              onTap: () {
                setState(() {
                  changeBrightness(context, Brightness.dark);
                });
              },
            ),
            Divider(indent: 16.0),
          ],
        ),
      ),
    );
  }
}
