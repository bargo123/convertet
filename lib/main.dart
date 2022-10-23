import 'dart:async';

import 'package:converter/src/screens/main/main_screen.dart';
import 'package:converter/src/services/data/get_currencies_service.dart';
import 'package:flutter/material.dart';

import 'locator.dart';

GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await getIt.allReady();
  runZonedGuarded(() {
    runApp(const MyApp());
  }, (error, stack) {
    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(SnackBar(content: Text(error.toString())));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(navigatorKey: navKey, home: const MainScreen());
  }
}
