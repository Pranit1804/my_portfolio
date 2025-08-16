import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/timeline_tile.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <ExpItem>[
      ExpItem(
        'Mar 2022 — Present',
        'Senior Mobile App Developer',
        'Fitpage',
        [
          'Managed a team of 4, overseeing sprints, deliverables, and release cycles across multiple mobile applications',
          'Led the end-to-end development and launch of the India Running app, enabling marathon registrations across the country',
          'Key contributor in scaling the Fitpage app from under 10,000 to over 100,000 users by rebuilding it from the ground up, reducing crash rate by over 40%, and fixing memory overload issues to improve performance and retention',
        ],
        [
          'Dart',
          'Flutter',
          'go_router',
          'Bloc',
          'ObjectBox',
          'Fastlane',
          'flutter_background_geoloction',
          'Code magic',
        ],
      ),
      ExpItem(
        'Sep 2020 — Mar 2022',
        'Flutter App Developer',
        'Tradexa',
        [
          'Led the development of three cross-platform apps, independently building, publishing, and maintaining them on both Play Store and App Store, with a strong focus on integrating diverse features to enhance online retail and wholesale experiences',
          'Built a white-labeled solution to replace separate client apps, speeding up time-to-market and boosting growth',
        ],
        ['Dart', 'Flutter', 'Provider', 'Fastlane'],
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Experience'),
        const SizedBox(height: 12),
        Column(
          children: List.generate(items.length, (i) {
            return TimelineTile(item: items[i], drawLine: true);
          }),
        ),
      ],
    );
  }

  Widget _sectionTitle(String t) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Text(
      t,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    ),
  );
}
