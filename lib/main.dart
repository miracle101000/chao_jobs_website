import 'package:chao_jobs_website/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'Translations/translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(
          frLanguage: FrLanguage(),
          arLanguage: ArLanguage(),
          enLanguage: EnLanguage(),
          ptLanguage: PtLanguage()),
      locale: Get.deviceLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate, // uses `flutter_localizations`
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('en', 'AU'),
        Locale('en', 'CA'),
        Locale('en', 'IN'),
        Locale('en', 'IE'),
        Locale('en', 'MT'),
        Locale('en', 'NZ'),
        Locale('en', 'PH'),
        Locale('en', 'SG'),
        Locale('en', 'ZA'),
        Locale('en', 'GB'),
        Locale('ar', 'DZ'),
        Locale('ar', 'BH'),
        Locale('ar', 'EG'),
        Locale('ar', 'IQ'),
        Locale('ar', 'JO'),
        Locale('ar', 'KW'),
        Locale('ar', 'LB'),
        Locale('ar', 'LY'),
        Locale('ar', 'MA'),
        Locale('ar', 'OM'),
        Locale('ar', 'QA'),
        Locale('ar', 'SA'),
        Locale('ar', 'SD'),
        Locale('ar', 'SY'),
        Locale('ar', 'TN'),
        Locale('ar', 'AE'),
        Locale('ar', 'YE'),
        Locale('fr', 'CA'),
        Locale('fr', 'FR'),
        Locale('fr', 'LU'),
        Locale('fr', 'CH'),
        Locale('pt', 'BR'),
        Locale('pt', 'PT'),
      ],
      fallbackLocale: const Locale('en', 'US'),
      title: 'ChaoJobs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
      getPages: [
        GetPage(name: LandingPage.routeName, page: () => const LandingPage()),
      ],
    );
  }
}
