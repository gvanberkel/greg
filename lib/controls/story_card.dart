import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:greg_van_berkel/constants/story_card_customisation.dart';
import 'package:greg_van_berkel/utils/responsiveness.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryCard extends StatelessWidget {
  final String storyMarkup1;
  final String storyMarkup2;
  final StoryCategory? storyCategory;
  final String period;
  final String role;
  final bool expanded;
  final String? moreInfoButtonText;
  final VoidCallback? moreInfoOnPressed;

  const StoryCard({
    super.key,
    this.storyMarkup1 = '',
    this.storyMarkup2 = '',
    this.storyCategory,
    this.period = '',
    this.role = '',
    this.expanded = false,
    this.moreInfoButtonText,
    this.moreInfoOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (expanded) {
      return Expanded(child: card(context));
    } else {
      return card(context);
    }
  }

  Card card(BuildContext context) {
    bool wide = isWideScreen(context);

    return Card(
      elevation: 0,
      color: StoryCardColour.forCategory(storyCategory, wide: wide),
      child: SelectionArea(
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
      ),
    );
  }

  Row moreInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: moreInfoOnPressed,
          child: Text(
            moreInfoButtonText ?? '',
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
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          role,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (period != '')
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  period,
                                  style: Theme.of(context).textTheme.labelSmall,
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
                child: markdown(storyMarkup1),
              ),
              Container(
                width: role != '' && wide ? 300 : 0,
              )
            ],
          ),
          if (storyMarkup2 != '')
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                    ),
                    child: markdown(storyMarkup2),
                  ),
                ),
              ],
            ),
          if (moreInfoButtonText != null) moreInfo(),
        ],
      ),
    );
  }

  // Renders markdown with non-selectable text so that link taps use a normal
  // tap recogniser (reliable on web). Text remains selectable via the
  // [SelectionArea] wrapping the card. Both story blocks share this so links
  // work in the detail block too.
  Widget markdown(String data) {
    return MarkdownBody(
      data: data,
      selectable: false,
      shrinkWrap: true,
      styleSheet: markdownStyle(),
      onTapLink: (text, href, title) {
        if (href != null) {
          launchUrl(Uri.parse(href));
        }
      },
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
