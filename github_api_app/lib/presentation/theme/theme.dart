import 'package:flutter/material.dart';
import 'package:github_api_app/core/app_colors.dart';

final appTheme = ThemeData.dark().copyWith(
  backgroundColor: AppColors.black70,
  scaffoldBackgroundColor: AppColors.black70,
  primaryColor: AppColors.white100,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.grey50,
  ),
);
