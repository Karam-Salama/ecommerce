import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_btn.dart';

class SuccessBottomSheet extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String buttonText1;
  final VoidCallback? onButtonPressed;
  final String? buttonText2;
  final VoidCallback? onButtonPressed2;
  const SuccessBottomSheet({
    super.key,
    required this.title,
    this.buttonText1 = 'Done',
    this.onButtonPressed,
    this.subtitle,
    this.buttonText2,
    this.onButtonPressed2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width of the screen
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Color(
            0xFF2C2C36), // Use the color from AppColors or adjust as needed
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            subtitle ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomButton(
                  text: buttonText1,
                  onPressed: onButtonPressed ??
                      () {
                        Navigator.of(context).pop(); // Default action
                      },
                ),
              ),
              const SizedBox(width: 16),
              if (buttonText2 != null)
                Expanded(
                  child: CustomButton(
                    text: buttonText2,
                    onPressed: onButtonPressed2 ??
                        () {
                          Navigator.of(context).pop(); // Default action
                        },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
