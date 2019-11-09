import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/pages/editPhonePage.dart';
import 'package:playgrnd/sections/mobHardware/widgets/cardScrollWidget.dart';

class PhoneStack extends StatelessWidget {
  final PageController controller;
  final double currentPage;
  final List phoneList;

  const PhoneStack({
    Key key,
    this.controller,
    this.currentPage,
    this.phoneList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          // color: Colors.green,
          child: CardScrollWidget(
            currentPage: currentPage,
            phoneList: phoneList,
          ),
        ),
        Positioned.fill(
          child: GestureDetector(
            child: PageView.builder(
              itemCount: phoneList.length,
              controller: controller,
              reverse: true,
              itemBuilder: (context, index) {
                return Container();
              },
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MobEditPage(
                    phoneBack: phoneList[currentPage.toInt()].phoneBack,
                    phoneFront: phoneList[currentPage.toInt()].phoneFront,
                    phoneName: phoneList[currentPage.toInt()].phoneName,
                    colors: phoneList[currentPage.toInt()].colors,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
