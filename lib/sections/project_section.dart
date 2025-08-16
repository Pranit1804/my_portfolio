import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/project_card.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final projects = [
      {
        'title': 'Wake Arrival | Flutter',
        'desc':
            '''Built a travel companion app that alerts users before reaching their.''',
        'url': 'https://github.com/Pranit1804/wake_arrival',
      },
      {
        'title': 'Apple Workout Scheduler Package | Swift',
        'desc':
            '''Developed and published a plugin that enables workout scheduling and push notifications for Apple Watch.''',
        'url': 'https://pub.dev/packages/apple_workout_scheduler',
      },
      {
        'title': 'Apple Watch App | Swift',
        'desc':
            '''Developed an Apple Watch app integrated with the mobile app, allowing users to track, schedule, and manage workouts directly from the watch — improving usability and extending functionality.''',
        'url': '',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Projects'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children:
              projects
                  .map(
                    (p) => ProjectCard(
                      title: p['title']!,
                      desc: p['desc']!,
                      width: isMobile ? double.infinity : 340,
                      url: p['url'] as String,
                    ),
                  )
                  .toList(),
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
