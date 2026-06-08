import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_slick/navigation/view_model.dart';

class G26ScreenLogic extends ViewModel {
  String education = '';
  String me = '';
  String codeCollectiveSummary = '';
  String codeCollectiveDetail = '';
  String guidepost = '';
  String tfn = '';
  String tableMountainCitySightseeing = '';
  String idi = '';
  String goals2026 = '';
  String stretchGoals2026 = '';
  String lookingFor = '';
  String offer = '';
  String stengths = '';
  String values = '';
  String welcome = '';
  String aboutThisPage = '';
  String technologyExperience = '';
  String developerFrameworksSummary = '';
  String developerFrameworksDetail = '';

  @override
  Future<void> initState() async {
    final results = await Future.wait([
      rootBundle.loadString('assets/cv_content/g26/education.md'),
      rootBundle.loadString('assets/cv_content/g26/me.md'),
      rootBundle.loadString('assets/cv_content/g26/code_collective_summary.md'),
      rootBundle.loadString('assets/cv_content/g26/code_collective_detail.md'),
      rootBundle.loadString('assets/cv_content/g26/guidepost.md'),
      rootBundle.loadString('assets/cv_content/g26/tfn.md'),
      rootBundle.loadString('assets/cv_content/g26/idi.md'),
      rootBundle.loadString('assets/cv_content/g26/goals_2026.md'),
      rootBundle.loadString('assets/cv_content/g26/stretch_goals_2026.md'),
      rootBundle.loadString('assets/cv_content/g26/looking_for.md'),
      rootBundle.loadString('assets/cv_content/g26/offer.md'),
      rootBundle.loadString('assets/cv_content/g26/values.md'),
      rootBundle.loadString('assets/cv_content/g26/strengths.md'),
      rootBundle.loadString('assets/cv_content/g26/welcome.md'),
      rootBundle.loadString('assets/cv_content/g26/about_this_page.md'),
      rootBundle.loadString('assets/cv_content/g26/technology_experience.md'),
      rootBundle.loadString('assets/cv_content/g26/developer_frameworks_summary.md'),
      rootBundle.loadString('assets/cv_content/g26/developer_frameworks_detail.md'),
      rootBundle.loadString(
          'assets/cv_content/g26/table_mountain_city_sightseeing.md'),
    ]);

    education = results[0];
    me = results[1];
    codeCollectiveSummary = results[2];
    codeCollectiveDetail = results[3];
    guidepost = results[4];
    tfn = results[5];
    idi = results[6];
    goals2026 = results[7];
    stretchGoals2026 = results[8];
    lookingFor = results[9];
    offer = results[10];
    values = results[11];
    stengths = results[12];
    welcome = results[13];
    aboutThisPage = results[14];
    technologyExperience = results[15];
    developerFrameworksSummary = results[16];
    developerFrameworksDetail = results[17];
    tableMountainCitySightseeing = results[18];
  }
}
