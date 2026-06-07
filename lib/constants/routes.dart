import 'package:flutter/material.dart';
import 'package:flutter_slick/navigation/slick_route.dart';
import 'package:go_router/go_router.dart';

import '../screens/g_21/developer_frameworks.dart';
import '../screens/g_21/g_21.dart';
import '../screens/g_26/developer_frameworks.dart';
import '../screens/g_26/g_26.dart';
import '../screens/home/home.dart';

/// Typed routes for the app. Each [SlickRoute] hard-codes its [location] so we
/// can navigate with `navigation.goTo(const G21Route())` without pulling in the
/// go_router_builder code generator.
///
/// Each CV version is namespaced under its own path (`/g21`, `/g26`) with a
/// matching developer-frameworks detail page, so adding a future version is a
/// matter of copying the pattern below.
class HomeRoute extends SlickRoute {
  const HomeRoute();

  @override
  String get location => '/';

  @override
  Widget build(BuildContext context, GoRouterState state) => HomeScreen();
}

// --- 2021 version -----------------------------------------------------------

class G21Route extends SlickRoute {
  const G21Route();

  @override
  String get location => '/g21';

  @override
  Widget build(BuildContext context, GoRouterState state) => G21Screen();
}

class G21FrameworksRoute extends SlickRoute {
  const G21FrameworksRoute();

  @override
  String get location => '/g21/frameworks';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DeveloperFrameworksScreen();
}

// --- 2026 version -----------------------------------------------------------

class G26Route extends SlickRoute {
  const G26Route();

  @override
  String get location => '/g26';

  @override
  Widget build(BuildContext context, GoRouterState state) => G26Screen();
}

class G26FrameworksRoute extends SlickRoute {
  const G26FrameworksRoute();

  @override
  String get location => '/g26/frameworks';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      DeveloperFrameworksG26Screen();
}

/// Plain [GoRoute] definitions handed to `NavigationLogic`. Each `path` matches
/// the [SlickRoute.location] above so that `navigation.goTo(...)` resolves.
final List<RouteBase> appRoutes = <RouteBase>[
  GoRoute(
    path: const HomeRoute().location,
    builder: (context, state) => const HomeRoute().build(context, state),
  ),
  GoRoute(
    path: const G21Route().location,
    builder: (context, state) => const G21Route().build(context, state),
  ),
  GoRoute(
    path: const G21FrameworksRoute().location,
    builder: (context, state) =>
        const G21FrameworksRoute().build(context, state),
  ),
  GoRoute(
    path: const G26Route().location,
    builder: (context, state) => const G26Route().build(context, state),
  ),
  GoRoute(
    path: const G26FrameworksRoute().location,
    builder: (context, state) =>
        const G26FrameworksRoute().build(context, state),
  ),
];
