import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String desc;
  final double width;
  final String url;
  const ProjectCard({
    super.key,
    required this.title,
    required this.desc,
    required this.width,
    required this.url,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.url.isNotEmpty) {
          launchUrl(Uri.parse(widget.url));
        }
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => hover = true),
        onExit: (_) => setState(() => hover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          width: widget.width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0E0E0E),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: hover ? Colors.white : const Color(0xFF222222),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              _bodyText(widget.desc),
              const SizedBox(height: 12),
              if (widget.url.isNotEmpty)
                Opacity(
                  opacity: .7,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.north_east, size: 14, color: Colors.white70),
                      SizedBox(width: 6),
                      Text(
                        'View',
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bodyText(String t) => Text(
    t,
    style: const TextStyle(fontSize: 14, height: 1.7, color: Colors.white70),
  );
}
