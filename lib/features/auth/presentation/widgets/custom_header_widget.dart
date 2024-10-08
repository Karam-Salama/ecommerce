import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_styles.dart';

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
    this.alignment = Alignment.topLeft,
    this.onPressed,
  });

  final String text;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final Alignment alignment;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: padding,
        child: Align(
          alignment: alignment,
          child: Text(text, style: textStyle ?? AppTextStyle.lato16style),
        ),
      ),
    );
  }
}
