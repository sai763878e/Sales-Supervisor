class CFirebaseException implements Exception {
  final String code;

  CFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again.';
        break;
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';
        break;
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
        break;
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
        break;
      case 'user-not-found':
        return 'Invalid login details. User not found.';
        break;
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again';
        break;
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
        break;
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
        break;
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
        break;
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
        break;
      case 'email-already-exists':
        return 'The email is already exists. Please use a different email.';
        break;
      case 'requires-recent-login':
        return 'The operation is sensitive and requires recent authentication. Please login again.';
        break;
      case 'credentials-already-in-use':
        return 'The credentials is alreasy associated with a different user account.';
        break;

      default:
        return 'An unknown error occurred';
        break;
    }
  }
}
