import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_slick/navigation/view_model.dart';

class G26ScreenLogic extends ViewModel {
  String education = '';
  String me = '';
  String codeCollectiveSummary = '';
  String codeCollectiveDetail = '';
  String emotionallySafeTeams = '';
  String guidepost = '';
  String tfn = '';
  String goals2021 = '';
  String stretchGoals2021 = '';
  String lookingFor = '';
  String offer = '';
  String renati = '';
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
      rootBundle.loadString('assets/cv_content/g26/emotionaly_safe_teams.md'),
      rootBundle.loadString('assets/cv_content/g26/guidepost.md'),
      rootBundle.loadString('assets/cv_content/g26/tfn.md'),
      rootBundle.loadString('assets/cv_content/g26/goals_2021.md'),
      rootBundle.loadString('assets/cv_content/g26/stretch_goals_2021.md'),
      rootBundle.loadString('assets/cv_content/g26/looking_for.md'),
      rootBundle.loadString('assets/cv_content/g26/offer.md'),
      rootBundle.loadString('assets/cv_content/g26/renati.md'),
      rootBundle.loadString('assets/cv_content/g26/values.md'),
      rootBundle.loadString('assets/cv_content/g26/strengths.md'),
      rootBundle.loadString('assets/cv_content/g26/welcome.md'),
      rootBundle.loadString('assets/cv_content/g26/about_this_page.md'),
      rootBundle.loadString('assets/cv_content/g26/technology_experience.md'),
      rootBundle.loadString('assets/cv_content/g26/developer_frameworks_summary.md'),
      rootBundle.loadString('assets/cv_content/g26/developer_frameworks_detail.md'),
    ]);

    education = results[0];
    me = results[1];
    codeCollectiveSummary = results[2];
    codeCollectiveDetail = results[3];
    emotionallySafeTeams = results[4];
    guidepost = results[5];
    tfn = results[6];
    goals2021 = results[7];
    stretchGoals2021 = results[8];
    lookingFor = results[9];
    offer = results[10];
    renati = results[11];
    values = results[12];
    stengths = results[13];
    welcome = results[14];
    aboutThisPage = results[15];
    technologyExperience = results[16];
    developerFrameworksSummary = results[17];
    developerFrameworksDetail = results[18];
  }
}
