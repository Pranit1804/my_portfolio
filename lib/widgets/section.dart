import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget child;
  final double paddingV;
  const Section({super.key, required this.child, this.paddingV = 72});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingV),
      child: _MaxWidth(child: child),
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
        constraints: const BoxConstraints(maxWidth: 1120),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: child,
        ),
      ),
    );
  }
}
