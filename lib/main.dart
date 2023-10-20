import 'package:flutter/material.dart';
import 'package:nytimes/Screens/home.dart';
import 'package:nytimes/providers/index.dart';
import 'package:nytimes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderTree.get(context),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomeScreen(),
        routes: AppRoutes.get(context),
      ),
    );
  }
}


