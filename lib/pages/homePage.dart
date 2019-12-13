import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:playgrnd/pages/settingsPage.dart';
import 'package:playgrnd/pages/testPage.dart';
import 'package:playgrnd/sections/mobHardware/widgets/homePageCard.dart';
import 'package:playgrnd/sections/mobHardware/widgets/pageIndicator.dart';
import 'package:playgrnd/sections/ohareReader/widgets/homePageCard.dart';
import 'package:playgrnd/utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSectionIndex = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(LineAwesomeIcons.cog),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                ),
              ),
            ],
            expandedHeight: kScreenAwareSize(110.0, context),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'playgrnd.',
                style: kAppBarTitleTextstyle(context),
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: kScreenAwareSize(30.0, context)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Sections', style: kTitleTextStyle),
                    ),
                    Container(
                      height: 10.0,
                      child: PageIndicator(
                        currentSectionIndex: currentSectionIndex,
                        pageController: pageController,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (i) {
                    setState(() {
                      currentSectionIndex = i;
                    });
                  },
                  children: <Widget>[
                    mobHardwareHomePageCard(context),
                    ohareReaderHomePageCard(context),
                    testPageHomePageCard(context),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
