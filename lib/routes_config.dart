import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router_practice/models/task_arguments.dart';
import 'package:router_practice/screens/create_task_screen.dart';
import 'package:router_practice/screens/home_screen.dart';
import 'package:router_practice/screens/login_screen.dart';
import 'package:router_practice/screens/profile_screen.dart';
import 'package:router_practice/screens/project_detail_screen.dart';

class RoutesConfig {
  static final GoRouter router = GoRouter(
  initialLocation: '/login',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      }
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen();
      }
    ),
    GoRoute(
  path: '/create-task',
  builder: (BuildContext context, GoRouterState state) {

    final initData = state.extra as TaskInitializationModel;
    
    return CreateTaskScreen(initData: initData);
  },
),
    GoRoute(
      path: '/project-detail/:projectId',
      builder: (BuildContext context, GoRouterState state) {
        final projectId = state.pathParameters['projectId'] ?? '';
        return ProjectDetailScreen(projectId: projectId);
      },
    ),
  ],
);
}