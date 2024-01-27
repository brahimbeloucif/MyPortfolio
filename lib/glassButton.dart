import 'package:flutter/material.dart';
import 'dart:ui';

class GlassButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  GlassButton({required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color backgroundColor = isDarkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.2);
    Color borderColor = isDarkMode ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.3);

    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: borderColor),
          ),
          child: InkWell(
            onTap: onPressed,
            child: child,
          ),
        ),
      ),
    );
  }
}
