import 'package:fefu_fitness_site/constans.dart';
import 'package:fefu_fitness_site/i18n/strings.g.dart';
import 'package:fefu_fitness_site/widgets/home_page/event_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<void> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= maxWidthForPhoneLayout) {
          return const HomePagePhoneLayout();
        }

        return const HomePageDesktopLayout();
      },
    );
  }
}

class HomePageDesktopLayout extends StatelessWidget {
  const HomePageDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.navbar.homepage),
      ),
      body: Center(
        child: Container(
          height: context.mediaQueryShortestSide / 2,
          color: context.theme.colorScheme.primary,
          child: const AspectRatio(
            aspectRatio: 1,
            child: Text("Desktop"),
          ),
        ),
      ),
    );
  }
}

class HomePagePhoneLayout extends StatelessWidget {
  const HomePagePhoneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.navbar.homepage),
      ),
      body: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    child: Center(child: Text("QR")),
                  ),
                ),
              ),
              Text(
                t.homepage.nearest_booking,
                style: Get.textTheme.headlineLarge,
              ),
              EventCard("1", "2", "3", "4", "5", "6"),
            ],
          ),
        ),
      ),
    );
  }
}
