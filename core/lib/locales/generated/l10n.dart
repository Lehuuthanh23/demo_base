import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('vi'),
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notification;

  /// No description provided for @unread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get unread;

  /// No description provided for @markAllAsRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get markAllAsRead;

  /// No description provided for @deleteReadNotifications.
  ///
  /// In en, this message translates to:
  /// **'Delete read notifications'**
  String get deleteReadNotifications;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get noNotifications;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get errorOccurred;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get chooseLanguage;

  /// No description provided for @chooseLanguageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the language that suits you'**
  String get chooseLanguageSubtitle;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageEnglishNative.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglishNative;

  /// No description provided for @languageVietnamese.
  ///
  /// In en, this message translates to:
  /// **'Vietnamese'**
  String get languageVietnamese;

  /// No description provided for @languageVietnameseNative.
  ///
  /// In en, this message translates to:
  /// **'Tiếng Việt'**
  String get languageVietnameseNative;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @rememberPassword.
  ///
  /// In en, this message translates to:
  /// **'Remember password'**
  String get rememberPassword;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Access the GoOffice CRM system'**
  String get loginSubtitle;

  /// No description provided for @newCustomerRegister.
  ///
  /// In en, this message translates to:
  /// **'New customer? Register'**
  String get newCustomerRegister;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @dealer.
  ///
  /// In en, this message translates to:
  /// **'Dealer'**
  String get dealer;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get signupTitle;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @selectProvince.
  ///
  /// In en, this message translates to:
  /// **'Select province/city'**
  String get selectProvince;

  /// No description provided for @filterTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filterTitle;

  /// No description provided for @clearFilter.
  ///
  /// In en, this message translates to:
  /// **'Clear filter'**
  String get clearFilter;

  /// No description provided for @applyFilter.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get applyFilter;

  /// No description provided for @provincePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Province/City'**
  String get provincePlaceholder;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAccount;

  /// No description provided for @dealerSignupTitle.
  ///
  /// In en, this message translates to:
  /// **'Dealer registration'**
  String get dealerSignupTitle;

  /// No description provided for @dealerSignupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'To register as a GoOffice dealer, please contact us directly for support and onboarding.'**
  String get dealerSignupSubtitle;

  /// No description provided for @callDirectly.
  ///
  /// In en, this message translates to:
  /// **'Call directly'**
  String get callDirectly;

  /// No description provided for @messageZalo.
  ///
  /// In en, this message translates to:
  /// **'Message via Zalo'**
  String get messageZalo;

  /// No description provided for @sendEmail.
  ///
  /// In en, this message translates to:
  /// **'Send email'**
  String get sendEmail;

  /// No description provided for @workingHours.
  ///
  /// In en, this message translates to:
  /// **'Working hours'**
  String get workingHours;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get goBack;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email or phone number to receive an OTP'**
  String get forgotPasswordSubtitle;

  /// No description provided for @forgotPasswordPhoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered phone number to receive an OTP'**
  String get forgotPasswordPhoneSubtitle;

  /// No description provided for @otpSentSuccess.
  ///
  /// In en, this message translates to:
  /// **'OTP has been sent to your email'**
  String get otpSentSuccess;

  /// No description provided for @resetPasswordSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password updated successfully'**
  String get resetPasswordSuccess;

  /// No description provided for @emailOrPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Email or phone number'**
  String get emailOrPhoneLabel;

  /// No description provided for @emailOrPhoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter email or phone number'**
  String get emailOrPhoneRequired;

  /// No description provided for @emailOrPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'email@example.com / 0901234567'**
  String get emailOrPhoneHint;

  /// No description provided for @passwordMaskedHint.
  ///
  /// In en, this message translates to:
  /// **'••••••••'**
  String get passwordMaskedHint;

  /// No description provided for @registerEmailHint.
  ///
  /// In en, this message translates to:
  /// **'customer@email.com'**
  String get registerEmailHint;

  /// No description provided for @changePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePasswordTitle;

  /// No description provided for @changePasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP and enter your new password'**
  String get changePasswordSubtitle;

  /// No description provided for @changePasswordAction.
  ///
  /// In en, this message translates to:
  /// **'Update password'**
  String get changePasswordAction;

  /// No description provided for @settingsChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get settingsChangePassword;

  /// No description provided for @settingsChangePasswordDesc.
  ///
  /// In en, this message translates to:
  /// **'Update login password via OTP'**
  String get settingsChangePasswordDesc;

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOtp;

  /// No description provided for @otpRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter the 6-digit OTP'**
  String get otpRequired;

  /// No description provided for @confirmPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Password confirmation does not match'**
  String get confirmPasswordMismatch;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @getVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Get verification code'**
  String get getVerificationCode;

  /// No description provided for @enterVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Enter verification code'**
  String get enterVerificationCode;

  /// No description provided for @verificationCodeSentToEmail.
  ///
  /// In en, this message translates to:
  /// **'We have sent a verification code to your email'**
  String get verificationCodeSentToEmail;

  /// No description provided for @verificationCodeCountdown.
  ///
  /// In en, this message translates to:
  /// **'The code is valid for 5 minutes\nResend code in 04:59'**
  String get verificationCodeCountdown;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get enterNewPassword;

  /// No description provided for @newPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Receive the verification code sent via email'**
  String get newPasswordSubtitle;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enterPassword;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordMinLength;

  /// No description provided for @passwordUppercaseRequirement.
  ///
  /// In en, this message translates to:
  /// **'Must contain at least 1 uppercase letter'**
  String get passwordUppercaseRequirement;

  /// No description provided for @passwordNumberRequirement.
  ///
  /// In en, this message translates to:
  /// **'Must contain at least 1 number'**
  String get passwordNumberRequirement;

  /// No description provided for @product.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get product;

  /// No description provided for @quote.
  ///
  /// In en, this message translates to:
  /// **'Quote'**
  String get quote;

  /// No description provided for @quickQuote.
  ///
  /// In en, this message translates to:
  /// **'Quick quote'**
  String get quickQuote;

  /// No description provided for @dealers.
  ///
  /// In en, this message translates to:
  /// **'Dealers'**
  String get dealers;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @personal.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get personal;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Solar promotion'**
  String get filter;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchHint;

  /// No description provided for @searchProductHint.
  ///
  /// In en, this message translates to:
  /// **'Search products'**
  String get searchProductHint;

  /// No description provided for @searchNewsHint.
  ///
  /// In en, this message translates to:
  /// **'Search articles'**
  String get searchNewsHint;

  /// No description provided for @quickAccess.
  ///
  /// In en, this message translates to:
  /// **'Quick access'**
  String get quickAccess;

  /// No description provided for @customerHomeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello!'**
  String get customerHomeGreeting;

  /// No description provided for @customerHomeBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Save up to 90% on power bills'**
  String get customerHomeBannerTitle;

  /// No description provided for @customerHomeBannerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Optimize monthly electricity costs for your home.'**
  String get customerHomeBannerSubtitle;

  /// No description provided for @dealerHomeBannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Track your hottest leads'**
  String get dealerHomeBannerTitle;

  /// No description provided for @dealerHomeBannerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Prioritize quotes, projects and profile updates from one place.'**
  String get dealerHomeBannerSubtitle;

  /// No description provided for @dealerHomeInfoStrip.
  ///
  /// In en, this message translates to:
  /// **'You have 3 new consulting requests waiting'**
  String get dealerHomeInfoStrip;

  /// No description provided for @homeQuickDealerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Nearby partners'**
  String get homeQuickDealerSubtitle;

  /// No description provided for @homeQuickProductSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Product catalog'**
  String get homeQuickProductSubtitle;

  /// No description provided for @homeQuickQuoteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find the right system fast'**
  String get homeQuickQuoteSubtitle;

  /// No description provided for @homeQuickSerialSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Verify authenticity'**
  String get homeQuickSerialSubtitle;

  /// No description provided for @homeQuickCustomerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'New incoming leads'**
  String get homeQuickCustomerSubtitle;

  /// No description provided for @homeQuickProjectSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track project progress'**
  String get homeQuickProjectSubtitle;

  /// No description provided for @homeQuickProfileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Update company profile'**
  String get homeQuickProfileSubtitle;

  /// No description provided for @nearbyDealersTitle.
  ///
  /// In en, this message translates to:
  /// **'Nearby dealers'**
  String get nearbyDealersTitle;

  /// No description provided for @dealerCustomersTitle.
  ///
  /// In en, this message translates to:
  /// **'New customers'**
  String get dealerCustomersTitle;

  /// No description provided for @recentProjectsTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent projects'**
  String get recentProjectsTitle;

  /// No description provided for @latestNews.
  ///
  /// In en, this message translates to:
  /// **'Latest news'**
  String get latestNews;

  /// No description provided for @seeDetails.
  ///
  /// In en, this message translates to:
  /// **'See details'**
  String get seeDetails;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @promotion.
  ///
  /// In en, this message translates to:
  /// **'Promotion'**
  String get promotion;

  /// No description provided for @newsKnowledgeCategory.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get newsKnowledgeCategory;

  /// No description provided for @newsReadTimeShort.
  ///
  /// In en, this message translates to:
  /// **'3 min read'**
  String get newsReadTimeShort;

  /// No description provided for @newsArticleTitleOne.
  ///
  /// In en, this message translates to:
  /// **'Summer 2025 offer: 15% off Hybrid systems + 5M installation gift'**
  String get newsArticleTitleOne;

  /// No description provided for @newsArticleExcerptOne.
  ///
  /// In en, this message translates to:
  /// **'GoOffice launches its biggest seasonal offer for residential Hybrid solutions.'**
  String get newsArticleExcerptOne;

  /// No description provided for @newsArticleContentOne.
  ///
  /// In en, this message translates to:
  /// **'With solar radiation increasing during the summer season, this is an ideal time for households and businesses to invest in rooftop solar. To make clean energy easier to access, GoOffice is rolling out one of its strongest campaigns of the year with better pricing, installation incentives and faster deployment support.'**
  String get newsArticleContentOne;

  /// No description provided for @newsArticleTitleTwo.
  ///
  /// In en, this message translates to:
  /// **'5 reasons to install solar power today'**
  String get newsArticleTitleTwo;

  /// No description provided for @newsArticleExcerptTwo.
  ///
  /// In en, this message translates to:
  /// **'From lower utility bills to stronger energy independence, these are the reasons solar keeps gaining momentum.'**
  String get newsArticleExcerptTwo;

  /// No description provided for @newsArticleContentTwo.
  ///
  /// In en, this message translates to:
  /// **'Solar power helps reduce operating costs while increasing energy resilience for homes and businesses. With better equipment pricing, stronger after-sales support and rising power demand, now is a practical time to deploy either a grid-tied or Hybrid system.'**
  String get newsArticleContentTwo;

  /// No description provided for @newsConditionOne.
  ///
  /// In en, this message translates to:
  /// **'Order from 01/03 - 30/04/2025'**
  String get newsConditionOne;

  /// No description provided for @newsConditionTwo.
  ///
  /// In en, this message translates to:
  /// **'Applies to Hybrid systems from 5kW'**
  String get newsConditionTwo;

  /// No description provided for @newsConditionThree.
  ///
  /// In en, this message translates to:
  /// **'Available at participating dealer zones'**
  String get newsConditionThree;

  /// No description provided for @newsConditionFour.
  ///
  /// In en, this message translates to:
  /// **'Cannot be combined with other campaigns'**
  String get newsConditionFour;

  /// No description provided for @newsInsightOne.
  ///
  /// In en, this message translates to:
  /// **'Reduce long-term electricity spending'**
  String get newsInsightOne;

  /// No description provided for @newsInsightTwo.
  ///
  /// In en, this message translates to:
  /// **'Increase property value and system reliability'**
  String get newsInsightTwo;

  /// No description provided for @newsDetail.
  ///
  /// In en, this message translates to:
  /// **'News detail'**
  String get newsDetail;

  /// No description provided for @productCatalog.
  ///
  /// In en, this message translates to:
  /// **'Product catalog'**
  String get productCatalog;

  /// No description provided for @bestSeller.
  ///
  /// In en, this message translates to:
  /// **'Best seller'**
  String get bestSeller;

  /// No description provided for @noMatchingProducts.
  ///
  /// In en, this message translates to:
  /// **'No matching products found'**
  String get noMatchingProducts;

  /// No description provided for @errorLoadingProducts.
  ///
  /// In en, this message translates to:
  /// **'Could not load products. Please try again.'**
  String get errorLoadingProducts;

  /// No description provided for @productCardSublineOne.
  ///
  /// In en, this message translates to:
  /// **'New-generation Mono-Glass technology'**
  String get productCardSublineOne;

  /// No description provided for @productCardSublineTwo.
  ///
  /// In en, this message translates to:
  /// **'Double-glass N-Type technology'**
  String get productCardSublineTwo;

  /// No description provided for @productCardSublineThree.
  ///
  /// In en, this message translates to:
  /// **'ABC N-Type technology'**
  String get productCardSublineThree;

  /// No description provided for @productDescriptionOne.
  ///
  /// In en, this message translates to:
  /// **'A Hybrid solution tailored for homes that want to optimize grid usage and backup storage.'**
  String get productDescriptionOne;

  /// No description provided for @productDescriptionTwo.
  ///
  /// In en, this message translates to:
  /// **'A high-efficiency panel line suitable for medium and large grid-tied systems.'**
  String get productDescriptionTwo;

  /// No description provided for @productDescriptionThree.
  ///
  /// In en, this message translates to:
  /// **'A premium solution for systems that require higher output, stable efficiency and long-term durability.'**
  String get productDescriptionThree;

  /// No description provided for @productDetail.
  ///
  /// In en, this message translates to:
  /// **'Product detail'**
  String get productDetail;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @specifications.
  ///
  /// In en, this message translates to:
  /// **'Specifications'**
  String get specifications;

  /// No description provided for @documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documents;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @technicalSpecificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Technical specifications'**
  String get technicalSpecificationsTitle;

  /// No description provided for @attachedDocuments.
  ///
  /// In en, this message translates to:
  /// **'Attached documents'**
  String get attachedDocuments;

  /// No description provided for @frequentlyAskedQuestions.
  ///
  /// In en, this message translates to:
  /// **'Frequently asked questions'**
  String get frequentlyAskedQuestions;

  /// No description provided for @capacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity'**
  String get capacity;

  /// No description provided for @efficiency.
  ///
  /// In en, this message translates to:
  /// **'Efficiency'**
  String get efficiency;

  /// No description provided for @warranty.
  ///
  /// In en, this message translates to:
  /// **'Warranty'**
  String get warranty;

  /// No description provided for @productWarranty5Years.
  ///
  /// In en, this message translates to:
  /// **'5 years'**
  String get productWarranty5Years;

  /// No description provided for @productWarranty8Years.
  ///
  /// In en, this message translates to:
  /// **'8 years'**
  String get productWarranty8Years;

  /// No description provided for @productWarranty10Years.
  ///
  /// In en, this message translates to:
  /// **'10 years'**
  String get productWarranty10Years;

  /// No description provided for @productWarranty12Years.
  ///
  /// In en, this message translates to:
  /// **'12 years'**
  String get productWarranty12Years;

  /// No description provided for @productWarranty15Years.
  ///
  /// In en, this message translates to:
  /// **'15 years'**
  String get productWarranty15Years;

  /// No description provided for @productWarranty25Years.
  ///
  /// In en, this message translates to:
  /// **'25 years'**
  String get productWarranty25Years;

  /// No description provided for @productDatasheet.
  ///
  /// In en, this message translates to:
  /// **'Datasheet'**
  String get productDatasheet;

  /// No description provided for @warrantyCertificate.
  ///
  /// In en, this message translates to:
  /// **'Warranty certificate'**
  String get warrantyCertificate;

  /// No description provided for @installationGuide.
  ///
  /// In en, this message translates to:
  /// **'Installation guide'**
  String get installationGuide;

  /// No description provided for @productSpecSystemType.
  ///
  /// In en, this message translates to:
  /// **'System type'**
  String get productSpecSystemType;

  /// No description provided for @productSpecHybridStorage.
  ///
  /// In en, this message translates to:
  /// **'Hybrid storage'**
  String get productSpecHybridStorage;

  /// No description provided for @productSpecGridTie.
  ///
  /// In en, this message translates to:
  /// **'Grid-tied'**
  String get productSpecGridTie;

  /// No description provided for @productSpecHybrid.
  ///
  /// In en, this message translates to:
  /// **'Hybrid'**
  String get productSpecHybrid;

  /// No description provided for @productSpecInverter.
  ///
  /// In en, this message translates to:
  /// **'Inverter'**
  String get productSpecInverter;

  /// No description provided for @productSpecPanelCount.
  ///
  /// In en, this message translates to:
  /// **'Panel count'**
  String get productSpecPanelCount;

  /// No description provided for @productSpecEfficiency.
  ///
  /// In en, this message translates to:
  /// **'Inverter efficiency'**
  String get productSpecEfficiency;

  /// No description provided for @productSpecLifeCycle.
  ///
  /// In en, this message translates to:
  /// **'Battery cycle life'**
  String get productSpecLifeCycle;

  /// No description provided for @productSpecPanelWarranty.
  ///
  /// In en, this message translates to:
  /// **'Panel warranty'**
  String get productSpecPanelWarranty;

  /// No description provided for @productSpecInverterWarranty.
  ///
  /// In en, this message translates to:
  /// **'Inverter warranty'**
  String get productSpecInverterWarranty;

  /// No description provided for @productSpecArea.
  ///
  /// In en, this message translates to:
  /// **'Installation area'**
  String get productSpecArea;

  /// No description provided for @productSpecCertificate.
  ///
  /// In en, this message translates to:
  /// **'Certificates'**
  String get productSpecCertificate;

  /// No description provided for @productFaqOneQuestion.
  ///
  /// In en, this message translates to:
  /// **'Will the system keep running during a power outage?'**
  String get productFaqOneQuestion;

  /// No description provided for @productFaqOneAnswer.
  ///
  /// In en, this message translates to:
  /// **'If the setup includes storage and a Hybrid inverter, priority loads can stay powered during grid outages.'**
  String get productFaqOneAnswer;

  /// No description provided for @productFaqTwoQuestion.
  ///
  /// In en, this message translates to:
  /// **'Can I finance the system through a bank?'**
  String get productFaqTwoQuestion;

  /// No description provided for @productFaqTwoAnswer.
  ///
  /// In en, this message translates to:
  /// **'Yes. Your dealer or sales advisor can guide you through financing options that fit your region.'**
  String get productFaqTwoAnswer;

  /// No description provided for @productFaqThreeQuestion.
  ///
  /// In en, this message translates to:
  /// **'How long does it take to break even?'**
  String get productFaqThreeQuestion;

  /// No description provided for @productFaqThreeAnswer.
  ///
  /// In en, this message translates to:
  /// **'Payback depends on consumption and system size, but residential systems often recover costs within 3 to 5 years.'**
  String get productFaqThreeAnswer;

  /// No description provided for @requestQuoteNow.
  ///
  /// In en, this message translates to:
  /// **'Quote now'**
  String get requestQuoteNow;

  /// No description provided for @quoteGridTie.
  ///
  /// In en, this message translates to:
  /// **'Grid-tied'**
  String get quoteGridTie;

  /// No description provided for @quoteHybrid.
  ///
  /// In en, this message translates to:
  /// **'Hybrid'**
  String get quoteHybrid;

  /// No description provided for @quoteSolarPump.
  ///
  /// In en, this message translates to:
  /// **'Solar Pump'**
  String get quoteSolarPump;

  /// No description provided for @electricityTypeInUse.
  ///
  /// In en, this message translates to:
  /// **'Electricity type in use'**
  String get electricityTypeInUse;

  /// No description provided for @phaseOne.
  ///
  /// In en, this message translates to:
  /// **'1 phase'**
  String get phaseOne;

  /// No description provided for @phaseThree.
  ///
  /// In en, this message translates to:
  /// **'3 phase'**
  String get phaseThree;

  /// No description provided for @monthlyElectricityBill.
  ///
  /// In en, this message translates to:
  /// **'Average monthly electricity bill'**
  String get monthlyElectricityBill;

  /// No description provided for @billExample.
  ///
  /// In en, this message translates to:
  /// **'Ex: 2,000,000'**
  String get billExample;

  /// No description provided for @billHelperText.
  ///
  /// In en, this message translates to:
  /// **'Based on your latest electricity bill'**
  String get billHelperText;

  /// No description provided for @dayNightUsageRatio.
  ///
  /// In en, this message translates to:
  /// **'Day and night consumption ratio'**
  String get dayNightUsageRatio;

  /// No description provided for @dayLabel.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get dayLabel;

  /// No description provided for @nightLabel.
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get nightLabel;

  /// No description provided for @quoteNote.
  ///
  /// In en, this message translates to:
  /// **'Note: If your daytime usage is below 30%, a storage-ready setup may be a better investment.'**
  String get quoteNote;

  /// No description provided for @calculateQuoteNow.
  ///
  /// In en, this message translates to:
  /// **'Calculate quote now'**
  String get calculateQuoteNow;

  /// No description provided for @quoteResult.
  ///
  /// In en, this message translates to:
  /// **'Quote result'**
  String get quoteResult;

  /// No description provided for @suggestedCapacity.
  ///
  /// In en, this message translates to:
  /// **'Suggested capacity'**
  String get suggestedCapacity;

  /// No description provided for @suggestedConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Recommended configuration'**
  String get suggestedConfiguration;

  /// No description provided for @investmentCost.
  ///
  /// In en, this message translates to:
  /// **'Investment cost'**
  String get investmentCost;

  /// No description provided for @monthlySavings.
  ///
  /// In en, this message translates to:
  /// **'Monthly savings'**
  String get monthlySavings;

  /// No description provided for @sendQuoteRequest.
  ///
  /// In en, this message translates to:
  /// **'Send quote request'**
  String get sendQuoteRequest;

  /// No description provided for @quoteConfigPanels.
  ///
  /// In en, this message translates to:
  /// **'12 Mono 450W solar panels'**
  String get quoteConfigPanels;

  /// No description provided for @quoteConfigHybridInverter.
  ///
  /// In en, this message translates to:
  /// **'5kW hybrid inverter'**
  String get quoteConfigHybridInverter;

  /// No description provided for @quoteConfigStringInverter.
  ///
  /// In en, this message translates to:
  /// **'High-efficiency string inverter'**
  String get quoteConfigStringInverter;

  /// No description provided for @powerCalculationGuide.
  ///
  /// In en, this message translates to:
  /// **'Power sizing guide'**
  String get powerCalculationGuide;

  /// No description provided for @waterFlow.
  ///
  /// In en, this message translates to:
  /// **'Flow rate (m3/h)'**
  String get waterFlow;

  /// No description provided for @waterFlowDesc.
  ///
  /// In en, this message translates to:
  /// **'The amount of water needed in one hour of operation.'**
  String get waterFlowDesc;

  /// No description provided for @pumpHeight.
  ///
  /// In en, this message translates to:
  /// **'Head height (m)'**
  String get pumpHeight;

  /// No description provided for @pumpHeightDesc.
  ///
  /// In en, this message translates to:
  /// **'The vertical distance from the water source to the discharge point.'**
  String get pumpHeightDesc;

  /// No description provided for @pipeDiameter.
  ///
  /// In en, this message translates to:
  /// **'Pipe diameter'**
  String get pipeDiameter;

  /// No description provided for @pipeDiameterDesc.
  ///
  /// In en, this message translates to:
  /// **'Pipe size affects output pressure and system resistance.'**
  String get pipeDiameterDesc;

  /// No description provided for @distanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distanceLabel;

  /// No description provided for @distanceDesc.
  ///
  /// In en, this message translates to:
  /// **'The total pipe run from the water source to the destination.'**
  String get distanceDesc;

  /// No description provided for @technicalInformation.
  ///
  /// In en, this message translates to:
  /// **'Technical information'**
  String get technicalInformation;

  /// No description provided for @flowHint.
  ///
  /// In en, this message translates to:
  /// **'Example: 5'**
  String get flowHint;

  /// No description provided for @headHint.
  ///
  /// In en, this message translates to:
  /// **'Example: 30'**
  String get headHint;

  /// No description provided for @pipeHint.
  ///
  /// In en, this message translates to:
  /// **'Example: 60'**
  String get pipeHint;

  /// No description provided for @distanceHint.
  ///
  /// In en, this message translates to:
  /// **'Example: 100'**
  String get distanceHint;

  /// No description provided for @contactNamePhone.
  ///
  /// In en, this message translates to:
  /// **'Contact name / phone'**
  String get contactNamePhone;

  /// No description provided for @contactHint.
  ///
  /// In en, this message translates to:
  /// **'Ex: Nguyen Van A - 090xxxx'**
  String get contactHint;

  /// No description provided for @additionalDescription.
  ///
  /// In en, this message translates to:
  /// **'Additional description'**
  String get additionalDescription;

  /// No description provided for @additionalDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Notes about terrain, crops, or site conditions...'**
  String get additionalDescriptionHint;

  /// No description provided for @sendConsultingRequest.
  ///
  /// In en, this message translates to:
  /// **'Send consulting request'**
  String get sendConsultingRequest;

  /// No description provided for @supportCompletedProjects.
  ///
  /// In en, this message translates to:
  /// **'Completed projects'**
  String get supportCompletedProjects;

  /// No description provided for @supportCallNow.
  ///
  /// In en, this message translates to:
  /// **'Call now'**
  String get supportCallNow;

  /// No description provided for @supportFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get supportFullName;

  /// No description provided for @supportPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get supportPhoneNumber;

  /// No description provided for @supportInstallationAddress.
  ///
  /// In en, this message translates to:
  /// **'Installation address'**
  String get supportInstallationAddress;

  /// No description provided for @supportSystemType.
  ///
  /// In en, this message translates to:
  /// **'System type'**
  String get supportSystemType;

  /// No description provided for @supportSystemTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Please select a system type'**
  String get supportSystemTypeHint;

  /// No description provided for @supportPreferredContactTime.
  ///
  /// In en, this message translates to:
  /// **'Contact time'**
  String get supportPreferredContactTime;

  /// No description provided for @supportMorning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get supportMorning;

  /// No description provided for @supportMorningHours.
  ///
  /// In en, this message translates to:
  /// **'(8 AM - 12 PM)'**
  String get supportMorningHours;

  /// No description provided for @supportAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get supportAfternoon;

  /// No description provided for @supportAfternoonHours.
  ///
  /// In en, this message translates to:
  /// **'(1 PM - 5 PM)'**
  String get supportAfternoonHours;

  /// No description provided for @supportEvening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get supportEvening;

  /// No description provided for @supportEveningHours.
  ///
  /// In en, this message translates to:
  /// **'(6 PM - 9 PM)'**
  String get supportEveningHours;

  /// No description provided for @supportAnytime.
  ///
  /// In en, this message translates to:
  /// **'Anytime'**
  String get supportAnytime;

  /// No description provided for @supportAnytimeHours.
  ///
  /// In en, this message translates to:
  /// **'(Flexible)'**
  String get supportAnytimeHours;

  /// No description provided for @supportAdditionalNote.
  ///
  /// In en, this message translates to:
  /// **'Additional note'**
  String get supportAdditionalNote;

  /// No description provided for @supportAdditionalNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Example: I need advice on a lithium storage battery...'**
  String get supportAdditionalNoteHint;

  /// No description provided for @supportSubmit.
  ///
  /// In en, this message translates to:
  /// **'Send request'**
  String get supportSubmit;

  /// No description provided for @engineerResponseNote.
  ///
  /// In en, this message translates to:
  /// **'A technical specialist will respond within 24 business hours.'**
  String get engineerResponseNote;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get month;

  /// No description provided for @serialCheck.
  ///
  /// In en, this message translates to:
  /// **'Serial check'**
  String get serialCheck;

  /// No description provided for @serialCheckShort.
  ///
  /// In en, this message translates to:
  /// **'Serial'**
  String get serialCheckShort;

  /// No description provided for @serialCheckTitle.
  ///
  /// In en, this message translates to:
  /// **'Serial check'**
  String get serialCheckTitle;

  /// No description provided for @verifyProduct.
  ///
  /// In en, this message translates to:
  /// **'Verify product'**
  String get verifyProduct;

  /// No description provided for @verifyProductSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check GoOffice product authenticity using the serial number.'**
  String get verifyProductSubtitle;

  /// No description provided for @productSerialNumber.
  ///
  /// In en, this message translates to:
  /// **'Product serial number'**
  String get productSerialNumber;

  /// No description provided for @checkNow.
  ///
  /// In en, this message translates to:
  /// **'Check now'**
  String get checkNow;

  /// No description provided for @whereIsSerial.
  ///
  /// In en, this message translates to:
  /// **'Where can I find the serial?'**
  String get whereIsSerial;

  /// No description provided for @serialOnBox.
  ///
  /// In en, this message translates to:
  /// **'Sticker on the product box'**
  String get serialOnBox;

  /// No description provided for @serialOnBoxDesc.
  ///
  /// In en, this message translates to:
  /// **'The serial is printed on the barcode label outside the box.'**
  String get serialOnBoxDesc;

  /// No description provided for @serialOnDevice.
  ///
  /// In en, this message translates to:
  /// **'Warranty sticker on the device'**
  String get serialOnDevice;

  /// No description provided for @serialOnDeviceDesc.
  ///
  /// In en, this message translates to:
  /// **'Usually located on the side or underside of the unit.'**
  String get serialOnDeviceDesc;

  /// No description provided for @serialInGuide.
  ///
  /// In en, this message translates to:
  /// **'User manual'**
  String get serialInGuide;

  /// No description provided for @serialInGuideDesc.
  ///
  /// In en, this message translates to:
  /// **'Often printed on the last page or the back cover of the manual.'**
  String get serialInGuideDesc;

  /// No description provided for @authenticProduct.
  ///
  /// In en, this message translates to:
  /// **'Authentic product'**
  String get authenticProduct;

  /// No description provided for @authenticProductDesc.
  ///
  /// In en, this message translates to:
  /// **'This item has been verified as a genuine GoOffice product.'**
  String get authenticProductDesc;

  /// No description provided for @authenticProductDetail.
  ///
  /// In en, this message translates to:
  /// **'500W AIKO A500 solar panel\nManufactured: 01/2025 • Warranty: 25 years\nDistributor: GoOffice HCM'**
  String get authenticProductDetail;

  /// No description provided for @serialNotFound.
  ///
  /// In en, this message translates to:
  /// **'Not found'**
  String get serialNotFound;

  /// No description provided for @serialNotFoundDesc.
  ///
  /// In en, this message translates to:
  /// **'This product code does not exist in the GoOffice system. Please recheck the serial or report it to the dealer if you suspect a counterfeit item.'**
  String get serialNotFoundDesc;

  /// No description provided for @customerLeadNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get customerLeadNew;

  /// No description provided for @customerLeadProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get customerLeadProcessing;

  /// No description provided for @customerLeadProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get customerLeadProgress;

  /// No description provided for @customerLeadHandle.
  ///
  /// In en, this message translates to:
  /// **'Process'**
  String get customerLeadHandle;

  /// No description provided for @customerLeadCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get customerLeadCompleted;

  /// No description provided for @projectTitleOne.
  ///
  /// In en, this message translates to:
  /// **'10kW Hybrid system - Mr. Minh\'s home'**
  String get projectTitleOne;

  /// No description provided for @projectTitleTwo.
  ///
  /// In en, this message translates to:
  /// **'10kW Hybrid system - Ms. Hoa\'s home'**
  String get projectTitleTwo;

  /// No description provided for @projectTitleThree.
  ///
  /// In en, this message translates to:
  /// **'10kW Hybrid system - Mr. Hai\'s home'**
  String get projectTitleThree;

  /// No description provided for @statusApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get statusApproved;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @statusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusRejected;

  /// No description provided for @projectDone.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get projectDone;

  /// No description provided for @resendImage.
  ///
  /// In en, this message translates to:
  /// **'Resend image'**
  String get resendImage;

  /// No description provided for @logoOrAvatar.
  ///
  /// In en, this message translates to:
  /// **'Logo / Avatar'**
  String get logoOrAvatar;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @profileIntroductionSample.
  ///
  /// In en, this message translates to:
  /// **'We are a senior installation team focused on solar projects across the region, with more than a decade of experience in renewable energy delivery. We take pride in accuracy, service quality and long-term customer satisfaction.'**
  String get profileIntroductionSample;

  /// No description provided for @notificationTitleCustomer.
  ///
  /// In en, this message translates to:
  /// **'New customer: Tran Thi Lan'**
  String get notificationTitleCustomer;

  /// No description provided for @notificationMessageCustomer.
  ///
  /// In en, this message translates to:
  /// **'The customer is interested in a 5kW Hybrid system in District 3, HCMC. Their monthly power bill is around 2-3 million VND. Please follow up soon.'**
  String get notificationMessageCustomer;

  /// No description provided for @notificationTitleLead.
  ///
  /// In en, this message translates to:
  /// **'New lead: Le Van Hoang'**
  String get notificationTitleLead;

  /// No description provided for @notificationMessageLead.
  ///
  /// In en, this message translates to:
  /// **'The customer requested advice for a 10kW Hybrid system with a monthly bill above 5 million VND in District 7.'**
  String get notificationMessageLead;

  /// No description provided for @notificationTitleProject.
  ///
  /// In en, this message translates to:
  /// **'Project approved'**
  String get notificationTitleProject;

  /// No description provided for @notificationMessageProject.
  ///
  /// In en, this message translates to:
  /// **'The project \"10kW Hybrid system - Mr. Minh\'s home\" has been approved by admin and added to revenue tracking.'**
  String get notificationMessageProject;

  /// No description provided for @notificationCustomerPromoTitle.
  ///
  /// In en, this message translates to:
  /// **'New Hybrid promotion'**
  String get notificationCustomerPromoTitle;

  /// No description provided for @notificationCustomerPromoMessage.
  ///
  /// In en, this message translates to:
  /// **'Get up to 15% off your system investment when registering this month.'**
  String get notificationCustomerPromoMessage;

  /// No description provided for @notificationCustomerSerialTitle.
  ///
  /// In en, this message translates to:
  /// **'Serial verified successfully'**
  String get notificationCustomerSerialTitle;

  /// No description provided for @notificationCustomerSerialMessage.
  ///
  /// In en, this message translates to:
  /// **'The device you checked has been confirmed as a genuine GoOffice product.'**
  String get notificationCustomerSerialMessage;

  /// No description provided for @notificationCustomerQuoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Quote request received'**
  String get notificationCustomerQuoteTitle;

  /// No description provided for @notificationCustomerQuoteMessage.
  ///
  /// In en, this message translates to:
  /// **'Our consulting team will contact you within 24 business hours.'**
  String get notificationCustomerQuoteMessage;

  /// No description provided for @notificationTimeThirtyMinutes.
  ///
  /// In en, this message translates to:
  /// **'30 minutes ago'**
  String get notificationTimeThirtyMinutes;

  /// No description provided for @notificationTimeTwoHours.
  ///
  /// In en, this message translates to:
  /// **'2 hours ago'**
  String get notificationTimeTwoHours;

  /// No description provided for @notificationTimeYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday • 11/03/2025'**
  String get notificationTimeYesterday;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @detail.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get detail;

  /// No description provided for @visit.
  ///
  /// In en, this message translates to:
  /// **'Visit'**
  String get visit;

  /// No description provided for @labelPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get labelPhone;

  /// No description provided for @labelLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get labelLocation;

  /// No description provided for @labelSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get labelSystem;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @datePickerClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get datePickerClear;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get logout;

  /// No description provided for @logoutConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out of the app?'**
  String get logoutConfirmMessage;

  /// No description provided for @logoutFailed.
  ///
  /// In en, this message translates to:
  /// **'Unable to sign out. Please try again.'**
  String get logoutFailed;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account? This action cannot be undone.'**
  String get deleteAccountConfirm;

  /// No description provided for @province.
  ///
  /// In en, this message translates to:
  /// **'Province'**
  String get province;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsEditPersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Edit personal information'**
  String get settingsEditPersonalInfo;

  /// No description provided for @settingsEditPersonalInfoDesc.
  ///
  /// In en, this message translates to:
  /// **'Full name, email and phone number'**
  String get settingsEditPersonalInfoDesc;

  /// No description provided for @settingsLanguageDesc.
  ///
  /// In en, this message translates to:
  /// **'Choose display language'**
  String get settingsLanguageDesc;

  /// No description provided for @settingsDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get settingsDarkMode;

  /// No description provided for @settingsDarkModeDesc.
  ///
  /// In en, this message translates to:
  /// **'Switch between light and dark appearance'**
  String get settingsDarkModeDesc;

  /// No description provided for @settingsAppVersion.
  ///
  /// In en, this message translates to:
  /// **'Software version'**
  String get settingsAppVersion;

  /// No description provided for @settingsAppVersionValue.
  ///
  /// In en, this message translates to:
  /// **'{appName} · {version}'**
  String settingsAppVersionValue(String appName, String version);

  /// No description provided for @editPersonalInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get editPersonalInfoTitle;

  /// No description provided for @changeAvatarTitle.
  ///
  /// In en, this message translates to:
  /// **'Change profile photo'**
  String get changeAvatarTitle;

  /// No description provided for @pickAvatarFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get pickAvatarFromGallery;

  /// No description provided for @takeAvatarPhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get takeAvatarPhoto;

  /// No description provided for @profileNothingToUpdate.
  ///
  /// In en, this message translates to:
  /// **'No information to update'**
  String get profileNothingToUpdate;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @staffMember.
  ///
  /// In en, this message translates to:
  /// **'Staff member'**
  String get staffMember;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @reload.
  ///
  /// In en, this message translates to:
  /// **'Reload'**
  String get reload;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @tasksTitle.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get tasksTitle;

  /// No description provided for @noTasksYet.
  ///
  /// In en, this message translates to:
  /// **'No tasks yet'**
  String get noTasksYet;

  /// No description provided for @tasksAssignedHint.
  ///
  /// In en, this message translates to:
  /// **'When you are assigned tasks, they will appear here.'**
  String get tasksAssignedHint;

  /// No description provided for @todoStatus.
  ///
  /// In en, this message translates to:
  /// **'To do'**
  String get todoStatus;

  /// No description provided for @inProgressStatus.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get inProgressStatus;

  /// No description provided for @reviewStatus.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get reviewStatus;

  /// No description provided for @doneShort.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get doneShort;

  /// No description provided for @contractsTitle.
  ///
  /// In en, this message translates to:
  /// **'Contracts'**
  String get contractsTitle;

  /// No description provided for @noContracts.
  ///
  /// In en, this message translates to:
  /// **'No contracts yet'**
  String get noContracts;

  /// No description provided for @noContractsHint.
  ///
  /// In en, this message translates to:
  /// **'No business contract data found in this section.'**
  String get noContractsHint;

  /// No description provided for @salesPipelineTitle.
  ///
  /// In en, this message translates to:
  /// **'Sales Pipeline'**
  String get salesPipelineTitle;

  /// No description provided for @dealsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Deals'**
  String dealsCount(int count);

  /// No description provided for @emptyStage.
  ///
  /// In en, this message translates to:
  /// **'This stage is empty'**
  String get emptyStage;

  /// No description provided for @noCustomersInStage.
  ///
  /// In en, this message translates to:
  /// **'No customers in \"{status}\" status.'**
  String noCustomersInStage(String status);

  /// No description provided for @stageLabel.
  ///
  /// In en, this message translates to:
  /// **'Stage'**
  String get stageLabel;

  /// No description provided for @deliverablesTitle.
  ///
  /// In en, this message translates to:
  /// **'Deliverables & Approval'**
  String get deliverablesTitle;

  /// No description provided for @noDeliverables.
  ///
  /// In en, this message translates to:
  /// **'No design deliverables yet'**
  String get noDeliverables;

  /// No description provided for @deliverablesHint.
  ///
  /// In en, this message translates to:
  /// **'Submitted demo/figma files will appear here.'**
  String get deliverablesHint;

  /// No description provided for @promotionStoreTitle.
  ///
  /// In en, this message translates to:
  /// **'Promotion Store'**
  String get promotionStoreTitle;

  /// No description provided for @noPromotions.
  ///
  /// In en, this message translates to:
  /// **'No promotions yet'**
  String get noPromotions;

  /// No description provided for @promotionsHint.
  ///
  /// In en, this message translates to:
  /// **'Promotion packages will appear here.'**
  String get promotionsHint;

  /// No description provided for @staffDirectoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Staff Directory'**
  String get staffDirectoryTitle;

  /// No description provided for @searchStaffHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name, email, role...'**
  String get searchStaffHint;

  /// No description provided for @staffDirectoryTabCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current staff'**
  String get staffDirectoryTabCurrent;

  /// No description provided for @staffDirectoryTabResigned.
  ///
  /// In en, this message translates to:
  /// **'Former staff'**
  String get staffDirectoryTabResigned;

  /// No description provided for @staffDirectoryResignedEmpty.
  ///
  /// In en, this message translates to:
  /// **'No resigned staff yet.'**
  String get staffDirectoryResignedEmpty;

  /// No description provided for @staffCount.
  ///
  /// In en, this message translates to:
  /// **'{count} staff'**
  String staffCount(int count);

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @tryDifferentKeyword.
  ///
  /// In en, this message translates to:
  /// **'Try searching with a different keyword.'**
  String get tryDifferentKeyword;

  /// No description provided for @customersTitle.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customersTitle;

  /// No description provided for @searchCustomersHint.
  ///
  /// In en, this message translates to:
  /// **'Search by company, contact, email, phone...'**
  String get searchCustomersHint;

  /// No description provided for @trySearchOrAddCustomer.
  ///
  /// In en, this message translates to:
  /// **'Try a different keyword or add a new customer.'**
  String get trySearchOrAddCustomer;

  /// No description provided for @ticketsTitle.
  ///
  /// In en, this message translates to:
  /// **'Tickets'**
  String get ticketsTitle;

  /// No description provided for @searchTicketsHint.
  ///
  /// In en, this message translates to:
  /// **'Search tickets...'**
  String get searchTicketsHint;

  /// No description provided for @noTickets.
  ///
  /// In en, this message translates to:
  /// **'No tickets'**
  String get noTickets;

  /// No description provided for @noTicketsHint.
  ///
  /// In en, this message translates to:
  /// **'When customers submit support requests, they will appear here.'**
  String get noTicketsHint;

  /// No description provided for @needSupport.
  ///
  /// In en, this message translates to:
  /// **'Need support?'**
  String get needSupport;

  /// No description provided for @supportHotline.
  ///
  /// In en, this message translates to:
  /// **'Hotline: 0888.888.888'**
  String get supportHotline;

  /// No description provided for @loggingOut.
  ///
  /// In en, this message translates to:
  /// **'Logging out...'**
  String get loggingOut;

  /// No description provided for @signupForCustomers.
  ///
  /// In en, this message translates to:
  /// **'For customers'**
  String get signupForCustomers;

  /// No description provided for @myServicesTitle.
  ///
  /// In en, this message translates to:
  /// **'My services'**
  String get myServicesTitle;

  /// No description provided for @noServices.
  ///
  /// In en, this message translates to:
  /// **'No services yet'**
  String get noServices;

  /// No description provided for @servicesListHint.
  ///
  /// In en, this message translates to:
  /// **'Your service list will appear here.'**
  String get servicesListHint;

  /// No description provided for @labelExpireDate.
  ///
  /// In en, this message translates to:
  /// **'Expires: {date}'**
  String labelExpireDate(String date);

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @expiringSoon.
  ///
  /// In en, this message translates to:
  /// **'Expiring'**
  String get expiringSoon;

  /// No description provided for @expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expired;

  /// No description provided for @invoicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get invoicesTitle;

  /// No description provided for @noInvoices.
  ///
  /// In en, this message translates to:
  /// **'No invoices yet'**
  String get noInvoices;

  /// No description provided for @invoicesListHint.
  ///
  /// In en, this message translates to:
  /// **'Your invoice list will appear here.'**
  String get invoicesListHint;

  /// No description provided for @paymentDue.
  ///
  /// In en, this message translates to:
  /// **'Due'**
  String get paymentDue;

  /// No description provided for @supportTitle.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get supportTitle;

  /// No description provided for @supportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage support requests'**
  String get supportSubtitle;

  /// No description provided for @createNewRequest.
  ///
  /// In en, this message translates to:
  /// **'Create new request'**
  String get createNewRequest;

  /// No description provided for @noSupportRequests.
  ///
  /// In en, this message translates to:
  /// **'No support requests yet'**
  String get noSupportRequests;

  /// No description provided for @noSupportRequestsHint.
  ///
  /// In en, this message translates to:
  /// **'Having an issue? Create a new support request and our team will respond quickly.'**
  String get noSupportRequestsHint;

  /// No description provided for @cannotLoadRequests.
  ///
  /// In en, this message translates to:
  /// **'Unable to load requests'**
  String get cannotLoadRequests;

  /// No description provided for @createTicketTitle.
  ///
  /// In en, this message translates to:
  /// **'Create new request'**
  String get createTicketTitle;

  /// No description provided for @titleRequired.
  ///
  /// In en, this message translates to:
  /// **'Title *'**
  String get titleRequired;

  /// No description provided for @titleHint.
  ///
  /// In en, this message translates to:
  /// **'Brief description of the issue...'**
  String get titleHint;

  /// No description provided for @descriptionRequired.
  ///
  /// In en, this message translates to:
  /// **'Detailed description *'**
  String get descriptionRequired;

  /// No description provided for @descriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the issue in detail, including steps to reproduce if applicable...'**
  String get descriptionHint;

  /// No description provided for @sendRequest.
  ///
  /// In en, this message translates to:
  /// **'Submit request'**
  String get sendRequest;

  /// No description provided for @sending.
  ///
  /// In en, this message translates to:
  /// **'Sending...'**
  String get sending;

  /// No description provided for @requestType.
  ///
  /// In en, this message translates to:
  /// **'Request type'**
  String get requestType;

  /// No description provided for @priorityLevel.
  ///
  /// In en, this message translates to:
  /// **'Priority'**
  String get priorityLevel;

  /// No description provided for @ticketTypeSupport.
  ///
  /// In en, this message translates to:
  /// **'🛠 Technical support'**
  String get ticketTypeSupport;

  /// No description provided for @ticketTypeTechnical.
  ///
  /// In en, this message translates to:
  /// **'💻 Technical issue'**
  String get ticketTypeTechnical;

  /// No description provided for @ticketTypeBilling.
  ///
  /// In en, this message translates to:
  /// **'💳 Billing'**
  String get ticketTypeBilling;

  /// No description provided for @ticketTypeSales.
  ///
  /// In en, this message translates to:
  /// **'📦 Sales'**
  String get ticketTypeSales;

  /// No description provided for @ticketTypeOther.
  ///
  /// In en, this message translates to:
  /// **'📝 Other'**
  String get ticketTypeOther;

  /// No description provided for @priorityLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get priorityLow;

  /// No description provided for @priorityMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get priorityMedium;

  /// No description provided for @priorityHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get priorityHigh;

  /// No description provided for @priorityUrgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get priorityUrgent;

  /// No description provided for @ticketDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Request details'**
  String get ticketDetailTitle;

  /// No description provided for @ticketChatSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Chat with support team'**
  String get ticketChatSubtitle;

  /// No description provided for @ticketStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get ticketStatusPending;

  /// No description provided for @ticketStatusOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get ticketStatusOpen;

  /// No description provided for @ticketStatusInProgress.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get ticketStatusInProgress;

  /// No description provided for @ticketStatusResolved.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get ticketStatusResolved;

  /// No description provided for @ticketStatusClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get ticketStatusClosed;

  /// No description provided for @noRepliesYet.
  ///
  /// In en, this message translates to:
  /// **'No replies yet'**
  String get noRepliesYet;

  /// No description provided for @sendMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Send a message to chat with the support team'**
  String get sendMessageHint;

  /// No description provided for @ticketClosedMessage.
  ///
  /// In en, this message translates to:
  /// **'This ticket is resolved/closed. You cannot send messages.'**
  String get ticketClosedMessage;

  /// No description provided for @messageInputHint.
  ///
  /// In en, this message translates to:
  /// **'Type a message...'**
  String get messageInputHint;

  /// No description provided for @helloUser.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}'**
  String helloUser(String name);

  /// No description provided for @manageYourServices.
  ///
  /// In en, this message translates to:
  /// **'Manage your services'**
  String get manageYourServices;

  /// No description provided for @helloName.
  ///
  /// In en, this message translates to:
  /// **'Hello {name}!'**
  String helloName(String name);

  /// No description provided for @activeServicesCount.
  ///
  /// In en, this message translates to:
  /// **'You have {count} active services'**
  String activeServicesCount(int count);

  /// No description provided for @servicesLabel.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get servicesLabel;

  /// No description provided for @expiringSoonLabel.
  ///
  /// In en, this message translates to:
  /// **'Expiring soon'**
  String get expiringSoonLabel;

  /// No description provided for @expiredLabel.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expiredLabel;

  /// No description provided for @suggestedServices.
  ///
  /// In en, this message translates to:
  /// **'Suggested services'**
  String get suggestedServices;

  /// No description provided for @upcomingInvoices.
  ///
  /// In en, this message translates to:
  /// **'Upcoming invoices'**
  String get upcomingInvoices;

  /// No description provided for @noPendingInvoices.
  ///
  /// In en, this message translates to:
  /// **'Great! You have no invoices to pay.'**
  String get noPendingInvoices;

  /// No description provided for @serviceInvoice.
  ///
  /// In en, this message translates to:
  /// **'Service invoice'**
  String get serviceInvoice;

  /// No description provided for @overdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get overdue;

  /// No description provided for @noRegisteredServices.
  ///
  /// In en, this message translates to:
  /// **'You have not registered any services yet.'**
  String get noRegisteredServices;

  /// No description provided for @expiryDate.
  ///
  /// In en, this message translates to:
  /// **'EXPIRY DATE'**
  String get expiryDate;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @renewNow.
  ///
  /// In en, this message translates to:
  /// **'Renew now'**
  String get renewNow;

  /// No description provided for @remindersAndNotifications.
  ///
  /// In en, this message translates to:
  /// **'Reminders & notifications'**
  String get remindersAndNotifications;

  /// No description provided for @newCount.
  ///
  /// In en, this message translates to:
  /// **'{count} New'**
  String newCount(int count);

  /// No description provided for @deadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline: {date}'**
  String deadline(String date);

  /// No description provided for @viewNow.
  ///
  /// In en, this message translates to:
  /// **'View now'**
  String get viewNow;

  /// No description provided for @todayOverview.
  ///
  /// In en, this message translates to:
  /// **'Today\'s overview'**
  String get todayOverview;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick actions'**
  String get quickActions;

  /// No description provided for @attendanceCheckIn.
  ///
  /// In en, this message translates to:
  /// **'Attendance (Check-in)'**
  String get attendanceCheckIn;

  /// No description provided for @attendanceCheckInDesc.
  ///
  /// In en, this message translates to:
  /// **'Record check-in and check-out times'**
  String get attendanceCheckInDesc;

  /// No description provided for @attendanceAdminDesc.
  ///
  /// In en, this message translates to:
  /// **'View and edit staff attendance'**
  String get attendanceAdminDesc;

  /// No description provided for @attendanceSettingsDesc.
  ///
  /// In en, this message translates to:
  /// **'Working hours, GPS and check-in points'**
  String get attendanceSettingsDesc;

  /// No description provided for @myTasks.
  ///
  /// In en, this message translates to:
  /// **'My tasks'**
  String get myTasks;

  /// No description provided for @myTasksDesc.
  ///
  /// In en, this message translates to:
  /// **'View and update task status'**
  String get myTasksDesc;

  /// No description provided for @salesPipelineDesc.
  ///
  /// In en, this message translates to:
  /// **'Track and close customer deals'**
  String get salesPipelineDesc;

  /// No description provided for @businessContracts.
  ///
  /// In en, this message translates to:
  /// **'Business contracts'**
  String get businessContracts;

  /// No description provided for @businessContractsDesc.
  ///
  /// In en, this message translates to:
  /// **'Manage signed contracts'**
  String get businessContractsDesc;

  /// No description provided for @deliverablesDesc.
  ///
  /// In en, this message translates to:
  /// **'Submit and review design demos'**
  String get deliverablesDesc;

  /// No description provided for @customerDirectory.
  ///
  /// In en, this message translates to:
  /// **'Customer directory'**
  String get customerDirectory;

  /// No description provided for @customerDirectoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Look up partner contact information'**
  String get customerDirectoryDesc;

  /// No description provided for @staffDirectoryDesc.
  ///
  /// In en, this message translates to:
  /// **'View colleagues and roles'**
  String get staffDirectoryDesc;

  /// No description provided for @staffDashboardValueSetTreeDesc.
  ///
  /// In en, this message translates to:
  /// **'Create and configure ValueSet trees'**
  String get staffDashboardValueSetTreeDesc;

  /// No description provided for @supportAndTickets.
  ///
  /// In en, this message translates to:
  /// **'Support & tickets'**
  String get supportAndTickets;

  /// No description provided for @supportAndTicketsDesc.
  ///
  /// In en, this message translates to:
  /// **'Handle customer support requests'**
  String get supportAndTicketsDesc;

  /// No description provided for @recentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent activity'**
  String get recentActivity;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello,'**
  String get hello;

  /// No description provided for @ticketsToHandle.
  ///
  /// In en, this message translates to:
  /// **'Tickets to handle'**
  String get ticketsToHandle;

  /// No description provided for @projectsJoined.
  ///
  /// In en, this message translates to:
  /// **'Projects joined'**
  String get projectsJoined;

  /// No description provided for @workReminders.
  ///
  /// In en, this message translates to:
  /// **'Work reminders'**
  String get workReminders;

  /// No description provided for @noRemindersToday.
  ///
  /// In en, this message translates to:
  /// **'No reminders for you today.'**
  String get noRemindersToday;

  /// No description provided for @dueDate.
  ///
  /// In en, this message translates to:
  /// **'Due: {date} ({channel})'**
  String dueDate(String date, String channel);

  /// No description provided for @needsAction.
  ///
  /// In en, this message translates to:
  /// **'Needs action'**
  String get needsAction;

  /// No description provided for @attendanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendanceTitle;

  /// No description provided for @attendanceSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Attendance settings'**
  String get attendanceSettingsTitle;

  /// No description provided for @configLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load configuration'**
  String get configLoadFailed;

  /// No description provided for @tryReloadPage.
  ///
  /// In en, this message translates to:
  /// **'Try reloading the page.'**
  String get tryReloadPage;

  /// No description provided for @workingHoursSection.
  ///
  /// In en, this message translates to:
  /// **'Working hours'**
  String get workingHoursSection;

  /// No description provided for @workingHoursSetup.
  ///
  /// In en, this message translates to:
  /// **'Set shifts and late threshold'**
  String get workingHoursSetup;

  /// No description provided for @shiftStart.
  ///
  /// In en, this message translates to:
  /// **'Shift start'**
  String get shiftStart;

  /// No description provided for @lunchBreak.
  ///
  /// In en, this message translates to:
  /// **'Lunch break'**
  String get lunchBreak;

  /// No description provided for @afternoonShiftStart.
  ///
  /// In en, this message translates to:
  /// **'Afternoon shift start'**
  String get afternoonShiftStart;

  /// No description provided for @shiftEnd.
  ///
  /// In en, this message translates to:
  /// **'Shift end'**
  String get shiftEnd;

  /// No description provided for @shiftTimeFormatInvalid.
  ///
  /// In en, this message translates to:
  /// **'{field} must be in HH:mm format'**
  String shiftTimeFormatInvalid(String field);

  /// No description provided for @shiftTimeMustBeGreaterThan.
  ///
  /// In en, this message translates to:
  /// **'{later} must be greater than {earlier}.'**
  String shiftTimeMustBeGreaterThan(String later, String earlier);

  /// No description provided for @lateThresholdMustBeNonNegative.
  ///
  /// In en, this message translates to:
  /// **'Late threshold must be a non-negative integer'**
  String get lateThresholdMustBeNonNegative;

  /// No description provided for @attendanceRadiusMustBePositive.
  ///
  /// In en, this message translates to:
  /// **'Attendance radius must be greater than 0'**
  String get attendanceRadiusMustBePositive;

  /// No description provided for @lateThresholdMinutes.
  ///
  /// In en, this message translates to:
  /// **'Late threshold (minutes)'**
  String get lateThresholdMinutes;

  /// No description provided for @officeCheckInPoint.
  ///
  /// In en, this message translates to:
  /// **'Office / check-in point'**
  String get officeCheckInPoint;

  /// No description provided for @attendanceWifiSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Office Wi-Fi'**
  String get attendanceWifiSectionTitle;

  /// No description provided for @attendanceWifiSectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Only allow attendance when connected to configured Wi-Fi (BSSID). Leave empty to skip Wi-Fi check.'**
  String get attendanceWifiSectionSubtitle;

  /// No description provided for @attendanceNoAllowedWifi.
  ///
  /// In en, this message translates to:
  /// **'No allowed Wi-Fi yet — attendance will not check Wi-Fi.'**
  String get attendanceNoAllowedWifi;

  /// No description provided for @attendanceAddCurrentWifi.
  ///
  /// In en, this message translates to:
  /// **'Add current Wi-Fi'**
  String get attendanceAddCurrentWifi;

  /// No description provided for @attendancePickWifiFromScan.
  ///
  /// In en, this message translates to:
  /// **'Pick from scan list'**
  String get attendancePickWifiFromScan;

  /// No description provided for @attendanceWifiBssidLabel.
  ///
  /// In en, this message translates to:
  /// **'BSSID'**
  String get attendanceWifiBssidLabel;

  /// No description provided for @attendanceWifiConnectRequired.
  ///
  /// In en, this message translates to:
  /// **'Please connect to office Wi-Fi to check in/out.'**
  String get attendanceWifiConnectRequired;

  /// No description provided for @attendanceWifiCurrentNotFound.
  ///
  /// In en, this message translates to:
  /// **'Cannot read current Wi-Fi. Enable GPS and grant location permission.'**
  String get attendanceWifiCurrentNotFound;

  /// No description provided for @attendanceWifiAlreadyAdded.
  ///
  /// In en, this message translates to:
  /// **'This Wi-Fi is already in the list.'**
  String get attendanceWifiAlreadyAdded;

  /// No description provided for @attendanceWifiAddedFromScan.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi added from scan list.'**
  String get attendanceWifiAddedFromScan;

  /// No description provided for @attendanceWifiAddedCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current Wi-Fi added.'**
  String get attendanceWifiAddedCurrent;

  /// No description provided for @gpsCheckInRadius.
  ///
  /// In en, this message translates to:
  /// **'GPS and valid radius for check-in/out'**
  String get gpsCheckInRadius;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @defaultRadiusMeters.
  ///
  /// In en, this message translates to:
  /// **'Default radius (m)'**
  String get defaultRadiusMeters;

  /// No description provided for @saveConfig.
  ///
  /// In en, this message translates to:
  /// **'Save configuration'**
  String get saveConfig;

  /// No description provided for @attendanceAdminTitle.
  ///
  /// In en, this message translates to:
  /// **'Attendance admin'**
  String get attendanceAdminTitle;

  /// No description provided for @morningShift.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get morningShift;

  /// No description provided for @afternoonShift.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get afternoonShift;

  /// No description provided for @noOfficeLocations.
  ///
  /// In en, this message translates to:
  /// **'No check-in points yet. Tap Add to configure.'**
  String get noOfficeLocations;

  /// No description provided for @radiusMeters.
  ///
  /// In en, this message translates to:
  /// **'Radius: {radius}m'**
  String radiusMeters(int radius);

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get noData;

  /// No description provided for @tryChangeMonthOrSearch.
  ///
  /// In en, this message translates to:
  /// **'Try changing month or search keyword.'**
  String get tryChangeMonthOrSearch;

  /// No description provided for @monthYearLabel.
  ///
  /// In en, this message translates to:
  /// **'Month {month}/{year}'**
  String monthYearLabel(String month, String year);

  /// No description provided for @attendanceColName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get attendanceColName;

  /// No description provided for @attendanceColWorkDays.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get attendanceColWorkDays;

  /// No description provided for @attendanceColHours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get attendanceColHours;

  /// No description provided for @attendanceColLate.
  ///
  /// In en, this message translates to:
  /// **'Late'**
  String get attendanceColLate;

  /// No description provided for @attendanceColEarly.
  ///
  /// In en, this message translates to:
  /// **'Early out'**
  String get attendanceColEarly;

  /// No description provided for @attendanceColLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get attendanceColLeave;

  /// No description provided for @attendanceColAbsent.
  ///
  /// In en, this message translates to:
  /// **'Absent'**
  String get attendanceColAbsent;

  /// No description provided for @attendanceColOT.
  ///
  /// In en, this message translates to:
  /// **'OT'**
  String get attendanceColOT;

  /// No description provided for @attendanceLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load attendance data'**
  String get attendanceLoadFailed;

  /// No description provided for @attendanceMockDataBanner.
  ///
  /// In en, this message translates to:
  /// **'Using mock data — disable AttendanceConfig.useMockData when the backend is ready.'**
  String get attendanceMockDataBanner;

  /// No description provided for @attendanceValidCheckInPoints.
  ///
  /// In en, this message translates to:
  /// **'{count} valid check-in points'**
  String attendanceValidCheckInPoints(int count);

  /// No description provided for @requestLeave.
  ///
  /// In en, this message translates to:
  /// **'Request leave'**
  String get requestLeave;

  /// No description provided for @checkInLabel.
  ///
  /// In en, this message translates to:
  /// **'Check-in'**
  String get checkInLabel;

  /// No description provided for @checkOutLabel.
  ///
  /// In en, this message translates to:
  /// **'Check-out'**
  String get checkOutLabel;

  /// No description provided for @attendanceLateWithDuration.
  ///
  /// In en, this message translates to:
  /// **'Late: {duration}'**
  String attendanceLateWithDuration(String duration);

  /// No description provided for @attendanceEarlyWithDuration.
  ///
  /// In en, this message translates to:
  /// **'Left early: {duration}'**
  String attendanceEarlyWithDuration(String duration);

  /// No description provided for @attendanceWorkingNow.
  ///
  /// In en, this message translates to:
  /// **'Working...'**
  String get attendanceWorkingNow;

  /// No description provided for @attendanceNotCheckedInToday.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t checked in today'**
  String get attendanceNotCheckedInToday;

  /// No description provided for @attendanceNoteOptionalHint.
  ///
  /// In en, this message translates to:
  /// **'Note (optional)...'**
  String get attendanceNoteOptionalHint;

  /// No description provided for @attendanceReasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get attendanceReasonLabel;

  /// No description provided for @attendanceReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Enter reason...'**
  String get attendanceReasonHint;

  /// No description provided for @attendanceReasonRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a reason'**
  String get attendanceReasonRequired;

  /// No description provided for @lateEarlyRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'Late / Early leave request'**
  String get lateEarlyRequestTitle;

  /// No description provided for @lateEarlyRequestLateTitle.
  ///
  /// In en, this message translates to:
  /// **'Late arrival request'**
  String get lateEarlyRequestLateTitle;

  /// No description provided for @lateEarlyRequestEarlyTitle.
  ///
  /// In en, this message translates to:
  /// **'Early leave request'**
  String get lateEarlyRequestEarlyTitle;

  /// No description provided for @lateEarlyRequestTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Request type'**
  String get lateEarlyRequestTypeLabel;

  /// No description provided for @lateEarlyRequestDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Request date'**
  String get lateEarlyRequestDateLabel;

  /// No description provided for @lateEarlyRequestSelectDate.
  ///
  /// In en, this message translates to:
  /// **'Select request date'**
  String get lateEarlyRequestSelectDate;

  /// No description provided for @lateEarlyTypeLate.
  ///
  /// In en, this message translates to:
  /// **'Late arrival'**
  String get lateEarlyTypeLate;

  /// No description provided for @lateEarlyTypeEarly.
  ///
  /// In en, this message translates to:
  /// **'Early leave'**
  String get lateEarlyTypeEarly;

  /// No description provided for @leaveTypeLateEarly.
  ///
  /// In en, this message translates to:
  /// **'Late / Early leave'**
  String get leaveTypeLateEarly;

  /// No description provided for @lateEarlyMinutesLabel.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get lateEarlyMinutesLabel;

  /// No description provided for @lateEarlyMinutesHint.
  ///
  /// In en, this message translates to:
  /// **'Max {maxMinutes} minutes'**
  String lateEarlyMinutesHint(int maxMinutes);

  /// No description provided for @lateEarlyReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Enter reason for late/early request...'**
  String get lateEarlyReasonHint;

  /// No description provided for @lateEarlyReasonRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a reason'**
  String get lateEarlyReasonRequired;

  /// No description provided for @lateEarlySubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get lateEarlySubmit;

  /// No description provided for @lateEarlySubmitSuccess.
  ///
  /// In en, this message translates to:
  /// **'Late/early request submitted. Waiting for approval.'**
  String get lateEarlySubmitSuccess;

  /// No description provided for @lateEarlyInvalidMinutes.
  ///
  /// In en, this message translates to:
  /// **'Invalid minutes.'**
  String get lateEarlyInvalidMinutes;

  /// No description provided for @lateEarlyLateNeedHalfDay.
  ///
  /// In en, this message translates to:
  /// **'Over 90 minutes. Please request a morning half-day leave instead.'**
  String get lateEarlyLateNeedHalfDay;

  /// No description provided for @lateEarlyEarlyMaxMinutes.
  ///
  /// In en, this message translates to:
  /// **'Early leave is limited to {maxMinutes} minutes.'**
  String lateEarlyEarlyMaxMinutes(int maxMinutes);

  /// No description provided for @lateEarlyMustBeforeMorning.
  ///
  /// In en, this message translates to:
  /// **'Submit late requests before morning start ({workStart}).'**
  String lateEarlyMustBeforeMorning(String workStart);

  /// No description provided for @lateEarlyMustBeforeAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Submit early-leave requests before afternoon start ({afternoonStart}).'**
  String lateEarlyMustBeforeAfternoon(String afternoonStart);

  /// No description provided for @lateEarlyRuleLateHint.
  ///
  /// In en, this message translates to:
  /// **'Submit before {workStart}. Max {maxMinutes} minutes (exactly {maxMinutes} is allowed and awaits approval). Over that → morning half-day leave.'**
  String lateEarlyRuleLateHint(String workStart, int maxMinutes);

  /// No description provided for @lateEarlyRuleLateFixedHint.
  ///
  /// In en, this message translates to:
  /// **'Late request defaults to {minutes} minutes. Submit before {workStart} for today; after {workStart} the request applies to the next day.'**
  String lateEarlyRuleLateFixedHint(String workStart, int minutes);

  /// No description provided for @lateEarlyFixedLateMinutes.
  ///
  /// In en, this message translates to:
  /// **'Late duration: {minutes} minutes (default)'**
  String lateEarlyFixedLateMinutes(int minutes);

  /// No description provided for @lateEarlyQuotaRemaining.
  ///
  /// In en, this message translates to:
  /// **'{count} quota remaining this month'**
  String lateEarlyQuotaRemaining(int count);

  /// No description provided for @lateEarlyNoQuota.
  ///
  /// In en, this message translates to:
  /// **'You have no late/early quota left this month. Cannot create a new request.'**
  String get lateEarlyNoQuota;

  /// No description provided for @lateEarlyNoLateQuota.
  ///
  /// In en, this message translates to:
  /// **'You have no late-arrival quota left this month. Cannot create a late request.'**
  String get lateEarlyNoLateQuota;

  /// No description provided for @lateEarlyNoEarlyQuota.
  ///
  /// In en, this message translates to:
  /// **'You have no early-leave quota left this month. Cannot create an early request.'**
  String get lateEarlyNoEarlyQuota;

  /// No description provided for @lateEarlyRuleEarlyHint.
  ///
  /// In en, this message translates to:
  /// **'Submit before {afternoonStart}. Max {maxMinutes} minutes.'**
  String lateEarlyRuleEarlyHint(String afternoonStart, int maxMinutes);

  /// No description provided for @lateEarlyGoToHalfDayLeave.
  ///
  /// In en, this message translates to:
  /// **'Request half-day leave'**
  String get lateEarlyGoToHalfDayLeave;

  /// No description provided for @lateEarlySwitchToForm.
  ///
  /// In en, this message translates to:
  /// **'Switching to late/early leave form...'**
  String get lateEarlySwitchToForm;

  /// No description provided for @lateEarlySwitchToLateForm.
  ///
  /// In en, this message translates to:
  /// **'Switching to late arrival form...'**
  String get lateEarlySwitchToLateForm;

  /// No description provided for @lateEarlySwitchToEarlyForm.
  ///
  /// In en, this message translates to:
  /// **'Switching to early leave form...'**
  String get lateEarlySwitchToEarlyForm;

  /// No description provided for @lateEarlyRequestDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Late / early leave details'**
  String get lateEarlyRequestDetailTitle;

  /// No description provided for @lateEarlyInvalidDetail.
  ///
  /// In en, this message translates to:
  /// **'Unable to load late/early leave details'**
  String get lateEarlyInvalidDetail;

  /// No description provided for @lateEarlyApprovalApproveTitle.
  ///
  /// In en, this message translates to:
  /// **'Approve late/early leave'**
  String get lateEarlyApprovalApproveTitle;

  /// No description provided for @lateEarlyApprovalApproveConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to approve this request?'**
  String get lateEarlyApprovalApproveConfirm;

  /// No description provided for @lateEarlyApprovalApprovedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Late/early leave approved'**
  String get lateEarlyApprovalApprovedSuccess;

  /// No description provided for @lateEarlyApprovalRejectTitle.
  ///
  /// In en, this message translates to:
  /// **'Reject late/early leave'**
  String get lateEarlyApprovalRejectTitle;

  /// No description provided for @lateEarlyApprovalRejectConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reject this request?'**
  String get lateEarlyApprovalRejectConfirm;

  /// No description provided for @lateEarlyApprovalRejectedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Late/early leave rejected'**
  String get lateEarlyApprovalRejectedSuccess;

  /// No description provided for @lateEarlyApprovalExpiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Approval deadline passed'**
  String get lateEarlyApprovalExpiredTitle;

  /// No description provided for @lateEarlyApprovalExpiredLate.
  ///
  /// In en, this message translates to:
  /// **'This late request is past the approval deadline (after {workStart} on the request date). Approve/reject is no longer available.'**
  String lateEarlyApprovalExpiredLate(String workStart);

  /// No description provided for @lateEarlyApprovalExpiredEarly.
  ///
  /// In en, this message translates to:
  /// **'This early-leave request is past the approval deadline (after {afternoonStart} on the request date). Approve/reject is no longer available.'**
  String lateEarlyApprovalExpiredEarly(String afternoonStart);

  /// No description provided for @lateEarlyHandleCancelDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel late/early leave request'**
  String get lateEarlyHandleCancelDetailTitle;

  /// No description provided for @lateEarlyHandleCancelApproveTitle.
  ///
  /// In en, this message translates to:
  /// **'Approve cancellation'**
  String get lateEarlyHandleCancelApproveTitle;

  /// No description provided for @lateEarlyHandleCancelApproveConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to approve this cancellation request?'**
  String get lateEarlyHandleCancelApproveConfirm;

  /// No description provided for @lateEarlyHandleCancelApprovedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Cancellation request approved'**
  String get lateEarlyHandleCancelApprovedSuccess;

  /// No description provided for @lateEarlyHandleCancelRejectTitle.
  ///
  /// In en, this message translates to:
  /// **'Reject cancellation'**
  String get lateEarlyHandleCancelRejectTitle;

  /// No description provided for @lateEarlyHandleCancelRejectConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reject this cancellation request?'**
  String get lateEarlyHandleCancelRejectConfirm;

  /// No description provided for @lateEarlyHandleCancelRejectedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Cancellation request rejected'**
  String get lateEarlyHandleCancelRejectedSuccess;

  /// No description provided for @lateEarlyRequestHistory.
  ///
  /// In en, this message translates to:
  /// **'Late / early leave requests'**
  String get lateEarlyRequestHistory;

  /// No description provided for @lateEarlyNoRequests.
  ///
  /// In en, this message translates to:
  /// **'No late/early leave requests yet'**
  String get lateEarlyNoRequests;

  /// No description provided for @lateEarlyNoRequestsHint.
  ///
  /// In en, this message translates to:
  /// **'Choose Late / Early leave when creating a leave request'**
  String get lateEarlyNoRequestsHint;

  /// No description provided for @lateEarlyCancelRequest.
  ///
  /// In en, this message translates to:
  /// **'Cancel request'**
  String get lateEarlyCancelRequest;

  /// No description provided for @lateEarlyCancelBlockedTitle.
  ///
  /// In en, this message translates to:
  /// **'Cannot cancel request'**
  String get lateEarlyCancelBlockedTitle;

  /// No description provided for @lateEarlyCancelBlockedAfterCheckout.
  ///
  /// In en, this message translates to:
  /// **'You have already checked out on the early-leave request date, so this request can no longer be cancelled.'**
  String get lateEarlyCancelBlockedAfterCheckout;

  /// No description provided for @lateEarlyCancelBlockedAfterCheckin.
  ///
  /// In en, this message translates to:
  /// **'You have already checked in on the late-arrival request date, so this request can no longer be cancelled.'**
  String get lateEarlyCancelBlockedAfterCheckin;

  /// No description provided for @lateEarlyCancelBlockedPastDate.
  ///
  /// In en, this message translates to:
  /// **'This request is for a past date and can no longer be cancelled.'**
  String get lateEarlyCancelBlockedPastDate;

  /// No description provided for @lateEarlyCancelConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this late/early leave request?'**
  String get lateEarlyCancelConfirm;

  /// No description provided for @lateEarlyCancelSuccess.
  ///
  /// In en, this message translates to:
  /// **'Late/early leave cancelled or cancellation requested'**
  String get lateEarlyCancelSuccess;

  /// No description provided for @lateEarlyCancelImmediateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Late/early leave cancelled'**
  String get lateEarlyCancelImmediateSuccess;

  /// No description provided for @lateEarlyRequestCancelAction.
  ///
  /// In en, this message translates to:
  /// **'Request cancellation'**
  String get lateEarlyRequestCancelAction;

  /// No description provided for @lateEarlyRequestCancelConfirm.
  ///
  /// In en, this message translates to:
  /// **'This request is already approved. Send a cancellation request for your manager to review?'**
  String get lateEarlyRequestCancelConfirm;

  /// No description provided for @lateEarlyRequestCancelSuccess.
  ///
  /// In en, this message translates to:
  /// **'Cancellation request sent, waiting for manager approval'**
  String get lateEarlyRequestCancelSuccess;

  /// No description provided for @lateEarlyRequestCancelHint.
  ///
  /// In en, this message translates to:
  /// **'Approved requests need manager approval to cancel.'**
  String get lateEarlyRequestCancelHint;

  /// No description provided for @lateEarlyCancelRequestSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancellation request'**
  String get lateEarlyCancelRequestSectionTitle;

  /// No description provided for @lateEarlyCancelRequestPendingHint.
  ///
  /// In en, this message translates to:
  /// **'You already requested cancellation. Waiting for manager approval.'**
  String get lateEarlyCancelRequestPendingHint;

  /// No description provided for @lateEarlyCancelRequestManagerHint.
  ///
  /// In en, this message translates to:
  /// **'The employee requested to cancel an approved request. Please approve or reject.'**
  String get lateEarlyCancelRequestManagerHint;

  /// No description provided for @lateEarlyHandleCancelApproveAction.
  ///
  /// In en, this message translates to:
  /// **'Approve cancel'**
  String get lateEarlyHandleCancelApproveAction;

  /// No description provided for @lateEarlyHandleCancelRejectAction.
  ///
  /// In en, this message translates to:
  /// **'Reject cancel'**
  String get lateEarlyHandleCancelRejectAction;

  /// No description provided for @lateEarlyMinutesValue.
  ///
  /// In en, this message translates to:
  /// **'{minutes} minutes'**
  String lateEarlyMinutesValue(int minutes);

  /// No description provided for @attendanceConfirmCheckIn.
  ///
  /// In en, this message translates to:
  /// **'Confirm check-in'**
  String get attendanceConfirmCheckIn;

  /// No description provided for @attendanceConfirmCheckOut.
  ///
  /// In en, this message translates to:
  /// **'Confirm check-out'**
  String get attendanceConfirmCheckOut;

  /// No description provided for @attendanceConfirmCheckInMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to check in?'**
  String get attendanceConfirmCheckInMessage;

  /// No description provided for @attendanceConfirmCheckOutMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to check out?'**
  String get attendanceConfirmCheckOutMessage;

  /// No description provided for @attendanceCheckInSuccess.
  ///
  /// In en, this message translates to:
  /// **'Check-in successful'**
  String get attendanceCheckInSuccess;

  /// No description provided for @attendanceCheckOutSuccess.
  ///
  /// In en, this message translates to:
  /// **'Check-out successful'**
  String get attendanceCheckOutSuccess;

  /// No description provided for @attendanceCheckInFailed.
  ///
  /// In en, this message translates to:
  /// **'Check-in failed'**
  String get attendanceCheckInFailed;

  /// No description provided for @attendanceCheckOutFailed.
  ///
  /// In en, this message translates to:
  /// **'Check-out failed'**
  String get attendanceCheckOutFailed;

  /// No description provided for @attendanceCheckInProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing check-in...'**
  String get attendanceCheckInProcessing;

  /// No description provided for @attendanceCheckOutProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing check-out...'**
  String get attendanceCheckOutProcessing;

  /// No description provided for @attendanceGpsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Unable to get GPS location. Please enable location services and try again.'**
  String get attendanceGpsUnavailable;

  /// No description provided for @noNetworkConnection.
  ///
  /// In en, this message translates to:
  /// **'No network connection'**
  String get noNetworkConnection;

  /// No description provided for @attendanceLoadSettingsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load attendance settings'**
  String get attendanceLoadSettingsFailed;

  /// No description provided for @attendanceSaveSettingsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save attendance settings'**
  String get attendanceSaveSettingsFailed;

  /// No description provided for @attendanceLoadRecordsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load attendance records'**
  String get attendanceLoadRecordsFailed;

  /// No description provided for @attendanceLoadLeaveBalanceFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load leave balance'**
  String get attendanceLoadLeaveBalanceFailed;

  /// No description provided for @attendanceLoadLeaveRequestsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load leave requests'**
  String get attendanceLoadLeaveRequestsFailed;

  /// No description provided for @attendanceSubmitLeaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit leave request'**
  String get attendanceSubmitLeaveFailed;

  /// No description provided for @attendanceInvalidLeaveData.
  ///
  /// In en, this message translates to:
  /// **'Invalid leave request data'**
  String get attendanceInvalidLeaveData;

  /// No description provided for @attendanceLoadPendingLeaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load pending leave requests'**
  String get attendanceLoadPendingLeaveFailed;

  /// No description provided for @attendanceApproveLeaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to approve leave request'**
  String get attendanceApproveLeaveFailed;

  /// No description provided for @attendanceRejectLeaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to reject leave request'**
  String get attendanceRejectLeaveFailed;

  /// No description provided for @attendanceLoadHolidaysFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load holidays'**
  String get attendanceLoadHolidaysFailed;

  /// No description provided for @attendanceInvalidHolidayData.
  ///
  /// In en, this message translates to:
  /// **'Invalid holiday data'**
  String get attendanceInvalidHolidayData;

  /// No description provided for @attendanceCreateHolidayFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create holiday'**
  String get attendanceCreateHolidayFailed;

  /// No description provided for @attendanceDeleteHolidayFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete holiday'**
  String get attendanceDeleteHolidayFailed;

  /// No description provided for @attendanceLoadAdminDataFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load attendance admin data'**
  String get attendanceLoadAdminDataFailed;

  /// No description provided for @attendanceUpdateRecordFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update attendance record'**
  String get attendanceUpdateRecordFailed;

  /// No description provided for @attendanceLoadRecordDetailFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load attendance record detail'**
  String get attendanceLoadRecordDetailFailed;

  /// No description provided for @attendanceNoSettingsData.
  ///
  /// In en, this message translates to:
  /// **'No attendance settings data'**
  String get attendanceNoSettingsData;

  /// No description provided for @attendanceNoLeaveBalanceData.
  ///
  /// In en, this message translates to:
  /// **'No leave balance data'**
  String get attendanceNoLeaveBalanceData;

  /// No description provided for @attendanceCreateLeaveRequestFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create leave request'**
  String get attendanceCreateLeaveRequestFailed;

  /// No description provided for @attendanceNoAttendanceData.
  ///
  /// In en, this message translates to:
  /// **'No attendance data'**
  String get attendanceNoAttendanceData;

  /// No description provided for @attendanceRecordNotFound.
  ///
  /// In en, this message translates to:
  /// **'Attendance record not found'**
  String get attendanceRecordNotFound;

  /// No description provided for @attendanceDefaultOfficeName.
  ///
  /// In en, this message translates to:
  /// **'Check-in point'**
  String get attendanceDefaultOfficeName;

  /// No description provided for @attendanceDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get attendanceDone;

  /// No description provided for @attendanceWorkDaysUnit.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get attendanceWorkDaysUnit;

  /// No description provided for @attendanceTotalWorkDays.
  ///
  /// In en, this message translates to:
  /// **'Total work days'**
  String get attendanceTotalWorkDays;

  /// No description provided for @attendanceOnTime.
  ///
  /// In en, this message translates to:
  /// **'On time'**
  String get attendanceOnTime;

  /// No description provided for @attendanceTimesUnit.
  ///
  /// In en, this message translates to:
  /// **'times'**
  String get attendanceTimesUnit;

  /// No description provided for @attendanceAbsentLabel.
  ///
  /// In en, this message translates to:
  /// **'Absent'**
  String get attendanceAbsentLabel;

  /// No description provided for @attendanceDaysUnit.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get attendanceDaysUnit;

  /// No description provided for @attendanceLeaveAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available: {balance}'**
  String attendanceLeaveAvailable(String balance);

  /// No description provided for @attendanceLeaveLabel.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get attendanceLeaveLabel;

  /// No description provided for @attendanceWorkHours.
  ///
  /// In en, this message translates to:
  /// **'Work hours'**
  String get attendanceWorkHours;

  /// No description provided for @attendanceMonthlyTable.
  ///
  /// In en, this message translates to:
  /// **'Monthly attendance table'**
  String get attendanceMonthlyTable;

  /// No description provided for @attendanceLeaveRequestHistory.
  ///
  /// In en, this message translates to:
  /// **'Leave request history'**
  String get attendanceLeaveRequestHistory;

  /// No description provided for @attendanceNoLeaveRequests.
  ///
  /// In en, this message translates to:
  /// **'No leave requests yet'**
  String get attendanceNoLeaveRequests;

  /// No description provided for @attendanceNoLeaveRequestsHint.
  ///
  /// In en, this message translates to:
  /// **'Tap \"Request leave\" to create a new request.'**
  String get attendanceNoLeaveRequestsHint;

  /// No description provided for @attendanceLeaveDaysCount.
  ///
  /// In en, this message translates to:
  /// **'{days} days · {type}'**
  String attendanceLeaveDaysCount(String days, String type);

  /// No description provided for @attendanceHalfDay.
  ///
  /// In en, this message translates to:
  /// **'Half day ({period})'**
  String attendanceHalfDay(String period);

  /// No description provided for @attendanceFullDay.
  ///
  /// In en, this message translates to:
  /// **'Full day'**
  String get attendanceFullDay;

  /// No description provided for @attendanceHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Attendance history'**
  String get attendanceHistoryTitle;

  /// No description provided for @tryChangeMonthOrFilter.
  ///
  /// In en, this message translates to:
  /// **'Try changing month or status filter.'**
  String get tryChangeMonthOrFilter;

  /// No description provided for @attendanceLateShort.
  ///
  /// In en, this message translates to:
  /// **'Late ({duration})'**
  String attendanceLateShort(String duration);

  /// No description provided for @attendanceLateLabel.
  ///
  /// In en, this message translates to:
  /// **'Late'**
  String get attendanceLateLabel;

  /// No description provided for @attendanceEarlyShort.
  ///
  /// In en, this message translates to:
  /// **'Early out ({duration})'**
  String attendanceEarlyShort(String duration);

  /// No description provided for @attendanceEarlyLabel.
  ///
  /// In en, this message translates to:
  /// **'Left early'**
  String get attendanceEarlyLabel;

  /// No description provided for @attendanceWorking.
  ///
  /// In en, this message translates to:
  /// **'Working'**
  String get attendanceWorking;

  /// No description provided for @attendanceForgotCheckout.
  ///
  /// In en, this message translates to:
  /// **'Forgot checkout'**
  String get attendanceForgotCheckout;

  /// No description provided for @attendanceHalfDayStatus.
  ///
  /// In en, this message translates to:
  /// **'Half day'**
  String get attendanceHalfDayStatus;

  /// No description provided for @attendanceCheckInNote.
  ///
  /// In en, this message translates to:
  /// **'Check-in note: {note}'**
  String attendanceCheckInNote(String note);

  /// No description provided for @attendanceCheckOutNote.
  ///
  /// In en, this message translates to:
  /// **'Check-out note: {note}'**
  String attendanceCheckOutNote(String note);

  /// No description provided for @unlimitedBandwidth.
  ///
  /// In en, this message translates to:
  /// **'Unlimited bandwidth'**
  String get unlimitedBandwidth;

  /// No description provided for @pendingPayment.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pendingPayment;

  /// No description provided for @serviceDomain.
  ///
  /// In en, this message translates to:
  /// **'Domain'**
  String get serviceDomain;

  /// No description provided for @serviceMobileApp.
  ///
  /// In en, this message translates to:
  /// **'Mobile app'**
  String get serviceMobileApp;

  /// No description provided for @serviceOperations.
  ///
  /// In en, this message translates to:
  /// **'Operations'**
  String get serviceOperations;

  /// No description provided for @tabOffers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get tabOffers;

  /// No description provided for @tabDesign.
  ///
  /// In en, this message translates to:
  /// **'Design'**
  String get tabDesign;

  /// No description provided for @tabPipeline.
  ///
  /// In en, this message translates to:
  /// **'Pipeline'**
  String get tabPipeline;

  /// No description provided for @roleAdmin.
  ///
  /// In en, this message translates to:
  /// **'Administrator'**
  String get roleAdmin;

  /// No description provided for @roleSales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get roleSales;

  /// No description provided for @roleCustomerService.
  ///
  /// In en, this message translates to:
  /// **'Customer service'**
  String get roleCustomerService;

  /// No description provided for @roleAccountant.
  ///
  /// In en, this message translates to:
  /// **'Accountant'**
  String get roleAccountant;

  /// No description provided for @roleDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get roleDeveloper;

  /// No description provided for @roleBusinessAnalyst.
  ///
  /// In en, this message translates to:
  /// **'Business Analyst'**
  String get roleBusinessAnalyst;

  /// No description provided for @roleTester.
  ///
  /// In en, this message translates to:
  /// **'Tester'**
  String get roleTester;

  /// No description provided for @roleQa.
  ///
  /// In en, this message translates to:
  /// **'QA'**
  String get roleQa;

  /// No description provided for @roleQc.
  ///
  /// In en, this message translates to:
  /// **'QC'**
  String get roleQc;

  /// No description provided for @roleUxUiDesigner.
  ///
  /// In en, this message translates to:
  /// **'UX/UI Designer'**
  String get roleUxUiDesigner;

  /// No description provided for @roleGraphicDesigner.
  ///
  /// In en, this message translates to:
  /// **'Graphic Designer'**
  String get roleGraphicDesigner;

  /// No description provided for @roleSeo.
  ///
  /// In en, this message translates to:
  /// **'SEO'**
  String get roleSeo;

  /// No description provided for @roleContent.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get roleContent;

  /// No description provided for @pipelineNewLead.
  ///
  /// In en, this message translates to:
  /// **'Lead'**
  String get pipelineNewLead;

  /// No description provided for @pipelineContacted.
  ///
  /// In en, this message translates to:
  /// **'Contacted'**
  String get pipelineContacted;

  /// No description provided for @pipelineProposalSent.
  ///
  /// In en, this message translates to:
  /// **'Proposal sent'**
  String get pipelineProposalSent;

  /// No description provided for @pipelineDealClosed.
  ///
  /// In en, this message translates to:
  /// **'Deal closed'**
  String get pipelineDealClosed;

  /// No description provided for @pipelineCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get pipelineCancelled;

  /// No description provided for @customerStatusProposalSent.
  ///
  /// In en, this message translates to:
  /// **'Proposal sent'**
  String get customerStatusProposalSent;

  /// No description provided for @customerStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get customerStatusActive;

  /// No description provided for @customerStatusInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get customerStatusInactive;

  /// No description provided for @taskDoneStatus.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get taskDoneStatus;

  /// No description provided for @taskStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get taskStart;

  /// No description provided for @taskSendReview.
  ///
  /// In en, this message translates to:
  /// **'Send for review'**
  String get taskSendReview;

  /// No description provided for @taskComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get taskComplete;

  /// No description provided for @contractDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get contractDraft;

  /// No description provided for @movePipelineStage.
  ///
  /// In en, this message translates to:
  /// **'Move stage: {name}'**
  String movePipelineStage(String name);

  /// No description provided for @figmaDesign.
  ///
  /// In en, this message translates to:
  /// **'Figma Design'**
  String get figmaDesign;

  /// No description provided for @viewSpecs.
  ///
  /// In en, this message translates to:
  /// **'View specs'**
  String get viewSpecs;

  /// No description provided for @viewFile.
  ///
  /// In en, this message translates to:
  /// **'View file'**
  String get viewFile;

  /// No description provided for @adminLabel.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get adminLabel;

  /// No description provided for @customerShortLabel.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customerShortLabel;

  /// No description provided for @addOffice.
  ///
  /// In en, this message translates to:
  /// **'Add office'**
  String get addOffice;

  /// No description provided for @editOffice.
  ///
  /// In en, this message translates to:
  /// **'Edit office'**
  String get editOffice;

  /// No description provided for @attendanceConfigSaved.
  ///
  /// In en, this message translates to:
  /// **'Attendance settings saved'**
  String get attendanceConfigSaved;

  /// No description provided for @attendanceSettingsNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'No attendance configuration yet. Set up the details below and tap Create configuration to save.'**
  String get attendanceSettingsNotConfigured;

  /// No description provided for @attendanceCreateConfig.
  ///
  /// In en, this message translates to:
  /// **'Create configuration'**
  String get attendanceCreateConfig;

  /// No description provided for @defaultOfficeName.
  ///
  /// In en, this message translates to:
  /// **'New office'**
  String get defaultOfficeName;

  /// No description provided for @officeNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Office name *'**
  String get officeNameRequired;

  /// No description provided for @officeNameValidation.
  ///
  /// In en, this message translates to:
  /// **'Enter office name'**
  String get officeNameValidation;

  /// No description provided for @searchAddress.
  ///
  /// In en, this message translates to:
  /// **'Search address'**
  String get searchAddress;

  /// No description provided for @searchAddressHint.
  ///
  /// In en, this message translates to:
  /// **'E.g. 123 Nguyen Hue, District 1'**
  String get searchAddressHint;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current location'**
  String get currentLocation;

  /// No description provided for @enableGpsForLocation.
  ///
  /// In en, this message translates to:
  /// **'Please enable GPS to get your current location'**
  String get enableGpsForLocation;

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission not granted'**
  String get locationPermissionDenied;

  /// No description provided for @cannotGetCurrentLocation.
  ///
  /// In en, this message translates to:
  /// **'Unable to get current location'**
  String get cannotGetCurrentLocation;

  /// No description provided for @latitudeLabel.
  ///
  /// In en, this message translates to:
  /// **'Latitude (lat)'**
  String get latitudeLabel;

  /// No description provided for @longitudeLabel.
  ///
  /// In en, this message translates to:
  /// **'Longitude (lng)'**
  String get longitudeLabel;

  /// No description provided for @invalidLatitude.
  ///
  /// In en, this message translates to:
  /// **'Invalid latitude'**
  String get invalidLatitude;

  /// No description provided for @invalidLongitude.
  ///
  /// In en, this message translates to:
  /// **'Invalid longitude'**
  String get invalidLongitude;

  /// No description provided for @radiusMetersLabel.
  ///
  /// In en, this message translates to:
  /// **'Radius (m)'**
  String get radiusMetersLabel;

  /// No description provided for @radiusMustBePositive.
  ///
  /// In en, this message translates to:
  /// **'Radius must be greater than 0'**
  String get radiusMustBePositive;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @updateProfileInfo.
  ///
  /// In en, this message translates to:
  /// **'Update profile'**
  String get updateProfileInfo;

  /// No description provided for @changeRole.
  ///
  /// In en, this message translates to:
  /// **'Change role'**
  String get changeRole;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @myProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get myProfileTitle;

  /// No description provided for @myHrDocumentsTitle.
  ///
  /// In en, this message translates to:
  /// **'My HR documents'**
  String get myHrDocumentsTitle;

  /// No description provided for @myHrDocumentsDesc.
  ///
  /// In en, this message translates to:
  /// **'View your HR documents and profile fields'**
  String get myHrDocumentsDesc;

  /// No description provided for @myHrDocumentsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No documents yet'**
  String get myHrDocumentsEmpty;

  /// No description provided for @myHrDocumentsEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Documents will appear here after HR updates your profile'**
  String get myHrDocumentsEmptyHint;

  /// No description provided for @myHrDocumentNoValue.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get myHrDocumentNoValue;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// No description provided for @position.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// No description provided for @joinDate.
  ///
  /// In en, this message translates to:
  /// **'Join date'**
  String get joinDate;

  /// No description provided for @updateProfileHint.
  ///
  /// In en, this message translates to:
  /// **'Edit your contact and work information.'**
  String get updateProfileHint;

  /// No description provided for @profileLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Unable to load profile for editing.'**
  String get profileLoadFailed;

  /// No description provided for @roleAdministration.
  ///
  /// In en, this message translates to:
  /// **'Role administration'**
  String get roleAdministration;

  /// No description provided for @adminRoleChangeHint.
  ///
  /// In en, this message translates to:
  /// **'Only admins can change staff roles.'**
  String get adminRoleChangeHint;

  /// No description provided for @newRole.
  ///
  /// In en, this message translates to:
  /// **'New role'**
  String get newRole;

  /// No description provided for @roleUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Role updated'**
  String get roleUpdatedSuccess;

  /// No description provided for @profileUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdatedSuccess;

  /// No description provided for @fullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name *'**
  String get fullNameRequired;

  /// No description provided for @fullNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Enter full name (at least 2 characters)'**
  String get fullNameMinLength;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email *'**
  String get emailRequired;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get enterEmail;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get invalidPhoneNumber;

  /// No description provided for @saveProfileInfo.
  ///
  /// In en, this message translates to:
  /// **'Save profile'**
  String get saveProfileInfo;

  /// No description provided for @ticketCategorySupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get ticketCategorySupport;

  /// No description provided for @ticketCategorySales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get ticketCategorySales;

  /// No description provided for @ticketCategoryTechnical.
  ///
  /// In en, this message translates to:
  /// **'Technical'**
  String get ticketCategoryTechnical;

  /// No description provided for @ticketCategoryBilling.
  ///
  /// In en, this message translates to:
  /// **'Billing'**
  String get ticketCategoryBilling;

  /// No description provided for @ticketCategoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get ticketCategoryOther;

  /// No description provided for @ticketFilterDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get ticketFilterDone;

  /// No description provided for @justNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} min ago'**
  String minutesAgo(int count);

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} hr ago'**
  String hoursAgo(int count);

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String daysAgo(int count);

  /// No description provided for @hideTicketInfo.
  ///
  /// In en, this message translates to:
  /// **'Hide ticket info'**
  String get hideTicketInfo;

  /// No description provided for @showTicketInfo.
  ///
  /// In en, this message translates to:
  /// **'View ticket info'**
  String get showTicketInfo;

  /// No description provided for @typeLabel.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get typeLabel;

  /// No description provided for @attendanceEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit attendance'**
  String get attendanceEditTitle;

  /// No description provided for @attendanceCreateTitle.
  ///
  /// In en, this message translates to:
  /// **'Create attendance'**
  String get attendanceCreateTitle;

  /// No description provided for @attendanceCreateDay.
  ///
  /// In en, this message translates to:
  /// **'Date {date}'**
  String attendanceCreateDay(String date);

  /// No description provided for @attendanceCreateSubmit.
  ///
  /// In en, this message translates to:
  /// **'Create attendance'**
  String get attendanceCreateSubmit;

  /// No description provided for @attendanceCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Attendance created'**
  String get attendanceCreatedSuccess;

  /// No description provided for @attendanceCreateRecordFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create attendance'**
  String get attendanceCreateRecordFailed;

  /// No description provided for @attendanceWorkerNotFound.
  ///
  /// In en, this message translates to:
  /// **'Employee profile not found'**
  String get attendanceWorkerNotFound;

  /// No description provided for @attendanceHalfDayPeriodLabel.
  ///
  /// In en, this message translates to:
  /// **'Half-day period'**
  String get attendanceHalfDayPeriodLabel;

  /// No description provided for @attendanceNoOfficeLocation.
  ///
  /// In en, this message translates to:
  /// **'No location'**
  String get attendanceNoOfficeLocation;

  /// No description provided for @attendanceNoOfficeLocationsHint.
  ///
  /// In en, this message translates to:
  /// **'No valid check-in locations in attendance settings.'**
  String get attendanceNoOfficeLocationsHint;

  /// No description provided for @attendanceStatusLateGrace.
  ///
  /// In en, this message translates to:
  /// **'Late (grace)'**
  String get attendanceStatusLateGrace;

  /// No description provided for @attendanceStatusLateApproved.
  ///
  /// In en, this message translates to:
  /// **'Late approved'**
  String get attendanceStatusLateApproved;

  /// No description provided for @attendanceStatusEarlyApproved.
  ///
  /// In en, this message translates to:
  /// **'Early approved'**
  String get attendanceStatusEarlyApproved;

  /// No description provided for @attendanceStatusPenalizedEarly.
  ///
  /// In en, this message translates to:
  /// **'Penalized early'**
  String get attendanceStatusPenalizedEarly;

  /// No description provided for @attendanceStatusMissingCheckout.
  ///
  /// In en, this message translates to:
  /// **'Missing checkout'**
  String get attendanceStatusMissingCheckout;

  /// No description provided for @attendanceStatusHoliday.
  ///
  /// In en, this message translates to:
  /// **'Holiday / Sunday'**
  String get attendanceStatusHoliday;

  /// No description provided for @attendanceStatusPresent.
  ///
  /// In en, this message translates to:
  /// **'On time'**
  String get attendanceStatusPresent;

  /// No description provided for @attendanceStatusLate.
  ///
  /// In en, this message translates to:
  /// **'Late (penalized)'**
  String get attendanceStatusLate;

  /// No description provided for @attendanceStatusHalfDay.
  ///
  /// In en, this message translates to:
  /// **'Half day'**
  String get attendanceStatusHalfDay;

  /// No description provided for @attendanceStatusLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get attendanceStatusLeave;

  /// No description provided for @attendanceStatusAbsent.
  ///
  /// In en, this message translates to:
  /// **'Absent'**
  String get attendanceStatusAbsent;

  /// No description provided for @attendanceStatusWorkDaysCredit.
  ///
  /// In en, this message translates to:
  /// **'Work days: {days}'**
  String attendanceStatusWorkDaysCredit(String days);

  /// No description provided for @attendanceStatusMeaningLabel.
  ///
  /// In en, this message translates to:
  /// **'Meaning'**
  String get attendanceStatusMeaningLabel;

  /// No description provided for @attendanceStatusPresentMeaning.
  ///
  /// In en, this message translates to:
  /// **'On-time check-in (≤ shift start), no early-leave penalty'**
  String get attendanceStatusPresentMeaning;

  /// No description provided for @attendanceStatusLateGraceMeaning.
  ///
  /// In en, this message translates to:
  /// **'Late within grace window with remaining lateQuota (uses 1 quota)'**
  String get attendanceStatusLateGraceMeaning;

  /// No description provided for @attendanceStatusLateApprovedMeaning.
  ///
  /// In en, this message translates to:
  /// **'Late with a pre-approved late request'**
  String get attendanceStatusLateApprovedMeaning;

  /// No description provided for @attendanceStatusLateMeaning.
  ///
  /// In en, this message translates to:
  /// **'Penalized late: no grace quota left, or late beyond grace but still worked the session'**
  String get attendanceStatusLateMeaning;

  /// No description provided for @attendanceStatusEarlyApprovedMeaning.
  ///
  /// In en, this message translates to:
  /// **'Mild early leave (< 30 min) with remaining earlyQuota — forgiven (uses 1 early quota)'**
  String get attendanceStatusEarlyApprovedMeaning;

  /// No description provided for @attendanceStatusPenalizedEarlyMeaning.
  ///
  /// In en, this message translates to:
  /// **'Penalized early leave: mild but no quota left, or heavy early leave (≥ 30 min)'**
  String get attendanceStatusPenalizedEarlyMeaning;

  /// No description provided for @attendanceStatusHalfDayMeaning.
  ///
  /// In en, this message translates to:
  /// **'Approved half-day leave (with morning/afternoon period)'**
  String get attendanceStatusHalfDayMeaning;

  /// No description provided for @attendanceStatusLeaveMeaning.
  ///
  /// In en, this message translates to:
  /// **'Approved full-day leave (counts as leave, not work days)'**
  String get attendanceStatusLeaveMeaning;

  /// No description provided for @attendanceStatusAbsentMeaning.
  ///
  /// In en, this message translates to:
  /// **'Absent: no check-in; afternoon-only check-in; dual violation; or too few hours (< 1h after lunch)'**
  String get attendanceStatusAbsentMeaning;

  /// No description provided for @attendanceStatusMissingCheckoutMeaning.
  ///
  /// In en, this message translates to:
  /// **'Checked in but forgot to check out'**
  String get attendanceStatusMissingCheckoutMeaning;

  /// No description provided for @attendanceStatusHolidayMeaning.
  ///
  /// In en, this message translates to:
  /// **'Holiday / Sunday (non-working day)'**
  String get attendanceStatusHolidayMeaning;

  /// No description provided for @attendanceTapForDetailOrCreate.
  ///
  /// In en, this message translates to:
  /// **'Tap a recorded day for details, or an absent day to create attendance'**
  String get attendanceTapForDetailOrCreate;

  /// No description provided for @attendanceEditDay.
  ///
  /// In en, this message translates to:
  /// **'Date {date}'**
  String attendanceEditDay(String date);

  /// No description provided for @attendanceEditStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get attendanceEditStatus;

  /// No description provided for @attendanceCheckInTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Check-in time (HH:mm)'**
  String get attendanceCheckInTimeLabel;

  /// No description provided for @attendanceCheckOutTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Check-out time (HH:mm)'**
  String get attendanceCheckOutTimeLabel;

  /// No description provided for @attendanceOvertimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Overtime (hours)'**
  String get attendanceOvertimeLabel;

  /// No description provided for @attendanceAdminNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Admin note'**
  String get attendanceAdminNoteLabel;

  /// No description provided for @attendanceSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get attendanceSaveChanges;

  /// No description provided for @attendanceUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Attendance updated'**
  String get attendanceUpdatedSuccess;

  /// No description provided for @attendanceDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Attendance details'**
  String get attendanceDetailTitle;

  /// No description provided for @attendanceDetailWorkDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'Work days'**
  String get attendanceDetailWorkDaysLabel;

  /// No description provided for @attendanceDetailLeaveLabel.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get attendanceDetailLeaveLabel;

  /// No description provided for @attendanceDetailNoLeave.
  ///
  /// In en, this message translates to:
  /// **'No leave request'**
  String get attendanceDetailNoLeave;

  /// No description provided for @attendanceDetailFullDayLeave.
  ///
  /// In en, this message translates to:
  /// **'Full-day leave'**
  String get attendanceDetailFullDayLeave;

  /// No description provided for @attendanceDetailHalfDayLeave.
  ///
  /// In en, this message translates to:
  /// **'Half-day leave ({period})'**
  String attendanceDetailHalfDayLeave(String period);

  /// No description provided for @attendanceDetailWorkDaysNone.
  ///
  /// In en, this message translates to:
  /// **'Not counted yet'**
  String get attendanceDetailWorkDaysNone;

  /// No description provided for @attendanceDetailLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Unable to load attendance details'**
  String get attendanceDetailLoadFailed;

  /// No description provided for @attendanceWorkDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Work date'**
  String get attendanceWorkDateLabel;

  /// No description provided for @attendanceCheckInLocation.
  ///
  /// In en, this message translates to:
  /// **'Check-in location'**
  String get attendanceCheckInLocation;

  /// No description provided for @attendanceCheckOutLocation.
  ///
  /// In en, this message translates to:
  /// **'Check-out location'**
  String get attendanceCheckOutLocation;

  /// No description provided for @attendanceSelectedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String attendanceSelectedCount(int count);

  /// No description provided for @attendanceSelectOneToEdit.
  ///
  /// In en, this message translates to:
  /// **'Select one record to edit'**
  String get attendanceSelectOneToEdit;

  /// No description provided for @attendanceLongPressToEdit.
  ///
  /// In en, this message translates to:
  /// **'Long press a day to edit'**
  String get attendanceLongPressToEdit;

  /// No description provided for @attendanceTapForDetail.
  ///
  /// In en, this message translates to:
  /// **'Tap a day cell to view details'**
  String get attendanceTapForDetail;

  /// No description provided for @attendanceLateReasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Late reason'**
  String get attendanceLateReasonLabel;

  /// No description provided for @attendanceEarlyReasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Early checkout reason'**
  String get attendanceEarlyReasonLabel;

  /// No description provided for @attendanceDayWorkHoursLabel.
  ///
  /// In en, this message translates to:
  /// **'Work hours'**
  String get attendanceDayWorkHoursLabel;

  /// No description provided for @leaveRequestSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave request'**
  String get leaveRequestSheetTitle;

  /// No description provided for @leaveRequestTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Leave type'**
  String get leaveRequestTypeLabel;

  /// No description provided for @leaveRequestTrialHint.
  ///
  /// In en, this message translates to:
  /// **'Probation/intern accounts are not eligible for paid leave.'**
  String get leaveRequestTrialHint;

  /// No description provided for @leaveRequestSelectDateError.
  ///
  /// In en, this message translates to:
  /// **'Please select leave dates'**
  String get leaveRequestSelectDateError;

  /// No description provided for @leaveRequestReasonMinError.
  ///
  /// In en, this message translates to:
  /// **'Reason must be at least 5 characters'**
  String get leaveRequestReasonMinError;

  /// No description provided for @leaveRequestDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'Deducted leave days: {days}'**
  String leaveRequestDaysLabel(String days);

  /// No description provided for @leaveRequestTotalDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'Total leave days (including holidays and Sundays): {days}'**
  String leaveRequestTotalDaysLabel(String days);

  /// No description provided for @leaveRequestPaidDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'Annual leave deducted: {days} day(s)'**
  String leaveRequestPaidDaysLabel(String days);

  /// No description provided for @leaveRequestUnpaidOverflowLabel.
  ///
  /// In en, this message translates to:
  /// **'Unpaid leave (over balance): {days} day(s)'**
  String leaveRequestUnpaidOverflowLabel(String days);

  /// No description provided for @leaveRequestReasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get leaveRequestReasonLabel;

  /// No description provided for @leaveRequestSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit request'**
  String get leaveRequestSubmit;

  /// No description provided for @leaveRequestFromDate.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get leaveRequestFromDate;

  /// No description provided for @leaveRequestToDate.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get leaveRequestToDate;

  /// No description provided for @leaveRequestDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get leaveRequestDateLabel;

  /// No description provided for @leaveRequestSessionLabel.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get leaveRequestSessionLabel;

  /// No description provided for @leaveRequestStartSessionLabel.
  ///
  /// In en, this message translates to:
  /// **'Start session'**
  String get leaveRequestStartSessionLabel;

  /// No description provided for @leaveRequestEndSessionLabel.
  ///
  /// In en, this message translates to:
  /// **'End session'**
  String get leaveRequestEndSessionLabel;

  /// No description provided for @leaveRequestMultiDayLabel.
  ///
  /// In en, this message translates to:
  /// **'Multi-day leave'**
  String get leaveRequestMultiDayLabel;

  /// No description provided for @leaveRequestSelectDate.
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get leaveRequestSelectDate;

  /// No description provided for @leaveRequestDateRangeLabel.
  ///
  /// In en, this message translates to:
  /// **'Leave period'**
  String get leaveRequestDateRangeLabel;

  /// No description provided for @leaveRequestRangePickerHint.
  ///
  /// In en, this message translates to:
  /// **'Select start and end date'**
  String get leaveRequestRangePickerHint;

  /// No description provided for @leaveTypeEmergencyLeave.
  ///
  /// In en, this message translates to:
  /// **'Emergency leave'**
  String get leaveTypeEmergencyLeave;

  /// No description provided for @leavePolicyAnnualNoticeHint.
  ///
  /// In en, this message translates to:
  /// **'Annual leave must be requested at least {days} day(s) in advance.'**
  String leavePolicyAnnualNoticeHint(String days);

  /// No description provided for @leavePolicyUnpaidNoticeHint.
  ///
  /// In en, this message translates to:
  /// **'Unpaid leave must be requested at least {days} day(s) in advance.'**
  String leavePolicyUnpaidNoticeHint(String days);

  /// No description provided for @leavePolicyEmergencyHint.
  ///
  /// In en, this message translates to:
  /// **'You may file retroactively up to {days} day(s) after the incident.'**
  String leavePolicyEmergencyHint(String days);

  /// No description provided for @leavePolicyHolidayBlockHint.
  ///
  /// In en, this message translates to:
  /// **'Leave is blocked {before} day(s) before and {after} day(s) after long holidays.'**
  String leavePolicyHolidayBlockHint(String before, String after);

  /// No description provided for @leavePolicyPaidBalanceEmpty.
  ///
  /// In en, this message translates to:
  /// **'Annual leave balance is empty. Please choose unpaid leave or another type.'**
  String get leavePolicyPaidBalanceEmpty;

  /// No description provided for @leavePolicySectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave request rules'**
  String get leavePolicySectionTitle;

  /// No description provided for @leavePolicySectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Notice periods, emergency leave, auto-split and holiday blocking'**
  String get leavePolicySectionSubtitle;

  /// No description provided for @annualLeaveNoticeDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'Annual leave notice (days)'**
  String get annualLeaveNoticeDaysLabel;

  /// No description provided for @unpaidLeaveNoticeDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'Unpaid leave notice (days)'**
  String get unpaidLeaveNoticeDaysLabel;

  /// No description provided for @emergencyLeaveExPostDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'Emergency leave retroactive limit (days)'**
  String get emergencyLeaveExPostDaysLabel;

  /// No description provided for @enableAutoSplitLeaveLabel.
  ///
  /// In en, this message translates to:
  /// **'Auto-split leave when over balance'**
  String get enableAutoSplitLeaveLabel;

  /// No description provided for @enableAutoSplitLeaveHint.
  ///
  /// In en, this message translates to:
  /// **'Excess days become unpaid leave requests'**
  String get enableAutoSplitLeaveHint;

  /// No description provided for @enableHolidayBlockLabel.
  ///
  /// In en, this message translates to:
  /// **'Block leave around long holidays'**
  String get enableHolidayBlockLabel;

  /// No description provided for @holidayBlockDaysBeforeLabel.
  ///
  /// In en, this message translates to:
  /// **'Blocked days before holiday'**
  String get holidayBlockDaysBeforeLabel;

  /// No description provided for @holidayBlockDaysAfterLabel.
  ///
  /// In en, this message translates to:
  /// **'Blocked days after holiday'**
  String get holidayBlockDaysAfterLabel;

  /// No description provided for @holidayAutoPaidLeaveLabel.
  ///
  /// In en, this message translates to:
  /// **'Auto-credit 1.0 holiday work day'**
  String get holidayAutoPaidLeaveLabel;

  /// No description provided for @holidayAutoPaidLeaveHint.
  ///
  /// In en, this message translates to:
  /// **'Eligible employees get paid holiday credit without checking in'**
  String get holidayAutoPaidLeaveHint;

  /// No description provided for @disableHolidayAttendanceAndRequestsLabel.
  ///
  /// In en, this message translates to:
  /// **'Lock attendance & requests on holidays'**
  String get disableHolidayAttendanceAndRequestsLabel;

  /// No description provided for @disableHolidayAttendanceAndRequestsHint.
  ///
  /// In en, this message translates to:
  /// **'Disable check-in/out and block leave / late / early requests on holidays'**
  String get disableHolidayAttendanceAndRequestsHint;

  /// No description provided for @attendanceHolidayLockedTitle.
  ///
  /// In en, this message translates to:
  /// **'Today is a holiday'**
  String get attendanceHolidayLockedTitle;

  /// No description provided for @attendanceHolidayLockedMessage.
  ///
  /// In en, this message translates to:
  /// **'Today is Holiday {name}. The company is closed, so attendance is unavailable.'**
  String attendanceHolidayLockedMessage(String name);

  /// No description provided for @lateEarlyHolidayBlockedMessage.
  ///
  /// In en, this message translates to:
  /// **'Today is Holiday {name}. The company is closed, so late/early leave requests are not available.'**
  String lateEarlyHolidayBlockedMessage(String name);

  /// No description provided for @leaveRequestHolidayBlockedMessage.
  ///
  /// In en, this message translates to:
  /// **'Cannot submit leave because the selected dates overlap holiday(s): {names}.'**
  String leaveRequestHolidayBlockedMessage(String names);

  /// No description provided for @leaveRequestMorning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get leaveRequestMorning;

  /// No description provided for @leaveRequestAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get leaveRequestAfternoon;

  /// No description provided for @leaveRequestSubmittedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Leave request submitted'**
  String get leaveRequestSubmittedSuccess;

  /// No description provided for @leaveRequestNoValidWorkingDayError.
  ///
  /// In en, this message translates to:
  /// **'The selected range has no valid working days after excluding Sundays and holidays. Please choose again.'**
  String get leaveRequestNoValidWorkingDayError;

  /// No description provided for @holidaySectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Holidays'**
  String get holidaySectionTitle;

  /// No description provided for @holidaySectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage custom public holidays'**
  String get holidaySectionSubtitle;

  /// No description provided for @holidayAdd.
  ///
  /// In en, this message translates to:
  /// **'Add holiday'**
  String get holidayAdd;

  /// No description provided for @holidaySessionLabel.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get holidaySessionLabel;

  /// No description provided for @holidayStartSessionLabel.
  ///
  /// In en, this message translates to:
  /// **'Start date session'**
  String get holidayStartSessionLabel;

  /// No description provided for @holidayEndSessionLabel.
  ///
  /// In en, this message translates to:
  /// **'End date session'**
  String get holidayEndSessionLabel;

  /// No description provided for @holidayNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Holiday name'**
  String get holidayNameLabel;

  /// No description provided for @holidayDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get holidayDateLabel;

  /// No description provided for @holidayDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get holidayDescriptionLabel;

  /// No description provided for @holidayNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a holiday name'**
  String get holidayNameRequired;

  /// No description provided for @holidayCreateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Holiday added'**
  String get holidayCreateSuccess;

  /// No description provided for @holidayDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Holiday deleted'**
  String get holidayDeleteSuccess;

  /// No description provided for @holidayNoData.
  ///
  /// In en, this message translates to:
  /// **'No custom holidays yet'**
  String get holidayNoData;

  /// No description provided for @holidayDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete holiday?'**
  String get holidayDeleteConfirm;

  /// No description provided for @holidayDeleteConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'This holiday will be removed from the system.'**
  String get holidayDeleteConfirmMessage;

  /// No description provided for @holidayAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'This holiday date already exists'**
  String get holidayAlreadyExists;

  /// No description provided for @holidayCount.
  ///
  /// In en, this message translates to:
  /// **'{count} holidays'**
  String holidayCount(int count);

  /// No description provided for @attendanceMockLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Fake location detected'**
  String get attendanceMockLocationTitle;

  /// No description provided for @attendanceMockLocationMessage.
  ///
  /// In en, this message translates to:
  /// **'A mock GPS location was detected. Please disable any fake location app and try again.'**
  String get attendanceMockLocationMessage;

  /// No description provided for @attendanceLocationPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Location permission required'**
  String get attendanceLocationPermissionTitle;

  /// No description provided for @attendanceLocationPermissionMessage.
  ///
  /// In en, this message translates to:
  /// **'This app needs location access to record attendance. Please enable permission in Settings.'**
  String get attendanceLocationPermissionMessage;

  /// No description provided for @attendanceOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get attendanceOpenSettings;

  /// No description provided for @attendanceDeviceRootedOrJailbroken.
  ///
  /// In en, this message translates to:
  /// **'Device is rooted or jailbroken. Attendance cannot be recorded on this device.'**
  String get attendanceDeviceRootedOrJailbroken;

  /// No description provided for @attendanceDeviceEmulatorOrSimulator.
  ///
  /// In en, this message translates to:
  /// **'Virtual device / emulator detected. Attendance cannot be recorded on this device. Please use a physical phone.'**
  String get attendanceDeviceEmulatorOrSimulator;

  /// No description provided for @datePickerInvalidDate.
  ///
  /// In en, this message translates to:
  /// **'The selected date is not allowed. Please choose another date.'**
  String get datePickerInvalidDate;

  /// No description provided for @successTitle.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get successTitle;

  /// No description provided for @promoCodeCopied.
  ///
  /// In en, this message translates to:
  /// **'Promo code copied: {code}'**
  String promoCodeCopied(String code);

  /// No description provided for @consultRegisterTitle.
  ///
  /// In en, this message translates to:
  /// **'Request consultation'**
  String get consultRegisterTitle;

  /// No description provided for @consultRegisterConfirmPackage.
  ///
  /// In en, this message translates to:
  /// **'Do you want to request consultation for the \"{name}\" package?'**
  String consultRegisterConfirmPackage(String name);

  /// No description provided for @consultRegisterConfirmService.
  ///
  /// In en, this message translates to:
  /// **'Do you want to request consultation for the \"{name}\" service?'**
  String consultRegisterConfirmService(String name);

  /// No description provided for @consultRequestSentTitle.
  ///
  /// In en, this message translates to:
  /// **'Sent successfully'**
  String get consultRequestSentTitle;

  /// No description provided for @consultRequestForwardedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your consultation request has been forwarded to customer support. We will contact you soon!'**
  String get consultRequestForwardedMessage;

  /// No description provided for @consultRequestSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your consultation request was sent successfully. Our support team will contact you shortly!'**
  String get consultRequestSuccessMessage;

  /// No description provided for @consultButton.
  ///
  /// In en, this message translates to:
  /// **'Consult'**
  String get consultButton;

  /// No description provided for @serviceDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Service details'**
  String get serviceDetailTitle;

  /// No description provided for @registrationDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Registration date'**
  String get registrationDateLabel;

  /// No description provided for @usageExpiryLabel.
  ///
  /// In en, this message translates to:
  /// **'Expiry'**
  String get usageExpiryLabel;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorTitle;

  /// No description provided for @pleaseCheckInfo.
  ///
  /// In en, this message translates to:
  /// **'Please check your information'**
  String get pleaseCheckInfo;

  /// No description provided for @successWithEmoji.
  ///
  /// In en, this message translates to:
  /// **'✅ Success'**
  String get successWithEmoji;

  /// No description provided for @ticketSentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your support request has been sent. Our team will respond as soon as possible!'**
  String get ticketSentSuccess;

  /// No description provided for @notLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'Not signed in'**
  String get notLoggedIn;

  /// No description provided for @pleaseEnterTitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get pleaseEnterTitle;

  /// No description provided for @titleAtLeastThreeChars.
  ///
  /// In en, this message translates to:
  /// **'Title must be at least 3 characters'**
  String get titleAtLeastThreeChars;

  /// No description provided for @pleaseDescribeIssue.
  ///
  /// In en, this message translates to:
  /// **'Please describe the issue'**
  String get pleaseDescribeIssue;

  /// No description provided for @descriptionAtLeastFiveChars.
  ///
  /// In en, this message translates to:
  /// **'Description must be at least 5 characters'**
  String get descriptionAtLeastFiveChars;

  /// No description provided for @welcomeUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}!'**
  String welcomeUser(String name);

  /// No description provided for @fillAllRequiredFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all required fields'**
  String get fillAllRequiredFields;

  /// No description provided for @fullNameAtLeastTwoChars.
  ///
  /// In en, this message translates to:
  /// **'Full name must be at least 2 characters'**
  String get fullNameAtLeastTwoChars;

  /// No description provided for @phoneLengthRange.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be 10 to 15 characters'**
  String get phoneLengthRange;

  /// No description provided for @passwordAtLeastSixChars.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordAtLeastSixChars;

  /// No description provided for @enterEmailAndPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter email and password'**
  String get enterEmailAndPassword;

  /// No description provided for @createWorkerTitle.
  ///
  /// In en, this message translates to:
  /// **'Create employee'**
  String get createWorkerTitle;

  /// No description provided for @editWorkerTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit employee'**
  String get editWorkerTitle;

  /// No description provided for @editWorkerSubmit.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get editWorkerSubmit;

  /// No description provided for @updateWorkerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Employee updated'**
  String get updateWorkerSuccess;

  /// No description provided for @editWorkerNoWorkerId.
  ///
  /// In en, this message translates to:
  /// **'Worker profile not found for this employee'**
  String get editWorkerNoWorkerId;

  /// No description provided for @editWorkerNoChanges.
  ///
  /// In en, this message translates to:
  /// **'No changes to save'**
  String get editWorkerNoChanges;

  /// No description provided for @editWorkerDeviceSection.
  ///
  /// In en, this message translates to:
  /// **'Linked device'**
  String get editWorkerDeviceSection;

  /// No description provided for @editWorkerDeviceDesc.
  ///
  /// In en, this message translates to:
  /// **'Remove the linked device so this employee can sign in on another device.'**
  String get editWorkerDeviceDesc;

  /// No description provided for @editWorkerDeleteDevice.
  ///
  /// In en, this message translates to:
  /// **'Remove device'**
  String get editWorkerDeleteDevice;

  /// No description provided for @editWorkerDeleteDeviceConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove linked device?'**
  String get editWorkerDeleteDeviceConfirmTitle;

  /// No description provided for @editWorkerDeleteDeviceConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'{name} will be able to sign in on a new device after removal.'**
  String editWorkerDeleteDeviceConfirmMessage(String name);

  /// No description provided for @deleteUserDeviceSuccess.
  ///
  /// In en, this message translates to:
  /// **'Employee device removed successfully'**
  String get deleteUserDeviceSuccess;

  /// No description provided for @createWorkerSubmit.
  ///
  /// In en, this message translates to:
  /// **'Create employee'**
  String get createWorkerSubmit;

  /// No description provided for @createWorkerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Employee created successfully'**
  String get createWorkerSuccess;

  /// No description provided for @createWorkerFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'John Doe'**
  String get createWorkerFullNameHint;

  /// No description provided for @createWorkerPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'At least 6 characters'**
  String get createWorkerPasswordHint;

  /// No description provided for @createWorkerPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'0987654321'**
  String get createWorkerPhoneHint;

  /// No description provided for @createWorkerRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Role node'**
  String get createWorkerRoleLabel;

  /// No description provided for @createWorkerRoleTreeLabel.
  ///
  /// In en, this message translates to:
  /// **'Role value set'**
  String get createWorkerRoleTreeLabel;

  /// No description provided for @createWorkerRoleNodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get createWorkerRoleNodeLabel;

  /// No description provided for @createWorkerRoleSection.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get createWorkerRoleSection;

  /// No description provided for @createWorkerDepartmentSection.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get createWorkerDepartmentSection;

  /// No description provided for @createWorkerDepartmentTreeLabel.
  ///
  /// In en, this message translates to:
  /// **'Department value set'**
  String get createWorkerDepartmentTreeLabel;

  /// No description provided for @createWorkerDepartmentNodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get createWorkerDepartmentNodeLabel;

  /// No description provided for @createWorkerRoleTreeRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a role value set'**
  String get createWorkerRoleTreeRequired;

  /// No description provided for @createWorkerNoDepartments.
  ///
  /// In en, this message translates to:
  /// **'Selected department tree has no nodes. Add nodes in Tree management.'**
  String get createWorkerNoDepartments;

  /// No description provided for @createWorkerLoadingDepartments.
  ///
  /// In en, this message translates to:
  /// **'Loading departments...'**
  String get createWorkerLoadingDepartments;

  /// No description provided for @createWorkerTreeLabel.
  ///
  /// In en, this message translates to:
  /// **'ValueSet tree'**
  String get createWorkerTreeLabel;

  /// No description provided for @createWorkerTreeRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a ValueSet tree'**
  String get createWorkerTreeRequired;

  /// No description provided for @createWorkerNoTrees.
  ///
  /// In en, this message translates to:
  /// **'No trees yet. Open Tree management to create a tree and add nodes first.'**
  String get createWorkerNoTrees;

  /// No description provided for @createWorkerNoRoles.
  ///
  /// In en, this message translates to:
  /// **'Selected tree has no nodes. Open Tree management to add nodes.'**
  String get createWorkerNoRoles;

  /// No description provided for @createWorkerLoadingRoles.
  ///
  /// In en, this message translates to:
  /// **'Loading nodes...'**
  String get createWorkerLoadingRoles;

  /// No description provided for @createWorkerNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name must be at least 2 characters'**
  String get createWorkerNameRequired;

  /// No description provided for @createWorkerEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get createWorkerEmailInvalid;

  /// No description provided for @createWorkerPasswordMin.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get createWorkerPasswordMin;

  /// No description provided for @createWorkerRoleRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a role'**
  String get createWorkerRoleRequired;

  /// No description provided for @valueSetTreeTitle.
  ///
  /// In en, this message translates to:
  /// **'Tree management'**
  String get valueSetTreeTitle;

  /// No description provided for @valueSetTreeListEmpty.
  ///
  /// In en, this message translates to:
  /// **'No trees yet'**
  String get valueSetTreeListEmpty;

  /// No description provided for @valueSetTreeListEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Create your first ValueSet tree with custom codes and structure.'**
  String get valueSetTreeListEmptyHint;

  /// No description provided for @valueSetTreeCreateFirst.
  ///
  /// In en, this message translates to:
  /// **'Create new tree'**
  String get valueSetTreeCreateFirst;

  /// No description provided for @valueSetTreeInitSuccess.
  ///
  /// In en, this message translates to:
  /// **'Tree created successfully'**
  String get valueSetTreeInitSuccess;

  /// No description provided for @valueSetTreeEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit tree'**
  String get valueSetTreeEdit;

  /// No description provided for @valueSetTreeUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Tree updated successfully'**
  String get valueSetTreeUpdateSuccess;

  /// No description provided for @valueSetTreeDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete tree'**
  String get valueSetTreeDelete;

  /// No description provided for @valueSetTreeDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete tree \"{name}\"? The struct and all related data will be removed.'**
  String valueSetTreeDeleteConfirm(String name);

  /// No description provided for @valueSetTreeDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Tree deleted successfully'**
  String get valueSetTreeDeleteSuccess;

  /// No description provided for @valueSetTreeEmpty.
  ///
  /// In en, this message translates to:
  /// **'No nodes yet'**
  String get valueSetTreeEmpty;

  /// No description provided for @valueSetTreeEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add the first node'**
  String get valueSetTreeEmptyHint;

  /// No description provided for @valueSetTreeInit.
  ///
  /// In en, this message translates to:
  /// **'Initialize tree'**
  String get valueSetTreeInit;

  /// No description provided for @valueSetTreeMissingOnServer.
  ///
  /// In en, this message translates to:
  /// **'Tree {setCode} was not found on the server. It may have been deleted or not created yet.'**
  String valueSetTreeMissingOnServer(String setCode);

  /// No description provided for @valueSetInitHint.
  ///
  /// In en, this message translates to:
  /// **'Enter custom Struct and ValueSet codes. After creation, add child nodes in the tree.'**
  String get valueSetInitHint;

  /// No description provided for @valueSetStructCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Struct code'**
  String get valueSetStructCodeLabel;

  /// No description provided for @valueSetStructCodeHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. ORG_STRUCT'**
  String get valueSetStructCodeHint;

  /// No description provided for @valueSetStructDescLabel.
  ///
  /// In en, this message translates to:
  /// **'Struct description'**
  String get valueSetStructDescLabel;

  /// No description provided for @valueSetStructDescHint.
  ///
  /// In en, this message translates to:
  /// **'Organization structure'**
  String get valueSetStructDescHint;

  /// No description provided for @valueSetCombineCharLabel.
  ///
  /// In en, this message translates to:
  /// **'Combine character'**
  String get valueSetCombineCharLabel;

  /// No description provided for @valueSetCombineCharInvalid.
  ///
  /// In en, this message translates to:
  /// **'Combine character must be a single character (e.g. .)'**
  String get valueSetCombineCharInvalid;

  /// No description provided for @valueSetSetCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'ValueSet code'**
  String get valueSetSetCodeLabel;

  /// No description provided for @valueSetSetCodeHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. MY_TREE'**
  String get valueSetSetCodeHint;

  /// No description provided for @valueSetSetDescLabel.
  ///
  /// In en, this message translates to:
  /// **'ValueSet description'**
  String get valueSetSetDescLabel;

  /// No description provided for @valueSetSetDescHint.
  ///
  /// In en, this message translates to:
  /// **'Department / role tree'**
  String get valueSetSetDescHint;

  /// No description provided for @valueSetStructCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter struct code'**
  String get valueSetStructCodeRequired;

  /// No description provided for @valueSetSetCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter ValueSet code'**
  String get valueSetSetCodeRequired;

  /// No description provided for @valueSetStructCodeDuplicate.
  ///
  /// In en, this message translates to:
  /// **'Struct code already exists. Please use another code'**
  String get valueSetStructCodeDuplicate;

  /// No description provided for @valueSetSetCodeDuplicate.
  ///
  /// In en, this message translates to:
  /// **'ValueSet code already exists. Please use another code'**
  String get valueSetSetCodeDuplicate;

  /// No description provided for @valueSetNodeCreate.
  ///
  /// In en, this message translates to:
  /// **'Add node'**
  String get valueSetNodeCreate;

  /// No description provided for @valueSetNodeCreateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Node added successfully'**
  String get valueSetNodeCreateSuccess;

  /// No description provided for @valueSetNodeEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit node'**
  String get valueSetNodeEdit;

  /// No description provided for @valueSetNodeUpdate.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get valueSetNodeUpdate;

  /// No description provided for @valueSetNodeUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Node updated successfully'**
  String get valueSetNodeUpdateSuccess;

  /// No description provided for @valueSetNodeCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Node code'**
  String get valueSetNodeCodeLabel;

  /// No description provided for @valueSetNodeDescLabel.
  ///
  /// In en, this message translates to:
  /// **'Display name'**
  String get valueSetNodeDescLabel;

  /// No description provided for @valueSetNodeDescHint.
  ///
  /// In en, this message translates to:
  /// **'Accountant / Sales department'**
  String get valueSetNodeDescHint;

  /// No description provided for @valueSetNodeParentLabel.
  ///
  /// In en, this message translates to:
  /// **'Parent node'**
  String get valueSetNodeParentLabel;

  /// No description provided for @valueSetNodeRoot.
  ///
  /// In en, this message translates to:
  /// **'Root (no parent)'**
  String get valueSetNodeRoot;

  /// No description provided for @valueSetNodeCodeRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter node code'**
  String get valueSetNodeCodeRequired;

  /// No description provided for @valueSetNodeDescRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter display name'**
  String get valueSetNodeDescRequired;

  /// No description provided for @valueSetNodeDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete node'**
  String get valueSetNodeDelete;

  /// No description provided for @valueSetNodeDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Node deleted successfully'**
  String get valueSetNodeDeleteSuccess;

  /// No description provided for @valueSetNodeDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"?'**
  String valueSetNodeDeleteConfirm(String name);

  /// No description provided for @valueSetNodeDeleteHasChildren.
  ///
  /// In en, this message translates to:
  /// **'Node \"{name}\" has child branches. Choose how to delete:'**
  String valueSetNodeDeleteHasChildren(String name);

  /// No description provided for @valueSetNodeDeleteModeDeleteAll.
  ///
  /// In en, this message translates to:
  /// **'Delete entire branch'**
  String get valueSetNodeDeleteModeDeleteAll;

  /// No description provided for @valueSetNodeDeleteModePromoteChildren.
  ///
  /// In en, this message translates to:
  /// **'Keep children, delete parent'**
  String get valueSetNodeDeleteModePromoteChildren;

  /// No description provided for @settingsValueSetTree.
  ///
  /// In en, this message translates to:
  /// **'Role & department trees'**
  String get settingsValueSetTree;

  /// No description provided for @settingsValueSetTreeDesc.
  ///
  /// In en, this message translates to:
  /// **'Create and manage custom ValueSet trees'**
  String get settingsValueSetTreeDesc;

  /// No description provided for @workflowTitle.
  ///
  /// In en, this message translates to:
  /// **'Approval workflows'**
  String get workflowTitle;

  /// No description provided for @workflowListEmpty.
  ///
  /// In en, this message translates to:
  /// **'No workflows yet'**
  String get workflowListEmpty;

  /// No description provided for @workflowListEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Create leave approval workflows and assign them to departments.'**
  String get workflowListEmptyHint;

  /// No description provided for @workflowCreate.
  ///
  /// In en, this message translates to:
  /// **'Create workflow'**
  String get workflowCreate;

  /// No description provided for @workflowCreateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Workflow created successfully'**
  String get workflowCreateSuccess;

  /// No description provided for @workflowCreateHint.
  ///
  /// In en, this message translates to:
  /// **'Set up approval steps in order. Department and position come from trees configured in Department / Role management (value_id).'**
  String get workflowCreateHint;

  /// No description provided for @workflowNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Workflow name'**
  String get workflowNameLabel;

  /// No description provided for @workflowNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Department leave approval'**
  String get workflowNameHint;

  /// No description provided for @workflowNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a workflow name'**
  String get workflowNameRequired;

  /// No description provided for @workflowDescLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get workflowDescLabel;

  /// No description provided for @workflowDescHint.
  ///
  /// In en, this message translates to:
  /// **'Short description of the workflow'**
  String get workflowDescHint;

  /// No description provided for @workflowStepsTitle.
  ///
  /// In en, this message translates to:
  /// **'Approval steps'**
  String get workflowStepsTitle;

  /// No description provided for @workflowAddStep.
  ///
  /// In en, this message translates to:
  /// **'Add step'**
  String get workflowAddStep;

  /// No description provided for @workflowStepLabel.
  ///
  /// In en, this message translates to:
  /// **'Step {order}'**
  String workflowStepLabel(int order);

  /// No description provided for @workflowStepRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Approver role'**
  String get workflowStepRoleLabel;

  /// No description provided for @workflowStepRoleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. manager, admin'**
  String get workflowStepRoleHint;

  /// No description provided for @workflowStepRoleRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a role for step {order}'**
  String workflowStepRoleRequired(int order);

  /// No description provided for @workflowStepManagerApproval.
  ///
  /// In en, this message translates to:
  /// **'Direct manager approval'**
  String get workflowStepManagerApproval;

  /// No description provided for @workflowStepPickDept.
  ///
  /// In en, this message translates to:
  /// **'Pick approver department (optional)'**
  String get workflowStepPickDept;

  /// No description provided for @workflowStepDeptSelected.
  ///
  /// In en, this message translates to:
  /// **'Department ID: {id}'**
  String workflowStepDeptSelected(int id);

  /// No description provided for @workflowStepDeptId.
  ///
  /// In en, this message translates to:
  /// **'Department ID: {id}'**
  String workflowStepDeptId(int id);

  /// No description provided for @workflowStepDepartmentLabel.
  ///
  /// In en, this message translates to:
  /// **'Approver department'**
  String get workflowStepDepartmentLabel;

  /// No description provided for @workflowStepPositionLabel.
  ///
  /// In en, this message translates to:
  /// **'Approver position / role'**
  String get workflowStepPositionLabel;

  /// No description provided for @workflowStepPositionId.
  ///
  /// In en, this message translates to:
  /// **'Position ID: {id}'**
  String workflowStepPositionId(int id);

  /// No description provided for @workflowStepDeptNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'Department tree not configured. Go to Department management → ⚙️ to select a tree.'**
  String get workflowStepDeptNotConfigured;

  /// No description provided for @workflowStepPositionNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'Role tree not configured. Go to Role management → ⚙️ to select a tree.'**
  String get workflowStepPositionNotConfigured;

  /// No description provided for @workflowStepDuplicateDeptRole.
  ///
  /// In en, this message translates to:
  /// **'Cannot create two approval steps with the same department and role. Please choose a different approval level or role.'**
  String get workflowStepDuplicateDeptRole;

  /// No description provided for @workflowCreateBindingRequired.
  ///
  /// In en, this message translates to:
  /// **'Configure department and role trees before creating a workflow (Department / Role management screens).'**
  String get workflowCreateBindingRequired;

  /// No description provided for @workflowNoPositions.
  ///
  /// In en, this message translates to:
  /// **'No positions/roles in the selected tree.'**
  String get workflowNoPositions;

  /// No description provided for @workflowAssignDeptTreeCode.
  ///
  /// In en, this message translates to:
  /// **'Department tree: {code}'**
  String workflowAssignDeptTreeCode(String code);

  /// No description provided for @workflowDeptTreeLabel.
  ///
  /// In en, this message translates to:
  /// **'ValueSet tree'**
  String get workflowDeptTreeLabel;

  /// No description provided for @workflowDeptNodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get workflowDeptNodeLabel;

  /// No description provided for @workflowNoValueSetTrees.
  ///
  /// In en, this message translates to:
  /// **'No ValueSet trees yet. Please create a tree first.'**
  String get workflowNoValueSetTrees;

  /// No description provided for @workflowNoDepartments.
  ///
  /// In en, this message translates to:
  /// **'No departments in this tree.'**
  String get workflowNoDepartments;

  /// No description provided for @workflowAssignDepartments.
  ///
  /// In en, this message translates to:
  /// **'Assign departments'**
  String get workflowAssignDepartments;

  /// No description provided for @workflowAssignDeptHint.
  ///
  /// In en, this message translates to:
  /// **'Select a ValueSet tree, then pick departments to assign this workflow. Department ID is the value_id in the system.'**
  String get workflowAssignDeptHint;

  /// No description provided for @workflowAssignDeptRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one department'**
  String get workflowAssignDeptRequired;

  /// No description provided for @workflowAssignSuccess.
  ///
  /// In en, this message translates to:
  /// **'Workflow assigned to departments'**
  String get workflowAssignSuccess;

  /// No description provided for @workflowSelectDepartments.
  ///
  /// In en, this message translates to:
  /// **'Select departments'**
  String get workflowSelectDepartments;

  /// No description provided for @workflowStepCount.
  ///
  /// In en, this message translates to:
  /// **'{count} approval steps'**
  String workflowStepCount(int count);

  /// No description provided for @workflowDeptCount.
  ///
  /// In en, this message translates to:
  /// **'{count} departments assigned'**
  String workflowDeptCount(int count);

  /// No description provided for @workflowAssignedDepartments.
  ///
  /// In en, this message translates to:
  /// **'Assigned departments'**
  String get workflowAssignedDepartments;

  /// No description provided for @workflowNoAssignedDepartments.
  ///
  /// In en, this message translates to:
  /// **'No departments assigned yet'**
  String get workflowNoAssignedDepartments;

  /// No description provided for @workflowNoSteps.
  ///
  /// In en, this message translates to:
  /// **'No approval steps'**
  String get workflowNoSteps;

  /// No description provided for @workflowDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete workflow'**
  String get workflowDelete;

  /// No description provided for @workflowDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete workflow \"{name}\"?'**
  String workflowDeleteConfirm(String name);

  /// No description provided for @workflowDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Workflow deleted'**
  String get workflowDeleteSuccess;

  /// No description provided for @staffDashboardWorkflowsDesc.
  ///
  /// In en, this message translates to:
  /// **'Create approval workflows and assign to departments'**
  String get staffDashboardWorkflowsDesc;

  /// No description provided for @departmentManagementTitle.
  ///
  /// In en, this message translates to:
  /// **'Department management'**
  String get departmentManagementTitle;

  /// No description provided for @departmentHeadLabel.
  ///
  /// In en, this message translates to:
  /// **'Department head'**
  String get departmentHeadLabel;

  /// No description provided for @departmentHeadNone.
  ///
  /// In en, this message translates to:
  /// **'No department head'**
  String get departmentHeadNone;

  /// No description provided for @roleManagementTitle.
  ///
  /// In en, this message translates to:
  /// **'Role management'**
  String get roleManagementTitle;

  /// No description provided for @staffDashboardDepartmentTreeDesc.
  ///
  /// In en, this message translates to:
  /// **'Department hierarchy from ValueSet tree'**
  String get staffDashboardDepartmentTreeDesc;

  /// No description provided for @staffDashboardRoleTreeDesc.
  ///
  /// In en, this message translates to:
  /// **'Role hierarchy from ValueSet tree'**
  String get staffDashboardRoleTreeDesc;

  /// No description provided for @valueSetBindingSettings.
  ///
  /// In en, this message translates to:
  /// **'Select ValueSet tree'**
  String get valueSetBindingSettings;

  /// No description provided for @valueSetBindingChange.
  ///
  /// In en, this message translates to:
  /// **'Change tree'**
  String get valueSetBindingChange;

  /// No description provided for @valueSetBindingSaved.
  ///
  /// In en, this message translates to:
  /// **'ValueSet tree selected'**
  String get valueSetBindingSaved;

  /// No description provided for @valueSetBoundGoCreateTree.
  ///
  /// In en, this message translates to:
  /// **'Create a new tree in Tree management'**
  String get valueSetBoundGoCreateTree;

  /// No description provided for @departmentBindingSettings.
  ///
  /// In en, this message translates to:
  /// **'Department tree settings'**
  String get departmentBindingSettings;

  /// No description provided for @roleBindingSettings.
  ///
  /// In en, this message translates to:
  /// **'Role tree settings'**
  String get roleBindingSettings;

  /// No description provided for @departmentSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'No department tree selected'**
  String get departmentSetupTitle;

  /// No description provided for @departmentSetupHint.
  ///
  /// In en, this message translates to:
  /// **'Tap ⚙️ to choose the ValueSet tree for departments. Create new trees in Tree management.'**
  String get departmentSetupHint;

  /// No description provided for @roleSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'No role tree selected'**
  String get roleSetupTitle;

  /// No description provided for @roleSetupHint.
  ///
  /// In en, this message translates to:
  /// **'Tap ⚙️ to choose the ValueSet tree for roles. Create new trees in Tree management.'**
  String get roleSetupHint;

  /// No description provided for @departmentTreeEmpty.
  ///
  /// In en, this message translates to:
  /// **'No departments yet'**
  String get departmentTreeEmpty;

  /// No description provided for @departmentTreeEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add the first department'**
  String get departmentTreeEmptyHint;

  /// No description provided for @roleTreeEmpty.
  ///
  /// In en, this message translates to:
  /// **'No roles yet'**
  String get roleTreeEmpty;

  /// No description provided for @roleTreeEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add the first role'**
  String get roleTreeEmptyHint;

  /// No description provided for @departmentAdd.
  ///
  /// In en, this message translates to:
  /// **'Add department'**
  String get departmentAdd;

  /// No description provided for @myManagedDepartmentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Departments I manage'**
  String get myManagedDepartmentsTitle;

  /// No description provided for @myManagedDepartmentsDesc.
  ///
  /// In en, this message translates to:
  /// **'View department staff and pending leave approvals'**
  String get myManagedDepartmentsDesc;

  /// No description provided for @myManagedDepartmentsListTitle.
  ///
  /// In en, this message translates to:
  /// **'Managed departments'**
  String get myManagedDepartmentsListTitle;

  /// No description provided for @myManagedDepartmentsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'You do not manage any departments'**
  String get myManagedDepartmentsEmptyTitle;

  /// No description provided for @myManagedDepartmentsEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'This section will show data when you are assigned to a department\'s handledBy.'**
  String get myManagedDepartmentsEmptyHint;

  /// No description provided for @myManagedDepartmentsViewStaff.
  ///
  /// In en, this message translates to:
  /// **'View all staff'**
  String get myManagedDepartmentsViewStaff;

  /// No description provided for @myManagedDepartmentsNodeActions.
  ///
  /// In en, this message translates to:
  /// **'Department actions'**
  String get myManagedDepartmentsNodeActions;

  /// No description provided for @pendingLeaveApprovalTitle.
  ///
  /// In en, this message translates to:
  /// **'Pending leave approvals'**
  String get pendingLeaveApprovalTitle;

  /// No description provided for @pendingLeaveApprovalEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No pending leave requests'**
  String get pendingLeaveApprovalEmptyTitle;

  /// No description provided for @pendingLeaveApprovalEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'There are currently no leave requests waiting for your action.'**
  String get pendingLeaveApprovalEmptyHint;

  /// No description provided for @departmentWorkersTitle.
  ///
  /// In en, this message translates to:
  /// **'Department staff'**
  String get departmentWorkersTitle;

  /// No description provided for @departmentWorkersEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No staff in this department'**
  String get departmentWorkersEmptyTitle;

  /// No description provided for @departmentWorkersEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'No employees are currently assigned to this department.'**
  String get departmentWorkersEmptyHint;

  /// No description provided for @leaveApprovalApproveTitle.
  ///
  /// In en, this message translates to:
  /// **'Approve leave request'**
  String get leaveApprovalApproveTitle;

  /// No description provided for @leaveApprovalApproveConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to approve this leave request?'**
  String get leaveApprovalApproveConfirm;

  /// No description provided for @leaveApprovalApprovedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Leave request approved'**
  String get leaveApprovalApprovedSuccess;

  /// No description provided for @leaveApprovalRejectTitle.
  ///
  /// In en, this message translates to:
  /// **'Reject leave request'**
  String get leaveApprovalRejectTitle;

  /// No description provided for @leaveApprovalRejectConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reject this leave request?'**
  String get leaveApprovalRejectConfirm;

  /// No description provided for @leaveApprovalRejectedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Leave request rejected'**
  String get leaveApprovalRejectedSuccess;

  /// No description provided for @leaveHandleCancelDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave cancellation request'**
  String get leaveHandleCancelDetailTitle;

  /// No description provided for @leaveHandleCancelHeader.
  ///
  /// In en, this message translates to:
  /// **'Cancel · {name}'**
  String leaveHandleCancelHeader(String name);

  /// No description provided for @leaveHandleCancelApproveTitle.
  ///
  /// In en, this message translates to:
  /// **'Approve leave cancellation'**
  String get leaveHandleCancelApproveTitle;

  /// No description provided for @leaveHandleCancelApproveConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to approve this leave cancellation request?'**
  String get leaveHandleCancelApproveConfirm;

  /// No description provided for @leaveHandleCancelApprovedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Leave cancellation approved'**
  String get leaveHandleCancelApprovedSuccess;

  /// No description provided for @leaveHandleCancelRejectTitle.
  ///
  /// In en, this message translates to:
  /// **'Reject leave cancellation'**
  String get leaveHandleCancelRejectTitle;

  /// No description provided for @leaveHandleCancelRejectConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reject this leave cancellation request?'**
  String get leaveHandleCancelRejectConfirm;

  /// No description provided for @leaveHandleCancelRejectedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Leave cancellation rejected'**
  String get leaveHandleCancelRejectedSuccess;

  /// No description provided for @leaveCancelPendingStatus.
  ///
  /// In en, this message translates to:
  /// **'Cancel pending'**
  String get leaveCancelPendingStatus;

  /// No description provided for @leaveCancelRequestedStatus.
  ///
  /// In en, this message translates to:
  /// **'Cancellation requested'**
  String get leaveCancelRequestedStatus;

  /// No description provided for @leaveCancelledStatus.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get leaveCancelledStatus;

  /// No description provided for @leaveApprovalProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Approval progress'**
  String get leaveApprovalProgressTitle;

  /// No description provided for @leaveCancelApprovalProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancellation approval progress'**
  String get leaveCancelApprovalProgressTitle;

  /// No description provided for @leaveApprovalWaitingYourDecision.
  ///
  /// In en, this message translates to:
  /// **'Waiting for YOUR decision'**
  String get leaveApprovalWaitingYourDecision;

  /// No description provided for @leaveApprovalStatusApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get leaveApprovalStatusApproved;

  /// No description provided for @leaveApprovalStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending approval'**
  String get leaveApprovalStatusPending;

  /// No description provided for @leaveApprovalStatusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get leaveApprovalStatusRejected;

  /// No description provided for @leaveApprovalStatusSkipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped'**
  String get leaveApprovalStatusSkipped;

  /// No description provided for @leaveApprovalStatusPendingCancel.
  ///
  /// In en, this message translates to:
  /// **'Pending cancel approval'**
  String get leaveApprovalStatusPendingCancel;

  /// No description provided for @leaveApprovalStatusApprovedCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel approved'**
  String get leaveApprovalStatusApprovedCancel;

  /// No description provided for @leaveApprovalStatusRejectedCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel rejected'**
  String get leaveApprovalStatusRejectedCancel;

  /// No description provided for @leaveApprovalProgressSummary.
  ///
  /// In en, this message translates to:
  /// **'{approved}/{total} steps approved'**
  String leaveApprovalProgressSummary(int approved, int total);

  /// No description provided for @leaveCancelApprovalProgressSummary.
  ///
  /// In en, this message translates to:
  /// **'{approved}/{total} cancel steps approved'**
  String leaveCancelApprovalProgressSummary(int approved, int total);

  /// No description provided for @leaveRequestDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave request details'**
  String get leaveRequestDetailTitle;

  /// No description provided for @leaveRequestRequesterLabel.
  ///
  /// In en, this message translates to:
  /// **'Requester'**
  String get leaveRequestRequesterLabel;

  /// No description provided for @leaveRequestDetailTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Leave type'**
  String get leaveRequestDetailTypeLabel;

  /// No description provided for @leaveRequestDetailDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'Leave days'**
  String get leaveRequestDetailDaysLabel;

  /// No description provided for @leaveRequestDetailReasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get leaveRequestDetailReasonLabel;

  /// No description provided for @approve.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @roleAdd.
  ///
  /// In en, this message translates to:
  /// **'Add role'**
  String get roleAdd;

  /// No description provided for @settingsDepartmentTree.
  ///
  /// In en, this message translates to:
  /// **'Department management'**
  String get settingsDepartmentTree;

  /// No description provided for @settingsDepartmentTreeDesc.
  ///
  /// In en, this message translates to:
  /// **'Department hierarchy from ValueSet tree'**
  String get settingsDepartmentTreeDesc;

  /// No description provided for @settingsRoleTree.
  ///
  /// In en, this message translates to:
  /// **'Role management'**
  String get settingsRoleTree;

  /// No description provided for @settingsRoleTreeDesc.
  ///
  /// In en, this message translates to:
  /// **'Role hierarchy from ValueSet tree'**
  String get settingsRoleTreeDesc;

  /// No description provided for @valueSetClearSelection.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get valueSetClearSelection;

  /// No description provided for @valueSetSelectionCount.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String valueSetSelectionCount(int count);

  /// No description provided for @valueSetDeleteSelectedConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete {count} selected nodes? Child nodes (if any) will also be deleted.'**
  String valueSetDeleteSelectedConfirm(int count);

  /// No description provided for @valueSetDeleteSelectedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Deleted {count} nodes successfully'**
  String valueSetDeleteSelectedSuccess(int count);

  /// No description provided for @menuAssignSelectedTitle.
  ///
  /// In en, this message translates to:
  /// **'Menus'**
  String get menuAssignSelectedTitle;

  /// No description provided for @menuAssignSelectedHint.
  ///
  /// In en, this message translates to:
  /// **'Assign display menus to {count} selected roles.'**
  String menuAssignSelectedHint(int count);

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @menuManagementTitle.
  ///
  /// In en, this message translates to:
  /// **'Menu management'**
  String get menuManagementTitle;

  /// No description provided for @menuManagementDesc.
  ///
  /// In en, this message translates to:
  /// **'Create, edit and delete app feature menus'**
  String get menuManagementDesc;

  /// No description provided for @menuEmpty.
  ///
  /// In en, this message translates to:
  /// **'No menus yet'**
  String get menuEmpty;

  /// No description provided for @menuEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Create a new menu to control visibility per role'**
  String get menuEmptyHint;

  /// No description provided for @menuCreate.
  ///
  /// In en, this message translates to:
  /// **'Add menu'**
  String get menuCreate;

  /// No description provided for @menuEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit menu'**
  String get menuEdit;

  /// No description provided for @menuFormHint.
  ///
  /// In en, this message translates to:
  /// **'Pick a fixed feature slug first. The title/subtitle you enter are shown in the app — they can be anything you like.'**
  String get menuFormHint;

  /// No description provided for @menuTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Display title'**
  String get menuTitleLabel;

  /// No description provided for @menuTitleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Staff Directory'**
  String get menuTitleHint;

  /// No description provided for @menuSubTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Subtitle (optional)'**
  String get menuSubTitleLabel;

  /// No description provided for @menuSubTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Short description shown in the app'**
  String get menuSubTitleHint;

  /// No description provided for @menuSlugLabel.
  ///
  /// In en, this message translates to:
  /// **'Feature slug'**
  String get menuSlugLabel;

  /// No description provided for @menuSlugHint.
  ///
  /// In en, this message translates to:
  /// **'Choose the slug that matches an app feature'**
  String get menuSlugHint;

  /// No description provided for @menuTitleRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get menuTitleRequired;

  /// No description provided for @menuSlugRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a slug'**
  String get menuSlugRequired;

  /// No description provided for @menuCreateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Menu created successfully'**
  String get menuCreateSuccess;

  /// No description provided for @menuUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Menu updated successfully'**
  String get menuUpdateSuccess;

  /// No description provided for @menuDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete menu'**
  String get menuDelete;

  /// No description provided for @menuDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the menu \"{name}\"?'**
  String menuDeleteConfirm(String name);

  /// No description provided for @menuDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Menu deleted successfully'**
  String get menuDeleteSuccess;

  /// No description provided for @menuAssignTitle.
  ///
  /// In en, this message translates to:
  /// **'Assign menus to role'**
  String get menuAssignTitle;

  /// No description provided for @menuAssignHint.
  ///
  /// In en, this message translates to:
  /// **'Select the menus shown for the \"{name}\" role.'**
  String menuAssignHint(String name);

  /// No description provided for @menuAssignSuccess.
  ///
  /// In en, this message translates to:
  /// **'Menus assigned successfully'**
  String get menuAssignSuccess;

  /// No description provided for @workerDocumentFieldsTitle.
  ///
  /// In en, this message translates to:
  /// **'Worker document fields'**
  String get workerDocumentFieldsTitle;

  /// No description provided for @workerDocumentFieldsDesc.
  ///
  /// In en, this message translates to:
  /// **'Manage document fields for worker profiles'**
  String get workerDocumentFieldsDesc;

  /// No description provided for @workerLifecycleTitle.
  ///
  /// In en, this message translates to:
  /// **'Employee lifecycle'**
  String get workerLifecycleTitle;

  /// No description provided for @workerLifecycleDesc.
  ///
  /// In en, this message translates to:
  /// **'Onboard, evaluate intern/probation, and track profile steps'**
  String get workerLifecycleDesc;

  /// No description provided for @officialApprovalTitle.
  ///
  /// In en, this message translates to:
  /// **'Official employment approval'**
  String get officialApprovalTitle;

  /// No description provided for @officialApprovalDesc.
  ///
  /// In en, this message translates to:
  /// **'Queue of profiles waiting for official / expired-probation approval'**
  String get officialApprovalDesc;

  /// No description provided for @workerDocumentFieldCreate.
  ///
  /// In en, this message translates to:
  /// **'Add document field'**
  String get workerDocumentFieldCreate;

  /// No description provided for @workerDocumentFieldEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit document field'**
  String get workerDocumentFieldEdit;

  /// No description provided for @workerDocumentFieldKeyLabel.
  ///
  /// In en, this message translates to:
  /// **'Field key'**
  String get workerDocumentFieldKeyLabel;

  /// No description provided for @workerDocumentFieldKeyHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. id_card_number'**
  String get workerDocumentFieldKeyHint;

  /// No description provided for @workerDocumentFieldTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Display title'**
  String get workerDocumentFieldTitleLabel;

  /// No description provided for @workerDocumentFieldTitleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. ID card number'**
  String get workerDocumentFieldTitleHint;

  /// No description provided for @workerDocumentFieldValueTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Value type'**
  String get workerDocumentFieldValueTypeLabel;

  /// No description provided for @workerDocumentFieldValueTypeText.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get workerDocumentFieldValueTypeText;

  /// No description provided for @workerDocumentFieldValueTypeFile.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get workerDocumentFieldValueTypeFile;

  /// No description provided for @workerDocumentFieldSortOrderLabel.
  ///
  /// In en, this message translates to:
  /// **'Sort order'**
  String get workerDocumentFieldSortOrderLabel;

  /// No description provided for @workerDocumentFieldRequiredLabel.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get workerDocumentFieldRequiredLabel;

  /// No description provided for @workerDocumentFieldActiveLabel.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get workerDocumentFieldActiveLabel;

  /// No description provided for @workerDocumentFieldKeyRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a field key'**
  String get workerDocumentFieldKeyRequired;

  /// No description provided for @workerDocumentFieldKeyInvalid.
  ///
  /// In en, this message translates to:
  /// **'Key must be lowercase letters, numbers and underscores'**
  String get workerDocumentFieldKeyInvalid;

  /// No description provided for @workerDocumentFieldTitleRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a display title'**
  String get workerDocumentFieldTitleRequired;

  /// No description provided for @workerDocumentFieldCreateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Document field created'**
  String get workerDocumentFieldCreateSuccess;

  /// No description provided for @workerDocumentFieldUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Document field updated'**
  String get workerDocumentFieldUpdateSuccess;

  /// No description provided for @workerDocumentFieldDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Document field deleted'**
  String get workerDocumentFieldDeleteSuccess;

  /// No description provided for @workerDocumentFieldDeleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete document field'**
  String get workerDocumentFieldDeleteConfirmTitle;

  /// No description provided for @workerDocumentFieldDeleteConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the field \"{name}\"?'**
  String workerDocumentFieldDeleteConfirmMessage(String name);

  /// No description provided for @workerDocumentFieldsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No document fields yet'**
  String get workerDocumentFieldsEmpty;

  /// No description provided for @workerDocumentFieldsEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Add a field to start collecting worker documents'**
  String get workerDocumentFieldsEmptyHint;

  /// No description provided for @workerDocumentFieldInactiveBadge.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get workerDocumentFieldInactiveBadge;

  /// No description provided for @editWorkerTabPersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal info'**
  String get editWorkerTabPersonal;

  /// No description provided for @editWorkerTabContract.
  ///
  /// In en, this message translates to:
  /// **'Contract & salary'**
  String get editWorkerTabContract;

  /// No description provided for @editWorkerTabDocuments.
  ///
  /// In en, this message translates to:
  /// **'HR documents'**
  String get editWorkerTabDocuments;

  /// No description provided for @workerDocumentsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load HR documents'**
  String get workerDocumentsLoadFailed;

  /// No description provided for @workerDocumentsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No document fields configured'**
  String get workerDocumentsEmpty;

  /// No description provided for @workerDocumentPickFile.
  ///
  /// In en, this message translates to:
  /// **'Pick file'**
  String get workerDocumentPickFile;

  /// No description provided for @workerDocumentViewFile.
  ///
  /// In en, this message translates to:
  /// **'View document'**
  String get workerDocumentViewFile;

  /// No description provided for @workerDocumentViewFailed.
  ///
  /// In en, this message translates to:
  /// **'Unable to open document'**
  String get workerDocumentViewFailed;

  /// No description provided for @workerDocumentClearFile.
  ///
  /// In en, this message translates to:
  /// **'Clear file'**
  String get workerDocumentClearFile;

  /// No description provided for @workerDocumentUploading.
  ///
  /// In en, this message translates to:
  /// **'Uploading...'**
  String get workerDocumentUploading;

  /// No description provided for @workerDocumentUploadSuccess.
  ///
  /// In en, this message translates to:
  /// **'File uploaded'**
  String get workerDocumentUploadSuccess;

  /// No description provided for @workerDocumentClearSuccess.
  ///
  /// In en, this message translates to:
  /// **'File cleared'**
  String get workerDocumentClearSuccess;

  /// No description provided for @workerDocumentRequiredFieldEmpty.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" is required'**
  String workerDocumentRequiredFieldEmpty(String name);

  /// No description provided for @workerDocumentNoFileSelected.
  ///
  /// In en, this message translates to:
  /// **'No file selected'**
  String get workerDocumentNoFileSelected;

  /// No description provided for @workerDocumentReload.
  ///
  /// In en, this message translates to:
  /// **'Reload'**
  String get workerDocumentReload;

  /// No description provided for @leaveTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave requests'**
  String get leaveTitle;

  /// No description provided for @leaveDesc.
  ///
  /// In en, this message translates to:
  /// **'View balance, submit and track leave requests'**
  String get leaveDesc;

  /// No description provided for @leaveLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load leave data'**
  String get leaveLoadFailed;

  /// No description provided for @leaveSettingsSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave balance policy'**
  String get leaveSettingsSectionTitle;

  /// No description provided for @leaveSettingsSectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Accrual cycle, rollover and balance cap'**
  String get leaveSettingsSectionSubtitle;

  /// No description provided for @leaveBalanceTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Accrual cycle'**
  String get leaveBalanceTypeLabel;

  /// No description provided for @leaveBalanceTypeMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get leaveBalanceTypeMonthly;

  /// No description provided for @leaveBalanceTypeYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get leaveBalanceTypeYearly;

  /// No description provided for @leaveBalanceQuotaLabel.
  ///
  /// In en, this message translates to:
  /// **'Days per cycle'**
  String get leaveBalanceQuotaLabel;

  /// No description provided for @isAccumulateLabel.
  ///
  /// In en, this message translates to:
  /// **'Accumulate leave'**
  String get isAccumulateLabel;

  /// No description provided for @isAccumulateHint.
  ///
  /// In en, this message translates to:
  /// **'Allow unused leave to roll over to the next cycle'**
  String get isAccumulateHint;

  /// No description provided for @maxLeaveBalanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Maximum leave balance'**
  String get maxLeaveBalanceLabel;

  /// No description provided for @leaveApprovalSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave approval workflow'**
  String get leaveApprovalSectionTitle;

  /// No description provided for @leaveApprovalSectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Approval levels and mandatory department injection in org tree'**
  String get leaveApprovalSectionSubtitle;

  /// No description provided for @leaveApprovalMaxLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Maximum approval levels'**
  String get leaveApprovalMaxLevelLabel;

  /// No description provided for @leaveApprovalInjectionNodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Injection department'**
  String get leaveApprovalInjectionNodeLabel;

  /// No description provided for @leaveApprovalInjectionTargetLabel.
  ///
  /// In en, this message translates to:
  /// **'Target department'**
  String get leaveApprovalInjectionTargetLabel;

  /// No description provided for @leaveApprovalInjectionPositionLabel.
  ///
  /// In en, this message translates to:
  /// **'Injection position'**
  String get leaveApprovalInjectionPositionLabel;

  /// No description provided for @leaveApprovalInjectionPositionBefore.
  ///
  /// In en, this message translates to:
  /// **'Before target department'**
  String get leaveApprovalInjectionPositionBefore;

  /// No description provided for @leaveApprovalInjectionPositionAfter.
  ///
  /// In en, this message translates to:
  /// **'After target department'**
  String get leaveApprovalInjectionPositionAfter;

  /// No description provided for @leaveApprovalInjectionHint.
  ///
  /// In en, this message translates to:
  /// **'Department injection fields are optional — if used, all three must be selected.'**
  String get leaveApprovalInjectionHint;

  /// No description provided for @leaveApprovalInjectionIncompleteError.
  ///
  /// In en, this message translates to:
  /// **'Injection config requires department, target and position together'**
  String get leaveApprovalInjectionIncompleteError;

  /// No description provided for @leaveBalanceQuotaInvalid.
  ///
  /// In en, this message translates to:
  /// **'Days per cycle must be greater than 0'**
  String get leaveBalanceQuotaInvalid;

  /// No description provided for @maxLeaveBalanceInvalid.
  ///
  /// In en, this message translates to:
  /// **'Maximum leave balance must be a non-negative number'**
  String get maxLeaveBalanceInvalid;

  /// No description provided for @maxLeaveBalanceRequiredWhenAccumulate.
  ///
  /// In en, this message translates to:
  /// **'When accumulation is enabled, set a maximum balance greater than 0'**
  String get maxLeaveBalanceRequiredWhenAccumulate;

  /// No description provided for @leaveApprovalMaxLevelInvalid.
  ///
  /// In en, this message translates to:
  /// **'Approval levels must be greater than 0'**
  String get leaveApprovalMaxLevelInvalid;

  /// No description provided for @leaveBalanceUsableLabel.
  ///
  /// In en, this message translates to:
  /// **'Available leave'**
  String get leaveBalanceUsableLabel;

  /// No description provided for @leaveBalanceAccruedLabel.
  ///
  /// In en, this message translates to:
  /// **'Accrued this year'**
  String get leaveBalanceAccruedLabel;

  /// No description provided for @leaveBalanceUnpaidLabel.
  ///
  /// In en, this message translates to:
  /// **'Unpaid leave'**
  String get leaveBalanceUnpaidLabel;

  /// No description provided for @leaveBalanceTakenLabel.
  ///
  /// In en, this message translates to:
  /// **'Used this year'**
  String get leaveBalanceTakenLabel;

  /// No description provided for @leaveCancelRequest.
  ///
  /// In en, this message translates to:
  /// **'Cancel leave request'**
  String get leaveCancelRequest;

  /// No description provided for @leaveCancelConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this leave request?'**
  String get leaveCancelConfirm;

  /// No description provided for @leaveCancelSuccess.
  ///
  /// In en, this message translates to:
  /// **'Leave cancellation request submitted'**
  String get leaveCancelSuccess;

  /// No description provided for @leaveCancelNotAllowedStarted.
  ///
  /// In en, this message translates to:
  /// **'Cannot cancel when leave starts today or has already started'**
  String get leaveCancelNotAllowedStarted;

  /// No description provided for @leaveDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this pending leave request?'**
  String get leaveDeleteConfirm;

  /// No description provided for @leaveDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Leave request deleted'**
  String get leaveDeleteSuccess;

  /// No description provided for @leaveCancelFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to cancel leave request'**
  String get leaveCancelFailed;

  /// No description provided for @leaveDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete leave request'**
  String get leaveDeleteFailed;

  /// No description provided for @leaveHandleCancelFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to handle cancellation request'**
  String get leaveHandleCancelFailed;

  /// No description provided for @monthlyLateQuotaLabel.
  ///
  /// In en, this message translates to:
  /// **'Max late check-ins / month'**
  String get monthlyLateQuotaLabel;

  /// No description provided for @latePenaltyDayDeductionLabel.
  ///
  /// In en, this message translates to:
  /// **'Workday deduction when over quota'**
  String get latePenaltyDayDeductionLabel;

  /// No description provided for @lateQuotaSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Late within threshold uses a quota slot. Exhausted quota or late beyond threshold deducts workdays per company settings.'**
  String get lateQuotaSettingsHint;

  /// No description provided for @monthlyLateQuotaInvalid.
  ///
  /// In en, this message translates to:
  /// **'Monthly late quota must be a non-negative integer'**
  String get monthlyLateQuotaInvalid;

  /// No description provided for @latePenaltyDayDeductionInvalid.
  ///
  /// In en, this message translates to:
  /// **'Late penalty deduction must be a non-negative number'**
  String get latePenaltyDayDeductionInvalid;

  /// No description provided for @workerLateQuotaSection.
  ///
  /// In en, this message translates to:
  /// **'Late quota'**
  String get workerLateQuotaSection;

  /// No description provided for @workerLateQuotaLabel.
  ///
  /// In en, this message translates to:
  /// **'Remaining late check-ins this month'**
  String get workerLateQuotaLabel;

  /// No description provided for @workerLateQuotaHint.
  ///
  /// In en, this message translates to:
  /// **'New workers inherit the company default quota'**
  String get workerLateQuotaHint;

  /// No description provided for @workerLateQuotaInvalid.
  ///
  /// In en, this message translates to:
  /// **'Late quota must be a non-negative integer'**
  String get workerLateQuotaInvalid;

  /// No description provided for @workerEmploymentSection.
  ///
  /// In en, this message translates to:
  /// **'Employment & salary'**
  String get workerEmploymentSection;

  /// No description provided for @workerEmploymentStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Employment status'**
  String get workerEmploymentStatusLabel;

  /// No description provided for @workerEmploymentStatusIntern.
  ///
  /// In en, this message translates to:
  /// **'Intern'**
  String get workerEmploymentStatusIntern;

  /// No description provided for @workerEmploymentStatusProbation.
  ///
  /// In en, this message translates to:
  /// **'Probation'**
  String get workerEmploymentStatusProbation;

  /// No description provided for @workerEmploymentStatusOfficial.
  ///
  /// In en, this message translates to:
  /// **'Official'**
  String get workerEmploymentStatusOfficial;

  /// No description provided for @workerBaseSalaryLabel.
  ///
  /// In en, this message translates to:
  /// **'Base salary'**
  String get workerBaseSalaryLabel;

  /// No description provided for @workerBaseSalaryHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 15000000'**
  String get workerBaseSalaryHint;

  /// No description provided for @workerProbationSalaryLabel.
  ///
  /// In en, this message translates to:
  /// **'Probation salary'**
  String get workerProbationSalaryLabel;

  /// No description provided for @workerProbationSalaryHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 10000000'**
  String get workerProbationSalaryHint;

  /// No description provided for @workerAllowanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Allowance'**
  String get workerAllowanceLabel;

  /// No description provided for @workerAllowanceHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 500000'**
  String get workerAllowanceHint;

  /// No description provided for @workerProbationStartDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Probation start date'**
  String get workerProbationStartDateLabel;

  /// No description provided for @workerProbationEndDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Probation end date'**
  String get workerProbationEndDateLabel;

  /// No description provided for @workerInternStartDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Internship start date'**
  String get workerInternStartDateLabel;

  /// No description provided for @workerInternEndDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Internship end date'**
  String get workerInternEndDateLabel;

  /// No description provided for @workerOfficialContractStartDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Official contract start date'**
  String get workerOfficialContractStartDateLabel;

  /// No description provided for @workerOfficialContractEndDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Official contract end date'**
  String get workerOfficialContractEndDateLabel;

  /// No description provided for @workerQuitDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Quit date'**
  String get workerQuitDateLabel;

  /// No description provided for @workerSalaryInvalid.
  ///
  /// In en, this message translates to:
  /// **'Amount must be a non-negative number'**
  String get workerSalaryInvalid;

  /// No description provided for @leaveTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Leave Type'**
  String get leaveTypeLabel;

  /// No description provided for @leaveTypePaidLeave.
  ///
  /// In en, this message translates to:
  /// **'Paid Leave'**
  String get leaveTypePaidLeave;

  /// No description provided for @leaveTypeUnpaidLeave.
  ///
  /// In en, this message translates to:
  /// **'Unpaid Leave'**
  String get leaveTypeUnpaidLeave;

  /// No description provided for @leaveTypeSickLeave.
  ///
  /// In en, this message translates to:
  /// **'Sick Leave'**
  String get leaveTypeSickLeave;

  /// No description provided for @leaveTypeMaternityLeave.
  ///
  /// In en, this message translates to:
  /// **'Maternity Leave'**
  String get leaveTypeMaternityLeave;

  /// No description provided for @attendanceSystemNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'System note'**
  String get attendanceSystemNoteLabel;

  /// No description provided for @attendanceDeductHalfDayLabel.
  ///
  /// In en, this message translates to:
  /// **'Workday deduction for late'**
  String get attendanceDeductHalfDayLabel;

  /// No description provided for @attendanceDeductHalfDayYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get attendanceDeductHalfDayYes;

  /// No description provided for @attendanceLateQuotaRemaining.
  ///
  /// In en, this message translates to:
  /// **'{count} late / early request quota remaining this month'**
  String attendanceLateQuotaRemaining(int count);

  /// No description provided for @attendanceLateQuotaAdminSection.
  ///
  /// In en, this message translates to:
  /// **'Late quota / workday deduction'**
  String get attendanceLateQuotaAdminSection;

  /// No description provided for @attendanceLateQuotaAdminHint.
  ///
  /// In en, this message translates to:
  /// **'Leave force options on auto so the system recalculates when check-in time changes. Override only when needed.'**
  String get attendanceLateQuotaAdminHint;

  /// No description provided for @attendanceSetDeductHalfDayLabel.
  ///
  /// In en, this message translates to:
  /// **'Workday deduction'**
  String get attendanceSetDeductHalfDayLabel;

  /// No description provided for @attendanceDeductHalfDayAuto.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get attendanceDeductHalfDayAuto;

  /// No description provided for @attendanceDeductHalfDayForceYes.
  ///
  /// In en, this message translates to:
  /// **'Force deduct'**
  String get attendanceDeductHalfDayForceYes;

  /// No description provided for @attendanceDeductHalfDayForceNo.
  ///
  /// In en, this message translates to:
  /// **'Force no deduction'**
  String get attendanceDeductHalfDayForceNo;

  /// No description provided for @attendanceRestoreQuotaLabel.
  ///
  /// In en, this message translates to:
  /// **'Restore 1 late quota'**
  String get attendanceRestoreQuotaLabel;

  /// No description provided for @attendanceRestoreQuotaHint.
  ///
  /// In en, this message translates to:
  /// **'Adds 1 back to the worker\'s lateQuota'**
  String get attendanceRestoreQuotaHint;

  /// No description provided for @attendanceCurrentDeductHalfDayHint.
  ///
  /// In en, this message translates to:
  /// **'This record currently has a late workday deduction flag'**
  String get attendanceCurrentDeductHalfDayHint;

  /// No description provided for @payrollAdminTitle.
  ///
  /// In en, this message translates to:
  /// **'Payroll approval'**
  String get payrollAdminTitle;

  /// No description provided for @payrollAdminDesc.
  ///
  /// In en, this message translates to:
  /// **'Set up, preview and approve monthly payroll'**
  String get payrollAdminDesc;

  /// No description provided for @payrollMyPayslipTitle.
  ///
  /// In en, this message translates to:
  /// **'My payslip'**
  String get payrollMyPayslipTitle;

  /// No description provided for @payrollMyPayslipDesc.
  ///
  /// In en, this message translates to:
  /// **'View your approved payslip'**
  String get payrollMyPayslipDesc;

  /// No description provided for @payrollSetupFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to set up payroll'**
  String get payrollSetupFailed;

  /// No description provided for @payrollLoadListFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load payroll list'**
  String get payrollLoadListFailed;

  /// No description provided for @payrollApproveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to approve payroll'**
  String get payrollApproveFailed;

  /// No description provided for @payrollMyPayslipFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load payslip'**
  String get payrollMyPayslipFailed;

  /// No description provided for @payrollSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Set up payroll'**
  String get payrollSetupTitle;

  /// No description provided for @payrollNotSetupMessage.
  ///
  /// In en, this message translates to:
  /// **'This payroll period is not set up yet. Enter standard work days and tap Set up.'**
  String get payrollNotSetupMessage;

  /// No description provided for @payrollStandardDays.
  ///
  /// In en, this message translates to:
  /// **'Standard work days'**
  String get payrollStandardDays;

  /// No description provided for @payrollStandardDaysLabel.
  ///
  /// In en, this message translates to:
  /// **'Standard days'**
  String get payrollStandardDaysLabel;

  /// No description provided for @payrollSetupButton.
  ///
  /// In en, this message translates to:
  /// **'Set up payroll'**
  String get payrollSetupButton;

  /// No description provided for @payrollApproveButton.
  ///
  /// In en, this message translates to:
  /// **'Approve payroll'**
  String get payrollApproveButton;

  /// No description provided for @payrollApproveConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm payroll approval'**
  String get payrollApproveConfirmTitle;

  /// No description provided for @payrollApproveConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'After approval, payslips will be saved and employees will be notified. Continue?'**
  String get payrollApproveConfirmMessage;

  /// No description provided for @payrollStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending approval'**
  String get payrollStatusPending;

  /// No description provided for @payrollStatusApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get payrollStatusApproved;

  /// No description provided for @payrollHasErrorsWarning.
  ///
  /// In en, this message translates to:
  /// **'Some employees have incomplete payroll data. Please review before approving.'**
  String get payrollHasErrorsWarning;

  /// No description provided for @payrollSetupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payroll set up successfully'**
  String get payrollSetupSuccess;

  /// No description provided for @payrollEditStandardDaysTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit standard work days'**
  String get payrollEditStandardDaysTitle;

  /// No description provided for @payrollEditStandardDaysHint.
  ///
  /// In en, this message translates to:
  /// **'You can only edit while payroll is pending approval. After saving, payroll will be recalculated with the new standard days.'**
  String get payrollEditStandardDaysHint;

  /// No description provided for @payrollUpdateStandardDaysButton.
  ///
  /// In en, this message translates to:
  /// **'Save standard days'**
  String get payrollUpdateStandardDaysButton;

  /// No description provided for @payrollUpdateStandardDaysSuccess.
  ///
  /// In en, this message translates to:
  /// **'Standard work days updated'**
  String get payrollUpdateStandardDaysSuccess;

  /// No description provided for @payrollApproveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payroll approved successfully'**
  String get payrollApproveSuccess;

  /// No description provided for @payrollNotApprovedTitle.
  ///
  /// In en, this message translates to:
  /// **'Not finalized yet'**
  String get payrollNotApprovedTitle;

  /// No description provided for @payrollNotApprovedMessage.
  ///
  /// In en, this message translates to:
  /// **'This month has not been finalized yet. Please check back after admin approves payroll.'**
  String get payrollNotApprovedMessage;

  /// No description provided for @payrollColName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get payrollColName;

  /// No description provided for @payrollColPosition.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get payrollColPosition;

  /// No description provided for @payrollColWorkDays.
  ///
  /// In en, this message translates to:
  /// **'Work days'**
  String get payrollColWorkDays;

  /// No description provided for @payrollColBaseSalary.
  ///
  /// In en, this message translates to:
  /// **'Base salary'**
  String get payrollColBaseSalary;

  /// No description provided for @payrollColAllowance.
  ///
  /// In en, this message translates to:
  /// **'Allowance'**
  String get payrollColAllowance;

  /// No description provided for @payrollColNetPay.
  ///
  /// In en, this message translates to:
  /// **'Net pay'**
  String get payrollColNetPay;

  /// No description provided for @currencyVndSuffix.
  ///
  /// In en, this message translates to:
  /// **'đ'**
  String get currencyVndSuffix;

  /// No description provided for @payrollDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Payslip details'**
  String get payrollDetailTitle;

  /// No description provided for @payrollActualWorkDays.
  ///
  /// In en, this message translates to:
  /// **'Actual work days'**
  String get payrollActualWorkDays;

  /// No description provided for @payrollProbationSalary.
  ///
  /// In en, this message translates to:
  /// **'Probation salary'**
  String get payrollProbationSalary;

  /// No description provided for @payrollSegmentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Payroll breakdown'**
  String get payrollSegmentsTitle;

  /// No description provided for @payrollSegmentDays.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get payrollSegmentDays;

  /// No description provided for @payrollSegmentDailyRate.
  ///
  /// In en, this message translates to:
  /// **'Daily rate'**
  String get payrollSegmentDailyRate;

  /// No description provided for @payrollSegmentTotal.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get payrollSegmentTotal;

  /// No description provided for @payrollSegmentTypeOfficial.
  ///
  /// In en, this message translates to:
  /// **'Official'**
  String get payrollSegmentTypeOfficial;

  /// No description provided for @payrollSegmentTypeProbation.
  ///
  /// In en, this message translates to:
  /// **'Probation'**
  String get payrollSegmentTypeProbation;

  /// No description provided for @payrollSegmentTypeIntern.
  ///
  /// In en, this message translates to:
  /// **'Intern'**
  String get payrollSegmentTypeIntern;

  /// No description provided for @payrollFinalNetPay.
  ///
  /// In en, this message translates to:
  /// **'Net pay'**
  String get payrollFinalNetPay;

  /// No description provided for @lifecycleEmptyValue.
  ///
  /// In en, this message translates to:
  /// **'—'**
  String get lifecycleEmptyValue;

  /// No description provided for @lifecycleStepIntern.
  ///
  /// In en, this message translates to:
  /// **'Internship'**
  String get lifecycleStepIntern;

  /// No description provided for @lifecycleStepEvaluate.
  ///
  /// In en, this message translates to:
  /// **'Evaluation'**
  String get lifecycleStepEvaluate;

  /// No description provided for @lifecycleStepKpi.
  ///
  /// In en, this message translates to:
  /// **'Probation KPI'**
  String get lifecycleStepKpi;

  /// No description provided for @lifecycleStepOfficialApproval.
  ///
  /// In en, this message translates to:
  /// **'Official approval'**
  String get lifecycleStepOfficialApproval;

  /// No description provided for @lifecycleStepComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get lifecycleStepComplete;

  /// No description provided for @lifecycleStepNumber.
  ///
  /// In en, this message translates to:
  /// **'Step {step}'**
  String lifecycleStepNumber(int step);

  /// No description provided for @lifecycleStepProgress.
  ///
  /// In en, this message translates to:
  /// **'Step {current}/{max}'**
  String lifecycleStepProgress(int current, int max);

  /// No description provided for @lifecycleStatusInternActive.
  ///
  /// In en, this message translates to:
  /// **'Internship in progress'**
  String get lifecycleStatusInternActive;

  /// No description provided for @lifecycleStatusWaitingEvaluate.
  ///
  /// In en, this message translates to:
  /// **'Awaiting intern evaluation'**
  String get lifecycleStatusWaitingEvaluate;

  /// No description provided for @lifecycleStatusProbationActive.
  ///
  /// In en, this message translates to:
  /// **'Probation in progress'**
  String get lifecycleStatusProbationActive;

  /// No description provided for @lifecycleStatusKpiPending.
  ///
  /// In en, this message translates to:
  /// **'KPI submission pending'**
  String get lifecycleStatusKpiPending;

  /// No description provided for @lifecycleStatusWaitingHrCheck.
  ///
  /// In en, this message translates to:
  /// **'Awaiting HR review'**
  String get lifecycleStatusWaitingHrCheck;

  /// No description provided for @lifecycleStatusExpiredProbation.
  ///
  /// In en, this message translates to:
  /// **'Probation expired — awaiting approval'**
  String get lifecycleStatusExpiredProbation;

  /// No description provided for @lifecycleStatusWaitingOfficialApprove.
  ///
  /// In en, this message translates to:
  /// **'Awaiting approval'**
  String get lifecycleStatusWaitingOfficialApprove;

  /// No description provided for @lifecycleStatusPositionTransfer.
  ///
  /// In en, this message translates to:
  /// **'Position transfer'**
  String get lifecycleStatusPositionTransfer;

  /// No description provided for @lifecycleStatusOfficial.
  ///
  /// In en, this message translates to:
  /// **'Official employee'**
  String get lifecycleStatusOfficial;

  /// No description provided for @lifecycleStatusOfficialApproved.
  ///
  /// In en, this message translates to:
  /// **'Official approval granted'**
  String get lifecycleStatusOfficialApproved;

  /// No description provided for @lifecycleStatusNotAccepted.
  ///
  /// In en, this message translates to:
  /// **'Not accepted'**
  String get lifecycleStatusNotAccepted;

  /// No description provided for @lifecycleStatusShortWaitingApproval.
  ///
  /// In en, this message translates to:
  /// **'Awaiting approval'**
  String get lifecycleStatusShortWaitingApproval;

  /// No description provided for @lifecycleStatusShortExpiredProbation.
  ///
  /// In en, this message translates to:
  /// **'Probation expired'**
  String get lifecycleStatusShortExpiredProbation;

  /// No description provided for @lifecycleStatusShortProbation.
  ///
  /// In en, this message translates to:
  /// **'Probation'**
  String get lifecycleStatusShortProbation;

  /// No description provided for @lifecycleStatusShortIntern.
  ///
  /// In en, this message translates to:
  /// **'Internship'**
  String get lifecycleStatusShortIntern;

  /// No description provided for @lifecycleStatusShortEvaluate.
  ///
  /// In en, this message translates to:
  /// **'Evaluation'**
  String get lifecycleStatusShortEvaluate;

  /// No description provided for @lifecycleStatusShortOfficial.
  ///
  /// In en, this message translates to:
  /// **'Official'**
  String get lifecycleStatusShortOfficial;

  /// No description provided for @lifecycleRecommendationProbation.
  ///
  /// In en, this message translates to:
  /// **'Move to probation'**
  String get lifecycleRecommendationProbation;

  /// No description provided for @lifecycleRecommendationTerminate.
  ///
  /// In en, this message translates to:
  /// **'Not accepted'**
  String get lifecycleRecommendationTerminate;

  /// No description provided for @lifecycleRecommendationOfficial.
  ///
  /// In en, this message translates to:
  /// **'Accept as official employee'**
  String get lifecycleRecommendationOfficial;

  /// No description provided for @lifecycleRecommendationTransfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer to another position'**
  String get lifecycleRecommendationTransfer;

  /// No description provided for @lifecycleContractFixedTerm.
  ///
  /// In en, this message translates to:
  /// **'Fixed-term'**
  String get lifecycleContractFixedTerm;

  /// No description provided for @lifecycleContractIndefinite.
  ///
  /// In en, this message translates to:
  /// **'Indefinite-term'**
  String get lifecycleContractIndefinite;

  /// No description provided for @lifecycleSourceDirectRecruit.
  ///
  /// In en, this message translates to:
  /// **'Direct recruit (DIRECT_RECRUIT)'**
  String get lifecycleSourceDirectRecruit;

  /// No description provided for @lifecycleSourceFromIntern.
  ///
  /// In en, this message translates to:
  /// **'Promoted from intern (FROM_INTERN)'**
  String get lifecycleSourceFromIntern;

  /// No description provided for @lifecycleSourceInternOnboarding.
  ///
  /// In en, this message translates to:
  /// **'Intern onboarding (INTERN_ONBOARDING)'**
  String get lifecycleSourceInternOnboarding;

  /// No description provided for @lifecycleSourceBadgeDirectRecruit.
  ///
  /// In en, this message translates to:
  /// **'NEW PROBATION PROFILE'**
  String get lifecycleSourceBadgeDirectRecruit;

  /// No description provided for @lifecycleSourceBadgeFromIntern.
  ///
  /// In en, this message translates to:
  /// **'100% ID INHERITED'**
  String get lifecycleSourceBadgeFromIntern;

  /// No description provided for @lifecycleSourceBadgeInternOnboarding.
  ///
  /// In en, this message translates to:
  /// **'INTERN ONBOARDING'**
  String get lifecycleSourceBadgeInternOnboarding;

  /// No description provided for @lifecycleSourceBadgeDefault.
  ///
  /// In en, this message translates to:
  /// **'PROBATION PROFILE'**
  String get lifecycleSourceBadgeDefault;

  /// No description provided for @lifecycleKpiBadgeSubmitted.
  ///
  /// In en, this message translates to:
  /// **'SUBMITTED FOR APPROVAL'**
  String get lifecycleKpiBadgeSubmitted;

  /// No description provided for @lifecycleKpiBadgeProbationing.
  ///
  /// In en, this message translates to:
  /// **'PROBATIONING'**
  String get lifecycleKpiBadgeProbationing;

  /// No description provided for @lifecycleWorkerCodeFallback.
  ///
  /// In en, this message translates to:
  /// **'EMP'**
  String get lifecycleWorkerCodeFallback;

  /// No description provided for @lifecycleDropdownLabel.
  ///
  /// In en, this message translates to:
  /// **'{code} — {name} ({status})'**
  String lifecycleDropdownLabel(String code, String name, String status);

  /// No description provided for @lifecycleSelectorQueue.
  ///
  /// In en, this message translates to:
  /// **'KPI-COMPLETED PROFILES'**
  String get lifecycleSelectorQueue;

  /// No description provided for @lifecycleSelectorActive.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE EMPLOYEE PROFILES'**
  String get lifecycleSelectorActive;

  /// No description provided for @lifecycleOfficialApprovalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Evaluate and approve official employment'**
  String get lifecycleOfficialApprovalSubtitle;

  /// No description provided for @lifecycleLoadListFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load the list'**
  String get lifecycleLoadListFailed;

  /// No description provided for @lifecycleEmptyNoWorkers.
  ///
  /// In en, this message translates to:
  /// **'No employees yet'**
  String get lifecycleEmptyNoWorkers;

  /// No description provided for @lifecycleEmptyNoApprovalQueue.
  ///
  /// In en, this message translates to:
  /// **'No profiles awaiting approval'**
  String get lifecycleEmptyNoApprovalQueue;

  /// No description provided for @lifecycleEmptyAddWorkerHint.
  ///
  /// In en, this message translates to:
  /// **'Add a new employee to start the lifecycle'**
  String get lifecycleEmptyAddWorkerHint;

  /// No description provided for @lifecycleSelectProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Select a profile'**
  String get lifecycleSelectProfileTitle;

  /// No description provided for @lifecycleSelectProfileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a profile from the list above'**
  String get lifecycleSelectProfileSubtitle;

  /// No description provided for @lifecycleNoProfiles.
  ///
  /// In en, this message translates to:
  /// **'No profiles yet'**
  String get lifecycleNoProfiles;

  /// No description provided for @lifecycleOnboardTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Onboard type'**
  String get lifecycleOnboardTypeLabel;

  /// No description provided for @lifecycleRolePositionLabel.
  ///
  /// In en, this message translates to:
  /// **'Role / position'**
  String get lifecycleRolePositionLabel;

  /// No description provided for @lifecycleMentorOptional.
  ///
  /// In en, this message translates to:
  /// **'Mentor (optional)'**
  String get lifecycleMentorOptional;

  /// No description provided for @lifecycleManagerOptional.
  ///
  /// In en, this message translates to:
  /// **'Direct manager (optional)'**
  String get lifecycleManagerOptional;

  /// No description provided for @lifecycleSelectDatesRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select start and end dates.'**
  String get lifecycleSelectDatesRequired;

  /// No description provided for @lifecycleCreatingWorker.
  ///
  /// In en, this message translates to:
  /// **'Creating...'**
  String get lifecycleCreatingWorker;

  /// No description provided for @lifecycleValueSetNotConfiguredDetail.
  ///
  /// In en, this message translates to:
  /// **'Role / department trees are not configured in Value management.'**
  String get lifecycleValueSetNotConfiguredDetail;

  /// No description provided for @lifecycleInternInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Internship information'**
  String get lifecycleInternInfoTitle;

  /// No description provided for @lifecycleFullNameShort.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get lifecycleFullNameShort;

  /// No description provided for @lifecycleInternStartShort.
  ///
  /// In en, this message translates to:
  /// **'Intern start'**
  String get lifecycleInternStartShort;

  /// No description provided for @lifecycleInternEndShort.
  ///
  /// In en, this message translates to:
  /// **'Intern end'**
  String get lifecycleInternEndShort;

  /// No description provided for @lifecycleStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get lifecycleStatusLabel;

  /// No description provided for @lifecycleMentorLabel.
  ///
  /// In en, this message translates to:
  /// **'Mentor'**
  String get lifecycleMentorLabel;

  /// No description provided for @lifecycleProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get lifecycleProcessing;

  /// No description provided for @lifecycleMoveToEvaluate.
  ///
  /// In en, this message translates to:
  /// **'Move to evaluation'**
  String get lifecycleMoveToEvaluate;

  /// No description provided for @lifecycleMovedToEvaluateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Moved to intern evaluation step'**
  String get lifecycleMovedToEvaluateSuccess;

  /// No description provided for @lifecycleEvaluateInternTitle.
  ///
  /// In en, this message translates to:
  /// **'Intern evaluation'**
  String get lifecycleEvaluateInternTitle;

  /// No description provided for @lifecycleRecommendationLabel.
  ///
  /// In en, this message translates to:
  /// **'Recommendation'**
  String get lifecycleRecommendationLabel;

  /// No description provided for @lifecycleRecommendationPassProbation.
  ///
  /// In en, this message translates to:
  /// **'Pass — move to probation'**
  String get lifecycleRecommendationPassProbation;

  /// No description provided for @lifecycleRecommendationFailTerminate.
  ///
  /// In en, this message translates to:
  /// **'Fail — end internship'**
  String get lifecycleRecommendationFailTerminate;

  /// No description provided for @lifecycleDirectManagerLabel.
  ///
  /// In en, this message translates to:
  /// **'Direct manager'**
  String get lifecycleDirectManagerLabel;

  /// No description provided for @lifecycleSelectManagerRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select a direct manager'**
  String get lifecycleSelectManagerRequired;

  /// No description provided for @lifecycleSelectProbationDatesRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select probation dates'**
  String get lifecycleSelectProbationDatesRequired;

  /// No description provided for @lifecycleMentorScoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Mentor score (0–10)'**
  String get lifecycleMentorScoreLabel;

  /// No description provided for @lifecycleNotesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get lifecycleNotesLabel;

  /// No description provided for @lifecycleSubmitting.
  ///
  /// In en, this message translates to:
  /// **'Submitting...'**
  String get lifecycleSubmitting;

  /// No description provided for @lifecycleApproveProbationTransfer.
  ///
  /// In en, this message translates to:
  /// **'Approve probation transfer'**
  String get lifecycleApproveProbationTransfer;

  /// No description provided for @lifecycleEvaluateInternSuccess.
  ///
  /// In en, this message translates to:
  /// **'Intern evaluation submitted'**
  String get lifecycleEvaluateInternSuccess;

  /// No description provided for @lifecycleKpiPanelTitle.
  ///
  /// In en, this message translates to:
  /// **'Probation Process & KPI Management'**
  String get lifecycleKpiPanelTitle;

  /// No description provided for @lifecycleKpiPanelSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Probation Lifecycle & Profile Management Engine'**
  String get lifecycleKpiPanelSubtitle;

  /// No description provided for @lifecycleSourceClassificationLabel.
  ///
  /// In en, this message translates to:
  /// **'Probation intake source classification'**
  String get lifecycleSourceClassificationLabel;

  /// No description provided for @lifecycleProbationWorkerLabel.
  ///
  /// In en, this message translates to:
  /// **'Probation employee'**
  String get lifecycleProbationWorkerLabel;

  /// No description provided for @lifecycleProbationPeriodLabel.
  ///
  /// In en, this message translates to:
  /// **'Probation period'**
  String get lifecycleProbationPeriodLabel;

  /// No description provided for @lifecycleKpiGoalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Probation KPI Goals'**
  String get lifecycleKpiGoalsTitle;

  /// No description provided for @lifecycleKpiWeightConstraint.
  ///
  /// In en, this message translates to:
  /// **'Constraint: total weight = 100%'**
  String get lifecycleKpiWeightConstraint;

  /// No description provided for @lifecycleKpiGoalLabel.
  ///
  /// In en, this message translates to:
  /// **'Goal {index}'**
  String lifecycleKpiGoalLabel(int index);

  /// No description provided for @lifecycleKpiGoalTemplate.
  ///
  /// In en, this message translates to:
  /// **'Goal {index}: '**
  String lifecycleKpiGoalTemplate(int index);

  /// No description provided for @lifecycleAddKpi.
  ///
  /// In en, this message translates to:
  /// **'Add KPI'**
  String get lifecycleAddKpi;

  /// No description provided for @lifecycleKpiWeightValid.
  ///
  /// In en, this message translates to:
  /// **'Total KPI weight = 100% (Valid).'**
  String get lifecycleKpiWeightValid;

  /// No description provided for @lifecycleKpiWeightInvalid.
  ///
  /// In en, this message translates to:
  /// **'Total KPI weight = {total}% (Invalid).'**
  String lifecycleKpiWeightInvalid(int total);

  /// No description provided for @lifecycleKpiEachRequired.
  ///
  /// In en, this message translates to:
  /// **'Each KPI needs a title and weight > 0'**
  String get lifecycleKpiEachRequired;

  /// No description provided for @lifecycleKpiWeightMustBe100.
  ///
  /// In en, this message translates to:
  /// **'Total KPI weight must equal 100 (current: {total})'**
  String lifecycleKpiWeightMustBe100(int total);

  /// No description provided for @lifecycleKpiSubmitSuccess.
  ///
  /// In en, this message translates to:
  /// **'Probation KPI submitted'**
  String get lifecycleKpiSubmitSuccess;

  /// No description provided for @lifecycleProbationExpiryEngineTitle.
  ///
  /// In en, this message translates to:
  /// **'Probation expiry alert engine:\n'**
  String get lifecycleProbationExpiryEngineTitle;

  /// No description provided for @lifecycleProbationExpiryEngineBody.
  ///
  /// In en, this message translates to:
  /// **'Nightly cron reminders at -15, -7, and -3 days. When probation_end_date passes without a decision, status becomes '**
  String get lifecycleProbationExpiryEngineBody;

  /// No description provided for @lifecycleProbationExpiryEngineTail.
  ///
  /// In en, this message translates to:
  /// **' (Attendance continues, probation salary remains, no automatic OFFICIAL promotion).'**
  String get lifecycleProbationExpiryEngineTail;

  /// No description provided for @lifecycleCompleteKpiAndSubmit.
  ///
  /// In en, this message translates to:
  /// **'Complete KPI & submit for approval'**
  String get lifecycleCompleteKpiAndSubmit;

  /// No description provided for @lifecycleOfficialReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Evaluation & official approval'**
  String get lifecycleOfficialReviewTitle;

  /// No description provided for @lifecycleOfficialReviewSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Approve probation employee for official employment'**
  String get lifecycleOfficialReviewSubtitle;

  /// No description provided for @lifecycleKpiResultLabel.
  ///
  /// In en, this message translates to:
  /// **'KPI'**
  String get lifecycleKpiResultLabel;

  /// No description provided for @lifecycleKpiNoResult.
  ///
  /// In en, this message translates to:
  /// **'No results yet'**
  String get lifecycleKpiNoResult;

  /// No description provided for @lifecycleKpiPassedTotal.
  ///
  /// In en, this message translates to:
  /// **'Passed • total weight {total}%'**
  String lifecycleKpiPassedTotal(int total);

  /// No description provided for @lifecycleManagerSubmittedDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Manager submitted on'**
  String get lifecycleManagerSubmittedDateLabel;

  /// No description provided for @lifecycleProfileSourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile source'**
  String get lifecycleProfileSourceLabel;

  /// No description provided for @lifecycleProfileSourceAuto.
  ///
  /// In en, this message translates to:
  /// **'Automatically transferred from employee lifecycle management'**
  String get lifecycleProfileSourceAuto;

  /// No description provided for @lifecycleKpiReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Probation KPI evaluation results'**
  String get lifecycleKpiReviewTitle;

  /// No description provided for @lifecycleKpiPassedBadge.
  ///
  /// In en, this message translates to:
  /// **'PASSED • {total}%'**
  String lifecycleKpiPassedBadge(int total);

  /// No description provided for @lifecycleKpiNoKpiBadge.
  ///
  /// In en, this message translates to:
  /// **'NO KPI'**
  String get lifecycleKpiNoKpiBadge;

  /// No description provided for @lifecycleManagerReviewLabel.
  ///
  /// In en, this message translates to:
  /// **'Manager review: {name}'**
  String lifecycleManagerReviewLabel(String name);

  /// No description provided for @lifecycleMentorScoreValue.
  ///
  /// In en, this message translates to:
  /// **'Mentor score: {score}/10'**
  String lifecycleMentorScoreValue(String score);

  /// No description provided for @lifecycleKpiNotSubmittedFromProbation.
  ///
  /// In en, this message translates to:
  /// **'No KPI goals were submitted from the probation step.'**
  String get lifecycleKpiNotSubmittedFromProbation;

  /// No description provided for @lifecycleKpiWeightValidForApproval.
  ///
  /// In en, this message translates to:
  /// **'Total KPI weight = 100% (Valid) — eligible for approval submission.'**
  String get lifecycleKpiWeightValidForApproval;

  /// No description provided for @lifecycleProbationExpiredTitle.
  ///
  /// In en, this message translates to:
  /// **'⏱  Probation period ended'**
  String get lifecycleProbationExpiredTitle;

  /// No description provided for @lifecycleWaitingDaysBadge.
  ///
  /// In en, this message translates to:
  /// **'Day {current}/{total}'**
  String lifecycleWaitingDaysBadge(int current, int total);

  /// No description provided for @lifecycleSlaOverdueMessage.
  ///
  /// In en, this message translates to:
  /// **'Decision SLA exceeded. Profile stays open until approval.'**
  String get lifecycleSlaOverdueMessage;

  /// No description provided for @lifecycleSlaRemainingMessage.
  ///
  /// In en, this message translates to:
  /// **'{remaining} working day(s) left to finalize the decision.'**
  String lifecycleSlaRemainingMessage(int remaining);

  /// No description provided for @lifecycleStillCanCheckIn.
  ///
  /// In en, this message translates to:
  /// **'Attendance still allowed'**
  String get lifecycleStillCanCheckIn;

  /// No description provided for @lifecycleProbationSalary85.
  ///
  /// In en, this message translates to:
  /// **'Probation salary calculated at 85%'**
  String get lifecycleProbationSalary85;

  /// No description provided for @lifecycleAnnualLeaveLocked.
  ///
  /// In en, this message translates to:
  /// **'Annual leave registration not yet enabled'**
  String get lifecycleAnnualLeaveLocked;

  /// No description provided for @lifecycleSlaEscalationNotice.
  ///
  /// In en, this message translates to:
  /// **'Alert escalated to HR Head and top approvers. Profile cannot be closed without a decision.'**
  String get lifecycleSlaEscalationNotice;

  /// No description provided for @lifecycleAddWaitingDay.
  ///
  /// In en, this message translates to:
  /// **'+1 waiting day'**
  String get lifecycleAddWaitingDay;

  /// No description provided for @lifecycleResetWaitingDays.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get lifecycleResetWaitingDays;

  /// No description provided for @lifecycleManagerHrProposalTitle.
  ///
  /// In en, this message translates to:
  /// **'Manager evaluation & HR proposal'**
  String get lifecycleManagerHrProposalTitle;

  /// No description provided for @lifecycleManagerRecommendationLabel.
  ///
  /// In en, this message translates to:
  /// **'Manager recommendation *'**
  String get lifecycleManagerRecommendationLabel;

  /// No description provided for @lifecycleOfficialSalary100Label.
  ///
  /// In en, this message translates to:
  /// **'Official salary 100% *'**
  String get lifecycleOfficialSalary100Label;

  /// No description provided for @lifecycleContractTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Contract type *'**
  String get lifecycleContractTypeLabel;

  /// No description provided for @lifecycleCurrentlyCalculatingLabel.
  ///
  /// In en, this message translates to:
  /// **'Currently calculated'**
  String get lifecycleCurrentlyCalculatingLabel;

  /// No description provided for @lifecycleAfterApprovalLabel.
  ///
  /// In en, this message translates to:
  /// **'After approval'**
  String get lifecycleAfterApprovalLabel;

  /// No description provided for @lifecycleNoSalaryGap.
  ///
  /// In en, this message translates to:
  /// **'No difference yet'**
  String get lifecycleNoSalaryGap;

  /// No description provided for @lifecycleSalaryIncreasePct.
  ///
  /// In en, this message translates to:
  /// **'Increase {pct}% vs current calculated amount'**
  String lifecycleSalaryIncreasePct(int pct);

  /// No description provided for @lifecycleSalaryDecreasePct.
  ///
  /// In en, this message translates to:
  /// **'Decrease {pct}% vs current calculated amount'**
  String lifecycleSalaryDecreasePct(int pct);

  /// No description provided for @lifecycleContractEndDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Labor contract end date'**
  String get lifecycleContractEndDateLabel;

  /// No description provided for @lifecycleTerminateProfileNote.
  ///
  /// In en, this message translates to:
  /// **'Profile will end lifecycle (NOT_ACCEPTED / TERMINATED). No official contract upload required.'**
  String get lifecycleTerminateProfileNote;

  /// No description provided for @lifecycleTransferProfileNote.
  ///
  /// In en, this message translates to:
  /// **'Position transfer: complete the new position plan after approval.'**
  String get lifecycleTransferProfileNote;

  /// No description provided for @lifecycleProcessingTimelineTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile processing timeline'**
  String get lifecycleProcessingTimelineTitle;

  /// No description provided for @lifecycleProcessingTimelineHint.
  ///
  /// In en, this message translates to:
  /// **'Required order: Approval → Contract signing → Official start.'**
  String get lifecycleProcessingTimelineHint;

  /// No description provided for @lifecycleProbationEndLabel.
  ///
  /// In en, this message translates to:
  /// **'Probation end'**
  String get lifecycleProbationEndLabel;

  /// No description provided for @lifecycleManagerSubmitLabel.
  ///
  /// In en, this message translates to:
  /// **'Manager submission'**
  String get lifecycleManagerSubmitLabel;

  /// No description provided for @lifecycleApprovalDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Approval date'**
  String get lifecycleApprovalDateLabel;

  /// No description provided for @lifecycleApprovalDateAuto.
  ///
  /// In en, this message translates to:
  /// **'Recorded automatically on approval'**
  String get lifecycleApprovalDateAuto;

  /// No description provided for @lifecycleContractSignDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Contract signing date *'**
  String get lifecycleContractSignDateLabel;

  /// No description provided for @lifecycleOfficialStartDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Official start date *'**
  String get lifecycleOfficialStartDateLabel;

  /// No description provided for @lifecycleContractMustBeSignedHint.
  ///
  /// In en, this message translates to:
  /// **'Contract must be approved and signed on or before the official start date.'**
  String get lifecycleContractMustBeSignedHint;

  /// No description provided for @lifecycleOfficialContractTitle.
  ///
  /// In en, this message translates to:
  /// **'Official labor contract *'**
  String get lifecycleOfficialContractTitle;

  /// No description provided for @lifecycleContractUploaded.
  ///
  /// In en, this message translates to:
  /// **'UPLOADED'**
  String get lifecycleContractUploaded;

  /// No description provided for @lifecycleContractNotUploaded.
  ///
  /// In en, this message translates to:
  /// **'NOT UPLOADED'**
  String get lifecycleContractNotUploaded;

  /// No description provided for @lifecycleOfficialContractUploadHint.
  ///
  /// In en, this message translates to:
  /// **'HR Admin uploads a PDF from HR_MANAGED source. Submission is blocked without the file.'**
  String get lifecycleOfficialContractUploadHint;

  /// No description provided for @lifecycleChangeOfficialContractPdf.
  ///
  /// In en, this message translates to:
  /// **'Replace official contract PDF'**
  String get lifecycleChangeOfficialContractPdf;

  /// No description provided for @lifecycleSelectOfficialContractPdf.
  ///
  /// In en, this message translates to:
  /// **'Select official contract PDF'**
  String get lifecycleSelectOfficialContractPdf;

  /// No description provided for @lifecycleContractFieldNotConfigured.
  ///
  /// In en, this message translates to:
  /// **'Contract field is not configured in the system.'**
  String get lifecycleContractFieldNotConfigured;

  /// No description provided for @lifecycleUploadContractBeforeSubmit.
  ///
  /// In en, this message translates to:
  /// **'Please upload the official labor contract before completing.'**
  String get lifecycleUploadContractBeforeSubmit;

  /// No description provided for @lifecycleMissingRequiredDocsTitle.
  ///
  /// In en, this message translates to:
  /// **'Cannot submit for official approval yet'**
  String get lifecycleMissingRequiredDocsTitle;

  /// No description provided for @lifecycleMissingRequiredDocsHint.
  ///
  /// In en, this message translates to:
  /// **'Required documents are still missing: {names}'**
  String lifecycleMissingRequiredDocsHint(String names);

  /// No description provided for @lifecycleSupplementDocsTitle.
  ///
  /// In en, this message translates to:
  /// **'Complete profile documents'**
  String get lifecycleSupplementDocsTitle;

  /// No description provided for @lifecycleSupplementDocsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add or edit all configured HR documents before submitting for approval.'**
  String get lifecycleSupplementDocsSubtitle;

  /// No description provided for @lifecycleNoDocumentFieldsConfigured.
  ///
  /// In en, this message translates to:
  /// **'No document fields are configured yet.'**
  String get lifecycleNoDocumentFieldsConfigured;

  /// No description provided for @lifecycleSaveDocumentText.
  ///
  /// In en, this message translates to:
  /// **'Save text'**
  String get lifecycleSaveDocumentText;

  /// No description provided for @lifecycleDocumentTextSaved.
  ///
  /// In en, this message translates to:
  /// **'Document text saved'**
  String get lifecycleDocumentTextSaved;

  /// No description provided for @lifecycleDocumentFilled.
  ///
  /// In en, this message translates to:
  /// **'Filled'**
  String get lifecycleDocumentFilled;

  /// No description provided for @lifecycleDocumentMissingRequired.
  ///
  /// In en, this message translates to:
  /// **'Missing *'**
  String get lifecycleDocumentMissingRequired;

  /// No description provided for @lifecycleDocumentOptionalEmpty.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get lifecycleDocumentOptionalEmpty;

  /// No description provided for @lifecycleHrAdminCurrentStepTitle.
  ///
  /// In en, this message translates to:
  /// **'Current step – HR Admin: '**
  String get lifecycleHrAdminCurrentStepTitle;

  /// No description provided for @lifecycleHrAdminCurrentStepBody.
  ///
  /// In en, this message translates to:
  /// **'Review the manager recommendation, complete salary/contract type/date milestones, and fill all configured profile documents.'**
  String get lifecycleHrAdminCurrentStepBody;

  /// No description provided for @lifecycleHrSubmitToApprover.
  ///
  /// In en, this message translates to:
  /// **'HR submit to approver →'**
  String get lifecycleHrSubmitToApprover;

  /// No description provided for @lifecycleSendDecision.
  ///
  /// In en, this message translates to:
  /// **'Send decision'**
  String get lifecycleSendDecision;

  /// No description provided for @lifecycleNotesOptional.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get lifecycleNotesOptional;

  /// No description provided for @lifecycleUploadContractSuccess.
  ///
  /// In en, this message translates to:
  /// **'Contract uploaded'**
  String get lifecycleUploadContractSuccess;

  /// No description provided for @lifecycleUploadContractBeforeApproval.
  ///
  /// In en, this message translates to:
  /// **'Please upload the official labor contract before submitting for approval'**
  String get lifecycleUploadContractBeforeApproval;

  /// No description provided for @lifecycleFillSalaryContractDates.
  ///
  /// In en, this message translates to:
  /// **'Please fill salary, contract type, and all date milestones'**
  String get lifecycleFillSalaryContractDates;

  /// No description provided for @lifecycleApprovalSubmitSuccess.
  ///
  /// In en, this message translates to:
  /// **'Approval profile submitted'**
  String get lifecycleApprovalSubmitSuccess;

  /// No description provided for @lifecycleAlreadyDecidedHint.
  ///
  /// In en, this message translates to:
  /// **'This profile has already been approved or processed. No further decision can be submitted.'**
  String get lifecycleAlreadyDecidedHint;

  /// No description provided for @lifecycleCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Official transition complete'**
  String get lifecycleCompleteTitle;

  /// No description provided for @lifecycleCompleteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Attendance and benefits have been updated'**
  String get lifecycleCompleteSubtitle;

  /// No description provided for @lifecycleUpdateSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Updated successfully'**
  String get lifecycleUpdateSuccessTitle;

  /// No description provided for @lifecycleUpdateSuccessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Previous attendance data is preserved.'**
  String get lifecycleUpdateSuccessSubtitle;

  /// No description provided for @lifecycleOfficialDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Official date'**
  String get lifecycleOfficialDateLabel;

  /// No description provided for @lifecycleAttendanceHistoryKept.
  ///
  /// In en, this message translates to:
  /// **'Attendance history preserved'**
  String get lifecycleAttendanceHistoryKept;

  /// No description provided for @lifecycleDecisionLabel.
  ///
  /// In en, this message translates to:
  /// **'Decision'**
  String get lifecycleDecisionLabel;

  /// No description provided for @lifecycleContractTypeShort.
  ///
  /// In en, this message translates to:
  /// **'Contract type'**
  String get lifecycleContractTypeShort;

  /// No description provided for @selectPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Select...'**
  String get selectPlaceholder;

  /// No description provided for @treeCollapse.
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get treeCollapse;

  /// No description provided for @treeExpand.
  ///
  /// In en, this message translates to:
  /// **'Expand'**
  String get treeExpand;

  /// No description provided for @sessionInvalidPleaseLogin.
  ///
  /// In en, this message translates to:
  /// **'Invalid login session. Please sign in again.'**
  String get sessionInvalidPleaseLogin;

  /// No description provided for @paginationFirstPage.
  ///
  /// In en, this message translates to:
  /// **'First page'**
  String get paginationFirstPage;

  /// No description provided for @paginationPreviousPage.
  ///
  /// In en, this message translates to:
  /// **'Previous page'**
  String get paginationPreviousPage;

  /// No description provided for @paginationNextPage.
  ///
  /// In en, this message translates to:
  /// **'Next page'**
  String get paginationNextPage;

  /// No description provided for @paginationLastPage.
  ///
  /// In en, this message translates to:
  /// **'Last page'**
  String get paginationLastPage;

  /// No description provided for @wifiInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi info'**
  String get wifiInfoTitle;

  /// No description provided for @wifiSelectTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Wi-Fi'**
  String get wifiSelectTitle;

  /// No description provided for @wifiInfoLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load Wi-Fi information.'**
  String get wifiInfoLoadFailed;

  /// No description provided for @wifiPickHint.
  ///
  /// In en, this message translates to:
  /// **'Tap a network to view details, then tap Add to list.'**
  String get wifiPickHint;

  /// No description provided for @wifiSelectToViewDetail.
  ///
  /// In en, this message translates to:
  /// **'Select a Wi-Fi network to view details'**
  String get wifiSelectToViewDetail;

  /// No description provided for @wifiAddToList.
  ///
  /// In en, this message translates to:
  /// **'Add this Wi-Fi to the list'**
  String get wifiAddToList;

  /// No description provided for @wifiNoNetworks.
  ///
  /// In en, this message translates to:
  /// **'No Wi-Fi networks found.'**
  String get wifiNoNetworks;

  /// No description provided for @wifiAddedBadge.
  ///
  /// In en, this message translates to:
  /// **'Added'**
  String get wifiAddedBadge;

  /// No description provided for @wifiConnectedBadge.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get wifiConnectedBadge;

  /// No description provided for @wifiTapNetworkForDetail.
  ///
  /// In en, this message translates to:
  /// **'Tap a network in the list to view details.'**
  String get wifiTapNetworkForDetail;

  /// No description provided for @wifiBrowserNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Browsers cannot read Wi-Fi information.'**
  String get wifiBrowserNotSupported;

  /// No description provided for @wifiIosConnectedOnlyMessage.
  ///
  /// In en, this message translates to:
  /// **'iOS only shows the connected Wi-Fi network. Enable location permission and the Access WiFi Information capability.'**
  String get wifiIosConnectedOnlyMessage;

  /// No description provided for @wifiScanFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Could not scan nearby networks. Check GPS and location permission.'**
  String get wifiScanFailedMessage;

  /// No description provided for @wifiDetailSignalDbm.
  ///
  /// In en, this message translates to:
  /// **'Signal (dBm)'**
  String get wifiDetailSignalDbm;

  /// No description provided for @wifiDetailSignalQuality.
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get wifiDetailSignalQuality;

  /// No description provided for @wifiDetailFrequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency (MHz)'**
  String get wifiDetailFrequency;

  /// No description provided for @wifiDetailSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get wifiDetailSecurity;

  /// No description provided for @wifiDetailConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get wifiDetailConnected;

  /// No description provided for @wifiDetailSubnetMask.
  ///
  /// In en, this message translates to:
  /// **'Subnet mask'**
  String get wifiDetailSubnetMask;

  /// No description provided for @wifiSignalExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get wifiSignalExcellent;

  /// No description provided for @wifiSignalStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get wifiSignalStrong;

  /// No description provided for @wifiSignalFair.
  ///
  /// In en, this message translates to:
  /// **'Fair'**
  String get wifiSignalFair;

  /// No description provided for @wifiSignalWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get wifiSignalWeak;

  /// No description provided for @wifiSignalVeryWeak.
  ///
  /// In en, this message translates to:
  /// **'Very weak'**
  String get wifiSignalVeryWeak;

  /// No description provided for @commonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get commonNo;

  /// No description provided for @openWithExternalApp.
  ///
  /// In en, this message translates to:
  /// **'Open with another app'**
  String get openWithExternalApp;

  /// No description provided for @docUnsupportedInApp.
  ///
  /// In en, this message translates to:
  /// **'This file type is not supported in the app viewer.'**
  String get docUnsupportedInApp;

  /// No description provided for @docFileNotFound.
  ///
  /// In en, this message translates to:
  /// **'Document file not found.'**
  String get docFileNotFound;

  /// No description provided for @docPlatformUnsupported.
  ///
  /// In en, this message translates to:
  /// **'This platform does not support in-app document viewing.'**
  String get docPlatformUnsupported;

  /// No description provided for @docImageLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load image.'**
  String get docImageLoadFailed;

  /// No description provided for @docPdfLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load PDF.\n{error}'**
  String docPdfLoadFailed(String error);

  /// No description provided for @docEmptyDocx.
  ///
  /// In en, this message translates to:
  /// **'DOCX file is empty.'**
  String get docEmptyDocx;

  /// No description provided for @docDocxLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load DOCX.\n{error}'**
  String docDocxLoadFailed(String error);

  /// No description provided for @docOfficeViewerFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not open the document via Office Online viewer.\nThe file must be publicly accessible over HTTPS, or open it with another app.'**
  String get docOfficeViewerFailed;

  /// No description provided for @mapTapToSelectLocation.
  ///
  /// In en, this message translates to:
  /// **'Tap the map to select a location · {lat}, {lng}'**
  String mapTapToSelectLocation(String lat, String lng);

  /// No description provided for @valueSetTreeNotInitialized.
  ///
  /// In en, this message translates to:
  /// **'No ValueSet yet. Please initialize the tree first.'**
  String get valueSetTreeNotInitialized;

  /// No description provided for @valueSetTreeNotSelected.
  ///
  /// In en, this message translates to:
  /// **'No ValueSet tree selected.'**
  String get valueSetTreeNotSelected;

  /// No description provided for @valueSetTreeNotSelectedSetup.
  ///
  /// In en, this message translates to:
  /// **'No ValueSet tree selected. Please configure it first.'**
  String get valueSetTreeNotSelectedSetup;

  /// No description provided for @valueSetNodeNotSelectedForDelete.
  ///
  /// In en, this message translates to:
  /// **'No node selected for deletion.'**
  String get valueSetNodeNotSelectedForDelete;

  /// No description provided for @payrollStandardDaysInvalid.
  ///
  /// In en, this message translates to:
  /// **'Standard work days must be between 1 and 31'**
  String get payrollStandardDaysInvalid;

  /// No description provided for @payrollPeriodLockedEditStandardDays.
  ///
  /// In en, this message translates to:
  /// **'Payroll period is finalized; standard work days cannot be edited'**
  String get payrollPeriodLockedEditStandardDays;

  /// No description provided for @deliverableVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version v{version}'**
  String deliverableVersionLabel(String version);

  /// No description provided for @contractCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Code: {code}'**
  String contractCodeLabel(String code);

  /// No description provided for @contractPartnerLabel.
  ///
  /// In en, this message translates to:
  /// **'Partner: {name}'**
  String contractPartnerLabel(String name);

  /// No description provided for @contractValueLabel.
  ///
  /// In en, this message translates to:
  /// **'Value: {value}'**
  String contractValueLabel(String value);

  /// No description provided for @contractSignedDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Signed: {date}'**
  String contractSignedDateLabel(String date);

  /// No description provided for @contractExpiryDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Expires: {date}'**
  String contractExpiryDateLabel(String date);

  /// No description provided for @viewContractFile.
  ///
  /// In en, this message translates to:
  /// **'View contract file'**
  String get viewContractFile;

  /// No description provided for @customerAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Add new customer'**
  String get customerAddTitle;

  /// No description provided for @customerDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Customer details'**
  String get customerDetailTitle;

  /// No description provided for @customerEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit customer'**
  String get customerEditTitle;

  /// No description provided for @customerCreateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Customer created successfully'**
  String get customerCreateSuccess;

  /// No description provided for @customerUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Customer updated successfully'**
  String get customerUpdateSuccess;

  /// No description provided for @customerDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete customer'**
  String get customerDeleteTitle;

  /// No description provided for @customerDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\"? This action cannot be undone.'**
  String customerDeleteConfirm(String name);

  /// No description provided for @customerDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Customer deleted'**
  String get customerDeleteSuccess;

  /// No description provided for @customerLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load customer information'**
  String get customerLoadFailed;

  /// No description provided for @customerLoadDetailFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load details'**
  String get customerLoadDetailFailed;

  /// No description provided for @companyNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Company name *'**
  String get companyNameLabel;

  /// No description provided for @companyNameValidation.
  ///
  /// In en, this message translates to:
  /// **'Enter company name (at least 2 characters)'**
  String get companyNameValidation;

  /// No description provided for @contactPersonLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact person *'**
  String get contactPersonLabel;

  /// No description provided for @contactPersonValidation.
  ///
  /// In en, this message translates to:
  /// **'Enter contact person name'**
  String get contactPersonValidation;

  /// No description provided for @websiteLabel.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get websiteLabel;

  /// No description provided for @taxCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Tax ID'**
  String get taxCodeLabel;

  /// No description provided for @customerSourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Customer source'**
  String get customerSourceLabel;

  /// No description provided for @statusFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get statusFieldLabel;

  /// No description provided for @assignedStaffLabel.
  ///
  /// In en, this message translates to:
  /// **'Assigned staff'**
  String get assignedStaffLabel;

  /// No description provided for @assignedStaffEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Assigned staff email'**
  String get assignedStaffEmailLabel;

  /// No description provided for @notesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesLabel;

  /// No description provided for @notePrefix.
  ///
  /// In en, this message translates to:
  /// **'* Note: {notes}'**
  String notePrefix(String notes);

  /// No description provided for @defaultAssignMe.
  ///
  /// In en, this message translates to:
  /// **'Default (me)'**
  String get defaultAssignMe;

  /// No description provided for @unassigned.
  ///
  /// In en, this message translates to:
  /// **'Unassigned'**
  String get unassigned;

  /// No description provided for @createCustomerButton.
  ///
  /// In en, this message translates to:
  /// **'Create customer'**
  String get createCustomerButton;

  /// No description provided for @callPhone.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get callPhone;

  /// No description provided for @sourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get sourceLabel;

  /// No description provided for @createdAtLabel.
  ///
  /// In en, this message translates to:
  /// **'Created at'**
  String get createdAtLabel;

  /// No description provided for @invoiceFallbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Invoice'**
  String get invoiceFallbackTitle;

  /// No description provided for @serviceFallbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get serviceFallbackTitle;

  /// No description provided for @defaultUserName.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get defaultUserName;

  /// No description provided for @serviceHosting.
  ///
  /// In en, this message translates to:
  /// **'Hosting'**
  String get serviceHosting;

  /// No description provided for @serviceWebsite.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get serviceWebsite;

  /// No description provided for @serviceDesign.
  ///
  /// In en, this message translates to:
  /// **'Design'**
  String get serviceDesign;

  /// No description provided for @serviceChatbot.
  ///
  /// In en, this message translates to:
  /// **'Chatbot'**
  String get serviceChatbot;

  /// No description provided for @serviceSeo.
  ///
  /// In en, this message translates to:
  /// **'SEO'**
  String get serviceSeo;

  /// No description provided for @reminderInvoicePayment.
  ///
  /// In en, this message translates to:
  /// **'Invoice payment due'**
  String get reminderInvoicePayment;

  /// No description provided for @reminderServiceRenewal.
  ///
  /// In en, this message translates to:
  /// **'Service renewal'**
  String get reminderServiceRenewal;

  /// No description provided for @reminderSystem.
  ///
  /// In en, this message translates to:
  /// **'System reminder'**
  String get reminderSystem;

  /// No description provided for @workerLifecycleInitFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize lifecycle profile'**
  String get workerLifecycleInitFailed;

  /// No description provided for @workerLifecycleLoadListFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load lifecycle list'**
  String get workerLifecycleLoadListFailed;

  /// No description provided for @workerLifecycleLoadDetailFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load lifecycle details'**
  String get workerLifecycleLoadDetailFailed;

  /// No description provided for @workerLifecycleLoadDocumentsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load lifecycle documents'**
  String get workerLifecycleLoadDocumentsFailed;

  /// No description provided for @workerLifecycleMoveToEvaluateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to move to intern evaluation'**
  String get workerLifecycleMoveToEvaluateFailed;

  /// No description provided for @workerLifecycleEvaluateInternFailed.
  ///
  /// In en, this message translates to:
  /// **'Intern evaluation failed'**
  String get workerLifecycleEvaluateInternFailed;

  /// No description provided for @workerLifecycleSubmitKpiFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit KPI'**
  String get workerLifecycleSubmitKpiFailed;

  /// No description provided for @workerLifecycleApproveOfficialFailed.
  ///
  /// In en, this message translates to:
  /// **'Official approval failed'**
  String get workerLifecycleApproveOfficialFailed;

  /// No description provided for @workerLifecycleInvalidData.
  ///
  /// In en, this message translates to:
  /// **'Invalid worker lifecycle data'**
  String get workerLifecycleInvalidData;

  /// No description provided for @lateEarlyCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create late/early request'**
  String get lateEarlyCreateFailed;

  /// No description provided for @lateEarlyLoadListFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load late/early requests'**
  String get lateEarlyLoadListFailed;

  /// No description provided for @lateEarlyLoadPendingFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load pending late/early requests'**
  String get lateEarlyLoadPendingFailed;

  /// No description provided for @lateEarlyApproveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to approve late/early request'**
  String get lateEarlyApproveFailed;

  /// No description provided for @lateEarlyRejectFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to reject late/early request'**
  String get lateEarlyRejectFailed;

  /// No description provided for @lateEarlyHandleCancelFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to process late/early cancellation request'**
  String get lateEarlyHandleCancelFailed;

  /// No description provided for @lateEarlyCancelFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to cancel late/early request'**
  String get lateEarlyCancelFailed;

  /// No description provided for @lateEarlyInvalidData.
  ///
  /// In en, this message translates to:
  /// **'Invalid late/early request data'**
  String get lateEarlyInvalidData;

  /// No description provided for @workerLoadListFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load worker list'**
  String get workerLoadListFailed;

  /// No description provided for @workerLoadProfileFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load worker profile'**
  String get workerLoadProfileFailed;

  /// No description provided for @workerLoadDetailFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load worker details'**
  String get workerLoadDetailFailed;

  /// No description provided for @workerLoadDeptMembersFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load department members'**
  String get workerLoadDeptMembersFailed;

  /// No description provided for @workerCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create worker'**
  String get workerCreateFailed;

  /// No description provided for @workerUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update worker'**
  String get workerUpdateFailed;

  /// No description provided for @staffLoadDashboardFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load dashboard'**
  String get staffLoadDashboardFailed;

  /// No description provided for @staffLoadTasksFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load task list'**
  String get staffLoadTasksFailed;

  /// No description provided for @staffUpdateTaskStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update status'**
  String get staffUpdateTaskStatusFailed;

  /// No description provided for @staffLoadLeadsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load sales funnel'**
  String get staffLoadLeadsFailed;

  /// No description provided for @staffUpdateLeadStageFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update stage'**
  String get staffUpdateLeadStageFailed;

  /// No description provided for @staffLoadContractsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load contract list'**
  String get staffLoadContractsFailed;

  /// No description provided for @staffLoadCustomersFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load customer directory'**
  String get staffLoadCustomersFailed;

  /// No description provided for @staffCreateCustomerFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create customer'**
  String get staffCreateCustomerFailed;

  /// No description provided for @staffLoadCustomerDetailFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load customer details'**
  String get staffLoadCustomerDetailFailed;

  /// No description provided for @staffUpdateCustomerFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update customer'**
  String get staffUpdateCustomerFailed;

  /// No description provided for @staffDeleteCustomerFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete customer'**
  String get staffDeleteCustomerFailed;

  /// No description provided for @staffLoadTeamFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load team directory'**
  String get staffLoadTeamFailed;

  /// No description provided for @staffLoadTeamMembersFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load team member list'**
  String get staffLoadTeamMembersFailed;

  /// No description provided for @staffUpdateRoleFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update role'**
  String get staffUpdateRoleFailed;

  /// No description provided for @staffLoadProfileFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load profile'**
  String get staffLoadProfileFailed;

  /// No description provided for @staffUpdateProfileFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update profile'**
  String get staffUpdateProfileFailed;

  /// No description provided for @staffLoadDeliverablesFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load deliverable list'**
  String get staffLoadDeliverablesFailed;

  /// No description provided for @staffLoadAttendanceFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load attendance'**
  String get staffLoadAttendanceFailed;

  /// No description provided for @staffCustomerNotFound.
  ///
  /// In en, this message translates to:
  /// **'Customer not found'**
  String get staffCustomerNotFound;

  /// No description provided for @customerLoadServicesFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load service list'**
  String get customerLoadServicesFailed;

  /// No description provided for @customerLoadInvoicesFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load invoice list'**
  String get customerLoadInvoicesFailed;

  /// No description provided for @customerLoadPromotionsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load promotion packages'**
  String get customerLoadPromotionsFailed;

  /// No description provided for @customerLoadDashboardFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load dashboard data'**
  String get customerLoadDashboardFailed;

  /// No description provided for @customerLoadTicketsFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load ticket list'**
  String get customerLoadTicketsFailed;

  /// No description provided for @customerCreateTicketFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create ticket'**
  String get customerCreateTicketFailed;

  /// No description provided for @customerLoadTicketDetailFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load ticket details'**
  String get customerLoadTicketDetailFailed;

  /// No description provided for @customerLoadTicketMessagesFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load messages'**
  String get customerLoadTicketMessagesFailed;

  /// No description provided for @customerSendTicketMessageFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to send message'**
  String get customerSendTicketMessageFailed;

  /// No description provided for @customerUpdateTicketStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update status'**
  String get customerUpdateTicketStatusFailed;

  /// No description provided for @authLoginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get authLoginFailed;

  /// No description provided for @authRegisterFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration failed'**
  String get authRegisterFailed;

  /// No description provided for @authSendOtpFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to send OTP code'**
  String get authSendOtpFailed;

  /// No description provided for @authResetPasswordFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to change password'**
  String get authResetPasswordFailed;

  /// No description provided for @authSessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Login session expired'**
  String get authSessionExpired;

  /// No description provided for @authRestoreSessionFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to restore session'**
  String get authRestoreSessionFailed;

  /// No description provided for @menuLoadListFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load menu list'**
  String get menuLoadListFailed;

  /// No description provided for @menuLoadMyMenusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load your menus'**
  String get menuLoadMyMenusFailed;

  /// No description provided for @menuCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create menu'**
  String get menuCreateFailed;

  /// No description provided for @menuUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update menu'**
  String get menuUpdateFailed;

  /// No description provided for @menuDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete menu'**
  String get menuDeleteFailed;

  /// No description provided for @workflowLoadListFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load approval workflows'**
  String get workflowLoadListFailed;

  /// No description provided for @workflowLoadDetailFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load workflow details'**
  String get workflowLoadDetailFailed;

  /// No description provided for @workflowNotFound.
  ///
  /// In en, this message translates to:
  /// **'Approval workflow not found'**
  String get workflowNotFound;

  /// No description provided for @workflowCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create approval workflow'**
  String get workflowCreateFailed;

  /// No description provided for @workflowAssignDeptFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to assign department'**
  String get workflowAssignDeptFailed;

  /// No description provided for @workflowDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete approval workflow'**
  String get workflowDeleteFailed;

  /// No description provided for @valueSetTreeInitFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize ValueSet tree'**
  String get valueSetTreeInitFailed;

  /// No description provided for @valueSetTreeInitSetupFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize tree'**
  String get valueSetTreeInitSetupFailed;

  /// No description provided for @valueSetNodeCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create node'**
  String get valueSetNodeCreateFailed;

  /// No description provided for @valueSetTreeLoadListFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load tree list'**
  String get valueSetTreeLoadListFailed;

  /// No description provided for @valueSetTreeUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update tree'**
  String get valueSetTreeUpdateFailed;

  /// No description provided for @valueSetTreeDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete tree'**
  String get valueSetTreeDeleteFailed;

  /// No description provided for @valueSetTreeLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load tree {setCode}'**
  String valueSetTreeLoadFailed(String setCode);

  /// No description provided for @valueSetTreeLoadNodesFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load node list {setCode}'**
  String valueSetTreeLoadNodesFailed(String setCode);

  /// No description provided for @valueSetNodeLoadListFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load node list'**
  String get valueSetNodeLoadListFailed;

  /// No description provided for @valueSetNodeNotFound.
  ///
  /// In en, this message translates to:
  /// **'Node not found'**
  String get valueSetNodeNotFound;

  /// No description provided for @valueSetNodeUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update node'**
  String get valueSetNodeUpdateFailed;

  /// No description provided for @valueSetNodeDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete node'**
  String get valueSetNodeDeleteFailed;

  /// No description provided for @valueSetNodeAssignMenuFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to assign menu to node'**
  String get valueSetNodeAssignMenuFailed;

  /// No description provided for @workerDocumentFieldLoadListFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load document field list'**
  String get workerDocumentFieldLoadListFailed;

  /// No description provided for @workerDocumentFieldCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create document field'**
  String get workerDocumentFieldCreateFailed;

  /// No description provided for @workerDocumentFieldUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update document field'**
  String get workerDocumentFieldUpdateFailed;

  /// No description provided for @workerDocumentFieldDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete document field'**
  String get workerDocumentFieldDeleteFailed;

  /// No description provided for @workerDocumentFieldLoadWorkerFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load worker document fields'**
  String get workerDocumentFieldLoadWorkerFailed;

  /// No description provided for @workerDocumentFileNotFound.
  ///
  /// In en, this message translates to:
  /// **'File not found: {filePath}'**
  String workerDocumentFileNotFound(String filePath);

  /// No description provided for @workerDocumentUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload document'**
  String get workerDocumentUploadFailed;

  /// No description provided for @workerDocumentClearValueFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to clear document field value'**
  String get workerDocumentClearValueFailed;

  /// No description provided for @notificationLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load notifications'**
  String get notificationLoadFailed;

  /// No description provided for @notificationLoadUnreadCountFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load unread notification count'**
  String get notificationLoadUnreadCountFailed;

  /// No description provided for @notificationMarkReadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to mark as read'**
  String get notificationMarkReadFailed;

  /// No description provided for @notificationMarkAllReadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to mark all as read'**
  String get notificationMarkAllReadFailed;

  /// No description provided for @notificationDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete notification'**
  String get notificationDeleteFailed;

  /// No description provided for @adminDeleteDeviceFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete device'**
  String get adminDeleteDeviceFailed;
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
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
