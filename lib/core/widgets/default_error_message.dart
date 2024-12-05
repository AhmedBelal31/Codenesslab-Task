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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          errorMessage,
          style: TextStyles.textStyle16Weight700.copyWith(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
