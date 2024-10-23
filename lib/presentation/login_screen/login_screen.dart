import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:smtmonitoring/core/app_export.dart';
import 'package:smtmonitoring/core/utils/validation_functions.dart';
import 'package:smtmonitoring/presentation/login_screen/provider/login_provider.dart';
import 'package:smtmonitoring/theme/custom_button_style.dart';
import 'package:smtmonitoring/widgets/custom_elevated_button.dart';
import 'package:smtmonitoring/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key})
      : super(
          key: key,
        );
  @override
  LoginScreenState createState() => LoginScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: LoginScreen(),
    );
  }
}

// ignore_for_file: must_be_immutable
class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(
                      height: 42.h,
                    ),
                    _buildAppBar(context),
                    SizedBox(
                      height: 130.h,
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      decoration: AppDecoration.fillLightBlue.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL70,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: 38.h),
                          _buildUsernameSection(context),
                          SizedBox(height: 18.h),
                          _buildPasswordSection(context),
                          SizedBox(height: 90.h),
                          _buildLoginOptions(context)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Container _buildAppBar(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 18.h),
      child: Column(
        children: [
          Text(
            "lbl_welcome".tr,
            style: theme.textTheme.headlineLarge,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUsernameSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 22.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Text(
                    "msg_username_or_email".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 12.h),
                Selector<LoginProvider, TextEditingController?>(
                  selector: (context, provider) => provider.emailController,
                  builder: (context, emailController, child) {
                    return CustomTextFormField(
                      controller: emailController,
                      hintText: "msg_example_example_com".tr,
                      textInputType: TextInputType.emailAddress,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.h,
                        vertical: 6.h,
                      ),
                      validator: (value) {
                        if (value == null ||
                            (!isValidEmail(value, isRequired: true))) {
                          return "Please enter valid email";
                        }
                        return null;
                      },
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 22.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 13.h),
                  child: Text(
                    "lbl_password".tr,
                    style: theme.textTheme.titleSmall,
                  ),
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.only(right: 2.h),
                  child: Consumer<LoginProvider>(
                    builder: (context, provider, child) {
                      return CustomTextFormField(
                        controller: provider.airplaneController,
                        textInputAction: TextInputAction.done,
                        suffix: InkWell(
                          onTap: () {
                            provider.changePasswordVisibility();
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(16.h, 12.h, 30.h, 12.h),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgAirplane,
                              height: 16.h,
                              width: 24.h,
                            ),
                          ),
                        ),
                        suffixConstraints: BoxConstraints(
                          maxHeight: 40.h,
                        ),
                        obscureText: provider.isShowPassword,
                        contentPadding:
                            EdgeInsets.fromLTRB(12.h, 12.h, 30.h, 12.h),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginOptions(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomElevatedButton(
            width: 206.h,
            text: "lbl_log_in".tr,
            buttonStyle: CustomButtonStyles.fillLightBleu,
            buttonTextStyle: CustomTextStyle.titleLargeOnPrimary,
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                NavigatorService.pushNamed(AppRoutes.barnavContainerScreen);
              }
            },
          ),
          SizedBox(height: 18.h),
          Text(
            "msg_forgot_password".tr,
            style: CustomTextStyle.titleSmallLeagueSpartan,
          ),
          SizedBox(height: 14.h),
          /*CustomElevatedButton(
              width: 206.h,
              text: "lbl_sign_up".tr,
              buttonStyle: CustomButtonStyles.fillPrimary,
              buttonTextStyle: CustomTextStyle.titleLargeTeal900),*/
          SizedBox(
            height: 30.h,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "lbl_use".tr,
                  style: CustomTextStyle.titleSmallTeal900SemiBold,
                ),
                TextSpan(
                  text: "msg_fingerprint_to".tr,
                  style: CustomTextStyle.titleSmallBlueA700,
                )
              ],
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 88.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "msg_don_t_have_an_account2".tr,
                  style: CustomTextStyle.bodyMediumOnPrimaryLight,
                ),
                TextSpan(
                  text: "lbl_sign_up".tr,
                  style: CustomTextStyle.bodyMediumErrorContainer,
                )
              ],
            ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
