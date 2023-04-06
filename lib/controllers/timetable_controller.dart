import 'package:fefu_fitness_site/i18n/strings.g.dart';
import 'package:fefu_fitness_site/views/event_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TimetableController extends GetxController {
  // Я хз зачем это нужно но без него календарь не работает
  final focusDay = DateTime.now().obs;

  // Считаем что это выбранный день
  final selectedDay = DateTime.now().obs;

  final focusEventIndex = 0.obs;

  List<EventView> getEventsOnSelectedDay() {
    List<EventView> res = [];

    res.addAll(
      [
        EventView()
          ..eventName = "eventName1"
          ..couchName = "couchName1"
          ..eventStatus = t.eventcard.booked_event_status
          ..eventBeginEndTime = "16:00 - 18:00"
          ..locationName = "Корпус S",
        EventView()
          ..eventName = "eventName2"
          ..couchName = "couchName2"
          ..eventStatus = t.eventcard.booked_event_status
          ..eventBeginEndTime = "16:00 - 18:00"
          ..locationName = "Корпус S",
        EventView()
          ..eventName = "eventName3"
          ..couchName = "couchName3"
          ..eventStatus = t.eventcard.booked_event_status
          ..eventBeginEndTime = "16:00 - 18:00"
          ..locationName = "Корпус S",
        EventView()
          ..eventName = "eventNam4"
          ..couchName = "couchName4"
          ..eventStatus = t.eventcard.booked_event_status
          ..eventBeginEndTime = "16:00 - 18:00"
          ..locationName = "Корпус S",
        EventView()
          ..eventName = "eventName5"
          ..couchName = "couchName5"
          ..eventStatus = t.eventcard.booked_event_status
          ..eventBeginEndTime = "16:00 - 18:00"
          ..locationName = "Корпус S",
        EventView()
          ..eventName = "eventName6"
          ..couchName = "couchName6"
          ..eventStatus = t.eventcard.booked_event_status
          ..eventBeginEndTime = "16:00 - 18:00"
          ..locationName = "Корпус S",
      ],
    );

    return res;
  }

  EventView getSelectedEvent() {
    return getEventsOnSelectedDay()[focusEventIndex()];
  }
}
