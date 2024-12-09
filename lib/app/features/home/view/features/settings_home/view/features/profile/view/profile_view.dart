import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/features/settings/view/component/settings_list_tile.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.tabsRouter.setActiveIndex(0);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.sized.widthNormalValue,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SettingsListTile(
              onTap: () {
                context.router.push(const SignInRoute());
              },
              leading: const Icon(Icons.login),
              traling: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
