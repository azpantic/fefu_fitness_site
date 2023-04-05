import 'package:fefu_fitness_site/constans.dart';
import 'package:isar/isar.dart';

import '../controllers/main_controller.dart';

part 'settings.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;
  String? lang;
  bool isStaticColor = false;
  int colorSeed = appColor.value;

  @enumerated
  themeMode theme = themeMode.system;
}
