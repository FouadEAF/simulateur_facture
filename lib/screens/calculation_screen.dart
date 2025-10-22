import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sumilateur_facture/models/bill_type.dart';
import '../models/settings_model.dart';
import 'package:sumilateur_facture/l10n/app_localizations_manual.dart';

class CalculationScreen extends StatefulWidget {
  final BillType billType;

  const CalculationScreen({super.key, required this.billType});

  @override
  _CalculationScreenState createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldReadingController = TextEditingController();
  final _newReadingController = TextEditingController();
  String _result = '';
  String _unit = 'kWh';

  @override
  void initState() {
    super.initState();
    _unit = widget.billType == BillType.electricity ? 'kWh' : 'm³';
  }

  @override
  void dispose() {
    _oldReadingController.dispose();
    _newReadingController.dispose();
    super.dispose();
  }

  void _calculateBill(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final l10n = AppLocalizationsManual.of(context);
      final settings = Provider.of<SettingsModel>(context, listen: false);
      final oldReading = double.tryParse(_oldReadingController.text) ?? 0;
      final newReading = double.tryParse(_newReadingController.text) ?? 0;
      
      if (newReading < oldReading) {
        setState(() {
          _result = l10n.errorNewReading;
        });
        return;
      }

      final consumption = newReading - oldReading;
      
      if (widget.billType == BillType.electricity) {
        _calculateElectricityBill(consumption, settings, l10n);
      } else {
        _calculateWaterBill(consumption, settings, l10n);
      }
    }
  }

  void _calculateElectricityBill(double consumption, SettingsModel settings, AppLocalizationsManual l10n) {
    // Calculate electricity bill
    final consumptionCost = consumption * settings.electricityPU;
    final redevanceFixe = settings.electricityRedevanceFixe * settings.electricityRedevanceFacture;
    final subtotal = consumptionCost + redevanceFixe;
    //final tva = subtotal * (settings.electricityTVA / 100);
    final tva = 1 * settings.electricityTVA;
    final total = subtotal + tva;

    setState(() {
      _result = '''
${l10n.consumption}: ${consumption.toStringAsFixed(2)} kWh
${l10n.pu}: ${settings.electricityPU.toStringAsFixed(2)} DH/kWh
${l10n.consumptionCost}: ${consumptionCost.toStringAsFixed(2)} DH

${l10n.redevanceFixe}: ${redevanceFixe.toStringAsFixed(2)} DH
${l10n.subtotal}: ${subtotal.toStringAsFixed(2)} DH
${l10n.tva}: ${tva.toStringAsFixed(2)} DH

${l10n.total}: ${total.toStringAsFixed(2)} DH
      ''';
    });
  }

  void _calculateWaterBill(double consumption, SettingsModel settings, AppLocalizationsManual l10n) {
    // For water, we need to determine tier usage
    // Assuming tier 1 is first 6m³, tier 2 is next 6m³, tier 3 is above 12m³
    const tier1Limit = 6.0;
    const tier2Limit = 12.0;
    
    double tier1Consumption = consumption <= tier1Limit ? consumption : tier1Limit;
    double tier2Consumption = consumption > tier1Limit && consumption <= tier2Limit ? consumption - tier1Limit : (consumption > tier2Limit ? tier2Limit - tier1Limit : 0);
    double tier3Consumption = consumption > tier2Limit ? consumption - tier2Limit : 0;
    
    // Water costs
    final waterTier1Cost = tier1Consumption * settings.waterPUTranche1;
    final waterTier2Cost = tier2Consumption * settings.waterPUTranche2;
    final waterTier3Cost = tier3Consumption * settings.waterPUTranche3;
    final waterCost = waterTier1Cost + waterTier2Cost + waterTier3Cost;
    
    // Sanitation costs
    final assainissementTier1Cost = tier1Consumption * settings.assainissementTranche1;
    final assainissementTier2Cost = tier2Consumption * settings.assainissementTranche2;
    final assainissementTier3Cost = tier3Consumption * settings.assainissementTranche3;
    final assainissementCost = assainissementTier1Cost + assainissementTier2Cost + assainissementTier3Cost;
    
    // Fixed charges
    final redevanceFixe = settings.waterRedevanceFixe + settings.assainissementRedevanceFixe;
    
    // Subtotal
    final subtotal = waterCost + assainissementCost + redevanceFixe;
    
    // TVA
    final tva = subtotal * (settings.waterTVA / 100);
    // Total
    final total = subtotal + tva;

    setState(() {
      _result = '''
${l10n.consumption}: ${consumption.toStringAsFixed(2)} m³
  - ${l10n.tranche1}: ${tier1Consumption.toStringAsFixed(2)} m³
  - ${l10n.tranche2}: ${tier2Consumption.toStringAsFixed(2)} m³
  - ${l10n.tranche3}: ${tier3Consumption.toStringAsFixed(2)} m³

${l10n.waterCost}: ${waterCost.toStringAsFixed(2)} DH
${l10n.assainissement}: ${assainissementCost.toStringAsFixed(2)} DH
${l10n.redevanceFixe}: ${redevanceFixe.toStringAsFixed(2)} DH

${l10n.subtotal}: ${subtotal.toStringAsFixed(2)} DH
${l10n.tva} (${settings.waterTVA.toStringAsFixed(0)}%): ${tva.toStringAsFixed(2)} DH

${l10n.total}: ${total.toStringAsFixed(2)} DH
      ''';
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizationsManual.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.billType == BillType.electricity
            ? l10n.electricityBillCalculator
            : l10n.waterBillCalculator),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.enterMeterReadings,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _oldReadingController,
                  decoration: InputDecoration(
                    labelText: l10n.oldReading(_unit),
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.pleaseEnterOldReading;
                    }
                    if (double.tryParse(value) == null) {
                      return l10n.pleaseEnterAValidNumber;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _newReadingController,
                  decoration: InputDecoration(
                    labelText: l10n.newReading(_unit),
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.pleaseEnterNewReading;
                    }
                    if (double.tryParse(value) == null) {
                      return l10n.pleaseEnterAValidNumber;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => _calculateBill(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(l10n.calculate, style: const TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 24),
                if (_result.isNotEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        _result,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
