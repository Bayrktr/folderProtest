// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddPdfView]
class AddPdfRoute extends PageRouteInfo<AddPdfRouteArgs> {
  AddPdfRoute({
    Key? key,
    DirectoryModel? directoryModel,
    List<PageRouteInfo>? children,
  }) : super(
          AddPdfRoute.name,
          args: AddPdfRouteArgs(
            key: key,
            directoryModel: directoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPdfRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<AddPdfRouteArgs>(orElse: () => const AddPdfRouteArgs());
      return AddPdfView(
        key: args.key,
        directoryModel: args.directoryModel,
      );
    },
  );
}

class AddPdfRouteArgs {
  const AddPdfRouteArgs({
    this.key,
    this.directoryModel,
  });

  final Key? key;

  final DirectoryModel? directoryModel;

  @override
  String toString() {
    return 'AddPdfRouteArgs{key: $key, directoryModel: $directoryModel}';
  }
}

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
/// [EditDirectoryView]
class EditDirectoryRoute extends PageRouteInfo<EditDirectoryRouteArgs> {
  EditDirectoryRoute({
    Key? key,
    DirectoryModel? directoryModel,
    List<PageRouteInfo>? children,
  }) : super(
          EditDirectoryRoute.name,
          args: EditDirectoryRouteArgs(
            key: key,
            directoryModel: directoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'EditDirectoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditDirectoryRouteArgs>(
          orElse: () => const EditDirectoryRouteArgs());
      return EditDirectoryView(
        key: args.key,
        directoryModel: args.directoryModel,
      );
    },
  );
}

class EditDirectoryRouteArgs {
  const EditDirectoryRouteArgs({
    this.key,
    this.directoryModel,
  });

  final Key? key;

  final DirectoryModel? directoryModel;

  @override
  String toString() {
    return 'EditDirectoryRouteArgs{key: $key, directoryModel: $directoryModel}';
  }
}

/// generated route for
/// [EditPdfView]
class EditPdfRoute extends PageRouteInfo<EditPdfRouteArgs> {
  EditPdfRoute({
    Key? key,
    PdfModel? pdfModel,
    List<PageRouteInfo>? children,
  }) : super(
          EditPdfRoute.name,
          args: EditPdfRouteArgs(
            key: key,
            pdfModel: pdfModel,
          ),
          initialChildren: children,
        );

  static const String name = 'EditPdfRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<EditPdfRouteArgs>(orElse: () => const EditPdfRouteArgs());
      return EditPdfView(
        key: args.key,
        pdfModel: args.pdfModel,
      );
    },
  );
}

class EditPdfRouteArgs {
  const EditPdfRouteArgs({
    this.key,
    this.pdfModel,
  });

  final Key? key;

  final PdfModel? pdfModel;

  @override
  String toString() {
    return 'EditPdfRouteArgs{key: $key, pdfModel: $pdfModel}';
  }
}

/// generated route for
/// [HomeDirectoryOpenView]
class HomeDirectoryOpenRoute extends PageRouteInfo<HomeDirectoryOpenRouteArgs> {
  HomeDirectoryOpenRoute({
    Key? key,
    DirectoryModel? directoryModel,
    List<PageRouteInfo>? children,
  }) : super(
          HomeDirectoryOpenRoute.name,
          args: HomeDirectoryOpenRouteArgs(
            key: key,
            directoryModel: directoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDirectoryOpenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeDirectoryOpenRouteArgs>(
          orElse: () => const HomeDirectoryOpenRouteArgs());
      return HomeDirectoryOpenView(
        key: args.key,
        directoryModel: args.directoryModel,
      );
    },
  );
}

class HomeDirectoryOpenRouteArgs {
  const HomeDirectoryOpenRouteArgs({
    this.key,
    this.directoryModel,
  });

  final Key? key;

  final DirectoryModel? directoryModel;

  @override
  String toString() {
    return 'HomeDirectoryOpenRouteArgs{key: $key, directoryModel: $directoryModel}';
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
/// [OpenPdfView]
class OpenPdfRoute extends PageRouteInfo<OpenPdfRouteArgs> {
  OpenPdfRoute({
    Key? key,
    required PdfModel pdfModel,
    List<PageRouteInfo>? children,
  }) : super(
          OpenPdfRoute.name,
          args: OpenPdfRouteArgs(
            key: key,
            pdfModel: pdfModel,
          ),
          initialChildren: children,
        );

  static const String name = 'OpenPdfRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OpenPdfRouteArgs>();
      return OpenPdfView(
        key: args.key,
        pdfModel: args.pdfModel,
      );
    },
  );
}

class OpenPdfRouteArgs {
  const OpenPdfRouteArgs({
    this.key,
    required this.pdfModel,
  });

  final Key? key;

  final PdfModel pdfModel;

  @override
  String toString() {
    return 'OpenPdfRouteArgs{key: $key, pdfModel: $pdfModel}';
  }
}

/// generated route for
/// [SettingsHomeView]
class SettingsHomeRoute extends PageRouteInfo<void> {
  const SettingsHomeRoute({List<PageRouteInfo>? children})
      : super(
          SettingsHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsHomeView();
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
