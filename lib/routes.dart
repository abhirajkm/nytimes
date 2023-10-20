import 'package:flutter/cupertino.dart';
import 'package:nytimes/Screens/detail-screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> get(BuildContext context) {
    return {
      DetailScreen.routeName: (context) => const DetailScreen(),
    };
  }
}