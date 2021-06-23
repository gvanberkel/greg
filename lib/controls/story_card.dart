import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:greg_van_berkel/constants/story_card_customisation.dart';
import 'package:greg_van_berkel/utils/responsiveness.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryCard extends StatelessWidget {
  final String storyMarkup1;
  final String storyMarkup2;
  final StoryCategory storyCategory;
  final String period;
  final String role;
  final bool expanded;
  final String moreInfoButtonText;
  final VoidCallback moreInfoOnPressed;

  const StoryCard({
    Key key,
    this.storyMarkup1 = '',
    this.storyMarkup2 = '',
    this.storyCategory,
    this.period = '',
    this.role = '',
    this.expanded = false,
    this.moreInfoButtonText,
    this.moreInfoOnPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (expanded)
      return Expanded(child: card(context));
    else
      return card(context);
  }

  Card card(BuildContext context) {
    bool wide = isWideScreen(context);

    return Card(
      elevation: 0,
      color: StoryCardColour.forCategory(storyCategory, wide: wide),
      child: wide
          ? Stack(
              children: [
                highlights(context),
                content(context),
              ],
            )
          : Column(
              children: [
                content(context),
                highlights(context),
              ],
            ),
    );
  }

  Row moreInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: this.moreInfoOnPressed,
          child: Text(
            this.moreInfoButtonText,
          ),
        ),
      ],
    );
  }

  Row highlights(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
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
                        if (period != null)
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  period,
                                  style: Theme.of(context).textTheme.overline,
                                ),
                              ],
                            ),
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

  Padding content(BuildContext context) {
    bool wide = isWideScreen(context);

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
                  onTapLink: (text, href, title) {
                    launch(href);
                  },
                  styleSheet: markdownStyle(),
                  shrinkWrap: true,
                  selectable: true,
                  data: storyMarkup1,
                ),
              ),
              Container(
                width: role != '' && wide ? 300 : 0,
              )
            ],
          ),
          if (storyMarkup2 != '')
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: MarkdownBody(
                styleSheet: markdownStyle(),
                shrinkWrap: true,
                selectable: true,
                data: storyMarkup2,
              ),
            ),
          if (moreInfoButtonText != null) moreInfo(),
        ],
      ),
    );
  }

  MarkdownStyleSheet markdownStyle() {
    return MarkdownStyleSheet(
      blockSpacing: 7,
      listBulletPadding: EdgeInsets.all(0),
      p: TextStyle(
        height: 1.6,
      ),
      a: TextStyle(
        color: Colors.pink.shade800,
      ),
      h3: TextStyle(
        height: 2,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }
}
