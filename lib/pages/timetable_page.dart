import 'package:flutter/material.dart';
import 'package:fefu_fitness_site/i18n/strings.g.dart';
import 'package:get/get.dart';

class TimetablePage extends GetView<void> {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(t.navbar.timetable),
        ),
        body: const Placeholder());
  }
}
