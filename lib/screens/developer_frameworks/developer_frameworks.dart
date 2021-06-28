import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greg_van_berkel/constants/routes.dart';
import 'package:greg_van_berkel/constants/story_card_customisation.dart';
import 'package:greg_van_berkel/controls/story_card.dart';
import 'package:greg_van_berkel/controls/story_heading.dart';
import 'package:greg_van_berkel/utils/responsiveness.dart';

import 'developer_frameworks_logic.dart';

class DeveloperFrameworksScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final logic = watch(developerFrameworksScreenProvider);
    var wide = isWideScreen(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.lightGreen[200],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.pink.shade800,
                ),
                onPressed: () => logic.navigate(
                  Routes.g21,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: wide ? 128 : 16.0,
                right: wide ? 128 : 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //story(context, logic),
                  SizedBox(
                    height: 24,
                  ),
                  StoryHeading(
                    title: 'Developer frameworks',
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
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => logic.navigate(Routes.home),
                        child: Text('Back to the main document'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
