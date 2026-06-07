import 'package:flutter/material.dart';
import 'package:flutter_slick/navigation/view_model_widget.dart';
import 'package:greg_van_berkel/constants/routes.dart';
import 'package:greg_van_berkel/constants/story_card_customisation.dart';
import 'package:greg_van_berkel/controls/story_card.dart';
import 'package:greg_van_berkel/controls/story_heading.dart';
import 'package:greg_van_berkel/utils/responsiveness.dart';

import 'developer_frameworks_logic.dart';

class DeveloperFrameworksG26Screen
    extends ViewModelWidget<DeveloperFrameworksG26ScreenLogic> {
  DeveloperFrameworksG26Screen({super.key});

  @override
  DeveloperFrameworksG26ScreenLogic createViewModel() =>
      DeveloperFrameworksG26ScreenLogic();

  @override
  Widget buildView(BuildContext context) {
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
                onPressed: () => vm.navigation.goTo(
                  const G26Route(),
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
                  SizedBox(
                    height: 24,
                  ),
                  StoryHeading(
                    title: 'Developer frameworks',
                  ),
                  StoryCard(
                    storyCategory: StoryCategory.Coding,
                    storyMarkup1: vm.flutterSlickSummary,
                    storyMarkup2: vm.flutterSlickDetail,
                    role: 'Architect and primary developer',
                    period: '2021 to present day',
                  ),
                  StoryCard(
                    storyCategory: StoryCategory.Coding,
                    storyMarkup1: vm.slickJSSummary,
                    storyMarkup2: vm.slickJSDetail,
                    role: 'Architect and primary developer',
                    period: '2012',
                  ),
                  StoryCard(
                    storyCategory: StoryCategory.Coding,
                    storyMarkup1: vm.webFormsSPA,
                    role: 'Architect and primary developer',
                    period: '2008',
                  ),
                  StoryCard(
                    storyCategory: StoryCategory.Coding,
                    storyMarkup1: vm.cotaSummary,
                    storyMarkup2: vm.cotaDetail,
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
                        onPressed: () => vm.navigation.goTo(const HomeRoute()),
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
