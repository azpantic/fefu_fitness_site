import 'package:fefu_fitness_site/constans.dart';
import 'package:fefu_fitness_site/pages/timetable_page.dart';
import 'package:fefu_fitness_site/subpages/settings_subpage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'controllers/main_controller.dart';
import 'i18n/strings.g.dart';
import 'pages/castom_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';

final MainController _controller = Get.find();
final _rootNavigationKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigationKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigationKey,
      // ShellRoute показывает UI-оболочку вокруг соответствующего дочернего маршрута
      builder: (context, state, child) {
        // UI-оболочка - это Scaffold с NavigationBar
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= maxWidthForPhoneLayout) {
              return Obx(
                () => Scaffold(
                  body: child,
                  bottomNavigationBar: NavigationBar(
                    selectedIndex: _controller.page(),
                    // Используем tabs для создания NavigationBarDestination
                    destinations: [
                      NavigationDestination(
                        selectedIcon: const Icon(Icons.home),
                        icon: const Icon(Icons.home_outlined),
                        label: t.navbar.homepage,
                      ),
                      NavigationDestination(
                        selectedIcon: const Icon(Icons.calendar_month),
                        icon: const Icon(Icons.calendar_month_outlined),
                        label: t.navbar.timetable,
                      ),
                      NavigationDestination(
                        selectedIcon: const Icon(Icons.person_2),
                        icon: const Icon(Icons.person_2_outlined),
                        label: t.navbar.profile,
                      )
                    ],
                    // Используем context.go для перехода к нужному маршруту при нажатии на вкладку
                    onDestinationSelected: (index) {
                      _controller.page(index);
                      return context.go(
                        ['/home', '/timetable', '/profile'][index],
                      );
                    },
                  ),
                ),
              );
            }

            return Obx(
              () => Scaffold(
                body: Row(
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(appRoundRadius),
                      ),
                      child: NavigationRail(
                        groupAlignment: 0,
                        labelType: constraints.maxWidth >= minWidthForRailExtend
                            ? NavigationRailLabelType.all
                            : NavigationRailLabelType.none,
                        // extended:
                        //     constraints.maxWidth >= minWidthForRailExtend,
                        selectedIndex: _controller.page(),

                        destinations: [
                          NavigationRailDestination(
                            selectedIcon: const Icon(Icons.home),
                            icon: const Icon(Icons.home_outlined),
                            label: Text(
                              t.navbar.homepage,
                              style: context.textTheme.labelLarge,
                            ),
                          ),
                          NavigationRailDestination(
                            selectedIcon: const Icon(Icons.calendar_month),
                            icon: const Icon(Icons.calendar_month_outlined),
                            label: Text(
                              t.navbar.timetable,
                              style: context.textTheme.labelLarge,
                            ),
                          ),
                          NavigationRailDestination(
                            selectedIcon: const Icon(Icons.person_2),
                            icon: const Icon(Icons.person_2_outlined),
                            label: Text(
                              t.navbar.profile,
                              style: context.textTheme.labelLarge,
                            ),
                          )
                        ],
                        // Используем context.go для перехода к нужному маршруту при нажатии на вкладку
                        onDestinationSelected: (index) {
                          _controller.page(index);
                          return context.go(
                            ['/home', '/timetable', '/profile'][index],
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(appRoundRadius),
                        ),
                        child: child,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      // Вложенные маршруты для каждой вкладки
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: HomePage(),
          ),
          routes: [],
        ),
        GoRoute(
          path: '/timetable',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: TimetablePage(),
          ),
          routes: [],
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: ProfilePage(),
          ),
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigationKey,
              path: 'settings',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: SettingsSubpage(),
              ),
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],
);
