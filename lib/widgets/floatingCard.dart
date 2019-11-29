import 'package:flutter/material.dart';
import 'package:playgrnd/utils/constants.dart';

class FloatingCard extends StatelessWidget {
  final Widget child;
  final String title;
  final String subtitle;
  final Function onPressed;

  const FloatingCard({
    this.child,
    this.onPressed,
    this.title = '',
    this.subtitle = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(16.0),
        width: kScreenAwareSize(300, context),
        height: kScreenAwareSize(150, context),
        decoration: BoxDecoration(
          color: kThemeBrightness(context) == Brightness.light
              ? Colors.white
              : Colors.grey[900],
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15.0,
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Righteous',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Quicksand',
                        // letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            child ?? SizedBox(),
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}
