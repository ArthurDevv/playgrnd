import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:playgrnd/sections/mobHardware/widgets/colorPickerButton.dart';
import 'package:flip_card/flip_card.dart';

class MobEditPage extends StatefulWidget {
  final phone;

  MobEditPage({
    this.phone,
  });

  @override
  _MobEditPageState createState() => _MobEditPageState();
}

class _MobEditPageState extends State<MobEditPage> {
  GlobalKey<FlipCardState> flipCardKey = GlobalKey<FlipCardState>();

  int flipCount = 0;

  @override
  Widget build(BuildContext context) {
    Widget phoneBack = widget.phone;
    Widget phoneFront = widget.phone.getPhoneFront;
    String phoneName = widget.phone.getPhoneName;
    Map colors = widget.phone.getPhoneColors;

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(phoneName),
          centerTitle: true,
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
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Padding(
                          // padding: const EdgeInsets.all(8.0),
                          padding: EdgeInsets.zero,
                          child: Hero(
                            tag: phoneBack,
                            child: GestureDetector(
                              child: FlipCard(
                                flipOnTouch: false,
                                speed: 300,
                                key: flipCardKey,
                                front: phoneBack,
                                back: phoneFront,
                              ),
                              onTap: () {
                                // widget.phone.setPhoneColor = Colors.yellow;
                              },
                              onHorizontalDragUpdate: (details) {
                                setState(() {
                                  if (details.delta.dx > 0 &&
                                      !flipCardKey.currentState.isFront) {
                                    flipCardKey.currentState.toggleCard();
                                    flipCount++;
                                  } else if (details.delta.dx < 0 &&
                                      flipCardKey.currentState.isFront) {
                                    flipCardKey.currentState.toggleCard();
                                    flipCount++;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: flipCount < 1 ? 1.0 : 0.0,
                            child: Text(
                              'Hint: Flip the phone to view its specs',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                              padding: const EdgeInsets.only(
                                  bottom: 16.0, left: 1.0),
                              child: ColorPickerButton(
                                colorName: colors.keys.elementAt(i),
                                color: colors.values.elementAt(i),
                                onPressed: () {
                                  changeColor(
                                    context,
                                    colors,
                                    colors.keys.elementAt(i),
                                    colors.values.elementAt(i),
                                    i,
                                  );
                                },
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
      ),
      onWillPop: onWillPop,
    );
  }

  Future<bool> onWillPop() {
    if (!flipCardKey.currentState.isFront) {
      flipCardKey.currentState.toggleCard();
      return Future.value(false);
    }
    return Future.value(true);
  }

  void changeColor(
    BuildContext context,
    Map colors,
    String side,
    Color selectedColor,
    int i,
  ) {
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
                  setState(() {
                    if (colorPicked != null) {
                      colors[colors.keys.elementAt(i)] = colorPicked;
                    } else {
                      colors[colors.keys.elementAt(i)] = selectedColor;
                    }
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
