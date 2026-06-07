import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_slick/navigation/view_model.dart';

class DeveloperFrameworksG26ScreenLogic extends ViewModel {
  String cotaSummary = '';
  String cotaDetail = '';
  String flutterSlickSummary = '';
  String flutterSlickDetail = '';
  String webFormsSPA = '';
  String slickJSSummary = '';
  String slickJSDetail = '';

  @override
  Future<void> initState() async {
    final results = await Future.wait([
      rootBundle.loadString('assets/cv_content/g26/cota_summary.md'),
      rootBundle.loadString('assets/cv_content/g26/cota_detail.md'),
      rootBundle.loadString('assets/cv_content/g26/flutter_slick_summary.md'),
      rootBundle.loadString('assets/cv_content/g26/flutter_slick_detail.md'),
      rootBundle.loadString('assets/cv_content/g26/web_forms_spa.md'),
      rootBundle.loadString('assets/cv_content/g26/slick_js_summary.md'),
      rootBundle.loadString('assets/cv_content/g26/slick_js_detail.md'),
    ]);

    cotaSummary = results[0];
    cotaDetail = results[1];
    flutterSlickSummary = results[2];
    flutterSlickDetail = results[3];
    webFormsSPA = results[4];
    slickJSSummary = results[5];
    slickJSDetail = results[6];
  }
}
