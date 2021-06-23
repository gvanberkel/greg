import 'package:flutter_flicker/flutter_flicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeScreenLogic extends BaseLogic {
  String education;
  String me;
  String codeCollectiveSummary;
  String codeCollectiveDetail;
  String cotaSummary;
  String cotaDetail;
  String emotionallySafeTeams;
  String flickerSummary;
  String flickerDetail;
  String guidepost;
  String tfn;
  String webFormsSPA;
  String slickJSSummary;
  String slickJSDetail;
  String goals2021;
  String stretchGoals2021;
  String lookingFor;
  String offer;
  String renati;
  String stengths;
  String values;
  String welcome;
  String aboutThisPage;
  String technologyExperience;
  String developerFrameworksSummary;
  String developerFrameworksDetail;

  @override
  Future<void> init() async {
    var educationFuture =
        rootBundle.loadString('assets/cv_content/education.md');
    var meFuture = rootBundle.loadString('assets/cv_content/me.md');

    var codeCollectiveSummaryFuture =
        rootBundle.loadString('assets/cv_content/code_collective_summary.md');
    var codeCollectiveDetailFuture =
        rootBundle.loadString('assets/cv_content/code_collective_detail.md');

    var emotionallySafeTeamsFuture =
        rootBundle.loadString('assets/cv_content/emotionaly_safe_teams.md');

    var flickerSummaryFuture =
        rootBundle.loadString('assets/cv_content/flicker_summary.md');
    var flickerDetailFuture =
        rootBundle.loadString('assets/cv_content/flicker_detail.md');

    var guidepostFuture =
        rootBundle.loadString('assets/cv_content/guidepost.md');
    var tfnFuture = rootBundle.loadString('assets/cv_content/tfn.md');

    var goals2021Future =
        rootBundle.loadString('assets/cv_content/goals_2021.md');
    var stretchGoals2021Future =
        rootBundle.loadString('assets/cv_content/stretch_goals_2021.md');
    var lookingForFuture =
        rootBundle.loadString('assets/cv_content/looking_for.md');
    var offerFuture = rootBundle.loadString('assets/cv_content/offer.md');
    var renatiFuture = rootBundle.loadString('assets/cv_content/renati.md');

    var valuesFuture = rootBundle.loadString('assets/cv_content/values.md');
    var strengthsFuture =
        rootBundle.loadString('assets/cv_content/strengths.md');

    var welcomeFuture = rootBundle.loadString('assets/cv_content/welcome.md');

    var aboutThisPageFuture =
        rootBundle.loadString('assets/cv_content/about_this_page.md');

    var technologyExperienceFuture =
        rootBundle.loadString('assets/cv_content/technology_experience.md');

    var developerFrameworksSummaryFuture = rootBundle
        .loadString('assets/cv_content/developer_frameworks_summary.md');

    var developerFrameworksDetailFuture = rootBundle
        .loadString('assets/cv_content/developer_frameworks_detail.md');

    education = await educationFuture;
    me = await meFuture;
    codeCollectiveSummary = await codeCollectiveSummaryFuture;
    codeCollectiveDetail = await codeCollectiveDetailFuture;

    emotionallySafeTeams = await emotionallySafeTeamsFuture;

    flickerSummary = await flickerSummaryFuture;
    flickerDetail = await flickerDetailFuture;

    guidepost = await guidepostFuture;
    tfn = await tfnFuture;

    goals2021 = await goals2021Future;
    lookingFor = await lookingForFuture;
    offer = await offerFuture;
    renati = await renatiFuture;
    values = await valuesFuture;
    stengths = await strengthsFuture;
    welcome = await welcomeFuture;
    aboutThisPage = await aboutThisPageFuture;
    technologyExperience = await technologyExperienceFuture;
    stretchGoals2021 = await stretchGoals2021Future;

    developerFrameworksSummary = await developerFrameworksSummaryFuture;
    developerFrameworksDetail = await developerFrameworksDetailFuture;

    notifyScreen(true);
  }
}

final homeScreenProvider =
    ChangeNotifierProvider.autoDispose((ref) => HomeScreenLogic());
