// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get billCalculator => 'Calculateur de Facture';

  @override
  String get settings => 'Paramètres';

  @override
  String get selectBillType => 'Sélectionnez le type de facture';

  @override
  String get electricity => 'Électricité';

  @override
  String get water => 'Eau';

  @override
  String get electricityBillCalculator =>
      'Calculateur de Facture d\'Électricité';

  @override
  String get waterBillCalculator => 'Calculateur de Facture d\'Eau';

  @override
  String get enterMeterReadings => 'Entrez les relevés de compteur';

  @override
  String oldReading(Object unit) {
    return 'Ancien Relevé ($unit)';
  }

  @override
  String newReading(Object unit) {
    return 'Nouveau Relevé ($unit)';
  }

  @override
  String get pleaseEnterOldReading => 'Veuillez entrer l\'ancien relevé';

  @override
  String get pleaseEnterNewReading => 'Veuillez entrer le nouveau relevé';

  @override
  String get pleaseEnterAValidNumber => 'Veuillez entrer un nombre valide';

  @override
  String get calculate => 'Calculer';

  @override
  String get errorNewReading =>
      'Erreur : Le nouveau relevé doit être supérieur à l\'ancien';

  @override
  String get consumption => 'Consommation';

  @override
  String get pu => 'PU';

  @override
  String get consumptionCost => 'Coût de la consommation';

  @override
  String get redevanceFixe => 'Redevance Fixe';

  @override
  String get subtotal => 'Sous-total';

  @override
  String get tva => 'TVA';

  @override
  String get total => 'Total';

  @override
  String get tranche1 => 'Tranche 1';

  @override
  String get tranche2 => 'Tranche 2';

  @override
  String get waterCost => 'Coût de l\'eau';

  @override
  String get assainissement => 'Assainissement';

  @override
  String get theme => 'Thème';

  @override
  String get systemDefault => 'Défaut du système';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get electricitySettings => 'Paramètres d\'électricité';

  @override
  String get redevanceFixeElectricite => 'Redevance Fixe Électricité (DH)';

  @override
  String get redevanceFixeFacture => 'Redevance Fixe Facture';

  @override
  String get waterSettings => 'Paramètres de l\'eau';

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
  String get language => 'Langue';
}
