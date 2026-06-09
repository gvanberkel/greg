import 'package:flutter/material.dart';
import 'package:flutter_slick/navigation/view_model_widget.dart';
import 'package:greg_van_berkel/constants/routes.dart';
import 'package:greg_van_berkel/constants/story_card_customisation.dart';
import 'package:greg_van_berkel/controls/splash.dart';
import 'package:greg_van_berkel/controls/story_card.dart';
import 'package:greg_van_berkel/controls/story_heading.dart';
import 'package:greg_van_berkel/utils/responsiveness.dart';
import 'package:url_launcher/url_launcher.dart';

import 'g_26_logic.dart';

class G26Screen extends ViewModelWidget<G26ScreenLogic> {
  G26Screen({super.key});

  @override
  G26ScreenLogic createViewModel() => G26ScreenLogic();

  /// Splash shown while the markdown content loads. Renders just the photo and
  /// name so something appears immediately ahead of the full document.
  @override
  Widget buildLoading(BuildContext context) => const Splash();

  @override
  Widget buildView(BuildContext context) {
    bool wide = isWideScreen(context);

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
              photoAndIntro(context),
              highLevel(context),
              SizedBox(
                height: 24,
              ),
              Flex(
                direction: wide ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: wide ? MainAxisSize.max : MainAxisSize.min,
                children: [
                  story(context),
                  if (wide)
                    SizedBox(
                      width: 8.0,
                    ),
                  keyPoints(context)
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Divider(),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse('mailto:gvanberkel@gmail.com'));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email_outlined,
                      size: 20,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text('gvanberkel@gmail.com'),
                  ],
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(
                      'https://docs.google.com/document/d/15NCOXhoh1e4Vjr-ziEFSQ-CcWP8zCPqmeqESynUmyOs/'));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.print),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text('Printable version'),
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
            Text('Mostly coding things'),
            SizedBox(
              width: 16.0,
            ),
          ],
        ),
      ],
    );
  }

  Widget highLevel(BuildContext context) {
    bool wide = isWideScreen(context);
    return Flex(
      mainAxisSize: wide ? MainAxisSize.max : MainAxisSize.min,
      direction: wide ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StoryCard(
          storyMarkup1: vm.me,
          storyCategory: StoryCategory.Other,
          expanded: wide,
        ),
        SizedBox(
          width: 8.0,
        ),
        StoryCard(
          storyCategory: StoryCategory.LookingFor,
          storyMarkup1: vm.lookingFor,
          expanded: wide,
        ),
        SizedBox(
          width: 8.0,
        ),
        StoryCard(
          storyCategory: StoryCategory.Offer,
          storyMarkup1: vm.offer,
          expanded: wide,
        ),
      ],
    );
  }

  Widget keyPoints(BuildContext context) {
    bool wide = isWideScreen(context);

    return Flexible(
      fit: wide ? FlexFit.tight : FlexFit.loose,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!wide)
            SizedBox(
              height: 16.0,
            ),
          StoryHeading(
            title: 'Education',
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: vm.education,
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: vm.technologyExperience,
          ),
          SizedBox(
            height: 16.0,
          ),
          StoryHeading(
            title: 'Principles',
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: vm.values,
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: vm.stengths,
          ),
          SizedBox(
            height: 16.0,
          ),
          StoryHeading(
            title: 'What\'s next',
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: vm.goals2026,
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: vm.stretchGoals2026,
          ),
          SizedBox(
            height: 16.0,
          ),
          StoryHeading(
            title: 'About this page',
          ),
          StoryCard(
            storyCategory: StoryCategory.Other,
            storyMarkup1: vm.aboutThisPage,
          ),
        ],
      ),
    );
  }

  Widget story(BuildContext context) {
    bool wide = isWideScreen(context);

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
            storyMarkup1: vm.codeCollectiveSummary,
            storyMarkup2: vm.codeCollectiveDetail,
            period: '2007 to present day',
            role: 'CEO, coder, team player and other odds and ends',
          ),
          StoryCard(
            storyCategory: StoryCategory.People,
            period: '2019 to present day',
            role:
                'Chief Solutions Architect (since March 2026), previously Head of software development and technology',
            storyMarkup1: vm.tfn,
          ),
          StoryCard(
            storyCategory: StoryCategory.People,
            period: 'since 2021',
            role: 'Product, Software Architecture and account leadership',
            storyMarkup1: vm.tableMountainCitySightseeing,
          ),
          StoryCard(
            storyCategory: StoryCategory.People,
            storyMarkup1: vm.guidepost,
            role: 'Founder software architect, then CTO (from 2022)',
            period: '2011 to Feb 2026',
          ),
          StoryCard(
            storyCategory: StoryCategory.People,
            period: 'Dec 2001 to Mar 2007',
            role: 'Senior Software Engineer (started as a Junior Developer)',
            storyMarkup1: vm.idi,
          ),
          StoryCard(
            storyCategory: StoryCategory.Coding,
            storyMarkup1: vm.developerFrameworksSummary,
            storyMarkup2: vm.developerFrameworksDetail,
            role: 'Architect and primary developer',
            moreInfoButtonText: 'More on developer frameworks',
            moreInfoOnPressed: () =>
                vm.navigation.goTo(const G26FrameworksRoute()),
            period: '2005 to present day',
          ),
        ],
      ),
    );
  }

  Widget photoAndIntro(BuildContext context) {
    bool wide = isWideScreen(context);

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
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              StoryCard(
                storyMarkup1: vm.welcome,
              )
            ],
          ),
        ),
      ],
    );
  }
}
