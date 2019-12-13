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
    }) {
      return ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Select an ${title.toLowerCase()}'),
        trailing: CircleColor(
          circleSize: 50.0,
          color: title.contains('Primary')
              ? kPrimaryColor(context)
              : kAccentColor(context),
        ),
        onTap: () {
          setState(() {
            title.contains('Primary')
                ? changePrimaryColor(context, kPrimaryColor(context))
                : changeAccentColor(context, kAccentColor(context));
          });
        },
      );
    }

    ListTile selectBrightnessTile(String title, Brightness brightness) {
      return ListTile(
        title: Text(title),
        trailing: kThemeBrightness(context) == brightness
            ? Icon(
                LineAwesomeIcons.check_circle,
                color: kAccentColor(context),
              )
            : SizedBox(),
        onTap: () {
          setState(() {
            changeBrightness(context, brightness);
          });
        },
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
            // selectColorTile(title: 'Primary Color'),
            // SizedBox(height: 20.0),
            selectColorTile(title: 'Accent Color'),
            SizedBox(height: 20.0),
            ListTile(
              title: Text(
                'Theme',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Select theme'),
            ),
            selectBrightnessTile('Light', Brightness.light),
            Divider(indent: 16.0),
            selectBrightnessTile('Black', Brightness.dark),
            Divider(indent: 16.0),
          ],
        ),
      ),
    );
  }
}
