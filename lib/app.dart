
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_supervisor/features/authentication/screens/splash/splash_screen.dart';
import 'package:sales_supervisor/utils/NavigationObserver.dart';
import 'package:sales_supervisor/utils/language/app_language_utils.dart';
import 'package:sales_supervisor/utils/theme/theme.dart';
import 'package:sales_supervisor/routes/app_routes.dart';
import 'bindings/general_bindings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Future<String> preferenceLanguageCode = AppLanguageUtils.getPreferenceLanguage();
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      navigatorObservers: [MyNavigationobserver()],
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale(AppLanguageUtils.getPreferenceLanguage()),
      // set Arabic for testing; later, make this dynamic
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale != null && supportedLocales.contains(locale)) {
          return locale;
        }
        return supportedLocales.first; // Default to first locale if none match
      },
      home: SplashScreen(),
      // home: const SignupScreen(),
    );
  }
}
