import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @billCalculator.
  ///
  /// In en, this message translates to:
  /// **'Bill Calculator'**
  String get billCalculator;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @selectBillType.
  ///
  /// In en, this message translates to:
  /// **'Select Bill Type'**
  String get selectBillType;

  /// No description provided for @electricity.
  ///
  /// In en, this message translates to:
  /// **'Electricity'**
  String get electricity;

  /// No description provided for @water.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get water;

  /// No description provided for @electricityBillCalculator.
  ///
  /// In en, this message translates to:
  /// **'Electricity Bill Calculator'**
  String get electricityBillCalculator;

  /// No description provided for @waterBillCalculator.
  ///
  /// In en, this message translates to:
  /// **'Water Bill Calculator'**
  String get waterBillCalculator;

  /// No description provided for @enterMeterReadings.
  ///
  /// In en, this message translates to:
  /// **'Enter Meter Readings'**
  String get enterMeterReadings;

  /// No description provided for @oldReading.
  ///
  /// In en, this message translates to:
  /// **'Old Reading ({unit})'**
  String oldReading(Object unit);

  /// No description provided for @newReading.
  ///
  /// In en, this message translates to:
  /// **'New Reading ({unit})'**
  String newReading(Object unit);

  /// No description provided for @pleaseEnterOldReading.
  ///
  /// In en, this message translates to:
  /// **'Please enter the old reading'**
  String get pleaseEnterOldReading;

  /// No description provided for @pleaseEnterNewReading.
  ///
  /// In en, this message translates to:
  /// **'Please enter the new reading'**
  String get pleaseEnterNewReading;

  /// No description provided for @pleaseEnterAValidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get pleaseEnterAValidNumber;

  /// No description provided for @calculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculate;

  /// No description provided for @errorNewReading.
  ///
  /// In en, this message translates to:
  /// **'Error: New reading must be greater than old reading'**
  String get errorNewReading;

  /// No description provided for @consumption.
  ///
  /// In en, this message translates to:
  /// **'Consumption'**
  String get consumption;

  /// No description provided for @pu.
  ///
  /// In en, this message translates to:
  /// **'PU'**
  String get pu;

  /// No description provided for @consumptionCost.
  ///
  /// In en, this message translates to:
  /// **'Consumption Cost'**
  String get consumptionCost;

  /// No description provided for @redevanceFixe.
  ///
  /// In en, this message translates to:
  /// **'Redevance Fixe'**
  String get redevanceFixe;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @tva.
  ///
  /// In en, this message translates to:
  /// **'TVA'**
  String get tva;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @tranche1.
  ///
  /// In en, this message translates to:
  /// **'Tranche 1'**
  String get tranche1;

  /// No description provided for @tranche2.
  ///
  /// In en, this message translates to:
  /// **'Tranche 2'**
  String get tranche2;

  /// No description provided for @waterCost.
  ///
  /// In en, this message translates to:
  /// **'Water Cost'**
  String get waterCost;

  /// No description provided for @assainissement.
  ///
  /// In en, this message translates to:
  /// **'Assainissement'**
  String get assainissement;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @electricitySettings.
  ///
  /// In en, this message translates to:
  /// **'Electricity Settings'**
  String get electricitySettings;

  /// No description provided for @redevanceFixeElectricite.
  ///
  /// In en, this message translates to:
  /// **'Redevance Fixe Electricité (DH)'**
  String get redevanceFixeElectricite;

  /// No description provided for @redevanceFixeFacture.
  ///
  /// In en, this message translates to:
  /// **'Redevance Fixe Facture'**
  String get redevanceFixeFacture;

  /// No description provided for @waterSettings.
  ///
  /// In en, this message translates to:
  /// **'Water Settings'**
  String get waterSettings;

  /// No description provided for @puTranche1.
  ///
  /// In en, this message translates to:
  /// **'PU Tranche 1 (DH/m³)'**
  String get puTranche1;

  /// No description provided for @puTranche2.
  ///
  /// In en, this message translates to:
  /// **'PU Tranche 2 (DH/m³)'**
  String get puTranche2;

  /// No description provided for @redevanceFixeEau.
  ///
  /// In en, this message translates to:
  /// **'Redevance Fixe Eau (DH)'**
  String get redevanceFixeEau;

  /// No description provided for @assainissementTranche1.
  ///
  /// In en, this message translates to:
  /// **'Assainissement Tranche 1 (DH/m³)'**
  String get assainissementTranche1;

  /// No description provided for @assainissementTranche2.
  ///
  /// In en, this message translates to:
  /// **'Assainissement Tranche 2 (DH/m³)'**
  String get assainissementTranche2;

  /// No description provided for @redevanceFixeAssainissement.
  ///
  /// In en, this message translates to:
  /// **'Redevance Fixe Assainissement (DH)'**
  String get redevanceFixeAssainissement;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;
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
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
