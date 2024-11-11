import 'package:flutter/material.dart';
import 'package:page_view_example/screens/profile_page_screen.dart';
import 'package:page_view_example/screens/settings_page_screen.dart';
import 'package:provider/provider.dart';

import '../di/setup_locator.dart';
import '../view_models/page_view_model.dart';
import 'home_page_screen.dart';

class MainScreen extends StatelessWidget {
  final PageViewModel viewModel = getIt<PageViewModel>();

  final List<Widget> _pages = [
    HomePage(),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: AppBar(title: Text('PageView with MVVM Example')),
        body: Consumer<PageViewModel>(
          builder: (context, model, child) {
            return PageView(
              controller: model.pageController,
              children: _pages,
              onPageChanged: (index) {
                model.setPage(index);
              },
            );
          },
        ),
        bottomNavigationBar: Consumer<PageViewModel>(
          builder: (context, model, child) {
            return BottomNavigationBar(
              currentIndex: model.currentPage,
              onTap: (index) {
                model.setPage(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ],
            );
          },
        ),
      ),
    );
  }
}
