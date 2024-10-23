import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'models/listcodederepon_item_model.dart';
import 'provider/banque_provider.dart';
import 'widgets/listcodederepon_item_widget.dart';

class BanqueScreen extends StatefulWidget {
  const BanqueScreen({Key? key})
      : super(
          key: key,
        );

  @override
  BanqueScreenState createState() => BanqueScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BanqueProvider(),
      child: BanqueScreen(),
    );
  }
}

class BanqueScreenState extends State<BanqueScreen> {
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
              SizedBox(height: 20.h),
              _buildBankRejectionChart(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Section widget
  PreferredSizeWidget _buildTopBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 37.h,
      /*leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 19.h,
          top: 20.h,
          bottom: 19.h,
        ),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),*/
      title: AppbarSubtitle(
        text: "lbl_banque_metteur".tr,
        margin: EdgeInsets.only(left: 64.h),
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
          SizedBox(height: 22.h),
          SizedBox(
            height: 168.h,
            width: 350.h,
            child: Consumer<BanqueProvider>(
              builder: (context, provider, child) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 16.h,
                    );
                  },
                  itemCount:
                      provider.banqueModelObj.listcodedereponItemList.length,
                  itemBuilder: (context, index) {
                    ListcodedereponItemModel model =
                        provider.banqueModelObj.listcodedereponItemList[index];
                    return ListcodedereponItemWidget(
                      model,
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBankRejectionChart(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 42.h,
      ),
      decoration: AppDecoration.fillLightBlue.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL50,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.h,
                    vertical: 14.h,
                  ),
                  decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorderl4,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.h),
                      Text(
                        "msg_top_5_des_banques".tr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.titleLargeNunitoSansBlack900,
                      ),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 12.h),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 22.h,
                                    child: Column(
                                      children: [
                                        Text(
                                          "lbl_320".tr,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                        SizedBox(height: 2.h),
                                        Container(
                                          height: 92.h,
                                          width: 8.h,
                                          decoration: BoxDecoration(
                                            color: appTheme.blue700,
                                            borderRadius: BorderRadius.circular(
                                              4.h,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 6.h),
                                  SizedBox(
                                    width: 30.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "lbl_523".tr,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                        SizedBox(height: 6.h),
                                        /*CustomImageView(
                                          imagePath:
                                              ImageConstant.imgPlayRed300,
                                          height: 150.h,
                                          width: 8.h,
                                          margin: EdgeInsets.only(right: 6.h),
                                        )*/
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 6.h),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      width: 30.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "lbl_548".tr,
                                            style: theme.textTheme.labelLarge,
                                          ),
                                          SizedBox(height: 2.h),
                                          Container(
                                            height: 184.h,
                                            width: 8.h,
                                            margin: EdgeInsets.only(right: 6.h),
                                            decoration: BoxDecoration(
                                              color: appTheme.blue700,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                4.h,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 6.h),
                                  SizedBox(
                                    width: 30.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "lbl_490".tr,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                        SizedBox(height: 2.h),
                                        Container(
                                          height: 142.h,
                                          width: 8.h,
                                          margin: EdgeInsets.only(right: 6.h),
                                          decoration: BoxDecoration(
                                            color: appTheme.blue700,
                                            borderRadius: BorderRadius.circular(
                                              4.h,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 6.h),
                                  Expanded(
                                    child: Container(
                                      width: double.maxFinite,
                                      padding: EdgeInsets.only(left: 8.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "lbl_330".tr,
                                            style: theme.textTheme.labelLarge,
                                          ),
                                          Container(
                                            height: 100.h,
                                            width: 8.h,
                                            margin: EdgeInsets.only(left: 6.h),
                                            decoration: BoxDecoration(
                                              color: appTheme.blue700,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                4.h,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.symmetric(horizontal: 6.h),
                              child: Row(
                                children: [
                                  Text(
                                    "lbl_m".tr,
                                    style: CustomTextStyle.labelLargeBlack900,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 28.h),
                                    child: Text(
                                      "lbl_t".tr,
                                      style: CustomTextStyle.labelLargeBlack900,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 26.h),
                                    child: Text(
                                      "lbl_w".tr,
                                      style: CustomTextStyle.labelLargeBlack900,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 24.h),
                                    child: Text(
                                      "lbl_t".tr,
                                      style: CustomTextStyle.labelLargeBlack900,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "lbl_f".tr,
                                    style: CustomTextStyle.labelLargeBlack900,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 28.h,
                                      right: 36.h,
                                    ),
                                    child: Text(
                                      "lbl_s".tr,
                                      style: CustomTextStyle.labelLargeBlack900,
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
          ),
          SizedBox(height: 14.h)
        ],
      ),
    );
  }

  ///Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  onTapArrowleftone2(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.notificationScreen);
  }
}
