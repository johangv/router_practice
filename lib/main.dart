import 'package:flutter/material.dart';
import 'package:router_practice/routes_config.dart';

void main() {
  runApp(const TrackMyWorkApp());
}

class TrackMyWorkApp extends StatelessWidget {
  const TrackMyWorkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: RoutesConfig.router,
    );
  }
}
