import 'package:flutter/material.dart';
import 'pill_nav_bar.dart';
import 'pill_nav_item.dart';

// ─────────────────────────────────────────────
// Shell de ejemplo — reemplaza las pages y el
// tema con los de tu app
// ─────────────────────────────────────────────

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  // ── Configura aquí ───────────────────────────

  static const _items = [
    PillNavItem(icon: Icons.mood_outlined,      label: 'Inicio'),
    PillNavItem(icon: Icons.bar_chart_rounded,  label: 'Estadísticas'),
    PillNavItem(icon: Icons.person_outline,     label: 'Perfil'),
  ];

  static const _theme = PillNavBarTheme(
    backgroundColor:   Color(0xFF2D2B35),
    activeColor:       Color(0xFF7B6FA0),
    activeIconColor:   Colors.white,
    inactiveIconColor: Color(0xFF757575),
  );

  // ── Pantallas ────────────────────────────────

  static const _pages = [
    Center(child: Text('Inicio')),
    Center(child: Text('Estadísticas')),
    Center(child: Text('Perfil')),
  ];

  // ────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PillNavBar(
                items: _items,
                currentIndex: _index,
                theme: _theme,
                onTap: (i) => setState(() => _index = i),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
