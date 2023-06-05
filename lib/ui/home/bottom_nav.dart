import 'package:flutter/material.dart';
import 'package:tokosmile/theme/theme.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() =>
      _BottomNavState();
}

class _BottomNavState
    extends State<BottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = context.textTheme();
    var colors = context.colors();
    var optionStyle = textTheme.labelSmall!.copyWith(
      color: context.colors().outline,
    );
    var primary = colors.primary;
    var outline = colors.outline;

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.confirmation_num_outlined),
          label: 'Voucher',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: primary,
      unselectedItemColor: outline,
      selectedLabelStyle: optionStyle.copyWith(color: primary),
      unselectedLabelStyle: optionStyle,
      useLegacyColorScheme: false,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}