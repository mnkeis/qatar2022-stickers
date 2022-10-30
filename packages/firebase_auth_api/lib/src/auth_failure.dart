import 'package:auth_api/auth_api.dart';

class FirebaseAuthLoginException extends LoginException {
  FirebaseAuthLoginException._(LoginFailure failure) : super(failure);

  factory FirebaseAuthLoginException.fromFirebaseAuthException(e) {
    switch (e) {
      case 'wrong-password':
        return FirebaseAuthLoginException._(LoginFailure.invalidPassword);
      case 'user-not-found':
        return FirebaseAuthLoginException._(LoginFailure.userNotFound);
      default:
        return FirebaseAuthLoginException._(LoginFailure.unknown);
    }
  }
}

class FirebaseAuthSignupException extends SignupException {
  FirebaseAuthSignupException._(SignupFailure failure) : super(failure);

  factory FirebaseAuthSignupException.fromFirebaseAuthException(e) {
    switch (e) {
      case 'email-already-in-use':
        return FirebaseAuthSignupException._(SignupFailure.userAlreadyExists);
      default:
        return FirebaseAuthSignupException._(SignupFailure.unknown);
    }
  }
}

// /// {@template auth_failure}
// /// Base class for failures returned from repository
// /// {@endtemplate}
// @freezed
// class AuthFailure with _$AuthFailure {
//   /// Authentication procedure cancelled by user
//   const factory AuthFailure.userCancelled() = UserCancelled;

//   /// Failure thrown during signup
//   const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUser;

//   /// Failure thrown during login
//   const factory AuthFailure.userDisabled() = UserDisabled;

//   /// Failure with email or password login, we hide wich one is
//   const factory AuthFailure.userNotFoundOrWrongPassword() =
//       UserNotFoundOrWrongPassword;

//   /// Failure thrown by firebase related to missconfiguration
//   const factory AuthFailure.operationNotAllowed() = OperationNotAllowed;

//   /// Failure returned when we don't know what happened
//   const factory AuthFailure.unknownError() = UnknownError;

//   /// Failure that indicates that we did something wrong in our code
//   const factory AuthFailure.irrecuperableError() = IrrecuperableError;

//   /// Failure while loging out
//   const factory AuthFailure.logOutFailure() = LogOutFailure;

//   /// Static method to return failures from FairebaseAuthException codes
//   factory AuthFailure.authFailureFromFirebaseCode(String e) {
//     switch (e) {
//       case 'user-disabled':
//         return const AuthFailure.userDisabled();
//       case 'email-already-in-use':
//         return const AuthFailure.emailAlreadyInUse();
//       case 'operation-not-allowed':
//         return const AuthFailure.operationNotAllowed();
//       case 'wrong-password':
//         return const AuthFailure.userNotFoundOrWrongPassword();
//       case 'user-not-found':
//         return const AuthFailure.userNotFoundOrWrongPassword();
//       default:
//         return const AuthFailure.irrecuperableError();
//     }
//   }
// }
