import 'package:flutter/material.dart';
import 'package:playgrnd/sections/mobHardware/pages/editPhonePage.dart';
import 'package:playgrnd/sections/mobHardware/widgets/cardScrollWidget.dart';

class PhoneStack extends StatefulWidget {
  final PageController controller;
  final double currentPage;
  final List phoneList;

  PhoneStack({
    Key key,
    this.controller,
    this.currentPage,
    this.phoneList,
  }) : super(key: key);

  @override
  _PhoneStackState createState() => _PhoneStackState();
}

class _PhoneStackState extends State<PhoneStack> {
  @override
  Widget build(BuildContext context) {
    List phoneList = widget.phoneList;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          // color: Colors.green,
          child: CardScrollWidget(
            currentPage: widget.currentPage,
            phoneList: widget.phoneList,
          ),
        ),
        Positioned.fill(
          child: GestureDetector(
            child: PageView.builder(
              itemCount: widget.phoneList.length,
              controller: widget.controller,
              reverse: true,
              itemBuilder: (context, index) {
                return Container();
              },
            ),
            onTap: () {
              int currentPage = widget.currentPage.round();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MobEditPage(
                    phone: phoneList[currentPage],
                  ),
                ),
              );
              widget.controller.animateToPage(
                currentPage,
                duration: Duration(milliseconds: 300),
                curve: Curves.decelerate,
              );
            },
          ),
        )
      ],
    );
  }
}
