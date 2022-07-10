import 'dart:ui';

import 'package:ev_charging_station_flutter/features/presentation/pages/main_tab.dart';
import 'package:flutter/material.dart';

void main() {
  DartPluginRegistrant.ensureInitialized();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainBottomTabPage(),
    );
  }
}
