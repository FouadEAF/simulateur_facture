import 'package:flutter/material.dart';

class AppLocalizationsManual {
  final Locale locale;

  AppLocalizationsManual(this.locale);

  static AppLocalizationsManual of(BuildContext context) {
    return Localizations.of<AppLocalizationsManual>(context, AppLocalizationsManual)!;
  }

  static const _AppLocalizationsDelegate delegate = _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'billCalculator': 'Bill Calculator',
      'settings': 'Settings',
      'selectBillType': 'Select Bill Type',
      'electricity': 'Electricity',
      'water': 'Water',
      'oldReading': 'Old Reading',
      'newReading': 'New Reading',
      'electricityBillCalculator': 'Electricity Bill Calculator',
      'waterBillCalculator': 'Water Bill Calculator',
      'enterMeterReadings': 'Enter Meter Readings',
      'pleaseEnterOldReading': 'Please enter the old reading',
      'pleaseEnterNewReading': 'Please enter the new reading',
      'pleaseEnterAValidNumber': 'Please enter a valid number',
      'calculate': 'Calculate',
      'errorNewReading': 'Error: New reading must be greater than old reading',
      'consumption': 'Consumption',
      'pu': 'PU',
      'consumptionCost': 'Consumption Cost',
      'redevanceFixe': 'Redevance Fixe',
      'subtotal': 'Subtotal',
      'tva': 'TVA',
      'total': 'Total',
      'tranche1': 'Tranche 1',
      'tranche2': 'Tranche 2',
      'tranche3': 'Tranche 3',
      'waterCost': 'Water Cost',
      'assainissement': 'Assainissement',
      'theme': 'Theme',
      'systemDefault': 'System Default',
      'light': 'Light',
      'dark': 'Dark',
      'electricitySettings': 'Electricity Settings',
      'redevanceFixeElectricite': 'Redevance Fixe Electricité (DH)',
      'redevanceFixeFacture': 'Redevance Fixe Facture',
      'waterSettings': 'Water Settings',
      'puTranche1': 'PU Tranche 1 (DH/m³)',
      'puTranche2': 'PU Tranche 2 (DH/m³)',
      'puTranche3': 'PU Tranche 3 (DH/m³)',
      'redevanceFixeEau': 'Redevance Fixe Eau (DH)',
      'assainissementTranche1': 'Assainissement Tranche 1 (DH/m³)',
      'assainissementTranche2': 'Assainissement Tranche 2 (DH/m³)',
      'assainissementTranche3': 'Assainissement Tranche 3 (DH/m³)',
      'redevanceFixeAssainissement': 'Redevance Fixe Assainissement (DH)',
      'language': 'Language',
      'about': 'About',
      'developer': 'Developer',
      'email': 'Email',
      'phone': 'Phone',
      'appDescription': 'A utility app to calculate electricity and water bills based on consumption and tariff rates.',
    },
    'fr': {
      'billCalculator': 'Calculateur de Facture',
      'settings': 'Paramètres',
      'selectBillType': 'Sélectionnez le type de facture',
      'electricity': 'Électricité',
      'water': 'Eau',
      'oldReading': 'Ancien relevé',
      'newReading': 'Nouveau relevé',
      'electricityBillCalculator': 'Calculateur de Facture d\'Électricité',
      'waterBillCalculator': 'Calculateur de Facture d\'Eau',
      'enterMeterReadings': 'Entrez les relevés de compteur',
      'pleaseEnterOldReading': 'Veuillez entrer l\'ancien relevé',
      'pleaseEnterNewReading': 'Veuillez entrer le nouveau relevé',
      'pleaseEnterAValidNumber': 'Veuillez entrer un nombre valide',
      'calculate': 'Calculer',
      'errorNewReading': 'Erreur : Le nouveau relevé doit être supérieur à l\'ancien',
      'consumption': 'Consommation',
      'pu': 'PU',
      'consumptionCost': 'Coût de la consommation',
      'redevanceFixe': 'Redevance Fixe',
      'subtotal': 'Sous-total',
      'tva': 'TVA',
      'total': 'Total',
      'tranche1': 'Tranche 1',
      'tranche2': 'Tranche 2',
      'tranche3': 'Tranche 3',
      'waterCost': 'Coût de l\'eau',
      'assainissement': 'Assainissement',
      'theme': 'Thème',
      'systemDefault': 'Défaut du système',
      'light': 'Clair',
      'dark': 'Sombre',
      'electricitySettings': 'Paramètres d\'électricité',
      'redevanceFixeElectricite': 'Redevance Fixe Électricité (DH)',
      'redevanceFixeFacture': 'Redevance Fixe Facture',
      'waterSettings': 'Paramètres de l\'eau',
      'puTranche1': 'PU Tranche 1 (DH/m³)',
      'puTranche2': 'PU Tranche 2 (DH/m³)',
      'puTranche3': 'PU Tranche 3 (DH/m³)',
      'redevanceFixeEau': 'Redevance Fixe Eau (DH)',
      'assainissementTranche1': 'Assainissement Tranche 1 (DH/m³)',
      'assainissementTranche2': 'Assainissement Tranche 2 (DH/m³)',
      'assainissementTranche3': 'Assainissement Tranche 3 (DH/m³)',
      'redevanceFixeAssainissement': 'Redevance Fixe Assainissement (DH)',
      'language': 'Langue',
      'about': 'À propos',
      'developer': 'Développeur',
      'email': 'Email',
      'phone': 'Téléphone',
      'appDescription': 'Une application utilitaire pour calculer les factures d\'électricité et d\'eau basée sur la consommation et les tarifs.',
    },
    'ar': {
      'billCalculator': 'حاسبة الفواتير',
      'settings': 'الإعدادات',
      'selectBillType': 'اختر نوع الفاتورة',
      'electricity': 'الكهرباء',
      'water': 'الماء',
      'oldReading': 'القراءة القديمة',
      'newReading': 'القراءة الجديدة',
      'electricityBillCalculator': 'حاسبة فاتورة الكهرباء',
      'waterBillCalculator': 'حاسبة فاتورة الماء',
      'enterMeterReadings': 'أدخل قراءات العداد',
      'pleaseEnterOldReading': 'الرجاء إدخال القراءة القديمة',
      'pleaseEnterNewReading': 'الرجاء إدخال القراءة الجديدة',
      'pleaseEnterAValidNumber': 'الرجاء إدخال رقم صحيح',
      'calculate': 'احسب',
      'errorNewReading': 'خطأ: يجب أن تكون القراءة الجديدة أكبر من القراءة القديمة',
      'consumption': 'الاستهلاك',
      'pu': 'سعر الوحدة',
      'consumptionCost': 'تكلفة الاستهلاك',
      'redevanceFixe': 'الإتاوة الثابتة',
      'subtotal': 'المجموع الفرعي',
      'tva': 'ضريبة القيمة المضافة',
      'total': 'المجموع',
      'tranche1': 'الشطر 1',
      'tranche2': 'الشطر 2',
      'tranche3': 'الشطر 3',
      'waterCost': 'تكلفة الماء',
      'assainissement': 'التطهير',
      'theme': 'المظهر',
      'systemDefault': 'افتراضي النظام',
      'light': 'فاتح',
      'dark': 'داكن',
      'electricitySettings': 'إعدادات الكهرباء',
      'redevanceFixeElectricite': 'الإتاوة الثابتة للكهرباء (درهم)',
      'redevanceFixeFacture': 'الإتاوة الثابتة للفاتورة',
      'waterSettings': 'إعدادات الماء',
      'puTranche1': 'سعر الوحدة الشطر 1 (درهم/م³)',
      'puTranche2': 'سعر الوحدة الشطر 2 (درهم/م³)',
      'puTranche3': 'سعر الوحدة الشطر 3 (درهم/م³)',
      'redevanceFixeEau': 'الإتاوة الثابتة للماء (درهم)',
      'assainissementTranche1': 'التطهير الشطر 1 (درهم/م³)',
      'assainissementTranche2': 'التطهير الشطر 2 (درهم/م³)',
      'assainissementTranche3': 'التطهير الشطر 3 (درهم/م³)',
      'redevanceFixeAssainissement': 'الإتاوة الثابتة للتطهير (درهم)',
      'language': 'اللغة',
      'about': 'حول التطبيق',
      'developer': 'المطور',
      'email': 'البريد الإلكتروني',
      'phone': 'الهاتف',
      'appDescription': 'تطبيق مساعد لحساب فواتير الكهرباء والماء بناءً على الاستهلاك وأسعار التعريفة.',
    },
  };

  String get billCalculator => _localizedValues[locale.languageCode]!['billCalculator']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get selectBillType => _localizedValues[locale.languageCode]!['selectBillType']!;
  String get electricity => _localizedValues[locale.languageCode]!['electricity']!;
  String get water => _localizedValues[locale.languageCode]!['water']!;
  String get electricityBillCalculator => _localizedValues[locale.languageCode]!['electricityBillCalculator']!;
  String get waterBillCalculator => _localizedValues[locale.languageCode]!['waterBillCalculator']!;
  String get enterMeterReadings => _localizedValues[locale.languageCode]!['enterMeterReadings']!;
  String oldReading(String unit) => '${_localizedValues[locale.languageCode]!['oldReading']!} ($unit)';
  String newReading(String unit) => '${_localizedValues[locale.languageCode]!['newReading']!} ($unit)';
  String get pleaseEnterOldReading => _localizedValues[locale.languageCode]!['pleaseEnterOldReading']!;
  String get pleaseEnterNewReading => _localizedValues[locale.languageCode]!['pleaseEnterNewReading']!;
  String get pleaseEnterAValidNumber => _localizedValues[locale.languageCode]!['pleaseEnterAValidNumber']!;
  String get calculate => _localizedValues[locale.languageCode]!['calculate']!;
  String get errorNewReading => _localizedValues[locale.languageCode]!['errorNewReading']!;
  String get consumption => _localizedValues[locale.languageCode]!['consumption']!;
  String get pu => _localizedValues[locale.languageCode]!['pu']!;
  String get consumptionCost => _localizedValues[locale.languageCode]!['consumptionCost']!;
  String get redevanceFixe => _localizedValues[locale.languageCode]!['redevanceFixe']!;
  String get subtotal => _localizedValues[locale.languageCode]!['subtotal']!;
  String get tva => _localizedValues[locale.languageCode]!['tva']!;
  String get total => _localizedValues[locale.languageCode]!['total']!;
  String get tranche1 => _localizedValues[locale.languageCode]!['tranche1']!;
  String get tranche2 => _localizedValues[locale.languageCode]!['tranche2']!;
  String get tranche3 => _localizedValues[locale.languageCode]!['tranche3']!;
  String get waterCost => _localizedValues[locale.languageCode]!['waterCost']!;
  String get assainissement => _localizedValues[locale.languageCode]!['assainissement']!;
  String get theme => _localizedValues[locale.languageCode]!['theme']!;
  String get systemDefault => _localizedValues[locale.languageCode]!['systemDefault']!;
  String get light => _localizedValues[locale.languageCode]!['light']!;
  String get dark => _localizedValues[locale.languageCode]!['dark']!;
  String get electricitySettings => _localizedValues[locale.languageCode]!['electricitySettings']!;
  String get redevanceFixeElectricite => _localizedValues[locale.languageCode]!['redevanceFixeElectricite']!;
  String get redevanceFixeFacture => _localizedValues[locale.languageCode]!['redevanceFixeFacture']!;
  String get waterSettings => _localizedValues[locale.languageCode]!['waterSettings']!;
  String get puTranche1 => _localizedValues[locale.languageCode]!['puTranche1']!;
  String get puTranche2 => _localizedValues[locale.languageCode]!['puTranche2']!;
  String get puTranche3 => _localizedValues[locale.languageCode]!['puTranche3']!;
  String get redevanceFixeEau => _localizedValues[locale.languageCode]!['redevanceFixeEau']!;
  String get assainissementTranche1 => _localizedValues[locale.languageCode]!['assainissementTranche1']!;
  String get assainissementTranche2 => _localizedValues[locale.languageCode]!['assainissementTranche2']!;
  String get assainissementTranche3 => _localizedValues[locale.languageCode]!['assainissementTranche3']!;
  String get redevanceFixeAssainissement => _localizedValues[locale.languageCode]!['redevanceFixeAssainissement']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get about => _localizedValues[locale.languageCode]!['about']!;
  String get developer => _localizedValues[locale.languageCode]?['developer'] ?? 'Developer';
  String get email => _localizedValues[locale.languageCode]?['email'] ?? 'Email';
  String get phone => _localizedValues[locale.languageCode]?['phone'] ?? 'Phone';
  String get appDescription => _localizedValues[locale.languageCode]?['appDescription'] ?? 'A utility app to calculate electricity and water bills based on consumption and tariff rates.';
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizationsManual> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizationsManual> load(Locale locale) async {
    return AppLocalizationsManual(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}