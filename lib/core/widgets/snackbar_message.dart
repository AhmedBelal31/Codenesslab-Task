import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../utils/theme/app_colors.dart';

void showSuccessSnackBar(BuildContext context, {required String message}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message: message,
      textStyle: const TextStyle(color: Colors.black),
      backgroundColor: AppColors.indigoTwilight,
    ),
  );
}

void showFailureSnackBar(BuildContext context, {required String message}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      message: message,
      backgroundColor: Colors.red,
    ),
  );
}

void showInformationSnackBar(BuildContext context, {required String message}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.info(
      message: message,
      icon: const Icon(Icons.info),
      textStyle: const TextStyle(color: Colors.black),
      backgroundColor: AppColors.primaryYellow,
    ),
  );
}
