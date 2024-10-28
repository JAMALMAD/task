import 'package:flutter/material.dart';
import 'package:task/utils/app_color/app_colors.dart';

ThemeData darkModeTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.blackyDarker,
     appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: AppColors.light),
       actionsIconTheme: IconThemeData(color: AppColors.light),
       backgroundColor: AppColors.blackyDarker,
),
);