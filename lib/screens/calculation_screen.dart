import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulateur_facture/models/bill_type.dart';
import '../models/settings_model.dart';
import 'package:simulateur_facture/l10n/app_localizations_manual.dart';

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
    // Calculate electricity bill using tiered pricing
    double consumptionCost = 0.0;
    String rateDetails = '';
    
    // Tier 1: 0-100 kWh
    double tier1Consumption = consumption <= 100 ? consumption : 100;
    double tier1Cost = tier1Consumption * settings.electricityPUTranche1;
    consumptionCost += tier1Cost;
    rateDetails += '${l10n.pu} Tranche 1 (0-100 kWh): ${tier1Consumption.toStringAsFixed(2)} kWh × ${settings.electricityPUTranche1.toStringAsFixed(2)} = ${tier1Cost.toStringAsFixed(2)} DH\n';
    
    // Tier 2: 101-150 kWh
    if (consumption > 100) {
      double tier2Consumption = consumption <= 150 ? consumption - 100 : 50;
      double tier2Cost = tier2Consumption * settings.electricityPUTranche2;
      consumptionCost += tier2Cost;
      rateDetails += '${l10n.pu} Tranche 2 (101-150 kWh): ${tier2Consumption.toStringAsFixed(2)} kWh × ${settings.electricityPUTranche2.toStringAsFixed(2)} = ${tier2Cost.toStringAsFixed(2)} DH\n';
      
      // Tier 3: 151-210 kWh
      if (consumption > 150) {
        double tier3Consumption = consumption <= 210 ? consumption - 150 : 60;
        double tier3Cost = tier3Consumption * settings.electricityPUTranche3;
        consumptionCost += tier3Cost;
        rateDetails += '${l10n.pu} Tranche 3 (151-210 kWh): ${tier3Consumption.toStringAsFixed(2)} kWh × ${settings.electricityPUTranche3.toStringAsFixed(2)} = ${tier3Cost.toStringAsFixed(2)} DH\n';
        
        // Tier 4: 211-310 kWh
        if (consumption > 210) {
          double tier4Consumption = consumption <= 310 ? consumption - 210 : 100;
          double tier4Cost = tier4Consumption * settings.electricityPUTranche4;
          consumptionCost += tier4Cost;
          rateDetails += '${l10n.pu} Tranche 4 (211-310 kWh): ${tier4Consumption.toStringAsFixed(2)} kWh × ${settings.electricityPUTranche4.toStringAsFixed(2)} = ${tier4Cost.toStringAsFixed(2)} DH\n';
          
          // Tier 5: 311-510 kWh
          if (consumption > 310) {
            double tier5Consumption = consumption <= 510 ? consumption - 310 : 200;
            double tier5Cost = tier5Consumption * settings.electricityPUTranche5;
            consumptionCost += tier5Cost;
            rateDetails += '${l10n.pu} Tranche 5 (311-510 kWh): ${tier5Consumption.toStringAsFixed(2)} kWh × ${settings.electricityPUTranche5.toStringAsFixed(2)} = ${tier5Cost.toStringAsFixed(2)} DH\n';
            
            // Tier 6: >511 kWh
            if (consumption > 510) {
              double tier6Consumption = consumption - 510;
              double tier6Cost = tier6Consumption * settings.electricityPUTranche6;
              consumptionCost += tier6Cost;
              rateDetails += '${l10n.pu} Tranche 6 (>511 kWh): ${tier6Consumption.toStringAsFixed(2)} kWh × ${settings.electricityPUTranche6.toStringAsFixed(2)} = ${tier6Cost.toStringAsFixed(2)} DH\n';
            }
          }
        }
      }
    }
    
    // TPPAN tax for consumption > 200 kWh
    double tppanTax = 0.0;
    if (consumption > 200) {
      tppanTax = (consumption - 200) * settings.electricityTPPAN;
      rateDetails += 'TPPAN (>200 kWh): ${(consumption - 200).toStringAsFixed(2)} kWh × ${settings.electricityTPPAN.toStringAsFixed(2)} = ${tppanTax.toStringAsFixed(2)} DH\n';
    }
    
    final redevanceFixe = settings.electricityRedevanceFixe * settings.electricityRedevanceFacture;
    final subtotal = consumptionCost + redevanceFixe + tppanTax;
    final tva = 1 * settings.electricityTVA;
    final total = subtotal + tva;

    setState(() {
      _result = '''
${l10n.consumption}: ${consumption.toStringAsFixed(2)} kWh

$rateDetails
${l10n.consumptionCost}: ${consumptionCost.toStringAsFixed(2)} DH

${l10n.redevanceFixe}: ${redevanceFixe.toStringAsFixed(2)} DH
${consumption > 200 ? 'TPPAN: ${tppanTax.toStringAsFixed(2)} DH\n' : ''}
${l10n.subtotal}: ${subtotal.toStringAsFixed(2)} DH
${l10n.tva} (${settings.electricityTVA}%): ${tva.toStringAsFixed(2)} DH

${l10n.total}: ${total.toStringAsFixed(2)} DH
      ''';
    });
  }

  void _calculateWaterBill(double consumption, SettingsModel settings, AppLocalizationsManual l10n) {
    // For water, we need to determine tier usage with 5 tiers
    const tier1Limit = 6.0;   // 0-6 m³
    const tier2Limit = 12.0;  // 7-12 m³
    const tier3Limit = 20.0;  // 13-20 m³
    const tier4Limit = 35.0;  // 21-35 m³
    
    // Calculate consumption per tier
    double tier1Consumption = consumption <= tier1Limit ? consumption : tier1Limit;
    double tier2Consumption = consumption > tier1Limit && consumption <= tier2Limit ? consumption - tier1Limit : (consumption > tier2Limit ? tier2Limit - tier1Limit : 0);
    double tier3Consumption = consumption > tier2Limit && consumption <= tier3Limit ? consumption - tier2Limit : (consumption > tier3Limit ? tier3Limit - tier2Limit : 0);
    double tier4Consumption = consumption > tier3Limit && consumption <= tier4Limit ? consumption - tier3Limit : (consumption > tier4Limit ? tier4Limit - tier3Limit : 0);
    double tier5Consumption = consumption > tier4Limit ? consumption - tier4Limit : 0;
    
    // Water costs
    final waterTier1Cost = tier1Consumption * settings.waterPUTranche1;
    final waterTier2Cost = tier2Consumption * settings.waterPUTranche2;
    final waterTier3Cost = tier3Consumption * settings.waterPUTranche3;
    final waterTier4Cost = tier4Consumption * settings.waterPUTranche4;
    final waterTier5Cost = tier5Consumption * settings.waterPUTranche5;
    final waterCost = waterTier1Cost + waterTier2Cost + waterTier3Cost + waterTier4Cost + waterTier5Cost;
    
    // Sanitation costs
    final assainissementTier1Cost = tier1Consumption * settings.assainissementTranche1;
    final assainissementTier2Cost = tier2Consumption * settings.assainissementTranche2;
    final assainissementTier3Cost = tier3Consumption * settings.assainissementTranche3;
    final assainissementTier4Cost = tier4Consumption * settings.assainissementTranche4;
    final assainissementTier5Cost = tier5Consumption * settings.assainissementTranche5;
    final assainissementCost = assainissementTier1Cost + assainissementTier2Cost + assainissementTier3Cost + assainissementTier4Cost + assainissementTier5Cost;
    
    // Fixed charges
    final redevanceFixe = settings.waterRedevanceFixe + settings.assainissementRedevanceFixe;
    
    // Subtotal
    final subtotal = waterCost + assainissementCost + redevanceFixe;
    
    // TVA
    // final tva = subtotal * (settings.waterTVA / 100);
    final tva = 1 * settings.waterTVA;
    // Total
    final total = subtotal + tva;

    setState(() {
      _result = '''
${l10n.consumption}: ${consumption.toStringAsFixed(2)} m³
  - ${l10n.tranche1} (0-6 m³): ${tier1Consumption.toStringAsFixed(2)} m³
  - ${l10n.tranche2} (7-12 m³): ${tier2Consumption.toStringAsFixed(2)} m³
  - ${l10n.tranche3} (13-20 m³): ${tier3Consumption.toStringAsFixed(2)} m³
  - Tranche 4 (21-35 m³): ${tier4Consumption.toStringAsFixed(2)} m³
  - Tranche 5 (>35 m³): ${tier5Consumption.toStringAsFixed(2)} m³

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
