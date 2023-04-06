import 'package:fefu_fitness_site/constans.dart';
import 'package:fefu_fitness_site/controllers/timetable_controller.dart';
import 'package:fefu_fitness_site/views/event_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class SelectedEventViewer extends GetView<TimetableController> {
  SelectedEventViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        late EventView event = controller.getSelectedEvent();

        late String eventName = event.eventName;
        late String couchName = event.couchName;
        late String locationName = event.locationName;
        late String eventBeginEndTime = event.eventBeginEndTime;
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appRoundRadius),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(appPadding * 2),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: appPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          eventName,
                          style: context.textTheme.headlineLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: appPadding, right: appPadding),
                        child: Text(
                          eventBeginEndTime,
                          style: context.textTheme.headlineMedium,
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      size: 50,
                      Icons.person,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          couchName,
                          style: context.textTheme.headlineMedium,
                        ),
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 5,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          onRatingUpdate: (double value) {},
                          itemBuilder: (BuildContext context, int index) =>
                              Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    const Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.phone),
                            Text("8 (999) 618 10 12"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.email),
                            Text("96kerdun.iuol@dvfu.ru"),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const Divider(
                  height: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        Text(
                          locationName,
                          style: context.textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    Text(
                      "Степ аэробика – это специализированный тренинг, который идеально подходит для похудения, проработки мышц ног и ягодиц. Занятие на степ платформе состоит из набора базовых шагов. Они объединены в комбинации и выполняются в разных вариациях, которые отличаются по типу сложности. За счет изменения высоты шага уменьшается или увеличивается нагрузка.",
                      style: context.textTheme.displaySmall,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
