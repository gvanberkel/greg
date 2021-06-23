import 'package:flutter_flicker/flutter_flicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;

class DeveloperFrameworksScreenLogic extends BaseLogic {
  String cotaSummary;
  String cotaDetail;
  String flickerSummary;
  String flickerDetail;
  String webFormsSPA;
  String slickJSSummary;
  String slickJSDetail;

  @override
  Future<void> init() async {
    var cotaSummaryFuture =
        rootBundle.loadString('assets/cv_content/cota_summary.md');
    var cotaDetailFuture =
        rootBundle.loadString('assets/cv_content/cota_detail.md');

    var flickerSummaryFuture =
        rootBundle.loadString('assets/cv_content/flicker_summary.md');
    var flickerDetailFuture =
        rootBundle.loadString('assets/cv_content/flicker_detail.md');

    var webFormsSPAFuture =
        rootBundle.loadString('assets/cv_content/web_forms_spa.md');

    var slickJSSummaryFuture =
        rootBundle.loadString('assets/cv_content/slick_js_summary.md');
    var slickJSDetailFuture =
        rootBundle.loadString('assets/cv_content/slick_js_detail.md');

    cotaSummary = await cotaSummaryFuture;
    cotaDetail = await cotaDetailFuture;

    flickerSummary = await flickerSummaryFuture;
    flickerDetail = await flickerDetailFuture;

    webFormsSPA = await webFormsSPAFuture;

    slickJSSummary = await slickJSSummaryFuture;
    slickJSDetail = await slickJSDetailFuture;

    notifyScreen(true);
  }
}

final developerFrameworksScreenProvider = ChangeNotifierProvider.autoDispose(
    (ref) => DeveloperFrameworksScreenLogic());
