import 'package:flutter_flicker/flutter_flicker.dart';
import 'package:greg_van_berkel/screens/home/home.dart';
import 'package:greg_van_berkel/screens/home/home_logic.dart';

class Routes {
  static List<RouteInfo> routes = [
    home,
  ];

  static final home = RouteInfo(
    routeName: 'home',
    screenName: 'Home',
    screen: () => HomeScreen(),
    logicProvider: homeScreenProvider,
    limitToRoles: [],
  );
}
