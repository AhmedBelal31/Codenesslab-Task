import 'package:flutter/material.dart';
import '../utils/theme/app_text_styles.dart';

class DefaultErrorMessage extends StatelessWidget {
  const DefaultErrorMessage({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: TextStyles.textStyle20Weight700,
      ),
    );
  }
}
