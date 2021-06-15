import 'package:flutter/material.dart';
import 'package:flutter_flicker/flutter_flicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/routes.dart';

void main() {
  FlickerConfiguration.set(
    dashboardRoute: Routes.home,
    routes: Routes.routes,
  );

  runApp(ProviderScope(child: AboutGregApp()));
}

class AboutGregApp extends StatelessWidget {
  final FlickerRouterDelegate _routerDelegate = FlickerRouterDelegate();
  final FlickerRouteInformationParser _routeInformationParser =
      FlickerRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Greg van Berkel',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        cardColor: Colors.lightBlue[100],
        textTheme: GoogleFonts.droidSerifTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          bodyText2: GoogleFonts.raleway(),
          overline: GoogleFonts.raleway(),
        ),
      ),
    );
  }
}
