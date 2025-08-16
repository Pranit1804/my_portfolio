import 'package:flutter/material.dart';

class ExpItem {
  final String period;
  final String role;
  final String company;
  final List<String> bullets;
  final List<String> skills;
  ExpItem(this.period, this.role, this.company, this.bullets, this.skills);
}

class TimelineTile extends StatelessWidget {
  final ExpItem item;
  final bool drawLine;
  const TimelineTile({super.key, required this.item, required this.drawLine});

  @override
  Widget build(BuildContext context) {
    const dotSize = 10.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rail
          SizedBox(
            width: 28,
            child: Column(
              children: [
                Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                if (drawLine)
                  Container(
                    width: 2,
                    height: 64,
                    color: const Color(0xFF222222),
                  ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: .75,
                  child: Text(
                    item.period,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.role,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Opacity(
                  opacity: .75,
                  child: Text(
                    item.company,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(height: 8),
                Text('Skills: ${item.skills.join(', ')}'),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      item.bullets
                          .map(
                            (b) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: _bodyText('• $b'),
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyText(String t) => Text(
    t,
    style: const TextStyle(fontSize: 14, height: 1.7, color: Colors.white70),
  );
}
