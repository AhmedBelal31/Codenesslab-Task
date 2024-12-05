import 'package:flutter/material.dart';

class DefaultCircularIndicator extends StatelessWidget {
  const DefaultCircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child:
        CircularProgressIndicator(color: Colors.white));
  }
}
