import 'package:intl/intl.dart';

class CValidation {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }

    return null;
  }



  static String? validateInputText({
    String? fieldName,
    String? value,
    int minRange = 3,
    int maxRange = 10,
    bool spaces = true,
    bool alphabets = true,
    bool specialCharacters = true,
    bool utfCharacters = true,
  }) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }else if(value.length < minRange){
      return '$fieldName should contain at least minimum $minRange characters.';
    }else if(value.length>maxRange){
      return '$fieldName should not contain more than $maxRange characters.';
    }else if(!spaces && value.contains(' ')){
      return '$fieldName should not contain any space.';
    }else if(!specialCharacters && value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>}]'))){
      return '$fieldName should not contain any special characters.';
    }
    // Regular expression matches any character that is not in the ASCII range
    else if (!utfCharacters && RegExp(r'[^\x00-\x7F]').hasMatch(value)){
      return '$fieldName should not contain any UTF characters.';
    }

    return null;
  }


  static String? validateJoiningDate(String? fieldName, String value,String dateOfBirth, String pattern) {

    DateTime givenDate = DateFormat(pattern).parse(value);
    DateTime dobDate = DateFormat(pattern).parse(dateOfBirth);

    if(dobDate.isBefore(givenDate)){
      return '$fieldName should not be less than DateOfBirth';
    }

    return null;
  }

  static String? validateDropDownText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }
    return null;
    // return '$fieldName is required.';

    // return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    final emailRegexEmp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegexEmp.hasMatch(value)) {
      return 'Invalid email address';
    }

    return null;
  }

  static String? validateRemarks(String? fieldName, String? value) {

    if (fieldName!.length>500) {
      return '$fieldName should not be more than 500 characters';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    if (value.length <= 0) {
      return 'Password must be at least 6 characters long.';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contains at least one uppercase letter.';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contains at least one number.';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>}]'))) {
      return 'Password must contains at least one special character.';
    }

    return null;
  }

  static String? validateUrl(String? fieldName,String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    // Regular expression for URL validation
    final urlPattern =
        r'^(https?:\/\/)?([a-z0-9-]+\.)+[a-z]{2,}(\/[^\s]*)?$';
    final regex = RegExp(urlPattern);

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid $fieldName URL';
    }
    return null; // Return null if input is valid
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    final phoneNumber = RegExp(r'^\d(10)$');

    if(value.length != 10){
      return 'Invalid phone number format (10 digits required)';
    }

    return null;
  }

  static String? validateTestScore(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName should not be empty.';
    } else if (int.tryParse(value)! < 0 ||
        int.tryParse(value)! > 100) {
      return '$fieldName should be between 0 and 100.';
    }
    return null;
  }
  static String? validateSalary(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName should not be empty.';
    } else if (int.tryParse(value)! < 0) {
      return '$fieldName should be greater than 0';
    }
    return null;
  }
}
