class CFormatException implements Exception {
  final String message;

  const CFormatException([this.message = "An unknown format error occurred. Please check your input."]);

  factory CFormatException.fromMessage(String message){
    return CFormatException(message);
  }

  String get formatMessage => message;

  factory CFormatException.fromCode(String code){
    switch(code){
      case 'invalid-email-format':
        return const CFormatException('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const CFormatException('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const CFormatException('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const CFormatException('The URL address format is invalid. Please enter a valid URL.');

        default:
          return const CFormatException();
    }
  }

}
