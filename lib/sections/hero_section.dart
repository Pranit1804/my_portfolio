import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/primary_button.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  const HeroSection({super.key, required this.onViewProjects});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final screenHeight = MediaQuery.of(context).size.height - 400;
    return SizedBox(
      width: double.infinity,
      height: screenHeight, // ensure full width inside Section
      child: Align(
        alignment: Alignment.centerLeft, // force left alignment
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            Text(
              "Hi, I'm Pranit",
              style: TextStyle(
                fontSize: isMobile ? 34 : 54,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            const Opacity(
              opacity: .9,
              child: Text(
                'Building apps faster than you can say hot reload.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 18),
            _bodyText(
              '“From idea to app store, I build scalable mobile and web apps with Flutter.”',
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                PrimaryButton(label: 'View Projects', onTap: onViewProjects),
                // GhostButton(label: 'Download CV', onTap: () {}),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _bodyText(String t) => Text(
    t,
    style: const TextStyle(fontSize: 14, height: 1.7, color: Colors.white70),
  );
}
