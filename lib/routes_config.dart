import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:router_practice/auth_guard.dart';
import 'package:router_practice/models/task_arguments.dart';
import 'package:router_practice/screens/create_task_screen.dart';
import 'package:router_practice/screens/home_screen.dart';
import 'package:router_practice/screens/login_screen.dart';
import 'package:router_practice/screens/theme_selector_screen.dart';
import 'package:router_practice/screens/profile_tab_screen.dart';
import 'package:router_practice/screens/project_detail_screen.dart';
import 'package:router_practice/screens/project_list_screen.dart';
import 'package:router_practice/screens/project_tabs_screen.dart';
part 'routes_config.gr.dart';

@AutoRouterConfig()
class AppRoute extends RootStackRouter {

  final AuthGuard authGuard;
  AppRoute({required this.authGuard});
  
  @override

  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      guards: [authGuard],
      children: [
        AutoRoute(
          page: ProjectsTabRoute.page,
          path: 'projects',
          children: [
            AutoRoute(page: ProjectListRoute.page, path: ''),
            AutoRoute(page: ProjectDetailRoute.page, path: ':projectId'),
          ],
        ),
        AutoRoute(page: ProfileTabRoute.page, path: 'profile'),
      ],
    ),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: CreateTaskRoute.page, path: '/create-task'),
    AutoRoute(page: ThemeSelectorRoute.page, path: '/select-theme'),
  ];

}

bool checkUserSession() => true;
