import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:router_practice/auth_guard.dart';
import 'package:router_practice/routes_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appRoute = AppRoute(authGuard: AuthGuard());

  runApp(TrackMyWorkApp(appRoute: appRoute));
}

class TrackMyWorkApp extends StatelessWidget {
  const TrackMyWorkApp({super.key, required this.appRoute});

  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoute.config(),
    );
  }
}
