import 'package:flutter/material.dart';
import 'package:greg_van_berkel/utils/responsiveness.dart';

/// Lightweight splash shown while a CV screen's markdown content loads.
///
/// It mirrors the photo + title layout that the full screen (see
/// `g_26.dart`'s `photoAndIntro`) opens with — minus the markdown-backed
/// welcome card — so the photo and name appear immediately and in the same
/// position before the rest of the document loads in.
class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    bool wide = isWideScreen(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.lightGreen[200],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Flex(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
