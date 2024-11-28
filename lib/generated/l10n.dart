// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `UNIQUEST`
  String get uniquest {
    return Intl.message(
      'UNIQUEST',
      name: 'uniquest',
      desc: '',
      args: [],
    );
  }

  /// `Your Journey to Find Perfect University`
  String get yourJourneyToFindPerfectUniversity {
    return Intl.message(
      'Your Journey to Find Perfect University',
      name: 'yourJourneyToFindPerfectUniversity',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Dont have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account!`
  String get loginToYourAccount {
    return Intl.message(
      'Login to your account!',
      name: 'loginToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Remember me next time?`
  String get rememberMeNextTime {
    return Intl.message(
      'Remember me next time?',
      name: 'rememberMeNextTime',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get sendCode {
    return Intl.message(
      'Send Code',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Please Check Your Email!`
  String get pleaseCheckYourEmail {
    return Intl.message(
      'Please Check Your Email!',
      name: 'pleaseCheckYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Your code was sent to you via email`
  String get yourCodeWasSentToYouViaEmail {
    return Intl.message(
      'Your code was sent to you via email',
      name: 'yourCodeWasSentToYouViaEmail',
      desc: '',
      args: [],
    );
  }

  /// `Didnt receive code?`
  String get didntReceiveCode {
    return Intl.message(
      'Didnt receive code?',
      name: 'didntReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Request again`
  String get requestAgain {
    return Intl.message(
      'Request again',
      name: 'requestAgain',
      desc: '',
      args: [],
    );
  }

  /// `Your Password Has Been Successfully Changed`
  String get yourPasswordHasBeenSuccessfullyChanged {
    return Intl.message(
      'Your Password Has Been Successfully Changed',
      name: 'yourPasswordHasBeenSuccessfullyChanged',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Language`
  String get chooseYourLanguage {
    return Intl.message(
      'Choose Your Language',
      name: 'chooseYourLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `DOB`
  String get dob {
    return Intl.message(
      'DOB',
      name: 'dob',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `University Finder`
  String get universityFinder {
    return Intl.message(
      'University Finder',
      name: 'universityFinder',
      desc: '',
      args: [],
    );
  }

  /// `Find Your Perfect University Based on Your Scores`
  String get findYourPerfectUniversityBasedOnYourScores {
    return Intl.message(
      'Find Your Perfect University Based on Your Scores',
      name: 'findYourPerfectUniversityBasedOnYourScores',
      desc: '',
      args: [],
    );
  }

  /// `Find by IELTS Score`
  String get findByIELTSScore {
    return Intl.message(
      'Find by IELTS Score',
      name: 'findByIELTSScore',
      desc: '',
      args: [],
    );
  }

  /// `Find by TOEFL Score`
  String get findByTOEFLScore {
    return Intl.message(
      'Find by TOEFL Score',
      name: 'findByTOEFLScore',
      desc: '',
      args: [],
    );
  }

  /// `Find by GRE Score`
  String get findByGREScore {
    return Intl.message(
      'Find by GRE Score',
      name: 'findByGREScore',
      desc: '',
      args: [],
    );
  }

  /// `Find by GMAT Score`
  String get findByGMATScore {
    return Intl.message(
      'Find by GMAT Score',
      name: 'findByGMATScore',
      desc: '',
      args: [],
    );
  }

  /// `Compare Scores`
  String get compareScores {
    return Intl.message(
      'Compare Scores',
      name: 'compareScores',
      desc: '',
      args: [],
    );
  }

  /// `Find Top Universities`
  String get findTopUniversities {
    return Intl.message(
      'Find Top Universities',
      name: 'findTopUniversities',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get features {
    return Intl.message(
      'Features',
      name: 'features',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `What is your preferred level of study?`
  String get whatIsYourPreferredLevelOfStudy {
    return Intl.message(
      'What is your preferred level of study?',
      name: 'whatIsYourPreferredLevelOfStudy',
      desc: '',
      args: [],
    );
  }

  /// `Undergraduate`
  String get undergraduate {
    return Intl.message(
      'Undergraduate',
      name: 'undergraduate',
      desc: '',
      args: [],
    );
  }

  /// `Graduate`
  String get graduate {
    return Intl.message(
      'Graduate',
      name: 'graduate',
      desc: '',
      args: [],
    );
  }

  /// `PhD`
  String get phd {
    return Intl.message(
      'PhD',
      name: 'phd',
      desc: '',
      args: [],
    );
  }

  /// `Which countries do you prefer to study in?`
  String get whichCountriesDoYouPreferToStudyIn {
    return Intl.message(
      'Which countries do you prefer to study in?',
      name: 'whichCountriesDoYouPreferToStudyIn',
      desc: '',
      args: [],
    );
  }

  /// `USA`
  String get usa {
    return Intl.message(
      'USA',
      name: 'usa',
      desc: '',
      args: [],
    );
  }

  /// `UK`
  String get uk {
    return Intl.message(
      'UK',
      name: 'uk',
      desc: '',
      args: [],
    );
  }

  /// `Australia`
  String get australia {
    return Intl.message(
      'Australia',
      name: 'australia',
      desc: '',
      args: [],
    );
  }

  /// `Germany`
  String get germany {
    return Intl.message(
      'Germany',
      name: 'germany',
      desc: '',
      args: [],
    );
  }

  /// `What is your intended major or program of interest?`
  String get whatIsYourIntendedMajorOrProgramOfInterest {
    return Intl.message(
      'What is your intended major or program of interest?',
      name: 'whatIsYourIntendedMajorOrProgramOfInterest',
      desc: '',
      args: [],
    );
  }

  /// `What is your approximate budget for tuition and living expenses?`
  String get whatIsYourApproximateBudgetForTuitionAndLivingExpenses {
    return Intl.message(
      'What is your approximate budget for tuition and living expenses?',
      name: 'whatIsYourApproximateBudgetForTuitionAndLivingExpenses',
      desc: '',
      args: [],
    );
  }

  /// `What are your IELTS score?`
  String get whatAreYourIELTSScore {
    return Intl.message(
      'What are your IELTS score?',
      name: 'whatAreYourIELTSScore',
      desc: '',
      args: [],
    );
  }

  /// `Type your score`
  String get typeYourScore {
    return Intl.message(
      'Type your score',
      name: 'typeYourScore',
      desc: '',
      args: [],
    );
  }

  /// `What is your GPA or percentage score from previous studies?`
  String get whatIsYourGPAOrPercentageScoreFromPreviousStudies {
    return Intl.message(
      'What is your GPA or percentage score from previous studies?',
      name: 'whatIsYourGPAOrPercentageScoreFromPreviousStudies',
      desc: '',
      args: [],
    );
  }

  /// `Based on your IELTS, TOEFL, GRE, and GMAT scores, here are universities tailored just for you. Start exploring your future today!`
  String get basedOnYour {
    return Intl.message(
      'Based on your IELTS, TOEFL, GRE, and GMAT scores, here are universities tailored just for you. Start exploring your future today!',
      name: 'basedOnYour',
      desc: '',
      args: [],
    );
  }

  /// `What are your TOEFL scores?`
  String get whatAreYourTOEFLScores {
    return Intl.message(
      'What are your TOEFL scores?',
      name: 'whatAreYourTOEFLScores',
      desc: '',
      args: [],
    );
  }

  /// `What are your GRE scores?`
  String get whatAreYourGREScores {
    return Intl.message(
      'What are your GRE scores?',
      name: 'whatAreYourGREScores',
      desc: '',
      args: [],
    );
  }

  /// `What are your GMAT scores?`
  String get whatAreYourGMATScores {
    return Intl.message(
      'What are your GMAT scores?',
      name: 'whatAreYourGMATScores',
      desc: '',
      args: [],
    );
  }

  /// `FIND YOUR FAVOURITE UNIVERSITY`
  String get findYourFavouriteUniversity {
    return Intl.message(
      'FIND YOUR FAVOURITE UNIVERSITY',
      name: 'findYourFavouriteUniversity',
      desc: '',
      args: [],
    );
  }

  /// `Share your scores and preferences, and we will match you with universities that fit your goals. Your dream starts here!`
  String get shareYourScores {
    return Intl.message(
      'Share your scores and preferences, and we will match you with universities that fit your goals. Your dream starts here!',
      name: 'shareYourScores',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Country Preferences`
  String get countryPreferences {
    return Intl.message(
      'Country Preferences',
      name: 'countryPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Preferred Study Level`
  String get preferredStudyLevel {
    return Intl.message(
      'Preferred Study Level',
      name: 'preferredStudyLevel',
      desc: '',
      args: [],
    );
  }

  /// `Field of Study`
  String get fieldOfStudy {
    return Intl.message(
      'Field of Study',
      name: 'fieldOfStudy',
      desc: '',
      args: [],
    );
  }

  /// `Budget Range`
  String get budgetRange {
    return Intl.message(
      'Budget Range',
      name: 'budgetRange',
      desc: '',
      args: [],
    );
  }

  /// `IELTS Score`
  String get ieltsScore {
    return Intl.message(
      'IELTS Score',
      name: 'ieltsScore',
      desc: '',
      args: [],
    );
  }

  /// `GPA`
  String get gpa {
    return Intl.message(
      'GPA',
      name: 'gpa',
      desc: '',
      args: [],
    );
  }

  /// `Register Account`
  String get registerAccount {
    return Intl.message(
      'Register Account',
      name: 'registerAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
