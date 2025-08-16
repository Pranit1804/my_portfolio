import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onExperience;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const NavBar({
    super.key,
    required this.onExperience,
    required this.onProjects,
    required this.onContact,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return AppBar(
      backgroundColor: const Color(0xFF0A0A0A),
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      title: _MaxWidth(
        child: Row(
          children: [
            const Text(
              'pranit.dev',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const Spacer(),
            if (!isMobile)
              Row(
                children: [
                  _NavLink('Experience', onExperience),
                  _NavLink('Projects', onProjects),
                  _NavLink('Contact', onContact),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _MaxWidth extends StatelessWidget {
  final Widget child;

  const _MaxWidth({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}
