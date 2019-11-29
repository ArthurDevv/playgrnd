import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:playgrnd/sections/mobHardware/services/phoneSpecs.dart';
import 'package:playgrnd/utils/constants.dart';
import 'package:playgrnd/widgets/floatingCard.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('get data'),
                onPressed: () {
                  setState(() {
                    PhoneSpecs().getPhoneSpecs(
                      brand: 'Apple',
                      model: 'iPhone',
                      device: 'X',
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

FloatingCard testPageHomePageCard(BuildContext context) {
  return FloatingCard(
    title: 'Testing Page',
    subtitle: 'Test new stuff here',
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        LineAwesomeIcons.bug,
        size: kScreenAwareSize(100, context),
        color: kAccentColor(context),
      ),
    ),
    onPressed: () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => TestPage())),
  );
}
