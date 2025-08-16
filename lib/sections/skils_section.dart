import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = ['Flutter', 'Dart', 'Firebase', 'REST APIs'];

    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Skills',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            children:
                skills.map((skill) {
                  return Chip(
                    label: Text(
                      skill,
                      style: const TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.white,
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
