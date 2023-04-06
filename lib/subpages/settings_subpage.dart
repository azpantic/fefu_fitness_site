import 'package:flutter/material.dart';
import 'package:fefu_fitness_site/constans.dart';
import 'package:fefu_fitness_site/controllers/main_controller.dart';
import 'package:fefu_fitness_site/i18n/strings.g.dart';
import 'package:fefu_fitness_site/widgets/settings_subpage_widgets/seed_color_toogle.dart';
import 'package:fefu_fitness_site/widgets/settings_subpage_widgets/theme_toogle.dart';
import 'package:get/get.dart';

class SettingsSubpage extends GetView<MainController> {
  const SettingsSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(t.settings.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: Text(
                t.settings.general_settings,
              ),
              trailing: const Icon(Icons.settings),
              children: [
                Text(t.settings.language),
              ],
            ),
            ExpansionTile(
              title: Text(t.settings.visual_settings),
              trailing: const Icon(Icons.color_lens),
              children: [
                Text(
                  t.settings.theme_mode,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Padding(
                  padding: EdgeInsets.all(appPadding),
                  child: ThemeToggle(),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  t.settings.seed_color,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Padding(
                  padding: EdgeInsets.all(appPadding),
                  child: SeedColorToogle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
