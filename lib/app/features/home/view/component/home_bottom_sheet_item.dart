import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeBottomSheetItem extends StatelessWidget {
  const HomeBottomSheetItem({
    super.key,
    required this.selectedIndex,
    this.iconData,
    required this.itemIndex,
  });

  final int selectedIndex;
  final IconData? iconData;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          context.tabsRouter.setActiveIndex(itemIndex);
        },
        child: Container(
          height: double.infinity,
          color: Colors.transparent,
          child: Icon(
            iconData,
            color: selectedIndex == itemIndex
                ? null
                : context.theme.getColor.focusColor,
          ),
        ),
      ),
    );
  }
}
