import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pdf_app/app/features/directory_add/model/directory_model.dart';
import 'package:pdf_app/app/product/component/text/locale_text.dart';
import 'package:pdf_app/generated/locale_keys.g.dart';

@RoutePage()
class DirectoryOpenView extends StatelessWidget {
  const DirectoryOpenView({
    super.key,
    this.directoryModel,
  });

  final DirectoryModel? directoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocaleText(
          text: LocaleKeys.directoryOpen_selectPdf,
        ),
      ),
    );
  }
}
