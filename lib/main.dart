import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moneymanager/helpers/app.dart';
import 'package:moneymanager/helpers/theme.dart';
import 'package:moneymanager/widgets/bottom_navigation.widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await App.initializeApp();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Money Manager",
      theme: appTheme,
      home: const BottomNavigationWidget(),
      locale: const Locale('fr', 'FR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', ''), Locale('fr', '')],
    );
  }
}
