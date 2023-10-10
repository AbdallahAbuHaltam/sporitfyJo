import 'dart:core';

import 'package:flutter/material.dart';
import 'package:sportify/screens/authentication/owner_signup/owner_signup.dart';

class SharedFunction {
  static String? emailValidator(var value) {
    if (value.isEmpty) {
      return 'Email required';
    }

    if (!value.contains("@gmail.com")) {
      return 'Invalid email format. It must be like XX@XX.com';
    }

    return null;
  }

  

  static String? validatePassword(value) {
    if (value!.isEmpty ||
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

    capitalLetterValid = uppercaseRegex.hasMatch(password);
    specialCharacterValid = specialCharRegex.hasMatch(password);
    numberValid = digitRegex.hasMatch(password);

    return capitalLetterValid && specialCharacterValid && numberValid;
  }

  static void navigatorPushFunction(BuildContext context, pageName) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pageName,
        ));
  }

  static void navigatorPopFunction(BuildContext context) {
    Navigator.pop(context);
  }

  static void navigatorPushAndRemoveUntilFunction(
      BuildContext context, pageName) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => pageName,
      ),
      (route) => false,
    );
  }
}
