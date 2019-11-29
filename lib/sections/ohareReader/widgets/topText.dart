import 'package:flutter/material.dart';
import 'package:playgrnd/utils/constants.dart';

class TopText extends StatelessWidget {
  final int textInt, flex, currentText;
  final bool isCenter, left;
  final List<String> textList;

  const TopText({
    this.textInt,
    this.flex = 1,
    this.isCenter = false,
    this.left = true,
    this.currentText,
    this.textList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Center(
        child: isCenter
            ? Text(
                textList[currentText],
                style: TextStyle(
                  color: kAccentColor(context),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: false,
              )
            : Text(
                left
                    ? currentText > textInt
                        ? textList[currentText - textInt]
                        : ''
                    : currentText < textList.length - textInt
                        ? textList[currentText + textInt]
                        : '',
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                  color: kThemeBrightness(context) == Brightness.dark
                      ? Colors.white54
                      : Colors.black54,
                ),
              ),
      ),
    );
  }
}
