import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('About'),
        const SizedBox(height: 8),
        Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF0E0E0E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF222222)),
              ),
              child: const Icon(Icons.person, color: Colors.white38, size: 48),
            ),
            SizedBox(width: isMobile ? 0 : 24, height: isMobile ? 16 : 0),
            Expanded(
              child: _bodyText(
                'Senior Flutter dev with 4+ years building scalable apps. I focus on architecture, '
                'state management, performance and clean UI. I enjoy solving product problems with simple, readable code.',
              ),
            ),
          ],
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

  Widget _bodyText(String t) => Text(
    t,
    style: const TextStyle(fontSize: 14, height: 1.7, color: Colors.white70),
  );
}
