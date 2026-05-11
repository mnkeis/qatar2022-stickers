import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// Text shown in the AppBar of the Counter Page
  ///
  /// In en, this message translates to:
  /// **'Stickers'**
  String get counterAppBarTitle;

  /// No description provided for @homePageSelectAlbumTitle.
  ///
  /// In en, this message translates to:
  /// **'Select your album'**
  String get homePageSelectAlbumTitle;

  /// No description provided for @homePageAddAlbum.
  ///
  /// In en, this message translates to:
  /// **'Add a new album'**
  String get homePageAddAlbum;

  /// No description provided for @stickersAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Stickers'**
  String get stickersAppBarTitle;

  /// No description provided for @statsTotalsLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Stickers'**
  String get statsTotalsLabel;

  /// No description provided for @statsMissingLabel.
  ///
  /// In en, this message translates to:
  /// **'Missing Stickers'**
  String get statsMissingLabel;

  /// No description provided for @statsCollectedLabel.
  ///
  /// In en, this message translates to:
  /// **'Collected Stickers'**
  String get statsCollectedLabel;

  /// No description provided for @statsSwapLabel.
  ///
  /// In en, this message translates to:
  /// **'Swap Stickers'**
  String get statsSwapLabel;

  /// No description provided for @statsPercentLabel.
  ///
  /// In en, this message translates to:
  /// **'Completed Percent'**
  String get statsPercentLabel;

  /// No description provided for @shareSwapsSubject.
  ///
  /// In en, this message translates to:
  /// **'These are my swap stickers!'**
  String get shareSwapsSubject;

  /// No description provided for @shareSwapsBody.
  ///
  /// In en, this message translates to:
  /// **'Hi!! I have these stickers to swap, let\'s check!'**
  String get shareSwapsBody;

  /// No description provided for @missingStickersBody.
  ///
  /// In en, this message translates to:
  /// **'Hi!! These are all my missing stickers, please check if you have some of them in your swap stack!'**
  String get missingStickersBody;

  /// No description provided for @missingStickersSubject.
  ///
  /// In en, this message translates to:
  /// **'These are my missing stickers!'**
  String get missingStickersSubject;

  /// No description provided for @messageFooter.
  ///
  /// In en, this message translates to:
  /// **'To carry on control of your stickers without announcements, visit https://qatar2022-stickers.web.app'**
  String get messageFooter;

  /// No description provided for @friendsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Friends'**
  String get friendsPageTitle;

  /// No description provided for @addFriendDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add friend'**
  String get addFriendDialogTitle;

  /// No description provided for @addFriendDIalogBody.
  ///
  /// In en, this message translates to:
  /// **'Enter your friend\'s email'**
  String get addFriendDIalogBody;

  /// No description provided for @okButtonText.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButtonText;

  /// No description provided for @cancelButtonText.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButtonText;

  /// No description provided for @inviteFriendToApp.
  ///
  /// In en, this message translates to:
  /// **'Hey! I invite you to use this app so we can swap qatar2022 stickers!!, please visit https://qatar2022-stickers.web.app'**
  String get inviteFriendToApp;

  /// No description provided for @friendsFailureAddingYourself.
  ///
  /// In en, this message translates to:
  /// **'You can\'t add yourself as friend'**
  String get friendsFailureAddingYourself;

  /// No description provided for @friendsFailureUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'Friend not found, invite him to add his album data to Qatar2022-Stickers!'**
  String get friendsFailureUserNotFound;

  /// No description provided for @friendsFailureUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error: this should had not happened'**
  String get friendsFailureUnknown;

  /// No description provided for @friendSwapsAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Swap Stickers'**
  String get friendSwapsAppBarTitle;

  /// No description provided for @friendSwapsTitle.
  ///
  /// In en, this message translates to:
  /// **'Swap Stickers with'**
  String get friendSwapsTitle;

  /// No description provided for @totalSwapQty.
  ///
  /// In en, this message translates to:
  /// **'Total stickers to swap'**
  String get totalSwapQty;

  /// No description provided for @availableToGive.
  ///
  /// In en, this message translates to:
  /// **'Available to give'**
  String get availableToGive;

  /// No description provided for @availableToGet.
  ///
  /// In en, this message translates to:
  /// **'Available to get'**
  String get availableToGet;

  /// No description provided for @friendSwapsFriendFailure.
  ///
  /// In en, this message translates to:
  /// **'It was not possible to access your friend\'s album data, ask him to add you as friend so as to share stickers together'**
  String get friendSwapsFriendFailure;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'The provided email address is in use by another user'**
  String get emailAlreadyInUse;

  /// No description provided for @userNotFoundOrWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'User not found or wrong password'**
  String get userNotFoundOrWrongPassword;

  /// No description provided for @userDisabled.
  ///
  /// In en, this message translates to:
  /// **'This user is not allowed no login'**
  String get userDisabled;

  /// No description provided for @userCancelled.
  ///
  /// In en, this message translates to:
  /// **'Operation cancelled by user'**
  String get userCancelled;

  /// No description provided for @operationNotAllowed.
  ///
  /// In en, this message translates to:
  /// **'Error signing up, please contact support'**
  String get operationNotAllowed;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// No description provided for @signupPageName.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signupPageName;

  /// No description provided for @nameInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameInputLabel;

  /// No description provided for @nameInvalidText.
  ///
  /// In en, this message translates to:
  /// **'Invalid name'**
  String get nameInvalidText;

  /// No description provided for @emailInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailInputLabel;

  /// No description provided for @emailInvalidText.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get emailInvalidText;

  /// No description provided for @passwordInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordInputLabel;

  /// No description provided for @passwordInvalidText.
  ///
  /// In en, this message translates to:
  /// **'Weak password, must contain letters, numbers and lenght of 8'**
  String get passwordInvalidText;

  /// No description provided for @confirmPasswordInputLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPasswordInputLabel;

  /// No description provided for @confirmPasswordInvalid.
  ///
  /// In en, this message translates to:
  /// **'Passwords do no match'**
  String get confirmPasswordInvalid;

  /// No description provided for @signUpButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP'**
  String get signUpButtonLabel;

  /// No description provided for @loginPageName.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginPageName;

  /// No description provided for @loginButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get loginButtonLabel;

  /// No description provided for @loginWithGoogleButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get loginWithGoogleButtonLabel;

  /// No description provided for @loginWithAppleButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get loginWithAppleButtonLabel;

  /// No description provided for @createAccountButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'CREATE ACCOUNT'**
  String get createAccountButtonLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
