import 'package:flutter/material.dart';
import 'package:playgrnd/sections/ohareReader/pages/ohareReaderHomePage.dart';
import 'package:playgrnd/utils/constants.dart';
import 'package:playgrnd/widgets/floatingCard.dart';

FloatingCard ohareReaderHomePageCard(BuildContext context) {
  return FloatingCard(
    title: 'Oharé Reader',
    subtitle: 'Read text files in a unique way',
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: FittedBox(
        child: Container(
          width: kScreenAwareSize(80.0, context),
          height: kScreenAwareSize(80.0, context),
          decoration: BoxDecoration(
            color: kAccentColor(context),
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: AssetImage('assets/images/ohare.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    ),
    onPressed: () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => OhareReader())),
  );
}
