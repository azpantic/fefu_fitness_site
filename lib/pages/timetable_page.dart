import 'package:fefu_fitness_site/controllers/timetable_controller.dart';
import 'package:fefu_fitness_site/widgets/event_card.dart';
import 'package:fefu_fitness_site/widgets/timetable_widgets/events_list_scroller.dart';
import 'package:fefu_fitness_site/widgets/timetable_widgets/selected_event_viewer.dart';
import 'package:flutter/material.dart';
import 'package:fefu_fitness_site/i18n/strings.g.dart';
import 'package:get/get.dart';
import 'package:fefu_fitness_site/constans.dart';
import 'package:table_calendar/table_calendar.dart';

class TimetablePage extends GetView<void> {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return (constraints.maxWidth <= maxWidthForPhoneLayout
          ? TimetablePagePhoneLayout()
          : TimetablePageDesktopLayout());
    });
  }
}

class TimetablePagePhoneLayout extends GetView<TimetableController> {
  const TimetablePagePhoneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    controller.focusEventIndex(-1);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.navbar.timetable),
      ),
      body: Column(
        children: [
          Obx(
            () => TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: controller.focusDay(),
              selectedDayPredicate: (day) =>
                  isSameDay(controller.selectedDay(), day),
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarFormat: CalendarFormat.week,
              availableCalendarFormats: const {
                CalendarFormat.week: "Месяц",
                CalendarFormat.month: "Неделя",
              },
              onDaySelected: (selectedDay, focusedDay) {
                controller.selectedDay(selectedDay);
                controller.focusDay(focusedDay);
              },
              onPageChanged: (focusedDay) {
                controller.focusDay(focusedDay);
                controller.selectedDay(focusedDay);
              },
            ),
          ),
          Expanded(
            child: EventsListScroller(
              tap: (index) {},
            ),
          )
        ],
      ),
    );
  }
}

class TimetablePageDesktopLayout extends GetView<TimetableController> {
  const TimetablePageDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.navbar.timetable),
      ),
      body: Column(
        children: [
          Obx(
            () => TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: controller.focusDay(),
              selectedDayPredicate: (day) =>
                  isSameDay(controller.selectedDay(), day),
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarFormat: CalendarFormat.week,
              availableCalendarFormats: const {
                CalendarFormat.week: "Месяц",
                CalendarFormat.month: "Неделя",
              },
              onDaySelected: (selectedDay, focusedDay) {
                controller.selectedDay(selectedDay);
                controller.focusDay(focusedDay);
              },
              onPageChanged: (focusedDay) {
                controller.focusDay(focusedDay);
                controller.selectedDay(focusedDay);
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  t.timetable.events_on_selected_day,
                  style: context.textTheme.headlineMedium,
                )),
              ),
              Expanded(
                flex: 2,
                child: Text(""),
              ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: EventsListScroller(
                    tap: (index) {
                      controller.focusEventIndex(index);
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    // color: Colors.yellow,
                    child: SelectedEventViewer(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
