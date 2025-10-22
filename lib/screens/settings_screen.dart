import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/settings_model.dart';
import 'package:simulateur_facture/l10n/app_localizations_manual.dart';


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
                  items: const [
                    DropdownMenuItem(
                      value: Locale('en'),
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: Locale('fr'),
                      child: Text('Français'),
                    ),
                    DropdownMenuItem(
                      value: Locale('ar'),
                      child: Text('العربية'),
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
                '${l10n.pu} (DH/kWh)',
                settings.electricityPU,
                (value) => settings.setElectricityPU(value),
                'electricityPU',
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
                '${l10n.tva} (%)',
                settings.electricityTVA,
                (value) => settings.setElectricityTVA(value),
                'electricityTVA',
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
                l10n.redevanceFixeAssainissement,
                settings.assainissementRedevanceFixe,
                (value) => settings.setAssainissementRedevanceFixe(value),
                'assainissementRedevanceFixe',
              ),
              const SizedBox(height: 12),
              _buildRateField(
                context,
                '${l10n.tva} (%)',
                settings.waterTVA,
                (value) => settings.setWaterTVA(value),
                'waterTVA',
              ),
              const SizedBox(height: 24),

                // About Section
                const Divider(),
                ListTile(
                  title: Text(l10n.about),
                  leading: const Icon(Icons.info_outline),
                  onTap: () {
                    showAboutDialog(
                      context: context,
                      applicationName: l10n.billCalculator,
                      applicationVersion: "1.0.1",
                      applicationIcon: const Icon(Icons.receipt_long, size: 48),
                      children: [
                        const SizedBox(height: 16),
                        Text(
                          '${l10n.developer}: EAF microservice',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('${l10n.email}: EAF.microservice@gmail.com'),
                        const SizedBox(height: 4),
                        Text('${l10n.phone}: +212 645 994 904'),
                        const SizedBox(height: 16),
                        Text(l10n.appDescription),
                      ],
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildRateField(
    BuildContext context,
    String label,
    double value,
    Function(double) onChanged,
    String controllerKey, // New: Key for controller management
  ) {
    final controller = _getController(controllerKey, value.toStringAsFixed(2));
    // Update controller text if the value changes from outside (e.g., loaded from prefs)
    if (controller.text != value.toStringAsFixed(2)) {
      controller.text = value.toStringAsFixed(2);
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
    int value,
    Function(int) onChanged,
    String controllerKey, // New: Key for controller management
  ) {
    final controller = _getController(controllerKey, value.toString());
    // Update controller text if the value changes from outside
    if (controller.text != value.toString()) {
      controller.text = value.toString();
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