import 'package:flutter/material.dart';

import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_strings.dart';
import 'cutom_textField.dart';

class CustomNameFieldsRow extends StatelessWidget {
  final Function(String) onFirstNameChanged;
  final Function(String) onLastNameChanged;

  const CustomNameFieldsRow({
    super.key,
    required this.onFirstNameChanged,
    required this.onLastNameChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            labelText: AppStrings.firstName,
            hintText: AppStrings.enterFirstName,
            keyboardType: TextInputType.name,
            onChanged: onFirstNameChanged,
            validator: Validation.validateFirstName,
          ),
        ),
        const SizedBox(width: 16), // Space between fields
        Expanded(
          child: CustomTextFormField(
            labelText: AppStrings.lastName,
            hintText: AppStrings.enterLastName,
            keyboardType: TextInputType.name,
            onChanged: onLastNameChanged,
            validator: Validation.validateLastName,
          ),
        ),
      ],
    );
  }
}
