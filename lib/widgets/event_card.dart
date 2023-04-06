import 'package:fefu_fitness_site/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventCard extends GetView<void> {
  const EventCard(
      {super.key,
      required this.eventName,
      required this.couchName,
      required this.locationName,
      required this.eventBeginEndTime,
      required this.eventStatus});

  final String eventName;
  final String couchName;
  final String locationName;
  final String eventBeginEndTime;
  final String eventStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appRoundRadius),
      ),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(appRoundRadius),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(appPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: appPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        eventName,
                        style: context.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: appPadding, right: appPadding),
                      child: Text(
                        eventBeginEndTime,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.person),
                  Text(couchName),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      Text(locationName),
                    ],
                  ),
                  Text(eventStatus, style: context.textTheme.titleLarge)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
