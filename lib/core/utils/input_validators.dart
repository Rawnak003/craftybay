class InputValidators {
  static String? emailValidator(String? value) {
    String email = value?.trim() ?? '';
    RegExp regEx = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (regEx.hasMatch(email) == false) {
      return 'Please enter valid email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if ((value?.isEmpty ?? true) || (value!.length < 6)) {
      return 'Please enter password with at least 6 letters';
    }
    return null;
  }
}