import 'package:flutter/material.dart';
import 'package:pdf_app/app/core/extention/build_context/build_context_extension.dart';

class SettingsListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? traling;
  final void Function()? onTap;

  const SettingsListTile({
    super.key,
    this.leading,
    this.traling,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: context.theme.getColor.borderColor,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: leading,
        trailing: traling,
      ),
    );
  }
}
