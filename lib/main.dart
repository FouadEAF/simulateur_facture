import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulateur_facture/models/settings_model.dart';
import 'package:simulateur_facture/screens/home_screen.dart';
import 'package:simulateur_facture/screens/settings_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:simulateur_facture/l10n/app_localizations_manual.dart';

Future<void> main() async { // Made main async
  WidgetsFlutterBinding.ensureInitialized(); // Required for SharedPreferences
  final settingsModel = SettingsModel();
  await settingsModel.init(); // Initialize settings asynchronously

  runApp(
    ChangeNotifierProvider(
      create: (context) => settingsModel, // Use the already initialized model
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsModel>(
      builder: (context, settings, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => AppLocalizationsManual.of(context).billCalculator,
          localizationsDelegates: [
            AppLocalizationsManual.delegate,
            ...GlobalMaterialLocalizations.delegates,
          ],
          supportedLocales: const [Locale('en'), Locale('fr'), Locale('ar')],
          locale: settings.appLocale,
          theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
          darkTheme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark)),
          themeMode: settings.themeMode,
          home: const HomeScreen(),
          routes: {
            '/settings': (context) => const SettingsScreen(),
          },
        );
      },
    );
  }
}