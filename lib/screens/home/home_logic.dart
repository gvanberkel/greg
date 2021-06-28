import 'package:flutter_flicker/flutter_flicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenLogic extends BaseLogic {
  @override
  Future<void> init() async {
    notifyScreen(true);
  }
}

final homeScreenProvider =
    ChangeNotifierProvider.autoDispose((ref) => HomeScreenLogic());
