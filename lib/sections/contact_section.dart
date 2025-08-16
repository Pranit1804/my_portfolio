import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Contact'),
        const SizedBox(height: 8),
        _bodyText('Email: pranitbhogle@gmail.com'),
        const SizedBox(height: 4),
        _bodyText('LinkedIn: linkedin.com/in/pranit-bhogale'),
        const SizedBox(height: 4),
        _bodyText('GitHub: github.com/Pranit1804'),
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

  Widget _bodyText(String t) => GestureDetector(
    onTap: () {
      launchUrl(Uri.parse("https://www.$t"));
    },
    child: Text(
      t,
      style: const TextStyle(fontSize: 14, height: 1.7, color: Colors.white70),
    ),
  );
}
