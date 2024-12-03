import 'package:flutter/material.dart';


class MyNavigationobserver extends NavigatorObserver{
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);

    // Check if we are returning to A-screen
    if (previousRoute?.settings.name == "/EmployeesView") {
      // Find the controller for A-screen and refresh data
    }
  }
}