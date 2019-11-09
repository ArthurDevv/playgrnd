import 'dart:math';
import 'package:flutter/material.dart';

class CardScrollWidget extends StatelessWidget {
  final List phoneList;
  final currentPage;
  final padding = 30.0;
  final verticalInset = 20.0;

  CardScrollWidget({this.currentPage, this.phoneList});

  @override
  Widget build(BuildContext context) {
    var cardAspectRatio = 9.0 / 16.0;
    var widgetAspectRatio = cardAspectRatio * 1.3;

    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 3 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 3;

        List<Widget> cardList = List();

        for (var i = 0; i < phoneList.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 30 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: Hero(
              tag: phoneList[i].phoneName,
              child: phoneList[i].phoneBack,
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
