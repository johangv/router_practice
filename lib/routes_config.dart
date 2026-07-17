import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router_practice/models/task_arguments.dart';
import 'package:router_practice/screens/create_task_screen.dart';
import 'package:router_practice/screens/home_screen.dart';
import 'package:router_practice/screens/login_screen.dart';
import 'package:router_practice/screens/profile_screen.dart';
import 'package:router_practice/screens/profile_tab_screen.dart';
import 'package:router_practice/screens/project_detail_screen.dart';
import 'package:router_practice/screens/project_tabs_screen.dart';

class RoutesConfig {

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation:
        '/home/projects', // Arrancamos directo en la pestaña de proyectos
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) {
      // Lógica de Guard, para loggin

      final bool isLoggedIn = checkUserSession();
      final bool isLoggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoggingIn) return '/login';

      if (isLoggedIn && isLoggingIn) return '/home/projects';

      return null;
    },
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
        parentNavigatorKey:
            _rootNavigatorKey, // Fuerza a que se abra sobre todo lo demás
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // Retornamos nuestra estructura principal pasando el cascarón de navegación
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/home/projects',
                builder: (context, state) => const ProjectsTabScreen(),
                routes: [
                  // Detalle del proyecto es ruta hija de proyectos.
                  // Al abrirse, la barra de navegación inferior sigue visible.
                  GoRoute(
                    path:
                        'detail/:projectId', // Ojo: sin "/" al inicio porque es ruta hija
                    builder: (context, state) {
                      final projectId =
                          state.pathParameters['projectId'] ?? '0';
                      return ProjectDetailScreen(projectId: projectId);
                    },
                  ),
                ],
              ),
            ],
          ),

          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/home/profile',
                builder: (context, state) =>
                    const ProfileTabScreen(), // Pestaña principal de Perfil
                routes: [
                  // Sub-ruta hija para seleccionar el tema
                  GoRoute(
                    path: 'theme-selector',
                    builder: (context, state) => const ThemeSelectorScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    GoRoute(
        path: '/create-task',
        parentNavigatorKey:
            _rootNavigatorKey, // Se abre en pantalla completa sobre el Shell
        builder: (BuildContext context, GoRouterState state) {

          final initData = state.extra as TaskInitializationModel;

          return CreateTaskScreen(initData: initData);
      },
    ),
  ],
);
}

bool checkUserSession() => true;
