import 'package:flutter/material.dart';

class PageViewModel extends ChangeNotifier {
  late PageController pageController;

  PageViewModel() {
    pageController = PageController();
  }

  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setPage(int page) {
    _currentPage = page;
    pageController.jumpToPage(page);
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
