import 'package:fefu_fitness_site/controllers/timetable_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fefu_fitness_site/database_init.dart';
import 'package:get/get.dart';

import 'controllers/main_controller.dart';
import 'i18n/strings.g.dart';
import 'routes.dart';

Future<void> main() async {
  final mainController = await initMainController();
  final timetableController = TimetableController();
  Get.put(mainController, permanent: true);
  Get.put(timetableController, permanent: true);

  WidgetsFlutterBinding.ensureInitialized();
  // settingsData!.lang == null
  //     ? LocaleSettings.useDeviceLocale()
  //     : LocaleSettings.setLocale(AppLocale.values.singleWhere(
  //         (element) => element.languageCode == settingsData?.lang));
  LocaleSettings.useDeviceLocale();

  settingUpSystemUIOverlay();

  runApp(TranslationProvider(child: const MyApp()));
}

void settingUpSystemUIOverlay() {
// Setting SysemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent));
// Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class MyApp extends GetView<MainController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        locale:
            TranslationProvider.of(context).flutterLocale, // use provideraQ  8
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,

        theme: ThemeData(
          colorSchemeSeed: controller.colorSeed(),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorSchemeSeed: controller.colorSeed(),
          useMaterial3: true,
        ),

        themeMode: controller.isSystemTheme()
            ? ThemeMode.system
            : controller.isDarkMode()
                ? ThemeMode.dark
                : ThemeMode.light,

        routerConfig: router,
      ),
    );
  }
}
