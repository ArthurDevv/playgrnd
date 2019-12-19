import 'package:flutter/material.dart';
import 'package:playgrnd/sections/ohareReader/data/testText.dart';
import 'package:playgrnd/sections/ohareReader/utils/selectTextFile.dart';
import 'package:playgrnd/utils/constants.dart';

class OhareReader extends StatefulWidget {
  @override
  _OhareReaderState createState() => _OhareReaderState();
}

class _OhareReaderState extends State<OhareReader> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Color accentColor = Theme.of(context).accentColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Oharé Reader'),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Container(
            //   width: kScreenAwareSize(200.0, context),
            //   height: kScreenAwareSize(200.0, context),
            //   decoration: BoxDecoration(
            //     color: accentColor,
            //     borderRadius: BorderRadius.circular(50.0),
            //     image: DecorationImage(
            //       image: AssetImage('assets/images/ohare.png'),
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 30.0),
            // Text(
            //   'Oharé Reader',
            //   style: TextStyle(
            //     fontSize: 48.0,
            //     fontFamily: 'Righteous',
            //   ),
            // ),
            SizedBox(height: 16.0),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: AnimatedCrossFade(
                firstChild: Text(
                  desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Quicksand',
                  ),
                ),
                secondChild: Text(
                  desc,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Quicksand',
                  ),
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: kThemeAnimationDuration,
              ),
            ),
            GestureDetector(
              child: Text(
                isExpanded ? 'less' : 'more',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Quicksand',
                  color: accentColor,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
            SizedBox(height: 16.0),
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 8.0, 8.0, 8.0),
                child: Text(
                  'Select Text File...',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Quicksand',
                    color: accentColor,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                SelectTextFile().openFileExplorer(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1.0,
        child: Container(
          // height: ,
          child: Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  child: Icon(Icons.cake),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
