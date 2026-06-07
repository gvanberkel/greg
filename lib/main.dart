import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slick/navigation/logic.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final navigation = NavigationLogic(
    routes: appRoutes,
    initialLocation: const HomeRoute(),
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.lightGreen[200],
  ));

  runApp(AboutGregApp(navigation: navigation));
}

class AboutGregApp extends StatelessWidget {
  AboutGregApp({super.key, required this.navigation});

  final NavigationLogic navigation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Greg van Berkel',
      routerConfig: navigation.goRouter,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        cardColor: Colors.lightBlue[100],
        textTheme:
            Theme.of(context).textTheme.apply(fontFamily: 'DroidSerif').copyWith(
                  bodyMedium: GoogleFonts.raleway(
                    fontSize: 15,
                  ),
                  labelSmall: GoogleFonts.raleway(),
                ),
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.lightGreen[200],
          secondary: Colors.cyan[600],
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.pink.shade100,
          selectionHandleColor: Colors.pink.shade200,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: GoogleFonts.raleway().copyWith(
              color: Colors.black,
            ),
            foregroundColor: Colors.pink.shade800,
          ),
        ),
      ),
    );
  }
}
