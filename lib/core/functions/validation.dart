// validation.dart

import 'package:email_validator/email_validator.dart';

class Validation {
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter First Name';
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Last Name';
    }
    return null;
  }

  /// Validates the email format.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!EmailValidator.validate(value)) {
      return 'Please enter an email in the valid format';
    }
    return null;
  }

  /// Validates the password to ensure it meets specific criteria.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length <= 8) {
      return 'Password must be more than 8 characters';
    } else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must contain at least one capital letter';
    }
    return null;
  }

  /// Validates if the confirm password matches the password.
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
