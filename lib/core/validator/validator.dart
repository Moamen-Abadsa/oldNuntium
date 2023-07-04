import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';

class FieldValidator {
  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return ManagerStrings.invalidEmail;
    }

    if (!RegExp(r"\S+@\S+\.\S+").hasMatch(email)) {
      return ManagerStrings.invalidEmail;
    }

    if (!GetUtils.isEmail(email)) {
      return ManagerStrings.invalidEmail;
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return ManagerStrings.invalidPasswordLength;
    }

    if (password.length < 8) {
      return ManagerStrings.invalidPasswordDigit;
    }

    return null;
  }

  String? validateFullName(String? fullName) {
    if (fullName!.isEmpty) {
      return ManagerStrings.requiredFullName;
    }

    return null;
  }

  String? validateCode(value) {
    if (value == null || value.trim().isEmpty) {
      return ManagerStrings.invalidEmptyCode;
    }
    return null;
  }
}
