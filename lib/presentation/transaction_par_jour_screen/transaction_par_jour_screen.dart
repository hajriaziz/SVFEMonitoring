import 'package:flutter/material.dart';
import 'package:smtmonitoring/presentation/transaction_par_jour_screen/provider/transaction_par_jour_provider.dart';
import 'package:smtmonitoring/presentation/transaction_par_jour_screen/widgets/listtitle_item_widget.dart';
import 'package:smtmonitoring/presentation/transaction_screen/models/listtitle_item_model.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_trailing_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';

class TransactionParJourScreen extends StatefulWidget {
  const TransactionParJourScreen({Key? key})
      : super(
          key: key,
        );
  @override
  TransactionParJourScreenState createState() =>
      TransactionParJourScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionParJourProvider(),
      child: TransactionParJourScreen(),
    );
  }
}

class TransactionParJourScreenState extends State<TransactionParJourScreen> {
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
          child: Column(
            children: [
              _buildDailySummary(context),
              SizedBox(height: 44.h),
              SizedBox(
                width: double.maxFinite,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  color: appTheme.lightBlue5001,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusStyle.customBorderTL50,
                  ),
                  child: Container(
                    height: 496.h,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 70.h),
                    decoration: AppDecoration.fillLightBlue.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL50,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        _buildSystemStatus(context),

                        // OPTION 1: Labels in a Row (Side-by-side)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgPlay,
                                height: 8.h,
                                width: 8.h,
                                margin: EdgeInsets.only(bottom: 4.h),
                              ),
                              SizedBox(width: 6.h),
                              Text(
                                "lbl_autoris_es".tr,
                                style: theme.textTheme.bodyLarge,
                              ),
                              SizedBox(width: 30.h),
                              CustomImageView(
                                imagePath: ImageConstant.imgPlayRed300,
                                height: 8.h,
                                width: 8.h,
                                margin: EdgeInsets.only(bottom: 4.h),
                              ),
                              SizedBox(width: 6.h),
                              Text(
                                "lbl_non_autoris_es2".tr,
                                style: theme.textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        // OPTION 2: Labels in a Column (Stacked)
                        // Align(
                        //   alignment: Alignment.center,
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           CustomImageView(
                        //             imagePath: ImageConstant.imgPlay,
                        //             height: 8.h,
                        //             width: 8.h,
                        //             margin: EdgeInsets.only(bottom: 4.h),
                        //           ),
                        //           SizedBox(width: 6.h),
                        //           Text(
                        //             "lbl_autoris_es".tr,
                        //             style: theme.textTheme.bodyLarge.copyWith(
                        //               fontSize: 16.h,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //       SizedBox(height: 10.h),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           CustomImageView(
                        //             imagePath: ImageConstant.imgPlayRed300,
                        //             height: 8.h,
                        //             width: 8.h,
                        //             margin: EdgeInsets.only(bottom: 4.h),
                        //           ),
                        //           SizedBox(width: 6.h),
                        //           Text(
                        //             "lbl_non_autoris_es2".tr,
                        //             style: theme.textTheme.bodyLarge.copyWith(
                        //               fontSize: 16.h,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
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
          top: 20.h,
          bottom: 19.h,
        ),
        onTap: () {
          onTapArrowlfetone(context);
        },
      ),*/
      title: AppbarSubtitle(
        text: "msg_tat_journali_res".tr,
        margin: EdgeInsets.only(left: 25.h),
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

  /// Section widget
  Widget _buildDailySummary(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 18.h),
      child: Column(
        children: [
          Text(
            "msg_29_juillet_00_00h".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(
              top: 4.h,
              right: 32.h,
              bottom: 4.h,
            ),
            decoration: AppDecoration.fillLightblue50.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorderl4,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "msg_total_transactions2".tr,
                  style: theme.textTheme.titleLarge,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 90.h),
                  child: Text(
                    "lbl_50596".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            height: 100.h,
            width: 350.h,
            child: Consumer<TransactionParJourProvider>(
              builder: (context, provider, child) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 4.h,
                    );
                  },
                  itemCount: provider
                      .transactionParJourModelObj.listtitleItemList.length,
                  itemBuilder: (context, index) {
                    ListtitleItemModel model = provider
                        .transactionParJourModelObj.listtitleItemList[index];
                    return ListtitleItemWidget(
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

  /// Section widget
  Widget _buildSystemStatus(BuildContext context) {
    return Container(
      height: 338.h,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 4.h,
                vertical: 16.h,
              ),
              decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorderl4,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "msg_l_tat_du_syst_me".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.titleMedium18,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "lbl_29_juillet_24h".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(horizontal: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "lbl_3000".tr,
                              style: CustomTextStyle.bodySmall10,
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "lbl_2000".tr,
                              style: CustomTextStyle.bodySmall10,
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "lbl_1000".tr,
                              style: CustomTextStyle.bodySmall10,
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "lbl_0".tr,
                              style: theme.textTheme.bodySmall,
                            )
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: Divider(
                                      color:
                                          appTheme.blueGray100.withOpacity(0.4),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Container(
                                    height: 124.h,
                                    width: double.maxFinite,
                                    margin: EdgeInsets.only(left: 4.h),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        /*CustomImageView(
                                          imagePath:
                                              ImageConstant.imgPlayRed300,
                                          height: 66.h,
                                          width: double.maxFinite,
                                          alignment: Alignment.bottomCenter,
                                          margin: EdgeInsets.only(bottom: 6.h),
                                        ),*/
                                        /*CustomImageView(
                                          imagePath: ImageConstant.imgPlay,
                                          height: 124.h,
                                          width: double.maxFinite,
                                        )*/
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: Divider(
                                      color:
                                          appTheme.blueGray100.withOpacity(0.4),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Container(
                                    width: double.maxFinite,
                                    margin: EdgeInsets.only(
                                      left: 2.h,
                                      right: 6.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "lbl_08h".tr.toUpperCase(),
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        SizedBox(width: 18.h),
                                        Text(
                                          "lbl_09h".tr.toUpperCase(),
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        SizedBox(width: 18.h),
                                        Text(
                                          "lbl_10h".tr.toUpperCase(),
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        SizedBox(height: 32.h),
                                        SizedBox(width: 18.h),
                                        Text(
                                          "lbl_11h".tr.toUpperCase(),
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        SizedBox(width: 18.h),
                                        Text(
                                          "lbl_12h".tr.toUpperCase(),
                                          style: theme.textTheme.bodySmall,
                                        ),
                                        SizedBox(width: 18.h),
                                        Text(
                                          "lbl_13h".tr.toUpperCase(),
                                          style: theme.textTheme.bodySmall,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //Navigates to the previous screen.
  onTapArrowlfetone(BuildContext context) {
    NavigatorService.goBack();
  }

  onTapArrowleftone2(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.notificationScreen);
  }
}
