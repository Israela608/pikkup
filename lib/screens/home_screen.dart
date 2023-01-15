import 'package:flutter/material.dart';
import 'package:pikkup/screens/pages/history_page.dart';
import 'package:pikkup/screens/pages/home_page.dart';
import 'package:pikkup/screens/pages/settings_page.dart';
import 'package:pikkup/screens/pages/wallet_page.dart';
import 'package:pikkup/utils/app_colors.dart' as app_colors;
import 'package:pikkup/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //int _currentIndex = 0;

  final screens = const [
    HomePage(),
    HistoryPage(),
    WalletPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);

    return SafeArea(
      child: Scaffold(
        body: IndexedStack(//This will keep the state of the individual screens while switched
          index: model.currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: app_colors.background,
          selectedItemColor: app_colors.primaryBlue,
          unselectedItemColor: app_colors.textAsh,
          currentIndex: model.currentIndex,
          onTap: (index) => model.setCurrentIndex(currentIndex: index),
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/home.png')),
              activeIcon: ImageIcon(AssetImage('images/home_active.png')),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/history.png')),
              activeIcon: ImageIcon(AssetImage('images/history_active.png')),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/wallet.png')),
              activeIcon: ImageIcon(AssetImage('images/wallet_active.png')),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/settings.png')),
              activeIcon: ImageIcon(AssetImage('images/settings_active.png')),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
