// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get billCalculator => 'Bill Calculator';

  @override
  String get settings => 'Settings';

  @override
  String get selectBillType => 'Select Bill Type';

  @override
  String get electricity => 'Electricity';

  @override
  String get water => 'Water';

  @override
  String get electricityBillCalculator => 'Electricity Bill Calculator';

  @override
  String get waterBillCalculator => 'Water Bill Calculator';

  @override
  String get enterMeterReadings => 'Enter Meter Readings';

  @override
  String oldReading(Object unit) {
    return 'Old Reading ($unit)';
  }

  @override
  String newReading(Object unit) {
    return 'New Reading ($unit)';
  }

  @override
  String get pleaseEnterOldReading => 'Please enter the old reading';

  @override
  String get pleaseEnterNewReading => 'Please enter the new reading';

  @override
  String get pleaseEnterAValidNumber => 'Please enter a valid number';

  @override
  String get calculate => 'Calculate';

  @override
  String get errorNewReading =>
      'Error: New reading must be greater than old reading';

  @override
  String get consumption => 'Consumption';

  @override
  String get pu => 'PU';

  @override
  String get consumptionCost => 'Consumption Cost';

  @override
  String get redevanceFixe => 'Redevance Fixe';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get tva => 'TVA';

  @override
  String get total => 'Total';

  @override
  String get tranche1 => 'Tranche 1';

  @override
  String get tranche2 => 'Tranche 2';

  @override
  String get waterCost => 'Water Cost';

  @override
  String get assainissement => 'Assainissement';

  @override
  String get theme => 'Theme';

  @override
  String get systemDefault => 'System Default';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get electricitySettings => 'Electricity Settings';

  @override
  String get redevanceFixeElectricite => 'Redevance Fixe Electricité (DH)';

  @override
  String get redevanceFixeFacture => 'Redevance Fixe Facture';

  @override
  String get waterSettings => 'Water Settings';

  @override
  String get puTranche1 => 'PU Tranche 1 (DH/m³)';

  @override
  String get puTranche2 => 'PU Tranche 2 (DH/m³)';

  @override
  String get redevanceFixeEau => 'Redevance Fixe Eau (DH)';

  @override
  String get assainissementTranche1 => 'Assainissement Tranche 1 (DH/m³)';

  @override
  String get assainissementTranche2 => 'Assainissement Tranche 2 (DH/m³)';

  @override
  String get redevanceFixeAssainissement =>
      'Redevance Fixe Assainissement (DH)';

  @override
  String get language => 'Language';
}
