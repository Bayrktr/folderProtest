import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pdf_app/app/core/extention/build_context/build_context_extension.dart';
import 'package:pdf_app/app/product/component/text/locale_text.dart';
import 'package:pdf_app/app/product/navigation/app_router.dart';
import 'package:pdf_app/generated/locale_keys.g.dart';

@RoutePage()
class SettingsHomeView extends StatelessWidget {
  const SettingsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        SettingsRoute(),
        LanguageRoute(),


      ],
      builder: (context, widget, controller) {
        return Scaffold(
          appBar: _getAppBar(context: context),
          body: widget,
        );
      },
    );
  }

  AppBar _getAppBar({
    required BuildContext context,
  }) =>
      AppBar(
        automaticallyImplyLeading: false,
        title: LocaleText(
          text: LocaleKeys.general_settings,
          textStyle: context.theme.getTextStyle.headline1,
        ),
      );
}
