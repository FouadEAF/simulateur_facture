import 'package:flutter/material.dart';
import 'package:simulateur_facture/models/bill_type.dart';
import 'calculation_screen.dart';
import 'package:simulateur_facture/l10n/app_localizations_manual.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToCalculationScreen(BuildContext context, BillType billType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CalculationScreen(billType: billType),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizationsManual.of(context).billCalculator),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizationsManual.of(context).selectBillType,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 40),
            _buildBillTypeCard(
              context,
              AppLocalizationsManual.of(context).electricity,
              Icons.bolt,
              Colors.amber,
              () => _navigateToCalculationScreen(context, BillType.electricity),
            ),
            const SizedBox(height: 20),
            _buildBillTypeCard(
              context,
              AppLocalizationsManual.of(context).water,
              Icons.water_drop,
              Colors.blue,
              () => _navigateToCalculationScreen(context, BillType.water),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillTypeCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          width: 200,
          height: 120,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
