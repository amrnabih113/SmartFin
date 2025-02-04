import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:smartFin/config/theme/theme.dart';
import 'package:smartFin/features/auth/presentation/pages/sign_in.dart';
import 'package:smartFin/generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      home: const SignIn(),
    );
  }
}
