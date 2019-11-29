import 'dart:async';
import 'dart:math';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
// import 'package:playgrnd/customIcons/custom_icons_icons.dart';
// import 'package:playgrnd/sections/ohareReader/data/testText.dart';
import 'package:playgrnd/sections/ohareReader/widgets/controlButton.dart';
import 'package:playgrnd/sections/ohareReader/widgets/customProgressBar.dart';
import 'package:playgrnd/sections/ohareReader/widgets/topText.dart';
import 'package:playgrnd/utils/constants.dart';

class ReaderPage extends StatefulWidget {
  final String title;
  final String text;

  const ReaderPage({this.title, this.text});

  @override
  _ReaderPageState createState() => _ReaderPageState();
}

enum PlayMode {
  playthrough,
  replay,
  shuffle,
}

PlayMode mode = PlayMode.playthrough;
bool speedChanged = false;

class _ReaderPageState extends State<ReaderPage> {
  int currentText = 0;
  bool playing = false;
  int speed = 100;
  int delay = 100;

  @override
  Widget build(BuildContext context) {
    List<String> textList = widget.text.split(" ");

    // for (int i = 0; i < textList.length; i++) {
    //   if (textList[i].contains("\n")) {
    //     String line = textList[i];
    //     List splitLine = line.split("\n");
    //     // print(splitLine);
    //     textList.insert(i, splitLine.first);
    //     textList.insert(i++, splitLine.last);
    //   }
    // }
    // for (int i = 0; i < textList.length; i++) {
    //   print(textList);
    // }

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TopText(
                    textInt: 3,
                    currentText: currentText,
                    textList: textList,
                  ),
                  TopText(
                    textInt: 2,
                    currentText: currentText,
                    textList: textList,
                  ),
                  TopText(
                    textInt: 1,
                    currentText: currentText,
                    textList: textList,
                  ),
                  TopText(
                    textInt: 0,
                    currentText: currentText,
                    textList: textList,
                    isCenter: true,
                    flex: 2,
                  ),
                  TopText(
                    textInt: 1,
                    currentText: currentText,
                    textList: textList,
                    left: false,
                  ),
                  TopText(
                    textInt: 2,
                    currentText: currentText,
                    textList: textList,
                    left: false,
                  ),
                  TopText(
                    textInt: 3,
                    currentText: currentText,
                    textList: textList,
                    left: false,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        '${textList[currentText]}',
                        style: TextStyle(
                          fontSize: 70.0,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    playReader(delay, textList);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 10.0,
                  activeTrackColor: kAccentColor(context),
                  inactiveTrackColor:
                      kThemeBrightness(context) == Brightness.dark
                          ? Colors.white.withOpacity(0.05)
                          : Colors.black.withOpacity(0.05),
                  overlayShape: SliderComponentShape.noOverlay,
                  thumbShape: BarThumbShape(),
                ),
                child: Slider(
                  value: currentText.toDouble(),
                  onChanged: (i) {
                    setState(() {
                      currentText = i.toInt();
                    });
                  },
                  min: 0.0,
                  max: textList.length - 1.0,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ControlButton(
                    width: 50.0,
                    height: 50.0,
                    color: Colors.transparent,
                    borderColor: Colors.transparent,
                    icon: LineAwesomeIcons.cog,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              title: Text('Settings'),
                              children: <Widget>[
                                ListTile(
                                  title: Text('Reading Speed'),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                  ControlButton(
                    width: 70.0,
                    height: 70.0,
                    icon: LineAwesomeIcons.backward,
                    iconSize: 40.0,
                    borderColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        if (currentText > 5) {
                          currentText -= 5;
                        } else if (currentText != 0) {
                          currentText = 0;
                        }
                      });
                    },
                  ),
                  ControlButton(
                    width: 100.0,
                    height: 100.0,
                    color: kAccentColor(context),
                    icon: playing
                        ? LineAwesomeIcons.pause
                        : LineAwesomeIcons.play,
                    borderWidth: 10.0,
                    iconSize: 40.0,
                    onTap: () {
                      playReader(delay, textList);
                    },
                  ),
                  ControlButton(
                    width: 70.0,
                    height: 70.0,
                    icon: LineAwesomeIcons.forward,
                    iconSize: 40.0,
                    borderColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        if (currentText < textList.length - 5) {
                          currentText += 5;
                        } else if (currentText != textList.length) {
                          currentText =
                              currentText + textList.length - currentText - 1;
                        }
                      });
                    },
                  ),
                  ControlButton(
                    width: 50.0,
                    height: 50.0,
                    borderColor: Colors.transparent,
                    icon: playModeIcon(mode),
                    onTap: () {
                      if (mode == PlayMode.playthrough) {
                        mode = PlayMode.replay;
                      } else if (mode == PlayMode.replay) {
                        mode = PlayMode.shuffle;
                      } else if (mode == PlayMode.shuffle) {
                        mode = PlayMode.playthrough;
                      }
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            // Text('$delay wpm'),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 100.0, vertical: 8.0),
            //   child: Row(
            //     children: <Widget>[
            //       Icon(
            //         CustomIcons.turtoise,
            //         size: 16.0,
            //       ),
            //       Expanded(
            //         child: Padding(
            //           padding: const EdgeInsets.all(16.0),
            //           child: SliderTheme(
            //             data: SliderThemeData(
            //               activeTrackColor: accentColor,
            //               inactiveTrackColor: brightness == Brightness.dark
            //                   ? Colors.white.withOpacity(0.05)
            //                   : Colors.black.withOpacity(0.05),
            //               thumbColor: accentColor,
            //               overlayColor: accentColor.withOpacity(0.2),
            //               inactiveTickMarkColor: accentColor,
            //               activeTickMarkColor:
            //                   accentColor.computeLuminance() > 0.335
            //                       ? Colors.black.withOpacity(0.5)
            //                       : Colors.white.withOpacity(0.5),
            //             ),
            //             child: Slider(
            //               value: speed.toDouble(),
            //               divisions: 4,
            //               onChanged: (i) {
            //                 setState(() {
            //                   speed = i.toInt();
            //                   setSpeed();
            //                 });
            //               },
            //               min: 0.0,
            //               max: 100.0,
            //             ),
            //           ),
            //         ),
            //       ),
            //       Icon(CustomIcons.hare),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      onWillPop: onWillPop,
    );
  }

