import 'package:reservation_app/function/validator.dart';
import 'package:reservation_app/strings/ui_string.dart';

class ValidationFunction {
  static String? emailValidator(String? value) {
    if (value!.trim().isEmpty) {
      return UiString.message.kEnterEmail;
    } else if (!Validator.isValidEmail(value)) {
      return UiString.message.kEnterValidEmail;
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? value) {
    if (value!.trim().isEmpty) {
      return UiString.message.kEnterPassword;
    } else if (!Validator.isValidPassword(value)) {
      return UiString.message.kEnterValidPassword;
    } else {
      return null;
    }
  }
}
