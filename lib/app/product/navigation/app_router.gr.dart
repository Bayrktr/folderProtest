// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DirectoryAddView]
class DirectoryAddRoute extends PageRouteInfo<DirectoryAddRouteArgs> {
  DirectoryAddRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DirectoryAddRoute.name,
          args: DirectoryAddRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DirectoryAddRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DirectoryAddRouteArgs>(
          orElse: () => const DirectoryAddRouteArgs());
      return DirectoryAddView(key: args.key);
    },
  );
}

class DirectoryAddRouteArgs {
  const DirectoryAddRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'DirectoryAddRouteArgs{key: $key}';
  }
}

/// generated route for
/// [DirectoryOpenView]
class DirectoryOpenRoute extends PageRouteInfo<DirectoryOpenRouteArgs> {
  DirectoryOpenRoute({
    Key? key,
    DirectoryModel? directoryModel,
    List<PageRouteInfo>? children,
  }) : super(
          DirectoryOpenRoute.name,
          args: DirectoryOpenRouteArgs(
            key: key,
            directoryModel: directoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'DirectoryOpenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DirectoryOpenRouteArgs>(
          orElse: () => const DirectoryOpenRouteArgs());
      return DirectoryOpenView(
        key: args.key,
        directoryModel: args.directoryModel,
      );
    },
  );
}

class DirectoryOpenRouteArgs {
  const DirectoryOpenRouteArgs({
    this.key,
    this.directoryModel,
  });

  final Key? key;

  final DirectoryModel? directoryModel;

  @override
  String toString() {
    return 'DirectoryOpenRouteArgs{key: $key, directoryModel: $directoryModel}';
  }
}

/// generated route for
/// [HomePdfView]
class HomePdfRoute extends PageRouteInfo<void> {
  const HomePdfRoute({List<PageRouteInfo>? children})
      : super(
          HomePdfRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePdfRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePdfView();
    },
  );
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeView();
    },
  );
}

/// generated route for
/// [LanguageView]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute({List<PageRouteInfo>? children})
      : super(
          LanguageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LanguageView();
    },
  );
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginView();
    },
  );
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsView();
    },
  );
}
