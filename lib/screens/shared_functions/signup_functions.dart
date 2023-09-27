import 'dart:core';

import 'package:sportify/screens/authentication/owner_signup/owner_signup.dart';

class SignUpFunction {
  static String? emailValidator(var value) {
    if (value.isEmpty) {
      return 'Email required';
    }

    if (!value.contains("@gmail.com")) {
      return 'Invalid email format. It must be like XX@XX.com';
    }

    return null;
  }

  static String? passwordValidator(value) {
    if (value.isEmpty ||
        capitalLetterValid == false ||
        specialCharacterValid == false ||
        numberValid == false) {
      return 'This field is required and must contain: '
          'at least one capital letter, one special character, and one number.';
    }
    return null;
  }

  static bool isPasswordValid(String password) {
    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    RegExp specialCharRegex = RegExp(r'[!@#$%^&*]');
    RegExp digitRegex = RegExp(r'\d');

    bool capitalLetterValid = uppercaseRegex.hasMatch(password);
    bool specialCharacterValid = specialCharRegex.hasMatch(password);
    bool numberValid = digitRegex.hasMatch(password);

    return capitalLetterValid && specialCharacterValid && numberValid;
  }
}
