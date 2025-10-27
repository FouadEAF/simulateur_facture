import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/settings_model.dart';
import 'package:simulateur_facture/l10n/app_localizations_manual.dart';
import '../widgets/about_dialog.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Controllers for rate fields to maintain state
  final Map<String, TextEditingController> _controllers = {};

  @override
  void dispose() {
    _controllers.forEach((key, controller) => controller.dispose());
    super.dispose();
  }

  TextEditingController _getController(String key, String initialValue) {
    return _controllers.putIfAbsent(key, () => TextEditingController(text: initialValue));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizationsManual.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: Consumer<SettingsModel>(
        builder: (context, settings, child) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // Language Settings
              Text(
                l10n.language,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: DropdownButton<Locale>(
                  value: settings.appLocale,
                  isExpanded: true,
                  onChanged: (Locale? newValue) {
                    settings.setAppLocale(newValue);
                  },
                  items: [
                    DropdownMenuItem(
                      value: const Locale('en'),
                      child: Text(l10n.langEnglish),
                    ),
                    DropdownMenuItem(
                      value: const Locale('fr'),
                      child: Text(l10n.langFrench),
                    ),
                    DropdownMenuItem(
                      value: const Locale('ar'),
                      child: Text(l10n.langArabic),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Theme Settings
              Text(
                l10n.theme,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              RadioListTile<ThemeMode>(
                title: Text(l10n.systemDefault),
                value: ThemeMode.system,
                groupValue: settings.themeMode,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    settings.setThemeMode(value);
                  }
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text(l10n.light),
                value: ThemeMode.light,
                groupValue: settings.themeMode,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    settings.setThemeMode(value);
                  }
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text(l10n.dark),
                value: ThemeMode.dark,
                groupValue: settings.themeMode,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    settings.setThemeMode(value);
                  }
                },
              ),
              const SizedBox(height: 24),
              
              // Electricity Settings
              Text(
                l10n.electricitySettings,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              _buildRateField(
                context,
                l10n.electricityPuTranche1Label,
                settings.electricityPUTranche1,
                (value) => settings.setElectricityPUTranche1(value),
                'electricityPUTranche1',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.electricityPuTranche2Label,
                settings.electricityPUTranche2,
                (value) => settings.setElectricityPUTranche2(value),
                'electricityPUTranche2',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.electricityPuTranche3Label,
                settings.electricityPUTranche3,
                (value) => settings.setElectricityPUTranche3(value),
                'electricityPUTranche3',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.electricityPuTranche4Label,
                settings.electricityPUTranche4,
                (value) => settings.setElectricityPUTranche4(value),
                'electricityPUTranche4',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.electricityPuTranche5Label,
                settings.electricityPUTranche5,
                (value) => settings.setElectricityPUTranche5(value),
                'electricityPUTranche5',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.electricityPuTranche6Label,
                settings.electricityPUTranche6,
                (value) => settings.setElectricityPUTranche6(value),
                'electricityPUTranche6',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.redevanceFixeElectricite,
                settings.electricityRedevanceFixe,
                (value) => settings.setElectricityRedevanceFixe(value),
                'electricityRedevanceFixe',
              ),
              const SizedBox(height: 12),
              _buildIntField(
                context,
                l10n.redevanceFixeFacture,
                settings.electricityRedevanceFacture,
                (value) => settings.setElectricityRedevanceFacture(value),
                'electricityRedevanceFacture',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.tvaLabel,
                settings.electricityTVA,
                (value) => settings.setElectricityTVA(value),
                'electricityTVA',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.tppanLabel,
                settings.electricityTPPAN,
                (value) => settings.setElectricityTPPAN(value),
                'electricityTPPAN',
              ),
              const SizedBox(height: 24),
              
              // Water Settings
              Text(
                l10n.waterSettings,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(),
              _buildRateField(
                context,
                l10n.puTranche1,
                settings.waterPUTranche1,
                (value) => settings.setWaterPUTranche1(value),
                'waterPUTranche1',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.puTranche2,
                settings.waterPUTranche2,
                (value) => settings.setWaterPUTranche2(value),
                'waterPUTranche2',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.puTranche3,
                settings.waterPUTranche3,
                (value) => settings.setWaterPUTranche3(value),
                'waterPUTranche3',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.waterPuTranche4Label,
                settings.waterPUTranche4,
                (value) => settings.setWaterPUTranche4(value),
                'waterPUTranche4',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.waterPuTranche5Label,
                settings.waterPUTranche5,
                (value) => settings.setWaterPUTranche5(value),
                'waterPUTranche5',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.redevanceFixeEau,
                settings.waterRedevanceFixe,
                (value) => settings.setWaterRedevanceFixe(value),
                'waterRedevanceFixe',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.assainissementTranche1,
                settings.assainissementTranche1,
                (value) => settings.setAssainissementTranche1(value),
                'assainissementTranche1',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.assainissementTranche2,
                settings.assainissementTranche2,
                (value) => settings.setAssainissementTranche2(value),
                'assainissementTranche2',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.assainissementTranche3,
                settings.assainissementTranche3,
                (value) => settings.setAssainissementTranche3(value),
                'assainissementTranche3',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.assainissementTranche4Label,
                settings.assainissementTranche4,
                (value) => settings.setAssainissementTranche4(value),
                'assainissementTranche4',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.assainissementTranche5Label,
                settings.assainissementTranche5,
                (value) => settings.setAssainissementTranche5(value),
                'assainissementTranche5',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.redevanceFixeAssainissement,
                settings.assainissementRedevanceFixe,
                (value) => settings.setAssainissementRedevanceFixe(value),
                'assainissementRedevanceFixe',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                l10n.tvaLabel,
                settings.waterTVA,
                (value) => settings.setWaterTVA(value),
                'waterTVA',
              ),
              const SizedBox(height: 24),

                // About Section
                const Divider(),
                const AboutDialogWidget(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildRateField(
    BuildContext context,
    String label,
    double? value,
    Function(double) onChanged,
    String controllerKey, // New: Key for controller management
  ) {
    // Handle null values by providing a default of 0.0
    final safeValue = value ?? 0.0;
    final controller = _getController(controllerKey, safeValue.toStringAsFixed(4));
    // Update controller text if the value changes from outside (e.g., loaded from prefs)
    if (controller.text != safeValue.toStringAsFixed(4)) {
      controller.text = safeValue.toStringAsFixed(4);
      controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
    }
    
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onChanged: (value) {
        final parsed = double.tryParse(value) ?? 0.0;
        if (parsed >= 0) {
          onChanged(parsed);
        }
      },
    );
  }

  Widget _buildIntField(
    BuildContext context,
    String label,
    int? value,
    Function(int) onChanged,
    String controllerKey, // New: Key for controller management
  ) {
    // Handle null values by providing a default of 0
    final safeValue = value ?? 0;
    final controller = _getController(controllerKey, safeValue.toString());
    // Update controller text if the value changes from outside
    if (controller.text != safeValue.toString()) {
      controller.text = safeValue.toString();
      controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
    }
    
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        final parsed = int.tryParse(value) ?? 0;
        if (parsed >= 0) {
          onChanged(parsed);
        }
      },
    );
  }
}