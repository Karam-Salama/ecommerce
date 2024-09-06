import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/widgets/custom_btn.dart';

class SuccessBottomSheet extends StatelessWidget {
  const SuccessBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width of the screen
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
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
          const Text(
            'Signup Successful!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: 'Done',
            onPressed: () {
              customReplacementNavigate(context, '/home');
            },
          ),
        ],
      ),
    );
  }
}
