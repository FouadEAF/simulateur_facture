import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Add this import

class SettingsModel extends ChangeNotifier {
  late ThemeMode _themeMode;
  Locale? _appLocale; // User-selected locale
  // Electricity settings
  double _electricityPU = 0.966750; // Price per unit (DH/kWh)
  double _electricityRedevanceFixe = 7.22; // Fixed charge
  int _electricityRedevanceFacture = 1; // Number of invoices
  double _electricityTVA = 27.75; // VAT percentage
  
  // Water settings
  double _waterPUTranche1 = 2.553500; // Price per unit for tier 1 (DH/m³)
  double _waterPUTranche2 = 7.739200; // Price per unit for tier 2 (DH/m³)
  double _waterPUTranche3 = 0.0; // Price per unit for tier 3 (DH/m³)
  double _waterRedevanceFixe = 8.55; // Fixed water charge
  double _assainissementTranche1 = 0.840100; // Sanitation tier 1
  double _assainissementTranche2 = 1.734200; // Sanitation tier 2
  double _assainissementTranche3 = 0.0; // Sanitation tier 3
  double _assainissementRedevanceFixe = 5.00; // Fixed sanitation charge
  double _waterTVA = 0.0; // VAT percentage
  
  // Getters
  ThemeMode get themeMode => _themeMode;
  Locale? get appLocale => _appLocale;
  
  // Electricity getters
  double get electricityPU => _electricityPU;
  double get electricityRedevanceFixe => _electricityRedevanceFixe;
  int get electricityRedevanceFacture => _electricityRedevanceFacture;
  double get electricityTVA => _electricityTVA;
  
  // Water getters
  double get waterPUTranche1 => _waterPUTranche1;
  double get waterPUTranche2 => _waterPUTranche2;
  double get waterPUTranche3 => _waterPUTranche3;
  double get waterRedevanceFixe => _waterRedevanceFixe;
  double get assainissementTranche1 => _assainissementTranche1;
  double get assainissementTranche2 => _assainissementTranche2;
  double get assainissementTranche3 => _assainissementTranche3;
  double get assainissementRedevanceFixe => _assainissementRedevanceFixe;
  double get waterTVA => _waterTVA;

  SettingsModel() {
    _themeMode = ThemeMode.system; // Initialize with a default, will be overwritten by loaded settings
  }

  // New: Asynchronous initialization method
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    
    _themeMode = ThemeMode.values[prefs.getInt('themeMode') ?? ThemeMode.system.index];

    // Locale
    final String? langCode = prefs.getString('appLocale');
    if (langCode != null && langCode.isNotEmpty) {
      _appLocale = Locale(langCode);
    } else {
      _appLocale = const Locale('en'); // Default to English if no setting is saved
    }

    // Load Electricity settings
    _electricityPU = prefs.getDouble('electricityPU') ?? 0.966750;
    _electricityRedevanceFixe = prefs.getDouble('electricityRedevanceFixe') ?? 7.22;
    _electricityRedevanceFacture = prefs.getInt('electricityRedevanceFacture') ?? 1;
    _electricityTVA = prefs.getDouble('electricityTVA') ?? 27.75;

    // Water settings
    _waterPUTranche1 = prefs.getDouble('waterPUTranche1') ?? 2.553500;
    _waterPUTranche2 = prefs.getDouble('waterPUTranche2') ?? 7.739200;
    _waterPUTranche3 = prefs.getDouble('waterPUTranche3') ?? 0.0;
    _waterRedevanceFixe = prefs.getDouble('waterRedevanceFixe') ?? 8.55;
    _assainissementTranche1 = prefs.getDouble('assainissementTranche1') ?? 0.840100;
    _assainissementTranche2 = prefs.getDouble('assainissementTranche2') ?? 1.734200;
    _assainissementTranche3 = prefs.getDouble('assainissementTranche3') ?? 0.0;
    _assainissementRedevanceFixe = prefs.getDouble('assainissementRedevanceFixe') ?? 5.00;
    _waterTVA = prefs.getDouble('waterTVA') ?? 0.0;

    notifyListeners();
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    
    await prefs.setInt('themeMode', _themeMode.index);

    // Locale
    await prefs.setString('appLocale', _appLocale?.languageCode ?? '');

    // Electricity settings
    await prefs.setDouble('electricityPU', _electricityPU);
    await prefs.setDouble('electricityRedevanceFixe', _electricityRedevanceFixe);
    await prefs.setInt('electricityRedevanceFacture', _electricityRedevanceFacture);
    await prefs.setDouble('electricityTVA', _electricityTVA);

    // Water settings
    await prefs.setDouble('waterPUTranche1', _waterPUTranche1);
    await prefs.setDouble('waterPUTranche2', _waterPUTranche2);
    await prefs.setDouble('waterPUTranche3', _waterPUTranche3);
    await prefs.setDouble('waterRedevanceFixe', _waterRedevanceFixe);
    await prefs.setDouble('assainissementTranche1', _assainissementTranche1);
    await prefs.setDouble('assainissementTranche2', _assainissementTranche2);
    await prefs.setDouble('assainissementTranche3', _assainissementTranche3);
    await prefs.setDouble('assainissementRedevanceFixe', _assainissementRedevanceFixe);
    await prefs.setDouble('waterTVA', _waterTVA);
  }

  void setThemeMode(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      _saveSettings();
      notifyListeners();
    }
  }

  void setAppLocale(Locale? locale) {
    // If locale is null (which can happen with some UI controls), we default to English.
    final newLocale = locale ?? const Locale('en');
    if (_appLocale != newLocale) {
      _appLocale = newLocale;
      _saveSettings();
      notifyListeners();
    }
  }
  // Electricity setters
  void setElectricityPU(double value) {
    if (_electricityPU != value) {
      _electricityPU = value;
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

  // Water setters
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
