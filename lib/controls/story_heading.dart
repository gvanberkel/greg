import 'package:flutter/material.dart';

class StoryHeading extends StatelessWidget {
  final String title;

  const StoryHeading({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 4.0,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
