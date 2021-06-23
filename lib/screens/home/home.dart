import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greg_van_berkel/constants/story_card_customisation.dart';
import 'package:greg_van_berkel/controls/story_card.dart';
import 'package:greg_van_berkel/controls/story_heading.dart';
import 'package:greg_van_berkel/utils/responsiveness.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_logic.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final logic = watch(homeScreenProvider);
    bool wide = isWide(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.lightGreen[200],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            children: [
              photoAndIntro(context, logic),
              highLevel(context, logic),
              SizedBox(
                height: 24,
              ),
              Flex(
                direction: wide ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: wide ? MainAxisSize.max : MainAxisSize.min,
                children: [
                  story(context, logic),
                  if (wide)
                    SizedBox(
                      width: 8.0,
                    ),
                  keyPoints(context, logic)
                ],
              ),
              SizedBox(
                height: 24,
              ),
              storyKey(),
              SizedBox(
                height: 24,
              ),
              Divider(),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: 20,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  SelectableText('gvanberkel@gmail.com'),
                ],
              ),
              InkWell(
                onTap: () {
                  launch('https://twitter.com/gregvanberkel');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/twitter.png',
                      width: 20,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text('gregvanberkel'),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Wrap storyKey() {
    return Wrap(
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      spacing: 16.0,
      runSpacing: 4.0,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              child: SizedBox(
                width: 30,
                height: 30,
                child: Container(
                  color: StoryCardColour.forCategory(StoryCategory.Business),
                ),
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Text('Somewhat businessy things'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              child: SizedBox(
                width: 30,
                height: 30,
                child: Container(
                  color: StoryCardColour.forCategory(StoryCategory.People),
                ),
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Text('Somewhat management and people related'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              child: SizedBox(
                width: 30,
                height: 30,
                child: Container(
                  color: StoryCardColour.forCategory(StoryCategory.Coding),
                ),
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Text('Coding things'),
            SizedBox(
              width: 16.0,
            ),
          ],
        ),
      ],
    );
  }

  Widget highLevel(BuildContext context, HomeScreenLogic logic) {
    bool wide = isWide(context);
    return Flex(
      mainAxisSize: wide ? MainAxisSize.max : MainAxisSize.min,
      direction: wide ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StoryCard(
          storyMarkup1: logic.me,
          storyCategory: StoryCategory.Other,
          expanded: wide,
        ),
        SizedBox(
          width: 8.0,
        ),
        StoryCard(
          storyCategory: StoryCategory.LookingFor,
          storyMarkup1: logic.lookingFor,
          expanded: wide,
        ),
        SizedBox(
          width: 8.0,
        ),
        StoryCard(
          storyCategory: StoryCategory.Offer,
          storyMarkup1: logic.offer,
          expanded: wide,
        ),
      ],
    );
  }

  Widget keyPoints(BuildContext context, HomeScreenLogic logic) {
    bool wide = isWide(context);

    return Flexible(
      fit: wide ? FlexFit.tight : FlexFit.loose,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StoryHeading(
            title: 'Education',
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: logic.education,
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: logic.technologyExperience,
          ),
          SizedBox(
            height: 16.0,
          ),
          StoryHeading(
            title: 'Principles',
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: logic.values,
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: logic.stengths,
          ),
          SizedBox(
            height: 16.0,
          ),
          StoryHeading(
            title: 'What\'s Next',
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: logic.goals2021,
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: logic.stretchGoals2021,
          ),
          SizedBox(
            height: 16.0,
          ),
          StoryHeading(
            title: 'About this url',
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: logic.aboutThisPage,
          ),
        ],
      ),
    );
  }

  Widget story(BuildContext context, HomeScreenLogic logic) {
    bool wide = isWide(context);

    return Flexible(
      fit: wide ? FlexFit.tight : FlexFit.loose,
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StoryHeading(
            title: 'Career Highlights',
          ),
          StoryCard(
            storyCategory: StoryCategory.Business,
            storyMarkup1: logic.codeCollectiveSummary,
            storyMarkup2: logic.codeCollectiveDetail,
            period: '2007 to present day',
            role: 'CEO, coder, team player and other odds and ends',
          ),
          StoryCard(
            storyMarkup1: logic.renati,
            period: '2019 to present day',
            role: 'Head of software development and technology',
            storyCategory: StoryCategory.People,
          ),
          StoryCard(
            storyCategory: StoryCategory.People,
            period: '2007 to present day',
            role: 'Product manager and lead developer',
            storyMarkup1: logic.tfn,
          ),
          StoryCard(
            storyCategory: StoryCategory.People,
            period: '2009 to present day',
            role: 'Agile coach and/or scrum master',
            storyMarkup1: logic.emotionallySafeTeams,
          ),
          StoryCard(
            storyCategory: StoryCategory.Business,
            storyMarkup1: logic.guidepost,
            role:
                'Developing the initial software architecture and currently accountable for dev team delivery',
            period: '2011 to present day',
          ),
          StoryCard(
            storyCategory: StoryCategory.Coding,
            storyMarkup1: logic.flickerSummary,
            storyMarkup2: logic.flickerDetail,
            role: 'Architect and primary developer',
            period: '2021',
          ),
          StoryCard(
            storyCategory: StoryCategory.Coding,
            storyMarkup1: logic.slickJSSummary,
            storyMarkup2: logic.slickJSDetail,
            role: 'Architect and primary developer',
            period: '2012',
          ),
          StoryCard(
            storyCategory: StoryCategory.Coding,
            storyMarkup1: logic.webFormsSPA,
            role: 'Architect and primary developer',
            period: '2008',
          ),
          StoryCard(
            storyCategory: StoryCategory.Coding,
            storyMarkup1: logic.cotaSummary,
            storyMarkup2: logic.cotaDetail,
            role: 'Architect and primary developer',
            period: '2005',
          ),
        ],
      ),
    );
  }

  Widget photoAndIntro(BuildContext context, HomeScreenLogic logic) {
    bool wide = isWide(context);

    return Flex(
      direction: wide ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: wide ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 4.0,
            bottom: 16.0,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(
              'assets/images/profile.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Flexible(
          fit: wide ? FlexFit.tight : FlexFit.loose,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: wide ? 16.0 : 0.0,
                  top: 16.0,
                ),
                child: Text(
                  'Greg van Berkel',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              StoryCard(
                storyMarkup1: logic.welcome,
              )
            ],
          ),
        ),
      ],
    );
  }
}
