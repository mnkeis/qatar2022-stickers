// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get counterAppBarTitle => 'Stickers';

  @override
  String get homePageSelectAlbumTitle => 'Select your album';

  @override
  String get homePageAddAlbum => 'Add a new album';

  @override
  String get stickersAppBarTitle => 'Stickers';

  @override
  String get statsTotalsLabel => 'Total Stickers';

  @override
  String get statsMissingLabel => 'Missing Stickers';

  @override
  String get statsCollectedLabel => 'Collected Stickers';

  @override
  String get statsSwapLabel => 'Swap Stickers';

  @override
  String get statsPercentLabel => 'Completed Percent';

  @override
  String get shareSwapsSubject => 'These are my swap stickers!';

  @override
  String get shareSwapsBody =>
      'Hi!! I have these stickers to swap, let\'s check!';

  @override
  String get missingStickersBody =>
      'Hi!! These are all my missing stickers, please check if you have some of them in your swap stack!';

  @override
  String get missingStickersSubject => 'These are my missing stickers!';

  @override
  String get messageFooter =>
      'To carry on control of your stickers without announcements, visit https://qatar2022-stickers.web.app';

  @override
  String get friendsPageTitle => 'Friends';

  @override
  String get addFriendDialogTitle => 'Add friend';

  @override
  String get addFriendDIalogBody => 'Enter your friend\'s email';

  @override
  String get okButtonText => 'OK';

  @override
  String get cancelButtonText => 'Cancel';

  @override
  String get inviteFriendToApp =>
      'Hey! I invite you to use this app so we can swap qatar2022 stickers!!, please visit https://qatar2022-stickers.web.app';

  @override
  String get friendsFailureAddingYourself =>
      'You can\'t add yourself as friend';

  @override
  String get friendsFailureUserNotFound =>
      'Friend not found, invite him to add his album data to Qatar2022-Stickers!';

  @override
  String get friendsFailureUnknown =>
      'Unexpected error: this should had not happened';

  @override
  String get friendSwapsAppBarTitle => 'Swap Stickers';

  @override
  String get friendSwapsTitle => 'Swap Stickers with';

  @override
  String get totalSwapQty => 'Total stickers to swap';

  @override
  String get availableToGive => 'Available to give';

  @override
  String get availableToGet => 'Available to get';

  @override
  String get friendSwapsFriendFailure =>
      'It was not possible to access your friend\'s album data, ask him to add you as friend so as to share stickers together';

  @override
  String get emailAlreadyInUse =>
      'The provided email address is in use by another user';

  @override
  String get userNotFoundOrWrongPassword => 'User not found or wrong password';

  @override
  String get userDisabled => 'This user is not allowed no login';

  @override
  String get userCancelled => 'Operation cancelled by user';

  @override
  String get operationNotAllowed => 'Error signing up, please contact support';

  @override
  String get unknownError => 'Unknown error';

  @override
  String get signupPageName => 'Sign Up';

  @override
  String get nameInputLabel => 'Name';

  @override
  String get nameInvalidText => 'Invalid name';

  @override
  String get emailInputLabel => 'Email';

  @override
  String get emailInvalidText => 'Invalid email';

  @override
  String get passwordInputLabel => 'Password';

  @override
  String get passwordInvalidText =>
      'Weak password, must contain letters, numbers and lenght of 8';

  @override
  String get confirmPasswordInputLabel => 'Confirm password';

  @override
  String get confirmPasswordInvalid => 'Passwords do no match';

  @override
  String get signUpButtonLabel => 'SIGN UP';

  @override
  String get loginPageName => 'Login';

  @override
  String get loginButtonLabel => 'LOGIN';

  @override
  String get loginWithGoogleButtonLabel => 'Sign in with Google';

  @override
  String get loginWithAppleButtonLabel => 'Sign in with Apple';

  @override
  String get createAccountButtonLabel => 'CREATE ACCOUNT';
}
