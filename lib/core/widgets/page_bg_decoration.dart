import 'package:flutter/material.dart';
import '../utils/theme/app_colors.dart';

BoxDecoration buildPageBGDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        AppColors.darkBlueBlack,
        AppColors.indigoTwilight,
        AppColors.midnightShadow,
      ],
    ),
  );
}
