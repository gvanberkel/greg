import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:greg_van_berkel/constants/story_card_customisation.dart';

class StoryCard extends StatelessWidget {
  final String storyMarkup1;
  final String storyMarkup2;
  final StoryCategory storyCategory;
  final String period;
  final String role;
  final bool expanded;

  const StoryCard({
    Key key,
    this.storyMarkup1 = '',
    this.storyMarkup2 = '',
    this.storyCategory,
    this.period = '',
    this.role = '',
    this.expanded = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (expanded)
      return Expanded(child: card(context));
    else
      return card(context);
  }

  Card card(BuildContext context) {
    return Card(
      elevation: 0,
      color: StoryCardColour.forCategory(storyCategory),
      child: Stack(
        children: [
          highlights(context),
          content(),
        ],
      ),
    );
  }

  Row highlights(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (period != '')
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    4.0,
                  ),
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 300,
                    minWidth: role != '' ? 300 : 0,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(
                      12.0,
                    ),
                    // color: Colors.white.withAlpha(
                    //   100,
                    // ),
                    child: Text(
                      period,
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 8.0,
            ),
            if (role != '')
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    4.0,
                  ),
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300, minWidth: 300),
                  child: Container(
                    padding: EdgeInsets.all(
                      12.0,
                    ),
                    color: Colors.white.withAlpha(
                      100,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My role',
                          style: Theme.of(context).textTheme.overline,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          role,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Padding content() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: MarkdownBody(
                  styleSheet: MarkdownStyleSheet(
                    blockSpacing: 7,
                    listBulletPadding: EdgeInsets.all(0),
                    p: TextStyle(
                      height: 1.6,
                    ),
                  ),
                  shrinkWrap: true,
                  selectable: true,
                  data: storyMarkup1,
                ),
              ),
              Container(
                width: role != '' ? 300 : 0,
              )
            ],
          ),
          if (storyMarkup2 != '')
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: MarkdownBody(
                styleSheet: MarkdownStyleSheet(
                  blockSpacing: 7,
                  listBulletPadding: EdgeInsets.all(0),
                  p: TextStyle(
                    height: 1.6,
                  ),
                ),
                shrinkWrap: true,
                selectable: true,
                data: storyMarkup2,
              ),
            ),
        ],
      ),
    );
  }
}
