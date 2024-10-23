import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'provider/transaction_provider.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key})
      : super(
          key: key,
        );
  @override
  TransactionScreenState createState() => TransactionScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: TransactionScreen(),
    );
  }
}

class TransactionScreenState extends State<TransactionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          //width: double.maxFinite,
          child: Column(
            children: [
              _buildTransactionSummary(context),
              SizedBox(height: 44.h),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 18.h,
                  vertical: 34.h,
                ),
                decoration: AppDecoration.fillLightBlue.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderTL50,
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  _buildSuccessFailureChart(context),
                  SizedBox(height: 45.h)
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 37.h,
      /*leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 19.h,
          top: 22.h,
          bottom: 17.h,
        ),
        onTap: () {
          onTapArrowleftone1(context);
        },
      ),*/
      title: AppbarSubtitle(
        text: "msg_tat_de_svfe_dans".tr,
        margin: EdgeInsets.only(left: 36.h),
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
      child: Column(
        children: [
          Text(
            "msg_29_juillet_10_02".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 4.h),
            decoration: AppDecoration.fillLightblue50.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorderl4,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "msg_total_transactions".tr,
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  "lbl_2550".tr,
                  style: theme.textTheme.headlineSmall,
                )
              ],
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.h,
                      vertical: 2.h,
                    ),
                    decoration: AppDecoration.fillLightBlue.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorderl4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 18.h,
                              bottom: 6.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: Text(
                                    "lbl_transactions".tr,
                                    style: CustomTextStyle.titleMedium18,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: Text(
                                    "lbl_autoris_es".tr,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  height: 8.h,
                                  width: 124.h,
                                  decoration: BoxDecoration(
                                    color: appTheme.blueGray4005a,
                                    borderRadius: BorderRadius.circular(
                                      4.h,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      4.h,
                                    ),
                                    child: LinearProgressIndicator(
                                      value: 0.56,
                                      backgroundColor: appTheme.blueGray4005a,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        appTheme.tealA700,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 6.h),
                        Text(
                          "lbl_78".tr,
                          style: theme.textTheme.titleMedium,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 4.h),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.h),
                    decoration: AppDecoration.fillLightBlue.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorderl4,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20.h,
                              bottom: 8.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 2.h),
                                  child: Text(
                                    "lbl_transactions".tr,
                                    style: CustomTextStyle.titleMedium18,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.h),
                                  child: Text(
                                    "lbl_non_autoris_es".tr,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  height: 8.h,
                                  width: 124.h,
                                  decoration: BoxDecoration(
                                    color: appTheme.blueGray4005a,
                                    borderRadius: BorderRadius.circular(
                                      4.h,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      4.h,
                                    ),
                                    child: LinearProgressIndicator(
                                      value: 0.33,
                                      backgroundColor: appTheme.blueGray4005a,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        appTheme.tealA700,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 4.h),
                        Text(
                          "lbl_22".tr,
                          style: theme.textTheme.titleMedium,
                        )
                      ],
                    ),
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
  Widget _buildSuccessFailureChart(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorderl4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.h),
          Text(
            "msg_taux_de_r_ussite".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyle.titleMedium18,
          ),
          SizedBox(height: 40.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(
              left: 18.h,
              right: 16.h,
            ),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(right: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "lbl_100".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                          SizedBox(height: 48.h),
                          Text(
                            "lbl_50".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                          SizedBox(height: 48.h),
                          Text(
                            "lbl_0".tr,
                            style: theme.textTheme.bodySmall,
                          )
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 126.h,
                            margin: EdgeInsets.only(bottom: 4.h),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                /*CustomImageView(
                                  imagePath: ImageConstant.imgArea2, 
                                  height: 86.h,
                                  width: double.maxFinite,
                                  alignment: Alignment.bottomCenter,
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgArea2, 
                                  height: 126.h,
                                  width: double.maxFinite,
                                )*/
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 18.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(),
                      Text(
                        "lbl_10_02".tr.toUpperCase(),
                        style: theme.textTheme.bodySmall,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14.h),
                        child: Text(
                          "lbl_10_03".tr.toUpperCase(),
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 14.h),
                        child: Text(
                          "lbl_10_04".tr.toUpperCase(),
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Text(
                          "lbl_10_05".tr.toUpperCase(),
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(
                          "lbl_10_06".tr.toUpperCase(),
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Text(
                          "lbl_10_07".tr.toUpperCase(),
                          style: theme.textTheme.bodySmall,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.maxFinite,
                  child: Divider(
                    color: appTheme.blueGray100,
                  ),
                ),
                SizedBox(height: 14.h),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(right: 2.h),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgPlay,
                        height: 8.h,
                        width: 8.h,
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(bottom: 4.h),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Text(
                          "lbl_autoris_es".tr,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        imagePath: ImageConstant.imgPlayRed300,
                        height: 8.h,
                        width: 8.h,
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(bottom: 4.h),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 6.h,
                          right: 54.h,
                        ),
                        child: Text(
                          "lbl_non_autoris_es2".tr,
                          style: theme.textTheme.bodyLarge,
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

  //Navigates to previous screen
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  onTapArrowleftone1(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.barnavContainerScreen);
  }

  onTapArrowleftone2(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.notificationScreen);
  }
}
