

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pdf_app/app/features/directory_add/model/directory_model.dart';


@RoutePage()
class EditDirectoryView extends StatelessWidget {
  const EditDirectoryView({super.key, this.directoryModel});

  final DirectoryModel? directoryModel;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
