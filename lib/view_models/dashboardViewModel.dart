import 'package:flutter/material.dart';

import '../view/dashboard/main_dashboard.dart';

class DashboardProvider extends ChangeNotifier {
  Widget _currentScreen = const MainDashboard();

  String _appBarTitle = "Dashboard";

  Widget get currentScreen => _currentScreen;
  String get appBarTitle => _appBarTitle;

  void changeScreen(Widget screen, String title) {
    _currentScreen = screen;
    _appBarTitle = title;
    notifyListeners();
  }
}
