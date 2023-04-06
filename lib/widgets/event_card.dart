import 'dart:js';

import 'package:fefu_fitness_site/constans.dart';
import 'package:fefu_fitness_site/views/event_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventCard extends GetView<void> {
  const EventCard(
      {super.key,
      required this.eventName,
      required this.couchName,
      required this.locationName,
      required this.eventBeginEndTime,
      required this.eventStatus,
      required this.tap,
      required this.bgColor,
      required this.textColor});

  final String eventName;
  final String couchName;
  final String locationName;
  final String eventBeginEndTime;
  final String eventStatus;
  final VoidCallback tap;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appRoundRadius),
      ),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(appRoundRadius),
        onTap: tap,
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
                        style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold, color: textColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: appPadding, right: appPadding),
                      child: Text(
                        eventBeginEndTime,
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: textColor),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.person),
                  Text(
                    couchName,
                    style: context.textTheme.titleLarge
                        ?.copyWith(color: textColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      Text(
                        locationName,
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: textColor),
                      ),
                    ],
                  ),
                  Text(eventStatus,
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: textColor))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
