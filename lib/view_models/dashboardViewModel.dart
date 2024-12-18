import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  Widget _currentScreen = const Center(
    child: Text(
      'Welcome to Admin Dashboard!',
      style: TextStyle(fontSize: 18),
    ),
  );

  String _appBarTitle = "Dashboard";

  Widget get currentScreen => _currentScreen;
  String get appBarTitle => _appBarTitle;

  void changeScreen(Widget screen, String title) {
    _currentScreen = screen;
    _appBarTitle = title;
    notifyListeners();
  }
}
