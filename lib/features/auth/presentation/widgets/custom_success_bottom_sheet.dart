import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_btn.dart';

class SuccessBottomSheet extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback? onButtonPressed;

  const SuccessBottomSheet({
    super.key,
    required this.message,
    this.buttonText = 'Done',
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width of the screen
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Color(0xFF2C2C36), // Use the color from AppColors or adjust as needed
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
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: buttonText,
            onPressed: onButtonPressed ?? () {
              Navigator.of(context).pop(); // Default action
            },
          ),
        ],
      ),
    );
  }
}
