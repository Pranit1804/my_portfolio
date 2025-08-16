import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final String text;
  const Separator({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .6,
      child: Text(
        text.isEmpty ? '© ${DateTime.now().year} Pranit' : text,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
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
