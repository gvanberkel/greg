import 'dart:async';

import 'package:flutter_flicker/flutter_flicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greg_van_berkel/constants/routes.dart';

class HomeScreenLogic extends BaseLogic {
  @override
  Future<void> init() async {
    notifyScreen(true);
  }

  void goToCurrentVersion() {
    this.navigate(Routes.g21);
  }
}

final homeScreenProvider =
    ChangeNotifierProvider.autoDispose((ref) => HomeScreenLogic());
