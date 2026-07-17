import 'package:flutter/material.dart';
import 'package:router_practice/screens/create_task_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/project_detail_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const TrackMyWorkApp());
}

class TrackMyWorkApp extends StatelessWidget {
  const TrackMyWorkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrackMyWork',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      // Ruta inicial
      initialRoute: '/login',
      // Tabla de rutas de Navigator 1.0
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/create-task': (context) => const CreateTaskScreen(),
},
      // Navigator clásico requiere esta función para capturar rutas con parámetros dinámicos
      onGenerateRoute: (settings) {
        if (settings.name != null &&
            settings.name!.startsWith('/project-detail/')) {
          // Extraemos el ID manualmente de la ruta (Ej: /project-detail/123)
          final projectId = settings.name!.split('/').last;

          return MaterialPageRoute(
            builder: (context) => ProjectDetailScreen(projectId: projectId),
          );
        }
        return null;
      },
    );
  }
}
