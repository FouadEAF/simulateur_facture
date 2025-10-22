// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get billCalculator => 'حاسبة الفواتير';

  @override
  String get settings => 'الإعدادات';

  @override
  String get selectBillType => 'اختر نوع الفاتورة';

  @override
  String get electricity => 'الكهرباء';

  @override
  String get water => 'الماء';

  @override
  String get electricityBillCalculator => 'حاسبة فاتورة الكهرباء';

  @override
  String get waterBillCalculator => 'حاسبة فاتورة الماء';

  @override
  String get enterMeterReadings => 'أدخل قراءات العداد';

  @override
  String oldReading(Object unit) {
    return 'القراءة القديمة ($unit)';
  }

  @override
  String newReading(Object unit) {
    return 'القراءة الجديدة ($unit)';
  }

  @override
  String get pleaseEnterOldReading => 'الرجاء إدخال القراءة القديمة';

  @override
  String get pleaseEnterNewReading => 'الرجاء إدخال القراءة الجديدة';

  @override
  String get pleaseEnterAValidNumber => 'الرجاء إدخال رقم صحيح';

  @override
  String get calculate => 'احسب';

  @override
  String get errorNewReading =>
      'خطأ: يجب أن تكون القراءة الجديدة أكبر من القراءة القديمة';

  @override
  String get consumption => 'الاستهلاك';

  @override
  String get pu => 'سعر الوحدة';

  @override
  String get consumptionCost => 'تكلفة الاستهلاك';

  @override
  String get redevanceFixe => 'الإتاوة الثابتة';

  @override
  String get subtotal => 'المجموع الفرعي';

  @override
  String get tva => 'ضريبة القيمة المضافة';

  @override
  String get total => 'المجموع';

  @override
  String get tranche1 => 'الشطر 1';

  @override
  String get tranche2 => 'الشطر 2';

  @override
  String get waterCost => 'تكلفة الماء';

  @override
  String get assainissement => 'التطهير';

  @override
  String get theme => 'المظهر';

  @override
  String get systemDefault => 'افتراضي النظام';

  @override
  String get light => 'فاتح';

  @override
  String get dark => 'داكن';

  @override
  String get electricitySettings => 'إعدادات الكهرباء';

  @override
  String get redevanceFixeElectricite => 'الإتاوة الثابتة للكهرباء (درهم)';

  @override
  String get redevanceFixeFacture => 'الإتاوة الثابتة للفاتورة';

  @override
  String get waterSettings => 'إعدادات الماء';

  @override
  String get puTranche1 => 'سعر الوحدة الشطر 1 (درهم/م³)';

  @override
  String get puTranche2 => 'سعر الوحدة الشطر 2 (درهم/م³)';

  @override
  String get redevanceFixeEau => 'الإتاوة الثابتة للماء (درهم)';

  @override
  String get assainissementTranche1 => 'التطهير الشطر 1 (درهم/م³)';

  @override
  String get assainissementTranche2 => 'التطهير الشطر 2 (درهم/م³)';

  @override
  String get redevanceFixeAssainissement => 'الإتاوة الثابتة للتطهير (درهم)';

  @override
  String get language => 'اللغة';
}
