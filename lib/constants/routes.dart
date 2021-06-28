import 'package:flutter_flicker/flutter_flicker.dart';
import 'package:greg_van_berkel/screens/developer_frameworks/developer_frameworks.dart';
import 'package:greg_van_berkel/screens/developer_frameworks/developer_frameworks_logic.dart';
import 'package:greg_van_berkel/screens/g_21/g_21.dart';
import 'package:greg_van_berkel/screens/g_21/g_21_logic.dart';
import 'package:greg_van_berkel/screens/home/home.dart';
import 'package:greg_van_berkel/screens/home/home_logic.dart';

class Routes {
  static List<RouteInfo> routes = [
    home,
    g21,
    developerFrameworks,
  ];

  static final home = RouteInfo(
    routeName: 'home',
    screenName: 'Home',
    screen: () => HomeScreen(),
    logicProvider: homeScreenProvider,
    limitToRoles: [],
  );

  static final g21 = RouteInfo(
    routeName: 'g21',
    screenName: 'Home',
    screen: () => G21Screen(),
    logicProvider: g21ScreenProvider,
    limitToRoles: [],
  );

  static final developerFrameworks = RouteInfo(
    routeName: 'frameworks',
    screenName: 'Developer Frameworks',
    screen: () => DeveloperFrameworksScreen(),
    logicProvider: developerFrameworksScreenProvider,
    limitToRoles: [],
  );
}
