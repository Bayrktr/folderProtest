import 'package:DocuSort/app/core/enum/custom_colors.dart';
import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/navigation/navigation_extention.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/login/view/component/divider_with_text.dart';
import 'package:DocuSort/app/features/login/view/features/sign_in/bloc/sign_in_cubit.dart';
import 'package:DocuSort/app/features/login/view/features/sign_in/bloc/sign_in_state.dart';
import 'package:DocuSort/app/product/component/image/custom_image.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/enum/icons_enum.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/app/product/utility/validator/text_form_field_validator.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignInView extends StatelessWidget {
  SignInView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: _formKey,
            child: Padding(
              padding: context.padding.normal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LocaleText(
                    text: LocaleKeys.login_login,
                    textStyle: context.theme.getTextStyle.headline1,
                  ),
                  Padding(padding: context.padding.medium),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocaleText(
                        text: LocaleKeys.login_emailAdress,
                        textStyle: context.theme.getTextStyle.mediumBodyText1,
                      ),
                      Padding(padding: context.padding.low),
                      TextFormField(
                        validator: (String? value) {
                          return TextFormFieldValidator(value: value)
                              .getUsableEmailValidator;
                        },
                        onChanged: (String? value) {
                          context
                              .read<SignInCubit>()
                              .updateEmailController(value);
                        },
                        controller: context.read<SignInCubit>().emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: context.padding.normal),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LocaleText(
                            text: LocaleKeys.login_password,
                            textStyle:
                                context.theme.getTextStyle.mediumBodyText1,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const LocaleText(
                              text: LocaleKeys.login_forgotPassword,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: context.padding.low),
                      TextFormField(
                        obscureText: !state.isPasswordVisible,
                        onChanged: (String? value) {
                          context
                              .read<SignInCubit>()
                              .updatePasswordController(value);
                        },
                        controller:
                            context.read<SignInCubit>().passwordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              context
                                  .read<SignInCubit>()
                                  .changePasswordVisible();
                            },
                            icon: Icon(
                              state.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: context.padding.low),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<SignInCubit>().changeKeepSigned();
                        },
                        icon: Icon(
                          state.isKeepSigned
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                        ),
                      ),
                      const LocaleText(
                        text: LocaleKeys.login_keepMeSignIn,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            context.
                          },
                          child: Padding(
                            padding: context.padding.low,
                            child: LocaleText(
                              text: LocaleKeys.login_login,
                              textStyle:
                                  context.theme.getTextStyle.highBodyText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: context.padding.low),
                  DividerWithText(
                    text: LocaleKeys.login_orSignInWith.lang.tr,
                  ),
                  Padding(padding: context.padding.low),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.theme.getColor.unSelectedWidgetColor,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImage(
                            imageFrom: ImageFrom.ASSET,
                            imageType: ImageType.PNG,
                            assetPath: IconsEnum.google.toIcon,
                            height: context.sized.widthHighValue,
                            width: context.sized.widthHighValue,
                          ),
                          Padding(padding: context.padding.low),
                          const LocaleText(
                            text: LocaleKeys.login_continueWithGoggle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: context.padding.low),
                  Center(
                    child: IconButton(
                      onPressed: () {
                        context.tabsRouter.setActiveIndex(1);
                      },
                      icon: LocaleText(
                        text: LocaleKeys.login_createAnAccount,
                        color: CustomColors.darkBlue.getColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        switch (state.popUpStatus) {
          case SignInPopUpStatus.initial:
            break;
          case SignInPopUpStatus.cantBeEmpty:
            break;
          case SignInPopUpStatus.other:
            break;
          case SignInPopUpStatus.success:
            context.router.pushAndPopUntil(
              const HomeRoute(),
              predicate: (_) => false,
            );
        }
      },
    );
  }
}
