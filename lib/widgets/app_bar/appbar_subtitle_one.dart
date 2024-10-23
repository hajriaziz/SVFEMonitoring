﻿import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarSubtitleOne extends StatelessWidget {
  AppbarSubtitleOne({Key? key, required this.text, this.margin, this.onTap})
      : super(
          key: key,
        );

  final String text;
  final EdgeInsetsGeometry? margin;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyle.titleSmallPTSerifOnPrimaryContainer.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
            //color: appTheme.gray600,
          ),
        ),
      ),
    );
  }
}
