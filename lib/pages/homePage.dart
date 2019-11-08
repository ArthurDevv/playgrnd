import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:playgrnd/pages/settingsPage.dart';
import 'package:playgrnd/sections/mobHardware/pages/mobHardwareHomePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('playgrnd.'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(EvaIcons.settings2Outline),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => SettingsPage()),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Dynamic Theme!'),
        icon: Icon(OMIcons.palette),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(
                'MobHardware',
                style: Theme.of(context).textTheme.body2,
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => MobHardware())),
            ),
          ],
        ),
      ),
    );
  }
}
