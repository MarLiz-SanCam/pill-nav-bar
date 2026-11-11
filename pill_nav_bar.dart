import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pill_nav_button.dart';
import 'pill_nav_item.dart';

// ─────────────────────────────────────────────
// Tema
// ─────────────────────────────────────────────

class PillNavBarTheme {
  final Color backgroundColor;
  final Color activeColor;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final double height;
  final double itemSize;
  final double iconSize;
  final double horizontalPadding;
  final double itemSpacing;
  final Duration animationDuration;
  final Curve animationCurve;
  final List<BoxShadow>? shadow;

  const PillNavBarTheme({
    this.backgroundColor   = const Color(0xFF2D2B35),
    this.activeColor       = const Color(0xFF7B6FA0),
    this.activeIconColor   = const Color(0xFFFFFFFF),
    this.inactiveIconColor = const Color(0xFF757575),
    this.height            = 64,
    this.itemSize          = 44,
    this.iconSize          = 22,
    this.horizontalPadding = 14,
    this.itemSpacing       = 6,
    this.animationDuration = const Duration(milliseconds: 250),
    this.animationCurve    = Curves.easeOutCubic,
    this.shadow,
  });

  static const dark = PillNavBarTheme();

  static const light = PillNavBarTheme(
    backgroundColor:   Color(0xFFF0F0F0),
    activeColor:       Color(0xFF6C63FF),
    activeIconColor:   Color(0xFFFFFFFF),
    inactiveIconColor: Color(0xFFAAAAAA),
    shadow: [
      BoxShadow(
        color: Color(0x33000000),
        blurRadius: 16,
        offset: Offset(0, 6),
      ),
    ],
  );
}

// ─────────────────────────────────────────────
// Widget principal
// ─────────────────────────────────────────────

class PillNavBar extends StatelessWidget {
  final List<PillNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final PillNavBarTheme theme;

  const PillNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.theme = const PillNavBarTheme(),
  }) : assert(
          items.length >= 1 && items.length <= 6,
          'PillNavBar: mínimo 1 ítem, máximo 6.',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: theme.height,
      padding: EdgeInsets.symmetric(horizontal: theme.horizontalPadding),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.circular(theme.height),
        boxShadow: theme.shadow ??
            [
              BoxShadow(
                color: Colors.black.withOpacity(0.28),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(items.length, (i) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.itemSpacing / 2),
            child: PillNavButton(
              item: items[i],
              isActive: i == currentIndex,
              theme: theme,
              onTap: () {
                HapticFeedback.lightImpact();
                onTap(i);
              },
            ),
          );
        }),
      ),
    );
  }
}
