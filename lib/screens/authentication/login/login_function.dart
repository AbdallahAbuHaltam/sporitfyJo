class LoginFunction {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email required';
    }
    if (!value.contains("@gmail.com")) {
      return 'Invalid email format. It must be like XX@XX.com';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'required ,Please enter a password';
    }
    if (!isPasswordValid(value)) {
      return 'Password must contain at least one uppercase letter,\n one special character, and one digit.';
    }

    return null;
  }

  static bool isPasswordValid(String password) {
    RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{8,}$');
    return regex.hasMatch(password);
  }
}