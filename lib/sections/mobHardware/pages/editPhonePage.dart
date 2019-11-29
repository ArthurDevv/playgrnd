import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/services/changeColor.dart';
import 'package:playgrnd/sections/mobHardware/widgets/colorPickerButton.dart';
import 'package:flip_card/flip_card.dart';
import 'package:playgrnd/utils/constants.dart';

class MobEditPage extends StatefulWidget {
  final Widget phoneBack, phoneFront;
  final String phoneName;
  final Map<String, Color> colors;

  MobEditPage({
    @required this.phoneBack,
    @required this.phoneName,
    this.phoneFront,
    this.colors,
  });

  @override
  _MobEditPageState createState() => _MobEditPageState();
}

class _MobEditPageState extends State<MobEditPage> {
  GlobalKey<FlipCardState> flipCardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.phoneName),
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
                        child: Hero(
                          tag: widget.phoneName,
                          child: Container(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  color: kThemeBrightness(context) ==
                                          Brightness.light
                                      ? Colors.transparent
                                      : Colors.grey.withOpacity(0.05),
                                  blurRadius: 30.0,
                                  spreadRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                child: FlipCard(
                                  flipOnTouch: false,
                                  speed: 300,
                                  key: flipCardKey,
                                  front: widget.phoneBack,
                                  back: widget.phoneFront,
                                ),
                                onHorizontalDragUpdate: (details) {
                                  if (details.delta.dx > 0 &&
                                      !flipCardKey.currentState.isFront) {
                                    flipCardKey.currentState.toggleCard();
                                  } else if (details.delta.dx < 0 &&
                                      flipCardKey.currentState.isFront) {
                                    flipCardKey.currentState.toggleCard();
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'Hint: Flip the phone to view its specs',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
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
                          itemCount: widget.colors.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: ColorPickerButton(
                                colorName: widget.colors.keys.elementAt(i),
                                color: widget.colors.values.elementAt(i),
                                onPressed: () {
                                  setState(() {
                                    changeColor(
                                      context,
                                      widget.colors,
                                      widget.colors.keys.elementAt(i),
                                      widget.colors.values.elementAt(i),
                                      i,
                                    );
                                  });
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
}
