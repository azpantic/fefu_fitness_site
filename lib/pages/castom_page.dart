import 'package:flutter/material.dart';
import 'package:fefu_fitness_site/i18n/strings.g.dart';
import 'package:get/get.dart';

class CastomPage extends GetView<void> {
  const CastomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(t.navbar.castompage),
        ),
        body: const Placeholder());
  }
}
