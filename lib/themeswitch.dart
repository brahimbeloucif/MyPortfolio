import 'package:flutter/material.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThemeSwitch extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggle;

  ThemeSwitch({required this.isDarkMode, required this.onToggle});

  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    if (widget.isDarkMode) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(ThemeSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isDarkMode != oldWidget.isDarkMode) {
      if (widget.isDarkMode) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedIconButton(
      onPressed: () => widget.onToggle(!widget.isDarkMode),
      icons: [
        AnimatedIconItem(
          icon: Icon(FontAwesomeIcons.sun, color: Colors.black),
        ),
        AnimatedIconItem(
          icon: Icon(Icons.nightlight_round, color: Colors.indigo),
        ),
      ],
      animationController: _animationController,
    );
  }

  





}
