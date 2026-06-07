import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_slick/navigation/view_model.dart';

class DeveloperFrameworksScreenLogic extends ViewModel {
  String cotaSummary = '';
  String cotaDetail = '';
  String flickerSummary = '';
  String flickerDetail = '';
  String webFormsSPA = '';
  String slickJSSummary = '';
  String slickJSDetail = '';

  @override
  Future<void> initState() async {
    final results = await Future.wait([
      rootBundle.loadString('assets/cv_content/g21/cota_summary.md'),
      rootBundle.loadString('assets/cv_content/g21/cota_detail.md'),
      rootBundle.loadString('assets/cv_content/g21/flicker_summary.md'),
      rootBundle.loadString('assets/cv_content/g21/flicker_detail.md'),
      rootBundle.loadString('assets/cv_content/g21/web_forms_spa.md'),
      rootBundle.loadString('assets/cv_content/g21/slick_js_summary.md'),
      rootBundle.loadString('assets/cv_content/g21/slick_js_detail.md'),
    ]);

    cotaSummary = results[0];
    cotaDetail = results[1];
    flickerSummary = results[2];
    flickerDetail = results[3];
    webFormsSPA = results[4];
    slickJSSummary = results[5];
    slickJSDetail = results[6];
  }
}
