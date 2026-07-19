// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes_config.dart';

/// generated route for
/// [CreateTaskScreen]
class CreateTaskRoute extends PageRouteInfo<CreateTaskRouteArgs> {
  CreateTaskRoute({
    Key? key,
    required TaskInitializationModel initData,
    List<PageRouteInfo>? children,
  }) : super(
         CreateTaskRoute.name,
         args: CreateTaskRouteArgs(key: key, initData: initData),
         initialChildren: children,
       );

  static const String name = 'CreateTaskRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateTaskRouteArgs>();
      return CreateTaskScreen(key: args.key, initData: args.initData);
    },
  );
}

class CreateTaskRouteArgs {
  const CreateTaskRouteArgs({this.key, required this.initData});

  final Key? key;

  final TaskInitializationModel initData;

  @override
  String toString() {
    return 'CreateTaskRouteArgs{key: $key, initData: $initData}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateTaskRouteArgs) return false;
    return key == other.key && initData == other.initData;
  }

  @override
  int get hashCode => key.hashCode ^ initData.hashCode;
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [ProfileTabScreen]
class ProfileTabRoute extends PageRouteInfo<void> {
  const ProfileTabRoute({List<PageRouteInfo>? children})
    : super(ProfileTabRoute.name, initialChildren: children);

  static const String name = 'ProfileTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileTabScreen();
    },
  );
}

/// generated route for
/// [ProjectDetailScreen]
class ProjectDetailRoute extends PageRouteInfo<ProjectDetailRouteArgs> {
  ProjectDetailRoute({
    required String projectId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ProjectDetailRoute.name,
         args: ProjectDetailRouteArgs(projectId: projectId, key: key),
         rawPathParams: {'projectId': projectId},
         initialChildren: children,
       );

  static const String name = 'ProjectDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ProjectDetailRouteArgs>(
        orElse: () => ProjectDetailRouteArgs(
          projectId: pathParams.getString('projectId'),
        ),
      );
      return ProjectDetailScreen(projectId: args.projectId, key: args.key);
    },
  );
}

class ProjectDetailRouteArgs {
  const ProjectDetailRouteArgs({required this.projectId, this.key});

  final String projectId;

  final Key? key;

  @override
  String toString() {
    return 'ProjectDetailRouteArgs{projectId: $projectId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProjectDetailRouteArgs) return false;
    return projectId == other.projectId && key == other.key;
  }

  @override
  int get hashCode => projectId.hashCode ^ key.hashCode;
}

/// generated route for
/// [ProjectListScreen]
class ProjectListRoute extends PageRouteInfo<void> {
  const ProjectListRoute({List<PageRouteInfo>? children})
    : super(ProjectListRoute.name, initialChildren: children);

  static const String name = 'ProjectListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProjectListScreen();
    },
  );
}

/// generated route for
/// [ProjectsTabScreen]
class ProjectsTabRoute extends PageRouteInfo<void> {
  const ProjectsTabRoute({List<PageRouteInfo>? children})
    : super(ProjectsTabRoute.name, initialChildren: children);

  static const String name = 'ProjectsTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProjectsTabScreen();
    },
  );
}

/// generated route for
/// [ThemeSelectorScreen]
class ThemeSelectorRoute extends PageRouteInfo<void> {
  const ThemeSelectorRoute({List<PageRouteInfo>? children})
    : super(ThemeSelectorRoute.name, initialChildren: children);

  static const String name = 'ThemeSelectorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ThemeSelectorScreen();
    },
  );
}
