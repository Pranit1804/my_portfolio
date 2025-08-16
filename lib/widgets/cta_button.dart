import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CTAButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  const CTAButton({super.key, required this.label, required this.onPressed});

  @override
  State<CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<CTAButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: hover ? 1.03 : 1.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: hover ? 10 : 0,
            shadowColor: AppColors.accent.withOpacity(.5),
          ),
          onPressed: widget.onPressed,
          child: Text(widget.label, style: AppTextStyles.button(14)),
        ),
      ),
    );
  }
}
