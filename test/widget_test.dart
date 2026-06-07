// Basic tests for the CV app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:greg_van_berkel/constants/story_card_customisation.dart';
import 'package:greg_van_berkel/controls/story_heading.dart';

void main() {
  group('StoryCardColour.forCategory', () {
    test('maps known categories to their colours', () {
      expect(StoryCardColour.forCategory(StoryCategory.Coding),
          Colors.lightGreen[200]);
      expect(StoryCardColour.forCategory(StoryCategory.Business),
          Colors.brown[200]);
    });

    test('falls back to grey for an unset category on a narrow layout', () {
      expect(StoryCardColour.forCategory(null), Colors.grey.shade300);
    });

    test('falls back to transparent for an unset category on a wide layout',
        () {
      expect(StoryCardColour.forCategory(null, wide: true), Colors.transparent);
    });
  });

  testWidgets('StoryHeading renders its title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StoryHeading(title: 'Education'),
        ),
      ),
    );

    expect(find.text('Education'), findsOneWidget);
  });
}
