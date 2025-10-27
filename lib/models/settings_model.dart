import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsModel extends ChangeNotifier {
  ThemeMode? _themeMode;
  Locale? _appLocale;

  // Electricity settings
  double? _electricityPUTranche1;
  double? _electricityPUTranche2;
  double? _electricityPUTranche3;
  double? _electricityPUTranche4;
  double? _electricityPUTranche5;
  double? _electricityPUTranche6;
  double? _electricityRedevanceFixe;
  int? _electricityRedevanceFacture;
  double? _electricityTVA;
  double? _electricityTPPAN;

  // Water settings
  double? _waterPUTranche1;
  double? _waterPUTranche2;
  double? _waterPUTranche3;
  double? _waterPUTranche4;
  double? _waterPUTranche5;
  double? _waterRedevanceFixe;

  // Sanitation settings
  double? _assainissementTranche1;
  double? _assainissementTranche2;
  double? _assainissementTranche3;
  double? _assainissementTranche4;
  double? _assainissementTranche5;
  double? _assainissementRedevanceFixe;
  double? _waterTVA;

  // Getters with default values
  ThemeMode get themeMode => _themeMode ?? ThemeMode.system;
  Locale? get appLocale => _appLocale ?? const Locale('en');

  // Electricity getters
  double get electricityPUTranche1 => _electricityPUTranche1 ?? 0.80;
  double get electricityPUTranche2 => _electricityPUTranche2 ?? 0.90;
  double get electricityPUTranche3 => _electricityPUTranche3 ?? 1.00;
  double get electricityPUTranche4 => _electricityPUTranche4 ?? 1.00;
  double get electricityPUTranche5 => _electricityPUTranche5 ?? 1.00;
  double get electricityPUTranche6 => _electricityPUTranche6 ?? 1.00;
  double get electricityRedevanceFixe => _electricityRedevanceFixe ?? 7.22;
  int get electricityRedevanceFacture => _electricityRedevanceFacture ?? 1;
  double get electricityTVA => _electricityTVA ?? 27.75;
  double get electricityTPPAN => _electricityTPPAN ?? 0.00;

  // Water getters
  double get waterPUTranche1 => _waterPUTranche1 ?? 2.553500;
  double get waterPUTranche2 => _waterPUTranche2 ?? 7.739200;
  double get waterPUTranche3 => _waterPUTranche3 ?? 1.000000;
  double get waterPUTranche4 => _waterPUTranche4 ?? 1.000000;
  double get waterPUTranche5 => _waterPUTranche5 ?? 1.000000;
  double get waterRedevanceFixe => _waterRedevanceFixe ?? 8.55;

  // Sanitation getters
  double get assainissementTranche1 => _assainissementTranche1 ?? 0.840100;
  double get assainissementTranche2 => _assainissementTranche2 ?? 1.734200;
  double get assainissementTranche3 => _assainissementTranche3 ?? 1.000000;
  double get assainissementTranche4 => _assainissementTranche4 ?? 1.000000;
  double get assainissementTranche5 => _assainissementTranche5 ?? 1.000000;
  double get assainissementRedevanceFixe => _assainissementRedevanceFixe ?? 5.00;
  double get waterTVA => _waterTVA ?? 0.00;

  SettingsModel() {
    // The init() method will load saved preferences.
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();

    _themeMode = ThemeMode.values[prefs.getInt('themeMode') ?? ThemeMode.system.index];

    final String? langCode = prefs.getString('appLocale');
    if (langCode != null && langCode.isNotEmpty) {
      _appLocale = Locale(langCode);
    } else {
      _appLocale = const Locale('en');
    }

    // Load settings, they will remain null if not in prefs, getters will provide defaults
    _electricityPUTranche1 = prefs.getDouble('electricityPUTranche1');
    _electricityPUTranche2 = prefs.getDouble('electricityPUTranche2');
    _electricityPUTranche3 = prefs.getDouble('electricityPUTranche3');
    _electricityPUTranche4 = prefs.getDouble('electricityPUTranche4');
    _electricityPUTranche5 = prefs.getDouble('electricityPUTranche5');
    _electricityPUTranche6 = prefs.getDouble('electricityPUTranche6');
    _electricityRedevanceFixe = prefs.getDouble('electricityRedevanceFixe');
    _electricityRedevanceFacture = prefs.getInt('electricityRedevanceFacture');
    _electricityTVA = prefs.getDouble('electricityTVA');
    _electricityTPPAN = prefs.getDouble('electricityTPPAN');

    _waterPUTranche1 = prefs.getDouble('waterPUTranche1');
    _waterPUTranche2 = prefs.getDouble('waterPUTranche2');
    _waterPUTranche3 = prefs.getDouble('waterPUTranche3');
    _waterPUTranche4 = prefs.getDouble('waterPUTranche4');
    _waterPUTranche5 = prefs.getDouble('waterPUTranche5');
    _waterRedevanceFixe = prefs.getDouble('waterRedevanceFixe');

    _assainissementTranche1 = prefs.getDouble('assainissementTranche1');
    _assainissementTranche2 = prefs.getDouble('assainissementTranche2');
    _assainissementTranche3 = prefs.getDouble('assainissementTranche3');
    _assainissementTranche4 = prefs.getDouble('assainissementTranche4');
    _assainissementTranche5 = prefs.getDouble('assainissementTranche5');
    _assainissementRedevanceFixe = prefs.getDouble('assainissementRedevanceFixe');
    _waterTVA = prefs.getDouble('waterTVA');

    notifyListeners();
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('themeMode', themeMode.index);
    await prefs.setString('appLocale', appLocale?.languageCode ?? 'en');

    // Electricity settings
    await prefs.setDouble('electricityPUTranche1', electricityPUTranche1);
    await prefs.setDouble('electricityPUTranche2', electricityPUTranche2);
    await prefs.setDouble('electricityPUTranche3', electricityPUTranche3);
    await prefs.setDouble('electricityPUTranche4', electricityPUTranche4);
    await prefs.setDouble('electricityPUTranche5', electricityPUTranche5);
    await prefs.setDouble('electricityPUTranche6', electricityPUTranche6);
    await prefs.setDouble('electricityRedevanceFixe', electricityRedevanceFixe);
    await prefs.setInt('electricityRedevanceFacture', electricityRedevanceFacture);
    await prefs.setDouble('electricityTVA', electricityTVA);
    await prefs.setDouble('electricityTPPAN', electricityTPPAN);

    // Water settings
    await prefs.setDouble('waterPUTranche1', waterPUTranche1);
    await prefs.setDouble('waterPUTranche2', waterPUTranche2);
    await prefs.setDouble('waterPUTranche3', waterPUTranche3);
    await prefs.setDouble('waterPUTranche4', waterPUTranche4);
    await prefs.setDouble('waterPUTranche5', waterPUTranche5);
    await prefs.setDouble('waterRedevanceFixe', waterRedevanceFixe);

    // Sanitation settings
    await prefs.setDouble('assainissementTranche1', assainissementTranche1);
    await prefs.setDouble('assainissementTranche2', assainissementTranche2);
    await prefs.setDouble('assainissementTranche3', assainissementTranche3);
    await prefs.setDouble('assainissementTranche4', assainissementTranche4);
    await prefs.setDouble('assainissementTranche5', assainissementTranche5);
    await prefs.setDouble('assainissementRedevanceFixe', assainissementRedevanceFixe);
    await prefs.setDouble('waterTVA', waterTVA);
  }

  void setThemeMode(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      _saveSettings();
      notifyListeners();
    }
  }

  void setAppLocale(Locale? locale) {
    final newLocale = locale ?? const Locale('en');
    if (_appLocale != newLocale) {
      _appLocale = newLocale;
      _saveSettings();
      notifyListeners();
    }
  }

  // Setters
  void setElectricityPUTranche1(double value) {
    if (_electricityPUTranche1 != value) {
      _electricityPUTranche1 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setElectricityPUTranche2(double value) {
    if (_electricityPUTranche2 != value) {
      _electricityPUTranche2 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setElectricityPUTranche3(double value) {
    if (_electricityPUTranche3 != value) {
      _electricityPUTranche3 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setElectricityPUTranche4(double value) {
    if (_electricityPUTranche4 != value) {
      _electricityPUTranche4 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setElectricityPUTranche5(double value) {
    if (_electricityPUTranche5 != value) {
      _electricityPUTranche5 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setElectricityPUTranche6(double value) {
    if (_electricityPUTranche6 != value) {
      _electricityPUTranche6 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setElectricityRedevanceFixe(double value) {
    if (_electricityRedevanceFixe != value) {
      _electricityRedevanceFixe = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setElectricityRedevanceFacture(int value) {
    if (_electricityRedevanceFacture != value) {
      _electricityRedevanceFacture = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setElectricityTVA(double value) {
    if (_electricityTVA != value) {
      _electricityTVA = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setElectricityTPPAN(double value) {
    if (_electricityTPPAN != value) {
      _electricityTPPAN = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setWaterPUTranche1(double value) {
    if (_waterPUTranche1 != value) {
      _waterPUTranche1 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setWaterPUTranche2(double value) {
    if (_waterPUTranche2 != value) {
      _waterPUTranche2 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setWaterPUTranche3(double value) {
    if (_waterPUTranche3 != value) {
      _waterPUTranche3 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setWaterPUTranche4(double value) {
    if (_waterPUTranche4 != value) {
      _waterPUTranche4 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setWaterPUTranche5(double value) {
    if (_waterPUTranche5 != value) {
      _waterPUTranche5 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setWaterRedevanceFixe(double value) {
    if (_waterRedevanceFixe != value) {
      _waterRedevanceFixe = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setAssainissementTranche1(double value) {
    if (_assainissementTranche1 != value) {
      _assainissementTranche1 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setAssainissementTranche2(double value) {
    if (_assainissementTranche2 != value) {
      _assainissementTranche2 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setAssainissementTranche3(double value) {
    if (_assainissementTranche3 != value) {
      _assainissementTranche3 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setAssainissementTranche4(double value) {
    if (_assainissementTranche4 != value) {
      _assainissementTranche4 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setAssainissementTranche5(double value) {
    if (_assainissementTranche5 != value) {
      _assainissementTranche5 = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setAssainissementRedevanceFixe(double value) {
    if (_assainissementRedevanceFixe != value) {
      _assainissementRedevanceFixe = value;
      _saveSettings();
      notifyListeners();
    }
  }

  void setWaterTVA(double value) {
    if (_waterTVA != value) {
      _waterTVA = value;
      _saveSettings();
      notifyListeners();
    }
  }
}