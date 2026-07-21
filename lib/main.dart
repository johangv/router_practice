import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:router_practice/auth_guard.dart';
import 'package:router_practice/routes_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appRoute = AppRoute(authGuard: AuthGuard());

  // Solicitar permisos de notificación nativos al iniciar la aplicación
  await requestNativeNotificationPermissions();

  runApp(TrackMyWorkApp(appRoute: appRoute));
}

Future<void> requestNativeNotificationPermissions() async {
  // Definimos un canal único de comunicación
  const platform = MethodChannel('com.example.routerPractice/notifications');

  try {
    final bool granted = await platform.invokeMethod('requestPermissions');
    print('🔔 Permisos concedidos: $granted');
  } on PlatformException catch (e) {
    print('❌ Error al solicitar permisos: ${e.message}');
  }
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
