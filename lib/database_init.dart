import 'package:flutter/material.dart';
import 'package:fefu_fitness_site/constans.dart';
import 'package:fefu_fitness_site/controllers/main_controller.dart';
import 'package:fefu_fitness_site/models/settings.dart';
import 'package:isar/isar.dart';
import 'package:flutter/foundation.dart';

Future<MainController> initMainController() async {
  MainController controller = MainController();

  if (kIsWeb) {
    controller.isDarkMode(false);
    controller.isSystemTheme(false);

    controller.colorSeed(appColor);
  } else {
    final db = await Isar.open([SettingsSchema]);

    await db.writeTxn(() => db.settings.put(Settings()));

    final settings = (await db.settings.get(1));

    controller.isDarkMode(settings?.theme == ThemeMode.dark);
    controller.isSystemTheme(settings?.theme == ThemeMode.system);

    controller.colorSeed(Color(settings?.colorSeed ?? appColor.value));
  }
  return controller;
}