  IconData playModeIcon(mode) {
    IconData icon;
    if (mode == PlayMode.playthrough) {
      icon = EvaIcons.arrowheadRightOutline;
    } else if (mode == PlayMode.replay) {
      icon = Icons.repeat;
    } else if (mode == PlayMode.shuffle) {
      icon = Icons.shuffle;
    }
    return icon;
  }

  void setSpeed() {
    speedChanged = true;

    if (speed == 100) {
      delay = 100;
    } else if (speed == 75) {
      delay = 250;
    } else if (speed == 50) {
      delay = 300;
    } else if (speed == 25) {
      delay = 450;
    } else if (speed == 0) {
      delay = 600;
    }
  }

  void playReader(int delay, List<String> textList) {
    playing = !playing;
    int i = currentText;

    if (i == textList.length - 1) {
      i = -1;
      currentText = -1;
    }
    Timer.periodic(Duration(milliseconds: delay), (timer) {
      if (speedChanged) {
        speedChanged = false;
        playing = false;
        timer.cancel();
      }
      setState(() {
        if (mode == PlayMode.playthrough || mode == PlayMode.replay) {
          i = currentText++;
        } else if (mode == PlayMode.shuffle) {
          i = Random().nextInt(textList.length);
          currentText = i;
        }
        if (i == textList.length - 2 &&
                mode != PlayMode.replay &&
                mode != PlayMode.shuffle ||
            playing == false) {
          playing = false;
          timer.cancel();
        } else if (i == textList.length - 1 && mode == PlayMode.replay) {
          i = 0;
          currentText = 0;
        }
      });
    });
  }

  Future<bool> onWillPop() {
    playing = false;
    return Future.value(true);
  }
}
