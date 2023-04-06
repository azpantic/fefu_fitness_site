import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventCard extends GetView<void> {
  const EventCard(
      this.text1, this.text2, this.text3, this.text4, this.text5, this.text6,
      {super.key});

  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {},
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: context.textTheme.headlineSmall,
                      ),
                      Text(text2)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        text3,
                        style: context.textTheme.headlineSmall,
                      ),
                      Text(text4)
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.person),
                  Text(text5),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 8),
                      Text(
                        text6,
                        style: context.textTheme.titleLarge,
                      ),
                    ],
                  ),
                  Text('Оплачено', style: context.textTheme.titleLarge)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
