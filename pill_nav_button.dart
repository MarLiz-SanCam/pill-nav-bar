import 'package:flutter/material.dart';

import 'pill_nav_bar.dart';
import 'pill_nav_item.dart';

class PillNavButton extends StatelessWidget {
  final PillNavItem item;
  final bool isActive;
  final PillNavBarTheme theme;
  final VoidCallback onTap;

  const PillNavButton({
    super.key,
    required this.item,
    required this.isActive,
    required this.theme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Tooltip(
        message: item.label ?? '',
        child: AnimatedScale(
          scale: isActive ? 1.12 : 1.0,
          duration: theme.animationDuration,
          curve: theme.animationCurve,
          child: AnimatedContainer(
            duration: theme.animationDuration,
            curve: theme.animationCurve,
            width: theme.itemSize,
            height: theme.itemSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? theme.activeColor : Colors.transparent,
            ),
            child: AnimatedSwitcher(
              duration: theme.animationDuration,
              child: Icon(
                item.icon,
                key: ValueKey('${item.icon.codePoint}_$isActive'),
                size: theme.iconSize,
                color: isActive
                    ? theme.activeIconColor
                    : theme.inactiveIconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
