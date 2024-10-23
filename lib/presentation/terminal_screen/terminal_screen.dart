import 'package:flutter/material.dart';
//import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'provider/terminal_provider.dart';

class TerminalScreen extends StatefulWidget {
  const TerminalScreen({Key? key})
      : super(
          key: key,
        );
  @override
  TerminalScreenState createState() => TerminalScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TerminalProvider(),
      child: TerminalScreen(),
    );
  }
}

class TerminalScreenState extends State<TerminalScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildTopBar(context),
        body: SingleChildScrollView(
          //width: double.maxFinite,
          child: Column(
            children: [
              _buildTransactionSummary(context),
              SizedBox(height: 62.h),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 18.h,
                  vertical: 56.h,
                ),
                decoration: AppDecoration.fillLightBlue.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderTL50,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [_buildChartSection(context)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildTopBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 37.h,
      /*leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 19.h,
          top: 19.h,
          bottom: 20.h,
        ),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),*/
      centerTitle: true,
      title: AppbarSubtitle(
        text: "msg_tat_des_terminaux".tr,
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgChat,
          margin: EdgeInsets.only(
            top: 15.h,
            right: 10.h,
          ),
        ),
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgVector,
          margin: EdgeInsets.only(
            left: 11.h,
            top: 15.h,
            right: 30.h,
          ),
          onTap: () {
            onTapArrowleftone2(context);
          },
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildTransactionSummary(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 18.h),
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      child: Column(
        children: [
          Text(
            "msg_29_juillet_10_02".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 36.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 18.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 98.h,
                    margin: EdgeInsets.only(bottom: 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgATM,
                          height: 60.h,
                          width: 56.h,
                          margin: EdgeInsets.only(right: 12.h),
                        ),
                        SizedBox(height: 22.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "lbl_1500".tr,
                              style:
                                  CustomTextStyle.titleMediumInterBluegray400_1,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "lbl_transaction".tr,
                              style:
                                  CustomTextStyle.titleMediumInterBluegray400_1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //SizedBox(width: 12.h),
                //vertical line
                Container(
                  width: 1.2, // Thin width for the divider
                  height: 130.h, // Adjust height to fit your content
                  color: appTheme.gray100, // Same color as before
                  margin: EdgeInsets.symmetric(horizontal: 12.h),
                ),
                //SizedBox(width: 8.h),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgTPE,
                                    height: 60.h,
                                    width: 60.h,
                                    alignment: Alignment.center,
                                  ),
                                  Container(
                                    width: 100.h,
                                    margin: EdgeInsets.only(
                                      left: 12.h,
                                      top: 2.h,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "lbl_600".tr,
                                          style: CustomTextStyle
                                              .titleMediumInterBluegray400_1,
                                        ),
                                        Text(
                                          "lbl_transaction".tr,
                                          style: CustomTextStyle
                                              .titleMediumInterBluegray400_1,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8.h),
                            //horiztal line
                            SizedBox(
                              width: double.maxFinite,
                              child: Divider(
                                thickness: 1.2.h,
                                color: appTheme.gray100,
                                endIndent: 6.h,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(
                          left: 6.h,
                          right: 8.h,
                        ),
                        child: Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgECo,
                              height: 52.h,
                              width: 46.h,
                            ),
                            SizedBox(width: 24.h),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: 70.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "lbl_400".tr,
                                      style: CustomTextStyle
                                          .titleMediumInterBluegray400_1,
                                    ),
                                    Text(
                                      "lbl_transaction".tr,
                                      style: CustomTextStyle
                                          .titleMediumInterBluegray400_1,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
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
  Widget _buildChartSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 18.h),
            decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorderl4,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 6.h),
                Text(
                  "msg_les_terminaux_par".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.titleMedium18,
                ),
                SizedBox(height: 2.h),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 50.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 174.h,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            /*Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: _buildTooltipCircle(
                                context,
                                twentysixTwo: "lbl_30".tr,
                              ),
                            ),*/
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 174.h,
                                margin: EdgeInsets.only(
                                  left: 6.h,
                                  right: 18.h,
                                ),
                                padding: EdgeInsets.only(left: 6.h),
                                /*decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: fs.Svg(
                                      ImageConstant.imgTooltipCircle,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),*/
                                child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    /*CustomImageView(
                                      imagePath: ImageConstant.imgOvalCopy17,
                                      height: 42.h,
                                      width: 46.h,
                                    ),*/
                                    /*Padding(
                                      padding: EdgeInsets.only(
                                        left: 6.h,
                                        top: 10.h,
                                      ),
                                      child: Text(
                                        "lbl_26".tr,
                                        style: theme.textTheme.titleMedium,
                                      ),
                                    )*/
                                  ],
                                ),
                              ),
                            ),
                            /*Padding(
                              padding: EdgeInsets.only(bottom: 50.h),
                              child: _buildTooltipCircle(
                                context,
                                twentysixTwo: "lbl_54".tr,
                              ),
                            )*/
                          ],
                        ),
                      ),
                      SizedBox(height: 26.h),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 12.h),
                        child: Row(
                          children: [
                            /*CustomImageView(
                              imagePath: ImageConstant.imgPlayRed300,
                              height: 8.h,
                              width: 10.h,
                            ),*/
                            /*Padding(
                              padding: EdgeInsets.only(left: 6.h),
                              child: Text(
                                "lbl_dab".tr,
                                style: theme.textTheme.bodyLarge,
                              ),
                            )*/
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),
                      /*Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 12.h),
                        child: buildCategory(
                          context,
                          closeThree: ImageConstant.imgPlayRed300,
                          longcategory: "lbl_tpe".tr,
                        ),
                      ),*/
                      SizedBox(height: 2.h),
                      /*Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 12.h),
                        child: buildCategory(
                          context,
                          closeThree: ImageConstant.imgPlayRed300,
                          longcategory: "lbl_e_commerce".tr,
                        ),
                      )*/
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Common widget
  /*Widget buildCategory(
    BuildContext context, {
    required String closeThree,
    required String longcategory,
  }) {
    return Row(
      children: [
        /*CustomImageView(
          imagePath: closeThree,
          height: 8.h,
          width: 10.h,
        ),*/
        Padding(
          padding: EdgeInsets.only(left: 6.h),
          child: Text(
            longcategory,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: appTheme.gray60001,
            ),
          ),
        )
      ],
    );
  }*/

  /// Common widget
  /*Widget _buildTooltipCircle(
    BuildContext context, {
    required String twentysixTwo,
  }) {
    return SizedBox(
      height: 42.h,
      width: 208.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgOvalCopy17,
            height: 42.h,
            width: 46.h,
            alignment: Alignment.centerRight,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 4.h,
              bottom: 8.h,
            ),
            child: Text(
              twentysixTwo,
              style: theme.textTheme.titleMedium!.copyWith(
                color: appTheme.black900,
              ),
            ),
          )
        ],
      ),
    );
  }*/

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  onTapArrowleftone2(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.notificationScreen);
  }
}
