import 'package:fefu_fitness_site/constans.dart';
import 'package:fefu_fitness_site/controllers/timetable_controller.dart';
import 'package:fefu_fitness_site/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EventsListScroller extends GetView<TimetableController> {
  const EventsListScroller({super.key, required this.tap});

  final void Function(int) tap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(appPadding),
      // color: Colors.amber,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(appRoundRadius),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              controller.getEventsOnSelectedDay().length,
              (index) {
                var event = controller.getEventsOnSelectedDay()[index];
                return Obx(
                  () => EventCard(
                    eventName: event.eventName,
                    couchName: event.couchName,
                    locationName: event.locationName,
                    eventBeginEndTime: event.eventBeginEndTime,
                    eventStatus: event.eventStatus,
                    tap: () {
                      tap(index);
                      // controller.focusEventIndex(index);
                    },
                    bgColor: (controller.focusEventIndex() == index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.background),
                    textColor: (controller.focusEventIndex() == index
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onBackground),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
