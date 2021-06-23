import 'package:flutter/material.dart';

enum StoryCategory {
  Business,
  People,
  Coding,
  LookingFor,
  Offer,
  Other,
}

class StoryCardColour {
  static Color forCategory(StoryCategory storyCategory, {bool wide}) {
    switch (storyCategory) {
      case StoryCategory.Business:
        return Colors.brown[200];
      case StoryCategory.Coding:
        return Colors.lightGreen[200];
      case StoryCategory.People:
        return Colors.orange[100];
      case StoryCategory.LookingFor:
        return Colors.orange[300];
      case StoryCategory.Offer:
        return Colors.green[300];
      case StoryCategory.Other:
        return Colors.blueGrey[100];
      default:
        return wide ? Colors.transparent : Colors.grey.shade300;
    }
  }
}
